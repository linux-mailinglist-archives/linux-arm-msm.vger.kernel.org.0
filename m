Return-Path: <linux-arm-msm+bounces-86907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 179BBCE8B4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 06:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC7D93011F8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 05:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7D7212FB9;
	Tue, 30 Dec 2025 05:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fy5oi7yK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEB8946C;
	Tue, 30 Dec 2025 05:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767071747; cv=none; b=kM3cG6MV6w5lNzRLEPnuPTXkAUJ7OIvrQi1LPiDQeHpXiA5tyykaFyZHjQ9tmkMHShvlfM/9JpevPYBojOE2jcelhDkC+6j9hKuPx/qabC9NKj91FoIye2L5F2d41L9QVq68E7ohT+kNn2FtAgZZQkihNUwpz6gAKRGXCmzwmYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767071747; c=relaxed/simple;
	bh=rpT15WVPV5Ou8AwElsEDCPmyZx8PQRmeRXBovCMK6fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVo/b5feFy3w8di6ToxeunpSVMKksVd+FMwJI+byrQm6VLE0A+4aHxqKpiBj1LYJKoB+8NXBeIBvHhvm/SPrwNTMknYLRqWBQAbpHw1ZEl4aWgJ7QMPV7hElbWv8q/tgf50klpNU6EbkDk7W88BLXOHugOVng8zvCfsuJFOtyYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fy5oi7yK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76801C4CEFB;
	Tue, 30 Dec 2025 05:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767071746;
	bh=rpT15WVPV5Ou8AwElsEDCPmyZx8PQRmeRXBovCMK6fA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fy5oi7yKNPmcDE6EqdH+2JTN1eJFYdy1gMyq+R8XmEbhl+pKm5+YEomt4WYpdy85a
	 lemK2uxfLzqa6euGHgUiheFYRGQjM1uZye803H5Vtb60dLe3fRjA0qZxJL/sxzxQia
	 o0u8wqfSbGNg4mn+PpQW1UArob3kKSdAKZAVZl4x+ElVWvyySbgIqZojAH41xBNlCE
	 WIyvVuuMUW0QVKQ+eb2gLNYs6oKKjpX1ZUqaVei708VW/6C+oojnZIj68v7cOOQlpT
	 D2Gx11Ltz4PmUEY2Tc9PmuuGo8yE258IdPrK1c1VsLaarqeO502+NCMBTmwHUyRd75
	 SNsgUQdyvspcA==
Date: Tue, 30 Dec 2025 10:45:38 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com, lumag@kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Prakash Gupta <guptap@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: agatti: Fix IOMMU DT properties
Message-ID: <aVNf-lZ1KcH3tRV_@sumit-xelite>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <bylruidduy2u4lsqlhzmohahgkm633hijffi3s2wt5ojeaotk3@awulzz2qdg7h>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bylruidduy2u4lsqlhzmohahgkm633hijffi3s2wt5ojeaotk3@awulzz2qdg7h>

On Mon, Dec 29, 2025 at 10:00:02PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 29, 2025 at 12:42:57PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Fix IOMMU DT propeties for GPU, display and video peripherals via
> > dropping SMMU stream IDs which relates to secure context bank.
> > 
> > This problem only surfaced when the Gunyah based firmware stack is
> > ported on Agatti replacing the legacy QHEE based firmware stack. Assigning
> > Linux kernel (HLOS) VMID to secure context bank stream IDs is treated
> > as a fault by Gunyah hypervisor which were previously ignored by QHEE
> > hypervisor.
> 
> We are porting the underlaying layer. Can we make it to behave in a way
> similar to the _existing_ software? If DT was a part of the firmware, it
> would have been fine to perform such updates. But as it is not, we
> really should try not to break the interface boundary between firmware
> and the kernel.

I support your viewpoint. But in this current case Linux kernel VMID mapping
for secure context bank stream IDs is incorrect. As Konrad mentioned in the
other thread that for secure media streaming use-cases, it rather requires
proper representation via iommu-map such that appropriate VMID can be mapped.

> 
> I'm fine with the change, but I think we should make sure that Gunyah
> doesn't break existing device trees.

Sure, this change isn't breaking any DT ABI but brings compliance to
usage of stream IDs.

-Sumit

> 
> > 
> > The DT changes should be backwards compatible with legacy QHEE based
> > firmware stack too.
> > 
> > Suggested-by: Prakash Gupta <guptap@qti.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/agatti.dtsi | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> > 
> 
> -- 
> With best wishes
> Dmitry
> 

