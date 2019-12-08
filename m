Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7150911626F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2019 15:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbfLHOpq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Dec 2019 09:45:46 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43138 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbfLHOpq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Dec 2019 09:45:46 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7763052B;
        Sun,  8 Dec 2019 15:45:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575816341;
        bh=QD0nTIwYIQ9eKjfuPVhANN19JX+df8dsKi9/tNgpjS4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S88xWFm+BS6wZu2nytTO2r9us6YdrHtGx7/CiK3Ya4cqhiFMf9vmBGbqxnRUZ1lFd
         1Qq68Dndwj0RKUTAbIJuUHHSClZ552S3xJ0du/0Plr6+N28nELT+TnBp51/XNkCVGH
         YvqgPVqvmMAL4VN8UG8QQXgADkPA+DPoiA3pHLCI=
Date:   Sun, 8 Dec 2019 16:45:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        aarch64-laptops@lists.linaro.org,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: document panel-id
Message-ID: <20191208144533.GA14311@pendragon.ideasonboard.com>
References: <20191207203553.286017-1-robdclark@gmail.com>
 <20191207203553.286017-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191207203553.286017-2-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

Thank you for the patch.

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
> +      used by the HLOS itself.

If your firmware can modify the status property of a panel, it can also
add DT nodes. As discussed before, I don't think this belongs to DT.
Even if panel-id isn't used by the operating system, you have Linux
kernel patches in this series that show that this isn't transparent.

This needs to be handled in the firmware (or, if not possible, in a
kernel board driver). The above DT fragment, visible to the kernel,
doesn't describe the actual hardware. Furthermore, you would require all
bridge drivers to be patched to support this method, which shows again
that the issue isn't handled in the right place.

Finally, unless I'm mistaken, this series is meant to support display
for an ACPI-based ARM machine. Using DT as a stop-gap measure because
ACPI support isn't there yet is fine out-of-tree, and fine by me in-tree
provided that the DT bindings are clean, but not when DT is abused like
this.

I'm sorry, but this is a NACK from me. Please handle this transparently
in the firmware if you want DT-based boot, or with ACPI.

> +
> +      For a device with multiple potential panels, a node for each potential
> +      should be defined with status = "disabled", and an appropriate panel-id
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

-- 
Regards,

Laurent Pinchart
