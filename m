Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3AEA3E4C2A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 20:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235306AbhHIScg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 14:32:36 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16620 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234842AbhHIScf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 14:32:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628533935; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xvcEyIGXHTqZ1xazZfSti4k6O3/u3ew/E9geWOczsP0=;
 b=EWEj94hsMLw65jH0lbjc3ttF974388V8lCvRsMU8C5CEzaW5oxBN4J6gzDcWKjvSvkN9pqT2
 NCTneNisJVyFs26m7wOb9TNm+A8aeQG8ABJQ06uRacGcaVN6oTErlXftfIozcjYMw2wTXSjE
 /bpp4ug0v5yK18/+oXoTXknQuC0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 611174ad454b7a558f0ff97f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Aug 2021 18:32:13
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 20405C4338A; Mon,  9 Aug 2021 18:32:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 315C3C433F1;
        Mon,  9 Aug 2021 18:32:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 10 Aug 2021 00:02:10 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        David Airlie <airlied@linux.ie>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Kristian H Kristensen <hoegsberg@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Subject: Re: [Freedreno] [PATCH 0/3] iommu/drm/msm: Allow non-coherent masters
 to use system cache
In-Reply-To: <CAF6AEGut0LFFLmR7WV66HkDee4dg5xusTmFC23zsUGqjZuoNpw@mail.gmail.com>
References: <20210728140052.GB22887@mms-0441>
 <8b2742c8891abe4fec3664730717a089@codeaurora.org>
 <20210802105544.GA27657@willie-the-truck>
 <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
 <20210802151409.GE28735@willie-the-truck>
 <CAF6AEGtzvyEUm0Fc8QT5t9KNK7i0FbFyi7zDM2_PMCzZBp7qbw@mail.gmail.com>
 <20210809145651.GC1458@willie-the-truck>
 <CAF6AEGsSUojA=V0n2iRWTCn++buqN=Eoxo0r3=+=PBu1O=H-AQ@mail.gmail.com>
 <20210809170508.GB1589@willie-the-truck>
 <CAF6AEGtmZ3LzAJdtnKDQDbEN-a6_JgdN-fZ96pkU3dZqkiW91g@mail.gmail.com>
 <20210809174022.GA1840@willie-the-truck>
 <76bfd0b4248148dfbf9d174ddcb4c2a2@codeaurora.org>
 <CAF6AEGtiVgHc7rcfzOpBmtVGQBvGPCBmtKJ3AJx887NSMj0EzQ@mail.gmail.com>
 <8e5edd6886a0c3a5f6c8cb4dff517224@codeaurora.org>
 <CAF6AEGut0LFFLmR7WV66HkDee4dg5xusTmFC23zsUGqjZuoNpw@mail.gmail.com>
