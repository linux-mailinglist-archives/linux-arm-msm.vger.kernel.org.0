Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134B33AD165
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 19:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234242AbhFRRp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 13:45:26 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:28127 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233934AbhFRRpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 13:45:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624038196; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WgLS2/3NtLjKkjEgDI5ory+8H10ZKBPmMZF6FlD9dMQ=;
 b=XwZpteruADBwmVoRyUYEEvP+cEZkWezQjtZXM+xctsLS6YIBZHLWHy4wGTRJXHbYDcKg4tTX
 XMgrIGDWZaj7P2+ffEC61hyiw9AOXGU13b454RRZOQVRoxiDDiYAMuUc/DFGt3v/JcPLO3j4
 FQVbenTHRraKYuuGcyyNgBJIENU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60ccdb2eea2aacd72903a8a2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 17:43:10
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 464BCC43460; Fri, 18 Jun 2021 17:43:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 25348C4338A;
        Fri, 18 Jun 2021 17:43:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Jun 2021 10:43:09 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: [PATCH v1 1/4] bus: mhi: core: Add support for processing
 priority of event ring
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20210618173102.GB30140@workstation>
References: <1623965435-30224-1-git-send-email-bbhatt@codeaurora.org>
 <1623965435-30224-2-git-send-email-bbhatt@codeaurora.org>
 <20210618070322.GO3682@workstation>
 <df7c735f0caeb449bbaa8a6e040ae556@codeaurora.org>
 <20210618173102.GB30140@workstation>
Message-ID: <a7dabe81a269af96638389854294d0ae@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,
On 2021-06-18 10:31 AM, Manivannan Sadhasivam wrote:
> On Fri, Jun 18, 2021 at 10:17:59AM -0700, Bhaumik Bhatt wrote:
>> Hi Mani,
>> 
>> On 2021-06-18 12:03 AM, Manivannan Sadhasivam wrote:
>> > On Thu, Jun 17, 2021 at 02:30:32PM -0700, Bhaumik Bhatt wrote:
>> > > From: Hemant Kumar <hemantk@codeaurora.org>
>> > >
>> > > Event ring priorities are currently set to 1 and are unused.
>> > > Default processing priority for event rings is set to regular
>> > > tasklet. Controllers can choose to use high priority tasklet
>> > > scheduling for certain event rings critical for processing such
>> > > as ones transporting control information if they wish to avoid
>> > > with system scheduling delays for those packets. In order to
>> > > support these use cases, allow controllers to set event ring
>> > > priority to high. This patch only adds support and does not
>> > > enable usage of these priorities.
>> > >
>> > > Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
>> > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> > > ---
>> > >  drivers/bus/mhi/core/internal.h |  2 +-
>> > >  drivers/bus/mhi/core/main.c     | 19 ++++++++++++++++---
>> > >  include/linux/mhi.h             | 14 ++++++++++++--
>> > >  3 files changed, 29 insertions(+), 6 deletions(-)
>> > >
>> > > diff --git a/drivers/bus/mhi/core/internal.h
>> > > b/drivers/bus/mhi/core/internal.h
>> > > index 672052f..666e102 100644
>> > > --- a/drivers/bus/mhi/core/internal.h
>> > > +++ b/drivers/bus/mhi/core/internal.h
>> > > @@ -535,7 +535,7 @@ struct mhi_event {
>> > >  	u32 intmod;
>> > >  	u32 irq;
>> > >  	int chan; /* this event ring is dedicated to a channel (optional) */
>> > > -	u32 priority;
>> > > +	enum mhi_er_priority priority;
>> >
>> > Instead of using enum for priorities, can we just make use of the
>> > existing "priority" field? Since the existing controllers set it to "1",
>> > can we use "0" as the high priority?
>> >
>> > This way we don't need to change the controller drivers.
>> >
>> I agree but the reasons to do the enum approach was to allow for 
>> future
>> expansion of the handling if it becomes necessary and provide clarity 
>> for
>> the field.
>> 
>> I can always do it this way for now and we can have the enum for 
>> another
>> time but would prefer updating what we have now.
> 
> Yeah, let's deal with it later once the necessity arises.
> 
Sure. I will make the v2.

>> > >  	enum mhi_er_data_type data_type;
>> > >  	struct mhi_ring ring;
>> > >  	struct db_cfg db_cfg;
>> > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> > > index 8ac73f9..bfc9776 100644
>> > > --- a/drivers/bus/mhi/core/main.c
>> > > +++ b/drivers/bus/mhi/core/main.c
>> > > @@ -425,10 +425,11 @@ void mhi_create_devices(struct mhi_controller
>> > > *mhi_cntrl)
>> > >  	}
>> > >  }
>> > >
> 
> [...]
> 
>> Existing controllers would be fine.
>> 
>> Do you think we have a problem if a new controller blindly inputs a 
>> "0" in
>> the priority not knowing the impact of it?
>> 
> 
> We should document it in the kernel doc for the struct field and that
> should be enough. We can't do much if people doesn't read the doc ;)
> 
> Thanks,
> Mani
> 
Totally agree :)

>> If you give me a go ahead, I can make these changes in v2 and leave 
>> the enum
>> stuff out.
>> 
>> Thanks,
>> Bhaumik
>> ---
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
