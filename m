Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4713D6A8219
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Mar 2023 13:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjCBMZO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Mar 2023 07:25:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjCBMZN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Mar 2023 07:25:13 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23D9460A2
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Mar 2023 04:25:11 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id by8so17388057ljb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Mar 2023 04:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677759910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GbPPdvgbl81ys3ap8uEX2qMCY1kP8nRpGJ6GXrKzFoI=;
        b=z2WVkYAv807rzFITlNl3tsDFzQyC6bAjAoyy6ob8+0HerfH5GTit8rL21fQZzTlMnc
         sxwyW0GwwAFbRjH7nmrEEvIikQw0P4EcUtm5uVOuGE3vOfTtENFLQXZ9yeh/ef4hxj/R
         ejEdqgNine+26qMmci/EK2BBNl0qn/MnRYibUZxucZGaSHMDIn7tNh/ooG2HCSpFjt2B
         EJrWXC7b0xdOJrOnmk9MoVSz3TrOLCGfbn8dpgqCPwYbSBxeclLi3HjVcn9d5OHzEJz0
         UHBuSZP+T/Be9QtFEi0kglXLmDbWv8M0a9yskuC0hKDkni85Dp7k4UkasbMeT+k5S+ZZ
         Qazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677759910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GbPPdvgbl81ys3ap8uEX2qMCY1kP8nRpGJ6GXrKzFoI=;
        b=hDfTNJXgllTelFw3oY45/OgVCtn+/gAUdGnNNz5HT7s/kQCzgz2dno5vmA/jD+WvJf
         uOPQqWVNyTtGG1nhuSuacwAdXILDWgVijzcb0sQI5/Y5GdGceu3bk9Luu+mU/I7NUqan
         7PwyMknS1gx+RTpEfpFIoiYeJAGX1n9Cw/JSWE0DSQBWSyRJ8rzgaBYMSX/Tl9A7ChTB
         MDx2yUf+q0+dgsa+0AysfP5flzGliv3yp+RGRDd2XRUYvcJHp+v/uPFRz3uRtJsO/4aE
         PZ2wYOUgwYSruupMNvOj0wX4ZwyrBl7ScLGeKoQlBS9MvuhGEaEhJP2c3Xiyncb11dFr
         cdlA==
X-Gm-Message-State: AO0yUKX10rjakoUiTivB7ASHLRzRUwqYuS6P2I9KtoG7nbWAV1AF7LYP
        gx67yU7yBV/s+WTuWwEJDVmSsg==
X-Google-Smtp-Source: AK7set/87RLWt3cBrBdRq49rvIkhOzB7K9NHwL1XSm9LVYJsymRS7qLNJMH4TqGcXJYOO/onZquheQ==
X-Received: by 2002:a2e:90d6:0:b0:295:c333:2a24 with SMTP id o22-20020a2e90d6000000b00295c3332a24mr3102611ljg.19.1677759910273;
        Thu, 02 Mar 2023 04:25:10 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id be12-20020a05651c170c00b002945b04e1ebsm2102932ljb.94.2023.03.02.04.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 04:25:09 -0800 (PST)
Message-ID: <b71a2ffc-270f-d74f-6c89-9f3e3c009d05@linaro.org>
Date:   Thu, 2 Mar 2023 13:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sc8280xp-x13s: fix dmic sample rate
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, andersson@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230302115741.7726-1-srinivas.kandagatla@linaro.org>
 <20230302115741.7726-4-srinivas.kandagatla@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230302115741.7726-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2.03.2023 12:57, Srinivas Kandagatla wrote:
> The version of dmic that is on X13s panel supports clock frequency
> of range 1 Mhz to 4.8 MHz for normal operation.
> 
> So correct the existing node to reflect this.
> 
> Fixes: 8c1ea87e80b4 ("arm64: dts: qcom: sc8280xp-x13s: Add soundcard support")
Does it depend on any driver changes? If not, Cc stable?

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 198a81405e6e..d18d405d1776 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -1111,7 +1111,7 @@
>  
>  	vdd-micb-supply = <&vreg_s10b>;
>  
> -	qcom,dmic-sample-rate = <600000>;
> +	qcom,dmic-sample-rate = <4800000>;
>  
>  	status = "okay";
>  };
