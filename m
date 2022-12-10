Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7A2648DF7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 10:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbiLJJcA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 04:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiLJJb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 04:31:58 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91AA1D0F9
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 01:31:56 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id p36so10683187lfa.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 01:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q22psyh7vIuSTAyo+VTH/u5gOPrXWBAWUyVY5G37HJ4=;
        b=IByPJGZusV+y4+L58Wx24wQ3AxHtMKJGLEt8/IYcCkAStjCFT2UQsZ/IBbAoPwXDz/
         YE3QOgtZUdY0Z77kEU1tScwbAZc5IAe4yKUUTNFCzR8UB2zl2DZTLLkAb8ic77L1yu9Z
         AX18YA0dmOSTttrhVpJeMCD2k0j0bnSwMXTOrKhO3U0AgoZtKgYjOARQGKh7QnHYeWVr
         ZJZwSpUvkAxqRtSN0chdrhGnb9TGBB0hiAEDSexgh5eNXFLPToJFAg12yEijpl3FLC0t
         Doj3kk8OkPOz4CcKUvh73ie/mOGGQRipm4fVmRx9P/knHu915x3OeiyuJEqNy7nv4tKn
         s9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q22psyh7vIuSTAyo+VTH/u5gOPrXWBAWUyVY5G37HJ4=;
        b=EsLAbGcTYSbEP/PpiZhJLwLHVuXBDlhINB2Kn4OtuZxTrkJwLAauyA3XfTXjHcqVni
         RGBy5v551N/VINcZkzPLkMxZxDt0L4AX2kTSK5j3Jng8KveDPvQUS9HXkX7E5ByFNLCf
         fGNrsRfckMjSISCp9vDIo1ucVGQBbVTdhaxGBQYQQ6J01wDomcECTPWUFFNHN/2QbqMV
         93/Q1rXC/9H7GDeB5kqy3xNNxjcstQln3W9C2DG5F6WHDfRgdzEsVLl3tueizm+FQlS6
         Nb29wNhq1qdHfeUgUqtKLiLHg+2HKnTxFBC6/ccwT3p/876A4pjUYCV4O8jsECgE6PmF
         kRLg==
X-Gm-Message-State: ANoB5pkbJnBVw5rr/1Fj1y2CIwtKmG5EN0e3o5bIg6IPka+y34gHaM3P
        bd7CUyKZjPPSGNujzo6zJjAqxw==
X-Google-Smtp-Source: AA0mqf5cBUGRW0tkcAXfALEyDIFlijX6tAjRld5gC/6BIXWWq9sBRCjqmUtNdkImfcWqMp4Il3O6Fg==
X-Received: by 2002:ac2:47f8:0:b0:4b5:5da1:4bcb with SMTP id b24-20020ac247f8000000b004b55da14bcbmr3601239lfp.13.1670664715064;
        Sat, 10 Dec 2022 01:31:55 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id w20-20020a05651234d400b004949a8df775sm652098lfr.33.2022.12.10.01.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Dec 2022 01:31:54 -0800 (PST)
Message-ID: <5013a8f8-2c2c-f298-b397-8dc6b1944b31@linaro.org>
Date:   Sat, 10 Dec 2022 10:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] arm64: dts: qcom: sm8150-kumano: Panel framebuffer is
 2.5k instead of 4k
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221209191733.1458031-1-marijn.suijten@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221209191733.1458031-1-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9.12.2022 20:17, Marijn Suijten wrote:
> The framebuffer configuration for kumano griffin, written in kumano dtsi
> (which is overwritten in bahamut dts for its smaller panel) has to use a
> 1096x2560 configuration as this is what the panel (and framebuffer area)
> has been initialized to.  Downstream userspace also has access to (and
> uses) this 2.5k mode by default, and only switches the panel to 4k when
> requested.
> 
> Fixes: d0a6ce59ea4e ("arm64: dts: qcom: sm8150: Add support for SONY Xperia 1 / 5 (Kumano platform)")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
> index 8f1ddc969406..9f48a097927e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
> @@ -35,9 +35,10 @@ chosen {
>  		framebuffer: framebuffer@9c000000 {
>  			compatible = "simple-framebuffer";
>  			reg = <0 0x9c000000 0 0x2300000>;
> -			width = <1644>;
> -			height = <3840>;
> -			stride = <(1644 * 4)>;
> +			/* Griffin BL initializes in 2.5k mode, not 4k */
> +			width = <1096>;
> +			height = <2560>;
> +			stride = <(1096 * 4)>;
>  			format = "a8r8g8b8";
>  			/*
>  			 * That's (going to be) a lot of clocks, but it's necessary due
