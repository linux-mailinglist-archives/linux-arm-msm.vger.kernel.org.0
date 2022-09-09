Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81EA05B4273
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 00:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbiIIWYF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 18:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiIIWYE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 18:24:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E0236841;
        Fri,  9 Sep 2022 15:24:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1F109620F9;
        Fri,  9 Sep 2022 22:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C149C43142;
        Fri,  9 Sep 2022 22:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662762242;
        bh=jYir94PMupIQABgyuc1d88q0jMHnHn5SyYXVlYCBsEc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tB82VSfxvZsZYNJnN4grncwTfntY5H5jsy242B6TRCgU9mBHjWjZzzloGk5RFmJmX
         MbgZo3QwQY1aJxVLdSIr472O/c2UTcj/XEa3MgOGvJJTJaKUyN7LTFpyK/bM4d30xp
         N7sD00G6rqAPrIQTINHd8WgL3fIan1YGJ/JSM6P3vovFj6syg4ZuLKNoQdK0weC+i3
         A4ne1OLB7tRCLgqOh8E+wkAN/paXuXp1db/ybXmA4R/yJkA1lI855HLcoukOtrKJcs
         TwaKWDXt6i+5u6XigRRViSS5gd08T1Cmsnl5CQDPc0HSt2qtU7Ca1IEB3E3fbU34nw
         DLHJlUUdeBfoA==
Received: by mail-vk1-f172.google.com with SMTP id i67so1442146vkb.2;
        Fri, 09 Sep 2022 15:24:02 -0700 (PDT)
X-Gm-Message-State: ACgBeo0F+YuWFz00ndluntdj3tv4e48MPzhcR2/I0aE8bjKty3UOhf6f
        dPcSQ7AgpYASixFE+W/RRydQ0EaJNuboS5T68Q==
X-Google-Smtp-Source: AA6agR4gWoUPXRqvgMiwoS4inzHviowpe/lpefLB9U6SBKicyMAUahdlUNji7TnYC0KiiXRUUyI4dQa+VqCUXYS9LNI=
X-Received: by 2002:a1f:2995:0:b0:39e:9c49:7f60 with SMTP id
 p143-20020a1f2995000000b0039e9c497f60mr5650976vkp.14.1662762241255; Fri, 09
 Sep 2022 15:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org> <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org> <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
