Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252933898FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 23:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbhESWAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 18:00:11 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:33441 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbhESWAL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 18:00:11 -0400
Received: by mail-ot1-f47.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so13159205oto.0;
        Wed, 19 May 2021 14:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4F1Ik2lHZ0cQHFExjkn2KPcO8C2jy8UrvNnb+p1DJD8=;
        b=hA70jj1zz5KyBFbhGeFVXotNDWLOji9JtAd+jxm7LLxMYlyoSvFRkRFq2KlCOWvDvw
         C4bqIAXN8VptkuSkdSI5Sm2umbCNwif/UokS9cX3D0n2g9FomXE0h8dSlUXjtKPbfUWL
         5v878PcgK3t09atr7zkXIbGIW4LuABcUhEVPk+2UiCRG8jMxLeNX+ZvH2DpoCYJnSayd
         B9f8Y8TPjI7Z/lAXzHfnVcE4mAmw97D3cq6P8H4XjOC6VU3Eo2Jaj+Cu/xuIi1A59cRv
         ViT7DIG9pmD/4Pr/fY0ttFKC3F+8RiDeqVWmA7TjOaFLL9lnOajej0emyvo1YJuveICk
         9HYQ==
X-Gm-Message-State: AOAM531w8zx8mmCWtPZ9sDbXIJNek9bHkRVglaaBFe60U/MxBdXAanue
        7VFUEQbpqqAEPKcM+oiYlg==
X-Google-Smtp-Source: ABdhPJxg6t/FoVuT8nEUIbbEVxeLe2sdjHXZpJ5exBBUWlkhyyyWmHOZ7eQ8HyzxowtEaAvEvIGNlw==
X-Received: by 2002:a9d:6048:: with SMTP id v8mr1388787otj.30.1621461530918;
        Wed, 19 May 2021 14:58:50 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x5sm198941otg.76.2021.05.19.14.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 14:58:49 -0700 (PDT)
Received: (nullmailer pid 3732927 invoked by uid 1000);
        Wed, 19 May 2021 21:58:48 -0000
Date:   Wed, 19 May 2021 16:58:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        dianders@chromium.org, khsieh@codeaurora.org, sean@poorly.run,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
Subject: Re: [PATCH v16 4/4] dt-bindings: msm/dp: Add bindings of MSM
 DisplayPort controller
Message-ID: <20210519215848.GA3727808@robh.at.kernel.org>
References: <1621332225-31918-1-git-send-email-mkrishn@codeaurora.org>
 <1621332225-31918-4-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621332225-31918-4-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 18, 2021 at 03:33:45PM +0530, Krishna Manikandan wrote:
> Add bindings for Snapdragon DisplayPort controller driver.
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in V2:
> -Provide details about sel-gpio
> 
> Changes in V4:
> -Provide details about max dp lanes
> -Change the commit text
> 
> Changes in V5:
> -moved dp.txt to yaml file
> 
> Changes in v6:
> - Squash all AUX LUT properties into one pattern Property
> - Make aux-cfg[0-9]-settings properties optional
> - Remove PLL/PHY bindings from DP controller dts
> - Add DP clocks description
> - Remove _clk suffix from clock names
> - Rename pixel clock to stream_pixel
> - Remove redundant bindings (GPIO, PHY, HDCP clock, etc..)
> - Fix indentation
> - Add Display Port as interface of DPU in DPU bindings
>   and add port mapping accordingly.
> 
> Chages in v7:
> - Add dp-controller.yaml file common between multiple SOC
> - Rename dp-sc7180.yaml to dp-controller-sc7180.yaml
> - change compatible string and add SOC name to it.
> - Remove Root clock generator for pixel clock
> - Add assigned-clocks and assigned-clock-parents bindings
> - Remove redundant properties, descriptions and blank lines
> - Add DP port in DPU bindings
> - Update depends-on tag in commit message and rebase change accordingly
> 
> Changes in v8:
> - Add MDSS AHB clock in bindings
> 
> Changes in v9:
> - Remove redundant reg-name property
> - Change assigned-clocks and assigned-clocks-parents counts to 2
> - Use IRQ flags in example dts
> 
> Changes in v10:
> - Change title of this patch as it does not contain PLL bindings anymore
> - Remove redundant properties
> - Remove use of IRQ flag
> - Fix ports property
> 
> Changes in v11:
> - add ports required of both #address-cells and  #size-cells
> - add required operating-points-v2
> - add required #sound-dai-cells
> - add required power-domains
> - update maintainer list
> 
> Changes in v12:
> - remove soc node from examples (Stephen Boyd)
> - split dpu-sc7180.yaml changes to separate patch (Stephen Boyd)
> 
> Changes in v13:
> - add assigned-clocks
> - add assigned-clock-parents
> 
> Changes in v14:
> - add reference for ports (Rob Herring)
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 159 +++++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> new file mode 100644
> index 0000000..bcce567
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MSM Display Port Controller
> +
> +maintainers:
> +  - Kuogee Hsieh <khsieh@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for DisplayPort host controller for MSM targets
> +  that are compatible with VESA DisplayPort interface specification.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7180-dp
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: AHB clock to enable register access
> +      - description: Display Port AUX clock
> +      - description: Display Port Link clock
> +      - description: Link interface clock between DP and PHY
> +      - description: Display Port Pixel clock
> +
> +  clock-names:
> +    items:
> +      - const: core_iface
> +      - const: core_aux
> +      - const: ctrl_link
> +      - const: ctrl_link_iface
> +      - const: stream_pixel
> +
> +  assigned-clocks:
> +    items:
> +      - description: link clock source
> +      - description: pixel clock source
> +
> +  assigned-clock-parents:
> +    items:
> +      - description: phy 0 parent
> +      - description: phy 1 parent
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    items:
> +      - const: dp
> +
> +  operating-points-v2:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0

These 2 are covered by the common schema already. Drop

> +
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input endpoint of the controller
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output endpoint of the controller
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"

And this.

> +
> +    additionalProperties: false

Drop this too.

> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names
> +  - "#sound-dai-cells"
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> +    #include <dt-bindings/power/qcom-aoss-qmp.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    displayport-controller@ae90000 {
> +        compatible = "qcom,sc7180-dp";
> +        reg = <0xae90000 0x1400>;
> +        interrupt-parent = <&mdss>;
> +        interrupts = <12>;
> +        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +        clock-names = "core_iface", "core_aux",
> +                      "ctrl_link",
> +                      "ctrl_link_iface", "stream_pixel";
> +
> +        assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> +                          <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +
> +        assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
> +
> +        phys = <&dp_phy>;
> +        phy-names = "dp";
> +
> +        #sound-dai-cells = <0>;
> +
> +        power-domains = <&rpmhpd SC7180_CX>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                endpoint {
> +                    remote-endpoint = <&dpu_intf0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                endpoint {
> +                    remote-endpoint = <&typec>;
> +                };
> +            };
> +        };
> +    };
> +...
> -- 
> 2.7.4
> 
