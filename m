Return-Path: <linux-arm-msm+bounces-82053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DD3C62B24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 08:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDD903AC879
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 07:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1870630DEBD;
	Mon, 17 Nov 2025 07:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8JqdQUj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6D621E091;
	Mon, 17 Nov 2025 07:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763363873; cv=none; b=q5mufaoeL1sUn0b58nNCWqlGJfv86ACsU95u0i3+k98mIuKxa55U7zeCCahUct32qR6lcK8g2jlb3zw5+al2vyFwPvIqTQ5ikTI+JwJeOuQDvfBnKA6+HfrcQp9akSwvwwVwMavuEmX66KIsRssGAcmetQJfEVVX9twPiB3Xp9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763363873; c=relaxed/simple;
	bh=kUyQrYgH2qCmV5GwB4Y7oDEJNeSNYz6SlgbrpFARcLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTB0KO+mj8RGaFKhvaWlF/Fw0e4c4xZFmm8273VHwCZEozfZjQcpZkpKhLHdQbIsHA8HnG1zLuDi2IcpRB1Gqsk8v3toAIN8JzKEJVyfY/zYzKy1FeRp7pqXZ/Rcd0XFWPefMomvv1rdYMP0vHUBu2GM6hZdSkI7hEdi7OwkaoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8JqdQUj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC38C19422;
	Mon, 17 Nov 2025 07:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763363872;
	bh=kUyQrYgH2qCmV5GwB4Y7oDEJNeSNYz6SlgbrpFARcLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8JqdQUjCCciT+u0xU2T5JtEkAYMgqdbTsFXSJfZUk05dnSs4cdyOtmhxmMeAhed3
	 q7WvHAhg0G7qo0hfNx32eopz1s2uavo1YYi8t2ki1YJrke4jwF+iWvvubwhSXIX4w9
	 Ztz9spBpzWjXtEXM6yjBLLYBrz2+m5cBtLv/m1d+q6axj+He9pr94D8H65rwQ18gUR
	 OBQee6c97RSrvRiS2Hpod9NAfYZMccumy68MrFWvmDJANMOQce+sWjzqcxiGNNPmzq
	 WxKbR37w44XV2IXbQX9XLrcJPrZScfU/PVIDUU0MndTOirzPpHoLiCBzhjk+5wXq0M
	 9R9ldnk83Fuag==
Date: Mon, 17 Nov 2025 08:17:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adam Skladowski <a_skl39@protonmail.com>, Sireesh Kodali <sireeshkodali@protonmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add MSM8940 Global Clock
 Controller
Message-ID: <20251117-enigmatic-porcelain-partridge-fb8dba@kuoka>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
 <20251116-gcc-msm8940-sdm439-v1-1-7c0dc89c922c@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251116-gcc-msm8940-sdm439-v1-1-7c0dc89c922c@mainlining.org>

On Sun, Nov 16, 2025 at 10:35:56PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add devicetree bindings for the global clock controller on Qualcomm
> MSM8940 platform.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-msm8953.yaml | 5 +++--
>  include/dt-bindings/clock/qcom,gcc-msm8917.h                  | 1 +
>  2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


