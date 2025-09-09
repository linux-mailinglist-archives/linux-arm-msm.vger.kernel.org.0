Return-Path: <linux-arm-msm+bounces-72848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 266E0B5018E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEF6B364456
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C626C353367;
	Tue,  9 Sep 2025 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oR+AWC4t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B2E35AAD5
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 15:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757432128; cv=none; b=UaQrLmAYOq0TQqjagDJvFD7NS1Y+Ax+pxTNo38aQkSYsTrS/Ho0t13K8KR89zEDc3lWGH9DX1g4/broW6P9i22LU+OPOl86lbTKpaot0N4gwhaX1dMwcd9cIKG5LVi9w1YFzF93+ylepU12DfheElVuu+ZFBVdCwR+ZfoU3uY0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757432128; c=relaxed/simple;
	bh=w4vgOObZw3YYbVIKYEvDXnCr95k+9nhWh3AEGiV+pkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4m0c9RnVe5rQV85+1g8VypqIq4x5kcEqYsVoGiC6AC6hqrDCb3pOor9GsQB750egxBYsdgjCZA+qbVlA0s2nMf5DbESIkhlbWq4qcwVIQ8+MyhoR/cb5tJaInbBRzI9GWYDoGqIzSi/LSl8H4RGBhPa1BtTEXY+un6hThDth9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oR+AWC4t; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b04b55d5a2cso609807666b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757432124; x=1758036924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A6rLLgpVdsegGOz+EoupeAx36VHy3lWka2XxE7GCX/E=;
        b=oR+AWC4tCPxc7EjZgtsJSIhr/VlUCo4o9Cth70xCN6zLAfnMXcwE1UWpKBIIdVIu+m
         zteHOYyvthZKZizUI9JGDRtH2pqAI9Z/HiQBEikGurXmYjDe6I2Buc7lrbQ/gS9xpyCF
         5rIGWYMBoEIQdd3zO1xvgW2NAg+0a03K+GZTs4QDKclau3QyKXa3zKu9b+eUhkh8yNIJ
         PKoZLl3NHqs4XIz9uqONX9JnmYVBFsjgOdjaN1JROGdTLbDa/kTI8li5trZqaORufjNQ
         USFzD/BcZDL5n5XFfJDYm3ZLb+HjQKzMCvo1mw67jt6uFEZuGquxsYIvrMawpbzEoU+h
         QTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757432124; x=1758036924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6rLLgpVdsegGOz+EoupeAx36VHy3lWka2XxE7GCX/E=;
        b=IMyTkdAuycote6Rz2Pk0LG3QVWxWymZQsQ5C+rYcc28Kx/JnESWhMgrmJCADrNv9y4
         v8fkcVqxxxCVDObGKiWSqDJ8p5ciad1N/f6RBoDhGVMuULZz/+CwPWS6XK1UPrut2Ozs
         ntTYkHvBy8bJEpiBm2Tzy0c7AKwMMZiB/vBBKVg7nXMLc0mLtP9oOOxGEoEWYlzYOta+
         ktj11rplFedDIcX1FeOMRrswOho+izQByIscL5JbpK39ZELIZvLaZ92ns8q8ClAGuM0E
         w9oTndHwHV1s9Qva6f1op5rw8O1ELbPFPJ0R5zL3X6M90dineNE/llZYZPrubQNVQYIi
         r7XA==
X-Forwarded-Encrypted: i=1; AJvYcCUP1yBNL5rrZBaji9D6QmxST9Vdql0+DmtskSMnP6UuccAaSDRwBGrc3tWhfq037qnDiBm+XncuOfLn8vei@vger.kernel.org
X-Gm-Message-State: AOJu0Yz869sVGRs9+q+VMOEBUEta7UugtJmpkPvzc2ryq/GqOZXOXjN/
	o7v3ZvkG5sMa9mLY5bbSaRm0Mhmquja6xqDqHw6vZK6PgDc3GCfBvxq+9RhhgGq1HXI=
X-Gm-Gg: ASbGncu+pcmGtzvUlkCmchjlyuBVt6arVHjtjiGXfMzMHUv2LTuRE1Jtju9reAUYDUM
	rBbO+KAcnb7j8jtRSte+wBsv5gL9G12bkNjzmy7aczxZCoixjirqJgCMS+lygwcdq2kpGSmFHCz
	I+MOK5MlDYDLrkb1dJYXd14GztVvQZbHCk8Y0dwmm3UnflkmArrM/FL3BBJ/enUwK+vJSm8P8l8
	laz6KbkI8Ek+jclhe78icWyt2Cey939J9lPT8yGOlCDD0Hv3F6O/M59OcdUzE/YNfhiLvqtxCOp
	m1zOJeFBzyOPTEi2DkMSm/18co+Y4/dMb58w3ulppHQ1xE9rJPaj/WPYkwJy74lAaWLBtBq7uzM
	3yr2YGCd2WKJlsHK2Q+qyTC3LZ0Ap1lwi
