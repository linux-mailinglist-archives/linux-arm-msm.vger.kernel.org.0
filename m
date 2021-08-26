Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEB73F8CC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 19:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243172AbhHZRMn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 13:12:43 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:36177 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232432AbhHZRMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 13:12:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629997915; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3AEzHXCRF73WUOr0pkkL3X7+bnWg8BdvqsbmAMFaBDc=;
 b=LcWgSEPUXZv/90jnh2mrYVrRHodU5wTj2PcAKPuevjtDmW7YH/Zm7IUNn8KEkkW8n1NXqsxz
 LSiZSHWxMrcE4j+xt+XVmFg7ZH8HbNcFv9D1war5tWMg1S6qX9Kp1r+PYIwv6QQN/SYGoJcc
 2RLaoGfQuKjpZT8XKpE3tSDoFJ8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6127cb51d6653df767f9ce15 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 17:11:45
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BC63CC4338F; Thu, 26 Aug 2021 17:11:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CA794C4360D;
        Thu, 26 Aug 2021 17:11:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 26 Aug 2021 10:11:40 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     mani@kernel.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Subject: Re: [PATCH] bus: mhi: core: Update comments on
 mhi_prepare_for_power_up
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1629995575-32389-1-git-send-email-quic_jhugo@quicinc.com>
References: <1629995575-32389-1-git-send-email-quic_jhugo@quicinc.com>
Message-ID: <57b617bf9689ce3d7d04472af0cb3d5e@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-26 09:32 AM, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> After "bus: mhi: core: Remove pre_init flag used for power purposes"
> mhi_prepare_for_power_up() is no longer an optional API. All users
> of MHI should call this API before power up sequence to initialize
> MHI context. Update the comments on this API to make this clear.
> 
> Fixes: eee87072e2fb ("bus: mhi: core: Remove pre_init flag used for
> power purposes")
> Signed-off-by: Pranjal Ramajor Asha Kanojiya 
> <quic_pkanojiy@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  include/linux/mhi.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 56e7934..483b852 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -617,10 +617,8 @@ int mhi_get_free_desc_count(struct mhi_device 
> *mhi_dev,
> 
>  /**
>   * mhi_prepare_for_power_up - Do pre-initialization before power up.
> - *                            This is optional, call this before power 
> up if
> - *                            the controller does not want bus 
> framework to
> - *                            automatically free any allocated memory 
> during
> - *                            shutdown process.
> + *                            Call this before MHI power up sequence 
> to
> + *                            initialize MHI context.
>   * @mhi_cntrl: MHI controller
>   */
>  int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl);

Thanks for catching this!

Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Adding Mani's Linaro email ID for pick-up.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
