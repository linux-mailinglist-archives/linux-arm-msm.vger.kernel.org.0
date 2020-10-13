Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FA928D1E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 18:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731537AbgJMQLj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 12:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731536AbgJMQLj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 12:11:39 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0752EC0613D0;
        Tue, 13 Oct 2020 09:11:39 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s9so12642055wro.8;
        Tue, 13 Oct 2020 09:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UHsDQCy295Hvw56mXeSaZ5ilmXgdKd81n9fHINsRJmg=;
        b=nZ3kr1ZvmphGw+hCXwxd1FBiNBdH15+XmV7uCx/N1aEPWdhltNbxfRJsOrYzCW5DYi
         p28N16Qv3CesL618NYcwzKJl8ExdPBSsAxEVpNuBjc2t7Y3vSDiCUCXqUsTPP3ri+xa3
         pYSiUdCkoFloRscJR5nF2nOA0n77jg0+DyulydlIg2O5dvN37b/KSTRSu0SrWqgYipLY
         Bv2SinElVWGIxKdfjR2keb0VyF7cTpeW4ZZMmz56ud2NUc4LXZYnfMSWKg7cjru34Jnt
         +3aGTZF5ErCoVoAaJUURuRybNuDUZmE1TuG1eiCC2mcWhrl0X3gWCU5HjivWDiRih7lu
         Lf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UHsDQCy295Hvw56mXeSaZ5ilmXgdKd81n9fHINsRJmg=;
        b=PTpbtiXljQi3qRZNjRLRZJWSeFaPG6VvtotqXKrNKdZiBA83yw83C4o+MWf0N3u/SI
         qpYbIFJUbLA4LViBIm2WarlA8Coke1DHWZLijFWdvn3Fk22p5UvqJfYZQX+HtrvGPzcw
         1pOUWQmzpiAD62t5VTPD6AaY2VAT5dpFLEjzaSyGuCcnC6vH0o4Yn6cgXvZqUM0u2wnX
         FfIImvlsjQqNd2+Jt7vG5P/ZtUGKv3jrAib930fJfr/u2Xssf5ErRBfQA2IJ9S5+QEw9
         7AZVbWWnVrWT1lddguPsumJv597Efevxva1ym9PCqTDT+cuJteu1JsJBFKGoLMssHxSc
         Qvcg==
X-Gm-Message-State: AOAM530CkMARURhcZHJVotRPmr0Vo1O7SBv8BrERMGiL7VIlSNH7Sd/i
        2Z3MfXCpctmsXQI6o5JE+2//605iOn9s4AHKh/Q=
X-Google-Smtp-Source: ABdhPJxoD/2hTBypyfQGrCSNRV+Y6GtVMvHZ5uXUCdqyEiDvm0aXKSn04M6vBj6fqcnsx8/6ebXXeOA3cJnZw688USo=
X-Received: by 2002:a5d:4987:: with SMTP id r7mr377398wrq.327.1602605497546;
 Tue, 13 Oct 2020 09:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201001002709.21361-1-jonathan@marek.ca> <20201001002709.21361-3-jonathan@marek.ca>
 <20201002075321.GA7547@infradead.org> <b22fb797-67b0-a912-1d23-2b47c9a9e674@marek.ca>
 <20201005082914.GA31702@infradead.org> <3e0b91be-e4a4-4ea5-7d58-6e71b8d51932@marek.ca>
 <20201006072306.GA12834@infradead.org> <148a1660-f0fc-7163-2240-6b94725342b5@marek.ca>
 <20201007062519.GA23519@infradead.org> <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
In-Reply-To: <c3baadae-8e20-86a6-44f5-4571a8d3035e@arm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 13 Oct 2020 09:11:26 -0700
Message-ID: <CAF6AEGtyczviULunw0tQK0Q9M22vkib19j=R_jTT2EtP5aqRCw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent
 cache maintenance
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Jonathan Marek <jonathan@marek.ca>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 13, 2020 at 6:42 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-10-07 07:25, Christoph Hellwig wrote:
> > On Tue, Oct 06, 2020 at 09:19:32AM -0400, Jonathan Marek wrote:
> >> One example why drm/msm can't use DMA API is multiple page table support
> >> (that is landing in 5.10), which is something that definitely couldn't work
> >> with DMA API.
> >>
> >> Another one is being able to choose the address for mappings, which AFAIK
> >> DMA API can't do (somewhat related to this: qcom hardware often has ranges
> >> of allowed addresses, which the dma_mask mechanism fails to represent, what
> >> I see is drivers using dma_mask as a "maximum address", and since addresses
> >> are allocated from the top it generally works)
> >
> > That sounds like a good enough rason to use the IOMMU API.  I just
> > wanted to make sure this really makes sense.
>
> I still think this situation would be best handled with a variant of
> dma_ops_bypass that also guarantees to bypass SWIOTLB, and can be set
> automatically when attaching to an unmanaged IOMMU domain. That way the
> device driver can make DMA API calls in the appropriate places that do
> the right thing either way, and only needs logic to decide whether to
> use the returned DMA addresses directly or ignore them if it knows
> they're overridden by its own IOMMU mapping.
>

That would be pretty ideal from my PoV

BR,
-R
