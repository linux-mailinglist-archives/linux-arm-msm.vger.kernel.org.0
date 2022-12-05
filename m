Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92261642E23
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 18:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbiLERE2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 12:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbiLERE1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 12:04:27 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05649167CD
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 09:04:26 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id d2so8609165qvp.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 09:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xtp1DFCExYO4BKeGjL24snZbI7LW8EOj2NIdZUXHX8s=;
        b=NEGl/4YE9OyKD+lQJwgsMuwmlT8ToOihsGh5EOjkt5eIFbpdB3eBoHQ1RLYwGW+LGY
         rsGwDTo1PfGCWKHs53XyJYFstObp6ifkPeSjxz02IKQ0yVwU266y22jNO/nLcmjzIt3y
         ghcMQhuiNVHUkIOr3NzUAZPoXTIU/VnlNN+dUdlXV+IemWcchM4Y30km4WeaswA5KCij
         cbt1JKvktrjpQABlFiWtmHbkdWDuvkmN9bc72pggR7FsUofcmNZsEq/WmGifE0b6yahC
         2z2/tr91S5o/Ctn9AG5ioVnr0NQX0padVNrcktWXzATBbHZO1nsPVyCVcgrh/YIaX02y
         UMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtp1DFCExYO4BKeGjL24snZbI7LW8EOj2NIdZUXHX8s=;
        b=cbVrSurSveYgIBNwXCg0e70VZ7xv2GAWPpue8BcxwVuUP896DVw6ZsIFr00fitFoMt
         ZZOH8h62/mPyqvUnr8TG9Pri0ki/hy9Oq3TiSqGKQjmD08llboJ35KtkyTR2EnLDMA9r
         uIYLzVpUnb2Q5M5DMfSH1PAb2PNc51VUdq69/iXuCy/oJJPnPGHbuF/fhCoGPzFunrfw
         y3Wc0yxHWiU6qQP3xjh7CZG0pRCESRHCUNDvP/plx9vesq1WGkGjTG7Yc8zZyV/FX11r
         tMcHFwdh8xBPLw7Ey6nBCG6qfMdZNimkZDF3SzxVKEDJWzuzk0NsecfIwa5DM52pPXUs
         AYYA==
X-Gm-Message-State: ANoB5pkO6ZuCXEtXLeseguoAXqOl6U39sv2Dc9YF4vgkzxfWvDBj/cV7
        alQ3MKGI+9iNlh5RK7hz8+CSVG+sMhPBmTDW
X-Google-Smtp-Source: AA0mqf5Bt2Q/cNa03DOFpihm9ooRndYkO41zh9BRDVyG/3S7XVimz1tCWE4Ay+LrBcl+F240uaMQBg==
X-Received: by 2002:a05:6214:5982:b0:4c7:2a8c:5cd6 with SMTP id ll2-20020a056214598200b004c72a8c5cd6mr18387631qvb.113.1670259865076;
        Mon, 05 Dec 2022 09:04:25 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id y26-20020a37f61a000000b006fc62eabcc9sm12111568qkj.134.2022.12.05.09.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 09:04:24 -0800 (PST)
Message-ID: <b79a262b-3c74-0664-4ceb-393b84776c95@linaro.org>
Date:   Mon, 5 Dec 2022 11:04:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/16] clk: qcom: smd-rpm: enable pin-controlled ln_bb_clk
 clocks on qcs404
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-3-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221203175808.859067-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/3/22 11:57 AM, Dmitry Baryshkov wrote:
> The commit eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm
> clocks") defined the pin-controlled ln_bb_clk clocks, but didn't add
> them to the qcs404_clks array. Add them to make these clocks usable to
> platform devices.

This *sounds* like a bug fix, but I think the clocks--although
defined--have been unused to date.  So maybe not a bug?

Nice that you found this missing code though.

Aside from the "back-port or not" question, this looks good.

Reviewed-by: Alex Elder <elder@linaro.org?

> 
> Fixes: eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm clocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c         | 2 ++
>   include/dt-bindings/clock/qcom,rpmcc.h | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 077875cf0d80..877ffda42ee9 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -843,6 +843,8 @@ static struct clk_smd_rpm *qcs404_clks[] = {
>   	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
>   	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
>   	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
> +	[RPM_SMD_LN_BB_CLK_PIN] = &qcs404_ln_bb_clk_pin,
> +	[RPM_SMD_LN_BB_A_CLK_PIN] = &qcs404_ln_bb_clk_a_pin,
>   };
>   
>   static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
> diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
> index c0ad624e930e..46309c9953b2 100644
> --- a/include/dt-bindings/clock/qcom,rpmcc.h
> +++ b/include/dt-bindings/clock/qcom,rpmcc.h
> @@ -168,5 +168,7 @@
>   #define RPM_SMD_MSS_CFG_AHB_CLK		122
>   #define RPM_SMD_MSS_CFG_AHB_A_CLK		123
>   #define RPM_SMD_BIMC_FREQ_LOG			124
> +#define RPM_SMD_LN_BB_CLK_PIN			125
> +#define RPM_SMD_LN_BB_A_CLK_PIN			126
>   
>   #endif

