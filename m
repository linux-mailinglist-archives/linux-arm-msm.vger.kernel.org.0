Return-Path: <linux-arm-msm+bounces-29262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A40395B2F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 12:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88A871F24079
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 10:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4729517C216;
	Thu, 22 Aug 2024 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P4QIUzTd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9BD14A0B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724322719; cv=none; b=MFpfQKEf/XeaCUQDh8mLbrN399mpCSBR5pnUP8ukEWSyko4NpDwV8PrLMScDAXmB42CujWI54DK8foNxN2+F7t20xgxpxTpzk24uW2UWqq3vyQ0MZLiPPKs6YKFZ7H+SS695w0iR13ooN+9uSDtrKDDn04SMGB8k/y8TjoiwUNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724322719; c=relaxed/simple;
	bh=6NzIRtrCKVOraXP7l2FUaMsD6YoLTX34J6Pp95H1Haw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXudjZZx3Ui3cVKTrzCFWc6siI+VvCZwT9p95YYc/gfb5kKI71Y/nHs4LVbEKe9JZNhkdhFLipNK56WJS70lmN/f4ayZka/u4tDKQIhXG9cI+zdA7dU9SrTVTZMqFPLyHsJcZQkrfT6yLKK0mtAQx04AZmoyTMve9hY0L0n1YLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P4QIUzTd; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20353e5de9cso164285ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 03:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724322717; x=1724927517; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tUXipJTdapUuZZdhDEMNQWdCBYBL4+gU+qAyOZlKfmk=;
        b=P4QIUzTd22bQb9mo5mX47HeL9x1+jq11C240IfzfEOwtC7UnAPAJjYlIQyo0EpMWd+
         yC3goGRAnZTbHmW4oX1tu/KZjuRsGcKIuK3NPl5qbwWFEgniOtyOC/fT7VgswjbGRYbk
         OBVODaNBzm97bXPEwS+KGMyeCEG8obUprZgSwBa7GcCJ1XxN28wqKJBYy9xDabjOvx51
         nd9HBjyyM+i1mBWZCzDm1Z3RFxczeXckYlOH3OIMihiop/uunuUl9ynw9693dCJ/lP31
         NRfsFxuJl04aCSyXtRw2RiHzFzUZ40mvTGxDsenoAMH2yz04kClwABGl9a6/ZGfqIhNf
         Ol2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724322717; x=1724927517;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUXipJTdapUuZZdhDEMNQWdCBYBL4+gU+qAyOZlKfmk=;
        b=NsSH27xtXjZaFH9sBGN9R/z3i/rqUScwDFOUQjQFEphmAES4/m1Fz2nEFvJoMvoVpW
         5hV0iEmw8YJT6JlFelvGLD1G3PgDqS1VAXlB65qiPHeQ39wtzAwPQ5Qc1+DnTqrVMfgV
         1KIGIS40lPoIJZrsDBmh27eAP31WyODFeXzwhfEovIQm4kI8JplGTjXFwzCpy4x6PAdh
         8Ojdh6oZlDclJLcuedDDZ82XSjbOWpmH0/IElLY52vVeGVu1pToRLrVTTTfHz/Nu0pOm
         Z9DcpJsXJeUa5xUryfpks/e5/Byqfx0X/EGgU8sRnJ84aVnhU7ZsLtQHV+CmKpdU5OLM
         1KoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeoqwn4loQytwsR8HY62NAHqddk3gMaD0cac4iL+lfQjTvj2xiVyAUeh7z7eWKd2Cq8OVvHhB+XbHZ87T3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4NesIWDT2dndhHwyvp7JXvSigjcekQEV0F2uFZ6b01hAYGolp
	qHgM5MwRVHFdSnt1e6dHX7Ken8nUY0lwSxP8HUyY4PK4SytBD0ZvhwUYA70+Mw==
X-Google-Smtp-Source: AGHT+IEH781ASflOBSZPkMIu7v/uf1ImBmbiSA+jZOLkQNWeidW1nwk8ZmripLpE58FpyKVExr8vpw==
X-Received: by 2002:a17:903:32d1:b0:1f4:50b4:a50b with SMTP id d9443c01a7336-203824cefddmr2830035ad.18.1724322716320;
        Thu, 22 Aug 2024 03:31:56 -0700 (PDT)
