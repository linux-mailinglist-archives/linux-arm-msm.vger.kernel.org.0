Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543DF30B7DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 07:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbhBBGaD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 01:30:03 -0500
Received: from so15.mailgun.net ([198.61.254.15]:23678 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231888AbhBBG1Z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 01:27:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612247223; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=z7Jt7mLpbCjEtcnUQ9bOehTzH3Sk9XSsW7oxWAsa7AE=;
 b=PboIxQtQktUxXbEm9iTYGKUULo1d3VMOQfAq6MI9ytIaERFLBqw/vHsSfWY5e51bRDYDnpFy
 qc6e5eRcuY+j6x4JbQ2pK8YTU9zTzG87zBOUhAduoDy8gZkb1tpdHu33vTdOUixoVFAbCyPP
 ejQ0bNBZIt8Ezc/sxdAqCLunFJ4=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6018f095bfd95207233c72fa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Feb 2021 06:26:29
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2F52EC43469; Tue,  2 Feb 2021 06:26:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9D118C433C6;
        Tue,  2 Feb 2021 06:26:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 02 Feb 2021 11:56:27 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Kristian H Kristensen <hoegsberg@google.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] iommu/io-pgtable-arm: Add IOMMU_LLC page protection
 flag
In-Reply-To: <20210201182016.GA21629@jcrouse1-lnx.qualcomm.com>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210129090516.GB3998@willie-the-truck>
 <5d23fce629323bcda71594010824aad0@codeaurora.org>
 <20210201111556.GA7172@willie-the-truck>
 <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
 <20210201182016.GA21629@jcrouse1-lnx.qualcomm.com>
Message-ID: <7e9aade14d0b7f69285852ade4a5a9f4@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-01 23:50, Jordan Crouse wrote:
> On Mon, Feb 01, 2021 at 08:20:44AM -0800, Rob Clark wrote:
>> On Mon, Feb 1, 2021 at 3:16 AM Will Deacon <will@kernel.org> wrote:
>> >
>> > On Fri, Jan 29, 2021 at 03:12:59PM +0530, Sai Prakash Ranjan wrote:
>> > > On 2021-01-29 14:35, Will Deacon wrote:
>> > > > On Mon, Jan 11, 2021 at 07:45:04PM +0530, Sai Prakash Ranjan wrote:
>> > > > > Add a new page protection flag IOMMU_LLC which can be used
>> > > > > by non-coherent masters to set cacheable memory attributes
>> > > > > for an outer level of cache called as last-level cache or
>> > > > > system cache. Initial user of this page protection flag is
>> > > > > the adreno gpu and then can later be used by other clients
>> > > > > such as video where this can be used for per-buffer based
>> > > > > mapping.
>> > > > >
>> > > > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> > > > > ---
>> > > > >  drivers/iommu/io-pgtable-arm.c | 3 +++
>> > > > >  include/linux/iommu.h          | 6 ++++++
>> > > > >  2 files changed, 9 insertions(+)
>> > > > >
>> > > > > diff --git a/drivers/iommu/io-pgtable-arm.c
>> > > > > b/drivers/iommu/io-pgtable-arm.c
>> > > > > index 7439ee7fdcdb..ebe653ef601b 100644
>> > > > > --- a/drivers/iommu/io-pgtable-arm.c
>> > > > > +++ b/drivers/iommu/io-pgtable-arm.c
>> > > > > @@ -415,6 +415,9 @@ static arm_lpae_iopte
>> > > > > arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
>> > > > >           else if (prot & IOMMU_CACHE)
>> > > > >                   pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
>> > > > >                           << ARM_LPAE_PTE_ATTRINDX_SHIFT);
>> > > > > +         else if (prot & IOMMU_LLC)
>> > > > > +                 pte |= (ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE
>> > > > > +                         << ARM_LPAE_PTE_ATTRINDX_SHIFT);
>> > > > >   }
>> > > > >
>> > > > >   if (prot & IOMMU_CACHE)
>> > > > > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
>> > > > > index ffaa389ea128..1f82057df531 100644
>> > > > > --- a/include/linux/iommu.h
>> > > > > +++ b/include/linux/iommu.h
>> > > > > @@ -31,6 +31,12 @@
>> > > > >   * if the IOMMU page table format is equivalent.
>> > > > >   */
>> > > > >  #define IOMMU_PRIV       (1 << 5)
>> > > > > +/*
>> > > > > + * Non-coherent masters can use this page protection flag to set
>> > > > > cacheable
>> > > > > + * memory attributes for only a transparent outer level of cache,
>> > > > > also known as
>> > > > > + * the last-level or system cache.
>> > > > > + */
>> > > > > +#define IOMMU_LLC        (1 << 6)
>> > > >
>> > > > On reflection, I'm a bit worried about exposing this because I think it
>> > > > will
>> > > > introduce a mismatched virtual alias with the CPU (we don't even have a
>> > > > MAIR
>> > > > set up for this memory type). Now, we also have that issue for the PTW,
>> > > > but
>> > > > since we always use cache maintenance (i.e. the streaming API) for
>> > > > publishing the page-tables to a non-coheren walker, it works out.
>> > > > However,
>> > > > if somebody expects IOMMU_LLC to be coherent with a DMA API coherent
>> > > > allocation, then they're potentially in for a nasty surprise due to the
>> > > > mismatched outer-cacheability attributes.
>> > > >
>> > >
>> > > Can't we add the syscached memory type similar to what is done on android?
>> >
>> > Maybe. How does the GPU driver map these things on the CPU side?
>> 
>> Currently we use writecombine mappings for everything, although there
>> are some cases that we'd like to use cached (but have not merged
>> patches that would give userspace a way to flush/invalidate)
>> 
>> BR,
>> -R
> 
> LLC/system cache doesn't have a relationship with the CPU cache.  Its 
> just a
> little accelerator that sits on the connection from the GPU to DDR and 
> caches
> accesses. The hint that Sai is suggesting is used to mark the buffers 
> as
> 'no-write-allocate' to prevent GPU write operations from being cached 
> in the LLC
> which a) isn't interesting and b) takes up cache space for read 
> operations.
> 
> Its easiest to think of the LLC as a bonus accelerator that has no cost 
> for
> us to use outside of the unfortunate per buffer hint.
> 
> We do have to worry about the CPU cache w.r.t I/O coherency (which is a
> different hint) and in that case we have all of concerns that Will 
> identified.
> 

For mismatched outer cacheability attributes which Will mentioned, I was
referring to [1] in android kernel.

[1] https://android-review.googlesource.com/c/kernel/common/+/1549097/3

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
