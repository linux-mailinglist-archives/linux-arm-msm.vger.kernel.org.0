Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B59E2528C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 10:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgHZIDi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 04:03:38 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:60555 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726191AbgHZIDi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 04:03:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598429017; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hleoJnRPFgTh4Q3Z/gEZpKKg+hswZ9iuwWfl1+U3mJY=;
 b=IbRVFgyJvfT4XU5XzGWFETUcNlDyzXLnWOwV8VGw5CRTnlEzUKBoDAr8aESJIIM5uZqlYTzK
 zPu3IizJLuDZHx6UE89NkO1bBSgFEm4OefrfvMvO/ByGsXUMfJ3zL+F7jX6oNkOsdFwPmBES
 28TGD1hB4+KvrObaa6Uc1jIflnY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f46174f6fc2098fa7ccac13 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 Aug 2020 08:03:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 73A3AC43395; Wed, 26 Aug 2020 08:03:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9896FC433CA;
        Wed, 26 Aug 2020 08:03:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 26 Aug 2020 13:33:24 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        iommu@lists.linux-foundation.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH] iommu: Add support to filter non-strict/lazy mode based
 on device names
In-Reply-To: <CAD=FV=X=3Jae7_gXN_05EsmZjrM1bN=TMZ0qoGKz=UaNrthzAg@mail.gmail.com>
References: <20200825154249.20011-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=XK3Xa3rRWvuSA_jA+5_1XYBmHEX2B2XSb8h3oOe1PHLw@mail.gmail.com>
 <3df7edd53ebca00be288e69b92b8d4b9@codeaurora.org>
 <CAD=FV=X=3Jae7_gXN_05EsmZjrM1bN=TMZ0qoGKz=UaNrthzAg@mail.gmail.com>
Message-ID: <4224f8580d19e9a7eae80299fa2ffa37@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2020-08-26 03:45, Doug Anderson wrote:
> Hi,
> 
> On Tue, Aug 25, 2020 at 12:01 PM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Hi,
>> 
>> On 2020-08-25 21:40, Doug Anderson wrote:
>> > Hi,
>> >
>> > On Tue, Aug 25, 2020 at 8:43 AM Sai Prakash Ranjan
>> > <saiprakash.ranjan@codeaurora.org> wrote:
>> >>
>> >> Currently the non-strict or lazy mode of TLB invalidation can only be
>> >> set
>> >> for all or no domains. This works well for development platforms where
>> >> setting to non-strict/lazy mode is fine for performance reasons but on
>> >> production devices, we need a more fine grained control to allow only
>> >> certain peripherals to support this mode where we can be sure that it
>> >> is
>> >> safe. So add support to filter non-strict/lazy mode based on the
>> >> device
>> >> names that are passed via cmdline parameter "iommu.nonstrict_device".
>> >>
>> >> Example:
>> >> iommu.nonstrict_device="7c4000.sdhci,a600000.dwc3,6048000.etr"
> 
> Just curious: are device names like this really guaranteed to be
> stable across versions?
> 

Good question, AFAIK the device names are based on the DT node address 
and
the node name, for ex:  etr@6048000 and device name - "6048000.etr", now 
I
believe these are pretty stable for a particular SoC or board since 
there
is no reason to change the device node name or the address unless 
something
has gone terribly wrong. I don't know about ACPI systems, but however 
they
are described can be specified in this command line parameter. This is 
an
advantage over the DT property where ACPI systems get left out unless 
someone
goes and adds the same/similar property over there.

> 
>> > I have an inherent dislike of jamming things like this onto the
>> > command line.  IMHO the command line is the last resort for specifying
>> > configuration and generally should be limited to some specialized
>> > debug options and cases where the person running the kernel needs to
>> > override a config that was set by the person (or company) compiling
>> > the kernel.  Specifically, having a long/unwieldy command line makes
>> > it harder to use for the case when an end user actually wants to use
>> > it to override something.  It's also just another place to look for
>> > config.
>> >
>> 
>> Good thing about command line parameters are that they are optional,
>> they do
>> not specify any default behaviour (I mean they are not mandatory to be
>> set
>> for the system to be functional), so I would like to view it as an
>> optional
>> config. And this command line parameter (nonstrict_device) is strictly
>> optional
>> with default being strict already set in the driver.
>> 
>> They can be passed from the bootloader via chosen node for DT 
>> platforms
>> or choose
>> a new *bootconfig* as a way to pass the cmdline but finally it does 
>> boil
>> down to
>> just another config.
> 
> Never looked at bootconfig.  Unfortunately it seems to require
> initramfs so that pretty much means it's out for my usage.  :(
> 

Yes that won't fit everywhere.

> 
>> I agree with general boolean or single value command line parameters
>> being just
>> more messy which could just be Kconfigs instead but for multiple value
>> parameters
>> like these do not fit in Kconfig.
>> 
>> As you might already know, command line also gives an advantage to the
>> end user
>> to configure system without building kernel, for this specific command
>> line its
>> very useful because the performance bump is quite noticeable when the
>> iommu.strict
>> is off. Now for end user who would not be interested in building 
>> entire
>> kernel(majority)
>> and just cares about good speeds or throughput can find this very
>> beneficial.
>> I am not talking about one specific OS usecase here but more in 
>> general
>> term.
>> 
>> > The other problem is that this doesn't necessarily scale very well.
>> > While it works OK for embedded cases it doesn't work terribly well for
>> > distributions.  I know that in an out-of-band thread you indicated
>> > that it doesn't break anything that's not already broken (AKA this
>> > doesn't fix the distro case but it doesn't make it worse), it would be
>> > better to come up with a more universal solution.
>> >
>> 
>> Is the universal solution here referring to fix all the command line
>> parameters
>> in the kernel or this specific command line? Are we going to remove 
>> any
>> more
>> addition to the cmdline ;)
> 
> There are very few cases where a kernel command line parameter is the
> only way to configure something.  Most of the time it's just there to
> override a config.  I wouldn't suggest removing those.  I just don't
> want a kernel command line parameter to be the primary way to enable
> something.
> 

