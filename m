Return-Path: <linux-arm-msm+bounces-87547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 089E9CF5555
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 20:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3ACB730360C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 19:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923BF345731;
	Mon,  5 Jan 2026 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDlnqbku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4B2342511;
	Mon,  5 Jan 2026 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640602; cv=none; b=lK87gEIDE4bSdJruC/+MnXlj0j2XMpUw5/nyHnvLUwBa7mDsiUFvaiJT5sFkCi+6XAwUZjtp+pnZzyJndIyAOpepsoWK3gwYroH3bI144iZM1m043RA0IRlPyqNi9lfOXObNTqSQ+q1WOTywIGJgVu91pT9clATNtUMcDmdPQCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640602; c=relaxed/simple;
	bh=8ccsC1ObfOGFL11PecJTXOFCfWNzGQVsUYEdR3WgLP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EQUMdqxUmhQBKqLIzkw+fccO3zRamresxXur5eHYK4t+28Qe6BXX10VDY0nEuhFR4Wdx+SUlBfHT1F9+TNW/NfEmxoOFdQHckoqg3wzMBXwe3eAfG9vP69J6EgEHG6X1FCmvIObbB+uVrdjHs7B7OnX/gZbPk+/11GM2DdjgrSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDlnqbku; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FDDC2BCAF;
	Mon,  5 Jan 2026 19:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640602;
	bh=8ccsC1ObfOGFL11PecJTXOFCfWNzGQVsUYEdR3WgLP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JDlnqbkualOgSBoReZXlE1OIWdQxv49Gjx5KRhy+NDHk/rHoB/dIhyX6NZYeNWnDY
	 kmLhMBf2p6BEPtHTkkkuR0STlt4gBXDCow55uFBHusLZBmwQ3Yv283hPI18bdE5AHA
	 MXpC16ubA4H6cGY5wNtnYs4H0OorjhvGwPEzNJ79mWzNezCoPRm3+OcrH29acesfrn
	 fImH8fKr0va32XwCVKk4ubfrVb2ASy6ZXQ891kPQH1T6w4Ic1+p3pFOj2dC9L2Q2eh
	 RgnSCsaChgxUL7MGpmmNW5Ev5IdiHYgWh5UCT6qkZvpJRYj6Crf1B8wgf0upRHAAx1
	 AdYPhvub5iJRg==
From: Bjorn Andersson <andersson@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/2] Add TRNG node for x1e80100 SoC
Date: Mon,  5 Jan 2026 13:16:21 -0600
Message-ID: <176764058422.2961867.10479516458501056256.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223-trng_dt_binding_x1e80100-v4-0-5bfe781f9c7b@oss.qualcomm.com>
References: <20251223-trng_dt_binding_x1e80100-v4-0-5bfe781f9c7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Dec 2025 10:18:14 +0530, Harshal Dev wrote:
> Add device-tree nodes to enable TRNG for x1e80100 SoC
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: x1e80100: add TRNG node
      commit: 8d83fd4f08f655d0fd3c9c1fdfb7243f9116126c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

