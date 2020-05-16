Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABD181D5E0C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2020 04:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgEPC7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 22:59:06 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:32571 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727956AbgEPC7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 22:59:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589597946; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=vAHRZO2aoumgoKX5GjqHJFJCsrd29AsXO2S+dqIqaKk=;
 b=tSZQ862Qz8L83QMflslATfkssGOTMYhFA+iSEf9HEhHTXeQBoYbPLINEgQ7hbF89AkJLfgDr
 00aGyyTTb9BkSWqiITbhZbDSCMc/+t8I6rlylNvHz37KnuYkyJCvDTpvdj4DGarUOm7mSBnF
 fTaO/hw/R1AjQRoggIx2TZ2gl6E=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ebf56e1aefa5a01cc046e25 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 16 May 2020 02:58:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 822EBC432C2; Sat, 16 May 2020 02:58:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1ED0C433D2;
        Sat, 16 May 2020 02:58:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 May 2020 19:58:39 -0700
From:   bbhatt@codeaurora.org
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: Use current ee in intvec handler
In-Reply-To: <1589509049-14532-1-git-send-email-jhugo@codeaurora.org>
References: <1589509049-14532-1-git-send-email-jhugo@codeaurora.org>
Message-ID: <aab020af0372b11ff63ba4526aab0fdc@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-14 19:17, Jeffrey Hugo wrote:
> The intvec handler stores the caches ee in a local variable for use in
> processing the intvec.  It should instead use the current ee which is
> read at the beginning of the intvec incase that the intvec is related 
> to
> an ee change.  Otherwise, the handler might make the wrong decision
> based on an incorrect ee.
> 
> Fixes: 3000f85b8f47 (bus: mhi: core: Add support for basic PM 
> operations)
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  drivers/bus/mhi/core/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 7272a5a..0a41fe5 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -386,8 +386,8 @@ irqreturn_t mhi_intvec_threaded_handler(int
> irq_number, void *dev)
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
>  		state = mhi_get_mhi_state(mhi_cntrl);
> -		ee = mhi_cntrl->ee;
>  		mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
> +		ee = mhi_cntrl->ee;
>  	}
> 
>  	if (state == MHI_STATE_SYS_ERR) {
Hi Jeff,

Let's hold off on this change for now please as we have some good set of
bug fixes and improvements coming in very soon. They're only pending 
post
to LKML.

Thanks
