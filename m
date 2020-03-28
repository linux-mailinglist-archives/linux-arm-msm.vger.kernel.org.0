Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75108196947
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2020 21:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbgC1UkN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Mar 2020 16:40:13 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:52322 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727167AbgC1UkN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Mar 2020 16:40:13 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 01F812001E;
        Sat, 28 Mar 2020 21:40:08 +0100 (CET)
Date:   Sat, 28 Mar 2020 21:40:07 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        sean@poorly.run, seanpaul@chromium.org
Subject: Re: [PATCH v10 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Message-ID: <20200328204007.GF32230@ravnborg.org>
References: <20200327073636.13823-1-harigovi@codeaurora.org>
 <20200327073636.13823-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327073636.13823-2-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=LpQP-O61AAAA:8
        a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=NjNwzAhdQeOObC28CH0A:9
        a=tQ1a9pTNNNMtrxpv:21 a=s9IzzZuyMKRTQNRv:21 a=CjuIK1q_8ugA:10
        a=pioyyrs4ZptJ924tMmac:22 a=sptkURWiP4Gy88Gu7hUp:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Harigovindan

On Fri, Mar 27, 2020 at 01:06:35PM +0530, Harigovindan P wrote:
> Add bindings for visionox rm69299 panel.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v2:
>     - Removed unwanted properties from description.
>     - Creating source files without execute permissions(Rob Herring).
> Changes in v3:
>     - Changing txt file into yaml
> Changes in v4:
>     - Updating license identifier.
>     - Moving yaml file inside panel directory.
>     - Removing pinctrl entries.
>     - Adding documentation for reset-gpios.
> Changes in v5:
>     - No changes. Updated 2/2 Patch.
> Changes in v6:
>     - Removing patternProperties.
>     - Added " |" after description.
>     - Setting port and reset-gpios to true.
>     - Removing @ae94000 for dsi node.
> Changes in v7:
>     - Added reg property.
> Changes in v8:
>     - Rearranged additionalProperties.
>     - Dropping improper reg property.
> Changes in v9:
>     - Adding additionalProperties at the same level as
>       'properties'
>     - Adding properties for "ports" which includes:
>       -> #address-cells
>       -> #size-cells
>       -> port@0
> Changes in v10:
>    - Changed file mode
>    - Making port as required
>    - Fixing example by removing ports and unit address in port
>    - Removing indentation for 'additionalProperties'
Fixed ident in a few places (one space => two sapces), and applied to
drm-misc-next.

	Sam


> 
>  .../display/panel/visionox,rm69299.yaml       | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> new file mode 100644
> index 000000000000..1a44caae5f9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/visionox,rm69299.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Visionox model RM69299 Panels Device Tree Bindings.
> +
> +maintainers:
> + - Harigovindan P <harigovi@codeaurora.org>
> +
> +description: |
> + This binding is for display panels using a Visionox RM692999 panel.
> +
> +allOf:
> + - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: visionox,rm69299-1080p-display
> +
> +  vdda-supply:
> +    description: |
> +      Phandle of the regulator that provides the vdda supply voltage.
> +
> +  vdd3p3-supply:
> +    description: |
> +      Phandle of the regulator that provides the vdd3p3 supply voltage.
> +
> +  port: true
> +
> +  reset-gpios: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - vdda-supply
> +  - vdd3p3-supply
> +  - reset-gpios
> +  - port
> +
> +examples:
> +  - |
> +    panel {
> +        compatible = "visionox,rm69299-1080p-display";
> +
> +        vdda-supply = <&src_pp1800_l8c>;
> +        vdd3p3-supply = <&src_pp2800_l18a>;
> +
> +        reset-gpios = <&pm6150l_gpio 3 0>;
> +        port {
> +            panel0_in: endpoint {
> +                remote-endpoint = <&dsi0_out>;
> +            };
> +        };
> +    };
> +...
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
