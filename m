Return-Path: <linux-arm-msm+bounces-68847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0A1B23B67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 23:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22DE55859B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 21:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDA82E2821;
	Tue, 12 Aug 2025 21:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/X2ApBG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA242E2664;
	Tue, 12 Aug 2025 21:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035800; cv=none; b=DFpIXxZDSA1UMA2JATIYPy1cVdyrqXrljLK237+VS/oS9etpq9ddtiQl8cnSe6tI6U9n7YCWMflhqfktk9Nczvm9wuNC9uT1SiDHSqI4uIHlrapuSdDGO/XnLtDMihnlajq2JyKKJGOl6UXQ2sjqK/60EbCqdnwyVQYDp3Zi2/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035800; c=relaxed/simple;
	bh=VgXxxA2NG8Ilx12xVQPJsG3ZIK+2Y0VaQVCI/PW05JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJI/tJWwK1sWMMk2cQkUAtnEx9kCK8GKfdX/IYk+DTB3erxFtF3WhQZyzuL/RElRomXCP+DABBdH9uCKNEA/BYYAclIgkeeQUqhyR+jwSConKsqXSP5rR9zQTDw7cGFZS4bBMHuHE03bzyF99lOOpMYWilviQ1ZjxATYGIWQV3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/X2ApBG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C98C4CEFA;
	Tue, 12 Aug 2025 21:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755035798;
	bh=VgXxxA2NG8Ilx12xVQPJsG3ZIK+2Y0VaQVCI/PW05JA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a/X2ApBGlWSt/wUjFLkE827HNM4kEH6sJT6jzf2+DbfQ6oM3dy0rXjqWVZUksM7lS
	 lh2oEmxSJT8p6yFq3g+yzPeIZTJY/qQfi5bgFuKBM8M6LBQ+WDlnIfkxYtwidI+Cle
	 Wcp3c9X+zRTVNvpZjBpBphLwvAlyZp9glAMT+HEaqVMceQ2iDSr8dCd8NqwYcVPYIY
	 WvDSR+T9HmeDaMmftRvDHlpr7GYWU5BHDkL0oDp0K51zYT8ntpzHCGfHZJn7cMZ9+H
	 jmmj/Htb2u1Rpc6j5bdKG2aqtNVsK2HZ61OKUaEYgXhPkiNAVDDATfZkLpJ53hwvIU
	 Q0pKm2BoOmz5g==
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
Date: Tue, 12 Aug 2025 16:56:19 -0500
Message-ID: <175503322859.231048.11811110407884093606.b4-ty@kernel.org>
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

[10/10] arm64: defconfig: Enable QCS615 clock controllers
        commit: 4e4afd6bb9657d7cf23f6becf23706882b9822c0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

