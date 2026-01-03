Return-Path: <linux-arm-msm+bounces-87314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A88CF0230
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 16:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2981A3005A92
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 15:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B40A29E0FD;
	Sat,  3 Jan 2026 15:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0SyH5eB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA861C84A2;
	Sat,  3 Jan 2026 15:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767455042; cv=none; b=i35ovVZ+zeIiWPZRa2F0Yuce78jJnfq2Cdx7rRASq0riTpDakIZgZUNK9DDQ67W3k66YnA6Vf8ld6+e/M1dGW5XV/Va1+BwKqQtjLyl8q1diqCdUOYKLjfg6oVaO4wpBBjPW7RnW30xiu8fQvGLcRu7FtElmaEx2fUhVN7V59yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767455042; c=relaxed/simple;
	bh=+Qb/7FUE/DYg64KQEOy7zuSczsHbkmFiAelJmU6TDM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PyRpVkqVAK4jQtdsCJrpulMeMSiHlhH90DUVl8CP84yN7XG5rd5dsqcMszWaZzqpBB0GxYvH6H1bLNoPFEif/ITgyv+wEnk9Jq/n0pzg1sBtWBC3yGKuW3YDHOB6ssTfUdaNwUgh0Q2E0cz5pOVxRuwaGsHmD0HIPijsk8eYqF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0SyH5eB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8BDC113D0;
	Sat,  3 Jan 2026 15:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767455041;
	bh=+Qb/7FUE/DYg64KQEOy7zuSczsHbkmFiAelJmU6TDM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0SyH5eBIF+P3yYTR2xU30fASJi4f4VXVz/79wRbLPMXCQCciRPuG53QQDXB/Yelf
	 lMFNfpo0YLWdi/hNV4OjKjc1D+aft9huCvMnRJ7+sNLqcmft9QWxfMMnIGc4eOrS4g
	 Hz3KhGLHNlbBzCvefzEBbkAw3ifyIX4yrMiRHylAnEhKAdkJqYwamvspJKFyYygZhH
	 JuAjwLxCGT2TBkLseejZKsfOCfgKqNCahMB5XOxafhHHkQNtDdh2OgaQmS16csnatJ
	 bw/uAUOoSn+EYagyMhWu9em/OunzZh/yhxBKiNCMeU8FoXflYrSBkheSBbXUjvoULX
	 F8EajPxh2UrmQ==
Date: Sat, 3 Jan 2026 09:43:57 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	akhilpo@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com, 
	dikshita.agarwal@oss.qualcomm.com, robin.clark@oss.qualcomm.com, lumag@kernel.org, 
	linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	Prakash Gupta <guptap@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <ifhznj7eadfudzagfrroyfepkti7kkshwkqiboeqgcdpb6g342@2opxunddxcvn>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <bylruidduy2u4lsqlhzmohahgkm633hijffi3s2wt5ojeaotk3@awulzz2qdg7h>
 <aVNf-lZ1KcH3tRV_@sumit-xelite>
 <yudvagpfw3tfemvf3wcr62jrlvxfo5yobgsrzj4nechtqdxeu6@i2pfy4ys6qlj>
 <aVOFL3jmNrFNiYV0@sumit-xelite>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVOFL3jmNrFNiYV0@sumit-xelite>

On Tue, Dec 30, 2025 at 01:24:23PM +0530, Sumit Garg wrote:
> On Tue, Dec 30, 2025 at 09:05:28AM +0200, Dmitry Baryshkov wrote:
> > On Tue, Dec 30, 2025 at 10:45:38AM +0530, Sumit Garg wrote:
> > > On Mon, Dec 29, 2025 at 10:00:02PM +0200, Dmitry Baryshkov wrote:
> > > > On Mon, Dec 29, 2025 at 12:42:57PM +0530, Sumit Garg wrote:
> > > > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > > 
> > > > > Fix IOMMU DT propeties for GPU, display and video peripherals via
> > > > > dropping SMMU stream IDs which relates to secure context bank.
> > > > > 
> > > > > This problem only surfaced when the Gunyah based firmware stack is
> > > > > ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> > > > > Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> > > > > as a fault by Gunyah hypervisor which were previously ignored by QHEE
> > > > > hypervisor.
> > > > 
> > > > We are porting the underlaying layer. Can we make it to behave in a way
> > > > similar to the _existing_ software? If DT was a part of the firmware, it
> > > > would have been fine to perform such updates. But as it is not, we
> > > > really should try not to break the interface boundary between firmware
> > > > and the kernel.
> > > 
> > > I support your viewpoint. But in this current case Linux kernel VMID mapping
> > > for secure context bank stream IDs is incorrect. As Konrad mentioned in the
> > > other thread that for secure media streaming use-cases, it rather requires
> > > proper representation via iommu-map such that appropriate VMID can be mapped.
> > 
> > Yes, I understand this part. I'm basically suggesting that Gunyah should
> > ignore this SID when programming the actual SMMU (probably like QHEE
> > did).
> 
> TBH, I generally dislike as to why the firmware based hypervisor
> behaviour should be encoded in the DT.

The DeviceTree describes the world to the operating system. If there is
a hypervisor (or secure world, or other configuration) that is affecting
the (hardware or firmware) interfaces that needs to either be
discoverable at runtime, or represented in the description of those
interfaces.

> One can always argue that Gunyah
> is doing the right thing given the purpose of SMMU stream IDs. And if
> Gunyah has to change that behaviour since Agatti DT was based on QHEE
> behaviour then the same behaviour will get replicated on all other Qcom
> SoCs.
> 

Yes, you can see that mess in sdm845, sc7180, sc7280, and the various
*-el2.dtso; all cases where we need to describe the variations of the
hardware and firmware interfaces presented to the operating system.

> So, I would suggest that kernel should follow the expected behaviour
> which is to not program HLOS VMID for stream IDs dedicated for secure
> context bank.
> 

I agree. As discussed elsewhere, we might still need to manage the
secure context banks in some cases, but that needs special handling
anyways.

Moreover, it's two context banks (unsecure and secure), but the current
description defines a single context bank capturing both the unsecure
and secure streams.

Regards,
Bjorn

> > 
> > > 
> > > > 
> > > > I'm fine with the change, but I think we should make sure that Gunyah
> > > > doesn't break existing device trees.
> > > 
> > > Sure, this change isn't breaking any DT ABI but brings compliance to
> > > usage of stream IDs.
> > 
> > Actually, it does, as you can see from Rob's email. You didn't perform
> > make dtbs_check while submitting this patch.
> 
> Okay, I missed that. Looks like the GPU DT node already defined minItems
> for the iommus property but the others didn't. I will add following
> change in the next version to fix the warnings.
> 
> Irrespective on that, the DT forwards and backwards ABI compatibility is
> being maintained with the changes being proposed in this patch-set.
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> index f0cdb5422688..e5e62c5bab42 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> @@ -33,6 +33,7 @@ properties:
>        - const: core
> 
>    iommus:
> +    minItems: 1
>      maxItems: 2
> 
>    interconnects:
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> index 3f3ee82fc878..8d4371697867 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -42,6 +42,7 @@ properties:
>        - const: vcodec0_bus
> 
>    iommus:
> +    minItems: 2
>      maxItems: 5
> 
>    interconnects:
> 
> -Sumit

