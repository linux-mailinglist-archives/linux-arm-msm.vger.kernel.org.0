Return-Path: <linux-arm-msm+bounces-87628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E53EBCF6CC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 06:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A9EE301226B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 05:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783972D879C;
	Tue,  6 Jan 2026 05:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxKDW8Rv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9243A1E63;
	Tue,  6 Jan 2026 05:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767678160; cv=none; b=gMPLh6ZiXgTnADRNgrO0hcIP3yMuFOSm75yotsR0oVEtxKKLm0WrCIxAnbP1rplCtRnoqrDEa/MpjK64F3ySlxw5puEfBpQl69qkLi6Ij4Ho8hw+QQjXVY5760KBsgjYkbMiOeC7d/UgOG5cMIqA8ubjXVys0I1to7/mibCrTK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767678160; c=relaxed/simple;
	bh=JlZNbeJxPbyqSgDhf5ecU8kIxyK4ObPwwBFJd3d1Kdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imBSZmiMNX5wpIaDOsX1p3paPyzdSqa59M4MXbGiSxyu1MRNTSPsIaFQg76HPWUse92X5ie0pIvWHVCmYjBTQVUI51mt69X3LPv7g2RVxSncZlCiZ2nJdDUdlJykFosrmhHfUCIWNBRQn1VdNrtVbUjd34SQDKyRUiRKmjC0GTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxKDW8Rv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904EBC116C6;
	Tue,  6 Jan 2026 05:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767678159;
	bh=JlZNbeJxPbyqSgDhf5ecU8kIxyK4ObPwwBFJd3d1Kdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JxKDW8Rvb4KHPmvJsUgd+VUFsQ3VJ4BB3AlQVjaGphgfxzBnPQdjIQYo+ZLuz8cri
	 ONP2/VKycando53Vovx4/JiNhrKE/wwSJRM+I5VeRY3NTFfjY739YIcwvwY29hvHYf
	 iRT0Ho8cShAkQhHWhjQFbFsfuKxdjAZ3WQGpein74WxW6QIaCcE43vEfh94NvORyXl
	 yb3lUwd30VsJ96lTX0ENMgR0uBZaooh4M2w1rFTftXJWbyPq+yJmyV5/PvD+AoAiw2
	 2iipwZ9II9QfSeEMmSE0XPzW9+enr1rVgk6Bf/vbm4Fys7NWGduHW1A0HRpSKzQO3p
	 p+mD8TUej4SkQ==
Date: Tue, 6 Jan 2026 11:12:30 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
	lumag@kernel.org, linux-kernel@vger.kernel.org,
	Prakash Gupta <guptap@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <aVygxoQ-vaKd4An6@sumit-xelite>
References: <20251229070712.456138-1-sumit.garg@oss.qualcomm.com>
 <CAGptzHOftKG_3h3KegrYuNiaDFCUHC8oS+eN2JyBDh=aRMod4g@mail.gmail.com>
 <5fdf6122-3c2b-44fb-b8ea-9e554208a56d@oss.qualcomm.com>
 <aVexkPYW0X6nWW9y@sumit-xelite>
 <bf62a6aa-fba7-4c95-b1e4-9da2528d0556@oss.qualcomm.com>
 <pfvgupbvbjfhzb2p7ejslpcfybnae72s2k7d4fcri3bskjys5n@el5cg42jo2yt>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pfvgupbvbjfhzb2p7ejslpcfybnae72s2k7d4fcri3bskjys5n@el5cg42jo2yt>

