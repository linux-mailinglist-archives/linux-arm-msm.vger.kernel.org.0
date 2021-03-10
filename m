Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C447F334910
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 21:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhCJUn7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 15:43:59 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:37034 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231670AbhCJUni (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 15:43:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615409017; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=M79y3CBZviledyDDkXZO8CcvgmfIqJFxp+oIh/1uzyc=; b=av88rA0K09mdCN3GU+XTo43iTkWDqRNuENMiVJ0l6WmQoT3MzRWDX9eu79aQDSaOFrAcbj2K
 4A24yOFJrKY7+D+AzNmU/tR0I3b3XaP0sBGIFYgczrNdlGAqpHXfpYj+bXL0jCYo6tOobMs/
 5UvlDzfrRV1hrf1WpC8QUy0odR0=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60492f72af1d9a68ad2b5959 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 20:43:30
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58CE8C43461; Wed, 10 Mar 2021 20:43:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A730CC43462;
        Wed, 10 Mar 2021 20:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A730CC43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH] bus: mhi: Command completion workaround
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org
References: <1615376308-1941-1-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <a24bb3a0-30f8-a32c-dcde-849725b38ebd@codeaurora.org>
Date:   Wed, 10 Mar 2021 12:43:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1615376308-1941-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 3/10/21 3:38 AM, Loic Poulain wrote:
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
As per spec : The location of the command ring read pointer is reported 
to the host on the command completion events in the primary event ring.

If device is buggy and updates with WP instead of Rp, we should not 
workaround it by processing Wp - 1. We can print a warning if cmd_pkt != 
mhi_ring->rp and let the command completion timeout. This needs to be 
fixed by device. We can not accommodate device side bug in host side.

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
> +	}
> +
>   	chan = MHI_TRE_GET_CMD_CHID(cmd_pkt);
>   	mhi_chan = &mhi_cntrl->mhi_chan[chan];
>   	write_lock_bh(&mhi_chan->lock);
> 

Hi Mani,

What do you think about this workaround ?

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
