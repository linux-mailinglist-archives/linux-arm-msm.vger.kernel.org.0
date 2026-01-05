Return-Path: <linux-arm-msm+bounces-87369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAEECF205A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 06:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A15A3005A91
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 05:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C27D1C68F;
	Mon,  5 Jan 2026 05:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nDBe6ptc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F213A1E69;
	Mon,  5 Jan 2026 05:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767591974; cv=none; b=IyTDRsYbeHpLwbw4vHVo5UtD/X0FM8Jv30QwioEhte9b89YYyDHayCWVFgIdceaZ/VVPvNnoosrr0/5w5+HgHYH5dSzpN7rLiB/kqamIN0RCm8PXvVnQUZRyjoj+E6ey961/NUdNfWRtpJZSb1n8uIYrym7JUjg5ZC4tqP9Eqt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767591974; c=relaxed/simple;
	bh=a78SIV7Ayp+rZDU5/fJStz+klUrrOsHwW9J5EUR/Gn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mE/r8z8f+XqipqoH3xuczBTjTAW9jaiqZeFkxZiLpulErJXkGI9twSb5B7WXWbPOKxHJ8ycXJxJ4h2hFeiLzf3VgZMENQOcmRaKfIiqLwVwbqUGrtZZmiRlRnUHYsKPMxrB3xD//Q9Gb90tRkljj+dGWSgUJ1sQjfYi4gSFAw9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDBe6ptc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17BEC116D0;
	Mon,  5 Jan 2026 05:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767591973;
	bh=a78SIV7Ayp+rZDU5/fJStz+klUrrOsHwW9J5EUR/Gn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDBe6ptcQn3q8BQfvI6pM7/C+9p4AhfZYwswZ61yvacqRO8IMcxzbzDs3AGyQwK3z
	 kMz8cFUUhnDRoLMPsW6YcOquDmh6ipzdzAJjelG9oKA4oKcD8MsSpxvLeP6L8++lVN
	 qrV+uId2tmJBfdeQIHUERDNKFRtVrMnUEpHtLJ0aZrmm+ECU8l2GdJzZt67+NVdM7L
	 RZSTUOQSAft1pP3rOTDvbAwtGyOFQuU5f5YzEHjoo9d1cABPdLourhLJK8y3bRsGIC
	 kI4zNoFGGsWEApbS7nfJM/NNK3n8AO4wBe8Bm0G5K2/uzBGFQEHipvLgWf8x1ZsG3s
	 aHgd0ika5m4UQ==
Date: Mon, 5 Jan 2026 11:16:05 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com, lumag@kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: agatti: Address Gunyah memory
 alignment needs
Message-ID: <aVtQHftDmENIAxrb@sumit-xelite>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <20251229071258.456254-2-sumit.garg@kernel.org>
 <ahbbg3pffedrjzvksgz2jv7lwajwlcxc6nsmmtunwc4346eawa@xayff4ozvdbn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahbbg3pffedrjzvksgz2jv7lwajwlcxc6nsmmtunwc4346eawa@xayff4ozvdbn>

On Sat, Jan 03, 2026 at 09:49:04AM -0600, Bjorn Andersson wrote:
> On Mon, Dec 29, 2025 at 12:42:58PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Gunyah hypervisor requires it's memory start address to be 2MB aligned.
> > So the address map for Agatti is updated to incorporate that requirement.
> > This should be a backwards compatible DT change which should work with
> > legacy QHEE based firmware stack too.
> > 
> 
> How come this isn't conveyed to the operating system using the UEFI
> memory map?
> 

I agree that with EFI boot, the information is getting conveyed via EFI
memory map. But there will be non-EFI boot scenarios as well in case of
U-Boot. And moreover I suppose we need to keep the reserved memory
ranges in DT updated to reflect the actual memory map.

-Sumit

