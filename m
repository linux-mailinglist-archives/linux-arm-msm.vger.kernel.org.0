Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7466A28C576
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 01:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389297AbgJLXxU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Oct 2020 19:53:20 -0400
Received: from z5.mailgun.us ([104.130.96.5]:36170 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389289AbgJLXxU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Oct 2020 19:53:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602546799; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=r4GqumW05KH7+Nrt91D8kXZa1fGG3XxTAyZUX/6FE/8=;
 b=ewjc54FBHDOZXQyoF4Pi0rjSJSQkEV9zvCIHwpIfvvWZuPtRIP2O3Kph8osFmCHLZs7Itwhh
 W9Aujg6AAAsvzrrBRboqvawcnVhkxEkvnXxCed85s2zVEJ0/3yFNlsXuz93t2l1+cdxaHuff
 F+PBu75ARYYDQ17BEJqaoW9NvUk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f84ec324f8cc67c31114188 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Oct 2020 23:52:18
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DA3E0C433C9; Mon, 12 Oct 2020 23:52:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 81A98C433CB;
        Mon, 12 Oct 2020 23:52:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 12 Oct 2020 16:52:17 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, jhugo=codeaurora.org@codeaurora.org
Subject: Re: [PATCH v1 04/10] bus: mhi: core: Use the IRQF_ONESHOT flag for
 the BHI interrupt line
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <26de08b5-b477-c5b9-fdca-eb80bcf98561@codeaurora.org>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-5-git-send-email-bbhatt@codeaurora.org>
 <20201009155706.GE4810@Mani-XPS-13-9360>
 <26de08b5-b477-c5b9-fdca-eb80bcf98561@codeaurora.org>
Message-ID: <b3ba694d03469e767f1e82260cb8a006@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-09 09:04, Jeffrey Hugo wrote:
> On 10/9/2020 9:57 AM, Manivannan Sadhasivam wrote:
>> On Fri, Sep 18, 2020 at 07:02:29PM -0700, Bhaumik Bhatt wrote:
>>> Remove the IRQF_SHARED flag as it is not needed for the BHI interrupt
>>> and replace it with IRQF_ONESHOT so that host can be sure that the
>>> next BHI hard interrupt is triggered only when the threaded interrupt
>>> handler has returned. This is to avoid any race conditions we may run
>>> into if BHI interrupts fire one after another.
>>> 
>>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>>> ---
>>>   drivers/bus/mhi/core/init.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>> 
>>> diff --git a/drivers/bus/mhi/core/init.c 
>>> b/drivers/bus/mhi/core/init.c
>>> index ca32563..9ae4c19 100644
>>> --- a/drivers/bus/mhi/core/init.c
>>> +++ b/drivers/bus/mhi/core/init.c
>>> @@ -167,7 +167,7 @@ int mhi_init_irq_setup(struct mhi_controller 
>>> *mhi_cntrl)
>>>   	/* Setup BHI_INTVEC IRQ */
>>>   	ret = request_threaded_irq(mhi_cntrl->irq[0], mhi_intvec_handler,
>>>   				   mhi_intvec_threaded_handler,
>>> -				   IRQF_SHARED | IRQF_NO_SUSPEND,
>>> +				   IRQF_ONESHOT | IRQF_NO_SUSPEND,
>> 
>> Jeff, I believe you're the one requested for shared irq during initial 
>> push.
>> Are you okay with this?
> 
> Nope  :)
> 
> AIC100 has a single interrupt for BHI/MHI activity, so this needs to be 
> shared.

Did not account for this. Will drop this patch.

Thanks,
Bhaumik

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a
Linux Foundation Collaborative Project
