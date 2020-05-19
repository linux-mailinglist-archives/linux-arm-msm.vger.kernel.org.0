Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB851D9AD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 17:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbgESPLr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 11:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729152AbgESPLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 11:11:44 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB90C08C5C0;
        Tue, 19 May 2020 08:11:44 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a2so2579361ejb.10;
        Tue, 19 May 2020 08:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qFmnDDUmU7bAXUCXAiIOCZYqhy9KJ7cJu0vEwn4yYb0=;
        b=G66bJ6dC8bOeKCV1WGYuwjLa+qKy7Y0+n3uWze8Gn1ZAszBOTqKWQ62WTUjzafwL9U
         +GTPdcyHtNf5XKqMcGlQmJUpD97lSXKgCjwnFB4vjmiLtm75QmbmYTM3DtiB9XBAXubk
         8oSegy8cxFNV3j8wgjPmI1EI4FQZ05wphJXLMEfxZ7N/L87ptMxbQDNAdetxkOFNUMkL
         HpE+J0BbniB9iXMsBbBOr2cxGGu68R8o5msor4h3OyP4WEVKPSwrF4l3Kxol9Kvm0vUG
         oiXtOGlLJLyzkc5iFPnvHSCYntlakDIurYnTYtiSq9/gpPVc72+0QTJLIip+97mGYOYs
         4eDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qFmnDDUmU7bAXUCXAiIOCZYqhy9KJ7cJu0vEwn4yYb0=;
        b=RimmHQYVrejnmcibK7f0A1RQkVPgJbR4B/6YOUtJQXQfZCVFFpmJNvR4xpZm/bRUTp
         mC0N2exf8/Fyix29oNpwuhzqj4ukbhe1/aNn49AsldGTAOHjjf326OckpRBm5BTCv06E
         JykaJOs11MXERtDzre/T5+eTAGmXwGu3XK9M/0iDmUQmqTH7dZwBiqJJn8eW3YFnBLt1
         oCmlWk5HGUPoCT7pfLOmaSkUvulGPTJfwJwlkJQwKm52LcoK88aViEqVlEppja6HNGfP
         lEDiHU93J0AIlWZ5OjnuFSRKgxXF9+GUVleuGUsqrHTo9NaS0fRmBWZ6yJCdkuqLc9xI
         LSng==
X-Gm-Message-State: AOAM5325HF8+NR1HKBhdnVsTb8CRd8BfmGZANTSKe8HBMYzuQD6ZTSrx
        Etg096xpmMhzthyt2XmfyCTXr31QYPgWNZAvvgk=
X-Google-Smtp-Source: ABdhPJzO3neINwRRzJbIjXOIJwQTkTwZpvqUbx/rpVcTcaX7VHke7n+JUXqMuZyVp2d+kaG3FsnjsThgVhsZPoFWTDE=
X-Received: by 2002:a17:906:1088:: with SMTP id u8mr1110995eju.428.1589901102998;
 Tue, 19 May 2020 08:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200421202004.11686-1-saiprakash.ranjan@codeaurora.org>
 <b491e02ad790a437115fdeab6b21bc48@codeaurora.org> <1ced023b-157c-21a0-ac75-1adef7f029f0@arm.com>
 <20200507125357.GA31783@willie-the-truck> <CAF6AEGuLU+_qP8HNO1s9PTPHqJnCMHzehmcT8NiJhiAwrfSH6w@mail.gmail.com>
 <CAF6AEGvuHKObTR97XdSXjmjKB+qjQ8N1_wxM=ZU8bEkF=cXp-A@mail.gmail.com>
 <20200511173008.GA24282@jcrouse1-lnx.qualcomm.com> <20200518154522.GN32394@willie-the-truck>
 <5a0ad639e272026c8be57393937cda22@codeaurora.org>
