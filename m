Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85BBA649A92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Dec 2022 10:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbiLLJCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 04:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231617AbiLLJCK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 04:02:10 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736746317
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 01:02:09 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bp15so17391385lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 01:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nT+fTSiNEy076PIbhJFRV1A6o5d0WiMbc6l3dVRr41A=;
        b=RFgwm/cYJ/MKwzKJjrGeAeYW6nBdDBwKPfVj2nYzySQT+u2RLvP33lrd0LLKvSaCr1
         OfG04MbzuROrjABxBmITOLJmt/5qcIxWbh5Gmj3PYXme9PU6wynxv945JTJPpwwa+NYx
         icKlCsgMLmbEZ7tUVzgyvD8yWqm8QJ4e+2a7A2l4KZFDHfVvDWHQdIaJ6C2yfNw7Rdsr
         XTFn+R0O3hb/zDb2NwYgfRP78FnAp9YsM9UWGxO1/fKXg6QTGXhjVSIIokMAbY9yHVIp
         p8fJ1qnQo0gY4W76Hd0QGzmudVBq2iBc77CNUmNfJwJ8HbXHCCCzs6vQXFIiSX3HQ+9V
         IGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nT+fTSiNEy076PIbhJFRV1A6o5d0WiMbc6l3dVRr41A=;
        b=W8vYYtzIduCxBV1xVBefs+Ig6xGI2iaxqW7dqAtWqUSAS+mKhQh2aj49jhcaDRo0jp
         HrmuMucbEatUYnkvsRVC7yuQqcrvWapXZ+IxRZIurzlUjcK4PkeT/eerYMojT7j6vp7v
         oXlhAr7h3SGfQVbpJSbCyjlAwjoHRRvNaY4Dkae0x1j4yJIvUJGPfH2SPnGbUWonurAo
         aui4wKPQ7vxKTGmrDG9rz24Z99Ju/IqS8OiJz4w9N76GJKtrp1cpqZ2QI49jJF/RSOAv
         7DSo/IZTx3YLP9wbQrKduZHhjEXe++QJzoB3+Bcu83EQUjSxsSKo+/s1tyrusp+108lX
         em6w==
X-Gm-Message-State: ANoB5pn/2bOav3IRmNw0G99L/qf2EYSw+uScf76LyN7enqCM+OZm3fTO
        giZHf7b6pWWP/8hPctoj0CS2uw==
X-Google-Smtp-Source: AA0mqf59PGli4yWjF/5ayPHQfllE7wwGnHgUum7RR7Zmi5+4bP2uLFeM0X6wlf2o+QeuqQgQ2+6JvQ==
X-Received: by 2002:a05:6512:12cd:b0:4a4:68b8:f4df with SMTP id p13-20020a05651212cd00b004a468b8f4dfmr5722963lfg.37.1670835727816;
        Mon, 12 Dec 2022 01:02:07 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id a19-20020ac25053000000b004b5789ecdd7sm1534979lfm.274.2022.12.12.01.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 01:02:07 -0800 (PST)
Message-ID: <788b1b55-ef4b-955d-d091-d4edb98c4775@linaro.org>
Date:   Mon, 12 Dec 2022 10:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/1] arm64: dts: msm8992-bullhead: add memory hole
 region
To:     Dominik Kobinski <dominikkobinski314@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     pevik@seznam.cz, agross@kernel.org, alexeymin@postmarketos.org,
        quic_bjorande@quicinc.com, bribbers@disroot.org,
        devicetree@vger.kernel.org, petr.vorel@gmail.com
References: <20221211100501.82323-1-dominikkobinski314@gmail.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221211100501.82323-1-dominikkobinski314@gmail.com>
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



On 11.12.2022 11:05, Dominik Kobinski wrote:
> Add region for memory hole present on bullhead in order to
> fix a reboot issue on recent kernels
> 
> Reported-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Changes since v1: 
>  * msm8992-bullhead instead of bullhead in the commit message
>  * memory node named "reserved" instead of just "memory"
> Both suggested by Konrad Dybcio 
> 
>  arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> index 71e373b11de9..37bcbbc67be5 100644
> --- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> @@ -2,6 +2,7 @@
>  /* Copyright (c) 2015, LGE Inc. All rights reserved.
>   * Copyright (c) 2016, The Linux Foundation. All rights reserved.
>   * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
> + * Copyright (c) 2022, Dominik Kobinski <dominikkobinski314@gmail.com>
>   */
>  
>  /dts-v1/;
> @@ -50,6 +51,11 @@ cont_splash_mem: memory@3400000 {
>  			reg = <0 0x03400000 0 0x1200000>;
>  			no-map;
>  		};
> +
> +		removed_region: reserved@5000000 {
> +			reg = <0 0x05000000 0 0x2200000>;
> +			no-map;
> +		};
>  	};
>  };
>  
