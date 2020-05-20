Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E5E1DB9A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 18:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726966AbgETQfY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 12:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbgETQfX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 12:35:23 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95982C061A0E;
        Wed, 20 May 2020 09:35:23 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id k19so3755050edv.9;
        Wed, 20 May 2020 09:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=9LZ3N6eS+xeL2WycYe0EBKoO7cMTBM5h/pIzNPU0uoA=;
        b=nSeCxkUXkPBkC+bMaKiWwAFF5HRebqDVpy2P07v1pSBINuZBVZrf4qlB2nen9i6sAH
         IFNiIXIrUN7/tuSC8zY/0mc8OLB/Dy5M/PqFtsy+MvROKnmEOEYbxNmjNHHBtP5yR1wC
         e3mZqcCzaFHe66Jr3xmpznlMHFjMLoTVZB0MgFUVehc0ZWRuhc1CBINkbiW5bMx402RA
         87X4TCTW7B0+1j7zhQSNK60EnPn3zd6L5qJOHgbA7z/RpFx8aGqHVD0urC9LHIk5Vfi6
         FEN2xhZPC6SHsRR4Ng2Dwg8VngjkQbLwxZe9nm5LmdmlYvpg5d0xoqbdQSeqKVYSjbaF
         i37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=9LZ3N6eS+xeL2WycYe0EBKoO7cMTBM5h/pIzNPU0uoA=;
        b=FKs2fhRQSUI/hU+VipTiWz2lGBXI7uZJ0defyBJd79LeP3PBegIXmM9d2CZAuxX10O
         0pd391pYa6VonBSbMoeUr/Xrnz+wNd+EI8m3K5TSwhl3Bx5MIN05qyt3HUGU6jLYHuCj
         wrwjD6lY9zVbWfAEGP9OQlC64uPY4k9zMa7SIcVI6w4WGcvNvwQ9ifCLQ1XkI9MVUDQG
         NVIXGANiM2RPZVl0uqgwv/u9v97n8QwpoA4x+oTkxtgvMEDizrEbn05nPATZGST8ilkn
         MZUxCH/ne8wgUWcuCqpi+5i3jivH/i/sscD8DdGFpd7MerLyGYH6LheLn5kSL68vvkVW
         QqsQ==
X-Gm-Message-State: AOAM531dalp4tAlpF3I47R7RoVYSfIsA2DY1ZB8Jurtbyfhk3CWwMGGD
        QOGPIt76nXSYgp7vxGdsxiWrON+rWt/e/MjqLew=
X-Google-Smtp-Source: ABdhPJztbIVCpypzfMmeE5wi7QZW2wjqt6WJKlmD8c/fGvtyo/k1t0yxQTzmcpir4NVu6nGdGh39/iZWxPahJYBNZUU=
X-Received: by 2002:a50:d7c7:: with SMTP id m7mr4323197edj.101.1589992522103;
 Wed, 20 May 2020 09:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <1580249770-1088-1-git-send-email-jcrouse@codeaurora.org>
 <1580249770-1088-3-git-send-email-jcrouse@codeaurora.org> <20200318224840.GA10796@willie-the-truck>
 <CAF6AEGu-hj6=3rsCe5XeBq_ffoq9VFmL+ycrQ8N=iv89DZf=8Q@mail.gmail.com>
 <20200518151838.GL32394@willie-the-truck> <CAF6AEGswv3ZaJyy_kYv6FKAjO5=_juDwEtK+VE9TcVMLGvrdwA@mail.gmail.com>
 <20200520125700.GD25815@willie-the-truck> <20200520151312.GB31730@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200520151312.GB31730@jcrouse1-lnx.qualcomm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 20 May 2020 09:35:42 -0700
