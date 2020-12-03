Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6BEF2CCAF0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 01:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725918AbgLCAQh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 19:16:37 -0500
Received: from m42-5.mailgun.net ([69.72.42.5]:25980 "EHLO m42-5.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726815AbgLCAQh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 19:16:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606954571; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=DVl1UyMG97vuR2i9Cjd4cq7c6dQ7hQ37SwsMSZUzHEI=; b=RK5sBnMLBBVeZzITE0aQqz5gSIlVNjP3D09TZPxpPcwfV7DCrEWhh7TZlcPHl6eqzLetbsLa
 Z8XS9ddrMma28QV/zJeFg8PhlJz6Q6mXesoHUcAK3t2bIrK2/1LcXqVgcRN7lJA8nmjITEt1
 DImsT+YR3VhiB2jT5vFAKUe7qsw=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fc82e304f56090fbc513d41 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Dec 2020 00:15:44
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8F265C43463; Thu,  3 Dec 2020 00:15:43 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 94C0AC433ED;
        Thu,  3 Dec 2020 00:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94C0AC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 1/7] bus: mhi: core: Allow receiving a STOP channel
 command response
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, loic.poulain@linaro.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
References: <1606952438-15321-1-git-send-email-bbhatt@codeaurora.org>
 <1606952438-15321-2-git-send-email-bbhatt@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <6668b99c-a1a7-920a-4a7e-e2cb2729baee@codeaurora.org>
Date:   Wed, 2 Dec 2020 16:15:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1606952438-15321-2-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,

On 12/2/20 3:40 PM, Bhaumik Bhatt wrote:
> Add support to receive the response to a STOP channel command to the
How about saying "Add support to send the STOP channel command ?
> MHI bus. If a client would like to STOP a channel instead of issuing
> a RESET to it, this would provide support for it.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>   drivers/bus/mhi/core/main.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 702c31b..a7bb8a7 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1193,6 +1193,11 @@ int mhi_send_cmd(struct mhi_controller *mhi_cntrl,
>   		cmd_tre->dword[0] = MHI_TRE_CMD_RESET_DWORD0;
>   		cmd_tre->dword[1] = MHI_TRE_CMD_RESET_DWORD1(chan);
>   		break;
> +	case MHI_CMD_STOP_CHAN:
> +		cmd_tre->ptr = MHI_TRE_CMD_STOP_PTR;
> +		cmd_tre->dword[0] = MHI_TRE_CMD_STOP_DWORD0;
> +		cmd_tre->dword[1] = MHI_TRE_CMD_STOP_DWORD1(chan);
> +		break;
>   	case MHI_CMD_START_CHAN:
>   		cmd_tre->ptr = MHI_TRE_CMD_START_PTR;
>   		cmd_tre->dword[0] = MHI_TRE_CMD_START_DWORD0;
> 

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
