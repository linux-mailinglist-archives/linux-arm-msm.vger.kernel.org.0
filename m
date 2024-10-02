Return-Path: <linux-arm-msm+bounces-32947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D2E98DEDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 17:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F7381F21B53
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 15:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1141D041C;
	Wed,  2 Oct 2024 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhHKmRag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7AA748F;
	Wed,  2 Oct 2024 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882678; cv=none; b=D9gd72rcdp+bTg8MRFUqVCx8vp5cA+6Ga0gB4ddKtfLLsxpGbz525hxzKfjqvQdM8c6VWOHP2KdUvoxbLHOujl6yssQDc0E6LjtEU45LN5AIrSldIC8IOiqQAG/P3xZX6xlHZgE6dmH5ZJgVkEA2Uje+Icx3178y6a89aOXh00I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882678; c=relaxed/simple;
	bh=zpBAyXaoZCDrvbKu4K9Ly8sQIcSLywthtnsAo7N/4SM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TC9QbXEOF6Q2XBOorjkb8Sa2IrfYXucsJdt4sNkvqsL26SVi/7Xek84Joroed6OV/1dB9NEY+j2yruOE1/lOLmF3HP2q4kGNaVVkTM0ErIGiMjEUjfOCMTypB/vTX14Eqh15mas7cjFuluO07KsroAL5kdVWHhCTe6BJr6TgZc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qhHKmRag; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F4FC4CEC2;
	Wed,  2 Oct 2024 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727882677;
	bh=zpBAyXaoZCDrvbKu4K9Ly8sQIcSLywthtnsAo7N/4SM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qhHKmRagHp2UYM0vYEMEjaG8kBLa40p/NUb2JgxtVbiru9AvgVVrAru9+OcDf8fWG
	 YfYwC/xjSKRT6+La8RAhHYuBTP0OrAYgpPkWs5UNA8gXCedDVcC1bF5itv26RYAYuV
	 W//5lg20JkNu/yvPh9qaVTkhi2QAyGE2FATHh0aJ5tT+SM1tIwgwiRD1Tv0/kSfKR6
	 6/y1vtdPsg1WVFwxWKohEBaTcWVVFRF6FPKuIWavjQbRO7VC0XQxMkjPFCcptKNhtM
	 BuV2sN3u/Y8mrHFZWlfoSPeRm+VXsvnDgfKbb6hmzD9BLXF66iQhffzwmCUOW5Aa7z
	 Vvcq/1BLTFKjw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Nikunj Kela <quic_nkela@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Shazad Hussain <quic_shazhuss@quicinc.com>
In-Reply-To: <20240905194741.3803345-1-quic_nkela@quicinc.com>
References: <20240905194741.3803345-1-quic_nkela@quicinc.com>
Subject: Re: (subset) [PATCH v3] dt-bindings: mfd: qcom,tcsr: document
 support for SA8255p
Message-Id: <172788267538.1443612.15994548412245580739.b4-ty@kernel.org>
Date: Wed, 02 Oct 2024 16:24:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 05 Sep 2024 12:47:41 -0700, Nikunj Kela wrote:
> Add compatible for tcsr representing support on SA8255p SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: qcom,tcsr: document support for SA8255p
      commit: 0dbf6d4496b3f2966f71410768c36a379877f958

--
Lee Jones [李琼斯]


