Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 071285E5FEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 12:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbiIVKbP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 06:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiIVKbO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 06:31:14 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA552AA355
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 03:31:10 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-346cd4c3d7aso93639647b3.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 03:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=d1av7JNMJ6QwTEI5A+nW9Rk600pfta4mmcFg/bbQiuo=;
        b=nBL924xLyfUXAgRFsh04SP05n+QQwtwageFeiNxabLE5C0mEZHnupcMC+OY9wi/HGh
         tJmRJjWXw1SogxmaaEt4jKRDs10PeSnipsGbgYKzwv18Fa5TBnNej70jo4w6XCtUgXsn
         o69nEfGQzMUamMyQRLnWpVK+PJF+JaiWvg31oNBzX/t2LUGDZntbfaPlZf1KYlYmOX0+
         /9Qy1cfykD3Wll8VH5Uq5L+XYwS7agLI3NqOo5ccYKRn0l9pZcv7rqkSLeK6BosZ6lmp
         icRYT4VdMPFZ5WOQbknmTaj55zhG4zpRZoainwe3kOEmq2uVJ5kwlZ7QWBLlALcvznmK
         6ITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=d1av7JNMJ6QwTEI5A+nW9Rk600pfta4mmcFg/bbQiuo=;
        b=yxbxxPkkdp3SUSyU/gTK0PXzSm6tozRzIaWJxGe3TLmDntpKUIexCit1CaiNU0X26H
         j95KzSMH8Jfqtk7qx6+GeITlqQgUpiCw8RpFCCj/JeTslVABX2kN0tEmFJMoW+m0au8o
         d5YFw8928PTvz9KTOmSddtoO5esN9J1jutpSYwCsxQFIEEWUOceE1fG3vjYcPtX9VlGh
         y0N+VAAxyfzZgQ/0cQuy3uiWzfYqG00op6NUMeNPftRSsxJQ4+sgxmPOBM921uBZrnRQ
         ocKrWO31mfO27fv0cP+wZXy+vkjcVo5TXuB2dzE7Ve8OeESRReR0p7VXi9TcNalJZaVs
         DIWw==
X-Gm-Message-State: ACrzQf2QKEimfOC2QPGKCnctfq0MOrXqTaNuHzTPI1tsWrVx5p6XM9nU
        lOH6gf9C0lsq5TAb5xeUP0bD9+U0W4hxIuk2Yk78lQ==
X-Google-Smtp-Source: AMsMyM7/FLhzfPLVrzX6fdQx3rCLzT0b0rSr+zIV+FjyFzomBRy5lMomrZlXpUUAwi4rIUtGZNFSQ7XkNd71WtkEp1o=
X-Received: by 2002:a81:1e0d:0:b0:33b:fb67:9895 with SMTP id
 e13-20020a811e0d000000b0033bfb679895mr2367129ywe.188.1663842670066; Thu, 22
 Sep 2022 03:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-7-dmitry.baryshkov@linaro.org> <94bc039f-065e-ebfa-e09b-7fdb5f4be89b@linaro.org>
