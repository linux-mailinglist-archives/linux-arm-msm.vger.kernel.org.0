Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F131BC17C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 16:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgD1Oje (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 10:39:34 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:20708 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726900AbgD1Ojd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 10:39:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588084773; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8nUBanThRKnwQsmfbUzm389cnGoaoxc2kAeAY/GUPFo=; b=RpD8r702HHH407GwfmeE5E/JiWdOCVYlbA6i6JgaJz6+SLiCVAbUXzpW/0eIKtVpkCi2CCPN
 QeRFAc6KLq0I1d6Db0YYUNZTyh7q3qoah6wX0Jh3Wf7dTujv4HF7E8bF+1SqcI3TFglgeE5J
 VAz5OZhaHL0CU5RNBVsWHb+LDo4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea8400c.7f221d720420-smtp-out-n01;
 Tue, 28 Apr 2020 14:39:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6C7E9C433F2; Tue, 28 Apr 2020 14:39:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 67D68C433D2;
        Tue, 28 Apr 2020 14:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 67D68C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2 1/8] bus: mhi: core: Cache intmod from mhi event to mhi
 channel
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>, mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org
References: <1588042766-17496-1-git-send-email-bbhatt@codeaurora.org>
 <1588042766-17496-2-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <59e6a99b-9fde-cd00-82ba-c8604a11c618@codeaurora.org>
Date:   Tue, 28 Apr 2020 08:39:05 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1588042766-17496-2-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/27/2020 8:59 PM, Bhaumik Bhatt wrote:
> From: Hemant Kumar <hemantk@codeaurora.org>
> 
> Driver is using zero initialized intmod value from mhi channel when
> configuring TRE for bei field. This prevents interrupt moderation to
> take effect in case it is supported by an event ring. Fix this by
> copying intmod value from associated event ring to mhi channel upon
> registering mhi controller.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>   drivers/bus/mhi/core/init.c | 4 ++++
>   drivers/bus/mhi/core/main.c | 9 ++++++---
>   2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index b38359c..4dc7f22 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -864,6 +864,10 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>   		mutex_init(&mhi_chan->mutex);
>   		init_completion(&mhi_chan->completion);
>   		rwlock_init(&mhi_chan->lock);
> +
> +		/* used in setting bei field of TRE */
> +		mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
> +		mhi_chan->intmod = mhi_event->intmod;
>   	}
>   
>   	if (mhi_cntrl->bounce_buf) {
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index eb4256b..23154f1 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -929,7 +929,7 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>   	struct mhi_ring *buf_ring = &mhi_chan->buf_ring;
>   	struct mhi_buf_info *buf_info;
>   	struct mhi_tre *mhi_tre;
> -	int ret;
> +	int ret, bei;
>   
>   	/* If MHI host pre-allocates buffers then client drivers cannot queue */
>   	if (mhi_chan->pre_alloc)
> @@ -966,10 +966,11 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>   		goto map_error;
>   
>   	mhi_tre = tre_ring->wp;
> +	bei = !!(mhi_chan->intmod);
>   
>   	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
>   	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(buf_info->len);
> -	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(1, 1, 0, 0);
> +	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(bei, 1, 0, 0);

Why are we not using mhi_gen_tre() here?  Its used in mhi_queue_buf(), 
which seems to be why the issue doesn't appear there.  It looks like we 
have 3 instances of the same code, which all need to be kept in sync. 
Seems like this bug exists because they were not in sync.

Simplifying the code by removing the duplication seems to be the better 
approach by not only addressing this issue, but also preventing future ones.

>   
>   	/* increment WP */
>   	mhi_add_ring_element(mhi_cntrl, tre_ring);
> @@ -1006,6 +1007,7 @@ int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>   	struct mhi_ring *buf_ring = &mhi_chan->buf_ring;
>   	struct mhi_buf_info *buf_info;
>   	struct mhi_tre *mhi_tre;
> +	int bei;
>   
>   	/* If MHI host pre-allocates buffers then client drivers cannot queue */
>   	if (mhi_chan->pre_alloc)
> @@ -1043,10 +1045,11 @@ int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>   	buf_info->len = len;
>   
>   	mhi_tre = tre_ring->wp;
> +	bei = !!(mhi_chan->intmod);
>   
>   	mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
>   	mhi_tre->dword[0] = MHI_TRE_DATA_DWORD0(buf_info->len);
> -	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(1, 1, 0, 0);
> +	mhi_tre->dword[1] = MHI_TRE_DATA_DWORD1(bei, 1, 0, 0);
>   
>   	/* increment WP */
>   	mhi_add_ring_element(mhi_cntrl, tre_ring);
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
