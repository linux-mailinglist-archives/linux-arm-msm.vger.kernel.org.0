Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3112D7EF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 19:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgLKS6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 13:58:50 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:21729 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729449AbgLKS61 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 13:58:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607713087; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0QMaWwfQFu9eNrgHIZ7H0vxn4qoFGHja1OTVYmupQWM=; b=OxEUT4WKbAuLvH+G1k2IRyzdnWvgyXpAcSlQAgnNnFuIbkQMj40M432UaRFCX2fnDDX4DOTf
 tN8RP50ndSNkS/0cdXTgDZ9EmG0ibuBqzG09hDeNaDPGH3U+mMhwh29/d4HVf/RHg3mR5jAR
 bi4zescVYF7Ks3HJ5AU4+oYGx2A=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fd3c12195aeb115f3e2af9f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 11 Dec 2020 18:57:37
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 82B35C43463; Fri, 11 Dec 2020 18:57:36 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6903CC433CA;
        Fri, 11 Dec 2020 18:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6903CC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v4 01/10] mhi: Add mhi_controller_initialize helper
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org
References: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
 <1607594575-31590-2-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <bb994dcd-854b-e33c-1b08-ac71348fa851@codeaurora.org>
Date:   Fri, 11 Dec 2020 10:57:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1607594575-31590-2-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/10/20 2:02 AM, Loic Poulain wrote:
> This function allows to initialize a mhi_controller structure.
> Today, it only zeroing the structure.
> 
> Use this function from mhi_alloc_controller so that any further
> initialization can be factorized in initalize function.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   drivers/bus/mhi/core/init.c | 7 +++++++
>   include/linux/mhi.h         | 6 ++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 96cde9c..4acad28 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -1021,11 +1021,18 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
>   }
>   EXPORT_SYMBOL_GPL(mhi_unregister_controller);
>   
> +void mhi_initialize_controller(struct mhi_controller *mhi_cntrl)
> +{
> +	memset(mhi_cntrl, 0, sizeof(*mhi_cntrl));
> +}
> +EXPORT_SYMBOL_GPL(mhi_initialize_controller);
> +
>   struct mhi_controller *mhi_alloc_controller(void)
>   {
>   	struct mhi_controller *mhi_cntrl;
>   
>   	mhi_cntrl = kzalloc(sizeof(*mhi_cntrl), GFP_KERNEL);
> +	mhi_initialize_controller(mhi_cntrl);
Considering the kzalloc, do we really need to call here as well ?
>   
>   	return mhi_cntrl;
>   }
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 04cf7f3..2754742 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -537,6 +537,12 @@ struct mhi_driver {
>   #define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
>   
>   /**
> + * mhi_initialize_controller - Initialize MHI Controller structure
> + * @mhi_cntrl: MHI controller structure to initialize
> + */
> +void mhi_initialize_controller(struct mhi_controller *mhi_cntrl);
> +
> +/**
>    * mhi_alloc_controller - Allocate the MHI Controller structure
>    * Allocate the mhi_controller structure using zero initialized memory
>    */
> 

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
