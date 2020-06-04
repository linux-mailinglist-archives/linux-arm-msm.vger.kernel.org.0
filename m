Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922FC1EE344
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 13:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgFDLUH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 07:20:07 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43907 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726228AbgFDLUH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 07:20:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591269606; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wujjCCv5SBbDohkrY5pxRpykfjsvxoLNEBFwiJIHO5E=;
 b=oQikHqvwFuyiHrCuMNQ2Dmo3vCmyMVfW0JlFkc1WqXrwVKn21IlGl8LsEV2ReQ/5tANybe33
 SkgMktXOWiBTLpZNSH93O1n+gU4Bweza5UI+TCIU2/SyDQY3VQQtgAtjD5yWPVrKecP8AbXK
 500OIYseEAfzil6MGbSiukPR3ho=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ed8d8d7c0031c71c2f7c6c9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Jun 2020 11:19:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D3165C43387; Thu,  4 Jun 2020 11:19:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kalyan_t)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 76333C433CA;
        Thu,  4 Jun 2020 11:19:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 04 Jun 2020 16:49:49 +0530
From:   kalyan_t@codeaurora.org
To:     Doug Anderson <dianders@chromium.org>
Cc:     Sean Paul <seanpaul@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
        travitej@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, nganji@codeaurora.org,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: ensure device suspend happens
 during PM sleep
In-Reply-To: <CAD=FV=XphGpmBwZdL0jZ5HEFdxY3L7nH+s9_A0Kjamtg7j3R9w@mail.gmail.com>
References: <1588339863-1322-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com>
 <32c01e9a5277bdbdbab868eb71688184@codeaurora.org>
 <CAD=FV=VVi6oUDx_2Yf543ZphS1oQJiQU8St0XNUHs7HyPkoTeg@mail.gmail.com>
 <CAD=FV=XphGpmBwZdL0jZ5HEFdxY3L7nH+s9_A0Kjamtg7j3R9w@mail.gmail.com>
