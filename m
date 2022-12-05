Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E406642741
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 12:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbiLELL1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 06:11:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231473AbiLELLZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 06:11:25 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F12517409
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 03:11:24 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id r26so15216633edc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 03:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJJtNA+DieBEwpC/PKHHOAVscfQH+d0n40gQGNhN75E=;
        b=WNAD2t8DThcWeghjWuYZ9udO6RGRV6Ak/0SAIKq8RMUBp8NVfp8TXdU1PzTF3J6wWJ
         hQLMd/YwRn+vGFBIvkayQWG4FdPGAOBG00Az3f5MRt/Vleu9RkVY5Gmu+CR0qOUHdAT4
         C5GcDQfgTwGt9G0KGzSBfPj+hES6QhADzjuol9LgiOuhzVK29IotdFD4y+RG+RvtWAha
         2caR+5l1vJVQqJIY2yu7S2edoD13nHJLlkgKhyWZg+pEDQwGdDDcJGVnvFMy1wVYRpmi
         Kcq0rOB9ED1hRYz2RVJNW//lBGLW9jZGuVmvQpNYhKPj0XCZfnRzk2hqbJLqYfb8SaXZ
         JA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZJJtNA+DieBEwpC/PKHHOAVscfQH+d0n40gQGNhN75E=;
        b=tYyGXWySQiBHbWkonR/ldBXtCW6C/VX67rrGoD0d86OHHvUQKyL8mMKhwMVbORP/HT
         w9T6eZCpCNvZHOHaR9Q66kxVsTTenED9qoH5rHOkuEwP0S9vn4/cnkRXzU99BHn2YkzV
         5pt1hQ+3zg8XroFtH2TQJpG9Wpy1Xc55gUzfRHmTF4nBEzhK4Jm2Azxj3w6PYvXJ17b1
         XOUcWnP1by974yw+omfxvOXjfWD7XucRdKIjHkWuphhAaX9fCWopglmzDq8Lui4ITM5O
         AAB23epAf5uQYFbJwvDe7Vc9erqxZNycukR7/7alccHdcZmPaagvpJLTAJVc1d8hlvnx
         7fXA==
X-Gm-Message-State: ANoB5pn6DDGAvZI83PxMXVdQFB8quvObnrQKCKSt95NTjGsZ5Se36AYO
        H5JE74SXD/4uJrwHfo9M6FCJ0A==
X-Google-Smtp-Source: AA0mqf5EzYKW1V6ApqmB0gxMJ4JmVOyNJBS89l9K2WMhS5Rg2mj5MpCg3xW4C+3ZTCXxRQvR+jGSEA==
X-Received: by 2002:a05:6402:b5b:b0:46c:80f3:c0c0 with SMTP id bx27-20020a0564020b5b00b0046c80f3c0c0mr6701973edb.424.1670238682943;
        Mon, 05 Dec 2022 03:11:22 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id fi22-20020a1709073ad600b007c0d4d3a0c1sm2935338ejc.32.2022.12.05.03.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:11:22 -0800 (PST)
Message-ID: <754db8bc-6f89-83c7-f2e4-9d7be9d44f57@linaro.org>
Date:   Mon, 5 Dec 2022 12:11:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8250-sony-xperia-edo: fix no-mmc
 property for SDHCI
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221204094438.73288-1-krzysztof.kozlowski@linaro.org>
 <20221204094438.73288-6-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221204094438.73288-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 04/12/2022 10:44, Krzysztof Kozlowski wrote:
> There is no "no-emmc" property, so intention for SD/SDIO only nodes was
> to use "no-mmc":
> 
>    qcom/sm8250-sony-xperia-edo-pdx206.dtb: mmc@8804000: Unevaluated properties are not allowed ('no-emmc' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> index 2a223ed50102..a9dc318e45f2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> @@ -587,7 +587,7 @@ &sdhc_2 {
>   	vqmmc-supply = <&vreg_l6c_2p9>;
>   	bus-width = <4>;
>   	no-sdio;
> -	no-emmc;
> +	no-mmc;
>   };
>   
>   &slpi {
