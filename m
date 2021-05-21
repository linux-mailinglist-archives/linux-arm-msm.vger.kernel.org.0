Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15CA38CBF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 19:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238130AbhEURU7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 13:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbhEURU6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 13:20:58 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60513C0613ED
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 10:19:34 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id o66-20020a4a44450000b029020d44dea886so4731179ooa.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J0fP12wefvquDvVfY/24BD7zsm1DcgCIxJ2XqqYQDSA=;
        b=GdMqZnYx10OrRex3L8oFLrbhK737WLie4fz+j8F0nzN3Hb4SWeV4xI+JX/mM9FQinx
         jqZOfeajw7LlhE9IGX0YXy4G9W9UaU5xNWux7VURf6RXXC8oBXJddgQa1WceGff14AJ/
         Wbq/YrWHludyof5Sw/YXeBi8i1kIgyUBaTdCnqg/duXnfgVWw5qqWZPCtpVHuVUrWj9w
         n1MXK0hLGQyaOvG3wk+bF/K0PtRgoRxJLK+Baljojsh+Js07CeVhcYMeq5D828+w89V6
         DKYV912wrk5wid7dhLps/qkJ5VlcWDAGvgvksn64A/B0zqsRfzSzaT/vP4O0bgjLRGEk
         RsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J0fP12wefvquDvVfY/24BD7zsm1DcgCIxJ2XqqYQDSA=;
        b=SgDbjSRvVYN9oDNU21fq5jGoPmo5x8nYR211YBzAFVIvCYt2HRvdKZphNW/7ac9bR2
         EYP3t/1LkhJhQ5zjWnF0gO7YrtunwkM8x5XFkkPD6RgqnuNpKVJjdjIvT98+y2KnEzjA
         /uSbbkBy5P4+yN5uK92IZ9Olt4C82yEp6af7gLMYqJGFnkVvoHB8qP1VwH0ZHP/nj+r1
         505onA7MN48mdP9MJ1m0Lpx9Spnbl63Bw4+/+uEKKbHN4A7GXbc6MdSXc5iqf77e9d2r
         KBqhxkBKRgkhSILTbfv76Gbnh6/lSCZkRzSEpomztnimk3F5HJTzwrg5Uj3/cV4uhUmD
         gD9w==
X-Gm-Message-State: AOAM533nMSBi+u8T09YA1T9tzQZ+5Vcwkav3WSsb9bNTq2qst9urwtqy
        QJp4ELKyh5kdEZSDDJgLZBCJxg==
X-Google-Smtp-Source: ABdhPJxt549xKMywPinSToWQ1ZBYIlDb+W17jU7yW9AiwowYneC2cvm4K8ln83iqjmaT/rxW5IAmAg==
X-Received: by 2002:a4a:d543:: with SMTP id q3mr9031146oos.72.1621617573697;
        Fri, 21 May 2021 10:19:33 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t39sm1289088ooi.42.2021.05.21.10.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 10:19:33 -0700 (PDT)
Date:   Fri, 21 May 2021 12:19:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, swboyd@chromium.org, vinod.koul@linaro.org,
        dianders@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
        sean@poorly.run, robh@kernel.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
Subject: Re: [PATCH v17 4/4] dt-bindings: msm/dp: Add bindings of MSM
 DisplayPort controller
Message-ID: <20210521171930.GE2484@yoga>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <1621592844-6414-4-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621592844-6414-4-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 21 May 05:27 CDT 2021, Krishna Manikandan wrote:

> Add bindings for Snapdragon DisplayPort controller driver.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

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
> 
> Changes in v15:
> - drop common properties from ports (Rob Herring)
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 146 +++++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> new file mode 100644
> index 0000000..64d8d9e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -0,0 +1,146 @@
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
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input endpoint of the controller
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output endpoint of the controller
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
