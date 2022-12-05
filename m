Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1DDF642E3E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 18:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbiLERFy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 12:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbiLERFa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 12:05:30 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150B7186CC
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 09:05:29 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id c7so7946164iof.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 09:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+p0wqYJ6pw0YxrRfWy42OQ/okHI3uwlxMX7GdjRJCg=;
        b=FQi1aqWhMfONosWo/At/2ZnD6uk38pzomUYipOjsju1XL/6YKM8mx5O2Cx6nl9VDny
         ZRFgmHqTwx0rvv8PVizMC1zvlWJmjmbEyEsm9UulffN7acycr8QbAMEtdmqaXbdQGf07
         IDDw1PKhFj9pnciuE7JEEuGUN5aquSzwzJtpnhN/enUWZFSFAYd2HRsUsjkgYDyNN8kY
         bDQlrZvp9SM1pGA68duuIuLBY9l6jPE42XearZC9l0p3XUodVqbjfPxmAEMza83BjGXN
         Euy0lLvev5aBnrFwcnOie9TX/yOhVUxyw0e7K7j3CZjbIXe3hAKv8rhxRZLLxKbE/j4f
         LgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+p0wqYJ6pw0YxrRfWy42OQ/okHI3uwlxMX7GdjRJCg=;
        b=3njoZSIudcUOtOEHlaVi3/z6yLfH5Eg0zCwY8w6KxFdN9mOSnHnI5dk1Qm8AfNM/Ze
         E4c69VgoEaICilhLpdo3JfUmgMNCrxGTC0O3pdwLtk3NNUZxaPzcp6VQU5Yn83cN+azF
         nSMVPwJCmUWCELpMcKZr8JkNToDPFmtLhkaxfb4UyEo/jPIGBvaF7QAOk5ZjuDhOyECy
         zgsYBuxPuWjCOblhnjk3nkRQYWIkIiNVQ8REOOA5i6fLWocMisq3L+6hzsj5nA5dj/Mp
         PhABhSbliwl+sWfDkGaYZGi4ze2hAkfxWMywMLb4rdWd4dAWAWIf6A1DrjxMMS7fNVns
         9CsQ==
X-Gm-Message-State: ANoB5pkDniJmFyng3Lw84BwIS+cz3zmG+rXmKKtLS8fd8H3pKyKVP04O
        /6Obap8dRw0dLKpuE0jUCj5b8w==
X-Google-Smtp-Source: AA0mqf7qdxiNzG5qZNzkbJ0O8xp0yn0W/qdYDw8O0Sev/odNF0ay5wArclXrfo5Tg0MNjFuW0WJIdQ==
X-Received: by 2002:a6b:db0f:0:b0:67c:2abb:818e with SMTP id t15-20020a6bdb0f000000b0067c2abb818emr32970741ioc.125.1670259928328;
        Mon, 05 Dec 2022 09:05:28 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id r16-20020a056638131000b00363ec4dcaacsm5900052jad.22.2022.12.05.09.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 09:05:27 -0800 (PST)
Message-ID: <892c1090-2028-2c2c-44e2-6c86a83c2cb3@linaro.org>
Date:   Mon, 5 Dec 2022 11:05:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 14/16] clk: qcom: smd-rpm: rename the qcm2290 rf_clk3
 clocks
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
 <20221203175808.859067-15-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221203175808.859067-15-dmitry.baryshkov@linaro.org>
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

On 12/3/22 11:58 AM, Dmitry Baryshkov wrote:
> Rename the qcm2290_rf_clk3 clocks adding 38m4 prefix to distinguish it
> form the common (19.2 MHz) rf_clk3. The system (and userspace) name of

s/form/from/

> these clocks remains intact.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Otherwise, looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 8dcaa63b0623..f407acb3c6d3 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -125,6 +125,11 @@
>   		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
>   		QCOM_RPM_KEY_SOFTWARE_ENABLE)
>   
> +#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(_platform, _prefix, _name, r_id, r)	      \
> +		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _prefix, _name, _name##_a,    \
> +		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
> +		QCOM_RPM_KEY_SOFTWARE_ENABLE)
> +
>   #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name,		      \
>   					     r_id, r)			      \
>   		DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name,		      \
> @@ -474,7 +479,7 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2, 5, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, 6, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, 8, 19200000);
>   
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, 6, 38400000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(qcm2290, 38m4_, rf_clk3, 6, 38400000);
>   
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, 1, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, 2, 19200000);
> @@ -1164,8 +1169,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>   	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
>   	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
>   	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
> -	[RPM_SMD_RF_CLK3] = &qcm2290_rf_clk3,
> -	[RPM_SMD_RF_CLK3_A] = &qcm2290_rf_clk3_a,
> +	[RPM_SMD_RF_CLK3] = &qcm2290_38m4_rf_clk3,
> +	[RPM_SMD_RF_CLK3_A] = &qcm2290_38m4_rf_clk3_a,
>   	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
>   	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,

