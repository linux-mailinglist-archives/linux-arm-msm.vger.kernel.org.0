Return-Path: <linux-arm-msm+bounces-65365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CFBB08407
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DC11562C5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7267822541B;
	Thu, 17 Jul 2025 04:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+wCNfQu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453602253E1;
	Thu, 17 Jul 2025 04:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726700; cv=none; b=YaZFYlYY4GY+ea9QezJ3VYvT0jzPXocgbba1YGhh1ez6mUv61xG6qT1TaByRlfw5X614cCVVEaVjaHMwVbvy3zOIP3xVF23F0k7nzG6ugiB+k2/lFyzJkwSXvcSLZx3MeMMsha7akBDjElrvtwGSxloTREaCNKjaZHFPKnQ55qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726700; c=relaxed/simple;
	bh=qENoYhA1g4akZdId0NkSg19NP8Al2V4G59lneQ1JC04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KWxneo8xGfnCJPQkuyZ1uddtNkTevlqSylO0aMr8pJ+zcrT5X9DU6VgpHftrLOb1laBBfdLcu2gjmOnzOF3dZQgZD+2ArWzUzOHpFQGZ5yLmkK6nvlTRVyVgdcui5+4gaY1FUf7yMCVhph13SihOe8r6grPC19fxDlHVz/yld1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+wCNfQu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F589C4CEED;
	Thu, 17 Jul 2025 04:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726700;
	bh=qENoYhA1g4akZdId0NkSg19NP8Al2V4G59lneQ1JC04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M+wCNfQuRa9NoHZoLI2b+Ld3ETiIagnAIGSPlyPbBR3o6V+UbpZF4m+q2iJyTAwkF
	 3y40ETt7Cyi1cBEtooA1dEHvv+1rQBsbBQY+I7BQXLgMuaWGSDeG3n+4zXPyMhjScq
	 yjmHHsu3n7hPrDnQvhS4QckKza32eVeKQbfu2vTiOFClZZX4w0re4/UqJrsdEurhC/
	 9NOP/WgocUfcRt3/6tdaSIxFXFwFdxSDmIb5040ZHRegy+ajCeVfWsE0Wyeko+Y06M
	 xeQPllbTkq/5Q9u/NzrTq44PeEQ8JfB7RrSdCzgC0QZk39ipHj6x1XdnkFUkRORe/b
	 LGfYUHvgGu/yA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: (subset) [PATCH v11 00/10] Add support for videocc, camcc, dispcc and gpucc on Qualcomm QCS615 platform
Date: Wed, 16 Jul 2025 23:31:11 -0500
Message-ID: <175272667148.130869.4243317040220963660.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
References: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 02 Jul 2025 14:34:20 +0530, Taniya Das wrote:
> Add support for multimedia clock controllers on Qualcomm QCS615 platform.
> Update the defconfig to enable these clock controllers.
> 
> Changes in v11:
> - Add a new reusable helper function to extract PLL_L_VAL, PLL_ALPHA_VAL and
>   PLL_USER_CTL / PLL_VCO_MASK [Dmitry]
> - Add static to fix bot error in gpucc
> - Link to v10: https://lore.kernel.org/r/20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com
> 
> [...]

Applied, thanks!

[01/10] clk: qcom: clk-alpha-pll: Add support for dynamic update for slewing PLLs
        commit: 48d2c6dec1c46460ee7028915595d49a644e8a77
[02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera clock controller
        commit: 8df29649903c067138180ef89f315b6f166b8732
[03/10] clk: qcom: camcc-qcs615: Add QCS615 camera clock controller driver
        commit: 28bc422939540b37eeaa11dd9c0fb412caaaca27
[04/10] dt-bindings: clock: Add Qualcomm QCS615 Display clock controller
        commit: 8b1750ea009f2774a3acd6c7bc9e61b5157101d1
[05/10] clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver
        commit: 9b47105f5434707eab065f65e7d35c62a51179f8
[06/10] dt-bindings: clock: Add Qualcomm QCS615 Graphics clock controller
        commit: 3590dfbdd1b3e4ceba0b7daed2a396f644c277c4
[07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
        commit: f4b5b40805ab116aad57ee7042359f97d065bd70
[08/10] dt-bindings: clock: Add Qualcomm QCS615 Video clock controller
        commit: 9c51c66c997cae09c12ec250a9f538c0c23d8930
[09/10] clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver
        commit: f6a8abe0cc16c44eda30712a8922261363d6d3ac

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

