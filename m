Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFE87116145
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2019 10:39:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbfLHJjx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Dec 2019 04:39:53 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:41484 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbfLHJjx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Dec 2019 04:39:53 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 932DF20026;
        Sun,  8 Dec 2019 10:39:49 +0100 (CET)
Date:   Sun, 8 Dec 2019 10:39:48 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: document panel-id
Message-ID: <20191208093948.GB21141@ravnborg.org>
References: <20191207203553.286017-1-robdclark@gmail.com>
 <20191207203553.286017-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191207203553.286017-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=cm27Pg_UAAAA:8 a=e5mUnYsNAAAA:8 a=ILDvgjsUearIMHsXgicA:9
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=xmb-EsYY8bH0VWELuYED:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob.

The panel-id can be used to help in several usecase.
With a few nits pointed out below fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

On Sat, Dec 07, 2019 at 12:35:50PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For devices that have one of several possible panels installed, the
> panel-id property gives firmware a generic way to locate and enable the
> panel node corresponding to the installed panel.  Example of how to use
> this property:
> 
>     ivo_panel {
>         compatible = "ivo,m133nwf4-r0";
>         panel-id = <0xc5>;
>         status = "disabled";
> 
>         ports {
>             port {
>                 ivo_panel_in_edp: endpoint {
>                     remote-endpoint = <&sn65dsi86_out_ivo>;
>                 };
>             };
>         };
>     };
> 
>     boe_panel {
>         compatible = "boe,nv133fhm-n61";
>         panel-id = <0xc4>;
>         status = "disabled";
> 
>         ports {
>             port {
>                 boe_panel_in_edp: endpoint {
>                     remote-endpoint = <&sn65dsi86_out_boe>;
>                 };
>             };
>         };
>     };
> 
>     sn65dsi86: bridge@2c {
>         compatible = "ti,sn65dsi86";
> 
>         ports {
>             #address-cells = <1>;
>             #size-cells = <0>;
> 
>             port@0 {
>                 reg = <0>;
>                 sn65dsi86_in_a: endpoint {
>                     remote-endpoint = <&dsi0_out>;
>                 };
>             };
> 
>             port@1 {
>                 reg = <1>;
> 
>                 sn65dsi86_out_boe: endpoint@c4 {
>                     remote-endpoint = <&boe_panel_in_edp>;
>                 };
> 
>                 sn65dsi86_out_ivo: endpoint@c5 {
>                     remote-endpoint = <&ivo_panel_in_edp>;
>                 };
>             };
>         };
>     };
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  .../bindings/display/panel/panel-common.yaml  | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index ef8d8cdfcede..6113319b91dd 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -75,6 +75,32 @@ properties:
>        in the device graph bindings defined in
>        Documentation/devicetree/bindings/graph.txt.
>  
> +  panel-id:
> +    description:
> +      To support the case where one of several different panels can be installed
> +      on a device, the panel-id property can be used by the firmware to identify
> +      which panel should have it's status changed to "ok".  This property is not
Use "okay" as this is waht is specified in the CT files.

> +      used by the HLOS itself.
Spell out HLOS - it is not obvious for all what it is.

> +
> +      For a device with multiple potential panels, a node for each potential
> +      should be defined with status = "disabled", and an appropriate panel-id
"potential panel should"

> +      property.  The video data producer should be setup with endpoints going to
> +      each possible panel.  The firmware will find the dt node with a panel-id
> +      matching the actual panel installed, and change it's status to "ok".
> +
> +      The exact method the firmware uses to determine the panel-id of the installed
> +      panel is outside the scope of this binding, but a few examples are
> +
> +      1) u-boot module reading a value from a u-boot env var
> +      2) EFI driver module reading a value from an EFI variable
> +      3) device specific firmware reading some device specific GPIOs or
> +         e-fuse
> +
> +      The panel-id values are an opaque integer.  They can be sparse.  The only
> +      important thing is that each possible panel in the system has a unique
> +      panel-id, and that the values configured in the device's DTB match the
> +      values that the firmware is looking for.
> +
>    ddc-i2c-bus:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
