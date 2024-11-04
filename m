Return-Path: <linux-arm-msm+bounces-36917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BBF9BB2F5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69BD52850E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495041D2F4A;
	Mon,  4 Nov 2024 11:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qRFJgfiE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DD21D2F49
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 11:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718619; cv=none; b=VFvFpeRI9UyBEfqfS2XVhPCyQSUAojGz9Yh9+f5jGqdr77ttCleRcsa5UgUta5EG9lB7ehSeUCwjOIFwPbqRCNpWADuH+SjymiK30pqSBTDBwxAUJIGAALnDac2hrJaRTB517G0yipYUfTBp/NzuPKkdoCm0y6WZMlB98oJ5Oh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718619; c=relaxed/simple;
	bh=xCmzKCV7gN0Ttl8kSMcuqSTMDAZYGpuQ2h38YpKLMIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVBdHtbTuMLYYZfU6smXfEFGIbDifG6fjZfPllBdELWaFoaBnJwPaJmcEaJZVstczwvtP2CDJr2y86ent6rqyp3L1aTp70jMvC3wZgwIvfrC3rwvxcVSyctwi7384q+BMaizc96WqngbeQh0q2XVum28n6W2MQJFpTjn+9EMUHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qRFJgfiE; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e690479cso4112429e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 03:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730718615; x=1731323415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdH9jagT/8S5NPF4fTku+zGDNqYYEhhoFHFFqWBZ6As=;
        b=qRFJgfiEPUhDK7KzF5uEx35KLu67S7xXGAa3hWq9SFtsgfmAcrijqKdjBFqHXhrrTs
         DsaIYviEMrfxpFDtZrPfTwWYeOkZJUBnBzco8+zHZlvj5WxgrFh+BCnm+ZHLRgo2abzK
         LzxCNlksLjYDOPpfA2sGltGF+KLbISewjQ9LECyGEI4LqQ+VRf5d2zLqG594kRBE7+/0
         qjjg6oc5hJ9T+kRdoiRFBIXQAwV4Tn5bcD2qTYXH6pYJDw9uff23vPQihVJnQQciDdBh
         T3Xg6NPrKky1zuh1nH4MFDkoi1svSlw1eaDxwnEsdln2lKsbHc54nnXDEx+y6r3XpczY
         LfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718615; x=1731323415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdH9jagT/8S5NPF4fTku+zGDNqYYEhhoFHFFqWBZ6As=;
        b=jr5FMBVk4GVIzHXtK1r+kZzqyFLgEzrJ19dMdgrKFlvc0PhWqu/WZMsbtrkb9bfghZ
         lvXtRgi06RSh28aYrxDn2djGFahxOcMCVea6OxpQz+Q8R6MAKa9vnyMuSd8unzp7Te9j
         CIY+JG5AdmR1SIJf3G7jwpCi9xvDUmLecMlVmFRsbR/9vz1DMVcpH64RyYXUTEwMmtzj
         CaYOO+IxiQP6ug+9YiBNv8EF6+5VEfVB0WQyKKB50/D3sC7EpdSpvqrUz9d0T4tPwHLr
         UKljOLPemN61B5+mRBG064lkj60ArM/UCBsACZmgmNR32iE9eRjPIBaAAs/loA2+1d28
         +UWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbFF458A6NMv79bOXi2e0tYkQFJk/3CIeNmLBIynfd5gLshcs7qgTV1aTCmajDu6OkzK/rFGqTIxNioSZ5@vger.kernel.org
X-Gm-Message-State: AOJu0YyiMYFpkDwibPUcOz+5wqsYzoHiS0O9riFo66dpWF17fQjSx5Gf
	8b2e5M7pixI57/n59KCgS7jMJnGTo7c9QsWH+utc67h2WrCbkZ28hze/+xe6vxY=
X-Google-Smtp-Source: AGHT+IEQUhS4emFgL3X45Om3GNfU0TsJqApFtwGEHEcfNMJnwL431cR9bOTneTsVxJQJXash7yfV5Q==
X-Received: by 2002:a05:6512:39c4:b0:539:8d2c:c01c with SMTP id 2adb3069b0e04-53d65e11aaemr5273106e87.41.1730718615371;
        Mon, 04 Nov 2024 03:10:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcbfbcsm1639983e87.199.2024.11.04.03.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 03:10:14 -0800 (PST)
Date: Mon, 4 Nov 2024 13:10:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>
Cc: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robdclark@gmail.com, 
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, 
	robh@kernel.org, krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, 
	iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v16 1/5] iommu/arm-smmu: re-enable context caching in
 smmu reset operation
Message-ID: <ygd6bryp73jgsm5zggy2jz4uc42dehht2e6ht5f6yowf74c6ns@u6dul4rnybt6>
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-2-quic_bibekkum@quicinc.com>
 <20241024125241.GD30704@willie-the-truck>
 <092db44e-f254-4abd-abea-e9a64e70df12@quicinc.com>
 <20241029124708.GA4241@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029124708.GA4241@willie-the-truck>

