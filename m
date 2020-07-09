Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC11021A844
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 21:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbgGIT7n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 15:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgGIT7n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 15:59:43 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3167EC08C5DD
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 12:59:43 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x11so1254574plo.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 12:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AjdSZHMC9Aa00TM3sQNXFBLg2D2XfJpFuPbq67cqMUA=;
        b=M+ZVAQaQpRpPNNFiKDC8rhFR/DJW0N1PXeJXLFHlCeZMczjEL/CoIjnDLn/OpNBg9D
         qPF81bClhRgkxKWSHKlcbmS4ExPv3K779BsforUk0J69a0FjzDHKs6NdBGh9WaDa7tY/
         SQxwKNRo2wMA2XUITZIWDkxBdaxywE+bqqSoihuMM+XNuXAuH8rayl1kLuBb51zUkrc8
         3NhUSp2ka434t0mwva84LOw95/966DycuggqcxtZLYVEMHRIAjlO5Pu6zQt7Xnt6DdRu
         hptLRnRk/V5+BerUJpATB3djRVbSwDR+AVh7X5kDQdhQX1sdKgVoEqiDADVFxIYJUev0
         fhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AjdSZHMC9Aa00TM3sQNXFBLg2D2XfJpFuPbq67cqMUA=;
        b=Gd4jMIbMkrRk7FQ+A2JxNVr+KJqGJU324sWT1FIgGT+S7T+FbKyGSPdYRyTIXONUYj
         ZSJRHUxt9hPYZRruCixSJVBkVKOOo+27J4K2t2+9rRfcKLJkqTf9ciq1I5sebcXWW9Jl
         LFgFosxAttOkydrZ0YlVjcXE1MUIXXOP/bJ2Q7geUoRbLhpuw3gx7pORUpsY+JVN0Fyq
         BnsQWkd828E0bhnWlewzIDD8XNxn4TngLuk0kzeiMW3TNWFpVmOHcNT5lDJPICw0jGpm
         fLzWHZ3UqycngNLlLDsgWgzKrahCglgbcGm2bmFVfthw1daC39p0KQEMh4wSZm8f0k7S
         DScg==
X-Gm-Message-State: AOAM533IcXJ5sBeNdo50jK7Y2/8ErAECfBIrPJ5GBRt89SXURYR576uu
        ARdQwYiIA9e9tWTsIGSp05wHDg==
X-Google-Smtp-Source: ABdhPJxg3OSOq2mVQYV3Pd4pZKXsoR8TebYLjp4G4815IdV1r1spyaxUohoaupTianXe8uemKyH49w==
X-Received: by 2002:a17:902:eb52:: with SMTP id i18mr16953769pli.298.1594324782359;
        Thu, 09 Jul 2020 12:59:42 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w20sm3553376pfn.44.2020.07.09.12.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 12:59:41 -0700 (PDT)
Date:   Thu, 9 Jul 2020 12:57:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] iommu/arm-smmu: Setup identity domain for boot
 mappings
Message-ID: <20200709195727.GY388985@builder.lan>
References: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
 <20200709050145.3520931-6-bjorn.andersson@linaro.org>
 <e68033a8-fc00-e7d9-e95c-1014498ade4f@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e68033a8-fc00-e7d9-e95c-1014498ade4f@nxp.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 09 Jul 08:50 PDT 2020, Laurentiu Tudor wrote:

> 
> 
> On 7/9/2020 8:01 AM, Bjorn Andersson wrote:
> > With many Qualcomm platforms not having functional S2CR BYPASS a
> > temporary IOMMU domain, without translation, needs to be allocated in
> > order to allow these memory transactions.
> > 
> > Unfortunately the boot loader uses the first few context banks, so
> > rather than overwriting a active bank the last context bank is used and
> > streams are diverted here during initialization.
> > 
> > This also performs the readback of SMR registers for the Qualcomm
> > platform, to trigger the mechanism.
> > 
> > This is based on prior work by Thierry Reding and Laurentiu Tudor.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/iommu/arm-smmu-qcom.c | 11 +++++
> >  drivers/iommu/arm-smmu.c      | 80 +++++++++++++++++++++++++++++++++--
> >  drivers/iommu/arm-smmu.h      |  3 ++
> >  3 files changed, 90 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> > index 86b1917459a4..397df27c1d69 100644
> > --- a/drivers/iommu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm-smmu-qcom.c
> > @@ -26,6 +26,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] = {
> >  static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
> >  {
> >  	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
> > +	u32 smr;
> >  	u32 reg;
> >  	int i;
> >  
> > @@ -56,6 +57,16 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
> >  		}
> >  	}
> >  
> > +	for (i = 0; i < smmu->num_mapping_groups; i++) {
> > +		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
> > +
> > +		if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {
> > +			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
> > +			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
> > +			smmu->smrs[i].valid = true;
> > +		}
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > index e2d6c0aaf1ea..a7cb27c1a49e 100644
> > --- a/drivers/iommu/arm-smmu.c
> > +++ b/drivers/iommu/arm-smmu.c
> > @@ -652,7 +652,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
> >  }
> >  
> >  static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> > -					struct arm_smmu_device *smmu)
> > +					struct arm_smmu_device *smmu,
> > +					bool boot_domain)
> >  {
> >  	int irq, start, ret = 0;
> >  	unsigned long ias, oas;
> > @@ -770,6 +771,15 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> >  		ret = -EINVAL;
> >  		goto out_unlock;
> >  	}
> > +
> > +	/*
> > +	 * Use the last context bank for identity mappings during boot, to
> > +	 * avoid overwriting in-use bank configuration while we're setting up
> > +	 * the new mappings.
> > +	 */
> > +	if (boot_domain)
> > +		start = smmu->num_context_banks - 1;
> > +
> >  	ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
> >  				      smmu->num_context_banks);
> >  	if (ret < 0)
> > @@ -1149,7 +1159,10 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
> >  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> >  	struct arm_smmu_master_cfg *cfg;
> >  	struct arm_smmu_device *smmu;
> > +	bool free_identity_domain = false;
> > +	int idx;
> >  	int ret;
> > +	int i;
> >  
> >  	if (!fwspec || fwspec->ops != &arm_smmu_ops) {
> >  		dev_err(dev, "cannot attach to SMMU, is it on the same bus?\n");
> > @@ -1174,7 +1187,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
> >  		return ret;
> >  
> >  	/* Ensure that the domain is finalised */
> > -	ret = arm_smmu_init_domain_context(domain, smmu);
> > +	ret = arm_smmu_init_domain_context(domain, smmu, false);
> >  	if (ret < 0)
> >  		goto rpm_put;
> >  
> > @@ -1190,9 +1203,34 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
> >  		goto rpm_put;
> >  	}
> >  
> > +	/* Decrement use counter for any references to the identity domain */
> > +	mutex_lock(&smmu->stream_map_mutex);
> > +	if (smmu->identity) {
> > +		struct arm_smmu_domain *identity = to_smmu_domain(smmu->identity);
> > +
> > +		for_each_cfg_sme(cfg, fwspec, i, idx) {
> > +			dev_err(smmu->dev, "%s() %#x\n", __func__, smmu->smrs[idx].id);
> 
> Debug leftovers?
> 

Indeed.

> Apart from that I plan to give this a go on some NXP chips. Will keep
> you updated.
> 

Thanks, I'm expecting that all you need is the first patch in the series
and some impl specific cfg_probe that sets up (or read back) the
relevant SMRs and mark them valid.

Regards,
Bjorn

> Thanks a lot Bjorn.
> 

> ---
> Best Regards, Laurentiu
