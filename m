Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA1A6690A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 09:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239600AbjAMIXK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 03:23:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240378AbjAMIWh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 03:22:37 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE6467BDB
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:19:56 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id v30so30159290edb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gEMfh+dF27C0xo62tkZAvzuYB0w/rh5LuxMqVXfiOP4=;
        b=tKEEvPGU/vILbvjEUsGKE+y58fr5B5UnoSYnuVUzJsdVIPjAhJxIjvbc4zufUR/lQr
         ZU5okt+/pPDgzqL42oMhc9CSMpLJupQl2+/aA5CwRMR4QBRc8YEfqPTjvmATJ01BDADi
         ECutv2pigAHrC6AZ4z7fcofAcPsoP/rnLT9sfxSstShgWLgqS+Jo7ig4nKnidOC0c+3V
         XMr1w6SInTLPGHBn2TZekNOx+ySBpR/nvtaykEhZE8n2C+A0PsbHLmRbGf2oylGcJOpv
         gT9ymNdsJwDuk5GZeF5JuwhrZiJyoLTqKjrrYUlyIasoHsrvL2qtMxy2ECfZsHgAVEKE
         W7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gEMfh+dF27C0xo62tkZAvzuYB0w/rh5LuxMqVXfiOP4=;
        b=1FE9zvGt64yzfM61OImUBnnRGLT5ee/VwlUjpJDoYSPbuK6TS4AnYHLsb0wia1swwS
         fq80yEyYam+6Nx72442j1nIpvXUMLLwPT94MGK+Ny71MtCJSEPHddJUJJnGfBoPrS1I2
         1sqfKqqX+B1/PJ/QkWZ8/Ae0j5CRPCuYcBBw7pG6lKDxC+8PEVH6ap0x+zYCMgwU3NgN
         FP8Cabxkg6ma/44gbGerbIxSnO7yTqk+UPRKEQ6vKkFPvt1musvgxM6g33Vw3ey5sXwQ
         8Nn1gorBfWXuI3Z3ik1K8CU444pIukKAihtw0h2tN4nXQfG7ja7udjzOfpZ4z5qBEg/Q
         OQZg==
X-Gm-Message-State: AFqh2kr8Nuc2fOyknLx8/5/V3YTYQ86kVu5OST/5GXTagJugfMhsSVYr
        MB0ZnzHM7TwoUK91SWhEDbqlxg==
X-Google-Smtp-Source: AMrXdXuG+6vUC/ezf8jXIZPukwxqiok49NrKM7wXJ0H4rLQF0PxPRmIXAjqmoyXms1cRuzbpAF5QYA==
X-Received: by 2002:a05:6402:128a:b0:499:bec6:f492 with SMTP id w10-20020a056402128a00b00499bec6f492mr14319415edv.36.1673597995335;
        Fri, 13 Jan 2023 00:19:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id kt7-20020a1709079d0700b007c4fbb79535sm8307824ejc.82.2023.01.13.00.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:19:54 -0800 (PST)
Message-ID: <53fd44f1-513d-35e8-0471-854fbf2f10cd@linaro.org>
Date:   Fri, 13 Jan 2023 09:19:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: add display port audio
Content-Language: en-US
To:     Judy Hsiao <judyhsiao@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230113062229.774871-1-judyhsiao@chromium.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113062229.774871-1-judyhsiao@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/01/2023 07:22, Judy Hsiao wrote:
> Add DisplayPort sound node and lpass_cpu node
> in sc7280-herobrine-audio-rt5682.dtsi.

This we see from diff. You should explain stuff which is not easily
visible, e.g. why you are doing it, what do you want to achieve.

> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> 
> ---
> Changes Since v1:
>     -- Fix the commit message.
> 
> 
> (no changes since v1)
> 
>  .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> index af685bc35e10..69e7aa7b2f6c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> @@ -33,9 +33,22 @@ codec {
>  		};
>  
>  		dai-link@1 {
> -			link-name = "ALC5682";
> +			link-name = "DisplayPort";

This change is still not explained in commit msg.

Best regards,
Krzysztof

