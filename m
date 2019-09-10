Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3C4AEEC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2019 17:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436560AbfIJPpl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Sep 2019 11:45:41 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41223 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfIJPpk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Sep 2019 11:45:40 -0400
Received: by mail-ed1-f67.google.com with SMTP id z9so17554148edq.8;
        Tue, 10 Sep 2019 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ab44L4UsH9lWBk/ePs+t6LQUuKmRHFW0SwCWgf68+rc=;
        b=FUDx1VssMY5+grYTJ9mTO+OtexdcbSTMSsn3//VPNV0zPdSp95pA3zNOdpx4boIzLL
         +8wfwTnUnSWaD0DyKayLxvtLd1DNtf9KpsXdscr1lunnkyj9RgO10ZaIY4qDgscT06xv
         gsu7UNxm0Xryuv9rrw5a4GpIEVPRKWhPVPWKzBpbTQx6lkHw+mIFYb+srXGudTMQJCt5
         gonRN5rE57R/vyk+7sS8MiPSdeYzF3ZPo7wNMrmBj3lVkr6zixiEP6LKYNeZGu9gq5mv
         nhhDZVq5ROoxeNpfmQu0BO+jdHGVOWyuw0NkkZqryUCoeygfaKH+6X5QUf5q5jC92gdh
         i8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ab44L4UsH9lWBk/ePs+t6LQUuKmRHFW0SwCWgf68+rc=;
        b=Es2qF/PBt86WViNHx5n1wadDtRjmQoaA+GpjzHtD0+mZGww26rr0GqG6hVJLPgpNGY
         igaZU0Z3wdB+SqSQ+/ESQb/8FoN9shxzLkKTthuTGCosuMJr04PbGINwu12HnMJHUI4W
         YkDXFwLz/whOmCtVIe23FU0wnWCYhHSnSHFJRgYq60SZTclvyel632ufHsdg8Iswz1Cw
         tejkec4dNsbjSFt5TlYar5gfoJQ1hsyPUaps6qlVJz4F/RjnfdnAZAwX7nUqx0kO+RpN
         CTFrjAutoFQhPb9CiF7GcJkIdLl6eWvPYa0zmOr9s/XXoDlQPFWYOUsvqmdr9klOGLvE
         ZyYg==
X-Gm-Message-State: APjAAAVTvQKHFbwU2miQMHe4YwJlOj1xL0mvMkBZYcxZ/abR6CES7J3e
        0LNxNEHvVvEMXuqL5HWzwCD8d0rAlhBb7pD+HOibdQfY
X-Google-Smtp-Source: APXvYqzoKSvtwc7h3YF+c3ClC8RRDwvQEOuO9vmMklmmZ6/J8nMaSUMmvks3o2VNkPh4WYQkviIc241SjZs7jn1Ep9c=
X-Received: by 2002:a17:906:2451:: with SMTP id a17mr16927007ejb.164.1568130338310;
 Tue, 10 Sep 2019 08:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190907175013.24246-1-robdclark@gmail.com> <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
In-Reply-To: <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 10 Sep 2019 08:45:27 -0700
Message-ID: <CAF6AEGtd7kr2MckVy99ERQs4gmxjY6DteNdTLknBgpAZRpDgrA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu: fix "hang" when games exit
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 10, 2019 at 8:01 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 07/09/2019 18:50, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > When games, browser, or anything using a lot of GPU buffers exits, there
> > can be many hundreds or thousands of buffers to unmap and free.  If the
> > GPU is otherwise suspended, this can cause arm-smmu to resume/suspend
> > for each buffer, resulting 5-10 seconds worth of reprogramming the
> > context bank (arm_smmu_write_context_bank()/arm_smmu_write_s2cr()/etc).
> > To the user it would appear that the system is locked up.
> >
> > A simple solution is to use pm_runtime_put_autosuspend() instead, so we
> > don't immediately suspend the SMMU device.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> > Note: I've tied the autosuspend enable/delay to the consumer device,
> > based on the reasoning that if the consumer device benefits from using
> > an autosuspend delay, then it's corresponding SMMU probably does too.
> > Maybe that is overkill and we should just unconditionally enable
> > autosuspend.
>
> I'm not sure there's really any reason to expect that a supplier's usage
> model when doing things for itself bears any relation to that of its
> consumer(s), so I'd certainly lean towards the "unconditional" argument
> myself.

Sounds good, I'll respin w/ unconditional autosuspend

> Of course ideally we'd skip resuming altogether in the map/unmap paths
> (since resume implies a full TLB reset anyway), but IIRC that approach
> started to get messy in the context of the initial RPM patchset. I'm
> planning to fiddle around a bit more to clean up the implementation of
> the new iommu_flush_ops stuff, so I've made a note to myself to revisit
> RPM to see if there's a sufficiently clean way to do better. In the
> meantime, though, I don't have any real objection to using some
> reasonable autosuspend delay on the principle that if we've been woken
> up to map/unmap one page, there's a high likelihood that more will
> follow in short order (and in the configuration slow-paths it won't have
> much impact either way).

It does sort of remind me about something I was chatting with Jordan
the other day.. about how we could possibly skip the TLB inv for
unmaps from non-current pagetables once we have per-context
pagetables.

The challenge is, since the GPU's command parser is the one switching
pagetables, we don't have any race-free way to know which pagetables
are current.  But we do know which contexts have work queued up for
the GPU, so we can know either that a given context definitely isn't
current, or that it might be current.  And in the "definitely not
current" case we could skip TLB inv.

BR,
-R

>
> Robin.
>
> >   drivers/iommu/arm-smmu.c | 11 ++++++++++-
> >   1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > index c2733b447d9c..73a0dd53c8a3 100644
> > --- a/drivers/iommu/arm-smmu.c
> > +++ b/drivers/iommu/arm-smmu.c
> > @@ -289,7 +289,7 @@ static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
> >   static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> >   {
> >       if (pm_runtime_enabled(smmu->dev))
> > -             pm_runtime_put(smmu->dev);
> > +             pm_runtime_put_autosuspend(smmu->dev);
> >   }
> >
> >   static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
> > @@ -1445,6 +1445,15 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
> >       /* Looks ok, so add the device to the domain */
> >       ret = arm_smmu_domain_add_master(smmu_domain, fwspec);
> >
> > +#ifdef CONFIG_PM
> > +     /* TODO maybe device_link_add() should do this for us? */
> > +     if (dev->power.use_autosuspend) {
> > +             pm_runtime_set_autosuspend_delay(smmu->dev,
> > +                     dev->power.autosuspend_delay);
> > +             pm_runtime_use_autosuspend(smmu->dev);
> > +     }
> > +#endif
> > +
> >   rpm_put:
> >       arm_smmu_rpm_put(smmu);
> >       return ret;
> >
