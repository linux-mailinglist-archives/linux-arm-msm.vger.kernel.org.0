Return-Path: <linux-arm-msm+bounces-73772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E00F9B59E8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 18:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34B94460CCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 16:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4514F2F5A23;
	Tue, 16 Sep 2025 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHORhLbi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174AA2F5A1B;
	Tue, 16 Sep 2025 16:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041909; cv=none; b=JvsneKmK9cVesFwvQ2VtOamyxe6dhcme+h26ao6JUwzOrJXjIM5lkxLaz1qYtdKReyghyWhI5b99gBNN0p3TafHZR9L4lWAxa6P0WCUvrN8evA5dKi2k3LL7REL7Wypzcxmd1vanhjNvV0T5AQt3iKD4Zbw3bsLGAckf5Uuwr5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041909; c=relaxed/simple;
	bh=G/yS9dMi8fkZ4Pq7XgA0Tg1r/43UEJ49L4sCtfbjS88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CGW4O0V/g7dsIG7n+Yt2XyJcsJZE4i2Ma3vvtehYuzw77mOD2N7ijxCV/Bw9+NhDbf+ktnuvwxM80LyXfoyO4oFB+519X2H60xlo//Jg8ujiiPSMFktCiG+AHMx6QbGK/q3gmRRriomyf9YsS6UHJGXTGDbHYpxUkp4emn/r0u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHORhLbi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8E7C4CEF0;
	Tue, 16 Sep 2025 16:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041908;
	bh=G/yS9dMi8fkZ4Pq7XgA0Tg1r/43UEJ49L4sCtfbjS88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RHORhLbijCTaSE3kITQu/mNNf8CEPNVRUvk0I3GQMLU46+FRkoNNvZf8Bwyn9wgms
	 wKKOCC94v+1zxUFJ7idNoEnyG2rRfdRGB0qDAbtFToom9GfHCoyTc6QTjl4pNsFRGm
	 VstU4SAH7IFxvaWE2fWApGrYJ0ifUEL2brrP+WgEWaaioiGPTJUOTmmMoICcJAGBKn
	 GoKAwUiz6UoivqSd5IWr2a7Y5+wycCooH7v42RZ34Z+Ao9WnupoyGgeYYPa5cBh2oS
	 cWTyN6LlwTSiATk6shUIzJyV08eODooYrB9WeHU+XkpIJZr4hFgqWMIUew6lqgOXFG
	 HCV07TnkXSI1g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/3] arm64: dts: qcom: x1-hp-x14: Add support for X1P42100 HP Omnibook X14
Date: Tue, 16 Sep 2025 11:58:12 -0500
Message-ID: <175804189851.3983789.1320674094931062717.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915-hp-x14-x1p-v9-0-fa457ca30ffe@oldschoolsolutions.biz>
References: <20250915-hp-x14-x1p-v9-0-fa457ca30ffe@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Sep 2025 09:35:03 +0200, Jens Glathe wrote:
> This patch series adds support for the HP Omnibook X Laptop 14-fe1xxx. [1]
> 
> Since this is actually the same model as the 14-fe0xxx, but with an
> X1P-42-100 SoC (Purwa), it needs a slightly different device tree.
> To have as minimal duplicate definition as possible, the hp X14 gets
> unified into a dtsi (and it stays compatible to the derived
> device trees, like the Ultrabook G1q).
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom: Add HP Omnibook X14 AI X1P4200 variant
      commit: a58d6100ee2c4a732fb4e1520885958480a82110
[2/3] arm64: dts: qcom: x1-hp-x14: Unify HP Omnibook X14 device tree structure
      commit: 72b50c2fd887f632501ce69e03d8e6bb35c8a1e8
[3/3] arm64: dts: qcom: x1-hp-x14: Add support for X1P42100 HP Omnibook X14
      commit: f8f7cc59dcd234f0dcc4964ff2188a7a2ae09fd6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

