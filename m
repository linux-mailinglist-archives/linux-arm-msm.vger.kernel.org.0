Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4029D191363
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 15:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbgCXOi4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 10:38:56 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:41000 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727498AbgCXOi4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 10:38:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585060735; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=FDugQEzqT/2M8/NQELJOUiw4x17bkM4rtTJc2+a/+ps=; b=K5lmbSolNySGQIKbaBadL1iZDNqCi7B4OFr3XKG8/LeOz57yylRHpHGmdsXQDcS55jZCnp0u
 MsgAeDylypo1tM3FJAgdj4RQQOw427ZUWlV+ZI2KvU+ScMOtbEakAhPL/qd/iZ7KSA1bFxY7
 6XoxlbPApD86l8WB34e+r3kXTgU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7a1b74.7f5cf3ec85a8-smtp-out-n02;
 Tue, 24 Mar 2020 14:38:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5B9AFC433BA; Tue, 24 Mar 2020 14:38:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D45D8C433CB;
        Tue, 24 Mar 2020 14:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D45D8C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3 2/7] bus: mhi: core: Add support for reading MHI info
 from device
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200324061050.14845-1-manivannan.sadhasivam@linaro.org>
 <20200324061050.14845-3-manivannan.sadhasivam@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <edc9fb15-67f3-9cd1-275a-d850d80e2b65@codeaurora.org>
Date:   Tue, 24 Mar 2020 08:38:40 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200324061050.14845-3-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/24/2020 12:10 AM, Manivannan Sadhasivam wrote:
> The MHI register base has several registers used for getting the MHI
> specific information such as version, family, major, and minor numbers
> from the device. This information can be used by the controller drivers
> for usecases such as applying quirks for a specific revision etc...
> 
> While at it, let's also rearrange the local variables
> in mhi_register_controller().
> 
> Suggested-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/bus/mhi/core/init.c     | 19 +++++++++++++++++--
>   drivers/bus/mhi/core/internal.h | 10 ++++++++++
>   include/linux/mhi.h             | 17 +++++++++++++++++
>   3 files changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index eb7f556a8531..d136f6c6ca78 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -802,12 +802,12 @@ static int parse_config(struct mhi_controller *mhi_cntrl,
>   int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>   			    struct mhi_controller_config *config)
>   {
> -	int ret;
> -	int i;
>   	struct mhi_event *mhi_event;
>   	struct mhi_chan *mhi_chan;
>   	struct mhi_cmd *mhi_cmd;
>   	struct mhi_device *mhi_dev;
> +	u32 soc_info;
> +	int ret, i;
>   
>   	if (!mhi_cntrl)
>   		return -EINVAL;
> @@ -874,6 +874,21 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>   		mhi_cntrl->unmap_single = mhi_unmap_single_no_bb;
>   	}
>   
> +	/* Read the MHI device info */
> +	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs,
> +			   SOC_HW_VERSION_OFFS, &soc_info);
> +	if (ret)
> +		goto error_alloc_dev;
> +
> +	mhi_cntrl->family_number = (soc_info & SOC_HW_VERSION_FAM_NUM_BMSK) >>
> +					SOC_HW_VERSION_FAM_NUM_SHFT;
> +	mhi_cntrl->device_number = (soc_info & SOC_HW_VERSION_DEV_NUM_BMSK) >>
> +					SOC_HW_VERSION_DEV_NUM_SHFT;
> +	mhi_cntrl->major_version = (soc_info & SOC_HW_VERSION_MAJOR_VER_BMSK) >>
> +					SOC_HW_VERSION_MAJOR_VER_SHFT;
> +	mhi_cntrl->minor_version = (soc_info & SOC_HW_VERSION_MINOR_VER_BMSK) >>
> +					SOC_HW_VERSION_MINOR_VER_SHFT;
> +
>   	/* Register controller with MHI bus */
>   	mhi_dev = mhi_alloc_device(mhi_cntrl);
>   	if (IS_ERR(mhi_dev)) {
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 18066302e6e2..5deadfaa053a 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -196,6 +196,16 @@ extern struct bus_type mhi_bus_type;
>   #define BHIE_RXVECSTATUS_STATUS_XFER_COMPL (0x02)
>   #define BHIE_RXVECSTATUS_STATUS_ERROR (0x03)
>   
> +#define SOC_HW_VERSION_OFFS (0x224)
> +#define SOC_HW_VERSION_FAM_NUM_BMSK (0xF0000000)
> +#define SOC_HW_VERSION_FAM_NUM_SHFT (28)
> +#define SOC_HW_VERSION_DEV_NUM_BMSK (0x0FFF0000)
> +#define SOC_HW_VERSION_DEV_NUM_SHFT (16)
> +#define SOC_HW_VERSION_MAJOR_VER_BMSK (0x0000FF00)
> +#define SOC_HW_VERSION_MAJOR_VER_SHFT (8)
> +#define SOC_HW_VERSION_MINOR_VER_BMSK (0x000000FF)
> +#define SOC_HW_VERSION_MINOR_VER_SHFT (0)

I'm tempted to give reviewed-by, however it occurs to me that I don't 
see this in the MHI spec.  I'm looking at Rev E, which as far as I am 
aware is the latest.

Hemant, is this in the spec, and if so, what Rev?

I'm concerned that if its not in the spec, we may have an issue with 
some device not implementing this as expected.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
