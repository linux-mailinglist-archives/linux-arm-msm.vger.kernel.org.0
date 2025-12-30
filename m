Return-Path: <linux-arm-msm+bounces-86906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A30CE8AF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 05:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDA793011EF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 04:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08F321767A;
	Tue, 30 Dec 2025 04:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROslzmbu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D29A932;
	Tue, 30 Dec 2025 04:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767070023; cv=none; b=dZyzG10UFxwM0tTUFKJ40PjVb/hDIr8SZwSmxVKne9eVvXQpoOecaH/SHqiTGTNgFTELPwIto5tPa7xhksnL8buWtPcMsk4o3ImraZB0UwhNUV5oCYKmrnVW4GCCVc/qTjn0X8EAvnH7F5Y6s6eS8nTVgdqNaCS/a/EuapCe48E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767070023; c=relaxed/simple;
	bh=u/3RTTP1Jd+5Desjj3DSysDSRju7/zCq0bRmgYZTkFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnVQJ51Lh9ILxzEqR7emK9ApASM3Z60psoCbJPTFWjWkhUz6mMxBzBSoL92KAp21N+nmqfrna8eq9l5c/LCOhKD+kb/nTU5bse/yfk1uIbGY3Me6XV5Wrt0BpCtU6b6ITgAwZRsDCnKUckT/Ep9p34wR2SaMqxuP1X3qbkrgJ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROslzmbu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E287C4CEFB;
	Tue, 30 Dec 2025 04:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767070023;
	bh=u/3RTTP1Jd+5Desjj3DSysDSRju7/zCq0bRmgYZTkFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ROslzmbuKPCwHROiiDQ9InD0isfLiP/XPhGSuUwgOFEFZ8QVupAggwEu4Q4oLjXwo
	 EqLIMUwbz8xn1xKP62v1MsGfhE9C86AqP+1WWgLci2jCnQOdw9cESRtQDglrZqiERC
	 bWSeOWz+AiPN8KZuXBSveYWNXeCovSH0879595oz9wyh8QuCQ0ty7mbhdKDsEPwNr9
	 o8IPk+HX+K1IqdUorfPvzmoLVGiaUAISqb4OcXS4J9/Xw22pWnzgq0YCyw2kzBZgaq
	 kh+hzRYaVOc3BOhGfeugAtwe4lSUaYPb1TOzBVMQLmjxs+o4weJDlQ6OqH00tS9Gj1
	 268n96mfZoISA==
Date: Tue, 30 Dec 2025 10:16:52 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com, lumag@kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: agatti: Address Gunyah memory
 alignment needs
Message-ID: <aVNZPOHHZn2U5N_R@sumit-xelite>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <20251229071258.456254-2-sumit.garg@kernel.org>
 <90264256-f53d-4a12-9b37-4cc43720c181@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90264256-f53d-4a12-9b37-4cc43720c181@oss.qualcomm.com>

On Mon, Dec 29, 2025 at 01:43:18PM +0100, Konrad Dybcio wrote:
> On 12/29/25 8:12 AM, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Gunyah hypervisor requires it's memory start address to be 2MB aligned.
> > So the address map for Agatti is updated to incorporate that requirement.
> > This should be a backwards compatible DT change which should work with
> > legacy QHEE based firmware stack too.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/agatti.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> > index e705eb24160a..153916980ac0 100644
> > --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> > @@ -298,8 +298,8 @@ reserved_memory: reserved-memory {
> >  		#size-cells = <2>;
> >  		ranges;
> >  
> > -		hyp_mem: hyp@45700000 {
> > -			reg = <0x0 0x45700000 0x0 0x600000>;
> > +		hyp_mem: hyp@45600000 {
> > +			reg = <0x0 0x45600000 0x0 0x700000>;
> 
> On a second thought, please add a comment like:
> 
> /* Gunyah requires the start of the region to be 2MiB-aligned, QHEE doesn't care */
> 
> to prevent someone "fixing" it in the future

Sounds reasonable, I will add this comment on the next spin. I hope that
I can keep you review tag with comment added.

-Sumit

