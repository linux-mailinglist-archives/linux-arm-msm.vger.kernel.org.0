Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68E36662368
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 11:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbjAIKqN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 05:46:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236912AbjAIKpt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 05:45:49 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1D027A
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 02:35:50 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so6884863wml.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 02:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OrpVU4MZmc6u9aMkODiqxRcki11h8mfbJpfMuPKrKA8=;
        b=aZF6KdQhr2X4RgS9TmMTwUVa6+052n9heGDLdsGxuO1McASL6DCbktA9Y7/IXXF/Ok
         K0p6ghXkK55Q53GHwI53k1cCHs6m/qzLdu0oaC9xSdfnT+FSHEecwXGmk38VUlVJr3fu
         A26KnD/IdGtq7xmoifTlUpvTfN5xMc80MUGlukOc+2OlNKB2tjW7MFpAq3KBX1UFialB
         96c8rmi6z31pr+bTKYxCAhg1PazBse2QeDBahptI5DAL//0cOaRLRo6gTJjfCJC3m5k+
         ApjqoUXAEeXMJPUsWSD7OV4jLID8ROh8r2fzaU59aatSgxuw9HrT/pc0vwJqJNHYAOku
         PLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OrpVU4MZmc6u9aMkODiqxRcki11h8mfbJpfMuPKrKA8=;
        b=RAaWTuFVAeOCB7nVYxYSByq1i6AI3VGW/ogGGE/NmxfOjj1OQLkkD1IQ47iH+SOYlR
         vGGMseWfVuI/ld51lCHWbdv+Ot7Sba45snimRiV34sWmCdomo+a6wJd7FIMKudFhqdLN
         FFf45q0aN16ew6jJpTAuYhEwwd38J61YepJe0tNKRChctDgvPi4CReWNPl4zHueaHMXh
         LjCyWp6ub37bDGosMdwv67YAZ9Jg/pwpW/QfHk9ivtwD80tIqbCYNne5NcxMC+JvnoXn
         yxbxH53YYdzKUIlog+34whptPKOQOXAUxSeJ+c1sY49VJLCm45BglzNdiZSorQOLQPM/
         hsBg==
X-Gm-Message-State: AFqh2kpOc6TmodjBFiTsBUSb8GxJCa58fzfn4jXsZ32MOp2xJpU/Pf70
        mqKeEBB8zmipH08HZpkqV/o/Xw==
X-Google-Smtp-Source: AMrXdXsjNN4d6Xoga/zvpCLRou4KpmfA/6zYaF1p5hGNOapZQ7rYUOsu/iLTnxEj70GtEpssJoBD/g==
X-Received: by 2002:a05:600c:3b22:b0:3c6:e63e:814b with SMTP id m34-20020a05600c3b2200b003c6e63e814bmr45631533wms.2.1673260549039;
        Mon, 09 Jan 2023 02:35:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x14-20020a1c7c0e000000b003d9f15efcd5sm2188033wmc.6.2023.01.09.02.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 02:35:48 -0800 (PST)
Message-ID: <3414e686-9f8d-a29d-6cc1-f073b70a9f1c@linaro.org>
Date:   Mon, 9 Jan 2023 11:35:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/4] dt-bindings: display/msm: add core clock to the
 mdss bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230109005209.247356-1-dmitry.baryshkov@linaro.org>
 <20230109005209.247356-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109005209.247356-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 01:52, Dmitry Baryshkov wrote:
> Add (optional) core clock to the mdss bindings to let the MDSS driver
> access harware registers before MDP driver probes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,mdss.yaml       | 34 ++++++++++++++-----
>  1 file changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> index ba0460268731..0647fc5a7d94 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> @@ -45,17 +45,11 @@ properties:
>  
>    clocks:
>      minItems: 1
> -    items:
> -      - description: Display abh clock
> -      - description: Display axi clock

Not related to this patch, but it is a bit surprising to see AXI clock
optional.




> -      - description: Display vsync clock
> +    maxItems: 4
>  
>    clock-names:
>      minItems: 1
> -    items:
> -      - const: iface
> -      - const: bus
> -      - const: vsync
> +    maxItems: 4
>  
>    "#address-cells":
>      const: 1
> @@ -69,6 +63,30 @@ properties:
>      items:
>        - description: MDSS_CORE reset
>  
> +oneOf:
> +  - properties:
> +      clocks:
> +        minItems: 3
> +        maxItems: 4
> +
> +      clock-names:
> +        minItems: 3
> +        items:
> +          - const: iface
> +          - const: bus

BTW, sc7180-mdss uses here ahb name and calls it "AHB clock from dispcc".

SM8250 won't match here either. Maybe this should be reworked to specify
limits here but not the names and actual clocks? IOW, drop entire oneOf?

There were a lot, a lot of changes to MDSS/DPU bindings recently, so I
am really loosing track what is done where and when.

There are also few separate patchsets from you on the lists. Could they
be combined into one cleanup?

I understand that sometimes new cleanup is needed after old cleanup
finished (I had the same with pinctrl), so it is not a complain.

Another problem (and this time I complain) is that several of your
patchsets were sent, discussed and then without any notice applied. No
message that a patchset was applied to some tree. Look:

https://lore.kernel.org/all/20221124001708.25720-2-a39.skl@gmail.com/
https://lore.kernel.org/all/09ed16e1-4af2-8fce-dab4-f6c0f09e688c@linaro.org/

Nothing. Silent application. If you are the maintainer which picks up
the patch, please always, always send message that they are applied.
Patchwork does it automatically, b4 can do it easily as well. If you use
other tools - use other tools for sending it. Otherwise things are
discussed on mailing lists, receive several comments and there is never
a resubmit but instead they show in the tree.



Best regards,
Krzysztof

