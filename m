Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD4A55C4FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236861AbiF0SFg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 14:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240093AbiF0SFe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 14:05:34 -0400
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62876DF3A;
        Mon, 27 Jun 2022 11:05:08 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id p9so6269480ilj.7;
        Mon, 27 Jun 2022 11:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p57MlR8Ajo/G0laDaDGrGaJ0Gmeu35AovV055NwM3nA=;
        b=YPRubnhSrQstu7OA2eQPisNZSFmkg3+aMVsRsEpf926awnGxedqB6l0k11clzb2WZM
         wjZjibpS1e895casRdrLsf2jJXWSo2qN9LIQm3jhK6vWGfiCVgFOrLimjQlrG/0wVI2J
         14mtWQLMZRiCK54xO75D8T7J+6RwEx2aTHAcLMQUVqMm5QkzXwBz0oBSTHFKtoc0xlXE
         hdpmurELJMgKweaJZUlc9cxETjAg9okEZrkEPVNb3BrNNhuKNVcjqd7Ovk33VP7ai4PU
         STD+xR4gS6xZLLK4VUbnHW/lMQyOW7jEfuOWm+gLBPN1fLSrKwPCjvdTIp8RwbLI3GFz
         nyPg==
X-Gm-Message-State: AJIora82DMXfUZ00BArBmugGSvem+qNs8ysrdKK5ulv9O7IG+coWYXsV
        NqWTqv2wy4Qe4znec/vIZg==
X-Google-Smtp-Source: AGRyM1uiE3p/EbR6rvUXP9RRxgnMAUSEd+jlUd0eBufVG4o/zNO73ycSuVBGie5SRtlHIpq5Axnz9w==
X-Received: by 2002:a05:6e02:1c44:b0:2da:7235:983e with SMTP id d4-20020a056e021c4400b002da7235983emr7831516ilg.64.1656353107553;
        Mon, 27 Jun 2022 11:05:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id a13-20020a02a00d000000b00339ce33f32csm5078977jah.102.2022.06.27.11.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 11:05:07 -0700 (PDT)
Received: (nullmailer pid 2682977 invoked by uid 1000);
        Mon, 27 Jun 2022 18:05:06 -0000
Date:   Mon, 27 Jun 2022 12:05:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH 08/11] dt-bindings: display/msm: add mdp-opp-table to
 dpu-sdm845
Message-ID: <20220627180506.GA2679395-robh@kernel.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
 <20220625232513.522599-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625232513.522599-9-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 26, 2022 at 02:25:10AM +0300, Dmitry Baryshkov wrote:
> On SDM845 platforms DPU device tree node contains child object
> mdp-opp-table providing OPP table for the DPU. Add it to the list of
> properties to let sdm845.dtsi to validate.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dpu-sdm845.yaml      | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> index 0dc16326bf8e..cc95adcf8f11 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
> @@ -50,6 +50,10 @@ properties:
>      maxItems: 1
>  
>    operating-points-v2: true
> +
> +  mdp-opp-table:

Is there another kind of opp-table besides mdp? Node names should be 
generic.

> +    $ref: /schemas/opp/opp-v2.yaml#
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      description: |
> @@ -116,11 +120,12 @@ examples:
>                            <0x0aeb0000 0x2008>;
>                      reg-names = "mdp", "vbif";
>  
> -                    clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                    clocks = <&gcc GCC_DISP_AXI_CLK>,
> +                             <&dispcc DISP_CC_MDSS_AHB_CLK>,

What does the OPP table have to do with clocks? Adding a clock anywhere 
but the end is an ABI break.

>                               <&dispcc DISP_CC_MDSS_AXI_CLK>,
>                               <&dispcc DISP_CC_MDSS_MDP_CLK>,
>                               <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> -                    clock-names = "iface", "bus", "core", "vsync";
> +                    clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
>  
>                      interrupt-parent = <&mdss>;
>                      interrupts = <0>;
> -- 
> 2.35.1
> 
> 
