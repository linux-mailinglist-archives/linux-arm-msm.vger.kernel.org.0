Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80A5F5688CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 14:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbiGFM5l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 08:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbiGFM5k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 08:57:40 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 023B6122
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 05:57:40 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id n15so18332380ljg.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 05:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=q4qL646g+dPV/1dAguuPRJHbp+riKG5TWuUodAczhNs=;
        b=bLFBOIfT+FRUTzf2Ks12yMYU4s5V4up/R+PtWt8nbikcgt9NCOKMfeLcdKDhkhwl0v
         91rDCPlPZS7N9fZLgJSZrlP6l5RFxWukCoOwWF/sprACqs8TD/XVCx43j+jP8H3lLGTm
         ZrK3B3B+TDwa/pOdvV2HLijpVWPoPaloRYZU8Fv9moyRt7Kle/xZ8fGEkqi1D4J246oi
         MqyTtkToqlrktl174U3Gbevdic1nFeZ+s+tmH/PvEoNxP0TXIeQkz7lEdjwpa+eGifdX
         0EuUbUfBlUiRf6dAUO9dmot/C/lRCBzbt1gylFiaKKRy/TWVps3SLOE0I7h2k71U94Qq
         lWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q4qL646g+dPV/1dAguuPRJHbp+riKG5TWuUodAczhNs=;
        b=MN8isjJbjmuMfX5eg8UypyRGWr+fzeHHCmR51QB8Wlfjkw0koqJjoYpFGFeUazI1Sm
         /k1GjnJKnyuBDXoNXtYjyqKW4d7LirI4Omex1U1v3WBR2v5ojItRyyjBbzxhNsrtLR+K
         a74wVW/sI7Nt4wenH07qcYVUoj/ZgQQXmZJiKlI97z9ky4AQMGoQU4VwCEpvvrjHvhM+
         IJV18QHKmQXQY+paSu/GYP+DlLULUr8Sa50gwrhgzikSiWjR+ajjP0eiQVRgzdPQp4fC
         R+yxXxLUCX50Z+SZf/71j7zeC4NJT18MBCfnqEzFQsv4CfvcWG998cxQ5gqIdoJBtjAU
         tzyQ==
X-Gm-Message-State: AJIora8ApHQJpq7Fav1oixcoi0jawGspjMr7oePWlD/8JI60I3pgUwTx
        qiCyphM/CgMcTlQLSoi79Ah2eg==
X-Google-Smtp-Source: AGRyM1sxSzE4RVFE/z7AFhVcj2m8K5D5n91eVpcb8YK/KiiDH7f5ktCSCDvDHHo9EBFmBkwiBIRyzg==
X-Received: by 2002:a2e:3215:0:b0:25a:93bb:f801 with SMTP id y21-20020a2e3215000000b0025a93bbf801mr23378514ljy.489.1657112258181;
        Wed, 06 Jul 2022 05:57:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c25-20020ac24159000000b00478f174c598sm6268148lfi.95.2022.07.06.05.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 05:57:37 -0700 (PDT)
Message-ID: <6130f39d-21b6-145d-8e6b-26c2f4b89e88@linaro.org>
Date:   Wed, 6 Jul 2022 15:57:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/7] dt-bindings: msm: dsi: Add missing clocks to 28nm DSI
 PHY YAML
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-7-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220630120845.3356144-7-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2022 15:08, Bryan O'Donoghue wrote:
> Add in missing clock and clock-names declarations to the 28nm DSI PHY.
> When converting from .txt to .yaml we missed these.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

I checked the schema. I think you can drop this patch. The issue that 
you probably saw with apq8064 should be solved in the dtsi, not in the 
schema.

> ---
>   .../bindings/display/msm/dsi-phy-28nm.yaml      | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> index 3d8540a06fe22..9ecd513d93661 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> @@ -19,6 +19,21 @@ properties:
>         - qcom,dsi-phy-28nm-lp
>         - qcom,dsi-phy-28nm-8960
>   
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +        description: AHB clock
> +      - const: iface_clk
> +        description: AHB clock
> +      - const: ref
> +        description: Block reference clock
> +    minItems: 1
> +    maxItems: 2
> +
>     reg:
>       items:
>         - description: dsi pll register set
> @@ -36,6 +51,8 @@ properties:
>   
>   required:
>     - compatible
> +  - clocks
> +  - clock-names
>     - reg
>     - reg-names
>     - vddio-supply


-- 
With best wishes
Dmitry
