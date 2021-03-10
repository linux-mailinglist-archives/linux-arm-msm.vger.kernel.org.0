Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FC23342E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 17:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhCJQUN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 11:20:13 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:26711 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231496AbhCJQTi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 11:19:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615393178; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=IZcZOQQdNaYc6BPH9h3og3TpAa6OD/LCt59hVYmXwi8=; b=WD3fyW+Di7ISE0ThgWq/kztoU0ctZmRR+lxwGBVT4doVD/N0MKFONWVi0rOkF8uQs7I5lfON
 P5JAEEjFcigFP0OtSGlUTK+eyEDS/Swmr9Pj9kZAtoZewnyisYcUXPQgHHtz3J7nprUTDW44
 VeoGHKxw8OZe8N6qu0AUISE28Lo=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6048f18dbb6300df75e7f81b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 16:19:25
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C10F7C433C6; Wed, 10 Mar 2021 16:19:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E98AC433ED;
        Wed, 10 Mar 2021 16:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8E98AC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: Command completion workaround
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
References: <1615376308-1941-1-git-send-email-loic.poulain@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <781d27cf-f9a6-eecc-8832-341a9a5fbb3a@codeaurora.org>
Date:   Wed, 10 Mar 2021 09:19:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1615376308-1941-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/10/2021 4:38 AM, Loic Poulain wrote:
> Some buggy hardwares (e.g sdx24) may report the current command
> ring wp pointer instead of the command completion pointer. It's
> obviously wrong, causing completion timeout. We can however deal
> with that situation by completing the cmd n-1 element, which is
> what the device actually completes.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   drivers/bus/mhi/core/main.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 16b9640..3e3c520 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -707,6 +707,7 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
>   {
>   	dma_addr_t ptr = MHI_TRE_GET_EV_PTR(tre);
>   	struct mhi_cmd *cmd_ring = &mhi_cntrl->mhi_cmd[PRIMARY_CMD_RING];
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>   	struct mhi_ring *mhi_ring = &cmd_ring->ring;
>   	struct mhi_tre *cmd_pkt;
>   	struct mhi_chan *mhi_chan;
> @@ -714,6 +715,23 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
>   
>   	cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
>   
> +	if (unlikely(cmd_pkt == mhi_ring->wp)) {
> +		/* Some buggy hardwares (e.g sdx24) sometimes report the current
> +		 * command ring wp pointer instead of the command completion
> +		 * pointer. It's obviously wrong, causing completion timeout. We
> +		 * can however deal with that situation by completing the cmd
> +		 * n-1 element.
> +		 */
> +		void *ring_ptr = (void *)cmd_pkt - mhi_ring->el_size;
> +
> +		if (ring_ptr < mhi_ring->base)
> +			ring_ptr += mhi_ring->len;
> +
> +		cmd_pkt = ring_ptr;
> +
> +		dev_warn(dev, "Bad completion pointer (ptr == ring_wp)\n");

Is there value in having this warning every time?  I wonder if a _once 
version would be better to not flood the kernel log.  Although this is 
only for commands, which shouldn't be frequent, so maybe that is the 
implicit rate limiter.

What do you think?

> +	}
> +
>   	chan = MHI_TRE_GET_CMD_CHID(cmd_pkt);
>   	mhi_chan = &mhi_cntrl->mhi_chan[chan];
>   	write_lock_bh(&mhi_chan->lock);
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
