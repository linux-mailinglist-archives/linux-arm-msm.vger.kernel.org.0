Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8A4169EC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 07:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgBXGsV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 01:48:21 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:22793 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727218AbgBXGsS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 01:48:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582526898; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=jNRzdYMbdcCKIzk2XTZpJ0LJRkqr4fVarF9hJS2DGuU=; b=Xy/1GVEC9P8CoyFhhCqdjpD/o2Hmrwp87pfRqVIOnAKKmZ1X0kt6EUS+J9two1nvKxOIQpNA
 H6O/+L2p7t8LtysH6tJHn3UZ5/fy+IYNDc4WnhPhs1d3l88Urwe56QSvYhjV5d09v4N0O+0q
 eUbIRwq+9iMfWGXSbSJBLCveKOw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5371ac.7f9514009a40-smtp-out-n01;
 Mon, 24 Feb 2020 06:48:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5E5AEC4479C; Mon, 24 Feb 2020 06:48:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.12.145] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: lsrao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E23BC43383;
        Mon, 24 Feb 2020 06:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8E23BC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=lsrao@codeaurora.org
Subject: Re: [PATCH v6 3/3] soc: qcom: rpmh: Invoke rpmh_flush for dirty
 caches
To:     Maulik Shah <mkshah@codeaurora.org>, swboyd@chromium.org,
        mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org
References: <1582277527-19638-1-git-send-email-mkshah@codeaurora.org>
 <1582277527-19638-4-git-send-email-mkshah@codeaurora.org>
From:   Srinivas Rao L <lsrao@codeaurora.org>
Message-ID: <97325f1e-e7dc-0dea-4468-c5d210ceb45c@codeaurora.org>
Date:   Mon, 24 Feb 2020 12:18:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582277527-19638-4-git-send-email-mkshah@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As power domain support is dropped in v6 , please update commit text 
accordingly.
Post the update of commit text, you can add my reviewed by.

Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>

Regards,
Srinivas.

On 2/21/2020 3:02 PM, Maulik Shah wrote:
> Add changes to invoke rpmh flush when the data in cache is dirty.
>
> This is done only if OSI is not supported in PSCI. If OSI is supported
> rpmh_flush will get invoked by power domain off call when the last cpu
> in the domain is going to power collapse.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>   drivers/soc/qcom/rpmh.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index 83ba4e0..839af8d 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -12,6 +12,7 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> +#include <linux/psci.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
>   #include <linux/types.h>
> @@ -163,6 +164,9 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>   unlock:
>   	spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>   
> +	if (ctrlr->dirty && !psci_has_osi_support())
> +		return rpmh_flush(ctrlr) ? ERR_PTR(-EINVAL) : req;
> +
>   	return req;
>   }
>   
> @@ -391,6 +395,8 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
>   
>   	if (state != RPMH_ACTIVE_ONLY_STATE) {
>   		cache_batch(ctrlr, req);
> +		if (!psci_has_osi_support())
> +			return rpmh_flush(ctrlr);
>   		return 0;
>   	}
>   

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
