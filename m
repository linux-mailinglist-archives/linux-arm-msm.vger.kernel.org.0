Return-Path: <linux-arm-msm+bounces-88714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F73D17870
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C874C300F712
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDB53876B6;
	Tue, 13 Jan 2026 09:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="WC7rerhI";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XG7E5Q9x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AEC38734E;
	Tue, 13 Jan 2026 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295534; cv=none; b=NSVy1aJeqU67rzpt0NjLipoLHvnUa/3KEX2xWMDp70RefX6/+GddEP3CelcFSGhQaRLbdzrpjd/+pcTmvOK3yagifKP4xdUSqv8a4CwjMpjF4gitFZjiT5qLgGs37tAkdIrqfs6UAUdAcEVwTqVl2v1FTWYhT2rr3JpPES80zWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295534; c=relaxed/simple;
	bh=m3ychiShAUDQeqOBK3PpZD916F/6LgVyDIhGrvwarbk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=czm/uFmanMMUydzlnPCw6FwawqwBIAatlsgCG69PefFQlC4Np9lLF9igvYJhASSvosbQu1utaUyXnXrl3B6qTYdtqaVomJSrOBZoyZnzpuYexerVVqqtiGPHzdfjGeP220i04flFdEnKzuigO6AJs5mBjK8qkUua+Gmw+ZIx8Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=WC7rerhI; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XG7E5Q9x; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768295507; bh=/98sDYoJZm616lh2eOtBec3
	ni4G5LscXCpTkPClp1L0=; b=WC7rerhIrByCHl/ZTz5gCXbMG/J3SxbJDMfDmHRbzgHjaotrkV
	SVQ0LxidKGdeln06375qltD/t367U8Rb1dH1EIxP59whWO0P2cp9I1DkvaSp8+HqyvscRcSq8oi
	MuIh3FUV7egBL8J7jU/fwhyWTWdo0PvjPtt9YCU5wP+JB0FWUaJxd7lIThBLXvLsmFxvnJCG4Ca
	nIKsNuMfbpyY3L9VBOqs0hDOZxsCTbE30cAWqyY1TtzGm2YrNF8aPDIISOpzFt2IVHV4nWjhbzi
	ibspxx/hqincHmXkBnUxKAFleenfkSyQWWls5Q1XlXjTonl1BFCxZXItfQ7wyLW42Rg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1768295507; bh=/98sDYoJZm616lh2eOtBec3
	ni4G5LscXCpTkPClp1L0=; b=XG7E5Q9x/bHTWjojo558/ieSuKM60pbYubh0J6+JKY0EdAVUL7
	shcV2Fd4JxFjayQiSwrdk7M9/e3xGYqYfwDw==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 13 Jan 2026 10:11:47 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales
 <semfault@disroot.org>, Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
In-Reply-To: <57ddf3a4-8e4a-4072-828a-9145f1f30d12@oss.qualcomm.com>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-3-8e4476897638@mainlining.org>
 <57ddf3a4-8e4a-4072-828a-9145f1f30d12@oss.qualcomm.com>
Message-ID: <9063644cebbd401057533ff11df3c9c1@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-13 10:00, Konrad Dybcio wrote:
> On 1/12/26 9:13 PM, Barnabás Czémán wrote:
>> GPIO pin 102 is related to DisplayPort what is not supported
>> by this device and it is also disabled at downstream,
>> remove the unnecessary extcon-usb node.
> 
> If you put the phone in fastboot, and connect a USB3-capable type-C
> cable (making sure that it's not a fake one, usb3 ones are noticeably
> thicker), does it show up as a SuperSpeed device?
No, only high speed is supported, and qmp_phy was changed to nop_phy at 
downstream.
https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/ginkgo-p-oss/arch/arm64/boot/dts/qcom/trinket-usb.dtsi#L99
https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/ginkgo-p-oss/arch/arm64/boot/dts/qcom/trinket-usb.dtsi#L89

> 
> Konrad

