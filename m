Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA912B750D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 04:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgKRDyc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 22:54:32 -0500
Received: from z5.mailgun.us ([104.130.96.5]:23732 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725613AbgKRDyc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 22:54:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605671671; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=GxH+mHGGoW3TQQMaE6t3Sp7mYrUqOK2q8zBHfsu2W0s=; b=A21bd/2aMjrT/ZldqnlV3+BoukhncRamwsxA+OwZ535PteQ64DShb2PlKUDMPxRdes4YRJVW
 1NbpQtM8i51bScCkYDSZ4PBKHgBL/lUtyOyJVJ1h9Xlumi/9qfIkoJFhzoXio5o2Zl0GH3UJ
 bfzcEkBPVBjhFRggcvS5K0zXrrI=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fb49af707fe4e8a18e0498c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 18 Nov 2020 03:54:31
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0020FC433C6; Wed, 18 Nov 2020 03:54:30 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DC89C433C6;
        Wed, 18 Nov 2020 03:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4DC89C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH 1/8] mhi: pci-generic: Increase number of hardware events
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
 <1605279602-18749-2-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <3e72e0fa-1bba-20af-1e2a-1b7981bfd39d@codeaurora.org>
Date:   Tue, 17 Nov 2020 19:54:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1605279602-18749-2-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 11/13/20 6:59 AM, Loic Poulain wrote:
> If the IPA (IP hardware accelerator) is starved of event ring elements,
> the modem is crashing (SDX55). That can be prevented by setting a
it is because of event processing is getting starved ? Event ring 
elements = 2 x xfer ring is good for HW channels. Do you think NAPI 
polling would help when you start verifying higher data rates?

> larger number of events (i.e 2 x number of channel ring elements).
> 
> Tested with FN980m module.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> ---
>   drivers/bus/mhi/pci_generic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index e3df838..13a7e4f 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -91,7 +91,7 @@ struct mhi_pci_dev_info {
>   
>   #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
>   	{					\
> -		.num_elements = 128,		\
> +		.num_elements = 256,		\
>   		.irq_moderation_ms = 5,		\
>   		.irq = (ev_ring) + 1,		\
>   		.priority = 1,			\
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
