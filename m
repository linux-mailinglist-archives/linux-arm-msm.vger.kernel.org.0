Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420AD1D5636
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 18:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgEOQiL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 12:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726191AbgEOQiL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 12:38:11 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3873EC061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 09:38:11 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id g15so1015908uah.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 09:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dsWS87oi/iCZiA7NcMAjL2FtmRuX/wXJ/5rlQnp6zmo=;
        b=eJcK1GVzgHPtvBtl7+i8mN1qpqG8SB0hDnStaypr1OR9DbkSvrc8siXYG/buCjwsq8
         jLPh8H/3sIUkFgicYCe+u1bnBMCswUGPYiaXUWGNAy19k9PyqIvLQ8Xi2N9GVMtZUwnu
         qTpfoTHvj8l/TNVlZrH7R6nglxOwowCbETks8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dsWS87oi/iCZiA7NcMAjL2FtmRuX/wXJ/5rlQnp6zmo=;
        b=lQGSMcSY4N3ClJovY2mu45+IoQ7QNG+4KMF0Z4mqe9nk/sOB2LHC4CLqc+XLF2jEvb
         f6ELbksMjIbp2aG7Ff3Lv6enKyuYpkQMobBMMplDlbmFOijjlECaS5K/Ag4vC7bYjHU6
         YTaiR4aIDjNke5ZEuEC3yT/fxxSoI60byk9SSM5CNnmQK64+v7lbgXmHUBj1dAZrLcBO
         CIRhg257FJeepl7nSeoTx/A3DHZI1j07/fKJO4JfOeCjS7wjLqJ9dJqEccyGvWxqrgny
         ydI8bkLC2uJ4UE2hG1jA8Y1J49n7q+58kucuTFvYVKZqqh9iYURWEF3CIXSJ8DSS8ox2
         rLLg==
X-Gm-Message-State: AOAM533+JOoyuJQsv1PK7XSNlHgKYHhIviR3P6p4Z7VsD0ubIvVS78XK
        pldODR+1LG4sRbs7fw2kXZz+uH/eeDg=
X-Google-Smtp-Source: ABdhPJzJCXkkpIJgNkG8lBwswsdfZyRboH/oF2amZ/vMgJns4h+z6d6dtXcqfm0jZ7V++5NzRF5WdQ==
X-Received: by 2002:ab0:154b:: with SMTP id p11mr3334748uae.11.1589560689991;
        Fri, 15 May 2020 09:38:09 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id t190sm476125vst.30.2020.05.15.09.38.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2020 09:38:09 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id k3so1010831ual.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 09:38:09 -0700 (PDT)
X-Received: by 2002:ab0:69cc:: with SMTP id u12mr216029uaq.22.1589560688373;
 Fri, 15 May 2020 09:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <1588339863-1322-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com> <32c01e9a5277bdbdbab868eb71688184@codeaurora.org>
In-Reply-To: <32c01e9a5277bdbdbab868eb71688184@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 15 May 2020 09:37:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVi6oUDx_2Yf543ZphS1oQJiQU8St0XNUHs7HyPkoTeg@mail.gmail.com>
Message-ID: <CAD=FV=VVi6oUDx_2Yf543ZphS1oQJiQU8St0XNUHs7HyPkoTeg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: ensure device suspend happens
 during PM sleep
