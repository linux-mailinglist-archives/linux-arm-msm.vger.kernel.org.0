Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5DA71A3D8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 02:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgDJAzj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 20:55:39 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:22072 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726858AbgDJAzj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 20:55:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586480138; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=U7DZcbslve7IXk4DQ4UcUwvrYxE7nmOSD3B0DRfj2Yo=; b=d+cJsbwmfxZpwtCklW/rDMMSAFew7G4w9fi5Ugu3+fvuTy+LMY0FU86wY4/fXd102fgJ7go/
 gXPBDoQOfo/o3Cki0iCHsmOCGLbhSvzRWx5akb7rKS1aEgxvVwxD12XXUOTEoaaWtMmJVExO
 jvFbPXi/d6Qj/qqcR8Lei0NaVdw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8fc401.7f2b727ce8b8-smtp-out-n03;
 Fri, 10 Apr 2020 00:55:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 43DDBC433BA; Fri, 10 Apr 2020 00:55:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 12375C433D2;
        Fri, 10 Apr 2020 00:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 12375C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v2 1/5] bus: mhi: core: Handle syserr during power_up
To:     Jeffrey Hugo <jhugo@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     "linux-arm-msm@vger.kernel.org; bbhatt"@codeaurora.org,
        linux-kernel@vger.kernel.org
References: <1586278230-29565-1-git-send-email-jhugo@codeaurora.org>
 <1586278230-29565-2-git-send-email-jhugo@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <1768ba6e-12c2-7b4f-0f17-44fecc6473b9@codeaurora.org>
Date:   Thu, 9 Apr 2020 17:55:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1586278230-29565-2-git-send-email-jhugo@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/7/20 9:50 AM, Jeffrey Hugo wrote:
> The MHI device may be in the syserr state when we attempt to init it in
> power_up().  Since we have no local state, the handling is simple -
> reset the device and wait for it to transition out of the reset state.
>
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>   drivers/bus/mhi/core/pm.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 52690cb..3285c9e 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -9,6 +9,7 @@
>   #include <linux/dma-direction.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/interrupt.h>
> +#include <linux/iopoll.h>
>   #include <linux/list.h>
>   #include <linux/mhi.h>
>   #include <linux/module.h>
> @@ -760,6 +761,7 @@ static void mhi_deassert_dev_wake(struct mhi_controller *mhi_cntrl,
>   
>   int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>   {
> +	enum mhi_state state;
>   	enum mhi_ee_type current_ee;
>   	enum dev_st_transition next_state;
>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> @@ -829,6 +831,24 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>   		goto error_bhi_offset;
>   	}
>   
> +	state = mhi_get_mhi_state(mhi_cntrl);
> +	if (state == MHI_STATE_SYS_ERR) {
> +		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
> +		ret = readl_poll_timeout(mhi_cntrl->regs + MHICTRL, val,
> +					 !(val & MHICTRL_RESET_MASK), 1000,
> +					 mhi_cntrl->timeout_ms * 1000);
can we use this instead of polling because MSI is configures and int_vec 
handler is registered

     wait_event_timeout(mhi_cntrl->state_event,
                MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
               mhi_read_reg_field(mhi_cntrl, base, MHICTRL,
                           MHICTRL_RESET_MASK,
                           MHICTRL_RESET_SHIFT, &reset) || !reset ,
                msecs_to_jiffies(mhi_cntrl->timeout_ms));

1) In case of MHI_PM_IN_FATAL_STATE we would not be accessing MHI reg
2) Consistent with current MHI driver code.
> +		if (ret) {
> +			dev_info(dev, "Failed to reset MHI due to syserr state\n");
> +			goto error_bhi_offset;
> +		}
> +
> +		/*
> +		 * device cleares INTVEC as part of RESET processing,
> +		 * re-program it
> +		 */
> +		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
> +	}
> +
>   	/* Transition to next state */
>   	next_state = MHI_IN_PBL(current_ee) ?
>   		DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
