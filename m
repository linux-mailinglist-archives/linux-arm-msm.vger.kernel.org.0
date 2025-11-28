Return-Path: <linux-arm-msm+bounces-83799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C5EC927E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 17:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F01D34E141C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 16:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A60D288535;
	Fri, 28 Nov 2025 16:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aY+FW38i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F7B288C27
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764345830; cv=none; b=dyKzKDyUuE76MOsoNzUrHgBCW4WtBSl1oUmx/i6K7Dhia2HP9bhj2GksQNyH9HdUofHRjegvmrFewWhMdkuLO+2IEz8da87dupwi01ZHJqGOCWtgs6nWwXI4HRQ2HpSapcoJ4pp4kEv6ttg/DFwyQCUr3J68d9XarkMdmxsJB3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764345830; c=relaxed/simple;
	bh=8LtIKEYNPDtP7Bg4bOutf+DgxMqkbcmKE29hYsQYC60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3+4bySvLlCDu4sNWsUnjgpMB8J0teTUxUKj6z7O0Bhl3beOsZUctQhSnT58A/2vvngYuNmS4xr66MwSAngXbpIZtZ+WhkHYCO41BI7GRQzvZKGR25Zzn5ksWUr1QMRkaYcn9IrLGV7JJ7WWRF5SWRiNaYErsCNuKCiW+LU4xVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aY+FW38i; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47789cd2083so10854345e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764345825; x=1764950625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=29oMiGOlEBo8VSbo7iR6xJMVH+/RNxSH1akBqs10TE0=;
        b=aY+FW38iz8M0bYneCv+gXiKBqEvc1J1gZwKqbAeDafoYovvqtEmNZ4BTqugE46CWUo
         j1rG8xDcG6I3hRltuXsMgipws/+U1/VZQ/2MNWh7yFwThbmEW2IJvzks40e41cy7mIZd
         4Nv/jn4/N6wK3rqGEq1VujuLCKiX1fBX9ewDJL0NxSm3gmSL82A3YkbZ+Mc+e+QgMjvn
         cRxdl3cWE/qaLjcNLCl04gU2C5G0WbhDmUMuxK5wEI/IcacxtaXBNVwcMVI8hQKD65Yz
         /XVnYmJTIVF29pcjlCXR4gIr0MjsKMMjn0h6ik9fLqu1hx4QXDvQ2RXUelBZCN3S8zAt
         cSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764345825; x=1764950625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29oMiGOlEBo8VSbo7iR6xJMVH+/RNxSH1akBqs10TE0=;
        b=RhB8TOR8eGMGS8PKia5IVbJzgpWa7P7yE9KlgAQZORaseZiRDxnjXuWrQbKGrB4jcv
         Qq6uZzDpEx5vMbO0o5kh05TR8fctBhCiodz2hoaG9JL9m8I5eg3K8fLrA+KeJp9sNV8F
         +TL/JIWkBnB43RJPUOkD2UaTujCDO9Br4RnyDq6/wiEhPhdVHLna6wtFXTFohW1EkltM
         OEiuSS6NyXnz4p7GGpDImBv7EotQKnR1KX/CCdLoMMk3OLM5RbxDGbqd9YCyALTPbFtH
         WHQmebO6WY+VHWqZRE5bWq4V4ywWLFMDakUcMDwEckiStWNqG5g5tNvpjlz9SJ/bernd
         DLHQ==
X-Gm-Message-State: AOJu0Ywb+w+THfD0ZvKJmKI9w1Ry12VTG37hfkEBpc1HWjjM74t3fiK3
	vacbBDqV7GWZ4ruqdh6V7AeRJoRgDd6yj3OxVv1D5LQgnRyhzxR+t9CihQ/+2hvAPJ8=
X-Gm-Gg: ASbGncuXWY4T8aIlLPndeMUGcIO8TvEKa/qE0//4UTLfP0wMqoh+Djn/DWiec5dJ2ms
	uCQqWC5gTsU9NyNcuU7cGnnSZH0GlD9eZY9S9wy0AlQkkoW8CUQ4UA/k5SEbCVfV5eojuJrQPoI
	NIVK37aR8Er8oC2v7xKr8wG8kZz4nON6J8/MZNqA2TkVCjx2HbE8epYYTpG2pLFKXrkhDSsDvoo
	QWNs9Scwsd/CifGEcvJpUO96CWTn4aZDzuHNHfnEggVScWv8zNYFUw3Vs2LnQwJqcG1X4ATcrNr
	LVULIYQiJmuz0m5ZnnH90akZSRCv+ChsRiXgZ9E21O8jgzWiUMzA6L4TZtSreA/UWKIHzpoDxLP
	nmVLdbe5l9ty2WIyT+rEFcprCl85rcoucgeDpSjKnBrd+OEjyuy63lsUi56qijSsddURtf9mOOD
	lvp8fDBhQUU5NNIiX19zJ+FjM=
X-Google-Smtp-Source: AGHT+IEIdiWgI6ShKK8zf0LsF9J/VMydu3xKcInB74BGagkNqrUSnaFzoxtYNlD0dYCR2h1EdMMqrA==
X-Received: by 2002:a05:600c:a01:b0:477:55ce:f3c2 with SMTP id 5b1f17b1804b1-477c111d3camr301614565e9.14.1764345825032;
        Fri, 28 Nov 2025 08:03:45 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff23:4430:e122:53f9:35dd:da27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c30c4sm11016931f8f.9.2025.11.28.08.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:03:44 -0800 (PST)
