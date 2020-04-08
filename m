Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 525861A230C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgDHNc6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:32:58 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:58666 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726889AbgDHNc5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:32:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586352776; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=X32JgTgPuj6h5L5X9HHc8t1fVmbGtH/13HIygnwhZ3A=; b=ctKsMKUU+oPrGcEcR5lgY71z8B83VUiT1tg1H4/8zhYlVa/f8usPpnO04bcVK2tBOF2NpbWk
 cbndK3OXtnb9/br7vLIqZcm/4wiRn0dxA5L5oIp9pONKiSGxQafNuYAbEO0w1wAprDmL2fyF
 /YQmt/DVENCeOX7daC9ehugIuiA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dd276.7fea798001b8-smtp-out-n05;
 Wed, 08 Apr 2020 13:32:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2E9A5C433D2; Wed,  8 Apr 2020 13:32:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.202.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C08DC433F2;
        Wed,  8 Apr 2020 13:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C08DC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v3 10/10] drivers: qcom: rpmh-rsc:
 read_tcs_reg()/write_tcs_reg() are not for IRQ
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200407235024.260460-1-dianders@chromium.org>
 <20200407164915.v3.10.I2adf93809c692d0b673e1a86ea97c45644aa8d97@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <b6188012-ebe5-5d22-072a-6bec4ddfd824@codeaurora.org>
Date:   Wed, 8 Apr 2020 19:02:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407164915.v3.10.I2adf93809c692d0b673e1a86ea97c45644aa8d97@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 4/8/2020 5:20 AM, Douglas Anderson wrote:
> The RSC_DRV_IRQ_ENABLE, RSC_DRV_IRQ_STATUS, and RSC_DRV_IRQ_CLEAR
> registers are not part of TCS 0.  Let's not pretend that they are by
> using read_tcs_reg() and write_tcs_reg() and passing a bogus tcs_id of
> 0.  We could introduce a new wrapper for these registers but it
> wouldn't buy us much.  Let's just read/write directly.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - ("...are not for IRQ") is new for v3.
>
> Changes in v2: None
>
>   drivers/soc/qcom/rpmh-rsc.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index a3b015196f15..31a998e6f2e9 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -363,12 +363,12 @@ static void enable_tcs_irq(struct rsc_drv *drv, int tcs_id, bool enable)
>   {
>   	u32 data;
>   
> -	data = read_tcs_reg(drv, RSC_DRV_IRQ_ENABLE, 0);
> +	data = readl_relaxed(drv->tcs_base + RSC_DRV_IRQ_ENABLE);
>   	if (enable)
>   		data |= BIT(tcs_id);
>   	else
>   		data &= ~BIT(tcs_id);
> -	write_tcs_reg(drv, RSC_DRV_IRQ_ENABLE, 0, data);
> +	writel_relaxed(data, drv->tcs_base + RSC_DRV_IRQ_ENABLE);
>   }
>   
>   /**
> @@ -389,7 +389,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>   	const struct tcs_request *req;
>   	struct tcs_cmd *cmd;
>   
> -	irq_status = read_tcs_reg(drv, RSC_DRV_IRQ_STATUS, 0);
> +	irq_status = readl_relaxed(drv->tcs_base + RSC_DRV_IRQ_STATUS);
>   
>   	for_each_set_bit(i, &irq_status, BITS_PER_LONG) {
>   		req = get_req_from_tcs(drv, i);
> @@ -426,7 +426,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>   		/* Reclaim the TCS */
>   		write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, i, 0);
>   		write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, i, 0);
> -		write_tcs_reg(drv, RSC_DRV_IRQ_CLEAR, 0, BIT(i));
> +		writel_relaxed(BIT(i), drv->tcs_base + RSC_DRV_IRQ_CLEAR);
>   		spin_lock(&drv->lock);
>   		clear_bit(i, drv->tcs_in_use);
>   		/*
> @@ -969,7 +969,8 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
>   	}
>   
>   	/* Enable the active TCS to send requests immediately */
> -	write_tcs_reg(drv, RSC_DRV_IRQ_ENABLE, 0, drv->tcs[ACTIVE_TCS].mask);
> +	writel_relaxed(drv->tcs[ACTIVE_TCS].mask,
> +		       drv->tcs_base + RSC_DRV_IRQ_ENABLE);
>   
>   	spin_lock_init(&drv->client.cache_lock);
>   	INIT_LIST_HEAD(&drv->client.cache);

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
