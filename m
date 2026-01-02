Return-Path: <linux-arm-msm+bounces-87226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF24ECEE6CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A6E93011753
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DFE2E03EA;
	Fri,  2 Jan 2026 11:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXK0p0qp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2E51E7C03;
	Fri,  2 Jan 2026 11:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767354778; cv=none; b=fYW3OFfubwSeQtuB0ZiJd0JzWiBWvQCtzA/yAz08KjtKtReyzi/mtHDR8jHDdfrparq9pvAcj/CR6vpp61geBk0LQLW3rQ38TaYOU9151QAlzs+8GTA0RRBQ56CDAdVGthnWfBquIEdWFn9uAxbasLvoJbJbABz3wRCUoE1KniI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767354778; c=relaxed/simple;
	bh=QFheMww5TjnnzCFdxdLA8Dv7k1svTalCf7UE6tAaq8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnylUaMsjIPrDHXCtIoUNBIsXHeqrSPATfbGAqCSfFBbzLGLVgmXTd5MZCXCgU/TYD87Pbu0fZDVaeou0R2l+ONfNxpCh5x0UjPR1MRRTQfOOshZMNf6M6v/M4CgcjiLrBMFbdrJBUFgxAYyYmYzvICWUelVQ9lWqcyLgifSKp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXK0p0qp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2794AC116B1;
	Fri,  2 Jan 2026 11:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767354778;
	bh=QFheMww5TjnnzCFdxdLA8Dv7k1svTalCf7UE6tAaq8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YXK0p0qpGp/9VOUft1JJ6y5lNLaaRv3N8+bTMouRgHVcfx19p/RxAJADEdyS09yv1
	 hjakceP/xoi+fCX5BWGXeTgU1fktXJFpUxd6HiOW+muudKXwWX/TdUUH0dkOcdzDaV
	 /9DjsGDWyhj1wyueCUcsbym2uYE5g+/D8yuTvrQAO7uWdFh6HuiPgtKjVs8bU7364U
	 154My5U4edIyTx2kZQih1Ga+pupgc4AGDXdYDBRAQXAR873EJ8fxGC9hwxXPbb/1lr
	 +VpCDNGxaBt+spfchg3HiOR0Aww3Xy0T12GJ7HeNWSKRXtWM46ckN3hM24OYpuYNeX
	 lKiTLrxxK261w==
Date: Fri, 2 Jan 2026 17:22:48 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
	lumag@kernel.org, linux-kernel@vger.kernel.org,
	Prakash Gupta <guptap@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <aVexkPYW0X6nWW9y@sumit-xelite>
References: <20251229070712.456138-1-sumit.garg@oss.qualcomm.com>
 <CAGptzHOftKG_3h3KegrYuNiaDFCUHC8oS+eN2JyBDh=aRMod4g@mail.gmail.com>
 <5fdf6122-3c2b-44fb-b8ea-9e554208a56d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fdf6122-3c2b-44fb-b8ea-9e554208a56d@oss.qualcomm.com>

On Fri, Jan 02, 2026 at 03:32:57PM +0530, Vikash Garodia wrote:
> 
> On 12/29/2025 12:50 PM, Sumit Garg wrote:
> > Hey Everyone,
> > 
> > On Mon, Dec 29, 2025 at 12:37 PM Sumit Garg <sumit.garg@oss.qualcomm.com> wrote:
> > > 
> > > Fix IOMMU DT propeties for GPU, display and video peripherals via
> > > dropping SMMU stream IDs which relates to secure context bank.
> > > 
> > > This problem only surfaced when the Gunyah based firmware stack is
> > > ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> > > Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> > > as a fault by Gunyah hypervisor which were previously ignored by QHEE
> > > hypervisor.
> > > 
> > > The DT changes should be backwards compatible with legacy QHEE based
> > > firmware stack too.
> > > 
> > > Suggested-by: Prakash Gupta <guptap@qti.qualcomm.com>
> > > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++--------
> > >   1 file changed, 3 insertions(+), 8 deletions(-)
> > > 
> > 
> > Looks like I messed up this patch-set with email delivery leading to
> > non-delivery. I resent it properly again here [1]. Apologies for the
> > noise.
> > 
> > [1] https://lore.kernel.org/lkml/20251229070712.456138-1-sumit.garg@oss.qualcomm.com/
> > 
> > -Sumit
> > 
> > > diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> > > index 8bf5c5583fc2..e705eb24160a 100644
> > > --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> > > @@ -1613,8 +1613,7 @@ gpu: gpu@5900000 {
> > >                                           &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
> > >                          interconnect-names = "gfx-mem";
> > > 
> > > -                       iommus = <&adreno_smmu 0 1>,
> > > -                                <&adreno_smmu 2 0>;
> > > +                       iommus = <&adreno_smmu 0 1>;
> > >                          operating-points-v2 = <&gpu_opp_table>;
> > >                          power-domains = <&rpmpd QCM2290_VDDCX>;
> > >                          qcom,gmu = <&gmu_wrapper>;
> > > @@ -1895,8 +1894,7 @@ mdss: display-subsystem@5e00000 {
> > > 
> > >                          power-domains = <&dispcc MDSS_GDSC>;
> > > 
> > > -                       iommus = <&apps_smmu 0x420 0x2>,
> > > -                                <&apps_smmu 0x421 0x0>;
> > > +                       iommus = <&apps_smmu 0x420 0x2>;
> > >                          interconnects = <&mmrt_virt MASTER_MDP0 RPM_ALWAYS_TAG
> > >                                           &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> > >                                          <&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
> > > @@ -2339,10 +2337,7 @@ venus: video-codec@5a00000 {
> > > 
> > >                          memory-region = <&pil_video_mem>;
> > >                          iommus = <&apps_smmu 0x860 0x0>,
> > > -                                <&apps_smmu 0x880 0x0>,
> > > -                                <&apps_smmu 0x861 0x04>,
> > > -                                <&apps_smmu 0x863 0x0>,
> > > -                                <&apps_smmu 0x804 0xe0>;
> > > +                                <&apps_smmu 0x880 0x0>;
> 
> Are you planning to update the binding [1] with this change ?

Yeah I am planning to update bindings as per changes posted here [1].

> If so, how to
> handle the case of iommus for gunyah based vs non-gunyah based ?

Currently Agatti doesn't have any support for Linux running in EL2. This
patch-set is just trying to enable Gunyah based stack.

[1] https://lore.kernel.org/all/aVOFL3jmNrFNiYV0@sumit-xelite/

-Sumit

