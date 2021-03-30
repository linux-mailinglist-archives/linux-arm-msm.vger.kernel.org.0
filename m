Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5E734EB62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 17:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbhC3PA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 11:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbhC3PAP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 11:00:15 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C98C061574;
        Tue, 30 Mar 2021 08:00:14 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id k8so16555441wrc.3;
        Tue, 30 Mar 2021 08:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eyleulbhx+njoqqH6BwP+l7pCWQF8y0aALwi12vfKYM=;
        b=fCSzzlhwIZRxnh8WlrLMYbm5+Njdfj6dEm0bHf8r+xDzYIMacTSD3i3NQycSovzuSj
         EVXrsaeA+8Q6clda2Fzt4qondyXdQQukQijU645yfl1pKwDdMg7e0hWT+6yAAVSUFuAI
         +Wy1BnSqMiT25Xv8Eh/rM+OWoPrHHNKMd1huKxUhZX3A1kI+9r4cSt2vualljOOYrzRq
         mNNZkNSVQQuKhfEkIKegbY/PcTiIj000vuo7Lx+eJ97k/smtTH32v+AczD0ypz4/NGG5
         TXj0QNsAfH8tw3UI0GxZAqJ4Z4+5VzZoZJMbwM+UPAScRykVfUXfpx69lKfy1ADRVNE5
         lX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eyleulbhx+njoqqH6BwP+l7pCWQF8y0aALwi12vfKYM=;
        b=HhN9E8BWcwMjgDojQ7xjkbppha6Ys6GadZ7evYve8m69CSiMGNFvEgu8dqESS/xz7X
         5oeTJHOg2/2+Ry6aHEatHpvuTnLYHvQGSHjCUW8mNYXOWYw1JdWff54pjzI3hEhv+QYZ
         wr6RF0jEWeN3Lm7zrBCreUtHoveamGPdo1JUuwpXwJlfAWOgD4AObl5vQfpXx+f8G0zj
         2aOBCMD/xN1xO8FECueTSmooTOrrEjJn5eJy+CrzoZuy0qXhA9VefIkdG4ZBVHvdTwog
         Q7UvVcjOg3zMzTeuSxvoj2rW8WGuZLtboSujjkQXARFdFIax8llUxB49NhmvWb25bAae
         I1ZQ==
X-Gm-Message-State: AOAM5303qZiXvtLVoPkHxB/1e4kwsB63uzeoEUISLP2SuYCDW0zomfsB
        WiEI//bqk1qPCPCfJyogoeF+dLsio7EdEMpX5YhkWsqxEE8=
X-Google-Smtp-Source: ABdhPJwtCDJtqvJEY4d1K+b5/Nk9wM8y2m8HXX6bF4f+S6YTvz+OX7rJ6BNzGHpGdn+v7GZmGIK8aRudda7rzHLsgwk=
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr35449048wrh.28.1617116413088;
 Tue, 30 Mar 2021 08:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210326231303.3071950-1-eric@anholt.net> <20210329144729.GB4203@willie-the-truck>
 <CAF6AEGugpEk396DVtWX=W+uf3p-wcgBfCSpSLWGQJE1vKpJ4aw@mail.gmail.com> <20210330093432.GB5281@willie-the-truck>
In-Reply-To: <20210330093432.GB5281@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 30 Mar 2021 08:03:36 -0700
Message-ID: <CAF6AEGvCCWvmRBhzY4MsdzgwfJ+GF2AUOS-_NTyhM8wtnDzY2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
To:     Will Deacon <will@kernel.org>
Cc:     Eric Anholt <eric@anholt.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 30, 2021 at 2:34 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Mar 29, 2021 at 09:02:50PM -0700, Rob Clark wrote:
> > On Mon, Mar 29, 2021 at 7:47 AM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Fri, Mar 26, 2021 at 04:13:02PM -0700, Eric Anholt wrote:
> > > > db820c wants to use the qcom smmu path to get HUPCF set (which keeps
> > > > the GPU from wedging and then sometimes wedging the kernel after a
> > > > page fault), but it doesn't have separate pagetables support yet in
> > > > drm/msm so we can't go all the way to the TTBR1 path.
> > >
> > > What do you mean by "doesn't have separate pagetables support yet"? The
> > > compatible string doesn't feel like the right way to determine this.
> >
> > the compatible string identifies what it is, not what the sw
> > limitations are, so in that regard it seems right to me..
>
> Well it depends on what "doesn't have separate pagetables support yet"
> means. I can't tell if it's a hardware issue, a firmware issue or a driver
> issue.

Just a driver issue (and the fact that currently we don't have
physical access to a device... debugging a5xx per-process-pgtables by
pushing untested things to the CI farm is kind of a difficult way to
work)

BR,
-R
