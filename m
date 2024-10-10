Return-Path: <linux-arm-msm+bounces-33810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2A0998115
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CBFA1C25FF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E841BDA83;
	Thu, 10 Oct 2024 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7jlUXNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05431B86DC;
	Thu, 10 Oct 2024 08:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728550371; cv=none; b=HtqzINxLVWGdhy7gD5xmPfMxiersXxwKna6YD8LNjIzqTZPayrhuS2qruf17E1QhHsE9Nitj/MUIqxBXeph7+BDvNlhBDLQ0MR0pc+Zz9rFnw1pnW3R/2MfweM09KhyqnDR2TIosVMH6qIHwIHEDyd6pn0UsmZ4ZpgPRf+knUDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728550371; c=relaxed/simple;
	bh=PKDQuDF1+TKUxRxHDwn/99UgykIjEZ8ANf4mtoAWawc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKe9XoyglfyVlmVqZFJMvS9nev/OuIgdIYFCf+jEdBGol/N8ZOCF4a4Hn8S5n4NtpvZPSDaqAbCkYMImiD1QuiSxr1bhkcOx3J/l84LU6oLPu0ingY4ys0cIpXhyz04OopKcjqadH23ZOim4FmBYaTji0SYA0356sHnPC1zZsnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7jlUXNG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C61AC4CEC5;
	Thu, 10 Oct 2024 08:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728550371;
	bh=PKDQuDF1+TKUxRxHDwn/99UgykIjEZ8ANf4mtoAWawc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E7jlUXNG0pDUT3IB/LubwoBqNPH0i0vjJdecWzkgrKz02lDfD6/1I/5z1ZDl2Jz+Z
	 YeWVa7R/yr3XzCwZM08JD2l0g8CbhsgfKqmlOb/rZa36WDjNvqT+C1gF0zTynOyths
	 B6c6z1zBfAiCbt3LUBqxiI6jhXROGBeN7q9YXQzwloV5356FFlHhUL9TbzPMzB+qIv
	 7benhOaGYc5ZYTXT/xwk+FRN3djgJH1zD6XyBzmNGVHEJrUWCNCCCLnCGKCtJAaZVy
	 rFWTuMaDj1sIv8oyLfAQ/zTrp9p0tNs0DLeL8tW/SX63f2P284Wi285KptkA+dSXNl
	 8/TmEyco1jWzQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syouk-000000006p4-30XG;
	Thu, 10 Oct 2024 10:52:55 +0200
Date: Thu, 10 Oct 2024 10:52:54 +0200
From: Johan Hovold <johan@kernel.org>
To: =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sc8280xp: Add Microsoft Surface
 Pro 9 5G
Message-ID: <ZweV5mcEWHofpF4J@hovoldconsulting.com>
References: <20240908223505.21011-1-jerome.debretagne@gmail.com>
 <20240908223505.21011-6-jerome.debretagne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240908223505.21011-6-jerome.debretagne@gmail.com>

On Mon, Sep 09, 2024 at 12:35:05AM +0200, Jérôme de Bretagne wrote:
> Add an initial devicetree for the Microsoft Surface Pro 9 5G, based
> on SC8280XP.
> 
> It enables the support for Wi-Fi, NVMe, the two USB Type-C ports,
> Bluetooth, 5G cellular modem, audio output (via Bluetooth headsets
> or USB audio), external display via DisplayPort over Type-C (only
> the bottom USB Type-C port is working so far), charging, the Surface
> Aggregator Module (SAM) to get keyboard and touchpad working with
> Surface Type Cover accessories.
> 
> Some key features not supported yet:
> - built-in display (but software fallback is working with efifb
>   when blacklisting the msm module)
> - built-in display touchscreen
> - external display with the top USB Type-C port
> - speakers and microphones
> - physical volume up and down keys
> - LID switch detection
> 
> This devicetree is based on the other SC8280XP ones, for the Lenovo
> ThinkPad X13s and the Qualcomm CRD.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>

> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Jérôme de Bretagne <jerome.debretagne@gmail.com>
> + */

You mention it in the commit message, but since a lot of this is copied
from the X13s (and CRD) devicetrees you should probably make that clear
here as well and include the relevant copyright notices. For example by
adding:

	Based on ...

	Copyright ...

Johan