X-Google-Smtp-Source: AGHT+IHff9nCiQdFMDLMJ/hlSIro/R7UZcyBEWyHkdL401b61b17TqRRFBH3ULGPy356DE8iv2CdnA==
X-Received: by 2002:a17:907:9707:b0:b04:95cf:a39a with SMTP id a640c23a62f3a-b04b1714554mr1300624066b.52.1757432124140;
        Tue, 09 Sep 2025 08:35:24 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:cfb9:1327:6099:9e75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830e613csm8636466b.46.2025.09.09.08.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 08:35:23 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:35:19 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Enable use of all SMR groups when
 running bare-metal
Message-ID: <aMBJNzXpQTMg4Ncs@linaro.org>
References: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
 <aMAkJ7CfPQuhvhfm@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMAkJ7CfPQuhvhfm@willie-the-truck>

On Tue, Sep 09, 2025 at 01:57:11PM +0100, Will Deacon wrote:
> On Thu, Aug 21, 2025 at 10:33:53AM +0200, Stephan Gerhold wrote:
> > Some platforms (e.g. SC8280XP and X1E) support more than 128 stream
> > matching groups. This is more than what is defined as maximum by the ARM
> > SMMU architecture specification. Commit 122611347326 ("iommu/arm-smmu-qcom:
> > Limit the SMR groups to 128") disabled use of the additional groups because
> > they don't exhibit the same behavior as the architecture supported ones.
> > 
> > It seems like this is just another quirk of the hypervisor: When running
> > bare-metal without the hypervisor, the additional groups appear to behave
> > just like all others. The boot firmware uses some of the additional groups,
> > so ignoring them in this situation leads to stream match conflicts whenever
> > we allocate a new SMR group for the same SID.
> > 
> > The workaround exists primarily because the bypass quirk detection fails
> > when using a S2CR register from the additional matching groups, so let's
> > perform the test with the last reliable S2CR (127) and then limit the
> > number of SMR groups only if we detect that we are running below the
> > hypervisor (because of the bypass quirk).
> > 
> > Fixes: 122611347326 ("iommu/arm-smmu-qcom: Limit the SMR groups to 128")
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > ---
> > I modified arm_smmu_find_sme() to prefer allocating from the SMR groups
> > above 128 (until they are all used). I did not see any issues, so I don't
> > see any indication that they behave any different from the others.
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 27 +++++++++++++++++----------
> >  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> Is the existing workaround causing you problems somehow? Limiting the SMR
> groups to what the architecture allows still seems like the best bet to
> me unless there's a compelling reason to do something else.
> 

Yes, the problem is the following (copied from commit message above):

> The boot firmware uses some of the additional groups, so ignoring them
> in this situation leads to stream match conflicts whenever we allocate
> a new SMR group for the same SID.

This happens e.g. in the following situation on SC8280XP when enabling
video decoding acceleration bare-metal without the hypervisor:

 1. The SMMU is already set up by the boot firmware before Linux is
    started, so some SMRs are already in use during boot. I added some
    code to dump them:

     arm-smmu 15000000.iommu: Found SMR0 <0xe0 0x0>
      ...
     arm-smmu 15000000.iommu: Found SMR8 <0x800 0x0>
     <unused>
     arm-smmu 15000000.iommu: Found SMR170 <0x2a22 0x400>
     arm-smmu 15000000.iommu: Found SMR171 <0x2a02 0x400>
      ...
     arm-smmu 15000000.iommu: Found SMR211 <0x400 0x3>

 2. We limit the SMRs to 128, so all the ones >= 170 just stay as-is.
    Only the ones < 128 are considered when allocating SMRs.

 3. We need to configure the following IOMMU for video acceleration:

	video-firmware {
		iommus = <&apps_smmu 0x2a02 0x400>;
	};

 4. arm-smmu 15000000.iommu: Picked SMR 14 for SID 0x2a02 mask 0x400
    ... but SMR170 already uses that SID+mask!

 5. arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
    arm-smmu 15000000.iommu: GFSR 0x80000004, GFSYNR0 0x0000000c, GFSYNR1 0x00002a02, GFSYNR2 0x00000000

    SMCF, bit[2] is set -> Stream match conflict fault
    caused by SID GFSYNR1 0x00002a02

With my patch this does not happen anymore. As I wrote, so far I have
seen no indication that the extra groups behave any different from the
standard ones defined by the architecture. I don't know why it was done
this way (rather than e.g. implementing the Extended Stream Matching
Extension), but we definitely need to do something with the extra SMRs
to avoid stream match conflicts.

Thanks,
Stephan