Received: from google.com (202.141.197.35.bc.googleusercontent.com. [35.197.141.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d613941e6esm1395309a91.26.2024.08.22.03.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 03:31:55 -0700 (PDT)
Date: Thu, 22 Aug 2024 10:31:45 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Georgi Djakov <quic_c_gdjako@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] iommu/arm-smmu: Pretty-print context fault
 related regs
Message-ID: <ZscTkTOa8UPZtwRU@google.com>
References: <20240701162025.375134-1-robdclark@gmail.com>
 <20240701162025.375134-4-robdclark@gmail.com>
 <20240822100941.3tfqpjskzq43slfw@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240822100941.3tfqpjskzq43slfw@thinkpad>

On Thu, Aug 22, 2024 at 03:39:41PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Jul 01, 2024 at 09:20:12AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > Parse out the bitfields for easier-to-read fault messages.
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 52 +++++---------
> >  drivers/iommu/arm/arm-smmu/arm-smmu.c         | 70 +++++++++++++++----
> >  drivers/iommu/arm/arm-smmu/arm-smmu.h         | 21 ++++++
> >  3 files changed, 92 insertions(+), 51 deletions(-)
> > 
> 
> [...]
> 
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > index 23cf91ac409b..79ec911ae151 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -405,32 +405,72 @@ static const struct iommu_flush_ops arm_smmu_s2_tlb_ops_v1 = {
> >  	.tlb_add_page	= arm_smmu_tlb_add_page_s2_v1,
> >  };
> >  
> > +
> > +void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
> > +				      struct arm_smmu_context_fault_info *cfi)
> > +{
> > +	cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > +	cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > +	cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > +	cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> > +}
> > +
> > +void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
> > +				       const struct arm_smmu_context_fault_info *cfi)
> > +{
> > +	dev_dbg(smmu->dev,
> > +		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> > +		cfi->fsr, cfi->iova, cfi->fsynr, cfi->cbfrsynra, idx);
> > +
> 
> I just happen to hit an IOMMU fault in 6.11-rc4 and I did not see the 'Unhandled
> context fault' log, but just the register dump in dmesg. Tracking that lead me
> to this patch.
> 
> May I know the reasoning behind making the actual error message _dbg()? It is
> intentional first place?
> 
> - Mani

Hi Mani,

That was a miss in this series, but it was fixed recently in [1].
I think it should land soon.

[1] https://lore.kernel.org/linux-iommu/172381862229.1794487.17068761066364130246.b4-ty@kernel.org/

Thanks,
Pranjal

> 
> > +	dev_err(smmu->dev, "FSR    = %08x [%s%sFormat=%u%s%s%s%s%s%s%s%s], SID=0x%x\n",
> > +		cfi->fsr,
> > +		(cfi->fsr & ARM_SMMU_CB_FSR_MULTI)  ? "MULTI " : "",
> > +		(cfi->fsr & ARM_SMMU_CB_FSR_SS)     ? "SS " : "",
> > +		(u32)FIELD_GET(ARM_SMMU_CB_FSR_FORMAT, cfi->fsr),
> > +		(cfi->fsr & ARM_SMMU_CB_FSR_UUT)    ? " UUT" : "",
> > +		(cfi->fsr & ARM_SMMU_CB_FSR_ASF)    ? " ASF" : "",
> > +		(cfi->fsr & ARM_SMMU_CB_FSR_TLBLKF) ? " TLBLKF" : "",
> > +		(cfi->fsr & ARM_SMMU_CB_FSR_TLBMCF) ? " TLBMCF" : "",
> > +		(cfi->fsr & ARM_SMMU_CB_FSR_EF)     ? " EF" : "",
> > +		(cfi->fsr & ARM_SMMU_CB_FSR_PF)     ? " PF" : "",
> > +		(cfi->fsr & ARM_SMMU_CB_FSR_AFF)    ? " AFF" : "",
> > +		(cfi->fsr & ARM_SMMU_CB_FSR_TF)     ? " TF" : "",
> > +		cfi->cbfrsynra);
> > +
> > +	dev_err(smmu->dev, "FSYNR0 = %08x [S1CBNDX=%u%s%s%s%s%s%s PLVL=%u]\n",
> > +		cfi->fsynr,
> > +		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_S1CBNDX, cfi->fsynr),
> > +		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_AFR) ? " AFR" : "",
> > +		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_PTWF) ? " PTWF" : "",
> > +		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_NSATTR) ? " NSATTR" : "",
> > +		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_IND) ? " IND" : "",
> > +		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_PNU) ? " PNU" : "",
> > +		(cfi->fsynr & ARM_SMMU_CB_FSYNR0_WNR) ? " WNR" : "",
> > +		(u32)FIELD_GET(ARM_SMMU_CB_FSYNR0_PLVL, cfi->fsynr));
> > +}
> > +
> >  static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
> >  {
> > -	u32 fsr, fsynr, cbfrsynra;
> > -	unsigned long iova;
> > +	struct arm_smmu_context_fault_info cfi;
> >  	struct arm_smmu_domain *smmu_domain = dev;
> >  	struct arm_smmu_device *smmu = smmu_domain->smmu;
> > +	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
> > +				      DEFAULT_RATELIMIT_BURST);
> >  	int idx = smmu_domain->cfg.cbndx;
> >  	int ret;
> >  
> > -	fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > -	if (!(fsr & ARM_SMMU_CB_FSR_FAULT))
> > -		return IRQ_NONE;
> > +	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
> >  
> > -	fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > -	iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > -	cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> > +	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
> > +		return IRQ_NONE;
> >  
> > -	ret = report_iommu_fault(&smmu_domain->domain, NULL, iova,
> > -		fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> > +	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
> > +		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
> >  
> > -	if (ret == -ENOSYS)
> > -		dev_err_ratelimited(smmu->dev,
> > -		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> > -			    fsr, iova, fsynr, cbfrsynra, idx);
> > +	if (ret == -ENOSYS && __ratelimit(&rs))
> > +		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
> >  
> > -	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, fsr);
> > +	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
> >  	return IRQ_HANDLED;
> >  }
> >  
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > index b04a00126a12..e2aeb511ae90 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -198,6 +198,7 @@ enum arm_smmu_cbar_type {
> >  #define ARM_SMMU_CB_FSR			0x58
> >  #define ARM_SMMU_CB_FSR_MULTI		BIT(31)
> >  #define ARM_SMMU_CB_FSR_SS		BIT(30)
> > +#define ARM_SMMU_CB_FSR_FORMAT		GENMASK(10, 9)
> >  #define ARM_SMMU_CB_FSR_UUT		BIT(8)
> >  #define ARM_SMMU_CB_FSR_ASF		BIT(7)
> >  #define ARM_SMMU_CB_FSR_TLBLKF		BIT(6)
> > @@ -223,7 +224,14 @@ enum arm_smmu_cbar_type {
> >  #define ARM_SMMU_CB_FAR			0x60
> >  
> >  #define ARM_SMMU_CB_FSYNR0		0x68
> > +#define ARM_SMMU_CB_FSYNR0_PLVL		GENMASK(1, 0)
> >  #define ARM_SMMU_CB_FSYNR0_WNR		BIT(4)
> > +#define ARM_SMMU_CB_FSYNR0_PNU		BIT(5)
> > +#define ARM_SMMU_CB_FSYNR0_IND		BIT(6)
> > +#define ARM_SMMU_CB_FSYNR0_NSATTR	BIT(8)
> > +#define ARM_SMMU_CB_FSYNR0_PTWF		BIT(10)
> > +#define ARM_SMMU_CB_FSYNR0_AFR		BIT(11)
> > +#define ARM_SMMU_CB_FSYNR0_S1CBNDX	GENMASK(23, 16)
> >  
> >  #define ARM_SMMU_CB_FSYNR1		0x6c
> >  
> > @@ -533,4 +541,17 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
> >  void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
> >  int arm_mmu500_reset(struct arm_smmu_device *smmu);
> >  
> > +struct arm_smmu_context_fault_info {
> > +	unsigned long iova;
> > +	u32 fsr;
> > +	u32 fsynr;
> > +	u32 cbfrsynra;
> > +};
> > +
> > +void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
> > +				      struct arm_smmu_context_fault_info *cfi);
> > +
> > +void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
> > +				       const struct arm_smmu_context_fault_info *cfi);
> > +
> >  #endif /* _ARM_SMMU_H */
> > -- 
> > 2.45.2
> > 
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

