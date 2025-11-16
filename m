Return-Path: <linux-arm-msm+bounces-82008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD32C61E6C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 23:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0156F35AD6E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 22:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B372727E0;
	Sun, 16 Nov 2025 22:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RSRvMRJn";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="l8V8dCvi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258B629CE1;
	Sun, 16 Nov 2025 22:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763331543; cv=none; b=Iz4Mdtk+u0w/zJf1l0tgmM4qR6KOzPfeZn1ijhwKzzhoG4o6IdMVrQ4OmdG3v/+Fg7DEeTmrt+f/nrfA8S+SG5wdF9svaPxmLubk+aUGayIesyEnAk0KZl9V1uJtWKrXgyxDgWIZhgbV0KsuLxiriJlMBAyn5Hfmnsck9qVIDIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763331543; c=relaxed/simple;
	bh=TYmsODsp9bbp1uQFMCh9lzfXbzWG50DVVtQLE1Yw4mY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=KslBxBQuVMtpUnufXJPy2NY3F05L4Gsq4Qevh/QMiKXmHnhXlLdxZby0vmdhyMM2/Umtru5z77kG5s5gG6vJyKa8JQWXWm4dOueYQRjnQOBjz4HE19DynSMyoxNcLooqz+Osp4xZoPEMiF+JYZzyat7b0JQtJXfdP45xHjZXyxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=RSRvMRJn; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=l8V8dCvi; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1763331534; bh=paB+HCEDO3jdtxI9A73aM42
	1d+C65qEkfS0XBsc1lb8=; b=RSRvMRJnUGBUruAcp9A4XVCd7asGRTrh/L7BrkJUHT62WnaRfl
	dK8lNd/VtzYTgarHLlEn0IuVzScabYMTq5TNAm/u+VGkoL5qMAQWYewRdhuQCYdCORVkiWg5lNF
	GCNoW+Fg0wRbJQ9gNL7OymEjT95TX/1BBPkswpJebUs0lmcTnS3h25O9NG3J/U/pqxuPwLO/7Xo
	YA24MwbHvUF6u3Pm369pAhBgQLi4YIe0H6+1TfDwB/x1uQ4BkFOyplHcwT9Am/LmJpsYCEN997R
	Cl++bg+3H5EqsdilwGlbVFo9nyPcsAGWvOSNKQMmLGuBT23HrSEf6fHBp4DjHzpHMyg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1763331534; bh=paB+HCEDO3jdtxI9A73aM42
	1d+C65qEkfS0XBsc1lb8=; b=l8V8dCviX1pzsWl54Hh+kjP376Gh2OqACBJieA39iWrosvSbVP
	995T3QINrRo7g1L8ppMdmMFCXqcqRQNwOFBQ==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 16 Nov 2025 23:18:54 +0100
From: barnabas.czeman@mainlining.org
To: Bjorn Andersson <andersson@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Ba?=
 =?UTF-8?Q?rnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Subject: Re: [PATCH 2/4] clk: qcom: gcc-msm8917: Add missing MDSS reset
In-Reply-To: <20251116-mdss-resets-msm8917-msm8937-v1-2-08051386779b@mainlining.org>
References: <20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org>
 <20251116-mdss-resets-msm8917-msm8937-v1-2-08051386779b@mainlining.org>
Message-ID: <d79f4d1da7b23f3af1d7237d1c03cb94@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-11-16 23:10, Barnabás Czémán wrote:
> From: Barnabás Czémán <trabarni@gmail.com>
This is my old mail, should I send a v2 to fix it?
> 
> Add missing MDSS reset can be found on MSM8917 and MSM8937.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/clk/qcom/gcc-msm8917.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8917.c 
> b/drivers/clk/qcom/gcc-msm8917.c
> index 0a1aa623cd49..248fa0fd86f5 100644
> --- a/drivers/clk/qcom/gcc-msm8917.c
> +++ b/drivers/clk/qcom/gcc-msm8917.c
> @@ -3770,6 +3770,7 @@ static const struct qcom_reset_map 
> gcc_msm8917_resets[] = {
>  	[GCC_QUSB2_PHY_BCR]		= { 0x4103c },
>  	[GCC_USB_HS_BCR]		= { 0x41000 },
>  	[GCC_USB2_HS_PHY_ONLY_BCR]	= { 0x41034 },
> +	[GCC_MDSS_BCR]			= { 0x4d074 },
>  };
> 
>  static const struct regmap_config gcc_msm8917_regmap_config = {

