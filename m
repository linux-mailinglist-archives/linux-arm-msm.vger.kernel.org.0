Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E796364274E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 12:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbiLELOv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 06:14:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbiLELOv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 06:14:51 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5227EE0F8
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 03:14:50 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id d14so10318066edj.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 03:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRPUCz44hii/BNTzeye2GjsAv2dWQtwwC8ASpA55GfI=;
        b=bbZtDylhRC370bh91j7hwg6/H82nlQcwYYohKPeafW9EG153hRTuFBwuQ5JLh7C4Gm
         WXEKkfeqdy/NXIWD9EsLp7pyguosTOs46cSdmReHlQhLuBen+lTG37U8/hATAT89aKCR
         57gKWmtnlViEQCgcSJsySTCWpS1vg0L6A1orWk6UUtSCz6uRLeWZX1xQKKJ6OlskPm8X
         sHMBabHkuHdJGa5MOYLbEfWWbyDXlpt19trz6Btd7+dAMcpgDLsyDbFc/YepHzoYBNCt
         nIb5/UD3SUOgWU93U88jmqP7mPxfC+C0Z4pVmw2PCoRYdvGnYnIfy/6rvRNCVxb7+1kY
         O5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WRPUCz44hii/BNTzeye2GjsAv2dWQtwwC8ASpA55GfI=;
        b=1Dz4HnFSOskKiHbpMHEUFATSF3BpN5TplgdxPDL1aRN5w+AlOXzfcWcMHTvOFdlLtA
         KHRIboVR44QoPeN5KXuWNtD84bu1ZsYdBzIqFIf6rchkOXuT6+cwI/AFVcZU2aXFZsER
         NXD/hNUhiMLhwkJfIKfP9BkTJ9HVgBzyBEEWckqjKYI0Aih3gh3vfuHmGg7ujpwP3SNv
         MBzicxWpiC9tocLrshUl9hPeMrclvxPtWwYf9R6EvgHDue4eAvBHN4v7+guq4ODjjPo9
         h0Br8e8SYMNigMD+BLddD912hvWk7YN9M1Fo7GhPbaRdH/qyduKp39JdIfqwmI01YCUA
         wGCA==
X-Gm-Message-State: ANoB5pm1mLPyGPg//XPwX8cDNDsCBv9TyLQBucB/M23sXusNfhQBZVAo
        hYK4FaoSgbQUEYCqvdloff3FGw==
X-Google-Smtp-Source: AA0mqf4Emjm9kf0pyhgnAoz4LEbSGXpW7h5XX4yaNhb7t87z2AedRbcvtV3g2Odu9gdaMcLoRha6Lw==
X-Received: by 2002:a05:6402:4486:b0:46c:cff7:f80d with SMTP id er6-20020a056402448600b0046ccff7f80dmr2309726edb.361.1670238888868;
        Mon, 05 Dec 2022 03:14:48 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id g15-20020aa7c84f000000b004619f024864sm6147784edt.81.2022.12.05.03.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:14:47 -0800 (PST)
Message-ID: <e6f4fafe-86aa-fc50-7bea-842e3caabce5@linaro.org>
Date:   Mon, 5 Dec 2022 12:14:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 02/16] clk: qcom: smd-rpm: enable pin-controlled ln_bb_clk
 clocks on qcs404
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
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



On 03/12/2022 18:57, Dmitry Baryshkov wrote:
> The commit eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm
> clocks") defined the pin-controlled ln_bb_clk clocks, but didn't add
> them to the qcs404_clks array. Add them to make these clocks usable to
> platform devices.
> 
> Fixes: eaeee28db289 ("clk: qcom: smd: Add support for QCS404 rpm clocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
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
