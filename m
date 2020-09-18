Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B807270458
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 20:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgIRSsf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 14:48:35 -0400
Received: from m42-11.mailgun.net ([69.72.42.11]:56272 "EHLO
        m42-11.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgIRSsc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 14:48:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600454911; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=I15lYOFQgP5KLwMoydnHHG3ATiZuNtYswFCmvUG0xyo=;
 b=UoHcSd2G1WAzl/TaJTyPl3Bwkt4POx0aC9j+UhFXSvLOPpgAR+SsTp12Wsull1gVHWaFuhA2
 o3z6Z4HWK6smTGqhaO1h9l8BD2Y7F+8MWkX4wZFnxbMPWwI6Qv1cyVi92IUEtzaSF4HdHha+
 a46ApnwvczMR9UswGGdK/cHarAI=
X-Mailgun-Sending-Ip: 69.72.42.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f6500f6c4180d293b3726c4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 18:48:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5D063C433F1; Fri, 18 Sep 2020 18:48:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 93856C433CA;
        Fri, 18 Sep 2020 18:48:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Sep 2020 11:48:21 -0700
From:   bbhatt@codeaurora.org
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] bus: mhi: core: Remove warnings for missing
 MODULE_LICENSE()
In-Reply-To: <20200918171809.GA3410@Mani-XPS-13-9360>
References: <1600381176-37604-1-git-send-email-bbhatt@codeaurora.org>
 <1600381176-37604-2-git-send-email-bbhatt@codeaurora.org>
 <6f7b6be3-f52d-b082-6065-c75e3d89d252@codeaurora.org>
 <0e34b5a2562b776ea410c80479107581@codeaurora.org>
 <20200918171809.GA3410@Mani-XPS-13-9360>
Message-ID: <4506782e8bb9a50d80b4a40575ae532e@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-18 10:18, Manivannan Sadhasivam wrote:
> On Fri, Sep 18, 2020 at 09:49:05AM -0700, bbhatt@codeaurora.org wrote:
>> On 2020-09-18 07:27, Jeffrey Hugo wrote:
>> > On 9/17/2020 4:19 PM, Bhaumik Bhatt wrote:
>> > > When building MHI as a module, missing MODULE_LICENSE() warnings
>> > > are seen. Avoid them by adding the license and description
>> > > information for the files where the warnings are seen.
>> > >
>> > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> > > ---
>> > >   drivers/bus/mhi/core/boot.c | 3 +++
>> > >   drivers/bus/mhi/core/main.c | 3 +++
>> > >   drivers/bus/mhi/core/pm.c   | 3 +++
>> > >   3 files changed, 9 insertions(+)
>> > >
>> > > diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
>> > > index 24422f5..78140cc 100644
>> > > --- a/drivers/bus/mhi/core/boot.c
>> > > +++ b/drivers/bus/mhi/core/boot.c
>> > > @@ -523,3 +523,6 @@ void mhi_fw_load_handler(struct mhi_controller
>> > > *mhi_cntrl)
>> > >   error_alloc_fw_table:
>> > >   	release_firmware(firmware);
>> > >   }
>> > > +
>> > > +MODULE_LICENSE("GPL v2");
>> > > +MODULE_DESCRIPTION("MHI Host Interface");
>> > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> > > index 2cff5dd..172026f 100644
>> > > --- a/drivers/bus/mhi/core/main.c
>> > > +++ b/drivers/bus/mhi/core/main.c
>> > > @@ -1533,3 +1533,6 @@ int mhi_poll(struct mhi_device *mhi_dev, u32
>> > > budget)
>> > >   	return ret;
>> > >   }
>> > >   EXPORT_SYMBOL_GPL(mhi_poll);
>> > > +
>> > > +MODULE_LICENSE("GPL v2");
>> > > +MODULE_DESCRIPTION("MHI Host Interface");
>> > > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>> > > index ce4d969..72c3dbc 100644
>> > > --- a/drivers/bus/mhi/core/pm.c
>> > > +++ b/drivers/bus/mhi/core/pm.c
>> > > @@ -1150,3 +1150,6 @@ void mhi_device_put(struct mhi_device *mhi_dev)
>> > >   	read_unlock_bh(&mhi_cntrl->pm_lock);
>> > >   }
>> > >   EXPORT_SYMBOL_GPL(mhi_device_put);
>> > > +
>> > > +MODULE_LICENSE("GPL v2");
>> > > +MODULE_DESCRIPTION("MHI Host Interface");
>> > >
>> >
>> > I would expect you only need to add the MODULE_* once per module, in
>> > which case main.c is probably the only place that needs it.
>> 
>> Hi Jeff,
>> 
>> I thought so too. This is to fix below warnings seen when building MHI 
>> as a
>> MODULE:
>> 
>> WARNING: modpost: missing MODULE_LICENSE() in 
>> drivers/bus/mhi/core/main.o
>> WARNING: modpost: missing MODULE_LICENSE() in 
>> drivers/bus/mhi/core/pm.o
>> WARNING: modpost: missing MODULE_LICENSE() in 
>> drivers/bus/mhi/core/boot.o
>> 
>> We've only had those in init.c so far.
>> 
> 
> Can you please test below diff to see if it fixes the warning?
> 
> diff --git a/drivers/bus/mhi/core/Makefile 
> b/drivers/bus/mhi/core/Makefile
> index 66e2700c9032..bc1469778cf8 100644
> --- a/drivers/bus/mhi/core/Makefile
> +++ b/drivers/bus/mhi/core/Makefile
> @@ -1,3 +1,3 @@
> -obj-$(CONFIG_MHI_BUS) := mhi.o
> +obj-$(CONFIG_MHI_BUS) += mhi.o
> 
>  mhi-y := init.o main.o pm.o boot.o
> 
> Thanks,
> Mani
> 
>> Thanks,
>> Bhaumik
>> 
>> 'The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>> Forum,\na Linux Foundation Collaborative Project'
Hi Mani,

Yes I was just about to reply. I realized it was due to the Makefile 
change. I have fixed and
tested it. The warnings are gone now. I will remove the patch.

Thanks,
Bhaumik

'The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
Forum,\na Linux Foundation Collaborative Project'
