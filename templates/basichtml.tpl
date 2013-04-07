{%- extends 'display_priority.tpl' -%}



{% block codecell %}
<div class="cell border-box-sizing code_cell vbox">
{{ super() }}</div>
{%- endblock codecell %}

{% block input_group -%}
<div class="input hbox">
{{super()}}
</div>
{% endblock input_group %}

{% block outputs -%}
<div class="output vbox">
{{ super() }}
</div>
{% endblock outputs %}

{% block output_group -%}
<div class="vbox output_wrapper">
<div class="hbox output_area">
{{ super() }}
</div>
</div>
{% endblock output_group %}


{% block in_prompt -%}
<div class="prompt input_prompt">In&nbsp;[{{cell.prompt_number}}]:</div>
{%- endblock in_prompt %}

{% block output_prompt -%}
<div class="prompt output_prompt">
{%- if cell.haspyout -%}
Out[{{cell.prompt_number}}]:
{%- endif -%}
</div>
{% endblock output_prompt %}

{% block input %}
<div class="input_area box-flex1">
{{cell.input | highlight }}
</div>
{%- endblock input %}


{% block markdowncell scoped %}
<div class="text_cell_render border-box-sizing rendered_html">
{{ cell.source | markdown| rm_fake}}
</div>
{%- endblock markdowncell %}

{% block headingcell scoped %}
<div class="text_cell_render border-box-sizing rendered_html">
<h{{cell.level}}>
{% set source = cell.source | replace(' ','_') %}
<a class="heading-anchor" id="{{source}}" href="#{{source}}">
  {{cell.source}}
</a>
</h{{cell.level}}>
</div>
{% endblock headingcell %}

{% block rawcell scoped %}
{{ cell.source }}
{% endblock rawcell %}

{% block unknowncell scoped %}
unknown type  {{cell.type}}
{% endblock unknowncell %}


{% block pyout -%}
<div class="box-flex1 output_subarea output_pyout">
{% block data_priority scoped %}{{ super()}}{% endblock %}
</div>
{%- endblock pyout %}

{% block stream_stdout -%}
<div class="box-flex1 output_subarea output_stream output_stdout">
<pre>{{output.text |ansi2html}}</pre>
</div>
{%- endblock stream_stdout %}

{% block stream_stderr -%}
<div class="box-flex1 output_subarea output_stream output_stderr">
<pre>{{output.text |ansi2html}}</pre>
</div>
{%- endblock stream_stderr %}

{% block data_svg -%}
{{output.svg}}
{%- endblock data_svg %}


{% block data_html -%}
<div class="output_html rendered_html">
{{output.html}}
</div>
{%- endblock data_html %}

{% block data_png %}
<img src="data:image/png;base64,{{output.png}}"></img>
{%- endblock data_png %}


{% block data_jpg %}
<img src="data:image/jpeg;base64,{{output.jpeg}}"></img>
{%- endblock data_jpg %}


{% block data_latex %}
{{output.latex}}
{%- endblock data_latex %}

{% block pyerr -%}
<div class="box-flex1 output_subarea output_pyerr">
<pre>{{super()}}</pre>
</div>
{%- endblock pyerr %}

{%- block traceback_line %}
{{line| ansi2html}}
{%- endblock traceback_line %}


{%- block data_text %}
<pre>{{output.text | ansi2html}}</pre>
{%- endblock -%}


{%- block display_data scoped -%}
<div class="box-flex1 output_subarea output_display_data">
{{super()}}
</div>
{%- endblock display_data -%}