On Tue, Jan 06, 2026 at 04:38:43AM +0200, Dmitry Baryshkov wrote:
> On Mon, Jan 05, 2026 at 12:51:09PM +0530, Vikash Garodia wrote:
> > Hi Sumit,
> > 
> > On 1/2/2026 5:22 PM, Sumit Garg wrote:
> > > On Fri, Jan 02, 2026 at 03:32:57PM +0530, Vikash Garodia wrote:
> > > > 
> > > > On 12/29/2025 12:50 PM, Sumit Garg wrote:
> > > > > Hey Everyone,
> > > > > 
> > > > > On Mon, Dec 29, 2025 at 12:37 PM Sumit Garg <sumit.garg@oss.qualcomm.com> wrote:
> > > > > > 
> > > > > > Fix IOMMU DT propeties for GPU, display and video peripherals via
> > > > > > dropping SMMU stream IDs which relates to secure context bank.
> > > > > > 
> > > > > > This problem only surfaced when the Gunyah based firmware stack is
> > > > > > ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> > > > > > Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> > > > > > as a fault by Gunyah hypervisor which were previously ignored by QHEE
> > > > > > hypervisor.
> > > > > > 
> > > > > > The DT changes should be backwards compatible with legacy QHEE based
> > > > > > firmware stack too.
> > > > > > 
> > > > > > Suggested-by: Prakash Gupta <guptap@qti.qualcomm.com>
> > > > > > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > > > ---
> > > > > >    arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++--------
> > > > > >    1 file changed, 3 insertions(+), 8 deletions(-)
> > > > > > 
> > > > > 
> > > > > Looks like I messed up this patch-set with email delivery leading to
> > > > > non-delivery. I resent it properly again here [1]. Apologies for the
> > > > > noise.
> > > > > 
> > > > > [1] https://lore.kernel.org/lkml/20251229070712.456138-1-sumit.garg@oss.qualcomm.com/
> > > > > 
> > > > > -Sumit
> > > > > 
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> > > > > > index 8bf5c5583fc2..e705eb24160a 100644
> > > > > > --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> > > > > > @@ -1613,8 +1613,7 @@ gpu: gpu@5900000 {
> > > > > >                                            &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
> > > > > >                           interconnect-names = "gfx-mem";
> > > > > > 
> > > > > > -                       iommus = <&adreno_smmu 0 1>,
> > > > > > -                                <&adreno_smmu 2 0>;
> > > > > > +                       iommus = <&adreno_smmu 0 1>;
> > > > > >                           operating-points-v2 = <&gpu_opp_table>;
> > > > > >                           power-domains = <&rpmpd QCM2290_VDDCX>;
> > > > > >                           qcom,gmu = <&gmu_wrapper>;
> > > > > > @@ -1895,8 +1894,7 @@ mdss: display-subsystem@5e00000 {
> > > > > > 
> > > > > >                           power-domains = <&dispcc MDSS_GDSC>;
> > > > > > 
> > > > > > -                       iommus = <&apps_smmu 0x420 0x2>,
> > > > > > -                                <&apps_smmu 0x421 0x0>;
> > > > > > +                       iommus = <&apps_smmu 0x420 0x2>;
> > > > > >                           interconnects = <&mmrt_virt MASTER_MDP0 RPM_ALWAYS_TAG
> > > > > >                                            &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> > > > > >                                           <&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
> > > > > > @@ -2339,10 +2337,7 @@ venus: video-codec@5a00000 {
> > > > > > 
> > > > > >                           memory-region = <&pil_video_mem>;
> > > > > >                           iommus = <&apps_smmu 0x860 0x0>,
> > > > > > -                                <&apps_smmu 0x880 0x0>,
> > > > > > -                                <&apps_smmu 0x861 0x04>,
> > > > > > -                                <&apps_smmu 0x863 0x0>,
> > > > > > -                                <&apps_smmu 0x804 0xe0>;
> > > > > > +                                <&apps_smmu 0x880 0x0>;
> > > > 
> > > > Are you planning to update the binding [1] with this change ?
> > > 
> > > Yeah I am planning to update bindings as per changes posted here [1].
> > 
> > I tried a similar approach for the very same usecase [1], and what i learnt
> > is that we cannot describe a range of iommus given the fact that there is no
> > hardware which exist with *min* count of iommus interface. It is suppose to
> > be a fixed number of iommus interface, OR i interpreted it differently then
> > ?
> 
> You've interpreted it correctly. Sumit will need to drop the extra items
> from the corresponding iommus property definition.

Thanks for the heads up. I will follow this advice instead.

-Sumit

