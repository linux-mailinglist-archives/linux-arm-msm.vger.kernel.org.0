Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E44777B394
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 10:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbjHNIMv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 04:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233475AbjHNIMX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 04:12:23 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34DEA6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 01:12:10 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52364e9daceso5334361a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 01:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692000729; x=1692605529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yOlqN2SIDIjoDQgKjVR0PYreYqMDorZNPlk5ucFi/gs=;
        b=V8aPKaLYHH5G5hIcqKrL3LFqmoMwjb13yLCt3GUMONmRshh0GqgPuFEZgyj/it21Ax
         Pwlwu6TC+5PrwBmjVle+ZZqcWnXaZO+Qy2u/08nA+DQe0nra/tdOGq9sYuVo7chrFeLo
         TdhWvt5Gveq23PVGWHy3Cyq1npNC/E3auGLR/pFcy7oEqG/qloiAxwe1Op9gXqJrcGuW
         GfrmW8vsi5wk/NbxzhkcjX3lNBJ1uLIvnuZlawr8yQxWRwiW3+ysBR4+Q7o7MnbZTVTl
         xWIFWsLJJOwc3LhrQH5Ev6h6wuaLtf+YUgAEPcJAQPYh67ffA3wLgbX7WdMOzsL8+9UG
         p4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692000729; x=1692605529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yOlqN2SIDIjoDQgKjVR0PYreYqMDorZNPlk5ucFi/gs=;
        b=TVdhjYrW6ClKClB3L+mSLw9NXHS0Uf5YC88Lqbh/pE3994sHa8J6eHufIK0IuvRcDE
         ZpIoiekJ2YtftvBhwrZjx0+W8e5x+uJlFzvoizOzNcXcyjxaU0y1aMoXWtXFvAA/48Vt
         hLEoW5bz2jcmoQyW9HcPR/lG8fWY3xBvtKedwv2tcFiFREludJZPmKWpI7V1ZgwIfq34
         F+RphbJXfOogV1M8PP2cvWFqoGpAhI/W/PaypQPD7BlwOy0bWZczdGu6bUE0Eeq3TOJB
         u1KPb4hIIOtIr6i1qrv6SgYSYFEoEgED66GzvIAdSPVBkGASRc77Vwt5VJvaAkwTxt0u
         wklQ==
X-Gm-Message-State: AOJu0Yzr7+F/2z0SN+JIWbMQbi8COPJvunhcfu+rBF5CCTjsLaVSl5zN
        WwqxQyQCdA/qj6bQBHPxG47Oko7vwZaS0X+T/VUIJw==
X-Google-Smtp-Source: AGHT+IEraEFakynT9uO0TdqXNhOenQt9LeOcqpx2lo7gJ70GIMNSz10bmshkRAPK+QM1HMH/9dAukw==
X-Received: by 2002:a05:6402:3449:b0:523:197c:36e0 with SMTP id l9-20020a056402344900b00523197c36e0mr6649650edc.19.1692000729250;
        Mon, 14 Aug 2023 01:12:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id w19-20020aa7dcd3000000b005224f840130sm5246045edu.60.2023.08.14.01.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:12:08 -0700 (PDT)
Message-ID: <e652935f-d5aa-690b-5558-cdedec322786@linaro.org>
Date:   Mon, 14 Aug 2023 10:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] ARM: dts: apq8064: add support to gsbi4 uart
Content-Language: en-US
To:     David Heidelberg <david@ixit.cz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230812155234.338016-1-david@ixit.cz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230812155234.338016-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/08/2023 17:52, David Heidelberg wrote:
> This patch adds support to gsbi4 uart which is used in LG Mako.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi | 16 ++++++++++++++++
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      | 12 ++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
> index 1f15186dd710..a939b7336506 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
> @@ -233,6 +233,22 @@ pinconf {
>  		};
>  	};
>  
> +	gsbi4_uart_pin_a: gsbi4-uart-pin-active {

-state

> +		rx {

rx-pins

to match other bindings, even if these were not converted to DT schema yet.



Best regards,
Krzysztof

