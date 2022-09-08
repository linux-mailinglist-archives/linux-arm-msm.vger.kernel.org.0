Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28A4D5B26E8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 21:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiIHThM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 15:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiIHThM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 15:37:12 -0400
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3D0F295D;
        Thu,  8 Sep 2022 12:37:07 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1278a61bd57so28621159fac.7;
        Thu, 08 Sep 2022 12:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=i6d5JJ4ntfOzrETVCcOiKvogBPG/DUuMjZHAHf/Ewx4=;
        b=F+rtApkZJio5bt97vl5M+5QPG2ufuKqWh55KEuuiKUyWZ4HTccRasmt8j6iWqGtKjv
         +Tr5mfZQtoQEi3ajUSsGGkSCKCBqA7sEzUs5sC3ApNZFDQIHlO5FAe5UhsJzLkqU819V
         M+TrcgLRRhLyNUYqFAj/EL7+heMXEX33vXvA2ZMFgbViXfx+llmNVcwc3/F+Jq8JODME
         8bK05CWGmWkOHMQfWaGdrWYb26+SGVXHJRFkdgOqQK89WmZZVkCfsOsZeP4muiKYVlWy
         ptBIbLh3Hrlh71+qBU/mOCq48y5BJabqFBxYB7CCMGoz5BqLA9P4vc/uRihl1ry0GZEz
         CHyQ==
X-Gm-Message-State: ACgBeo3ORwpWo+ZZDE4/TeSTzxnvAH7Ki8Z4eOh03muouMKYL4ll2jGT
        TfYLImXzO4LX+NApYSugQQ==
X-Google-Smtp-Source: AA6agR57fIADaJMWwZWAqovrTD/4Blfe/WcGrSw7LFb+E7YFYXCYzasKK2F75RktTR3sWNAd+mQ2ZA==
X-Received: by 2002:a05:6808:14d4:b0:343:6ded:57b1 with SMTP id f20-20020a05680814d400b003436ded57b1mr2246085oiw.12.1662665826763;
        Thu, 08 Sep 2022 12:37:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m16-20020a056808025000b00344851ea0ddsm7771212oie.56.2022.09.08.12.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 12:37:06 -0700 (PDT)
Received: (nullmailer pid 3209084 invoked by uid 1000);
        Thu, 08 Sep 2022 19:37:05 -0000
Date:   Thu, 8 Sep 2022 14:37:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Message-ID: <20220908193705.GA3002673-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
 <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 08, 2022 at 03:37:38PM +0200, Krzysztof Kozlowski wrote:
> On 01/09/2022 12:23, Dmitry Baryshkov wrote:
> > Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> > yaml file. Changes to the existing (txt) schema:
> >  - Added optional "vbif_nrt_phys" region used by msm8996
> >  - Made "bus" and "vsync" clocks optional (they are not used by some
> >    platforms)
> >  - Added (optional) "core" clock added recently to the mdss driver
> >  - Added optional resets property referencing MDSS reset
> >  - Defined child nodes pointing to corresponding reference schema.
> >  - Dropped the "lut" clock. It was added to the schema by mistake (it is
> >    a part of mdp4 schema, not the mdss).
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
> >  .../devicetree/bindings/display/msm/mdss.yaml | 166 ++++++++++++++++++
> >  2 files changed, 167 insertions(+), 29 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> > index 43d11279c925..65d03c58dee6 100644
> > --- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
> > +++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> > @@ -2,37 +2,9 @@ Qualcomm adreno/snapdragon MDP5 display controller
> >  
> >  Description:
> >  
> > -This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
> > -encapsulates sub-blocks like MDP5, DSI, HDMI, eDP etc, and the MDP5 display
> > +This is the bindings documentation for the MDP5 display
> >  controller found in SoCs like MSM8974, APQ8084, MSM8916, MSM8994 and MSM8996.
> >  
> > -MDSS:
> > -Required properties:
> > -- compatible:
> > -  * "qcom,mdss" - MDSS
> > -- reg: Physical base address and length of the controller's registers.
> > -- reg-names: The names of register regions. The following regions are required:
> > -  * "mdss_phys"
> > -  * "vbif_phys"
> > -- interrupts: The interrupt signal from MDSS.
> > -- interrupt-controller: identifies the node as an interrupt controller.
> > -- #interrupt-cells: specifies the number of cells needed to encode an interrupt
> > -  source, should be 1.
> > -- power-domains: a power domain consumer specifier according to
> > -  Documentation/devicetree/bindings/power/power_domain.txt
> > -- clocks: device clocks. See ../clocks/clock-bindings.txt for details.
> > -- clock-names: the following clocks are required.
> > -  * "iface"
> > -  * "bus"
> > -  * "vsync"
> > -- #address-cells: number of address cells for the MDSS children. Should be 1.
> > -- #size-cells: Should be 1.
> > -- ranges: parent bus address space is the same as the child bus address space.
> > -
> > -Optional properties:
> > -- clock-names: the following clocks are optional:
> > -  * "lut"
> > -
> >  MDP5:
> >  Required properties:
> >  - compatible:
> > diff --git a/Documentation/devicetree/bindings/display/msm/mdss.yaml b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> > new file mode 100644
> > index 000000000000..8860fc55cca5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/mdss.yaml
> > @@ -0,0 +1,166 @@
> > +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/msm/mdss.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Mobile Display SubSystem (MDSS)
> > +
> > +maintainers:
> > +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > +  - Rob Clark <robdclark@gmail.com>
> > +
> > +description:
> > +  This is the bindings documentation for the Mobile Display Subsytem(MDSS) that
> > +  encapsulates sub-blocks like MDP5, DSI, HDMI, eDP, etc.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,mdss
> > +
> > +  reg:
> > +    minItems: 2
> > +    maxItems: 3
> > +
> > +  reg-names:
> > +    minItems: 2
> > +    items:
> > +      - const: mdss_phys
> > +      - const: vbif_phys
> > +      - const: vbif_nrt_phys
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-controller:
> > +    true
> 
> If there is going to be v7 - please make it one line.
> 
> > +
> > +  "#interrupt-cells":
> > +    const: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +    description: |
> > +      The MDSS power domain provided by GCC
> > +
> > +  clocks:
> > +    minItems: 1
> > +    items:
> > +      - description: Display abh clock
> > +      - description: Display axi clock
> > +      - description: Display vsync clock
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: iface
> > +      - const: bus
> > +      - const: vsync
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges:
> > +    true
> 
> Ditto.
> 
> > +
> > +  resets:
> > +    items:
> > +      - description: MDSS_CORE reset
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +  - power-domains
> > +  - clocks
> > +  - clock-names
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - ranges
> > +
> > +patternProperties:
> > +  "^mdp@[1-9a-f][0-9a-f]*$":
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        const: qcom,mdp5
> > +
> > +  "^dsi@[1-9a-f][0-9a-f]*$":
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        const: qcom,mdss-dsi-ctrl
> 
> This should be ref to dsi-controller-main.yaml... or based on previous
> Rob's feedback you dropped it everywhere in children?

I don't think I said. I thought about it some, as yes, we normally have 
done as you suggested. The downside is with a ref we'll do the whole
validation of the child node twice (unless the referenced schema has a 
'select: false') whereas here only 'compatible' is validated twice. This 
way also complicates checking for unevaluatedProperties/additionalProperties.

So maybe better to keep with the 'normal' way and make this a ref. 

Rob
