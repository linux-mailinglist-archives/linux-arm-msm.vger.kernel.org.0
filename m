Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0E9F169EA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 07:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgBXGnr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 01:43:47 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:27840 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726744AbgBXGnr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 01:43:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582526627; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=z3C4cNarxZAhST2qjUgkszJ04NTzuBCuln5Xx0MlMAE=; b=hGo7X7TOin9Mc73HEdO1EPisMzJuBQQ/fBih8GJaI85/KmFTGNvDx+8LVkTnHWM68jJ8I3fF
 1emlgvyaBjMqArcdirmFTHGDtGIc1l91qwM1WNTqNYB7C4ekYWHiU3y8Yy4vlCWoqrrxi0Yu
 cjM+gFOpVcXNh7SrvixHK8wpUAc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5370a1.7fb06d5cced8-smtp-out-n01;
 Mon, 24 Feb 2020 06:43:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4543C4479C; Mon, 24 Feb 2020 06:43:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.12.145] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: lsrao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1C4EEC433A2;
        Mon, 24 Feb 2020 06:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1C4EEC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=lsrao@codeaurora.org
Subject: Re: [PATCH v6 2/3] soc: qcom: rpmh: Update dirty flag only when data
 changes
To:     Maulik Shah <mkshah@codeaurora.org>, swboyd@chromium.org,
        mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org
References: <1582277527-19638-1-git-send-email-mkshah@codeaurora.org>
 <1582277527-19638-3-git-send-email-mkshah@codeaurora.org>
From:   Srinivas Rao L <lsrao@codeaurora.org>
Message-ID: <2c25c10d-6e52-4b59-00f8-fb5538a7e5a4@codeaurora.org>
Date:   Mon, 24 Feb 2020 12:13:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582277527-19638-3-git-send-email-mkshah@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>

Regards,
Srinivas.

On 2/21/2020 3:02 PM, Maulik Shah wrote:
> Currently rpmh ctrlr dirty flag is set for all cases regardless
> of data is really changed or not. Add changes to update it when
> data is updated to newer values.
>
> Also move dirty flag updates to happen from within cache_lock.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>   drivers/soc/qcom/rpmh.c | 21 ++++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index eb0ded0..83ba4e0 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -139,20 +139,27 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>   existing:
>   	switch (state) {
>   	case RPMH_ACTIVE_ONLY_STATE:
> -		if (req->sleep_val != UINT_MAX)
> +		if (req->sleep_val != UINT_MAX) {
>   			req->wake_val = cmd->data;
> +			ctrlr->dirty = true;
> +		}
>   		break;
>   	case RPMH_WAKE_ONLY_STATE:
> -		req->wake_val = cmd->data;
> +		if (req->wake_val != cmd->data) {
> +			req->wake_val = cmd->data;
> +			ctrlr->dirty = true;
> +		}
>   		break;
>   	case RPMH_SLEEP_STATE:
> -		req->sleep_val = cmd->data;
> +		if (req->sleep_val != cmd->data) {
> +			req->sleep_val = cmd->data;
> +			ctrlr->dirty = true;
> +		}
>   		break;
>   	default:
>   		break;
>   	}
>   
> -	ctrlr->dirty = true;
>   unlock:
>   	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>   
> @@ -287,6 +294,7 @@ static void cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
>   
>   	spin_lock_irqsave(&ctrlr->cache_lock, flags);
>   	list_add_tail(&req->list, &ctrlr->batch_cache);
> +	ctrlr->dirty = true;
>   	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>   }
>   
> @@ -323,6 +331,7 @@ static void invalidate_batch(struct rpmh_ctrlr *ctrlr)
>   	list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
>   		kfree(req);
>   	INIT_LIST_HEAD(&ctrlr->batch_cache);
> +	ctrlr->dirty = true;
>   	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>   }
>   
> @@ -456,6 +465,7 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
>   int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>   {
>   	struct cache_req *p;
> +	unsigned long flags;
>   	int ret;
>   
>   	if (!ctrlr->dirty) {
> @@ -488,7 +498,9 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>   			return ret;
>   	}
>   
> +	spin_lock_irqsave(&ctrlr->cache_lock, flags);
>   	ctrlr->dirty = false;
> +	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>   
>   	return 0;
>   }
> @@ -507,7 +519,6 @@ int rpmh_invalidate(const struct device *dev)
>   	int ret;
>   
>   	invalidate_batch(ctrlr);
> -	ctrlr->dirty = true;
>   
>   	do {
>   		ret = rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
