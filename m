Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339721D7D53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 17:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbgERPuL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 11:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbgERPuL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 11:50:11 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B01C061A0C;
        Mon, 18 May 2020 08:50:10 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id l3so8806548edq.13;
        Mon, 18 May 2020 08:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mam0jmHC79p3v1pPEObliIl7gHrMe1XbetijSP5zncI=;
        b=CKIBsRZpRkNM2DDbEI75O6uMEon9GctsfbkrnQTJSoogb19ygIStXRAshUF0c4I+Rn
         91ArQTPD46KbURQ22gY6qmEIkkhxJIZBohLJQEgroA0QMp9vHrbwpU3X4HHDs1l+gp4d
         4jSFDJXSyXFJhcVKJijVmZaQJ6m11lnzI/SVjZO/F52kjZiiHR3s2cc3ErKUJmndJ5N6
         CzwPDMSIJzeh6hdg7YX3FJIhhYTjLinSUYE7CnNVVQW7OV8bb2mV6F4qS8TjRbWS6oCm
         Y8wuubh8LckHgZANHBsAL2uW/BDjWb+XKejPT89jttAzED+dqYcVJOViqAL4g1yFeDyI
         Pqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mam0jmHC79p3v1pPEObliIl7gHrMe1XbetijSP5zncI=;
        b=Nm18XtwJHGC7we9Z6P46DtGR7JBOXkt21BUlivXXNoqKMLxy1+bDonW4zJveuMinzG
         6aUm9+blQM3j7D4sENsqRpV7GOL2E5jZ5DG34kKMdfjTW1QiZGwgqxJUrJpFSSGri+1k
         /imtPo0SvjEhhkC/Pv+Hiu4rrOKsccI3/2ROXvLjWVman3kJlpsWqqsNtUYxS6K7WErl
         0H/sMgm70jqS4f77RDDRFVaZY+NeTwwsngRBpiwcUN1NvZGJR22QizWg2hEy6uuswrLQ
         b9RMSdEwEpX/4puGo6hGkEqC5/5eW/oq8FHZBfR/BGFfqrhkXLVuth9zgnLH4Pw+S80C
         9j9A==
X-Gm-Message-State: AOAM530EgHznjBkyWoy71HBdd+AnsAqnDZ+ZpTAKAO+ciQKw8P591037
        97xECYPcfTZNBMGaLczGnvqP+u5AWAabfJ8acOI=
X-Google-Smtp-Source: ABdhPJwAak2gmrJ75fYqfKG002IIAJ3g+T9yn75xNxFIQ0i05jgSdssvyWPSh4oXD0jc4sg7my3h0ep4LvxCtfrPbVs=
X-Received: by 2002:aa7:c38f:: with SMTP id k15mr482553edq.7.1589817009296;
 Mon, 18 May 2020 08:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <1580249770-1088-1-git-send-email-jcrouse@codeaurora.org>
 <1580249770-1088-3-git-send-email-jcrouse@codeaurora.org> <20200318224840.GA10796@willie-the-truck>
 <CAF6AEGu-hj6=3rsCe5XeBq_ffoq9VFmL+ycrQ8N=iv89DZf=8Q@mail.gmail.com> <20200518151838.GL32394@willie-the-truck>
In-Reply-To: <20200518151838.GL32394@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 18 May 2020 08:50:27 -0700
Message-ID: <CAF6AEGswv3ZaJyy_kYv6FKAjO5=_juDwEtK+VE9TcVMLGvrdwA@mail.gmail.com>
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

On Mon, May 18, 2020 at 8:18 AM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Mar 18, 2020 at 04:43:07PM -0700, Rob Clark wrote:
> > On Wed, Mar 18, 2020 at 3:48 PM Will Deacon <will@kernel.org> wrote:
> > > On Tue, Jan 28, 2020 at 03:16:06PM -0700, Jordan Crouse wrote:
> > > > Support auxiliary domains for arm-smmu-v2 to initialize and support
> > > > multiple pagetables for a single SMMU context bank. Since the smmu-v2
> > > > hardware doesn't have any built in support for switching the pagetable
> > > > base it is left as an exercise to the caller to actually use the pagetable.
> > > >
> > > > Aux domains are supported if split pagetable (TTBR1) support has been
> > > > enabled on the master domain.  Each auxiliary domain will reuse the
> > > > configuration of the master domain. By default the a domain with TTBR1
> > > > support will have the TTBR0 region disabled so the first attached aux
> > > > domain will enable the TTBR0 region in the hardware and conversely the
> > > > last domain to be detached will disable TTBR0 translations.  All subsequent
> > > > auxiliary domains create a pagetable but not touch the hardware.
> > > >
> > > > The leaf driver will be able to query the physical address of the
> > > > pagetable with the DOMAIN_ATTR_PTBASE attribute so that it can use the
> > > > address with whatever means it has to switch the pagetable base.
> > > >
> > > > Following is a pseudo code example of how a domain can be created
> > > >
> > > >  /* Check to see if aux domains are supported */
> > > >  if (iommu_dev_has_feature(dev, IOMMU_DEV_FEAT_AUX)) {
> > > >        iommu = iommu_domain_alloc(...);
> > > >
> > > >        if (iommu_aux_attach_device(domain, dev))
> > > >                return FAIL;
> > > >
> > > >       /* Save the base address of the pagetable for use by the driver
> > > >       iommu_domain_get_attr(domain, DOMAIN_ATTR_PTBASE, &ptbase);
> > > >  }
> > >
> > > I'm not really understanding what the pagetable base gets used for here and,
> > > to be honest with you, the whole thing feels like a huge layering violation
> > > with the way things are structured today. Why doesn't the caller just
> > > interface with io-pgtable directly?
> > >
> > > Finally, if we need to support context-switching TTBR0 for a live domain
> > > then that code really needs to live inside the SMMU driver because the
> > > ASID and TLB management necessary to do that safely doesn't belong anywhere
> > > else.
> >
> > We do in fact need live domain switching, that is really the whole
> > point.  The GPU CP (command processor/parser) is directly updating
> > TTBR0 and triggering TLB flush, asynchronously from the CPU.
> >
> > And I think the answer about ASID is easy (on current hw).. it must be zero[*].
>
> Using ASID zero is really bad, because it means that you will end up sharing
> TLB entries with whichever device is using context bank 0.
>
> Is the SMMU only used by the GPU in your SoC?
>

yes, the snapdragon SoCs have two SMMU instances, one used by the GPU,
where ASID0/cb0 is the gpu itself, and another cb is the GMU
(basically power control for the gpu), and the second SMMU is
everything else.

BR,
-R
