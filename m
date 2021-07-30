Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2667E3DB05C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 02:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhG3AlU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 20:41:20 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:24550 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhG3AlT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 20:41:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627605676; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=9Ht7O+OhLLBTUmV8+k/svqIkYNmGUynD6YgQBlzccK0=; b=pf7fIIxlz9JwfA2BX0sTNBAf63O4IyBG02IfDetXB+WiVq5Tvc+XfFxGODfomqh6JjSr8YOJ
 GO4PR2NGR+Cd2S40wJ7p/YT0TiIP6RR/Eo0LFl758R0mc7bjfCDmnq2DfrvDs8QzTjbAgve4
 fvrPpFoBLvAx5V2bHTjZsqyUdbk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 61034aab38fa9bfe9c4f0841 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Jul 2021 00:41:15
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2F595C433D3; Fri, 30 Jul 2021 00:41:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.101] (unknown [49.204.183.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DF7D2C433F1;
        Fri, 30 Jul 2021 00:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DF7D2C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 5/6] clk: qcom: Add support for SDX65 RPMh clocks
To:     quic_vamslank@quicinc.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, tglx@linutronix.de,
        maz@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1626986805.git.quic_vamslank@quicinc.com>
 <fed310806d011c704955306a9768512b0bcc7cd4.1626986805.git.quic_vamslank@quicinc.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <bc97c696-03b5-9772-cf76-c8c2e3df36b3@codeaurora.org>
Date:   Fri, 30 Jul 2021 06:11:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <fed310806d011c704955306a9768512b0bcc7cd4.1626986805.git.quic_vamslank@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7/23/2021 2:39 AM, quic_vamslank@quicinc.com wrote:
> From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> 
> Add support for clocks maintained by RPMh in SDX65 SoCs.
> 
> Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   drivers/clk/qcom/clk-rpmh.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 91dc390a583b..f3769b86e5d0 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -477,6 +477,32 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
>   	.num_clks = ARRAY_SIZE(sm8250_rpmh_clocks),
>   };
>   
> +DEFINE_CLK_RPMH_ARC(sdx65, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
please re-use "sc7280" resources.
> +DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
> +DEFINE_CLK_RPMH_VRM(sdx65, rf_clk4, rf_clk4_ao, "rfclka4", 1);
please re-use "sm8350" resources.
> +
> +static struct clk_hw *sdx65_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]          = &sdx65_bi_tcxo.hw,
> +	[RPMH_CXO_CLK_A]        = &sdx65_bi_tcxo_ao.hw,
you can re-use sc7280 resources.
> +	[RPMH_LN_BB_CLK1]       = &sdx65_ln_bb_clk1.hw,
> +	[RPMH_LN_BB_CLK1_A]     = &sdx65_ln_bb_clk1_ao.hw,
> +	[RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
> +	[RPMH_RF_CLK3]          = &sdm845_rf_clk3.hw,
> +	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
> +	[RPMH_RF_CLK4]          = &sdx65_rf_clk4.hw,
> +	[RPMH_RF_CLK4_A]        = &sdx65_rf_clk4_ao.hw,
"sm8350"
> +	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
> +	[RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
> +	.clks = sdx65_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(sdx65_rpmh_clocks),
> +};
> +
>   DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
>   DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
>   DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
> @@ -618,6 +644,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
>   	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
>   	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
>   	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
> +	{ .compatible = "qcom,sdx65-rpmh-clk",  .data = &clk_rpmh_sdx65},
>   	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
>   	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
>   	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