In-Reply-To: <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 9 Sep 2022 17:23:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
Message-ID: <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss bindings
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 8, 2022 at 3:20 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 08/09/2022 22:37, Rob Herring wrote:
> > On Thu, Sep 08, 2022 at 03:37:38PM +0200, Krzysztof Kozlowski wrote:
> >> On 01/09/2022 12:23, Dmitry Baryshkov wrote:
> >>> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> >>> yaml file. Changes to the existing (txt) schema:
> >>>   - Added optional "vbif_nrt_phys" region used by msm8996
> >>>   - Made "bus" and "vsync" clocks optional (they are not used by some
> >>>     platforms)
> >>>   - Added (optional) "core" clock added recently to the mdss driver
> >>>   - Added optional resets property referencing MDSS reset
> >>>   - Defined child nodes pointing to corresponding reference schema.
> >>>   - Dropped the "lut" clock. It was added to the schema by mistake (it is
> >>>     a part of mdp4 schema, not the mdss).
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>   .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
> >>>   .../devicetree/bindings/display/msm/mdss.yaml | 166 ++++++++++++++++++
> >>>   2 files changed, 167 insertions(+), 29 deletions(-)
> >>>   create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> >>> index 43d11279c925..65d03c58dee6 100644
> >>> --- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
> >>> +++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> >>> @@ -2,37 +2,9 @@ Qualcomm adreno/snapdragon MDP5 display controller
> >>>
> >>>   Description:
> >>>
> >>> -This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
> >>> -encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
> >>> +This is the bindings documentation for the MDP5 display
> >>>   controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
> >>>
> >>> -MDSS:
> >>> -Required properties:
> >>> -- compatible:
> >>> -  * "qcom,mdss" - MDSS
> >>> -- reg: Physical base address and length of the controller's registers.
> >>> -- reg-names: The names of register regions. The following regions are required:
> >>> -  * "mdss_phys"
> >>> -  * "vbif_phys"
> >>> -- interrupts: The interrupt signal from MDSS.
> >>> -- interrupt-controller: identifies the node as an interrupt controller.
> >>> -- #interrupt-cells: specifies the number of cells needed to encode an interrupt
> >>> -  source, should be 1.
> >>> -- power-domains: a power domain consumer specifier according to
> >>> -  Documentation/devicetree/bindings/power/power_domain.txt
> >>> -- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
> >>> -- clock-names: the following clocks are required.
> >>> -  * "iface"
> >>> -  * "bus"
> >>> -  * "vsync"
> >>> -- #address-cells: number of address cells for the MDSS children. Should be 1.
> >>> -- #size-cells: Should be 1.
> >>> -- ranges: parent bus address space is the same as the child bus address space.
> >>> -
> >>> -Optional properties:
> >>> -- clock-names: the following clocks are optional:
> >>> -  * "lut"
> >>> -
> >>>   MDP5:
> >>>   Required properties:
> >>>   - compatible:
> >>> diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> >>> new file mode 100644
> >>> index 000000000000..8860fc55cca5
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> >>> @@ -0,0 +1,166 @@
> >>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/display/msm/mdss.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Qualcomm Mobile Display SubSystem (MDSS)
> >>> +
> >>> +maintainers:
> >>> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> +  - Rob Clark <robdclark@gmail.com>
> >>> +
> >>> +description:
> >>> +  This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
> >>> +  encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - qcom,mdss
> >>> +
> >>> +  reg:
> >>> +    minItems: 2
> >>> +    maxItems: 3
> >>> +
> >>> +  reg-names:
> >>> +    minItems: 2
> >>> +    items:
> >>> +      - const: mdss_phys
> >>> +      - const: vbif_phys
> >>> +      - const: vbif_nrt_phys
> >>> +
> >>> +  interrupts:
> >>> +    maxItems: 1
> >>> +
> >>> +  interrupt-controller:
> >>> +    true
> >>
> >> If there is going to be v7 - please make it one line.
> >>
> >>> +
> >>> +  "#interrupt-cells":
> >>> +    const: 1
> >>> +
> >>> +  power-domains:
> >>> +    maxItems: 1
> >>> +    description: |
> >>> +      The MDSS power domain provided by GCC
> >>> +
> >>> +  clocks:
> >>> +    minItems: 1
> >>> +    items:
> >>> +      - description: Display abh clock
> >>> +      - description: Display axi clock
> >>> +      - description: Display vsync clock
> >>> +
> >>> +  clock-names:
> >>> +    minItems: 1
> >>> +    items:
> >>> +      - const: iface
> >>> +      - const: bus
> >>> +      - const: vsync
> >>> +
> >>> +  "#address-cells":
> >>> +    const: 1
> >>> +
> >>> +  "#size-cells":
> >>> +    const: 1
> >>> +
> >>> +  ranges:
> >>> +    true
> >>
> >> Ditto.
> >>
> >>> +
> >>> +  resets:
> >>> +    items:
> >>> +      - description: MDSS_CORE reset
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - reg-names
> >>> +  - interrupts
> >>> +  - interrupt-controller
> >>> +  - "#interrupt-cells"
> >>> +  - power-domains
> >>> +  - clocks
> >>> +  - clock-names
> >>> +  - "#address-cells"
> >>> +  - "#size-cells"
> >>> +  - ranges
> >>> +
> >>> +patternProperties:
> >>> +  "^mdp@[1-9a-f][0-9a-f]*$":
> >>> +    type: object
> >>> +    properties:
> >>> +      compatible:
> >>> +        const: qcom,mdp5
> >>> +
> >>> +  "^dsi@[1-9a-f][0-9a-f]*$":
> >>> +    type: object
> >>> +    properties:
> >>> +      compatible:
> >>> +        const: qcom,mdss-dsi-ctrl
> >>
> >> This should be ref to dsi-controller-main.yaml... or based on previous
> >> Rob's feedback you dropped it everywhere in children?
> >
> > I don't think I said. I thought about it some, as yes, we normally have
> > done as you suggested. The downside is with a ref we'll do the whole
> > validation of the child node twice (unless the referenced schema has a
> > 'select: false') whereas here only 'compatible' is validated twice. This
> > way also complicates checking for unevaluatedProperties/additionalProperties.
> >
> > So maybe better to keep with the 'normal' way and make this a ref.
>
> Well.. I tried using $ref in the previous iteration, but then I faced
> the fact that I can not use it. Using the $ref the node gets validated
> even if it is disabled, and we do not want to do this. The nodes are
> usually split in way that regulators are specified in the board DT file.
> Thus disabled dsi/dsi-phy nodes do not get all the required regulators.
> And dt-validate happily dumps tons of warnings for disabled nodes. Thus
> I ended up with the compatible rather than $ref.

Only warnings about required properties? Those are supposed to get
filtered out if the node is disabled. Maybe being in a $ref doesn't
work.

Rob
