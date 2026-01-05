Return-Path: <linux-arm-msm+bounces-87373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA4FCF210C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 07:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5281B30078B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 06:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388F2326D4B;
	Mon,  5 Jan 2026 06:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6EyX6/q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA8632694E;
	Mon,  5 Jan 2026 06:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767594432; cv=none; b=Z0uZuXuRXZ52/m+jvGswpu8puFhnuhQpnLba5+nekGGmjnz1Xa93wl4tCuloAYO5yl9jN4xVb5INHJINF4fYzoKWGh35P/cXYp9mXEmfi7jVBzzWX4Mt5MvIP/32Zflaq13T2Dyr/we9AxK1XMVVmRgWibKWRmr6FTbtEr2Ay4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767594432; c=relaxed/simple;
	bh=Qnh+2Z3mSy71aiRj1J6e5j+Utwtd5W10fH03zq68wYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bTGkpXrKZJbnCizXE0wHvwSVOKiIUx0MWz9CmBrhLql9r17qLXcQtPBgUYuYp69O57R9oTtwf5qBSt6W3IAEphP4fKqLeZRpQUwrdbclwz4XM+rEy0QrDUQQTXDTStcpCXHwc2XTch9blOqKOfJNXrqJYG7xiS51HGjriTWEFhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q6EyX6/q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC526C116D0;
	Mon,  5 Jan 2026 06:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767594431;
	bh=Qnh+2Z3mSy71aiRj1J6e5j+Utwtd5W10fH03zq68wYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q6EyX6/q5Z5GY5MArq1EovLIfd0vg/ZTNIVj1Z/Act4DkjcxpXs5413RLJyEAuwpA
	 /irYVIg0OkHZaY4ujpEShFDStr0kUCQBBws0GLN0qtiHJSdcAfVqMNlgT51RMIIHi0
	 gOXVXDom9NZWW5ohJbuLFwJtamE5mDCUcXxCW/fpO8nhPv1F0fh5Xrw6Lsbrk9grO5
	 j7+2uqiXS8Dg5cbOV0SL2+eRrtJdqeqJn9BQ+t9cMDi7TqwTFzDGLOdJ2wvGrbMP6W
	 34DQ60PuZzgRR2zOd77MRKOhMHBygdjAolNcI+PLdHQGh/F2UqPp5KBNddDkfY58GL
	 GMD7ihOThAIxg==
Date: Mon, 5 Jan 2026 11:57:02 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com, lumag@kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Prakash Gupta <guptap@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <aVtZtoHzLNP4gmDz@sumit-xelite>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <bylruidduy2u4lsqlhzmohahgkm633hijffi3s2wt5ojeaotk3@awulzz2qdg7h>
 <aVNf-lZ1KcH3tRV_@sumit-xelite>
 <yudvagpfw3tfemvf3wcr62jrlvxfo5yobgsrzj4nechtqdxeu6@i2pfy4ys6qlj>
 <aVOFL3jmNrFNiYV0@sumit-xelite>
 <ifhznj7eadfudzagfrroyfepkti7kkshwkqiboeqgcdpb6g342@2opxunddxcvn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ifhznj7eadfudzagfrroyfepkti7kkshwkqiboeqgcdpb6g342@2opxunddxcvn>

On Sat, Jan 03, 2026 at 09:43:57AM -0600, Bjorn Andersson wrote:
> On Tue, Dec 30, 2025 at 01:24:23PM +0530, Sumit Garg wrote:
> > On Tue, Dec 30, 2025 at 09:05:28AM +0200, Dmitry Baryshkov wrote:
> > > On Tue, Dec 30, 2025 at 10:45:38AM +0530, Sumit Garg wrote:
> > > > On Mon, Dec 29, 2025 at 10:00:02PM +0200, Dmitry Baryshkov wrote:
> > > > > On Mon, Dec 29, 2025 at 12:42:57PM +0530, Sumit Garg wrote:
> > > > > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > > > 
> > > > > > Fix IOMMU DT propeties for GPU, display and video peripherals via
> > > > > > dropping SMMU stream IDs which relates to secure context bank.
> > > > > > 
> > > > > > This problem only surfaced when the Gunyah based firmware stack is
> > > > > > ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> > > > > > Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> > > > > > as a fault by Gunyah hypervisor which were previously ignored by QHEE
> > > > > > hypervisor.
> > > > > 
> > > > > We are porting the underlaying layer. Can we make it to behave in a way
> > > > > similar to the _existing_ software? If DT was a part of the firmware, it
> > > > > would have been fine to perform such updates. But as it is not, we
> > > > > really should try not to break the interface boundary between firmware
> > > > > and the kernel.
> > > > 
> > > > I support your viewpoint. But in this current case Linux kernel VMID mapping
> > > > for secure context bank stream IDs is incorrect. As Konrad mentioned in the
> > > > other thread that for secure media streaming use-cases, it rather requires
> > > > proper representation via iommu-map such that appropriate VMID can be mapped.
> > > 
> > > Yes, I understand this part. I'm basically suggesting that Gunyah should
> > > ignore this SID when programming the actual SMMU (probably like QHEE
> > > did).
> > 
> > TBH, I generally dislike as to why the firmware based hypervisor
> > behaviour should be encoded in the DT.
> 
> The DeviceTree describes the world to the operating system. If there is
> a hypervisor (or secure world, or other configuration) that is affecting
> the (hardware or firmware) interfaces that needs to either be
> discoverable at runtime, or represented in the description of those
> interfaces.

I would always favour discoverable firmware interfaces like EFI or
TEE/TZ based interfaces rather than encoding such information in the DT.

> 
> > One can always argue that Gunyah
> > is doing the right thing given the purpose of SMMU stream IDs. And if
> > Gunyah has to change that behaviour since Agatti DT was based on QHEE
> > behaviour then the same behaviour will get replicated on all other Qcom
> > SoCs.
> > 
> 
> Yes, you can see that mess in sdm845, sc7180, sc7280, and the various
> *-el2.dtso; all cases where we need to describe the variations of the
> hardware and firmware interfaces presented to the operating system.

AFAIU, the major problem here is that the DT for Qcom platforms is a subset
of the hardware information for the OS to initially only run at non-secure
EL1. Then came in requirment that we need to run Linux at EL2 for which
the information wasn't there in DT leading to this *-el2.dtso mess.

I would rather like to see the DT descibing the overall hardware
applicable to the apps processor rather than a subset such that the TZ,
Hypervisor and the kernel can consume the same DT based on ownership
hints.

I suppose the Qcom IOMMU driver can be the first one to consume such DT
information based on the hints. However, this is something which is out
of scope for this patch-set which tries to fix DT as per existing
expectations.

> 
> > So, I would suggest that kernel should follow the expected behaviour
> > which is to not program HLOS VMID for stream IDs dedicated for secure
> > context bank.
> > 
> 
> I agree. As discussed elsewhere, we might still need to manage the
> secure context banks in some cases, but that needs special handling
> anyways.
> 
> Moreover, it's two context banks (unsecure and secure), but the current
> description defines a single context bank capturing both the unsecure
> and secure streams.

Agree, I will spin up a v2 with DT bindings changes.

-Sumit

