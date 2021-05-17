Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07961383BD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 20:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236411AbhEQSCx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 14:02:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:47631 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236218AbhEQSCw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 14:02:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621274496; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HghXV7U8crVCvtvamwZ88CtzP5Z6hUhoeBUaorx0p0k=;
 b=MTfOB+hmx6oemAow7WaFkGU2dh+xR8SLfb7UV1RkAJt9CukyDH2uMXU1Td0fJCTeiTvBOcsN
 p/X5h8KwAxIj9TJ3Srma/POYBDDJ4oMsxn4Db/XWERQ8mHWJYUpgh1g7iApDe0Bc8VRY3FWs
 vNXoZ/GDx1gISyNPh8k1XnO/DGk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60a2af672bff04e53bf18602 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 May 2021 18:01:11
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 093B1C433D3; Mon, 17 May 2021 18:01:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A189C433F1;
        Mon, 17 May 2021 18:01:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 17 May 2021 11:01:10 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Shujun Wang <wsj20369@163.com>
Cc:     mani@kernel.org, hemantk@codeaurora.org, loic.poulain@linaro.org,
        jarvis.w.jiang@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND,v2] bus: mhi: pci_generic: T99W175: update channel
 name from AT to DUN
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20210517095415.3626-1-wsj20369@163.com>
References: <20210517095415.3626-1-wsj20369@163.com>
Message-ID: <88d7754c381ba9eb927b4dd91e30ca35@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-17 02:54 AM, Shujun Wang wrote:
> From: Jarvis Jiang <jarvis.w.jiang@gmail.com>
> 
> According to MHI v1.1 specification, change the channel name of T99W175
> from "AT" to "DUN" (Dial-up networking) for both channel 32 and 33,
> so that the channels can be bound to the Qcom WWAN control driver, and
> device node such as /dev/wwan0p3AT will be generated, which is very 
> useful
> for debugging modem
> 
> Fixes: aac426562f56 ("bus: mhi: pci_generic: Introduce Foxconn T99W175 
> support")
> Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>
> Signed-off-by: Shujun Wang <wsj20369@163.com>

Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
> 
> v2: Add: Fixes: aac426562f56
> 
>  drivers/bus/mhi/pci_generic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c 
> b/drivers/bus/mhi/pci_generic.c
> index 7c810f02a2ef..8c7f6576e421 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -311,8 +311,8 @@ static const struct mhi_channel_config
> mhi_foxconn_sdx55_channels[] = {
>  	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
>  	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> -	MHI_CHANNEL_CONFIG_UL(32, "AT", 32, 0),
> -	MHI_CHANNEL_CONFIG_DL(33, "AT", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
>  	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
