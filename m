Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33FF7198BBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 07:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgCaFfh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 01:35:37 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:50655 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726236AbgCaFfg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 01:35:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585632936; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=fes4q3BYaybrvlgVDtBeVWule4OgaJcrX3+0iF8Z4cw=; b=r61IT9w27i82C8UD3ezCrLwxn0aZjYc+Nd2sGlCc0tji7nGayiBPXUjqsPfHCBGKE1GYS9sE
 igTqQtPncZj8NzafxqIrWLWqLxbZhM4XIWLhDf75C2hhVqbHSdPhXBlfuUnX1zEOqRX05iOQ
 nfs6faVhCoLVmbZum77oYamwZ0g=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e82d69c.7f59d0ebf928-smtp-out-n02;
 Tue, 31 Mar 2020 05:35:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B9B0FC433BA; Tue, 31 Mar 2020 05:35:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [183.82.140.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F2464C433F2;
        Tue, 31 Mar 2020 05:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F2464C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH 1/4] clk: qcom: gdsc: Handle GDSC regulator supplies
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>
References: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
 <20200319053902.3415984-2-bjorn.andersson@linaro.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <5dbd8e67-cc9f-631b-0b4f-b45389be83cd@codeaurora.org>
Date:   Tue, 31 Mar 2020 11:05:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319053902.3415984-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

I think the upstream design always wanted the client/consumer to enable 
the GPU Rail and then turn ON the GDSC?

Why are we going ahead with adding the support of regulator in the GDSC 
driver?

On 3/19/2020 11:08 AM, Bjorn Andersson wrote:
> Certain GDSCs, such as the GPU_GX on MSM8996, requires that the upstream
> regulator supply is powered in order to be turned on.
> 
> It's not guaranteed that the bootloader will leave these supplies on and
> the driver core will attempt to enable any GDSCs before allowing the
> individual drivers to probe defer on the PMIC regulator driver not yet
> being present.
> 
> So the gdsc driver needs to be made aware of supplying regulators and
> probe defer on their absence, and it needs to enable and disable the
> regulator accordingly.
> 
> Voltage adjustments of the supplying regulator are deferred to the
> client drivers themselves.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>   drivers/clk/qcom/gdsc.c | 24 ++++++++++++++++++++++++
>   drivers/clk/qcom/gdsc.h |  4 ++++
>   2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index a250f59708d8..3528789cc9d0 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -13,6 +13,7 @@
>   #include <linux/regmap.h>
>   #include <linux/reset-controller.h>
>   #include <linux/slab.h>
> +#include <linux/regulator/consumer.h>
>   #include "gdsc.h"
>   
>   #define PWR_ON_MASK		BIT(31)
> @@ -112,6 +113,12 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
>   	int ret;
>   	u32 val = (status == GDSC_ON) ? 0 : SW_COLLAPSE_MASK;
>   
> +	if (status == GDSC_ON && sc->rsupply) {
> +		ret = regulator_enable(sc->rsupply);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>   	ret = regmap_update_bits(sc->regmap, sc->gdscr, SW_COLLAPSE_MASK, val);
>   	if (ret)
>   		return ret;
> @@ -143,6 +150,13 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
>   
>   	ret = gdsc_poll_status(sc, status);
>   	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
> +
> +	if (!ret && status == GDSC_OFF && sc->rsupply) {
> +		ret = regulator_disable(sc->rsupply);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>   	return ret;
>   }
>   
> @@ -371,6 +385,16 @@ int gdsc_register(struct gdsc_desc *desc,
>   	if (!data->domains)
>   		return -ENOMEM;
>   
> +	/* Resolve any regulator supplies */
> +	for (i = 0; i < num; i++) {
> +		if (!scs[i] || !scs[i]->supply)
> +			continue;
> +
> +		scs[i]->rsupply = devm_regulator_get(dev, scs[i]->supply);
> +		if (IS_ERR(scs[i]->rsupply))
> +			return PTR_ERR(scs[i]->rsupply);
> +	}
> +
>   	data->num_domains = num;
>   	for (i = 0; i < num; i++) {
>   		if (!scs[i])
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 64cdc8cf0d4d..c36fc26dcdff 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -10,6 +10,7 @@
>   #include <linux/pm_domain.h>
>   
>   struct regmap;
> +struct regulator;
>   struct reset_controller_dev;
>   
>   /**
> @@ -52,6 +53,9 @@ struct gdsc {
>   	struct reset_controller_dev	*rcdev;
>   	unsigned int			*resets;
>   	unsigned int			reset_count;
> +
> +	const char 			*supply;
> +	struct regulator		*rsupply;
>   };
>   
>   struct gdsc_desc {
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
