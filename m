Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634A521DCE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 18:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729835AbgGMQfX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 12:35:23 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:45834 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730385AbgGMQfX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 12:35:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594658122; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: To: Subject:
 From: Sender; bh=l6qBwk/nDrs1cZgDmy4aPIdPLM4bZMpN+mrbFN0PmqU=; b=DkBIeclvuwYLhhpm6AoQ83UrnrQvKM7UT4Z0hD94yT1nrcjuJ+fbzM1OB4i7WLtos2bYjOLf
 AxKYrpTHqnDzLopVFNB1rtQhmEjpJGEE+ubd82JTsjffdBP6D8lzpDcI7CxXAQU9B0dsYcyH
 czgKeVgxBFmP+qTAbfj+3B1E/kw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f0c8d378e36ecda30614b00 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Jul 2020 16:35:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4DAC6C433C6; Mon, 13 Jul 2020 16:35:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.179] (cpe-76-167-231-33.san.res.rr.com [76.167.231.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F87EC433C8;
        Mon, 13 Jul 2020 16:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2F87EC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
Subject: Re: [PATCH] firmware: qcom_scm: Fix legacy convention SCM accessors
To:     Jonathan McDowell <noodles@earth.li>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200704172334.GA759@earth.li>
Message-ID: <d38c8e7c-443c-33f0-be8d-dedd58dd4fe1@codeaurora.org>
Date:   Mon, 13 Jul 2020 09:35:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200704172334.GA759@earth.li>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For the Qualcomm TrustZone firmwares which I am familiar with:

Reviewed-by: Elliot Berman <eberman@codeaurora.org>

On 7/4/2020 10:23 AM, Jonathan McDowell wrote:
> The move to a combined driver for the QCOM SCM hardware changed the
> io_writel and io_readl helpers to use non-atomic calls, despite the
> commit message saying that atomic was a better option. This breaks these
> helpers on hardware that uses the old legacy convention (access fails
> with a -95 return code). Switch back to using the atomic calls.
> 
> Observed as a failure routing GPIO interrupts to the Apps processor on
> an IPQ8064; fix is confirmed as correctly allowing the interrupts to be
> routed and observed.
> 
> Fixes: 57d3b816718c ("firmware: qcom_scm: Remove thin wrappers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jonathan McDowell <noodles@earth.li>
> ---
>  drivers/firmware/qcom_scm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 0e7233a20f34..d4fda210adfe 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -391,7 +391,7 @@ static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
>  
>  	desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
>  
> -	return qcom_scm_call(__scm->dev, &desc, NULL);
> +	return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
>  }
>  
>  static void qcom_scm_set_download_mode(bool enable)
> @@ -650,7 +650,7 @@ int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val)
>  	int ret;
>  
>  
> -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	ret = qcom_scm_call_atomic(__scm->dev, &desc, &res);
>  	if (ret >= 0)
>  		*val = res.result[0];
>  
> @@ -669,8 +669,7 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int val)
>  		.owner = ARM_SMCCC_OWNER_SIP,
>  	};
>  
> -
> -	return qcom_scm_call(__scm->dev, &desc, NULL);
> +	return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
>  }
>  EXPORT_SYMBOL(qcom_scm_io_writel);
>  
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
