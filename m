Return-Path: <linux-arm-msm+bounces-88953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAE8D1D643
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9148D300533A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 09:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD013806B2;
	Wed, 14 Jan 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3SNn7HP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068CE37F0E9;
	Wed, 14 Jan 2026 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768381859; cv=none; b=p8s6cw+qp9BrfRkwo2G9Khs7xHlJJ8Nya/i42i5/jNdlz40cfsp28xG6+qoSJ+yzQ+lJssZFaLqs3XjWyZoFPRZ/hj07V1oN3g/XVF6l6ftkWl47B8wfaFSFGXviUk+6ES3E86j92qkgRf+2M+78Ws+IgD885xDIx4Fo3Hh36FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768381859; c=relaxed/simple;
	bh=kYtFUbSJr+CvmlzGiUmuhqtRPSfSYXgCjCGTdNmNzDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmpLr7Ucb5Obl7sm80ZuBupk43ItWRozxadSwC0g/rLqZ5A9Nxpfd49tGjz3C9m9VGDpXiuFxbsv0Wj1pTMWQoPtQQ2bIRbTxY9xr7iIt0WVRtq/I4pTVUk70y26u99FchufJ6w4MQo9k3bZ38PdBGgaFAq9dmSn5Uek5vvjQc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3SNn7HP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FF9C4CEF7;
	Wed, 14 Jan 2026 09:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768381858;
	bh=kYtFUbSJr+CvmlzGiUmuhqtRPSfSYXgCjCGTdNmNzDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3SNn7HPVEJvVsSTAwfGPi4tLLTjgj/JGDywxM6Y+fcV0IvWNiJ+nJrx+OXN8YguE
	 oeSk5PXc++8gdoF47fQYcQFxA26JOPV6e/0fPqlRByvl5KEq/8c7/cit21e9mIX30Y
	 yc52Jl/OsCbb4dW/rV7UZmLbIc+v832TBCSmMeuzP1dPnty7tWVwfFpR8Vb6OCJq0t
	 B0N9MYp8D14tHU9JFhaXK5jC4hlMS9wX6XYnaw7rr8H7iUDkHkOlVl8gtxQB98hGEl
	 AdHUFyCiYeiOZCWl4n2Kkl2/zP1llVfp1x3nyeDvdxsmFLyqNQR9Be/xjTSIRqH06D
	 ArkPRObr5Sx/A==
Date: Wed, 14 Jan 2026 10:10:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Biswapriyo Nath <nathbappai@gmail.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix msm-id
 and remove board-id
Message-ID: <20260114-impossible-cherry-crow-18349d@quoll>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-1-8e4476897638@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260112-xiaomi-willow-v1-1-8e4476897638@mainlining.org>

On Mon, Jan 12, 2026 at 09:13:24PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Correct msm-id what should contain the version 0x10000 and remove
> board-id it is not necessary for the bootloader.

Separate commits and just pull in my earlier patch adding on top removal
of msm-id:
https://lore.kernel.org/all/20251229142806.241088-2-krzysztof.kozlowski@oss=
=2Equalcomm.com/


Best regards,
Krzysztof


