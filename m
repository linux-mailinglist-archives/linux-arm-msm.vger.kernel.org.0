Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE4E28A483
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Oct 2020 01:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387399AbgJJXpT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Oct 2020 19:45:19 -0400
Received: from z5.mailgun.us ([104.130.96.5]:34650 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387568AbgJJXpS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Oct 2020 19:45:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602373518; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+sjzZxdSz1OxaSjQtFwsicElknUm3wlBG4uyjUVXudw=; b=WkFLdINm/oGrPiIOTR9GSmtKRcvvEmOSDfkTF9ESSpnbXS+MmAVynel+3kcz7NmPhGvEAr5Z
 SbP86hwP1FjfNGNYWq/U8s1HnKb/J6DPkeu/sWRtlmx2yqt4qNyu4y3lsQmwf2jyi0KwtP+f
 vjs6MpUMhMyTr51UGh05Lb0o+YQ=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f824783856d9308b5e16c82 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 10 Oct 2020 23:45:07
 GMT
Sender: mgautam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A2DC9C433FF; Sat, 10 Oct 2020 23:45:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.8] (unknown [223.230.69.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 230EAC433C9;
        Sat, 10 Oct 2020 23:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 230EAC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: [PATCH v1 05/10] bus: mhi: core: Disable IRQs when powering down
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-6-git-send-email-bbhatt@codeaurora.org>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <2c77a164-db22-16c8-ebce-21a028fc1ed6@codeaurora.org>
Date:   Sun, 11 Oct 2020 05:15:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1600480955-16827-6-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

On 9/19/2020 7:32 AM, Bhaumik Bhatt wrote:
> While powering down, the device may or may not acknowledge the MHI
> RESET issued by host for graceful shutdown scenario which can lead
> to a rogue device sending an interrupt after the clean-up has been
> done. This can result in a tasklet being scheduled after it has
> been killed and access already freed memory causing a NULL pointer
> exception. Avoid this corner case by disabling the interrupts as a
> part of host clean up.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/pm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 1862960..3462d82 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -517,6 +517,7 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl,
>  	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
>  		if (mhi_event->offload_ev)
>  			continue;
> +		disable_irq(mhi_cntrl->irq[mhi_event->irq]);
>  		tasklet_kill(&mhi_event->task);
>  	}
>  

What about sys_err handling? IRQ may be left disabled?


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

