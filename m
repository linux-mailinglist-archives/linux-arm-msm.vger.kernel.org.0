Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0473828C587
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 02:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgJMAGT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Oct 2020 20:06:19 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:17034 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726097AbgJMAGT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Oct 2020 20:06:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602547578; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ML0+jaoZ1OBNN29iovgFRYOPaLsbkufdiGw3b6HBh/s=;
 b=nliwOQTs2QJlZkYUe4zuEHLvcaRYeZEfGrM99Oxb19iGplH/pWBsOLA9aJiZREf2kNKkDPzV
 v0rYdLC78qqb4SQ+m61BiTjwTJx8tD95WAXr1begBJK7Q9sdIdopGUAIWq+ZWp6xvECaU74L
 S4Ic157fnQUCm76OBMjDRzcduQs=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f84eeeeef891f1ee2966797 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 00:03:58
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6EF74C433FE; Tue, 13 Oct 2020 00:03:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BCB88C433CB;
        Tue, 13 Oct 2020 00:03:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 12 Oct 2020 17:03:56 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mgautam@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 05/10] bus: mhi: core: Disable IRQs when powering down
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20201009160216.GF4810@Mani-XPS-13-9360>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-6-git-send-email-bbhatt@codeaurora.org>
 <20201009160216.GF4810@Mani-XPS-13-9360>
Message-ID: <8b49f421f81ff850e58d14795376337b@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-09 09:02, Manivannan Sadhasivam wrote:
> On Fri, Sep 18, 2020 at 07:02:30PM -0700, Bhaumik Bhatt wrote:
>> While powering down, the device may or may not acknowledge the MHI
>> RESET issued by host for graceful shutdown scenario which can lead
>> to a rogue device sending an interrupt after the clean-up has been
>> done. This can result in a tasklet being scheduled after it has
>> been killed and access already freed memory causing a NULL pointer
>> exception. Avoid this corner case by disabling the interrupts as a
>> part of host clean up.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>  drivers/bus/mhi/core/pm.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>> index 1862960..3462d82 100644
>> --- a/drivers/bus/mhi/core/pm.c
>> +++ b/drivers/bus/mhi/core/pm.c
>> @@ -517,6 +517,7 @@ static void mhi_pm_disable_transition(struct 
>> mhi_controller *mhi_cntrl,
>>  	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
>>  		if (mhi_event->offload_ev)
>>  			continue;
>> +		disable_irq(mhi_cntrl->irq[mhi_event->irq]);
> 
> No need to disable irq[0]?
> 
> Thanks,
> Mani
> 
>>  		tasklet_kill(&mhi_event->task);
>>  	}
>> 
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

This patch would disable the IRQ line and if IRQ lines are shared 
between BHI
and MHI, we would not see handling of BHI related work happen.

Discussed this with Hemant and and as I am dropping the previous patch, 
will update
this one to make it free_irq() instead which removes the IRQ handler and 
does not
disable the interrupt line.

The function mhi_deinit_free_irq() will not be called from 
mhi_power_down() and
instead, only a free for the main IRQ handler will be called.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
