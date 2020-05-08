Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B4C1CB387
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 17:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgEHPkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 11:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbgEHPkZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 11:40:25 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B1EC061A0C;
        Fri,  8 May 2020 08:40:24 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id l3so1545121edq.13;
        Fri, 08 May 2020 08:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vTGeP2mp0atDffBVvlfE/CUFeNMcpq4/+i7t1uiSUiI=;
        b=IKFEz8+THuTorI7NlDH5c3C3yFpz7Wp3L7N5cVUbojS9576edfURlOf6OM+yy+QuQT
         mVA5Vdgba14Ry91YmN6JwLM1gn0w1pu0rrfpbR4qP21ndJ/XNa+8ena97TLS2i0vfqsX
         Kd2ROKOcq5rpb7QacY25zzFb3hxAFnk4jBVDL0Mkv8+qk7v46TMWCvLSKbbV98ir/UYf
         nbF/U88u4HhwzDS5rwVtpY1oxN5e2R/XuMx9R75jFea2kN2B4aeU2PpmsNoeMsF//vRD
         /KMJCk7J++sWzHapIKMCgt6oR06Nn7Axr+7q6sDY5vNlTSo7+iXaGc+fy0Jt4lNEEhnj
         B2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vTGeP2mp0atDffBVvlfE/CUFeNMcpq4/+i7t1uiSUiI=;
        b=dvn7NrdhxnjAORujMXXH/vlO87vmqo4g2wRjRjr5DWuL4c7cFiugoKEwclsgQ5N3Ld
         xkdciO2yTag16ypJZE9n5+z8x77ynhkWi0Y+/Xc0dk2r1FAa+2C9fGnaspwlMhvWE/A9
         RZfMGK9iucB5M8oIP4lu2p4C4DzwdS0ep03cQkBodQCiMRH5uxSYnf3whxSYq0u0IFd6
         oQ3FF1cBZ9li4aY6hONDxGCxzllBRZoe77RJOuykLsckZRuhLMZOespyHCkTta2yW/3o
         YjmfiLyZPtOoXg2bqVV9fgb+0JbknbnMNOfEL4+GlpJuuWaHENhG8hT3knt9Esy1+zG6
         I1tg==
X-Gm-Message-State: AGi0Pua5LqV3gmfPRgls4semBSYkfs5E9bMpvjYFJ9JOm5KshGDlcrXZ
        ioZXi2+rjNj4eka8KryRYE/pdH0CXMbfLvTzOhY=
X-Google-Smtp-Source: APiQypJgh+CSGsfjzbXUm6WLw6LglrPUjAcB8Mgfr8b/68JEMJuXWKPusr9zT3nPNaofdDHN9sNzFo+HI6KN9O5ICtk=
X-Received: by 2002:a50:ef18:: with SMTP id m24mr2577526eds.281.1588952423627;
 Fri, 08 May 2020 08:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200421202004.11686-1-saiprakash.ranjan@codeaurora.org>
 <b491e02ad790a437115fdeab6b21bc48@codeaurora.org> <1ced023b-157c-21a0-ac75-1adef7f029f0@arm.com>
 <20200507125357.GA31783@willie-the-truck> <CAF6AEGuLU+_qP8HNO1s9PTPHqJnCMHzehmcT8NiJhiAwrfSH6w@mail.gmail.com>
