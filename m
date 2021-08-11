Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1E73E8A0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 08:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234612AbhHKGKd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 02:10:33 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:51222 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234501AbhHKGKd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 02:10:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628662210; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=6w8DE7PV8bfZUOdc7XTyHPzls7aBAT4UaE5qpmAy/X8=; b=fvFP6muKEpNdBrCrjfjhY814VdEdaP9H6ZDIF2sP9Gd8MlwEA2WbI81gyweEfuxAJXAbCEHm
 6Jk2g4MGry4EJZNbszzC1gxAAK7BbswcCXMdhD2BbHBdma7dsz26SRfQjXoPasPZBgUyqmF3
 jbJjbAQu9ZT8QgGrE/2jqlxvNOM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 611369b3b14e7e2ecb5facf5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 06:09:55
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3E393C43144; Wed, 11 Aug 2021 06:09:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 53C17C433D3;
        Wed, 11 Aug 2021 06:09:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Aug 2021 11:39:54 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCHv3] iommu/arm-smmu: Optimize ->tlb_flush_walk() for qcom
 implementation
Message-ID: <6f013c7eb690d40091f7c503ef640711@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-10 23:38, Will Deacon wrote:
> On Tue, Aug 03, 2021 at 11:09:17AM +0530, Sai Prakash Ranjan wrote:
>> On 2021-08-02 21:13, Will Deacon wrote:
>> > On Wed, Jun 23, 2021 at 07:12:01PM +0530, Sai Prakash Ranjan wrote:
>> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> > > b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> > > index d3c6f54110a5..f3845e822565 100644
>> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> > > @@ -341,6 +341,12 @@ static void arm_smmu_tlb_add_page_s1(struct
>> > > iommu_iotlb_gather *gather,
>> > >  				  ARM_SMMU_CB_S1_TLBIVAL);
>> > >  }
>> > >
>> > > +static void arm_smmu_tlb_inv_walk_impl_s1(unsigned long iova,
>> > > size_t size,
>> > > +				     size_t granule, void *cookie)
>> > > +{
>> > > +	arm_smmu_tlb_inv_context_s1(cookie);
>> > > +}
>> > > +
>> > >  static void arm_smmu_tlb_inv_walk_s2(unsigned long iova, size_t size,
>> > >  				     size_t granule, void *cookie)
>> > >  {
>> > > @@ -388,6 +394,12 @@ static const struct iommu_flush_ops
>> > > arm_smmu_s1_tlb_ops = {
>> > >  	.tlb_add_page	= arm_smmu_tlb_add_page_s1,
>> > >  };
>> > >
>> > > +const struct iommu_flush_ops arm_smmu_s1_tlb_impl_ops = {
>> > > +	.tlb_flush_all	= arm_smmu_tlb_inv_context_s1,
>> > > +	.tlb_flush_walk	= arm_smmu_tlb_inv_walk_impl_s1,
>> > > +	.tlb_add_page	= arm_smmu_tlb_add_page_s1,
>> > > +};
>> >
>> > Hmm, dunno about this. Wouldn't it be a lot cleaner if the
>> > tlb_flush_walk
>> > callbacks just did the right thing based on the smmu_domain (maybe in
>> > the
>> > arm_smmu_cfg?) rather than having an entirely new set of ops just
>> > because
>> > they're const and you can't overide the bit you want?
>> >
>> > I don't think there's really an awful lot qcom-specific about the
>> > principle
>> > here -- there's a trade-off between over-invalidation and invalidation
>> > latency. That happens on the CPU as well.
>> >
>> 
>> Sorry didn't understand, based on smmu_domain what? How do we make
>> this implementation specific? Do you mean something like a quirk?
>> The reason we didn't make this common was because nvidia folks weren't
>> so happy with that, you can find the discussion in this thread [1].
>> 
>> [1] 
>> https://lore.kernel.org/lkml/20210609145315.25750-1-saiprakash.ranjan@codeaurora.org/
> 
> The ->tlb_flush_walk() callbacks take a 'void *cookie' which, for this
> driver, is a 'struct arm_smmu_domain *'. From that, you can get to the
> 'struct arm_smmu_cfg' which could have something as coarse as:
> 
> 	bool	flush_walk_prefer_tlbiasid;
> 
> which you can set when you initialise the domain (maybe in the
> ->init_context callback?). It shouldn't affect anybody else.
> 

Ah ok, you meant a new flag in arm_smmu_cfg, right getting it from 
cookie
is no big deal but nonetheless thanks for detailing it. I have made the
changes and sent a v4 after testing.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
