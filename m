Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE9A33DA6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Mar 2021 18:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236010AbhCPRNw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 13:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239088AbhCPRNZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 13:13:25 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473C4C06174A;
        Tue, 16 Mar 2021 10:13:24 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so4183691wma.0;
        Tue, 16 Mar 2021 10:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+zecumvBBM4+jVU12iC+gdz4LVIAiUhdUepbui1YKwE=;
        b=E9aoOV82C58+vaomBtbFVxX//WtC3oq/ii16cozwGQo5aEbhaTgmAldW+aw7I98vg4
         iYF6cs+3/dK28hr0j1LfquxkSBvAqydxt/vjxdfCX5Q8tn8MPdC4Uev+OyNyxdkpejAt
         zN9G+ZHogme9EflISXLdlQCf9KBBiEQWsnPAN5dHR2KT+RJyTfWEQYQl3UE41yVbJtqv
         //7I753ACb+diOJQIym4kWqsA96g4+Jf5tgXuk5pS2h56otAWBajUeaxuZ1e6/UlxWHJ
         w+cTwNsEw6TmAq9SL5UOwpppopOe1RDeemgT/TgHcN/bh6oEz3SZZFprtCpOKqVHyjk4
         Hy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+zecumvBBM4+jVU12iC+gdz4LVIAiUhdUepbui1YKwE=;
        b=dXT2Q/LqeIizWO+EZvpdJ/aHhx1mf4w8owL9dBjq5wEWW6Wp4/gGcr7DI+RQWQCyU9
         YbztDSckc+JjrevFhCwhjqZc3cR4CnmByxhjbS/lZfwhz2TJsjdny66eKkz2fLcQlNey
         3AgwAZZvWb0AKlCQYjQtO6bh4isnzJp9CKR7e7/7dNC+C3xyRZ7b8b9IrVc1Mme5Bx0T
         0XBrQl7vvl57CbfpVP46EusNXsXTLFcXaYN23OKNp/Fv8FCusgGbjpc35vJB60/3tOt1
         zGdH1PXtejyB7EaryO/bWUKve0VfBp1qJEYzQZN+wiy61Zvt7oL3+b+pOgLTXfZg/UFE
         4oGQ==
X-Gm-Message-State: AOAM531ghiHcVXQk1+8azjv9OrFeNBm6KoP/8IOgx/dbk4QaWV/wK+nG
        sfbpYHNgu6Pl3p21HIx/ChuWOuNhCVBvAuUDFiI=
X-Google-Smtp-Source: ABdhPJxX7uiSPb/8phuyYwT9i6WAojMMq9tsUcba9CYDVfdj11bpGhVidfFXQpZ80Dq5Zc09ZeZxka/LY26IxCQ0nic=
X-Received: by 2002:a7b:c75a:: with SMTP id w26mr81494wmk.49.1615914802934;
 Tue, 16 Mar 2021 10:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210129090516.GB3998@willie-the-truck> <5d23fce629323bcda71594010824aad0@codeaurora.org>
 <20210201111556.GA7172@willie-the-truck> <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
 <20210201182016.GA21629@jcrouse1-lnx.qualcomm.com> <7e9aade14d0b7f69285852ade4a5a9f4@codeaurora.org>
 <20210203214612.GB19847@willie-the-truck> <CAF6AEGvjzkRqr8-z56tJdMs-LsoLMr1m5cVAq_++xCdHjTPKrQ@mail.gmail.com>
 <CAF6AEGveB=t0gQ0-WZn_qy=scYR60DEcum53saovg5h31ZMHog@mail.gmail.com>
