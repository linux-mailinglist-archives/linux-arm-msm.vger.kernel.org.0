Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 032A118C473
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 02:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbgCTBBc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 21:01:32 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:40061 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgCTBBc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 21:01:32 -0400
Received: by mail-io1-f65.google.com with SMTP id h18so4341921ioh.7;
        Thu, 19 Mar 2020 18:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ot6m4hY0BwqCmo0YvvIottBecwmdUoxIdqh0iIdJLaE=;
        b=e0vc4wcMKbYfbI6kyipBnoZ1jmoO413EpOBpUIq2a2ONQx4SMkadKAsSv/al4OvhS6
         dG7+iC9ejaWy2n9m67iLR0LfuJJRrO16XToJBG6D4gMWktjXSIXXtqIXGsQ8PnbCMMzG
         9lLuVaC6YZ4S3JVRhPb+MOk8omHlUR97IDjmNEcaiZq6Xfw8YELFte7Jt984jB3i89u1
         LWHsNliibdWRyBFuXfmvcQc8iS6WGC35TsBCfsUVOcCrcDEwfp8qd2crOiobfTfo5ASH
         fZFfZTfpHIhTtwr3BWH3T4yBBy8udnF6xjuYGP39Il1mZwA8G2Clm8bl4zldq2t0YQul
         zrQw==
X-Gm-Message-State: ANhLgQ30r6Rr3/d1b7Q4/X+9aJ1ZLJDR4TAt+nZyIGHZjiCRjbDgmK/2
        VIafk6fZhJ/UdZujRyk0EQ==
X-Google-Smtp-Source: ADFU+vveriY9yvP9Jzlx6UROYD7yZzJxkqX2tb0ZEVFvDtSMM5LsoOiJpdoQMBneWm4Sh8Le1oz4Cg==
X-Received: by 2002:a5e:9b09:: with SMTP id j9mr5198775iok.114.1584666091207;
        Thu, 19 Mar 2020 18:01:31 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id s18sm1290993ioc.0.2020.03.19.18.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 18:01:30 -0700 (PDT)
Received: (nullmailer pid 17809 invoked by uid 1000);
        Fri, 20 Mar 2020 01:01:27 -0000
Date:   Thu, 19 Mar 2020 19:01:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCH v7 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Message-ID: <20200320010127.GA8379@bogus>
References: <20200316041647.27953-1-harigovi@codeaurora.org>
 <20200316041647.27953-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316041647.27953-2-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 16, 2020 at 09:46:46AM +0530, Harigovindan P wrote:
> Add bindings for visionox rm69299 panel.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v2:
> 	- Removed unwanted properties from description.
> 	- Creating source files without execute permissions(Rob Herring).
> Changes in v3:
> 	- Changing txt file into yaml
> Changes in v4:
> 	- Updating license identifier.
> 	- Moving yaml file inside panel directory.
> 	- Removing pinctrl entries.
> 	- Adding documentation for reset-gpios.
> Changes in v5:
> 	- No changes. Updated 2/2 Patch.
> Changes in v6:
> 	- Removing patternProperties.
> 	- Added " |" after description.
> 	- Setting port and reset-gpios to true.
> 	- Removing @ae94000 for dsi node.
> Changes in v7:
> 	- Added reg property.
> 
>  .../display/panel/visionox,rm69299.yaml       | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> new file mode 100644
> index 000000000000..6ea1a7be3787
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> @@ -0,0 +1,81 @@
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
> +  reg:
> +    maxItems: 1
> +
> +  vdda-supply:
> +    description: |
> +      Phandle of the regulator that provides the vdda supply voltage.
> +
> +  vdd3p3-supply:
> +    description: |
> +      Phandle of the regulator that provides the vdd3p3 supply voltage.
> +
> +  ports:
> +    type: object
> +    description: |
> +      A node containing DSI input & output port nodes with endpoint
> +      definitions as documented in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt
> +      Documentation/devicetree/bindings/graph.txt
> +      properties:
> +        port: true

Need:

       additionalProperties: false


> +
> +  reset-gpios: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdda-supply
> +  - vdd3p3-supply
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsi {
> +        reg = <0x0ae94000 0x400>;

Either drop 'reg' or add a unit-address.

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel@0 {
> +            compatible = "visionox,rm69299-1080p-display";
> +            reg = <0x0ae94000 0x400>;

Wrong address.

> +
> +            vdda-supply = <&src_pp1800_l8c>;
> +            vdd3p3-supply = <&src_pp2800_l18a>;
> +
> +            reset-gpios = <&pm6150l_gpio 3 0>;
> +            ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    port@0 {

This will fail with the above change.

> +                            reg = <0>;
> +                            panel0_in: endpoint {
> +                                remote-endpoint = <&dsi0_out>;
> +                            };
> +                    };
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.25.1
> 