Agreed that command line parameters are not supposed to be some primary
way of setting things but an optional way to override settings, in this
case to override the strict mode already set by the driver. Then we can
probably agree that this command line is just an optional way provided
to the end user for his convenience? We would still need to find a 
primary
way to set this non-strict mode in drivers via DT passing the 
information
or some other way.

> 
>> So possible other solution is the *bootconfig* which is again just
>> another place
>> to look for a config. So thing is that this universal solution would
>> result in
>> just more new fancy ways of passing configs or adding such configs to
>> the drivers
>> or subsystems in kernel which is pretty much similar to implementing
>> policy in
>> kernel which I think is frowned upon and mentioned in the other 
>> thread.
>> 
>> > Ideally it feels like we should figure out how to tag devices in a
>> > generic manner automatically (hardcode at the driver or in the device
>> > tree).  I think the out-of-band discussions talked about "external
>> > facing" and the like.  We could also, perhaps, tag devices that have
>> > "binary blob" firmware if we wanted.  Then we'd have a policy (set by
>> > Kconfig, perhaps overridable via commandline) that indicated the
>> > strictness level for the various classes of devices.  So policy would
>> > be decided by KConfig and/or command line.
>> >
>> 
>> How is tagging in driver or device tree better than the simple command
>> line
>> approach to pass the same list of devices which otherwise you would
>> hardcode
>> in the corresponding drivers and device tree all over the kernel other
>> than
>> the scalability part for command line? IMHO it is too much churn.
> 
> It's better because it doesn't require keeping track and updating
> these per-board (or per machine) arguments for each and every
> board/machine you maintain.

If you choose to pass the information via DT which seems like the most 
ideal
way, then you would still have to update them per-board for every board 
you
maintain which is the same thing.

If, for instance, we start out by
> allowing HW video decoder to use non-strict.  So:
> 
> On one board, we add in "aa00000.video-codec" to the command line.
> On some other board, maybe we add in "1d00000.video-codec" to the 
> command line.
> On some other board, maybe we add in "90400000.video-codec" to the 
> command line.
> 
> Now we realize that there's some problem and we have to remove it, so
> we need to go through and remove this from our command line
> everywhere.  Worse is that we have to proactively notice it and remove
> it.
> 

Same as above where we need to modify DT to mark certain devices as 
strict
in case something goes wrong.

> Instead, let's imagine that we set a policy at a bit of a higher
> level.  Different ideas:
> 
> a) We could have a CONFIG_ option for the video codec that's something
> like "CONFIG_VIDEOCODEC_DEFAULT_NONSTRICT".  If this was set then if
> there is no "iommu.strict" command line argument then this device
> would be mapped as non-strict.  If "iommu.strict=0" or
> "iommu.strict=1" is on the command line then it would override all of
> these defaults.  Probably the existence (or maybe the default value)
> of this CONFIG option implies that there are no known/expected
> exploits related to it.
> 

Hmm, so then we'd have tens of Kconfigs for each device being non strict
by default?  Then I guess we'd need a menuconfig for this and where 
should
this go into, IOMMU layer or under respective drivers? Let's say we do 
this,
but how would the IOMMU know about such classes of devices, the only way 
I
can think of is adding such a field in "struct device" which can be 
tried
but may not be well received.

Also default should be strict in my opinion as it is today similar to 
bypassing
SMMU and then non strict option to override it.

> b) We could find some way to tag the video codec and then set
> non-strictness on certain classes of devices, then we could have a
> policy to disable strictness on certain classes of devices.
> 

If tagging is based on the DT property then we have ACPI to think about 
and it
poses the same problems which you listed for command line parameter 
where you
would have to go and update all the DT entries.

> The nice thing about the above is that you could imagine someone
> pushing a change to the stable trees that would fix everyone affected.
> Nobody would need to go around and adjust command line options, they'd
> just get the newest stable and it could cause devices to move into
> strict mode if there was a known exploit.  I suppose with your
> proposal stable trees could have a "blacklist" where the commandline
> is ignored for exploited devices, but that seems ugly.
> 

Yes this is true but then we can keep this cmdline parameter as only 
optional
and find a different way to enforce the non-strict mode setting.

> 
>> Device tree could be used but then we have a problem with it being for
>> only
>> describing hardware and it doesn't work for ACPI based systems.
>> 
>> Command line approach works for all systems (both DT and ACPI) without
>> having
>> to add too much churn to drivers. Lastly, I think we can have both
>> options, it
>> doesn't hurt to add command line parameter since it is optional.
> 
> I'm not opposed to something existing that lets you override this on
> the command line, but I'm just not a fan of it being the primary way.
> 

Agreed, so we can treat non-strict command line parameter as just 
optional
and we find a different way to set this mode in drivers via whatever 
method
everyone finds suitable.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