On Tue, Oct 29, 2024 at 12:47:09PM +0000, Will Deacon wrote:
> On Fri, Oct 25, 2024 at 07:51:22PM +0530, Bibek Kumar Patro wrote:
> > 
> > 
> > On 10/24/2024 6:22 PM, Will Deacon wrote:
> > > On Tue, Oct 08, 2024 at 06:24:06PM +0530, Bibek Kumar Patro wrote:
> > > > Default MMU-500 reset operation disables context caching in
> > > > prefetch buffer. It is however expected for context banks using
> > > > the ACTLR register to retain their prefetch value during reset
> > > > and runtime suspend.
> > > > 
> > > > Replace default MMU-500 reset operation with Qualcomm specific reset
> > > > operation which envelope the default reset operation and re-enables
> > > > context caching in prefetch buffer for Qualcomm SoCs.
> > > > 
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > > Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> > > > ---
> > > >   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 45 ++++++++++++++++++++--
> > > >   1 file changed, 42 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > index 087fb4f6f4d3..0cb10b354802 100644
> > > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > > @@ -16,6 +16,16 @@
> > > > 
> > > >   #define QCOM_DUMMY_VAL	-1
> > > > 
> > > > +/*
> > > > + * SMMU-500 TRM defines BIT(0) as CMTLB (Enable context caching in the
> > > > + * macro TLB) and BIT(1) as CPRE (Enable context caching in the prefetch
> > > > + * buffer). The remaining bits are implementation defined and vary across
> > > > + * SoCs.
> > > > + */
> > > > +
> > > > +#define CPRE			(1 << 1)
> > > > +#define CMTLB			(1 << 0)
> > > > +
> > > >   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> > > >   {
> > > >   	return container_of(smmu, struct qcom_smmu, smmu);
> > > > @@ -396,11 +406,40 @@ static int qcom_smmu_def_domain_type(struct device *dev)
> > > >   	return match ? IOMMU_DOMAIN_IDENTITY : 0;
> > > >   }
> > > > 
> > > > +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> > > > +{
> > > > +	int ret;
> > > > +	u32 val;
> > > > +	int i;
> > > > +
> > > > +	ret = arm_mmu500_reset(smmu);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	/*
> > > > +	 * arm_mmu500_reset() disables CPRE which is re-enabled here.
> > > > +	 * The errata for MMU-500 before the r2p2 revision requires CPRE to be
> > > > +	 * disabled. The arm_mmu500_reset function disables CPRE to accommodate all
> > > > +	 * RTL revisions. Since all Qualcomm SoCs are on the r2p4 revision, where
> > > > +	 * the CPRE bit can be enabled, the qcom_smmu500_reset function re-enables
> > > > +	 * the CPRE bit for the next-page prefetcher to retain the prefetch value
> > > > +	 * during reset and runtime suspend operations.
> > > > +	 */
> > > > +
> > > > +	for (i = 0; i < smmu->num_context_banks; ++i) {
> > > > +		val = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
> > > > +		val |= CPRE;
> > > > +		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, val);
> > > > +	}
> > > 
> > > If CPRE only needs to be disabled prior to r2p2, then please teach the
> > > MMU-500 code about that instead of adding qualcomm-specific logic here.
> > > 
> > 
> > Doing this on MMU-500 code would make it generic and reflect for SoC of all
> > the vendors on this platform.
> > We can make sure that it won't cause any problems in Qualcomm SoCs as we
> > have been enabling this since for some years now and could not
> > observe/reproduce any issues around these errata.
> 
> Unless you can explain definitively hy that's the case, I still don't
> think we should be second-guessing the core SMMU driver code in the
> Qualcomm backend.
> 
> > But we won't be able to guarantee the same behavior in SoC for other vendors
> > where these errata might still be applicable as per [1] and [2].
> > So as per my understanding it's safe to include in Qualcomm specific
> > implementation and not changing the default behavior in all other vendors'
> > SoC even if they are not prior to r2p2 revision [3].
> 
> If you want to gate the errata workarounds on policy, then please follow
> what we do for the CPU: add a Kconfig option (e.g.
> ARM_SMMU_WORKAROUND_BROKEN_CPRE) which defaults to "on" (assuming that
> the relevant errata aren't all "rare") and update silicon-errata.rst
> accordingly.
> 
> Then you can choose to disable them in your .config if you're happy to
> pick up the pieces.

Is it actually going to work? For most of the CPU errata we can detect
and limit the workarounds to some class of CPUs. For SMMU, if I'm not
misunderstanding something, the errata will be enabled by default for
all SMMU-500 implementation, so only very few kernels, targeting only
the Qualcomm hardware, can get that disabled.

> As an aside, I'm happy with the rest of the series now.
> 
> Will

-- 
With best wishes
Dmitry