In-Reply-To: <94bc039f-065e-ebfa-e09b-7fdb5f4be89b@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 22 Sep 2022 13:30:59 +0300
Message-ID: <CAA8EJppqxMvn+bpHQ-49nBw6esdgRyft4aPj2410bq2tbL=94w@mail.gmail.com>
Subject: Re: [PATCH v7 06/12] dt-bindings: display/msm: split dpu-sc7180 into
 DPU and MDSS parts
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 22 Sept 2022 at 10:08, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> > In order to make the schema more readable, split dpu-sc7180 into the DPU
> > and MDSS parts, each one describing just a single device binding.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
> Thank you for your patch. There is something to discuss/improve.
>
> > +---
> > +$id: http://devicetree.org/schemas/display/msm/qcom,sc7180-dpu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Display DPU dt properties for SC7180 target
> > +
> > +maintainers:
> > +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> > +
>
> missing allOf
>
> > +$ref: /schemas/display/msm/dpu-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: qcom,sc7180-dpu
> > +
> > +  reg:
> > +    items:
> > +      - description: Address offset and size for mdp register set
> > +      - description: Address offset and size for vbif register set
> > +
> > +  reg-names:
> > +    items:
> > +      - const: mdp
> > +      - const: vbif
> > +
> > +  clocks:
> > +    items:
> > +      - description: Display hf axi clock
> > +      - description: Display ahb clock
> > +      - description: Display rotator clock
> > +      - description: Display lut clock
> > +      - description: Display core clock
> > +      - description: Display vsync clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +      - const: iface
> > +      - const: rot
> > +      - const: lut
> > +      - const: core
> > +      - const: vsync
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> > +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > +
> > +    display-controller@ae01000 {
> > +        compatible = "qcom,sc7180-dpu";
> > +        reg = <0x0ae01000 0x8f000>,
> > +              <0x0aeb0000 0x2008>;
> > +
> > +        reg-names = "mdp", "vbif";
> > +
> > +        clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> > +                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                 <&dispcc DISP_CC_MDSS_ROT_CLK>,
> > +                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> > +                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> > +                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> > +        clock-names = "bus", "iface", "rot", "lut", "core",
> > +                      "vsync";
> > +
> > +        interrupt-parent = <&mdss>;
> > +        interrupts = <0>;
> > +        power-domains = <&rpmhpd SC7180_CX>;
> > +        operating-points-v2 = <&mdp_opp_table>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                endpoint {
> > +                    remote-endpoint = <&dsi0_in>;
> > +                };
> > +            };
> > +
> > +            port@2 {
> > +                reg = <2>;
> > +                endpoint {
> > +                    remote-endpoint = <&dp_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
> > new file mode 100644
> > index 000000000000..e507c091b60f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
> > @@ -0,0 +1,84 @@
> > +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/msm/qcom,sc7180-mdss.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SC7180 Display MDSS
> > +
> > +maintainers:
> > +  - Krishna Manikandan <quic_mkrishn@quicinc.com>
> > +
> > +description:
> > +  Device tree bindings for MSM Mobile Display Subsystem(MDSS) that encapsulates
> > +  sub-blocks like DPU display controller, DSI and DP interfaces etc. Device tree
> > +  bindings of MDSS are mentioned for SC7180 target.
> > +
>
> missing allOf.
>
> > +$ref: /schemas/display/msm/mdss-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: qcom,sc7180-mdss
> > +
> > +  clocks:
> > +    items:
> > +      - description: Display AHB clock from gcc
> > +      - description: Display AHB clock from dispcc
> > +      - description: Display core clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: iface
> > +      - const: ahb
> > +      - const: core
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  interconnects:
> > +    maxItems: 1
> > +
> > +  interconnect-names:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  "^display-controller@[0-9a-f]+$":
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        const: qcom,sc7180-dpu
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> > +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interconnect/qcom,sdm845.h>
> > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > +
> > +    display-subsystem@ae00000 {
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        compatible = "qcom,sc7180-mdss";
> > +        reg = <0xae00000 0x1000>;
> > +        reg-names = "mdss";
> > +        power-domains = <&dispcc MDSS_GDSC>;
> > +        clocks = <&gcc GCC_DISP_AHB_CLK>,
> > +                 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > +        clock-names = "iface", "ahb", "core";
> > +
> > +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <1>;
> > +
> > +        interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
> > +        interconnect-names = "mdp0-mem";
> > +
> > +        iommus = <&apps_smmu 0x800 0x2>;
> > +        ranges;
>
> This should come with full example, so with display-controller child
> (unless Rob asked not to?)

I'm not sure here. We have an example of a display-controller in a
separate schema file. Why would you like to duplicate it?


-- 
With best wishes
Dmitry
