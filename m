Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E0F267D71
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Sep 2020 05:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgIMD0G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Sep 2020 23:26:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbgIMD0E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Sep 2020 23:26:04 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D804C061573
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2020 20:26:03 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id c13so13882737oiy.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2020 20:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ke7lMIRXust3VuSv0nKgJkbwsX5Y5U3wXBvizA4PXrY=;
        b=yyrNCTgAFp3sCepk225S6NTSjOCGVhzw4iRmePIaTzvjnZwKHF3PuOcLpxPadQ3vvq
         OkgdzrIYnZ4nWcncJEqM+FHOgG094D0K/+BioANbWip4mn832eoNK+dWcSxVvlYu2JYQ
         ZBoR0LJ5Lc+YxYqe8zvagnENnOCCUX+VMuZ3EJ/Wv0nOellILxqC31ZzAxjdYWLYyuxY
         FJY1jRg0jdevnILWK2NMHL1mgpgBv5HhDm1IJVSqYdh8oZlnDefvYn1k9H/ZY4rmCLvR
         7kvI70mV4GYFUNiKigTpeSQCuhslkDyJfMhaJt0gQS/lx8H2tZDbm5I6KJbn9wj11oxS
         8CWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ke7lMIRXust3VuSv0nKgJkbwsX5Y5U3wXBvizA4PXrY=;
        b=klHvGkuhaXKtzzW5VZp851gPRSV+QrqSW0LdHs0ghhim6cqJs+/8NnC+TvCi6puFBg
         enw1fiIY2Ew9EOi2nwK+T6/FxwtyUNxeSs4vCbScMZ+gtKcuW8+DDTD71+o0QboXDjd1
         LNaS5E0rUvDuRb8TinvugygZTchCEBWgSWIRywHJbwFf9aGlApZDXkJkMKpTQr3wyfE+
         yoRocYTuCXz4BTiJc3/ImGcAyByrglmC2g1tJIeg7rI2dg++u8XwHgANWUfJqwu5r7s1
         +THlULWhaw7wlyRDNgCeiwOFv2I5A9S9xKt6YO/uXeIFT2sg3RUKSjF/Sqqw2lB9ExQU
         QNkA==
X-Gm-Message-State: AOAM531iLTpoWe6cYkaKZt/g7eA5czOnL5LDuw3vSo9x7SEkK5jkGmlR
        AHWJMH3ApA0n6bHTcl04kMqJ/A==
X-Google-Smtp-Source: ABdhPJxuAIm2+/oMuWoP3Xg/emHDDPJVX7MIdtBknMrXrH/r4UieHbwSGIT61sNebSjEFvwanaMmUg==
X-Received: by 2002:aca:1006:: with SMTP id 6mr5092573oiq.2.1599967562993;
        Sat, 12 Sep 2020 20:26:02 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id 9sm1207669ois.10.2020.09.12.20.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 20:26:02 -0700 (PDT)
Date:   Sat, 12 Sep 2020 22:25:59 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/8] iommu/arm-smmu: Add impl hook for inherit boot
 mappings
Message-ID: <20200913032559.GT3715@yoga>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-7-bjorn.andersson@linaro.org>
 <0bfcc8f7-d054-616b-834b-319461b1ecb9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bfcc8f7-d054-616b-834b-319461b1ecb9@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 11 Sep 12:13 CDT 2020, Robin Murphy wrote:

> On 2020-09-04 16:55, Bjorn Andersson wrote:
> > Add a new operation to allow platform implementations to inherit any
> > stream mappings from the boot loader.
> 
> Is there a reason we need an explicit step for this? The aim of the
> cfg_probe hook is that the SMMU software state should all be set up by then,
> and you can mess about with it however you like before arm_smmu_reset()
> actually commits anything to hardware. I would have thought you could
> permanently steal a context bank, configure it as your bypass hole, read out
> the previous SME configuration and tweak smmu->smrs and smmu->s2crs
> appropriately all together "invisibly" at that point.

I did this because as of 6a79a5a3842b ("iommu/arm-smmu: Call
configuration impl hook before consuming features") we no longer have
setup pgsize_bitmap as we hit cfg_probe, which means that I need to
replicate this logic to set up the iommu_domain.

If I avoid setting up an iommu_domain for the identity context, as you
request in patch 8, this shouldn't be needed anymore.

> If that can't work, I'm very curious as to what I've overlooked.
> 

I believe that will work, I will rework the patches and try it out.

Thanks,
Bjorn

> Robin.
> 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v2:
> > - New patch/interface
> > 
> >   drivers/iommu/arm/arm-smmu/arm-smmu.c | 11 ++++++-----
> >   drivers/iommu/arm/arm-smmu/arm-smmu.h |  6 ++++++
> >   2 files changed, 12 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > index eb5c6ca5c138..4c4d302cd747 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -85,11 +85,6 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> >   		pm_runtime_put_autosuspend(smmu->dev);
> >   }
> > -static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
> > -{
> > -	return container_of(dom, struct arm_smmu_domain, domain);
> > -}
> > -
> >   static struct platform_driver arm_smmu_driver;
> >   static struct iommu_ops arm_smmu_ops;
> > @@ -2188,6 +2183,12 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
> >   	if (err)
> >   		return err;
> > +	if (smmu->impl->inherit_mappings) {
> > +		err = smmu->impl->inherit_mappings(smmu);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> >   	if (smmu->version == ARM_SMMU_V2) {
> >   		if (smmu->num_context_banks > smmu->num_context_irqs) {
> >   			dev_err(dev,
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > index 235d9a3a6ab6..f58164976e74 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -378,6 +378,11 @@ struct arm_smmu_domain {
> >   	struct iommu_domain		domain;
> >   };
> > +static inline struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
> > +{
> > +	return container_of(dom, struct arm_smmu_domain, domain);
> > +}
> > +
> >   struct arm_smmu_master_cfg {
> >   	struct arm_smmu_device		*smmu;
> >   	s16				smendx[];
> > @@ -442,6 +447,7 @@ struct arm_smmu_impl {
> >   	int (*alloc_context_bank)(struct arm_smmu_domain *smmu_domain,
> >   				  struct arm_smmu_device *smmu,
> >   				  struct device *dev, int start);
> > +	int (*inherit_mappings)(struct arm_smmu_device *smmu);
> >   };
> >   #define INVALID_SMENDX			-1
> > 
