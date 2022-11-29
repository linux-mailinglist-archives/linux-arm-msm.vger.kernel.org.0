Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA16E63C0FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 14:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbiK2N15 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 08:27:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbiK2N1y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 08:27:54 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF6B1581D
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 05:27:53 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id a7so16923827ljq.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 05:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+PmRFYGyYdbomgXkit0MMs8ehV3RXkJmrU7GDKsG78s=;
        b=VUePx4qvECkqnQ0YIPu5364NXyE5UqBSqSzHyJdxpjRT/vrHUlCm54QcDJBtx/YVR3
         TPlaILyOS1afeqagHfWuI7EmETi8QPkJOD9LAB7pvw79gc3xZrew1LpwrR5h8holNvYA
         Uj+57YCdiydcCu2NykaVXVfjBgPdCF94ZPVVF/O8ds6kLveaLWtz3OaD6KF14Qlxb5nz
         OA2JPDcYQ4vXkdVJf7gAOc1bXPE1WRTFLQ8zGdhEWTTzk6VFZTWf43T6B57SUwy/HWTK
         SDLzZYU5qfoSrk/NAqtgaCf+xuPsRfwP86R9boplNkEIuNLU7YpCe48Hb6GW1s4TL5be
         s0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PmRFYGyYdbomgXkit0MMs8ehV3RXkJmrU7GDKsG78s=;
        b=wDVEkI/DQPQHRFsR3PY2+fnMWC5GPIXX0FCMSCO5my+e60ZCobOwptg45SLIP2kp3A
         19GAbAVAVDilfqBT8l5VlMRgO6d9z2rU/ytVgyLcGWOHY0LoeWTXRaAkBjNjGPqs3AG9
         O+cGUMoQBJ1TENg7L4Uvgg6wRCHky4O1S7y3YM9qtqIDvVdV1HyEGoVdjuVk04hGHODt
         flQdDNiXEm+LH+FLEmoYl0Xgzk2ZLSWIO1qMc19FPC/NGHG/IsIaCaYy04wE80hbsUeg
         LUW3G/yXsf+a/zanjKMq8Rq07RQryQTlpS8sMoo5tNuKWnimAirURLjncPTm/8qETG1Y
         p6ZQ==
X-Gm-Message-State: ANoB5pnf7kbaDCad3O53Lq95BfWa6IKXMVq1PpdAVXipNDGXKgKld3P9
        LH0sZZ5ythuLAkboVzeCMoYhig==
X-Google-Smtp-Source: AA0mqf53oo4k2w1P+YWN2jUk9NjBP1cX2xWtpuyCVtH3Pd2T5tAsuNCppvtfwQqwEiNCI5xbcnLMhQ==
X-Received: by 2002:a05:651c:1a2a:b0:277:50d:b270 with SMTP id by42-20020a05651c1a2a00b00277050db270mr18675230ljb.135.1669728472042;
        Tue, 29 Nov 2022 05:27:52 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id e15-20020a05651236cf00b004b4bab7d5a9sm2218491lfs.46.2022.11.29.05.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 05:27:51 -0800 (PST)
Message-ID: <e2ad6aaa-5d1e-bad7-94f4-8092a07a5f2d@linaro.org>
Date:   Tue, 29 Nov 2022 14:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SM6115 / SM4250 GCC and
 Pinctrl
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, agross@kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, will@kernel.org,
        catalin.marinas@arm.com, me@iskren.info,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
References: <20221128200834.1776868-1-bhupesh.sharma@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221128200834.1776868-1-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 28.11.2022 21:08, Bhupesh Sharma wrote:
> Enable the Qualcomm SM6115 / SM4250 TLMM pinctrl and GCC clock drivers.
> They need to be builtin to ensure that the UART is allowed to probe
> before user space needs a console.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 03b61f846a0e..851e8f9be06d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -560,6 +560,7 @@ CONFIG_PINCTRL_SC7280=y
>  CONFIG_PINCTRL_SC8180X=y
>  CONFIG_PINCTRL_SC8280XP=y
>  CONFIG_PINCTRL_SDM845=y
> +CONFIG_PINCTRL_SM6115=y
>  CONFIG_PINCTRL_SM8150=y
>  CONFIG_PINCTRL_SM8250=y
>  CONFIG_PINCTRL_SM8350=y
> @@ -1106,6 +1107,7 @@ CONFIG_SDM_GPUCC_845=y
>  CONFIG_SDM_VIDEOCC_845=y
>  CONFIG_SDM_DISPCC_845=y
>  CONFIG_SM_DISPCC_8250=y
> +CONFIG_SM_GCC_6115=y
>  CONFIG_SM_GCC_8350=y
>  CONFIG_SM_GCC_8450=y
>  CONFIG_SM_GPUCC_8150=y
