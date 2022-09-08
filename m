Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0845B1F5B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 15:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbiIHNht (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 09:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbiIHNhn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 09:37:43 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE9CC2F80
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 06:37:42 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id u18so15465791lfo.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=mg9cAuwjkSFrw35IeJp38HB0O0TPmsiUVUu8bVEz1QM=;
        b=iw03YHKoa1hqYNph53FKORbebKgOWi4Y+ocuspU6/3oxNgeNXe5e9T6vXEEnVwhh/p
         Zv8CS21DQ0DXerLzZ4g6isG/QFPZM2H5OEBQ1ex3aOI/cp3P5ubXD1bVyiOpus5iVE9R
         vf6occMq3nwYyADbRJbk7lHftIW8UIhJ9ypvZI2T9B4jo1w8Y87xetGCOf/Hv7tHLmHH
         4QnoyYOtg/fzuT8riOrBTSicE2/+BMKX+VEGwrJ4gf1mtbnGGKJhV8IOq4xX9WU448Vv
         A4hV8H22geiEjyGSFKArsbtG/kSFnyjLHJ+fuA2IgtUVFCqUsPyYgBuQlfjcRFG8lb42
         9rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=mg9cAuwjkSFrw35IeJp38HB0O0TPmsiUVUu8bVEz1QM=;
        b=WoKH66sqWlGB5ephJsgDxZq1IRvKuODEIN+uWJNuywigOqbHV5IO4Ze9QDG6dR1mw/
         +yWH4bKwE5BcwnxyNt2S4oMcX2N4MHH8dWtlNnw8D97Q9A0DCClbhzoOlUEQSYmGhJOC
         piW4ODF0edtI8C0U3l/vQjelEXgntpYiMcjTu93e0dup4w6PqJK6icjW7yMEkNrEDppL
         uvNydkwV/YGHHYe/YzLl+84Q24MXdjNPdSYMK3DPA8qlK7vUjQq3sYP3WPlkN/4aaRJp
         dlFEEkJ/PA20REK7USD3uhtPuyD04ey7jbb/WdXqxbF2KLmifSnOhyg6Vniij5EZB7qK
         nFvw==
X-Gm-Message-State: ACgBeo3gBQ3Kp9MpDHf4k8Hwlk7xg/T92P+/OTCBiwjBpYkL2IkcnwrE
        cYHRnvXK/jmmKUA6KNPmKAt5kQ==
X-Google-Smtp-Source: AA6agR5JkCFywxWDiaXlWCjogpSBj7qQif3BMpiUND+cljMl4lbSknid5qxiBcr2rvUvaGE+D9QYvg==
X-Received: by 2002:a05:6512:3a96:b0:494:71e2:6d86 with SMTP id q22-20020a0565123a9600b0049471e26d86mr2988699lfu.274.1662644260395;
        Thu, 08 Sep 2022 06:37:40 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q9-20020ac25fc9000000b0049464d89e40sm1059515lfg.72.2022.09.08.06.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:37:39 -0700 (PDT)
Message-ID: <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
Date:   Thu, 8 Sep 2022 15:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Loic Poulain <loic.poulain@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/09/2022 12:23, Dmitry Baryshkov wrote:
> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> yaml file. Changes to the existing (txt) schema:
>  - Added optional "vbif_nrt_phys" region used by msm8996
>  - Made "bus" and "vsync" clocks optional (they are not used by some
>    platforms)
>  - Added (optional) "core" clock added recently to the mdss driver
>  - Added optional resets property referencing MDSS reset
>  - Defined child nodes pointing to corresponding reference schema.
>  - Dropped the "lut" clock. It was added to the schema by mistake (it is
>    a part of mdp4 schema, not the mdss).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
>  .../devicetree/bindings/display/msm/mdss.yaml | 166 ++++++++++++++++++
>  2 files changed, 167 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> index 43d11279c925..65d03c58dee6 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
> +++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> @@ -2,37 +2,9 @@ Qualcomm adreno/snapdragon MDP5 display controller
>  
>  Description:
>  
> -This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
> -encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
> +This is the bindings documentation for the MDP5 display
>  controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
>  
> -MDSS:
> -Required properties:
> -- compatible:
> -  * "qcom,mdss" - MDSS
> -- reg: Physical base address and length of the controller's registers.
> -- reg-names: The names of register regions. The following regions are required:
> -  * "mdss_phys"
> -  * "vbif_phys"
> -- interrupts: The interrupt signal from MDSS.
> -- interrupt-controller: identifies the node as an interrupt controller.
> -- #interrupt-cells: specifies the number of cells needed to encode an interrupt
> -  source, should be 1.
> -- power-domains: a power domain consumer specifier according to
> -  Documentation/devicetree/bindings/power/power_domain.txt
> -- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
> -- clock-names: the following clocks are required.
> -  * "iface"
> -  * "bus"
> -  * "vsync"
> -- #address-cells: number of address cells for the MDSS children. Should be 1.
> -- #size-cells: Should be 1.
> -- ranges: parent bus address space is the same as the child bus address space.
> -
> -Optional properties:
> -- clock-names: the following clocks are optional:
> -  * "lut"
> -
>  MDP5:
>  Required properties:
>  - compatible:
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> new file mode 100644
> index 000000000000..8860fc55cca5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Mobile Display SubSystem (MDSS)
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description:
> +  This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
> +  encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,mdss
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 3
> +
> +  reg-names:
> +    minItems: 2
> +    items:
> +      - const: mdss_phys
> +      - const: vbif_phys
> +      - const: vbif_nrt_phys
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller:
> +    true

If there is going to be v7 - please make it one line.

> +
> +  "#interrupt-cells":
> +    const: 1
> +
> +  power-domains:
> +    maxItems: 1
> +    description: |
> +      The MDSS power domain provided by GCC
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: Display abh clock
> +      - description: Display axi clock
> +      - description: Display vsync clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: vsync
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges:
> +    true

Ditto.

> +
> +  resets:
> +    items:
> +      - description: MDSS_CORE reset
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +patternProperties:
> +  "^mdp@[1-9a-f][0-9a-f]*$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,mdp5
> +
> +  "^dsi@[1-9a-f][0-9a-f]*$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,mdss-dsi-ctrl

This should be ref to dsi-controller-main.yaml... or based on previous
Rob's feedback you dropped it everywhere in children?

> +
> +  "^dsi-phy@[1-9a-f][0-9a-f]*$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,dsi-phy-14nm
> +          - qcom,dsi-phy-14nm-660
> +          - qcom,dsi-phy-20nm
> +          - qcom,dsi-phy-28nm-hpm
> +          - qcom,dsi-phy-28nm-lp
> +
> +  "^hdmi-phy@[1-9a-f][0-9a-f]*$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,hdmi-phy-8084
> +          - qcom,hdmi-phy-8660
> +          - qcom,hdmi-phy-8960
> +          - qcom,hdmi-phy-8974
> +          - qcom,hdmi-phy-8996
> +
> +  "^hdmi-tx@[1-9a-f][0-9a-f]*$":
> +    type: object
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,hdmi-tx-8084
> +          - qcom,hdmi-tx-8660
> +          - qcom,hdmi-tx-8960
> +          - qcom,hdmi-tx-8974
> +          - qcom,hdmi-tx-8994
> +          - qcom,hdmi-tx-8996
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mdss@1a00000 {
> +      compatible = "qcom,mdss";
> +      reg = <0x1a00000 0x1000>,
> +            <0x1ac8000 0x3000>;
> +      reg-names = "mdss_phys", "vbif_phys";
> +
> +      power-domains = <&gcc MDSS_GDSC>;
> +
> +      clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +               <&gcc GCC_MDSS_AXI_CLK>,
> +               <&gcc GCC_MDSS_VSYNC_CLK>;
> +      clock-names = "iface",
> +                    "bus",
> +                    "vsync";
> +
> +      interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +
> +      interrupt-controller;
> +      #interrupt-cells = <1>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +

No need for blank line.



Best regards,
Krzysztof
