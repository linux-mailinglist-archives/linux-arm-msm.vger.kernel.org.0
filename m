Return-Path: <linux-arm-msm+bounces-85623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B1ACCA22B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 04:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B48D30552F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 03:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB37218AAF;
	Thu, 18 Dec 2025 03:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cM8bBr2m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C69221F12;
	Thu, 18 Dec 2025 03:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766027032; cv=none; b=fD96/HLP1GcIe4rbX046aV1bVWIgRV/D2cOTEOjZrJZGeGfTSxRHs9xpZHQyutkztkxI50J6MUbXhsqFM5hbtRnIoRjgpmgsWoM93/yvmwIa+LIp948YeqcncdXcPkQev2ySHGmQS9dvOOmHR4lnDGqjqvmDRvPMnyNco6iVXGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766027032; c=relaxed/simple;
	bh=sng7GYF4rSHur+dVCcJWfgiPkVznmDfRvjDEJrTRqKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3ii4HBie1fjhMLdOD73Xj89LVTjWQiFosXxPBGuyFJmoba7zGSSYrtENVoe5B9EMxLgD0mJUP2AY7skUpMYxigtjCWn/mZB5dFj6pyXbvhVVa9dLZjy1KfnwUybAd+fzcKSIB4RfbaQnF3F+ZpWEttiyhxQgLkhEugG/1THG3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cM8bBr2m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E68C19422;
	Thu, 18 Dec 2025 03:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766027032;
	bh=sng7GYF4rSHur+dVCcJWfgiPkVznmDfRvjDEJrTRqKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cM8bBr2m6U5CJEpLEd5HcOKyDCCmdCAej3O+FVA9mLqmn9B/Wzlg7MoOc/v8KbLoC
	 8xhw9B6hmqhhThSTaYb5i0clMDQaKsRyYXA8PsqxWukBjgfBjs4Xi/LO1hn/mmiZP5
	 029U9zzPaDSt520HSfJlUJmeTWUKSbeOQBp+ym8woJ2aXs+T6eRXvj4Eic2lzyIa4c
	 YuchaOn+yr1IXiTmh2a4DeImbP9b1kGpHktdkpljRZw+v4Fz3tpWCG24ovo4ABoimJ
	 EQLkuXsNi81Q4i/uF4HBVtElu1CZtlj60m4ZdYWwVZO3VQ65RVUgDYH/ZFe1KV5V2W
	 P2kBvSx3m41dw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/5] arm64: dts: qcom: Introduce Kaanapali platform device tree
Date: Wed, 17 Dec 2025 21:11:51 -0600
Message-ID: <176602747928.229487.1894524352438355859.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Dec 2025 01:07:20 -0800, Jingyi Wang wrote:
> Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
> 
> Add device trees for the Kaanapali SoC, MTP (Mobile Test Platform) and
> QRD (Qualcomm Reference Device), along with the corresponding defconfig
> and binding, providing initial support to boot to UART shell with UFS
> enabled.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: arm: qcom: Document Kaanapali SoC and its reference boards
      commit: 725ba2d0e0b9ac1f0bc0c0c166db03201feaa203
[3/5] arm64: dts: qcom: Introduce Kaanapali SoC
      (no commit info)
[4/5] arm64: dts: qcom: kaanapali: Add base MTP board
      (no commit info)
[5/5] arm64: dts: qcom: kaanapali: Add base QRD board
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