Message-ID: <CAF6AEGtF+_Q3=GxaVrAtqsPC3B6p_Dc5PB+DQ=btsg3wAej5bg@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] arm/smmu: Add auxiliary domain support for arm-smmuv2
To:     Will Deacon <will@kernel.org>, Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 20, 2020 at 8:13 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Wed, May 20, 2020 at 01:57:01PM +0100, Will Deacon wrote:
> > On Mon, May 18, 2020 at 08:50:27AM -0700, Rob Clark wrote:
> > > On Mon, May 18, 2020 at 8:18 AM Will Deacon <will@kernel.org> wrote:
> > > > On Wed, Mar 18, 2020 at 04:43:07PM -0700, Rob Clark wrote:
> > > > > We do in fact need live domain switching, that is really the whole
> > > > > point.  The GPU CP (command processor/parser) is directly updating
> > > > > TTBR0 and triggering TLB flush, asynchronously from the CPU.
> > > > >
> > > > > And I think the answer about ASID is easy (on current hw).. it must be zero[*].
> > > >
> > > > Using ASID zero is really bad, because it means that you will end up sharing
> > > > TLB entries with whichever device is using context bank 0.
> > > >
> > > > Is the SMMU only used by the GPU in your SoC?
> > > >
> > >
> > > yes, the snapdragon SoCs have two SMMU instances, one used by the GPU,
> > > where ASID0/cb0 is the gpu itself, and another cb is the GMU
> > > (basically power control for the gpu), and the second SMMU is
> > > everything else.
> >
> > Right, in which case I'm starting to think that we should treat this GPU
> > SMMU instance specially. Give it its own compatible string (looks like you
> > need this for HUPCFG anyway) and hook in via arm_smmu_impl_init(). You can
> > then set IO_PGTABLE_QUIRK_ARM_TTBR1 when talking to the io-pgtable code
> > without having to add a domain attribute.
>
> If we did this via a special GPU SMMU instance then we could also create and
> register a dummy TTBR0 instance along with the TTBR1 instance and then we
> wouldn't need to worry about the aux domains at all.
>
> > With that. you'll need to find a way to allow the GPU driver to call into
> > your own hooks for getting at the TTBR0 tables -- given that you're
> > programming these in the hardware, I don't think it makes sense to expose
> > that in the IOMMU API, since most devices won't be able to do anything with
> > that data. Perhaps you could install a couple of function pointers
> > (subdomain_alloc/subdomain_free) in the GPU device when you see it appear
> > from the SMMU driver? Alternatively, you could make an io_pgtable_cfg
> > available so that the GPU driver can interface with io-pgtable directly.
>
> I don't want to speak for Rob but I think that this is the same direction we've
> landed on. If we use the implementation specific code to initialize the base
> pagetables then the GPU driver can use io-pgtable directly. We can easily
> construct an io_pgtable_cfg. This feature will only be available for opt-in
> GPU targets that will have a known configuration.

Agreed about using io-pgtable helpers directly.. the gpu's use-case is
pretty far different from anything normal/sane, and I don't think it
is worth designing some generic iommu interfaces with precisely one
user[*].  We just need enough in arm-smmu(/-impl) to bootstrap things
when we power up the gpu.

BR,
-R

[*] all the other gpu's that I've seen so far, even if they sit behind
an iommu, they have their own internal mmu

> The only gotcha is TLB maintenance but Rob and I have ideas about coordinating
> with the GPU hardware (which has to do a TLBIALL during a switch anyway) and we
> can always use the iommu_tlb_flush_all() hammer from software if we really need
> it. It might take a bit of thought, but it is doable.
>
> > Yes, it's ugly, but I don't think it's worth trying to abstract this.
>
> I'm not sure how ugly it is. I've always operated under the assumption that the
> GPU SMMU was special (though it had generic registers) just because of where it
> was and how it it was used.  In the long run baking in a implementation specific
> solution would probably be preferable to lots of domain attributes and aux
> domains that would never be used except by us.
>
> > Thoughts? It's taken me a long time to figure out what's going on here,
> > so sorry if it feels like I'm leading you round the houses.
>
> I'll hack on this and try to get something in place. It might be dumber on the
> GPU side than we would like but it would at least spur some more conversation.
>
> Jordan
>
> > Will
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
