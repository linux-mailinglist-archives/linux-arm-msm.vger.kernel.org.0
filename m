Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E6E64B265
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 10:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiLMJeI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 04:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234822AbiLMJeI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 04:34:08 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB92E958D
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 01:34:04 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id y25so3923208lfa.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 01:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kmXfRp8+zWW7vcrjP5R8dP/cHgn+D6C7qU8K2sV42hY=;
        b=tf5cvCtxg3RipKpZCMT2eCrMBD2I6e95ldX2lrSPBSZ1pIcDZ4QxORkEaeOHYfDp98
         3/eQi33pKkxp+f5GAWYWpJU2H9xNRXqQ3LyTK+j2xURI1s7YKEERogI5DkFlhSCkpgip
         iH+VAMFUhnIMx2dfYQZ5BbEZuB0tGqphDi9aN8x46ojCUPGbKEyr64cskDwkaw/aFTTO
         UXpv3mUjHcXaetKucXAC/orTELDuub+s+ZR2hJl1FV4gE3lZ+McJyBELZ401msD3zfU6
         i0+EsinQ+f4JONhrZ35QzHPi2lM7z2heQGcJLNzD5T1VWBouNjf/6L8MrM/KwQvILL7W
         kaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kmXfRp8+zWW7vcrjP5R8dP/cHgn+D6C7qU8K2sV42hY=;
        b=DPbKYxq+sfyRvX83gvNbEIlm80ptRLV6bGHn3zifG2orsredcbN9nLbG8EG2qzKTB5
         /zWQxm1fQranbD9wa0TdpefdapcIipoZYHdh4ebBEkcNBAUut7d1otkgDEwSHM54vOxV
         kLjBV6gEQ9+48IPhlJN8iNrRMqly/dYtWDGxQ7o4vravWr7hep8c+Mo3IfA/zt1gU+yK
         qnPuVLZ5tuj2LFWIyQsXJamhOGN64tttB9p74wq4r2/T6d5l66r37fwZJBf0aMbxOYsI
         PPzSGvImKVOaKNx8Phk2++ZPdzm2Zf7nM2/yxO6iAWm5e0FOlmxq5o3OPqo7XMAqdOWi
         k+IA==
X-Gm-Message-State: ANoB5pneQCPyYS/VyJq/EbdRzI09ILBnIoL316D3p4dv9uQCUONPGbE5
        7gqYaAjM4TOz3eS54FeyfQ9fpA==
X-Google-Smtp-Source: AA0mqf52jIdmRc18RlMNwbjzET3m41DOMkwgsZPAeb3pbLq8ANlMfAq3jp58jxXF6P5wQ5v42NGL/w==
X-Received: by 2002:ac2:4474:0:b0:4b5:9365:cd4f with SMTP id y20-20020ac24474000000b004b59365cd4fmr4643502lfl.42.1670924043214;
        Tue, 13 Dec 2022 01:34:03 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id h10-20020ac24d2a000000b004949a8df775sm292226lfk.33.2022.12.13.01.34.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 01:34:02 -0800 (PST)
Message-ID: <784f0f72-2058-67cd-b79b-4418eb6df28d@linaro.org>
Date:   Tue, 13 Dec 2022 10:34:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 08/12] ARM: dts: qcom: apq8064: drop second clock
 frequency from timer
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
 <20221212163532.142533-8-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221212163532.142533-8-krzysztof.kozlowski@linaro.org>
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



On 12.12.2022 17:35, Krzysztof Kozlowski wrote:
> Keep only one clock frequency for timer, because:
> 1. DT schema does not allow multiple frequencies in such property,
> 2. The Linux timer driver reads only first frequency.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 79575d6b3a81..9da6459c9f67 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -381,8 +381,7 @@ timer@200a000 {
>  				     <1 2 0x301>,
>  				     <1 3 0x301>;
>  			reg = <0x0200a000 0x100>;
> -			clock-frequency = <27000000>,
> -					  <32768>;
> +			clock-frequency = <27000000>;
>  			cpu-offset = <0x80000>;
>  		};
>  
