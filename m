Return-Path: <linux-arm-msm+bounces-50234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BED4BA4E8B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9CD219C17DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A9B3DAC13;
	Tue,  4 Mar 2025 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avWogrQz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196AF2D3A76;
	Tue,  4 Mar 2025 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107623; cv=none; b=r+RWN9FIMQQ049SSwfUZckN5HVOSzaKV2HYj+bt/5DjeCjQca84mNujMezn9oR/rJUyfMDapqTRejtBOcnfg8Sw5YOZYgkxiJwBGxvSuc7DB/ay2rAy0AMbYWqNrrPL2Qsd/3PQwVxDDkLj47WaC3B9jsj0pS+4RLcCajORcgL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107623; c=relaxed/simple;
	bh=Bm1Q+hha/387V+a3Mk1bJOJbUvDP8L1k/gvV/KahSlE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZkA2aYuLdD/m2GEstotXCoytHAWXdrUMYGgh67Z/sLTv3pt4wRM8z9LV33Bw9e6PBIyDT0czGr3tOo8Hflt54rDhZVX0B2VRKeeZOP0ICu67MFoF+/I9Tv48zFPvSyvuamLE7fOFGD0peI4yA6eHpxDul2OKJPEdPMnq3epq2N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avWogrQz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C064BC4CEE9;
	Tue,  4 Mar 2025 17:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741107622;
	bh=Bm1Q+hha/387V+a3Mk1bJOJbUvDP8L1k/gvV/KahSlE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=avWogrQzBZlwpHyKfBynW2eGbvnFZ4H7aunIG+IkUYU914r/fu7mpM5vk2/5BvNlx
	 wseerf7Z8OZEb0E8gTIjjFHFQx5k2B21c4WrWNZ0EjUVHDiLpBNWWRLnFTaohu5kvH
	 SnhxRGorWqzi1JnMq2DKe8p5yQ+ZhdXVqAp2jCxbr88HGgxB4Ttbtp+qcEnS0Nf5FB
	 vNR5W+njXQki3Dwa3bV7TcMX/wZSTpOFY9hQZUWWUnobeVRmOyvSP53m1J0rFu3I45
	 4gC7ED28vQGecI7q+XMMJs45GBVbRbEphUE4hczg7ovzo5aKLTCUYkEc+yy5Sl/xey
	 J0PvJpiwU8X/g==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: sm8750: Change labels to lower-case
Date: Tue,  4 Mar 2025 11:00:09 -0600
Message-ID: <174110761301.741733.2055133663140313184.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219090751.124267-1-krzysztof.kozlowski@linaro.org>
References: <20250219090751.124267-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Feb 2025 10:07:50 +0100, Krzysztof Kozlowski wrote:
> DTS coding style expects labels to be lowercase.  No functional impact.
> Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sm8750: Change labels to lower-case
      commit: 91e3ac15523fda23f5429d641248ab31b0d46fe7
[2/2] arm64: dts: qcom: Corret white-space style
      commit: 27fd3266e8bd615af8ec5e91addac0b1dedc0b29

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

