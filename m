Return-Path: <linux-arm-msm+bounces-29271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC98D95B38B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 13:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD03528213D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 11:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C9B14A0B8;
	Thu, 22 Aug 2024 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hsDWw8tt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7325317E46E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 11:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724325138; cv=none; b=po3+7IARoxK/V7IVuqCAq4Z3WVOH1JHz2mKxFMO0xJBapq432p5q7IHKCVJOhburq+n3tl4eO/nQLP08f3Zg+m1z4BENHajjdMOE5AvXqrJ+Y/GcR9GApLmNaMHM+EK+4WggeNWrzj+LU6qK509RtZZxLY+nJm3Hq5RXnGyOxHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724325138; c=relaxed/simple;
	bh=vi9h1FidMBka1pRgw2AnPFKWunRB65e+lyirWA4Ekmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKY/gsYT+TtGvHPJ8ujdIGkm040JF3K0UVhYP2jWOY90T72S7nowCEYb7lmfdGlWDVV3j6i+4fq/FcCCh5cHak3tVVuQgllKwcCHGrGcJ3BZsmbz1L31XF5G3EbOxa5dotu0tBOCFivQVqyLja6jeD6MpAfAlBZNnUpKTSNosNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hsDWw8tt; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so475090b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724325136; x=1724929936; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BbJ9Z+sMrkclfRagtYJm2Qhjn1slaJi07OZtLt0xRqg=;
        b=hsDWw8ttWVsaIp7qwC4SQh5i2dVzC10WKYFKvavGOvPcQVb80pUDxO4ayhlYf5Khi+
         m8oNPAKdZFQsFJKhsNAWCt5C+GZioz3NKxhkSZUfihESrwwXRuCfIOEp2t9+Xylsx0ON
         4mSUa8Oyc1s5pD7WbkQPDWzD1CZYYJrRxEEAlICodsMJjY6yH12T3GK3t+5+LaQl3hgI
         abxt+1nVk/vL+Zpz3xH1N4GqaOiju2s9KKqbmEz+pOU+ywBHZB8fSUWIKRRfyJ2rwHSF
         fLH5IiefzED3eBmMUw+6KrrpH3kE7fL7jIf5jmnh0mg9814fPxaRtd9+YXGYHsvDYBL5
         DDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724325136; x=1724929936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BbJ9Z+sMrkclfRagtYJm2Qhjn1slaJi07OZtLt0xRqg=;
        b=j4KAMeL9x1Fy2G4umpQstZEj0sXoe+LInz1B+nrRdEx5mb0Wkcl3DLBYP2J40J3rPv
         nSmOZ/bR0QLlecGn95CCS3rOfoq2fT3I0aAbVLZrYDSkwmrrVHD9FbxuOGfju/ISrckE
         FQJA+5ffvebqQlmbUjGg9TR48m/Ng/kCpHHtw2Qxt/U3ImHExvVqBOIj2vJD9GBRnK3K
         BP0oumrYFOEqntpINJF9iyUk3hy5g0fCn53BvjtrsryRVsqgBYmBjQbO26TitBMAD0M9
         y3paF/Gz1XAwi+y675JG75ElBwMRJjBEUaJWN6Wvom0nlQSGUBSkK7St0Pe5zo01LliP
         0m/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlQOPTpFO3tX6h+9nbhI4/Eg+ydO4f+O2+DRopntaIGIYZsJUMvJFs7D1mrA3/GgY15i8B9Hfu1LHV6RIt@vger.kernel.org
X-Gm-Message-State: AOJu0YweHcB9SlQ+0uWgj30obD8LXrFTMcXluUATLPx2GMdwRmO3ToiD
	lu5leTcq0wKPp4Pkc9iaBAypJAvlg1z8uRsGgP/3kUIJZ/oPSG9i2vTmh9Cb3w==
X-Google-Smtp-Source: AGHT+IGzybvAIUuXxPl7dmKySzy1eKxeJTiu0SQmcSr83L0+MazI/R/cvJax85qZEJ7fPuLq07i6aA==
X-Received: by 2002:a05:6a20:9313:b0:1ca:da6d:675f with SMTP id adf61e73a8af0-1cada6d79e0mr4593437637.0.1724325135657;
        Thu, 22 Aug 2024 04:12:15 -0700 (PDT)
Received: from thinkpad ([117.213.99.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9acdc7c6sm978832a12.46.2024.08.22.04.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 04:12:15 -0700 (PDT)
Date: Thu, 22 Aug 2024 16:42:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Pranjal Shrivastava <praan@google.com>
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
Message-ID: <20240822111207.vbotlrtw72vflefj@thinkpad>
References: <20240701162025.375134-1-robdclark@gmail.com>
 <20240701162025.375134-4-robdclark@gmail.com>
 <20240822100941.3tfqpjskzq43slfw@thinkpad>
 <ZscTkTOa8UPZtwRU@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZscTkTOa8UPZtwRU@google.com>

On Thu, Aug 22, 2024 at 10:31:45AM +0000, Pranjal Shrivastava wrote:
> On Thu, Aug 22, 2024 at 03:39:41PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Jul 01, 2024 at 09:20:12AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > > 
> > > Parse out the bitfields for easier-to-read fault messages.
> > > 
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 52 +++++---------
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.c         | 70 +++++++++++++++----
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.h         | 21 ++++++
> > >  3 files changed, 92 insertions(+), 51 deletions(-)
> > > 
> > 
> > [...]
> > 
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index 23cf91ac409b..79ec911ae151 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -405,32 +405,72 @@ static const struct iommu_flush_ops arm_smmu_s2_tlb_ops_v1 = {
> > >  	.tlb_add_page	= arm_smmu_tlb_add_page_s2_v1,
> > >  };
> > >  
> > > +
> > > +void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
> > > +				      struct arm_smmu_context_fault_info *cfi)
> > > +{
> > > +	cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
> > > +	cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
> > > +	cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
> > > +	cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
> > > +}
> > > +
> > > +void arm_smmu_print_context_fault_info(struct arm_smmu_device *smmu, int idx,
> > > +				       const struct arm_smmu_context_fault_info *cfi)
> > > +{
> > > +	dev_dbg(smmu->dev,
> > > +		"Unhandled context fault: fsr=0x%x, iova=0x%08lx, fsynr=0x%x, cbfrsynra=0x%x, cb=%d\n",
> > > +		cfi->fsr, cfi->iova, cfi->fsynr, cfi->cbfrsynra, idx);
> > > +
> > 
> > I just happen to hit an IOMMU fault in 6.11-rc4 and I did not see the 'Unhandled
> > context fault' log, but just the register dump in dmesg. Tracking that lead me
> > to this patch.
> > 
> > May I know the reasoning behind making the actual error message _dbg()? It is
> > intentional first place?
> > 
> > - Mani
> 
> Hi Mani,
> 
> That was a miss in this series, but it was fixed recently in [1].
> I think it should land soon.
> 
> [1] https://lore.kernel.org/linux-iommu/172381862229.1794487.17068761066364130246.b4-ty@kernel.org/
> 

Cool, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

