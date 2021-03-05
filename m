Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED03232F0B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 18:07:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhCERGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 12:06:47 -0500
Received: from z11.mailgun.us ([104.130.96.11]:41186 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229955AbhCERGm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 12:06:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614964002; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4HBFW6C5oMy1oEMtYd0HgO+nbbIQ5m8OeFCam0RueeA=;
 b=JsNbAtIyIJP2UyE9zB0aQgHkPVWHPInRQU5IgBbaSlg7Pd7CZKKvGOqxUP+U19GD9sH3zWTt
 k/OU2Q85vfnA+DyytgE0sxuYZD4XTedy5kH79Krk+mNicXv4vfglZ6ddGHgYhj4MIJd73b7o
 bcLI6QFc1IIfzfDfIpHhfkfuvmc=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60426514c862e1b9fd3f0e80 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 17:06:28
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 225FAC433CA; Fri,  5 Mar 2021 17:06:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 62B50C433C6;
        Fri,  5 Mar 2021 17:06:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 05 Mar 2021 09:06:27 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Carl_Yin=28=E6=AE=B7?= =?UTF-8?Q?=E5=BC=A0=E6=88=90=29?= 
        <carl.yin@quectel.com>, Naveen Kumar <naveen.kumar@quectel.com>
Subject: Re: [PATCH v2] bus: mhi: core: Add missing checks for MMIO register
 entries
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <CAMZdPi88VXV=6BBz=8MRcTVDfpZhC4Cm22qu9H9M7yaKwyZosA@mail.gmail.com>
References: <1614896049-15912-1-git-send-email-bbhatt@codeaurora.org>
 <CAMZdPi88VXV=6BBz=8MRcTVDfpZhC4Cm22qu9H9M7yaKwyZosA@mail.gmail.com>
Message-ID: <13b24e06c99ab497ea1a1af0496b0b7a@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-05 09:11 AM, Loic Poulain wrote:
> On Thu, 4 Mar 2021 at 23:14, Bhaumik Bhatt <bbhatt@codeaurora.org> 
> wrote:
>> 
>> As per documentation, fields marked as (required) in an MHI
>> controller structure need to be populated by the controller driver
>> before calling mhi_register_controller(). Ensure all required
>> pointers and non-zero fields are present in the controller before
>> proceeding with registration.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>  drivers/bus/mhi/core/init.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>> index 272f350..fed8a25 100644
>> --- a/drivers/bus/mhi/core/init.c
>> +++ b/drivers/bus/mhi/core/init.c
>> @@ -879,10 +879,9 @@ int mhi_register_controller(struct mhi_controller 
>> *mhi_cntrl,
>>         u32 soc_info;
>>         int ret, i;
>> 
>> -       if (!mhi_cntrl)
>> -               return -EINVAL;
>> -
>> -       if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
>> +       if (!mhi_cntrl || !mhi_cntrl->cntrl_dev || !mhi_cntrl->regs ||
>> +           !mhi_cntrl->fw_image || !mhi_cntrl->irq ||
> 
> Can we make fw_image optional, not all MHI devices are flashless, some
> directly boot into AMSS without firmware loading.
> 
Haha. Just as I posted this, I thought of the same thing. I agree. v3 
incoming.

Also, that patch will be a separate one so I can just remove FW image 
from here
and post the patch to make FW image optional.
>> +           !mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
>>             !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
>>             !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs)
>>                 return -EINVAL;
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
