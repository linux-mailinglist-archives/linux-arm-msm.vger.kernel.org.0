Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38342C6AAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 18:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731799AbgK0Rew (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 12:34:52 -0500
Received: from z5.mailgun.us ([104.130.96.5]:64303 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731761AbgK0Rew (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 12:34:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606498491; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=y/K2vSQV0w0NlcQ/vA8zPUF98DeBd0xivpOU1DQLPxs=; b=mUMAYzSM8k7DDnzOUhjc+GprVJBrKVJAHGYoq0CxZPWToQcFBu/R/peHjziPZVRecGq6/S5Q
 YWWj7gA+oVeXXu4JCpgFMIrE+hGGKhnFWPgyVMjb4sTneJ/9/B38uRw3GVK/TlUUrbXoqgg2
 jWlRAY21q8yDregZrVUmXzRPVWo=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fc138b6e714ea6501ac0b9c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Nov 2020 17:34:46
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0B976C43461; Fri, 27 Nov 2020 17:34:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D4B95C433ED;
        Fri, 27 Nov 2020 17:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D4B95C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3 3/9] mhi: pci-generic: Perform hard reset on remove
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
 <1606404547-10737-4-git-send-email-loic.poulain@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <39fae2b9-cdde-1864-8ff3-55e3c07f4264@codeaurora.org>
Date:   Fri, 27 Nov 2020 10:34:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1606404547-10737-4-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/26/2020 8:29 AM, Loic Poulain wrote:
> Ensure that the device is hard-reset on remove to restore its initial
> state and avoid further issues on subsequent probe.
> 
> This has been tested with Telit FN980m module.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   drivers/bus/mhi/pci_generic.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index d3896ef..4363676 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -15,6 +15,8 @@
>   
>   #define MHI_PCI_DEFAULT_BAR_NUM 0
>   
> +#define DEV_RESET_REG (0xB0)
> +
>   /**
>    * struct mhi_pci_dev_info - MHI PCI device specific information
>    * @config: MHI controller configuration
> @@ -166,6 +168,11 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
>   	/* Nothing to do for now */
>   }
>   
> +static inline void mhi_pci_reset(struct mhi_controller *mhi_cntrl)
> +{
> +	writel(1, mhi_cntrl->regs + DEV_RESET_REG);
> +}
> +
>   static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>   			 unsigned int bar_num, u64 dma_mask)
>   {
> @@ -329,6 +336,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>   	mhi_power_down(mhi_cntrl, true);
>   	mhi_unprepare_after_power_down(mhi_cntrl);
>   	mhi_unregister_controller(mhi_cntrl);
> +
> +	/* MHI-layer reset could not be enough, always hard-reset the device */
> +	mhi_pci_reset(mhi_cntrl);
> +
>   	mhi_free_controller(mhi_cntrl);
>   }
>   
> 

Did you miss my eariler comment asking to make this functionality common?

Also, I caution you to think carefully about this.  Its possible doing 
this type of reset can take down the PCI link, and the host would need 
to have PCI hotplug to recover.  If not, the device will become 
inaccessable until the host reboots.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
