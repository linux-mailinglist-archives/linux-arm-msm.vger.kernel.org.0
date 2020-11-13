Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779D92B2121
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 17:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgKMQ4i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 11:56:38 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:54130 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725967AbgKMQ4i (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 11:56:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605286597; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VnuqGGMAoVKQmS3uPfvSDiRKX5sLc7Aa/+4cMopGiSE=;
 b=tPm24+NqezNce5Q11o3yLSH1QWiG1qgX0VofE2wLkjnTMWce0Wk/bn1tWE9WZAtyRa6LccBC
 uBtNN9bIRJDWjKOcfQhD1ZrEuYj8Zs4woc5cXvov5TS3TD/1Frvj4zglDoPVke+LGRV30b1d
 JjED2VNJpgRDicdT67irrXz2Qa8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5faebabe37ede2253bc4dcb9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Nov 2020 16:56:30
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5D3B0C433C9; Fri, 13 Nov 2020 16:56:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E9B3C433C8;
        Fri, 13 Nov 2020 16:56:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 13 Nov 2020 08:56:28 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/8] mhi: pci-generic: Increase number of hardware events
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1605279602-18749-2-git-send-email-loic.poulain@linaro.org>
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
 <1605279602-18749-2-git-send-email-loic.poulain@linaro.org>
Message-ID: <f295df264af652d2b093e7b5ab7057d9@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-13 06:59, Loic Poulain wrote:
> If the IPA (IP hardware accelerator) is starved of event ring elements,
> the modem is crashing (SDX55). That can be prevented by setting a
> larger number of events (i.e 2 x number of channel ring elements).
> 
> Tested with FN980m module.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c 
> b/drivers/bus/mhi/pci_generic.c
> index e3df838..13a7e4f 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -91,7 +91,7 @@ struct mhi_pci_dev_info {
> 
>  #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
>  	{					\
> -		.num_elements = 128,		\
> +		.num_elements = 256,		\
>  		.irq_moderation_ms = 5,		\
>  		.irq = (ev_ring) + 1,		\
>  		.priority = 1,			\

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
