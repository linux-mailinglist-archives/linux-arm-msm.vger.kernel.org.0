Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64F8F7D5DE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 00:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234958AbjJXWEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 18:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234965AbjJXWEb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 18:04:31 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F127D10D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 15:04:28 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32caaa1c493so3502071f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 15:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698185067; x=1698789867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xm6naDr1rTNZvNUTEVOYouG/IOYziSzzh6iZJbKf1vM=;
        b=x+6+PTTXDvq793+M5PgagJIXjObvQWrTYWBpMjFxgMzN+tOidKsiIEe2mHqbQUXZfL
         5BOuwWcC6Qnrw9F1OjE/kLJ+L1S5XaL7qkx8XMh5+wWdGq25A12XMu/dVzJQz2ZCUlfr
         fV4zAZtnbjfxVMihNsZ4CjC83RFfL5Pt1UiUFA6fSBu829aV5h+XggyuNKjEMxbj2NLv
         UzE0PSPoGKwymIqPv72erk9SPFY0jsDrDC5i/ZhEm5R2FumDYgxw32wsqurS29NJ5H9+
         H6lgoefDBUhaPiM2LmNUzCSVtVJ7h+ez2OMdpm9KpYCf+xVV7BAro+0hwuP06aMpTa8n
         AzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698185067; x=1698789867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xm6naDr1rTNZvNUTEVOYouG/IOYziSzzh6iZJbKf1vM=;
        b=VC07bKausHWumr3E5u0dQPnABkdUiwr4isIKALYCe2Ond/bdfwLzkdc72opw6Y+qN3
         3vdL79pBj0G3XaWflTMp/6gvJd12HV+X7koqjri5S88N/95xdOs8XY+T5h//RU/Me+Dq
         YdAaaneQVJbpwAOacGlsO7z357bjilqxOklZTDMYMWFPJrg3eFCAaopxXeFxdl77uV+v
         gfqHG66feNI/ZRqBOf01tNa2+uUbMNlOK5dS+OD/8HazTorZBiL3hB5Aa2NyyHUt1Swx
         20yGN+7sBlkRWwUyHVFdxxLgCq0n1GeoEfo4mAM/ZlPlmsFGuno0gVbpIFZSBCxiU/Sp
         v5zQ==
X-Gm-Message-State: AOJu0YydACUjZho5O9u5oNpNVaVb3qptky6SANnZ4XGp6kC56x2VNUxd
        QUCFU4IPHz9WGT21IEhXfmVokg==
X-Google-Smtp-Source: AGHT+IEFQ/ryrgfd5i9n6ECMD/61fOINkDoTuy3AgqM6/AtNJBVqlG41OswiRgTgxPX/3fb0X/5fug==
X-Received: by 2002:a5d:664a:0:b0:32d:b06c:b382 with SMTP id f10-20020a5d664a000000b0032db06cb382mr9649627wrw.39.1698185067399;
        Tue, 24 Oct 2023 15:04:27 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id k12-20020a5d518c000000b0031f82743e25sm10685503wrv.67.2023.10.24.15.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 15:04:27 -0700 (PDT)
Message-ID: <f2378b1a-55a8-40bd-9284-16e1dcd06ff6@linaro.org>
Date:   Tue, 24 Oct 2023 23:04:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: starqltechn: remove wifi
Content-Language: en-US
To:     Dzmitry Sankouski <dsankouski@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20231024154338.407191-1-dsankouski@gmail.com>
 <20231024154338.407191-4-dsankouski@gmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231024154338.407191-4-dsankouski@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2023 16:43, Dzmitry Sankouski wrote:
> Starqltechn has broadcom chip for wifi, so sdm845 wifi part
> can be disabled.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> 
> ---
> 
> Changes in v2:
> - none
> 
>   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index d37a433130b9..6fc30fd1262b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -418,14 +418,6 @@ &usb_1_qmpphy {
>   	status = "okay";
>   };
>   
> -&wifi {
> -	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> -	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
> -	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
> -	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
> -	status = "okay";
> -};
> -
>   &tlmm {
>   	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
>   

A good candidate for a Fixes tag.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device 
tree for starqltechn")

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