To:     Kalyan Thota <kalyan_t@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        travitej@codeaurora.org, LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, nganji@codeaurora.org,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 15, 2020 at 5:06 AM <kalyan_t@codeaurora.org> wrote:
>
> On 2020-05-14 21:47, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, May 1, 2020 at 6:31 AM Kalyan Thota <kalyan_t@codeaurora.org>
> > wrote:
> >>
> >> "The PM core always increments the runtime usage counter
> >> before calling the ->suspend() callback and decrements it
> >> after calling the ->resume() callback"
> >>
> >> DPU and DSI are managed as runtime devices. When
> >> suspend is triggered, PM core adds a refcount on all the
> >> devices and calls device suspend, since usage count is
> >> already incremented, runtime suspend was not getting called
> >> and it kept the clocks on which resulted in target not
> >> entering into XO shutdown.
> >>
> >> Add changes to force suspend on runtime devices during pm sleep.
> >>
> >> Changes in v1:
> >>  - Remove unnecessary checks in the function
> >>     _dpu_kms_disable_dpu (Rob Clark).
> >>
> >> Changes in v2:
> >>  - Avoid using suspend_late to reset the usagecount
> >>    as suspend_late might not be called during suspend
> >>    call failures (Doug).
> >>
> >> Changes in v3:
> >>  - Use force suspend instead of managing device usage_count
> >>    via runtime put and get API's to trigger callbacks (Doug).
> >>
> >> Changes in v4:
> >>  - Check the return values of pm_runtime_force_suspend and
> >>    pm_runtime_force_resume API's and pass appropriately (Doug).
> >>
> >> Changes in v5:
> >
> > Can you please put the version number properly in your subject?  It's
> > really hard to tell one version of your patch from another.
> >
> >
> >>  - With v4 patch, test cycle has uncovered issues in device resume.
> >>
> >>    On bubs: cmd tx failures were seen as SW is sending panel off
> >>    commands when the dsi resources are turned off.
> >>
> >>    Upon suspend, DRM driver will issue a NULL composition to the
> >>    dpu, followed by turning off all the HW blocks.
> >>
> >>    v5 changes will serialize the NULL commit and resource unwinding
> >>    by handling them under PM prepare and PM complete phases there by
> >>    ensuring that clks are on when panel off commands are being
> >>    processed.
> >
> > I'm still most definitely not an expert in how all the DRM pieces all
> > hook up together, but the solution you have in this patch seems wrong
> > to me.  As far as I can tell the "prepare" state isn't supposed to be
> > actually doing the suspend work and here that's exactly what you're
> > doing.  I think you should find a different solution to ensure
> > ordering is correct.
> >
> > -Doug
> >
>
> Hi,

Quite honestly I'm probably not the right person to be reviewing this
code.  I mostly just noticed one of your early patches and it looked
strange to me.  Hopefully someone with actual experience in how all
the DRM components work together can actually review and see if this
makes sense.  Maybe Sean would know better?

That being said, let me at least look at what you're saying...


> Prepare and Complete are callbacks defined as part of Sleep and Resume
> sequence
>
> Entering PM SUSPEND the phases are : prepare --> suspend -->
> suspend_late --> suspend_noirq.
> While leaving PM SUSPEND the phases are: resume_noirq --> resume_early
> --> resume --> complete.

Sure, it's part of the sequence.  It's also documented in pm.h as:

 * The principal role of this callback is to prevent new children of
 * the device from being registered after it has returned (the driver's
 * subsystem and generally the rest of the kernel is supposed to prevent
 * new calls to the probe method from being made too once @prepare() has
 * succeeded).

It does not feel like that matches your usage of this call.


> The reason to push drm suspend handling to PM prepare phase is that
> parent here will trigger a modeset to turn off the timing and
> subsequently the panel.
> the child devices should not turn of their clocks before parent unwinds
> the composition. Hence they are serialized as per the sequence mentioned
> above.

So the general model in Linux is that children suspend before their
parents, right?  So you're saying that, in this case, the parent needs
to act on the child before the child suspends.  Is that correct?

Rather than hijacking the prepare/complete, I'd be at least slightly
inclined to move the other driver to turn off its clocks in
suspend_late and to turn them back on in resume_early?  That seems to
be what was done in "analogix_dp-rockchip.c" to solve a similar
problem.


> A similar approach is taken by other driver that use drm framework. In
> this driver, the device registers for prepare and complete callbacks to
> handle drm_suspend and drm_resume.
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/exynos/exynos_drm_drv.c#L163

OK, if there is another driver in DRM then I guess I won't object too
strongly.  Note that when searching for other drivers I noticed this
bit in todo.rst:

* Most drivers (except i915 and nouveau) that use
* drm_atomic_helper_suspend/resume() can probably be converted to use
* drm_mode_config_helper_suspend/resume(). Also there's still open-coded version
* of the atomic suspend/resume code in older atomic modeset drivers.

Does anything get fixed if you do that?  It seems like it'd cleanup
your code a bit so maybe worth doing anyway...

---

I guess the last question I'd want resolved is why you have this asymmetry:

SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, msm_pm_resume)

Why couldn't you use pm_runtime_force_resume()?


-Doug