Message-ID: <40f3b31549cd5bb80a8454836ffb0ad4@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-28 03:41, Doug Anderson wrote:
> Hi,
> 
> On Fri, May 15, 2020 at 9:37 AM Doug Anderson <dianders@chromium.org> 
> wrote:
>> 
>> Hi,
>> 
>> On Fri, May 15, 2020 at 5:06 AM <kalyan_t@codeaurora.org> wrote:
>> >
>> > On 2020-05-14 21:47, Doug Anderson wrote:
>> > > Hi,
>> > >
>> > > On Fri, May 1, 2020 at 6:31 AM Kalyan Thota <kalyan_t@codeaurora.org>
>> > > wrote:
>> > >>
>> > >> "The PM core always increments the runtime usage counter
>> > >> before calling the ->suspend() callback and decrements it
>> > >> after calling the ->resume() callback"
>> > >>
>> > >> DPU and DSI are managed as runtime devices. When
>> > >> suspend is triggered, PM core adds a refcount on all the
>> > >> devices and calls device suspend, since usage count is
>> > >> already incremented, runtime suspend was not getting called
>> > >> and it kept the clocks on which resulted in target not
>> > >> entering into XO shutdown.
>> > >>
>> > >> Add changes to force suspend on runtime devices during pm sleep.
>> > >>
>> > >> Changes in v1:
>> > >>  - Remove unnecessary checks in the function
>> > >>     _dpu_kms_disable_dpu (Rob Clark).
>> > >>
>> > >> Changes in v2:
>> > >>  - Avoid using suspend_late to reset the usagecount
>> > >>    as suspend_late might not be called during suspend
>> > >>    call failures (Doug).
>> > >>
>> > >> Changes in v3:
>> > >>  - Use force suspend instead of managing device usage_count
>> > >>    via runtime put and get API's to trigger callbacks (Doug).
>> > >>
>> > >> Changes in v4:
>> > >>  - Check the return values of pm_runtime_force_suspend and
>> > >>    pm_runtime_force_resume API's and pass appropriately (Doug).
>> > >>
>> > >> Changes in v5:
>> > >
>> > > Can you please put the version number properly in your subject?  It's
>> > > really hard to tell one version of your patch from another.
>> > >
>> > >
>> > >>  - With v4 patch, test cycle has uncovered issues in device resume.
>> > >>
>> > >>    On bubs: cmd tx failures were seen as SW is sending panel off
>> > >>    commands when the dsi resources are turned off.
>> > >>
>> > >>    Upon suspend, DRM driver will issue a NULL composition to the
>> > >>    dpu, followed by turning off all the HW blocks.
>> > >>
>> > >>    v5 changes will serialize the NULL commit and resource unwinding
>> > >>    by handling them under PM prepare and PM complete phases there by
>> > >>    ensuring that clks are on when panel off commands are being
>> > >>    processed.
>> > >
>> > > I'm still most definitely not an expert in how all the DRM pieces all
>> > > hook up together, but the solution you have in this patch seems wrong
>> > > to me.  As far as I can tell the "prepare" state isn't supposed to be
>> > > actually doing the suspend work and here that's exactly what you're
>> > > doing.  I think you should find a different solution to ensure
>> > > ordering is correct.
>> > >
>> > > -Doug
>> > >
>> >
>> > Hi,
>> 
>> Quite honestly I'm probably not the right person to be reviewing this
>> code.  I mostly just noticed one of your early patches and it looked
>> strange to me.  Hopefully someone with actual experience in how all
>> the DRM components work together can actually review and see if this
>> makes sense.  Maybe Sean would know better?
>> 
>> That being said, let me at least look at what you're saying...
>> 
>> 
>> > Prepare and Complete are callbacks defined as part of Sleep and Resume
>> > sequence
>> >
>> > Entering PM SUSPEND the phases are : prepare --> suspend -->
>> > suspend_late --> suspend_noirq.
>> > While leaving PM SUSPEND the phases are: resume_noirq --> resume_early
>> > --> resume --> complete.
>> 
>> Sure, it's part of the sequence.  It's also documented in pm.h as:
>> 
>>  * The principal role of this callback is to prevent new children of
>>  * the device from being registered after it has returned (the 
>> driver's
>>  * subsystem and generally the rest of the kernel is supposed to 
>> prevent
>>  * new calls to the probe method from being made too once @prepare() 
>> has
>>  * succeeded).
>> 
>> It does not feel like that matches your usage of this call.
>> 
>> 
>> > The reason to push drm suspend handling to PM prepare phase is that
>> > parent here will trigger a modeset to turn off the timing and
>> > subsequently the panel.
>> > the child devices should not turn of their clocks before parent unwinds
>> > the composition. Hence they are serialized as per the sequence mentioned
>> > above.
>> 
>> So the general model in Linux is that children suspend before their
>> parents, right?  So you're saying that, in this case, the parent needs
>> to act on the child before the child suspends.  Is that correct?
>> 
>> Rather than hijacking the prepare/complete, I'd be at least slightly
>> inclined to move the other driver to turn off its clocks in
>> suspend_late and to turn them back on in resume_early?  That seems to
>> be what was done in "analogix_dp-rockchip.c" to solve a similar
>> problem.
>> 
>> 
>> > A similar approach is taken by other driver that use drm framework. In
>> > this driver, the device registers for prepare and complete callbacks to
>> > handle drm_suspend and drm_resume.
>> > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/exynos/exynos_drm_drv.c#L163
>> 
>> OK, if there is another driver in DRM then I guess I won't object too
>> strongly.  Note that when searching for other drivers I noticed this
>> bit in todo.rst:
>> 
>> * Most drivers (except i915 and nouveau) that use
>> * drm_atomic_helper_suspend/resume() can probably be converted to use
>> * drm_mode_config_helper_suspend/resume(). Also there's still 
>> open-coded version
>> * of the atomic suspend/resume code in older atomic modeset drivers.
>> 
>> Does anything get fixed if you do that?  It seems like it'd cleanup
>> your code a bit so maybe worth doing anyway...
>> 
>> ---
>> 
>> I guess the last question I'd want resolved is why you have this 
>> asymmetry:
>> 
>> SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, msm_pm_resume)
>> 
>> Why couldn't you use pm_runtime_force_resume()?
> 
> I'm curious if you had answers to any of the questions I posed in my 
> review.
> 
> -Doug


1) i'll update the patch to use "drm_mode_config_helper_suspend/resume". 
This will help in additional cleanup such as enabling FBDEV emulation in 
the build.

2) For the asymmetry part,
  pm_runtime_force_resume() was not waking up the device forcefully if 
the usage count is 1. PM core thinks that if usage count is 1 then 
device can be runtime resumed after suspend/resume sequence is complete. 
This is true for all the child nodes and the parent node. Hence to 
overcome that i used pm_runtime_resume on parent.

I have explored a bit on how to handle this cleanly, found an old thread 
discussing on the similar problem 
(https://lists.gt.net/linux/kernel/1556562  post no#4 Alan Stern ) the 
suggestion was to use runtime API's directly in PM Suspend/Resume.

I have found few example implementations on similar lines.
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/media/platform/mtk-mdp/mtk_mdp_core.c#L279
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/media/i2c/ak7375.c#L273
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gnss/sirf.c#L377

I have changed the implementation on those lines in v6.

Summary of the flow now:

PM Sleep -->  pm_prepare for parent ( Disable all the DRM CRTCs) --> 
Suspend for child1, child2 ( turn off child clocks )--> Suspend for 
parent (turn off parent clocks )

PM Wakeup --> Resume for child1, child2 ( force resume is inactive due 
to usage count 1, but the call is needed to undo the force suspend 
things ) --> Resume for Parent (turn on parent clocks ) --> PM_complete 
for Parent.( By the time we reach here, PM core will remove the usage 
count for all the children and they are ready for runtime resume. Parent 
enables CRTCs which will runtime resume all the child clocks)

Let me know your views on it.

--Kalyan

> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
