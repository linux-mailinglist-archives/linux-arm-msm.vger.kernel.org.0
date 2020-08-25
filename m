Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18804251F6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 21:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgHYTBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 15:01:40 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:56988 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726066AbgHYTBj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 15:01:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598382097; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TRQuySeZQtx9Xu8p/LTvIapZAq6d9k1oOwhDjvqNYBE=;
 b=skO2IyniIr6pkKjNCJNSZd8fQTkHDM1PULLDjqe2qjkmNJ2LPo4TD/6XZeGdFYtyKXvLftBT
 wu72U2wTEQSrWi1qgaKKWNwq7p4Z3QvPjxCd+ipyjA5xqa5fJm9e3AdVcQgMGqTtK9J4SKiz
 Fc60uZmuBAhVseKO33KIA1F+gQQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f455fd776c283d04f167cf4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 Aug 2020 19:00:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3B1BDC433CB; Tue, 25 Aug 2020 19:00:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 142A3C433CB;
        Tue, 25 Aug 2020 19:00:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 26 Aug 2020 00:30:38 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        iommu@lists.linux-foundation.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] iommu: Add support to filter non-strict/lazy mode based
 on device names
In-Reply-To: <CAD=FV=XK3Xa3rRWvuSA_jA+5_1XYBmHEX2B2XSb8h3oOe1PHLw@mail.gmail.com>
References: <20200825154249.20011-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=XK3Xa3rRWvuSA_jA+5_1XYBmHEX2B2XSb8h3oOe1PHLw@mail.gmail.com>
Message-ID: <3df7edd53ebca00be288e69b92b8d4b9@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2020-08-25 21:40, Doug Anderson wrote:
> Hi,
> 
> On Tue, Aug 25, 2020 at 8:43 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Currently the non-strict or lazy mode of TLB invalidation can only be 
>> set
>> for all or no domains. This works well for development platforms where
>> setting to non-strict/lazy mode is fine for performance reasons but on
>> production devices, we need a more fine grained control to allow only
>> certain peripherals to support this mode where we can be sure that it 
>> is
>> safe. So add support to filter non-strict/lazy mode based on the 
>> device
>> names that are passed via cmdline parameter "iommu.nonstrict_device".
>> 
>> Example: 
>> iommu.nonstrict_device="7c4000.sdhci,a600000.dwc3,6048000.etr"
> 
> I have an inherent dislike of jamming things like this onto the
> command line.  IMHO the command line is the last resort for specifying
> configuration and generally should be limited to some specialized
> debug options and cases where the person running the kernel needs to
> override a config that was set by the person (or company) compiling
> the kernel.  Specifically, having a long/unwieldy command line makes
> it harder to use for the case when an end user actually wants to use
> it to override something.  It's also just another place to look for
> config.
> 

Good thing about command line parameters are that they are optional, 
they do
not specify any default behaviour (I mean they are not mandatory to be 
set
for the system to be functional), so I would like to view it as an 
optional
config. And this command line parameter (nonstrict_device) is strictly 
optional
with default being strict already set in the driver.

They can be passed from the bootloader via chosen node for DT platforms 
or choose
a new *bootconfig* as a way to pass the cmdline but finally it does boil 
down to
just another config.

I agree with general boolean or single value command line parameters 
being just
more messy which could just be Kconfigs instead but for multiple value 
parameters
like these do not fit in Kconfig.

As you might already know, command line also gives an advantage to the 
end user
to configure system without building kernel, for this specific command 
line its
very useful because the performance bump is quite noticeable when the 
iommu.strict
is off. Now for end user who would not be interested in building entire 
kernel(majority)
and just cares about good speeds or throughput can find this very 
beneficial.
I am not talking about one specific OS usecase here but more in general 
term.

> The other problem is that this doesn't necessarily scale very well.
> While it works OK for embedded cases it doesn't work terribly well for
> distributions.  I know that in an out-of-band thread you indicated
> that it doesn't break anything that's not already broken (AKA this
> doesn't fix the distro case but it doesn't make it worse), it would be
> better to come up with a more universal solution.
> 

Is the universal solution here referring to fix all the command line 
parameters
in the kernel or this specific command line? Are we going to remove any 
more
addition to the cmdline ;)

So possible other solution is the *bootconfig* which is again just 
another place
to look for a config. So thing is that this universal solution would 
result in
just more new fancy ways of passing configs or adding such configs to 
the drivers
or subsystems in kernel which is pretty much similar to implementing 
policy in
kernel which I think is frowned upon and mentioned in the other thread.

> Ideally it feels like we should figure out how to tag devices in a
> generic manner automatically (hardcode at the driver or in the device
> tree).  I think the out-of-band discussions talked about "external
> facing" and the like.  We could also, perhaps, tag devices that have
> "binary blob" firmware if we wanted.  Then we'd have a policy (set by
> Kconfig, perhaps overridable via commandline) that indicated the
> strictness level for the various classes of devices.  So policy would
> be decided by KConfig and/or command line.
> 

How is tagging in driver or device tree better than the simple command 
line
approach to pass the same list of devices which otherwise you would 
hardcode
in the corresponding drivers and device tree all over the kernel other 
than
the scalability part for command line? IMHO it is too much churn.

Device tree could be used but then we have a problem with it being for 
only
describing hardware and it doesn't work for ACPI based systems.

Command line approach works for all systems (both DT and ACPI) without 
having
to add too much churn to drivers. Lastly, I think we can have both 
options, it
doesn't hurt to add command line parameter since it is optional.

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
