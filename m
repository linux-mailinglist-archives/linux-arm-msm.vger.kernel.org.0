Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8F17B024C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Sep 2023 13:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbjI0LBK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 07:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjI0LBI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 07:01:08 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A20CF3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 04:01:07 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40572aeb73cso76267725e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Sep 2023 04:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695812466; x=1696417266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nPXcOJ1NNfynFMdPPMa7O3rR4NvIIDDgZXJyYh4uLu4=;
        b=k9slxVjDu67LhBRF4EukXo2qP0urAkWrijjTeNEbyQd3t0m6T4nwyGmL0mFhsUvkAW
         0/ghMJxCknzUgk4dUTgFMWbX/goTTh0Z2sltx7dAhNJLknajzoVYffdXYxJFk9YLWevq
         N3eDezO0yGh5vR7Q+6fn/0vfg1EB67h5Klp4pRHO/Co01JVxaWCxqzdAArVpiNG9o2bv
         sRFAq0MyAG+xtbdu0jSpC4RYK0WWjCaQdgXYxYDKrfsiVBU7nS1K495KX71lpr5L5zRn
         rA9gWWWj3oo+vXgpVSKDyTFgE9qgJfuInjNkDMBFMp22BaHRCpAv0njGgW2RW6S8QOYa
         Ge5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695812466; x=1696417266;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nPXcOJ1NNfynFMdPPMa7O3rR4NvIIDDgZXJyYh4uLu4=;
        b=o30nNWLMdCAiOkFNfRlkSejgHhTClITIhJHh/bQBdrsXlxMzeHS2htDQQiwjv24NQR
         ngkJVigAEzMeF7fc6cS/1moGM8tPSgWzVb89lkac5+UdHm0oi9RRUz0QUtjmwlA700jR
         aOlEcxcbBVRxYwr5jhGee0qUw5SrnrbqDDbJ68guFZsAYhIXRzp8R5YTKnYoW3aiR5N9
         t8BC4uM8NuZUUOitzYF+57kJuJt8TXdEjLEZUIfPkkUqiLZB0D5C0QeNTSrhU3+qUqtp
         V60LNgTVWREexg35wySVRxzxUEZYoCV1fIAetgWy9FKr1B/+IuCg+MvtEsm9hPKTI4JY
         9C1g==
X-Gm-Message-State: AOJu0Yzw+jOGCCtrVVqjlcB6grpK0Iz3KVJtMu09aBamF5PTJF08+IKh
        c4fb19J++Ryglj664XIWK2PSUg==
X-Google-Smtp-Source: AGHT+IH/DZlOfmrbdqaypY2t8t+A1qF22x4H5/t02B+tTvUk9hcTKrTZ4u5D/O33X2AKZpabYcmFyg==
X-Received: by 2002:a05:6000:180d:b0:313:f783:262b with SMTP id m13-20020a056000180d00b00313f783262bmr1422844wrh.26.1695812465719;
        Wed, 27 Sep 2023 04:01:05 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c1d9300b0040531f5c51asm17650473wms.5.2023.09.27.04.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 04:01:05 -0700 (PDT)
Message-ID: <8bbdf132-a007-4cb7-b842-a81de7c1629a@linaro.org>
Date:   Wed, 27 Sep 2023 12:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm6375-pdx225: Add USBPHY
 regulators
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230927-topic-6375_stuff-v1-0-12243e36b45c@linaro.org>
 <20230927-topic-6375_stuff-v1-4-12243e36b45c@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230927-topic-6375_stuff-v1-4-12243e36b45c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2023 10:21, Konrad Dybcio wrote:
> To make dtbs_check happy and the software more aware of what's going
> on, describe the HSUSB PHY's regulators and tighten up VDDA_PLL to match.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
> index bbec7aee60be..0ce4fa8de8b0 100644
> --- a/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dts
> @@ -243,8 +243,8 @@ pm6125_l6: l6 {
>   		};
>   
>   		pm6125_l7: l7 {
> -			regulator-min-microvolt = <720000>;
> -			regulator-max-microvolt = <1050000>;
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;

Where did the old values come from and why are the new values better ?

Consider enumerating that in the commit log.

>   		};
>   
>   		pm6125_l8: l8 {
> @@ -430,6 +430,9 @@ &usb_1_dwc3 {
>   };
>   
>   &usb_1_hsphy {
> +	vdda-pll-supply = <&pm6125_l7>;
> +	vdda18-supply = <&pm6125_l10>;
> +	vdda33-supply = <&pmr735a_l7>;
>   	status = "okay";
>   };

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
