Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D326A1AD00B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 21:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728962AbgDPTCR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 15:02:17 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:16113 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727782AbgDPTCP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 15:02:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587063735; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=QHkedZEwWQEVeZsqvvOLG0I8Dhpk5m6hlvwQ9hGoh0A=; b=QM5X6cMe9LTkzJRp8TPgTh108VQBF++IZH50T2NsJpT7tiVWIEEsPm1C+52TNO540Y3QGixO
 5SLmmotaZ3DodV9ydjLMRwvH1zrR3N1JTLY9gO1MsOJ4SZKciSyI79uwzISANNtoZYqWiuzc
 dwGQbCcMvUOLXXz0ThIdnzae4T4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e98ab8b.7f4c067a4420-smtp-out-n04;
 Thu, 16 Apr 2020 19:01:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9262BC433F2; Thu, 16 Apr 2020 19:01:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E66AFC433CB;
        Thu, 16 Apr 2020 19:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E66AFC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH 1/2] bus: mhi: core: Fix parsing of mhi_flags
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "jhugo@codeaurora.org; dan.carpenter"@oracle.com
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        smohanad@codeaurora.org, dan.carpenter@oracle.com
References: <20200413120741.2832-1-manivannan.sadhasivam@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <73d4815e-af00-e4cd-95c5-5043d334224c@codeaurora.org>
Date:   Thu, 16 Apr 2020 12:01:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200413120741.2832-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 4/13/20 5:07 AM, Manivannan Sadhasivam wrote:
> With the current parsing of mhi_flags, the following statement always
> return false:
>
> eob = !!(flags & MHI_EOB);
>
> This is due to the fact that 'enum mhi_flags' starts with index 0 and we
> are using direct AND operation to extract each bit. Fix this by using
> BIT() macro to extract each bit and make the mhi_flags index start from 1.
>
> Fixes: 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/bus/mhi/core/main.c | 6 +++---
>   include/linux/mhi.h         | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index eb4256b81406..4165a853c189 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1090,9 +1090,9 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>   	if (ret)
>   		return ret;
>   
> -	eob = !!(flags & MHI_EOB);
> -	eot = !!(flags & MHI_EOT);
> -	chain = !!(flags & MHI_CHAIN);
> +	eob = !!(flags & BIT(0));
> +	eot = !!(flags & BIT(1));
> +	chain = !!(flags & BIT(2));

How about setting enums  with BIT macro and still use same enums above. 
If flags is having MHI _CHAIN (enum value 3) but comparing with BIT(2) 
(value 4) will not work.

>   	bei = !!(mhi_chan->intmod);
>   
>   	mhi_tre = tre_ring->wp;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index ad1996001965..22185fecbbf2 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -53,7 +53,7 @@ enum mhi_callback {
>    * @MHI_CHAIN: Linked transfer
>    */
>   enum mhi_flags {
> -	MHI_EOB,
> +	MHI_EOB = 1,
>   	MHI_EOT,
>   	MHI_CHAIN,
>   };

enum mhi_flags {

     MHI_EOB = BIT(0),

     MHI_EOT = BIT(1),

     MHI_CHAIN = BIT(2),

}

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
