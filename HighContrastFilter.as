package com.zomgamez.filter
{
    import flash.display.Shader;
    import flash.filters.ShaderFilter;
    import flash.utils.ByteArray;
    
    public class HighContrastFilter extends ShaderFilter
    {
        [Embed("/../pixelbender/highContrast.pbj", mimeType="application/octet-stream")] 
        private var Filter:Class;
        
        private var _shader:Shader;
        
        public function HighContrastFilter(threshhold:Number = 128, invert:Boolean = false)
        {
            _shader = new Shader(new Filter() as ByteArray);
            
            this.threshhold = threshhold; 
            this.invert = invert;
            super(_shader);
        }
        
        public function get invert():Boolean {
            return (_shader.data.invert.value[0]) > 0 ? true : false;    
        }
        public function set invert(invert:Boolean):void {
            var i:int = invert ? 1 : 0;
            _shader.data.invert.value = [i];
        }
        
        public function get threshhold():Number {
            return _shader.data.threshhold.value[0];
        }
    
        public function set threshhold(threshhold:Number):void {
            _shader.data.threshhold.value = [threshhold];
        }
    }
}