Message-ID: <2ba8abbd5611d5a59d1c71eaacdb1f00@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-10 00:00, Rob Clark wrote:
> On Mon, Aug 9, 2021 at 11:11 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> On 2021-08-09 23:37, Rob Clark wrote:
>> > On Mon, Aug 9, 2021 at 10:47 AM Sai Prakash Ranjan
>> > <saiprakash.ranjan@codeaurora.org> wrote:
>> >>
>> >> On 2021-08-09 23:10, Will Deacon wrote:
>> >> > On Mon, Aug 09, 2021 at 10:18:21AM -0700, Rob Clark wrote:
>> >> >> On Mon, Aug 9, 2021 at 10:05 AM Will Deacon <will@kernel.org> wrote:
>> >> >> >
>> >> >> > On Mon, Aug 09, 2021 at 09:57:08AM -0700, Rob Clark wrote:
>> >> >> > > On Mon, Aug 9, 2021 at 7:56 AM Will Deacon <will@kernel.org> wrote:
>> >> >> > > > On Mon, Aug 02, 2021 at 06:36:04PM -0700, Rob Clark wrote:
>> >> >> > > > > On Mon, Aug 2, 2021 at 8:14 AM Will Deacon <will@kernel.org> wrote:
>> >> >> > > > > > On Mon, Aug 02, 2021 at 08:08:07AM -0700, Rob Clark wrote:
>> >> >> > > > > > > On Mon, Aug 2, 2021 at 3:55 AM Will Deacon <will@kernel.org> wrote:
>> >> >> > > > > > > > On Thu, Jul 29, 2021 at 10:08:22AM +0530, Sai Prakash Ranjan wrote:
>> >> >> > > > > > > > > On 2021-07-28 19:30, Georgi Djakov wrote:
>> >> >> > > > > > > > > > On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
>> >> >> > > > > > > > > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
>> >> >> > > > > > > > > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
>> >> >> > > > > > > > > > > the memory type setting required for the non-coherent masters to use
>> >> >> > > > > > > > > > > system cache. Now that system cache support for GPU is added, we will
>> >> >> > > > > > > > > > > need to set the right PTE attribute for GPU buffers to be sys cached.
>> >> >> > > > > > > > > > > Without this, the system cache lines are not allocated for GPU.
>> >> >> > > > > > > > > > >
>> >> >> > > > > > > > > > > So the patches in this series introduces a new prot flag IOMMU_LLC,
>> >> >> > > > > > > > > > > renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
>> >> >> > > > > > > > > > > and makes GPU the user of this protection flag.
>> >> >> > > > > > > > > >
>> >> >> > > > > > > > > > Thank you for the patchset! Are you planning to refresh it, as it does
>> >> >> > > > > > > > > > not apply anymore?
>> >> >> > > > > > > > > >
>> >> >> > > > > > > > >
>> >> >> > > > > > > > > I was waiting on Will's reply [1]. If there are no changes needed, then
>> >> >> > > > > > > > > I can repost the patch.
>> >> >> > > > > > > >
>> >> >> > > > > > > > I still think you need to handle the mismatched alias, no? You're adding
>> >> >> > > > > > > > a new memory type to the SMMU which doesn't exist on the CPU side. That
>> >> >> > > > > > > > can't be right.
>> >> >> > > > > > > >
>> >> >> > > > > > >
>> >> >> > > > > > > Just curious, and maybe this is a dumb question, but what is your
>> >> >> > > > > > > concern about mismatched aliases?  I mean the cache hierarchy on the
>> >> >> > > > > > > GPU device side (anything beyond the LLC) is pretty different and
>> >> >> > > > > > > doesn't really care about the smmu pgtable attributes..
>> >> >> > > > > >
>> >> >> > > > > > If the CPU accesses a shared buffer with different attributes to those which
>> >> >> > > > > > the device is using then you fall into the "mismatched memory attributes"
>> >> >> > > > > > part of the Arm architecture. It's reasonably unforgiving (you should go and
>> >> >> > > > > > read it) and in some cases can apply to speculative accesses as well, but
>> >> >> > > > > > the end result is typically loss of coherency.
>> >> >> > > > >
>> >> >> > > > > Ok, I might have a few other sections to read first to decipher the
>> >> >> > > > > terminology..
>> >> >> > > > >
>> >> >> > > > > But my understanding of LLC is that it looks just like system memory
>> >> >> > > > > to the CPU and GPU (I think that would make it "the point of
>> >> >> > > > > coherence" between the GPU and CPU?)  If that is true, shouldn't it be
>> >> >> > > > > invisible from the point of view of different CPU mapping options?
>> >> >> > > >
>> >> >> > > > You could certainly build a system where mismatched attributes don't cause
>> >> >> > > > loss of coherence, but as it's not guaranteed by the architecture and the
>> >> >> > > > changes proposed here affect APIs which are exposed across SoCs, then I
>> >> >> > > > don't think it helps much.
>> >> >> > > >
>> >> >> > >
>> >> >> > > Hmm, the description of the new mapping flag is that it applies only
>> >> >> > > to transparent outer level cache:
>> >> >> > >
>> >> >> > > +/*
>> >> >> > > + * Non-coherent masters can use this page protection flag to set cacheable
>> >> >> > > + * memory attributes for only a transparent outer level of cache, also known as
>> >> >> > > + * the last-level or system cache.
>> >> >> > > + */
>> >> >> > > +#define IOMMU_LLC      (1 << 6)
>> >> >> > >
>> >> >> > > But I suppose we could call it instead IOMMU_QCOM_LLC or something
>> >> >> > > like that to make it more clear that it is not necessarily something
>> >> >> > > that would work with a different outer level cache implementation?
>> >> >> >
>> >> >> > ... or we could just deal with the problem so that other people can reuse
>> >> >> > the code. I haven't really understood the reluctance to solve this properly.
>> >> >> >
>> >> >> > Am I missing some reason this isn't solvable?
>> >> >>
>> >> >> Oh, was there another way to solve it (other than foregoing setting
>> >> >> INC_OCACHE in the pgtables)?  Maybe I misunderstood, is there a
>> >> >> corresponding setting on the MMU pgtables side of things?
>> >> >
>> >> > Right -- we just need to program the CPU's MMU with the matching memory
>> >> > attributes! It's a bit more fiddly if you're just using ioremap_wc()
>> >> > though, as it's usually the DMA API which handles the attributes under
>> >> > the
>> >> > hood.
>> >> >
>> >> > Anyway, sorry, I should've said that explicitly earlier on. We've done
>> >> > this
>> >> > sort of thing in the Android tree so I assumed Sai knew what needed to
>> >> > be
>> >> > done and then I didn't think to explain to you :(
>> >> >
>> >>
>> >> Right I was aware of that but even in the android tree there is no
>> >> user
>> >> :)
>> >> I think we can't have a new memory type without any user right in
>> >> upstream
>> >> like android tree?
>> >>
>> >> @Rob, I think you  already tried adding a new MT and used
>> >> pgprot_syscached()
>> >> in GPU driver but it was crashing?
>> >
>> > Correct, but IIRC there were some differences in the code for memory
>> > types compared to the android tree.. I couldn't figure out the
>> > necessary patches to cherry-pick to get the android patch to apply
>> > cleanly, so I tried re-implementing it without having much of a clue
>> > about how that code works (which was probably the issue) ;-)
>> >
>> 
>> Hehe no, even I get the same crash after porting/modifying the 
>> required
>> patches from android ;) and I think crashes would be seen in android 
>> as
>> well, its just that they don't have any user exercising that code.
>> 
>> Thing is I can't make head and tail of the GPU crash logs, maybe you
>> know
>> how to decode those errors, if not I can start a thread with QC GPU 
>> team
>> and ask them to decode?
>> 
> 
> If you have a gpu devcore dump, I can take a look at it with
> crashdec.. otherwise I can try to find the branch where I had that
> patch backported.
> 
> I'm more familiar with using crashdec to figure out mesa bugs, but
> maybe I could spot something where what the GPU is seeing disagrees
> with what the CPU expects it to be seeing.
> 

Sure, I will get a devcoredump tomorrow and attach in the bug, currently
I don't have it handy.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