In-Reply-To: <5a0ad639e272026c8be57393937cda22@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 19 May 2020 08:11:59 -0700
Message-ID: <CAF6AEGuzBtj+srindmOvhaom5BdS2adLaOF=v_MtguMja14V2w@mail.gmail.com>
Subject: Re: [PATCH] iomm/arm-smmu: Add stall implementation hook
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 19, 2020 at 2:26 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Will,
>
> On 2020-05-18 21:15, Will Deacon wrote:
> > On Mon, May 11, 2020 at 11:30:08AM -0600, Jordan Crouse wrote:
> >> On Fri, May 08, 2020 at 08:40:40AM -0700, Rob Clark wrote:
> >> > On Fri, May 8, 2020 at 8:32 AM Rob Clark <robdclark@gmail.com> wrote:
> >> > >
> >> > > On Thu, May 7, 2020 at 5:54 AM Will Deacon <will@kernel.org> wrote:
> >> > > >
> >> > > > On Thu, May 07, 2020 at 11:55:54AM +0100, Robin Murphy wrote:
> >> > > > > On 2020-05-07 11:14 am, Sai Prakash Ranjan wrote:
> >> > > > > > On 2020-04-22 01:50, Sai Prakash Ranjan wrote:
> >> > > > > > > Add stall implementation hook to enable stalling
> >> > > > > > > faults on QCOM platforms which supports it without
> >> > > > > > > causing any kind of hardware mishaps. Without this
> >> > > > > > > on QCOM platforms, GPU faults can cause unrelated
> >> > > > > > > GPU memory accesses to return zeroes. This has the
> >> > > > > > > unfortunate result of command-stream reads from CP
> >> > > > > > > getting invalid data, causing a cascade of fail.
> >> > > > >
> >> > > > > I think this came up before, but something about this rationale doesn't add
> >> > > > > up - we're not *using* stalls at all, we're still terminating faulting
> >> > > > > transactions unconditionally; we're just using CFCFG to terminate them with
> >> > > > > a slight delay, rather than immediately. It's really not clear how or why
> >> > > > > that makes a difference. Is it a GPU bug? Or an SMMU bug? Is this reliable
> >> > > > > (or even a documented workaround for something), or might things start
> >> > > > > blowing up again if any other behaviour subtly changes? I'm not dead set
> >> > > > > against adding this, but I'd *really* like to have a lot more confidence in
> >> > > > > it.
> >> > > >
> >> > > > Rob mentioned something about the "bus returning zeroes" before, but I agree
> >> > > > that we need more information so that we can reason about this and maintain
> >> > > > the code as the driver continues to change. That needs to be a comment in
> >> > > > the driver, and I don't think "but android seems to work" is a good enough
> >> > > > justification. There was some interaction with HUPCF as well.
> >> > >
> >> > > The issue is that there are multiple parallel memory accesses
> >> > > happening at the same time, for example CP (the cmdstream processor)
> >> > > will be reading ahead and setting things up for the next draw or
> >> > > compute grid, in parallel with some memory accesses from the shader
> >> > > which could trigger a fault.  (And with faults triggered by something
> >> > > in the shader, there are *many* shader threads running in parallel so
> >> > > those tend to generate a big number of faults at the same time.)
> >> > >
> >> > > We need either CFCFG or HUPCF, otherwise what I have observed is that
> >> > > while the fault happens, CP's memory access will start returning
> >> > > zero's instead of valid cmdstream data, which triggers a GPU hang.  I
> >> > > can't say whether this is something unique to qcom's implementation of
> >> > > the smmu spec or not.
> >> > >
> >> > > *Often* a fault is the result of the usermode gl/vk/cl driver bug,
> >> > > although I don't think that is an argument against fixing this in the
> >> > > smmu driver.. I've been carrying around a local patch to set HUPCF for
> >> > > *years* because debugging usermode driver issues is so much harder
> >> > > without.  But there are some APIs where faults can be caused by the
> >> > > user's app on top of the usermode driver.
> >> > >
> >> >
> >> > Also, I'll add to that, a big wish of mine is to have stall with the
> >> > ability to resume later from a wq context.  That would enable me to
> >> > hook in the gpu crash dump handling for faults, which would make
> >> > debugging these sorts of issues much easier.  I think I posted a
> >> > prototype of this quite some time back, which would schedule a worker
> >> > on the first fault (since there are cases where you see 1000's of
> >> > faults at once), which grabbed some information about the currently
> >> > executing submit and some gpu registers to indicate *where* in the
> >> > submit (a single submit could have 100's or 1000's of draws), and then
> >> > resumed the iommu cb.
> >> >
> >> > (This would ofc eventually be useful for svm type things.. I expect
> >> > we'll eventually care about that too.)
> >>
> >> Rob is right about HUPCF. Due to the parallel nature of the command
> >> processor
> >> there is always a very good chance that a CP access is somewhere in
> >> the bus so
> >> any pagefault is usually a death sentence. The GPU context bank would
> >> always
> >> want HUPCF set to 1.
> >
> > So this sounds like an erratum to me, and I'm happy to set HUPCF if we
> > detect the broken implementation. However, it will need an entry in
> > Documentation/arm64/silicon-errata.rst and a decent comment in the
> > driver
> > to explain what we're doing and why.
> >
>
> AFAIK there is no erratum documented internally for this behaviour and
> this
> exists from MSM8996 SoC time and errata usually don't survive this long
> across generation of SoCs and there is no point for us in disguising it.

possibly longer, qcom_iommu sets CFCFG..

> Is it OK if we clearly mention it as the "design limitation" or some
> other
> term which we can agree upon along with the description which Rob and
> Jordan
> provided for setting HUPCF in the driver when we add the set_hupcf
> callback?

I'm not too picky on what we call it, but afaict it has been this way
since the beginning of time, rather than specific to a certain SoC or
generation of SoCs.  So it doesn't seem like the hw designers consider
it a bug.

(I'm not sure what the expected behavior is.. nor if any other SMMU
implementation encounters this sort of situation..)

BR,
-R

>
> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
