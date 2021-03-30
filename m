Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6B434ED19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 18:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhC3QE2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 12:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231627AbhC3QD4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 12:03:56 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2765C061574;
        Tue, 30 Mar 2021 09:03:55 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id x13so16739439wrs.9;
        Tue, 30 Mar 2021 09:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6oj2QpU+iRP2QcXpQSoeLL823H9nv69wn1Ubcw3X/Kc=;
        b=oGf3rAc09tWox8W/AuayHxD57BYJkHett6R/hVoRJQkI/dsuvVQsdL+66QBQPYbZO8
         7THhwdyV51H945ZoxJJ5jgoQE1adMP2x6g1L6OVgqjahcsNzGiHVTu6IA/7mHr+IJoTe
         G2IRldQQOICbaa1RBtBbDZfRIbW4FXgw9hnfwAzpMP4E4foZcweEiry54xruXlagP21k
         XcoOokxVvs+Qse2Rf6Tt4VeNyK1jyyBHKCIvomFRhW/IRq3T5TGpU3ZuLfmOfUUI5hQs
         P/3sUmpZ5wxSwYnZxo9dJhApM9eLAmfB4ezalW1zrr0WOpAGs8ZoUsMpZDJ6ZjUb1W2R
         qWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6oj2QpU+iRP2QcXpQSoeLL823H9nv69wn1Ubcw3X/Kc=;
        b=sr1psPkqiWiwXknfTSC8+xBHArtcLVIEfVI1qxA7e1DadFOi2AbHbrIMlnRGU1mPD6
         lu7VVgyWzs4HhCyiIEgSQxs1CHgcQxbsR6GdFGwjIZ5MNAdFHazxoorRkhcHFxXx3dcw
         SYvWetRjDtsjh+EPrSdFDkqJ97ZyQKxlPjTZ0T5Mp32LodIMGzwq4WvHw8z3iCebH7YG
         i14LeUqYMEudHP2zJl6vHpC5bs7ylQWmjy7TsYI/FjXV73LWX6j04jEjYbHDfesD+oY3
         OBELavMk7yP5ZDdfEwlyopJcFH4nWxcZnkdb3t/FKKGEgWn3ebnFKE3Lur/83N+zrC1h
         /brg==
X-Gm-Message-State: AOAM532nVZY1n9m3+jUV4Ma/jBmLgt/9DBKRVY5mKEeKxU42zsE4qQgZ
        oIK/0IRfROrZEMhtWv6U4Oakl7ZvToI32/fd4V4=
X-Google-Smtp-Source: ABdhPJyIo4QMtpT4Jjy6Aso1yAaVwCCbPHuaf9YAguVzhh4oj3SzRFzxG8rjYLqc6NicwaW7b/FSImz48Hamu6fJQ0Y=
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr35756480wrh.28.1617120234562;
 Tue, 30 Mar 2021 09:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210326231303.3071950-1-eric@anholt.net> <20210329144729.GB4203@willie-the-truck>
 <CAF6AEGugpEk396DVtWX=W+uf3p-wcgBfCSpSLWGQJE1vKpJ4aw@mail.gmail.com>
 <20210330093432.GB5281@willie-the-truck> <CAF6AEGvCCWvmRBhzY4MsdzgwfJ+GF2AUOS-_NTyhM8wtnDzY2Q@mail.gmail.com>
 <20210330153050.GB6567@willie-the-truck>
In-Reply-To: <20210330153050.GB6567@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 30 Mar 2021 09:07:18 -0700
Message-ID: <CAF6AEGs+gUZ+5kmyA0Xz4jz8QJRgLVfaWmvQzuwXZBBG4xAr5w@mail.gmail.com>
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

On Tue, Mar 30, 2021 at 8:31 AM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Mar 30, 2021 at 08:03:36AM -0700, Rob Clark wrote:
> > On Tue, Mar 30, 2021 at 2:34 AM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Mon, Mar 29, 2021 at 09:02:50PM -0700, Rob Clark wrote:
> > > > On Mon, Mar 29, 2021 at 7:47 AM Will Deacon <will@kernel.org> wrote:
> > > > >
> > > > > On Fri, Mar 26, 2021 at 04:13:02PM -0700, Eric Anholt wrote:
> > > > > > db820c wants to use the qcom smmu path to get HUPCF set (which keeps
> > > > > > the GPU from wedging and then sometimes wedging the kernel after a
> > > > > > page fault), but it doesn't have separate pagetables support yet in
> > > > > > drm/msm so we can't go all the way to the TTBR1 path.
> > > > >
> > > > > What do you mean by "doesn't have separate pagetables support yet"? The
> > > > > compatible string doesn't feel like the right way to determine this.
> > > >
> > > > the compatible string identifies what it is, not what the sw
> > > > limitations are, so in that regard it seems right to me..
> > >
> > > Well it depends on what "doesn't have separate pagetables support yet"
> > > means. I can't tell if it's a hardware issue, a firmware issue or a driver
> > > issue.
> >
> > Just a driver issue (and the fact that currently we don't have
> > physical access to a device... debugging a5xx per-process-pgtables by
> > pushing untested things to the CI farm is kind of a difficult way to
> > work)
>
> But then in that case, this is using the compatible string to identify a
> driver issue, no?
>

Well, I suppose yes.. but OTOH it is keeping the problem out of the
dtb.  Once per-process pgtables works for a5xx, there would be no dtb
change, just a change to the quirk behavior in arm-smmu-qcom.

BR,
-R
