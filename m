Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB82C334746
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 19:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232828AbhCJS5u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 13:57:50 -0500
Received: from z11.mailgun.us ([104.130.96.11]:31495 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229602AbhCJS5X (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 13:57:23 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615402643; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=17+EoLjmYv9h04ms2UQiOoHgGzuvEfwEX3JtQqJTGro=; b=mMUnSsU82VEy/YYpLLPCqGB7uA5hPzZ6+A/ekckWAafxk2/cwVVLc2yKiO4WuuMyoZMP8rXZ
 EVvtshD7T2VGwHhFpuG7QbAGySsPpUzSpTkfzF58ISVCciE+5A786QZISz3h9TxgHPQyAiQz
 PAlcnuIiD2c/DKOwx64Hlr13oWU=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60491691bb6300df75775107 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 18:57:21
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 67C4AC433ED; Wed, 10 Mar 2021 18:57:21 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C96FC433C6;
        Wed, 10 Mar 2021 18:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4C96FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3 1/3] bus: mhi: core: Introduce internal register poll
 helper function
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com
References: <1614138270-2374-1-git-send-email-bbhatt@codeaurora.org>
 <1614138270-2374-2-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <b53a5cf8-aa25-0e89-b83f-57ec32fa7075@codeaurora.org>
Date:   Wed, 10 Mar 2021 11:57:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1614138270-2374-2-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/23/2021 8:44 PM, Bhaumik Bhatt wrote:
> Introduce helper function to allow MHI core driver to poll for
> a value in a register field. This helps reach a common path to
> read and poll register values along with a retry time interval.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>   drivers/bus/mhi/core/internal.h |  3 +++
>   drivers/bus/mhi/core/main.c     | 23 +++++++++++++++++++++++
>   2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 6f80ec3..005286b 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -643,6 +643,9 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
>   int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
>   				    void __iomem *base, u32 offset, u32 mask,
>   				    u32 shift, u32 *out);
> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
> +				    void __iomem *base, u32 offset, u32 mask,
> +				    u32 shift, u32 val, u32 delayus);
>   void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
>   		   u32 offset, u32 val);
>   void mhi_write_reg_field(struct mhi_controller *mhi_cntrl, void __iomem *base,
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 4e0131b..249ae26 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -4,6 +4,7 @@
>    *
>    */
>   
> +#include <linux/delay.h>
>   #include <linux/device.h>
>   #include <linux/dma-direction.h>
>   #include <linux/dma-mapping.h>
> @@ -37,6 +38,28 @@ int __must_check mhi_read_reg_field(struct mhi_controller *mhi_cntrl,
>   	return 0;
>   }
>   
> +int __must_check mhi_poll_reg_field(struct mhi_controller *mhi_cntrl,
> +				    void __iomem *base, u32 offset,
> +				    u32 mask, u32 shift, u32 val, u32 delayus)
> +{
> +	int ret = -ENOENT;
> +	u32 out, retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
> +
> +	while (retry--) {
> +		ret = mhi_read_reg_field(mhi_cntrl, base, offset, mask, shift,
> +					 &out);
> +		if (ret)
> +			return -EIO;

I generally dislike recoding return codes.  Do you believe it adds value 
here?  I'm concerned that if I'm debugging an error, I'll get EIO, which 
I trace to here, but then I don't know what the actual error from 
mhi_read_reg_field() was.

> +
> +		if (out == val)
> +			return 0;
> +
> +		udelay(delayus);
> +	}
> +
> +	return ret;
> +}
> +
>   void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
>   		   u32 offset, u32 val)
>   {
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
