Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CADE162C4ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 17:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232907AbiKPQm5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 11:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239194AbiKPQmN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 11:42:13 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C765E3F9
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:38:14 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id ud5so45508992ejc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 08:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VclT7vvf0dI+l8CkSP/7RjqLFuy9gBOsH5fGyEBkubw=;
        b=lFxi63713nmUAmsMHoYEpbdyTce8URtFcKQKjcE4hQjNOyJkLYd9xL44dcgZKik1mZ
         XE0gxkpefYum0LllqLjuefERIm/vNGLZ3PaCDTTY9gVpbJhrbB7Llx/NZZw0EE0J8AkG
         q5F5hB7FYQXoYWiz324BSXWYzru8MVRygqgdVQs0QLnDYJrObQfbYqpzNOtoW7hcS+JH
         oogCaTY326Z+NWNlt7bEnNtPB4/O+wHljEP9d9JIg7KzmrgxU2gSgfYjeyOVqAH7Zi0d
         EoDbBjWjc3W0WUqQFoyh6Vf8Sj0c42pvZUyXMqM5bViuCtLepz2UOzo7jgHRrSVxbniU
         kLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VclT7vvf0dI+l8CkSP/7RjqLFuy9gBOsH5fGyEBkubw=;
        b=MQkNJhMuXZGtWD6r+qDa/QwmA8VE+RVJAoOrw+R6PMl5kkdEZ/0RmvjvUH9O+xp0tC
         rYJsppxeMwxtiGtPfo0iDHSUVmgdQ2+7dSCLeJwTKBLepa3MzG04e8knrDHtwedlvCLE
         wASSDZ6mtsjtEjfq494WoUhnqqSL/0DeMxA2vqjP4ILBZ4kyTh2n9HsVFRuFs6qQ88BV
         miHnuehBPk+zwI3ad2wieIH1yS7kqSDjWC+NnCRkxf1SKHXj5CRAlcD+BA/uFIiEMxmb
         Cx1U1WRfhWI5w3c3ERGGhkPxDI+dAu7LgWPLd6z2X7atmpQtoRQP4CkE4u41AoAVPf7f
         bOcw==
X-Gm-Message-State: ANoB5pnEIFwV/gMHUuM5WN4gh4vCFEfhxorSv1HAwmOBSO85zC8hz53z
        Q56brLuN+EXDr5EyGURASHj6cg==
X-Google-Smtp-Source: AA0mqf6y42V3OPbz2Rcbi8RdJ+5M6OqD0ZkUoEo/soxiAikCT0tQAs+EMmEHDRO8+W/qeS3LD1TL6Q==
X-Received: by 2002:a17:906:7fc6:b0:7ad:c66e:ad9d with SMTP id r6-20020a1709067fc600b007adc66ead9dmr17684238ejs.413.1668616692761;
        Wed, 16 Nov 2022 08:38:12 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id kv17-20020a17090778d100b007aece68483csm6556028ejc.193.2022.11.16.08.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 08:38:12 -0800 (PST)
Message-ID: <edf7fb9c-8414-8d53-5e28-4241d54f56a9@linaro.org>
Date:   Wed, 16 Nov 2022 17:38:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v6 1/7] arm64: dts: qcom: sdm845: Define the number of
 available ports
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
 <20221116162801.546737-2-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116162801.546737-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 16/11/2022 17:27, Bryan O'Donoghue wrote:
> The number of available ports is SoC specific so we should define it in the
> SoC dtsi. For the case of the sdm845 that is 4 CSI PHYs => four ports.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 1a257f6728874..29e6d64e74c97 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4368,6 +4368,22 @@ camss: camss@a00000 {
>   			ports {
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +				};
>   			};
>   		};
>   