Date: Fri, 28 Nov 2025 17:03:40 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
Message-ID: <aSnH3C8s5xVSk_ti@linaro.org>
References: <20251127212943.24480-1-jonathan@marek.ca>
 <aSl48gV9laFb-MR1@linaro.org>
 <d969b3e6-a6e1-6dd3-45b9-539ba7a9f42d@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d969b3e6-a6e1-6dd3-45b9-539ba7a9f42d@marek.ca>

On Fri, Nov 28, 2025 at 09:39:52AM -0500, Jonathan Marek wrote:
> On 11/28/25 5:26 AM, Stephan Gerhold wrote:
> > On Thu, Nov 27, 2025 at 04:29:42PM -0500, Jonathan Marek wrote:
> > > Unlike the phone SoCs this was copied from, x1e has a 40-bit physical bus.
> > > The upper address space is used to support more than 32GB of memory.
> > > 
> > > This fixes issues when DMA buffers are allocated outside the 36-bit range.
> > > 
> > > Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
> > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > > ---
> > >   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > index cff34d1c74b60..cd34ce5dfd63a 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > > @@ -792,8 +792,8 @@ soc: soc@0 {
> > >   		#address-cells = <2>;
> > >   		#size-cells = <2>;
> > > -		dma-ranges = <0 0 0 0 0x10 0>;
> > > -		ranges = <0 0 0 0 0x10 0>;
> > > +		dma-ranges = <0 0 0 0 0x100 0>;
> > > +		ranges = <0 0 0 0 0x100 0>;
> > 
> > Could you clarify which "issues" (crashes?) you are referring to?
> > 
> > We need to distinguish two distinct use cases here, which are both
> > (somewhat) supported upstream: Running in EL1 with the Gunyah hypervisor
> > with the regular DTB and in EL2 with the x1-el2.dtbo applied.
> > 
> > # EL2 with x1-el2.dtbo
> > 
> > For EL2, I think the 40-bit dma-ranges should indeed work correctly, so
> > we could add your proposed change inside x1-el2.dtso. I'm not sure which
> > issues we are fixing with that though (besides correctness of the
> > hardware description). In EL2, all DMA devices should be behind an
> > IOMMU. In this case, the dma-ranges limit the size of the I/O virtual
> > addresses (DMA addresses) that are given to the devices. The IOMMU maps
> > the DMA buffers to arbitrary physical memory addresses (including
> > outside of the 36-bit range, dma-ranges limits only the DMA address).
> > 
> > I would expect that applying your change effectively just enlarges the
> > I/O virtual address space, which will then be 40-bit instead of just
> > 36-bit. For most devices, even 32-bit of virtual address space should be
> > enough. A larger address space will only be applied for drivers that
> > explicitly request a larger DMA mask (e.g. the nvme driver).
> > 
> > We can make this change for correctness, but given that it is only about
> > the IOVA space, there shouldn't be much functional difference.
> > 
> > # EL1 with Gunyah hypervisor
> > 
> > For EL1, the hypervisor firmware used on most retail laptops limits the
> > usable DMA memory in the SMMUs to the physical 36-bit range. You are
> > right that laptops with 64 GiB memory are essentially unusable in EL1
> > without disabling the physical memory outside the 36-bit range, but
> > applying this patch would make it even worse.
> > 
> > There are two separate cases:
> > 
> >   - For devices behind the SMMUv2, the situation should be the same as
> >     above. Increased IOVA space, but no effect on physical address range.
> >     This is what is currently causing crashes with 64 GiB RAM in EL1.
> > 
> >   - Devices behind the SMMUv3 (PCIe) do not have an IOMMU assigned when
> >     running in EL1. In this case, the 36-bit dma-ranges prevents PCIe
> >     devices from using memory outside the 36-bit range. They will fall
> >     back to bounce buffers in that case. Applying your patch will disable
> >     that, making it even more likely to crash than before.
> > 
> > Given that x1e80100.dtsi / hamoa.dtsi primarily models the EL1 setup
> > with Gunyah hypervisor, I don't think it makes sense to apply this patch
> > as-is. It will just make it even more likely to crash than before.
> > I suggest adding these overrides in x1-el2.dtso, with the expected
> > limited effect I described above.
> > 
> > Thanks,
> > Stephan
> > 
> 
> I am using EL2.
> 
> Without this patch, DMA buffers allocated in the upper 36-bit physical range
> will try to use bounce buffers. The dma range from the dts is compared
> against the physical address, not the virtual address.

I don't think this is the case for the dma-iommu layer. I debugged a
crash caused by USB in EL1 on a 64 GiB device earlier this year and it
was happily using buffers above the 36-bit physical range without using
bounce buffers. There is some code inside dma-iommu for using swiotlb,
but it's used only for "untrusted" PCI devices and some edge cases with
unaligned/small buffers.

> 
> The crash I see is display driver crashes/freezes once a buffer is allocated
> in the upper 36-bit range and it tries to use bounce buffers. This can
> happens very quickly under load.
> 

You could be right about the MSM display driver though, since that
bypasses dma-iommu and manages the IOMMU itself. I stared at the code a
bit and I'm not immediately seeing where it would end up calling into
swiotlb, but it might be hidden somewhere in the endless nesting.

> The same crash would happen for EL1 as well. I wasn't aware of the EL1
> broken firmware when I sent this patch, but instead of display freezing I
> guess the behavior would a hard reset now, which is a bit worse but still
> unusable unles display/gpu driver is disabled.
> 
> This patch is correct and should be applied regardless of broken-firmware
> EL1 cases (where 64GB isn't usable anyway), but I guess the Fixes tag
> can/should be dropped.
> 

Please clarify the commit message a bit and mention the two separate use
cases (EL1 and EL2). I'll leave it up to Bjorn/Konrad to decide whether
to merge it. At the end you are right and using 64 GiB RAM in EL1 is
kind of a lost cause anyway.

Thanks,
Stephan

