Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A842B89BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 02:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgKSBqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Nov 2020 20:46:49 -0500
Received: from z5.mailgun.us ([104.130.96.5]:14251 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbgKSBqt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Nov 2020 20:46:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605750408; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=BWL4Fdqmja471C5WDacTr9P1ErDOdsva9Do3/M7lIKk=; b=U68LGLI54eJiuDs8nleCpoKRdMEfN1myASpf/bquEukpFGl4g0STSe4WJKwF8vLI2R5zN985
 QCvejZBFcPyTF/ALLKXxwDKqnkobimZ05OhIvOJ51z5MeURN66khseFyhStRl1sDhnKCMEZZ
 4l4os7bwgSsmCggprMJkWfUE1Q8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fb5ce884146c5eefdccbec1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Nov 2020 01:46:48
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8A815C43460; Thu, 19 Nov 2020 01:46:47 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CF83BC433C6;
        Thu, 19 Nov 2020 01:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CF83BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH 2/8] mhi: pci-generic: Perform hard reset on remove
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
 <1605279602-18749-3-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <ad4fa874-163a-227b-3291-727b1ee27f06@codeaurora.org>
Date:   Wed, 18 Nov 2020 17:46:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1605279602-18749-3-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 11/13/20 6:59 AM, Loic Poulain wrote:
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
> index 13a7e4f..09c6b26 100644
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

Referring to MHI spec:
Hosts writes this register to trigger a reset. This can be used when the 
host detects a timeout in the MHI protocol and can use the reset as a 
last resort to recover the device. Host should first attempt an MHI 
Reset procedure before resetting the entire device.

What issue are you facing which requires you to do full device reset ? 
Based on the spec recommendation, looks like this should be a last resort.

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
