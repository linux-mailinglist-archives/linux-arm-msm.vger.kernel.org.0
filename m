Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C36C18A961
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 00:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgCRXnU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 19:43:20 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38478 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgCRXnU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 19:43:20 -0400
Received: by mail-ed1-f65.google.com with SMTP id h5so356902edn.5;
        Wed, 18 Mar 2020 16:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T6rxV8z4faDRzhqK467Xv2a7dOy/TE520C3YV3WjV8c=;
        b=i3FPub1DIHkvCD+yi/2Y0pX69MrTIvO1RmbzVf6wk00DV0ApmY13YfnnFpks/NVTLs
         G1QplMy/+0w+GsFrwD1fV1STvoKneEr8NQlSW0vIhii6MAK+xDn8ddbmfxyIfh+bWkPE
         NEeRdRZ2QE6MO1YpPwSPzXvQKexEK5sr8Dox9C9jyfSyvqP6X6trr48Ms86RoFLn9dAG
         92zK1vRSIdLYDibQabEa5foOn7Ajn4QGZfbFS6XCk1yr6R/d+WaM4jqJ31uE4ljyQmMb
         YiomgNSyyErYriEW6Abwe6sruyYqTy62RHKzpwUnN7Vinym7R/FBnsL8LzowJAa3l8q2
         3Z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T6rxV8z4faDRzhqK467Xv2a7dOy/TE520C3YV3WjV8c=;
        b=O1nEDNd9FSAUNGQHVc6BjpCTY0iaCckSwTESS23JEBb0jXNfg5aYUNZTspKC6t0Hwz
         oqGpUYH3lGjOcp6jNX6IjK6LJadyknTgTLB1qLKyu1PBz308HsUwASFx6zVO+rSznWDo
         lZgm4bDogt7Th5zeWaRMbKvFZ3MYOvCfpaChIR3T/Yp6FJdQkxMcoz2AmisY5ktxpUwr
         jNFKV6+Q7nRA+y+1gG8diMlNd63E8NlMdZnmHU+D39wOubdDwH02CV2y9d9jGkFje0jF
         G/Pvvutb53oYWTEmlvqvo/Qvmi/a6XWcA8PyTGInBH0ctZJMmbsS08S4kXJBbmh5zPoH
         abyA==
X-Gm-Message-State: ANhLgQ1kLEpvZznWhcEJx/I0rWwTN15B9sE9k1mHG4S6K3M+6ZslQHZP
        Fp2x09LPQmAO5wIswFRP/+iWh9d3q3KhaciAjFDStbvC
X-Google-Smtp-Source: ADFU+vunbg/mabJAoT4ECckSo9VlWXEI7Tk7MCM2NEIzGX//dTyumqWFksHG62C18XwPsVHwF/wqELk+aHHpZR6UYqI=
X-Received: by 2002:a17:906:b888:: with SMTP id hb8mr686525ejb.166.1584574997823;
 Wed, 18 Mar 2020 16:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <1580249770-1088-1-git-send-email-jcrouse@codeaurora.org>
 <1580249770-1088-3-git-send-email-jcrouse@codeaurora.org> <20200318224840.GA10796@willie-the-truck>
In-Reply-To: <20200318224840.GA10796@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 18 Mar 2020 16:43:07 -0700
Message-ID: <CAF6AEGu-hj6=3rsCe5XeBq_ffoq9VFmL+ycrQ8N=iv89DZf=8Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] arm/smmu: Add auxiliary domain support for arm-smmuv2
To:     Will Deacon <will@kernel.org>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
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

On Wed, Mar 18, 2020 at 3:48 PM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Jan 28, 2020 at 03:16:06PM -0700, Jordan Crouse wrote:
> > Support auxiliary domains for arm-smmu-v2 to initialize and support
> > multiple pagetables for a single SMMU context bank. Since the smmu-v2
> > hardware doesn't have any built in support for switching the pagetable
> > base it is left as an exercise to the caller to actually use the pagetable.
> >
> > Aux domains are supported if split pagetable (TTBR1) support has been
> > enabled on the master domain.  Each auxiliary domain will reuse the
> > configuration of the master domain. By default the a domain with TTBR1
> > support will have the TTBR0 region disabled so the first attached aux
> > domain will enable the TTBR0 region in the hardware and conversely the
> > last domain to be detached will disable TTBR0 translations.  All subsequent
> > auxiliary domains create a pagetable but not touch the hardware.
> >
> > The leaf driver will be able to query the physical address of the
> > pagetable with the DOMAIN_ATTR_PTBASE attribute so that it can use the
> > address with whatever means it has to switch the pagetable base.
> >
> > Following is a pseudo code example of how a domain can be created
> >
> >  /* Check to see if aux domains are supported */
> >  if (iommu_dev_has_feature(dev, IOMMU_DEV_FEAT_AUX)) {
> >        iommu = iommu_domain_alloc(...);
> >
> >        if (iommu_aux_attach_device(domain, dev))
> >                return FAIL;
> >
> >       /* Save the base address of the pagetable for use by the driver
> >       iommu_domain_get_attr(domain, DOMAIN_ATTR_PTBASE, &ptbase);
> >  }
>
> I'm not really understanding what the pagetable base gets used for here and,
> to be honest with you, the whole thing feels like a huge layering violation
> with the way things are structured today. Why doesn't the caller just
> interface with io-pgtable directly?
>
> Finally, if we need to support context-switching TTBR0 for a live domain
> then that code really needs to live inside the SMMU driver because the
> ASID and TLB management necessary to do that safely doesn't belong anywhere
> else.

Hi Will,

We do in fact need live domain switching, that is really the whole
point.  The GPU CP (command processor/parser) is directly updating
TTBR0 and triggering TLB flush, asynchronously from the CPU.

And I think the answer about ASID is easy (on current hw).. it must be zero[*].

BR,
-R

[*] my rough theory/plan there, and to solve the issue with drm/msm
getting dma-iommu ops when it really would rather not (since
blacklisting idea wasn't popular and I couldn't figure out a way to
deal with case where device gets attached before driver shows up) is
to invent some API that drm/msm can call to unhook the dma-iommu ops
and detatch the DMA domain.  Hopefully that at least gets us closer to
the point where, when drm/msm attaches it's UNMANAGED domain, we get
cbidx/asid zero.