In-Reply-To: <CAF6AEGveB=t0gQ0-WZn_qy=scYR60DEcum53saovg5h31ZMHog@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 16 Mar 2021 10:16:31 -0700
Message-ID: <CAF6AEGuc5i9hMtfU3HSpLVWi_e=emJTPLqntzJfAH69dO_gagA@mail.gmail.com>
Subject: Re: [PATCH 2/3] iommu/io-pgtable-arm: Add IOMMU_LLC page protection flag
To:     Will Deacon <will@kernel.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Kristian H Kristensen <hoegsberg@google.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 16, 2021 at 10:04 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Feb 3, 2021 at 2:14 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Wed, Feb 3, 2021 at 1:46 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > On Tue, Feb 02, 2021 at 11:56:27AM +0530, Sai Prakash Ranjan wrote:
> > > > On 2021-02-01 23:50, Jordan Crouse wrote:
> > > > > On Mon, Feb 01, 2021 at 08:20:44AM -0800, Rob Clark wrote:
> > > > > > On Mon, Feb 1, 2021 at 3:16 AM Will Deacon <will@kernel.org> wrote:
> > > > > > > On Fri, Jan 29, 2021 at 03:12:59PM +0530, Sai Prakash Ranjan wrote:
> > > > > > > > On 2021-01-29 14:35, Will Deacon wrote:
> > > > > > > > > On Mon, Jan 11, 2021 at 07:45:04PM +0530, Sai Prakash Ranjan wrote:
> > > > > > > > > > +#define IOMMU_LLC        (1 << 6)
> > > > > > > > >
> > > > > > > > > On reflection, I'm a bit worried about exposing this because I think it
> > > > > > > > > will
> > > > > > > > > introduce a mismatched virtual alias with the CPU (we don't even have a
> > > > > > > > > MAIR
> > > > > > > > > set up for this memory type). Now, we also have that issue for the PTW,
> > > > > > > > > but
> > > > > > > > > since we always use cache maintenance (i.e. the streaming API) for
> > > > > > > > > publishing the page-tables to a non-coheren walker, it works out.
> > > > > > > > > However,
> > > > > > > > > if somebody expects IOMMU_LLC to be coherent with a DMA API coherent
> > > > > > > > > allocation, then they're potentially in for a nasty surprise due to the
> > > > > > > > > mismatched outer-cacheability attributes.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Can't we add the syscached memory type similar to what is done on android?
> > > > > > >
> > > > > > > Maybe. How does the GPU driver map these things on the CPU side?
> > > > > >
> > > > > > Currently we use writecombine mappings for everything, although there
> > > > > > are some cases that we'd like to use cached (but have not merged
> > > > > > patches that would give userspace a way to flush/invalidate)
> > > > > >
> > > > >
> > > > > LLC/system cache doesn't have a relationship with the CPU cache.  Its
> > > > > just a
> > > > > little accelerator that sits on the connection from the GPU to DDR and
> > > > > caches
> > > > > accesses. The hint that Sai is suggesting is used to mark the buffers as
> > > > > 'no-write-allocate' to prevent GPU write operations from being cached in
> > > > > the LLC
> > > > > which a) isn't interesting and b) takes up cache space for read
> > > > > operations.
> > > > >
> > > > > Its easiest to think of the LLC as a bonus accelerator that has no cost
> > > > > for
> > > > > us to use outside of the unfortunate per buffer hint.
> > > > >
> > > > > We do have to worry about the CPU cache w.r.t I/O coherency (which is a
> > > > > different hint) and in that case we have all of concerns that Will
> > > > > identified.
> > > > >
> > > >
> > > > For mismatched outer cacheability attributes which Will mentioned, I was
> > > > referring to [1] in android kernel.
> > >
> > > I've lost track of the conversation here :/
> > >
> > > When the GPU has a buffer mapped with IOMMU_LLC, is the buffer also mapped
> > > into the CPU and with what attributes? Rob said "writecombine for
> > > everything" -- does that mean ioremap_wc() / MEMREMAP_WC?
> >
> > Currently userspace asks for everything WC, so pgprot_writecombine()
> >
> > The kernel doesn't enforce this, but so far provides no UAPI to do
> > anything useful with non-coherent cached mappings (although there is
> > interest to support this)
> >
>
> btw, I'm looking at a benchmark (gl_driver2_off) where (after some
> other in-flight optimizations land) we end up bottlenecked on writing
> to WC cmdstream buffers.  I assume in the current state, WC goes all
> the way to main memory rather than just to system cache?
>

oh, I guess this (mentioned earlier in thread) is what I really want
for this benchmark:

https://android-review.googlesource.com/c/kernel/common/+/1549097/3

> BR,
> -R
>
> > BR,
> > -R
> >
> > > Finally, we need to be careful when we use the word "hint" as "allocation
> > > hint" has a specific meaning in the architecture, and if we only mismatch on
> > > those then we're actually ok. But I think IOMMU_LLC is more than just a
> > > hint, since it actually drives eviction policy (i.e. it enables writeback).
> > >
> > > Sorry for the pedantry, but I just want to make sure we're all talking
> > > about the same things!
> > >
> > > Cheers,
> > >
> > > Will
