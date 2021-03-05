Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694DB32F4CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 21:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbhCEUz6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 15:55:58 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:30895 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229446AbhCEUz6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 15:55:58 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614977758; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=gInvR84J5zzSls5gUh4IJTqqXS5R3fWGt1q9sp+bpFw=; b=EbHSsyfuxdBeGYWGXptIxjZbpHoaSOHqAZavBSFqg4HntUUFCMAc3s4F+WDKf6/UDV0YvOsz
 77DCUOeF5/1luVWBo+3cm2hXgUqMV/F10bSUw9OcDcLw39WxpNQt653qEXUi/xlzpVgfWqIe
 0v3zdDi/+6TC2s6VdaZCwruF5TA=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60429ada1a5c93533fd7e306 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 20:55:54
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 94413C433ED; Fri,  5 Mar 2021 20:55:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D0C11C433CA;
        Fri,  5 Mar 2021 20:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D0C11C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 4/6] mhi: pci_generic: No-Op for device_wake operations
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org
References: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
 <1614971808-22156-4-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <6f1c9166-63e9-d3d6-3f93-afc86ce4c021@codeaurora.org>
Date:   Fri, 5 Mar 2021 12:55:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1614971808-22156-4-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 3/5/21 11:16 AM, Loic Poulain wrote:
> The wake_db register presence is highly speculative and can fuze MHI
> devices. Indeed, currently the wake_db register address is defined at
> entry 127 of the 'Channel doorbell array', thus writing to this address
> is equivalent to ringing the doorbell for channel 127, causing trouble
> with some devics (e.g. SDX24 based modems) that get an unexpected
> channel 127 doorbell interrupt.
> 
> This change fixes that issue by setting wake get/put as no-op for
> pci_generic devices. The wake device sideband mechanism seems really
> specific to each device, and is AFAIK not defined by the MHI spec.
> 
> It also removes zeroing initialization of wake_db register during MMIO
> initialization, the register being set via wake_get/put accessors few
> cycles later during M0 transition.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   v2: reword commit message
>   v3: no change
> 
>   drivers/bus/mhi/core/init.c   |  2 --
>   drivers/bus/mhi/pci_generic.c | 18 ++++++++++++++++++
>   2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 2159dbc..32eb90f 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -510,8 +510,6 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>   
>   	/* Setup wake db */
>   	mhi_cntrl->wake_db = base + val + (8 * MHI_DEV_WAKE_DB);
> -	mhi_write_reg(mhi_cntrl, mhi_cntrl->wake_db, 4, 0);
> -	mhi_write_reg(mhi_cntrl, mhi_cntrl->wake_db, 0, 0);
Did you see any issue with host clearing wake DB register. it looks fine 
to clear it by host without relying on what device had it before, to 
begin with.

>   	mhi_cntrl->wake_set = false;
>   

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
