Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFF466AA9C5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 14:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjCDNGK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 08:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCDNGJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 08:06:09 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A841EFF8
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 05:06:08 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id n2so6944043lfb.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 05:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677935166;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6uq21K4mlgmuVbmbia6nvMnsvaMNAUcWzk5u6gNBMc=;
        b=s3DLZ7hoPo78sIJmEZnADa7Rbc7OXw8I1j1RtegUHXpuLeqH5cyph1rgDN/dIxFKAY
         V5nyg5IRE7o8oTlIA42bt6XuxlPuAvhIDenyN2/eNktBal73fFXYL4/9oSHRvm7orRwk
         JMbpjszhw3WY4VU540GLy1GMx7hqkDWSskkYvZm1bhTOC2Qf5PzZrSun3yGgxNGeIQer
         adGlKgeTUrT3s9Y5MqA9AlaDFdDTsQDucKGH9naHe7sdHgt/Uyzfv/3I+Kg67k3o0Sof
         4/ZYNZsajZc05soBD1J7NMG4pkGypbHq0ABxlNo/KR5qA9RAjwlL8vnYYP1B7qRJq5mr
         /n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677935166;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6uq21K4mlgmuVbmbia6nvMnsvaMNAUcWzk5u6gNBMc=;
        b=26CdPuRXP9N+7amn4nLDBVG7YUSjo7pVZUFyubN8KRQuxXc/pDY4hToLvT4cY34FCD
         wgsbM1yENqu5Io25YKaOtrSkwECfXxw+3vk+pf9CcG73sp4hkA0JC51PyUKYlL4/L5SY
         YjkAzBX6bZzdoND4jz9cZi/7dSzAJzxRDWVTmf3PuqpraabhusVY+RNN37su4xyiP3O9
         8/TVmJFg0fMJhs19NH7GUPSbAK6uyOQzOQjSRXdjCCn/KwoXH7mfQuAGzVYB+pg/2PRi
         o0BwVBIoFfA5s1i9etFdzgpxT5DYZ1o6nc8ugQ/km26BdckdF2PedyuIHvbThAhKI0DV
         kMLw==
X-Gm-Message-State: AO0yUKXBxPntnxF9epofFD779zb/zFCpkPz2dNKxsa/JgcppNVN4UcxV
        cHZefdqfLGV2Dts6mPiQ3f3T2A==
X-Google-Smtp-Source: AK7set+1TI7JCc3WjUTQ2SCl4QVTGQqrYGTlKKwweXbrg2hW6se2MOfEv5hn4xrm03XGqu5KgwK04Q==
X-Received: by 2002:ac2:52a5:0:b0:4db:c2b:b7a3 with SMTP id r5-20020ac252a5000000b004db0c2bb7a3mr1420818lfm.24.1677935166156;
        Sat, 04 Mar 2023 05:06:06 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id u2-20020ac248a2000000b004cc5e97d356sm827286lfg.148.2023.03.04.05.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Mar 2023 05:06:05 -0800 (PST)
Message-ID: <0b9d66cb-ec7f-5843-22dc-1624419f6ee6@linaro.org>
Date:   Sat, 4 Mar 2023 14:06:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: fix USB
 maximum speed property
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianhua Lu <lujianhua000@gmail.com>,
        Katherine Perez <kaperez@linux.microsoft.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230304130315.51595-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230304130315.51595-1-krzysztof.kozlowski@linaro.org>
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



On 4.03.2023 14:03, Krzysztof Kozlowski wrote:
> Fix typo in USB DWC3 node maximum speed property.
> 
> Fixes: a41b617530bf ("arm64: dts: qcom: sm8250: Add device tree for Xiaomi Mi Pad 5 Pro")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts
> index 24fc29f0ee5e..6bd0dda8b6e9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts
> @@ -595,7 +595,7 @@ &usb_1 {
>  
>  &usb_1_dwc3 {
>  	dr_mode = "peripheral";
> -	maximum-spped = "high-speed";
> +	maximum-speed = "high-speed";
>  	/* Remove USB3 phy */
>  	phys = <&usb_1_hsphy>;
>  	phy-names = "usb2-phy";
