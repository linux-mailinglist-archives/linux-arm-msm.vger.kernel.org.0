Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34D93B80A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 12:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbhF3KLc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 06:11:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:62142 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234057AbhF3KLb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 06:11:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625047743; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=V2ANtGMjJP031vwtea0cvuT0DcS61OO8FRdPjBQ676g=;
 b=jV5D0Be/3n5euYWYx1y3y8ill2L6GXA3ITFuWfUNW0MSc40TsKhNleMxEXRL4bjfnNaHQV4X
 SGhnmOUsN/PorRvIIL+Hw35d2tw+3B5tgXdhkbqciFElnSFlFQqMnFIp0GMqznlwQXMPc7YM
 TDymtK9a3TzlawWLzbaWrTv/UkI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60dc42803a8b6d0a45791530 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Jun 2021 10:08:00
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0543C43143; Wed, 30 Jun 2021 10:08:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 17A87C433D3;
        Wed, 30 Jun 2021 10:07:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 30 Jun 2021 15:37:59 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Kristian H Kristensen <hoegsberg@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] iommu/io-pgtable-arm: Add IOMMU_LLC page protection
 flag
In-Reply-To: <20210325173311.GA15504@willie-the-truck>
References: <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210129090516.GB3998@willie-the-truck>
 <5d23fce629323bcda71594010824aad0@codeaurora.org>
 <20210201111556.GA7172@willie-the-truck>
 <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
 <20210201182016.GA21629@jcrouse1-lnx.qualcomm.com>
 <7e9aade14d0b7f69285852ade4a5a9f4@codeaurora.org>
 <20210203214612.GB19847@willie-the-truck>
 <4988e2ef35f76a0c2f1fe3f66f023a3b@codeaurora.org>
 <9362873a3bcf37cdd073a6128f29c683@codeaurora.org>
 <20210325173311.GA15504@willie-the-truck>
Message-ID: <21239ba603d0bdc4e4c696588a905f88@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Will,

On 2021-03-25 23:03, Will Deacon wrote:
> On Tue, Mar 09, 2021 at 12:10:44PM +0530, Sai Prakash Ranjan wrote:
>> On 2021-02-05 17:38, Sai Prakash Ranjan wrote:
>> > On 2021-02-04 03:16, Will Deacon wrote:
>> > > On Tue, Feb 02, 2021 at 11:56:27AM +0530, Sai Prakash Ranjan wrote:
>> > > > On 2021-02-01 23:50, Jordan Crouse wrote:
>> > > > > On Mon, Feb 01, 2021 at 08:20:44AM -0800, Rob Clark wrote:
>> > > > > > On Mon, Feb 1, 2021 at 3:16 AM Will Deacon <will@kernel.org> wrote:
>> > > > > > > On Fri, Jan 29, 2021 at 03:12:59PM +0530, Sai Prakash Ranjan wrote:
>> > > > > > > > On 2021-01-29 14:35, Will Deacon wrote:
>> > > > > > > > > On Mon, Jan 11, 2021 at 07:45:04PM +0530, Sai Prakash Ranjan wrote:
>> > > > > > > > > > +#define IOMMU_LLC        (1 << 6)
>> > > > > > > > >
>> > > > > > > > > On reflection, I'm a bit worried about exposing this because I think it
>> > > > > > > > > will
>> > > > > > > > > introduce a mismatched virtual alias with the CPU (we don't even have a
>> > > > > > > > > MAIR
>> > > > > > > > > set up for this memory type). Now, we also have that issue for the PTW,
>> > > > > > > > > but
>> > > > > > > > > since we always use cache maintenance (i.e. the streaming API) for
>> > > > > > > > > publishing the page-tables to a non-coheren walker, it works out.
>> > > > > > > > > However,
>> > > > > > > > > if somebody expects IOMMU_LLC to be coherent with a DMA API coherent
>> > > > > > > > > allocation, then they're potentially in for a nasty surprise due to the
>> > > > > > > > > mismatched outer-cacheability attributes.
>> > > > > > > > >
>> > > > > > > >
>> > > > > > > > Can't we add the syscached memory type similar to what is done on android?
>> > > > > > >
>> > > > > > > Maybe. How does the GPU driver map these things on the CPU side?
>> > > > > >
>> > > > > > Currently we use writecombine mappings for everything, although there
>> > > > > > are some cases that we'd like to use cached (but have not merged
>> > > > > > patches that would give userspace a way to flush/invalidate)
>> > > > > >
>> > > > >
>> > > > > LLC/system cache doesn't have a relationship with the CPU cache.  Its
>> > > > > just a
>> > > > > little accelerator that sits on the connection from the GPU to DDR and
>> > > > > caches
>> > > > > accesses. The hint that Sai is suggesting is used to mark the buffers as
>> > > > > 'no-write-allocate' to prevent GPU write operations from being cached in
>> > > > > the LLC
>> > > > > which a) isn't interesting and b) takes up cache space for read
>> > > > > operations.
>> > > > >
>> > > > > Its easiest to think of the LLC as a bonus accelerator that has no cost
>> > > > > for
>> > > > > us to use outside of the unfortunate per buffer hint.
>> > > > >
>> > > > > We do have to worry about the CPU cache w.r.t I/O coherency (which is a
>> > > > > different hint) and in that case we have all of concerns that Will
>> > > > > identified.
>> > > > >
>> > > >
>> > > > For mismatched outer cacheability attributes which Will
>> > > > mentioned, I was
>> > > > referring to [1] in android kernel.
>> > >
>> > > I've lost track of the conversation here :/
>> > >
>> > > When the GPU has a buffer mapped with IOMMU_LLC, is the buffer also
>> > > mapped
>> > > into the CPU and with what attributes? Rob said "writecombine for
>> > > everything" -- does that mean ioremap_wc() / MEMREMAP_WC?
>> > >
>> >
>> > Rob answered this.
>> >
>> > > Finally, we need to be careful when we use the word "hint" as
>> > > "allocation
>> > > hint" has a specific meaning in the architecture, and if we only
>> > > mismatch on
>> > > those then we're actually ok. But I think IOMMU_LLC is more than
>> > > just a
>> > > hint, since it actually drives eviction policy (i.e. it enables
>> > > writeback).
>> > >
>> > > Sorry for the pedantry, but I just want to make sure we're all talking
>> > > about the same things!
>> > >
>> >
>> > Sorry for the confusion which probably was caused by my mentioning of
>> > android, NWA(no write allocate) is an allocation hint which we can
>> > ignore
>> > for now as it is not introduced yet in upstream.
>> >
>> 
>> Any chance of taking this forward? We do not want to miss out on small 
>> fps
>> gain when the product gets released.
> 
> Do we have a solution to the mismatched virtual alias?
> 

Sorry for the long delay on this thread.

For mismatched virtual alias question, wasn't this already discussed in 
stretch
when initial support for system cache [1] (which was reverted by you) 
was added?

Excerpt from there,

"As seen in downstream kernels there are few non-coherent devices which
would not want to allocate in system cache, and therefore would want
Inner/Outer non-cached memory. So, we may want to either override the
attributes per-device, or as you suggested we may want to introduce
another memory type 'sys-cached' that can be added with its separate
infra."

As for DMA API usage, we do not have any upstream users (video will be
one if they decide to upstream that).

[1] 
https://patchwork.kernel.org/project/linux-arm-msm/patch/20180615105329.26800-1-vivek.gautam@codeaurora.org/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
