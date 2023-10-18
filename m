Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 082F97CE8FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Oct 2023 22:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbjJRUbn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Oct 2023 16:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232677AbjJRUba (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Oct 2023 16:31:30 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A48D5B
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 13:30:57 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507975d34e8so8121910e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Oct 2023 13:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697661056; x=1698265856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PUFmNB1C9eKBrNEGefhzHUl4Gkv1IjDp8gNWoDQwEGk=;
        b=g6YkwfXqwADUSouGWxg8GzFwFWNS3JMsfsZxJ8gEN6JiAiIXNBsMSlw+Zay9ubnBfs
         62VQWUt4Fibk0ozzgeXnmNGWwHYSrbcYnFlogQ4SCGWOr5u1Z8HvbBItop8nT91BMtuf
         8+QeFvuXa8Qc1cq2RFZE8xNF4OMcYpbRL2FA8/o2pMRdAaPC+qjXh0p7F5tIn1AekCdq
         Fj+gJLsAc3Pg8mK+1Ek6ojS36Ju5bkJuRPDeLCBKv+QudDrJUje4MraShy3CF8d0ylG6
         YPde/MG7w3AvEII1lUijAButu/IQOrEGp3VDMyURXJmqeUXcKflU9AFhg1stoA9QmoM1
         aDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697661056; x=1698265856;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PUFmNB1C9eKBrNEGefhzHUl4Gkv1IjDp8gNWoDQwEGk=;
        b=WyyvgaC9rb6jS8urAQ3YcMFEhKDRHSyqZ87qjJNLbjCJEPp5mroXOuLVt5FqWHr8fS
         8E///CmPvgTaHBIoW1B13MNt+GSD1CEXwYOD+fVm5M2cQMI6HSsjTjVNauKuN2OPwxT6
         nsjIoTIdVbvJbWjZbkMDGD9hvUbUia2HpjOptd6tC4qeI7qQ1agi6bXlborRFSqzv4Fk
         wTW2q2BOcK1lzvzqotKOXAjUK03/uuPNe0Ye6qfrlsVAHdAQyRhZumppnwLur9wgP0Z5
         ZB7qMyrl5N97QjDJarAAseThDUKm0ERzqnFr6HQ+tH0D3GJCdNuhMdYP6fNxWpSTybbC
         +cvQ==
X-Gm-Message-State: AOJu0Yxg11+RXyVI19Xc7oKAX/bKwXSN8RJQcicmqbT/BtqqE+swluhB
        e1YrD/XNmIANS6ix68tl3DP1jg==
X-Google-Smtp-Source: AGHT+IHBjUypDmWrqXXAFpTBonvTU/yYmmcDyIk9OSHMujkMEV9jxWpZCCOnXesh0MIXVFwf/+WweA==
X-Received: by 2002:a19:654c:0:b0:507:a8d1:6e57 with SMTP id c12-20020a19654c000000b00507a8d16e57mr73921lfj.40.1697661055845;
        Wed, 18 Oct 2023 13:30:55 -0700 (PDT)
Received: from [172.30.205.86] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id v12-20020ac2558c000000b00507aced147esm825302lfg.203.2023.10.18.13.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 13:30:55 -0700 (PDT)
Message-ID: <5c97da4e-eb7a-47c2-9f0a-69e019a73778@linaro.org>
Date:   Wed, 18 Oct 2023 22:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add PM7250B
 thermals
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org
References: <20231013-fp5-thermals-v1-0-f14df01922e6@fairphone.com>
 <20231013-fp5-thermals-v1-2-f14df01922e6@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231013-fp5-thermals-v1-2-f14df01922e6@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/13/23 10:09, Luca Weiss wrote:
> Configure the thermals for the CHARGER_SKIN_THERM and USB_CONN_THERM
> thermistors connected to PM7250B.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 66 ++++++++++++++++++++++
>   1 file changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 2de0b8c26c35..7fe19b556e6a 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -134,6 +134,36 @@ afvdd_2p8: regulator-afvdd-2p8 {
>   		enable-active-high;
>   		vin-supply = <&vreg_bob>;
>   	};
> +
> +	thermal-zones {
> +		chg-skin-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pm7250b_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
I guess looking at skin-temp-thermal in x13s dts for starters
is a good idea.. we should probably then adjust it to something
more pocketable..

Konrad
