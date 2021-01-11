Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A1A2F0C02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 05:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbhAKE5n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jan 2021 23:57:43 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:59510 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbhAKE5m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jan 2021 23:57:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610341038; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jYkO7dbOgBg1/0RRjemneHKpWx/1hw2rJ9cPf6v85BA=;
 b=IEniBcLij9mDuA5Sj+NHUPIOy8Dc42xeEaSYqgKui+XNCbEAyqYL9ZuH8tE4fkXOMOE1iiTH
 tfSa+lbtmvUBwWYsL37fDTbHk38XHF5qt/YmRCU6L5YsLO0ZZJtHSjFsU13SdzlMjSTMt5YC
 b1iXbYeDncdlkRET5/gnim1phs8=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5ffbda834104d9478dd68d4a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 04:56:35
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9EA69C433CA; Mon, 11 Jan 2021 04:56:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A2DEC433C6;
        Mon, 11 Jan 2021 04:56:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 11 Jan 2021 10:26:32 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     isaacm@codeaurora.org, Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu/io-pgtable-arm: Allow non-coherent masters to use
 system cache
In-Reply-To: <20210108181830.GA5457@willie-the-truck>
References: <20201224064007.2339-1-saiprakash.ranjan@codeaurora.org>
 <20210106115615.GA1763@willie-the-truck>
 <cfced52002337025088a64aa159760b2@codeaurora.org>
 <8cfefbff135a5287d177b6ab2ccc3304@codeaurora.org>
 <20210108181830.GA5457@willie-the-truck>
Message-ID: <3a776219db9f1256133920d52f864792@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-08 23:48, Will Deacon wrote:
> On Fri, Jan 08, 2021 at 11:17:25AM +0530, Sai Prakash Ranjan wrote:
>> On 2021-01-07 22:27, isaacm@codeaurora.org wrote:
>> > On 2021-01-06 03:56, Will Deacon wrote:
>> > > On Thu, Dec 24, 2020 at 12:10:07PM +0530, Sai Prakash Ranjan wrote:
>> > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY
>> > > > flag")
>> > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
>> > > > the memory type setting required for the non-coherent masters to use
>> > > > system cache. Now that system cache support for GPU is added, we will
>> > > > need to mark the memory as normal sys-cached for GPU to use
>> > > > system cache.
>> > > > Without this, the system cache lines are not allocated for GPU.
>> > > > We use
>> > > > the IO_PGTABLE_QUIRK_ARM_OUTER_WBWA quirk instead of a page
>> > > > protection
>> > > > flag as the flag cannot be exposed via DMA api because of no in-tree
>> > > > users.
>> > > >
>> > > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> > > > ---
>> > > >  drivers/iommu/io-pgtable-arm.c | 3 +++
>> > > >  1 file changed, 3 insertions(+)
>> > > >
>> > > > diff --git a/drivers/iommu/io-pgtable-arm.c
>> > > > b/drivers/iommu/io-pgtable-arm.c
>> > > > index 7c9ea9d7874a..3fb7de8304a2 100644
>> > > > --- a/drivers/iommu/io-pgtable-arm.c
>> > > > +++ b/drivers/iommu/io-pgtable-arm.c
>> > > > @@ -415,6 +415,9 @@ static arm_lpae_iopte
>> > > > arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
>> > > >  		else if (prot & IOMMU_CACHE)
>> > > >  			pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
>> > > >  				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
>> > > > +		else if (data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA)
>> > > > +			pte |= (ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE
>> > > > +				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
>> > > >  	}
>> > >
>> > While this approach of enabling system cache globally for both page
>> > tables and other buffers
>> > works for the GPU usecase, this isn't ideal for other clients that use
>> > system cache. For example,
>> > video clients only want to cache a subset of their buffers in the
>> > system cache, due to the sizing constraint
>> > imposed by how much of the system cache they can use. So, it would be
>> > ideal to have
>> > a way of expressing the desire to use the system cache on a per-buffer
>> > basis. Additionally,
>> > our video clients use the DMA layer, and since the requirement is for
>> > caching in the system cache
>> > to be a per buffer attribute, it seems like we would have to have a
>> > DMA attribute to express
>> > this on a per-buffer basis.
>> >
>> 
>> I did bring this up initially [1], also where is this video client
>> in upstream? AFAIK, only system cache user in upstream is GPU.
>> We cannot add any DMA attribute unless there is any user upstream
>> as per [2], so when the support for such a client is added, wouldn't
>> ((data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA) || 
>> PROT_FLAG)
>> work?
> 
> Hmm, I think this is another case where we need to separate out the
> page-table walker attributes from the access attributes. Currently,
> IO_PGTABLE_QUIRK_ARM_OUTER_WBWA applies _only_ to the page-table walker
> and I don't think it makes any sense for that to be per-buffer (how 
> would
> you even manage that?). However, if we want to extend this to data 
> accesses
> and we know that there are valid use-cases where this should be 
> per-buffer,
> then shoe-horning it in with the walker quirk does not feel like the 
> best
> thing to do.
> 
> As a starting point, we could:
> 
>   1. Rename IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
>   2. Add a new prot flag IOMMU_LLC
>   3. Have the GPU pass the new prot for its buffer mappings
> 

This looks good to me, I will work on this and post something soon.

> Does that work? One thing I'm not sure about is whether IOMMU_CACHE 
> should
> imply IOMMU_LLC, or whether there is a use-case for inner-cacheable, 
> outer
> non-cacheable mappings for a coherent device. Have you ever seen that 
> sort
> of thing before?
> 

I don't think there is such a usecase as Isaac mentioned.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
