Return-Path: <linux-arm-msm+bounces-37553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA19C4FB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 08:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9ECFB2417F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 07:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA5E20B81A;
	Tue, 12 Nov 2024 07:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ET+3KMnX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A33B20B80E;
	Tue, 12 Nov 2024 07:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731397176; cv=none; b=nDwhZuinxTtTIl193Bg1+cVwYuwvhdMUBbfR8FqHhEuPP9olgfIN2hPyioKU0dUkMeQs5ii1t8/EzIuRunzdt7kiUVgFhIppmZVx1PmlfzdkVtVn9rtFxPEfNUZC373vMcSJpMVaxLZZGED1Iq59C1lP8sPWciTW210WQk+meFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731397176; c=relaxed/simple;
	bh=X861bD9yTjKInD07veeFX3rxfysmySwUT9SifqyILM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXryHUFTsEf4Rsp2BqBd9Sdq87c64EpQKTFQi2CdAkq63VqPhMVlgUfB4AGi5clJelK+TqQsY6NFN3cJXC+hZBMCSIQy5CjUs4ZfCq/OBRdW/Kz00cLDZsZlU+AUeZGDiKpXaCCaZOeWjALfzWJwxzs0RftzLXgFikoBLacmo4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ET+3KMnX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFDB0C4CED7;
	Tue, 12 Nov 2024 07:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731397174;
	bh=X861bD9yTjKInD07veeFX3rxfysmySwUT9SifqyILM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ET+3KMnXsrc+/JFu8DwTeyKqr4nB27ZixC42quwtxF6YPWvSxQmYmj007hhO8CSU7
	 08d2tHemusqb6PPMXOrWE//dmSncFN97z6ynMmR/jM9+wVUuYy0VhmUHuyIdiR23mS
	 4J3HHFDYpo2l8IRIpu/l2wYd0K9Mb6/JARtPuHq+8F0UO9TEHJNrZIc+a1h1hLFRVm
	 UoADCIG3VJkFz0g4kEDv5ehZJYWQsmZZHWe+bHvFLywVH5009eiNMIkRouUmBvvJnk
	 sSWVSctQzVgfZeTyhp03dBbjI9Yu3aVkfTZ/xNNldPDtPZfpDOMTF3vbj7vcPipFvS
	 Gg64m6isF53Tw==
Date: Tue, 12 Nov 2024 13:09:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: rich hathaway <kcphonestores@gmail.com>, Duke.xin@quectel.com,
	mani@kernel.org, loic.poulain@linaro.org, dnlplm@gmail.com,
	yonglin.tan@outlook.com, fabio.porcedda@gmail.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	inux-kernel@vger.kernel.org, jerry.meng@quectel.com
Subject: Re: Hi
Message-ID: <20241112073921.6n2e2t3wpkkrazgm@thinkpad>
References: <CANzkbjEcKMMdUgX8fSvKEKfHPpg1mGaeSQG5Xg+LFZnMhMPWoQ@mail.gmail.com>
 <cafd283.f64.1930956a9dd.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cafd283.f64.1930956a9dd.Coremail.slark_xiao@163.com>

On Fri, Nov 08, 2024 at 09:14:54AM +0800, Slark Xiao wrote:
> 
> 
> Hi,
> What's you met now?
> I have this file but I have to know what's your problem.
> If device mismatch and this may lead your device to un-bootable.
> BTW, I share this file to Mani for upstreaming to linux-firmware. Do you ever search it
> in that project?
> 

Slark, I haven't upstreamed it yet as I need to confirm the license
compatibility. If you want, you can send it to Rich directly.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