In-Reply-To: <CAF6AEGuLU+_qP8HNO1s9PTPHqJnCMHzehmcT8NiJhiAwrfSH6w@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 8 May 2020 08:40:40 -0700
Message-ID: <CAF6AEGvuHKObTR97XdSXjmjKB+qjQ8N1_wxM=ZU8bEkF=cXp-A@mail.gmail.com>
Subject: Re: [PATCH] iomm/arm-smmu: Add stall implementation hook
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 8, 2020 at 8:32 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, May 7, 2020 at 5:54 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Thu, May 07, 2020 at 11:55:54AM +0100, Robin Murphy wrote:
> > > On 2020-05-07 11:14 am, Sai Prakash Ranjan wrote:
> > > > On 2020-04-22 01:50, Sai Prakash Ranjan wrote:
> > > > > Add stall implementation hook to enable stalling
> > > > > faults on QCOM platforms which supports it without
> > > > > causing any kind of hardware mishaps. Without this
> > > > > on QCOM platforms, GPU faults can cause unrelated
> > > > > GPU memory accesses to return zeroes. This has the
> > > > > unfortunate result of command-stream reads from CP
> > > > > getting invalid data, causing a cascade of fail.
> > >
> > > I think this came up before, but something about this rationale doesn't add
> > > up - we're not *using* stalls at all, we're still terminating faulting
> > > transactions unconditionally; we're just using CFCFG to terminate them with
> > > a slight delay, rather than immediately. It's really not clear how or why
> > > that makes a difference. Is it a GPU bug? Or an SMMU bug? Is this reliable
> > > (or even a documented workaround for something), or might things start
> > > blowing up again if any other behaviour subtly changes? I'm not dead set
> > > against adding this, but I'd *really* like to have a lot more confidence in
> > > it.
> >
> > Rob mentioned something about the "bus returning zeroes" before, but I agree
> > that we need more information so that we can reason about this and maintain
> > the code as the driver continues to change. That needs to be a comment in
> > the driver, and I don't think "but android seems to work" is a good enough
> > justification. There was some interaction with HUPCF as well.
>
> The issue is that there are multiple parallel memory accesses
> happening at the same time, for example CP (the cmdstream processor)
> will be reading ahead and setting things up for the next draw or
> compute grid, in parallel with some memory accesses from the shader
> which could trigger a fault.  (And with faults triggered by something
> in the shader, there are *many* shader threads running in parallel so
> those tend to generate a big number of faults at the same time.)
>
> We need either CFCFG or HUPCF, otherwise what I have observed is that
> while the fault happens, CP's memory access will start returning
> zero's instead of valid cmdstream data, which triggers a GPU hang.  I
> can't say whether this is something unique to qcom's implementation of
> the smmu spec or not.
>
> *Often* a fault is the result of the usermode gl/vk/cl driver bug,
> although I don't think that is an argument against fixing this in the
> smmu driver.. I've been carrying around a local patch to set HUPCF for
> *years* because debugging usermode driver issues is so much harder
> without.  But there are some APIs where faults can be caused by the
> user's app on top of the usermode driver.
>

Also, I'll add to that, a big wish of mine is to have stall with the
ability to resume later from a wq context.  That would enable me to
hook in the gpu crash dump handling for faults, which would make
debugging these sorts of issues much easier.  I think I posted a
prototype of this quite some time back, which would schedule a worker
on the first fault (since there are cases where you see 1000's of
faults at once), which grabbed some information about the currently
executing submit and some gpu registers to indicate *where* in the
submit (a single submit could have 100's or 1000's of draws), and then
resumed the iommu cb.

(This would ofc eventually be useful for svm type things.. I expect
we'll eventually care about that too.)

BR,
-R

>
> BR,
> -R
>
> >
> > As a template, I'd suggest:
> >
> > > > > diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> > > > > index 8d1cd54d82a6..d5134e0d5cce 100644
> > > > > --- a/drivers/iommu/arm-smmu.h
> > > > > +++ b/drivers/iommu/arm-smmu.h
> > > > > @@ -386,6 +386,7 @@ struct arm_smmu_impl {
> > > > >      int (*init_context)(struct arm_smmu_domain *smmu_domain);
> > > > >      void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
> > > > >               int status);
> >
> > /*
> >  * Stall transactions on a context fault, where they will be terminated
> >  * in response to the resulting IRQ rather than immediately. This should
> >  * pretty much always be set to "false" as stalling can introduce the
> >  * potential for deadlock in most SoCs, however it is needed on Qualcomm
> >  * XXXX because YYYY.
> >  */
> >
> > > > > +    bool stall;
> >
> > Hmm, the more I think about this, the more I think this is an erratum
> > workaround in disguise, in which case this could be better named...
> >
> > Will
