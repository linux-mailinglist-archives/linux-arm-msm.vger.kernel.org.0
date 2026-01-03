Return-Path: <linux-arm-msm+bounces-87315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB75CF0260
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 16:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B0FC30146DC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 15:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814E330F543;
	Sat,  3 Jan 2026 15:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQD04qg9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C43130E82C;
	Sat,  3 Jan 2026 15:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767455349; cv=none; b=feXq4L1lFGfRhemNtN7X6/Uq+/0hGXCvvejcaUO2lQEKuAnkY+lf0K9SCaAeHuvKvSA/f6sx6VpcusXkke2g1/OCdXZ+tYq9q3+9SzRSkHofogFcoqTOesInM575ONVSEkgJywwORHAhTB58E15OoXOcKh5Xhcc3ZP9uS39dhpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767455349; c=relaxed/simple;
	bh=VcgDlCqm7BzgAeykeG6jjqYd3SV6U+8fr3yJWmWlBNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LT6TuCq5GUeOkUAZLXbpdut6Xoc7wcK8Mcoex3T0Zp5n6xphk9s1aKqHDar7kZfFUWUCrQ8SSqBFvHXDUiqfY+mw47OfyaksMorLJXpkWpktBjWsGBrvBmc4zJsNOy6YgAj3OT1t0bohXcjD8hcKqNl8BVj0ADQPu7Wnj8rt2Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQD04qg9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3DCDC113D0;
	Sat,  3 Jan 2026 15:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767455348;
	bh=VcgDlCqm7BzgAeykeG6jjqYd3SV6U+8fr3yJWmWlBNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EQD04qg9fC5XRpXzk2UNUuqMQiiS/rPH0dbPJVqmDrnSbOj9YtmPXK6pSuqsgmUUY
	 eCwynVm6HQ0CrnPT/iiv5vBCgTZ6ORbbzojzNDjTg0ZkZCuHRGQLqhKS52BC9F4Rd3
	 Fb8hMS7PmLLFouCUKkgl1w4/p9rkgWl2vydokFkpO3MsbIWnI8mol6CCa6ZvD1obnH
	 mEKroxoKXTEBKHCK7Q894INrVzRmiPMGqpCKdwyGo6VBiraaAPaxX6jpvvWEkEJ79y
	 SU6M1A0Q+6+y+u/eDk8wbAHDjJSVTzW3jjV9m56S2Q6zAyprydgG5p40kB80Dsf9Oz
	 8stR9zG85XlRw==
Date: Sat, 3 Jan 2026 09:49:04 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	akhilpo@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com, 
	dikshita.agarwal@oss.qualcomm.com, robin.clark@oss.qualcomm.com, lumag@kernel.org, 
	linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: agatti: Address Gunyah memory
 alignment needs
Message-ID: <ahbbg3pffedrjzvksgz2jv7lwajwlcxc6nsmmtunwc4346eawa@xayff4ozvdbn>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <20251229071258.456254-2-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229071258.456254-2-sumit.garg@kernel.org>

On Mon, Dec 29, 2025 at 12:42:58PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Gunyah hypervisor requires it's memory start address to be 2MB aligned.
> So the address map for Agatti is updated to incorporate that requirement.
> This should be a backwards compatible DT change which should work with
> legacy QHEE based firmware stack too.
> 

How come this isn't conveyed to the operating system using the UEFI
memory map?

Regards,
Bjorn

> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/agatti.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
> index e705eb24160a..153916980ac0 100644
> --- a/arch/arm64/boot/dts/qcom/agatti.dtsi
> +++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
> @@ -298,8 +298,8 @@ reserved_memory: reserved-memory {
>  		#size-cells = <2>;
>  		ranges;
>  
> -		hyp_mem: hyp@45700000 {
> -			reg = <0x0 0x45700000 0x0 0x600000>;
> +		hyp_mem: hyp@45600000 {
> +			reg = <0x0 0x45600000 0x0 0x700000>;
>  			no-map;
>  		};
>  
> -- 
> 2.51.0
> 

