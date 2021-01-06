Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F202D2EB80E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 03:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbhAFC30 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 21:29:26 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:43699 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbhAFC30 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 21:29:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609900146; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=A5N0orIrC3VKt9mnPqBiN6omnhAIAbEiMnHo6/FE3EU=; b=ABGAJa7Y/mBdtK+7mxQgvw25RUlV/7HA7RgIlIU8cB/JudrF8vsV+p3J2tB0Z4YJl/rflBjC
 tDBXjRU3SimvuhUIK7tltGuU9OurQNFJiejbhC7msOQ/8qHQgQVSiMdh83yOlfgx19ADuN+K
 0yyUqYeXABA2m8zNfN12zCw8/xQ=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5ff52057a1d2634b3f99b431 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Jan 2021 02:28:39
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E1E14C433CA; Wed,  6 Jan 2021 02:28:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D86EC433C6;
        Wed,  6 Jan 2021 02:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4D86EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v2 1/2] mhi: unconstify mhi_event_config
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org
References: <1609865076-13890-1-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <b8f16e9d-0d95-0122-12f6-2565d777e707@codeaurora.org>
Date:   Tue, 5 Jan 2021 18:28:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1609865076-13890-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic

On 1/5/21 8:44 AM, Loic Poulain wrote:
> Some parameters may have to be determined at runtime.
> It is the case for the event ring MSI vector.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   v2: no change
> 
>   include/linux/mhi.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 62da830..48b1b2a 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -290,7 +290,7 @@ struct mhi_controller_config {
>   	u32 num_channels;
>   	const struct mhi_channel_config *ch_cfg;
>   	u32 num_events;
> -	const struct mhi_event_config *event_cfg;
> +	struct mhi_event_config *event_cfg;
commented on previous patch set, copying my comment here
Do we need to update mhi controller driver like ath11k and generic pci 
driver to avoid compiler warnings?
>   	bool use_bounce_buf;
>   	bool m2_no_db;
>   };
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
