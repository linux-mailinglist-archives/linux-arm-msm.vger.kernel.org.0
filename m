Return-Path: <linux-arm-msm+bounces-68849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CA4B23B6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 23:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E8DF6858B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 21:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C542E2DD4;
	Tue, 12 Aug 2025 21:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZ5Z459G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047A62D979B;
	Tue, 12 Aug 2025 21:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035806; cv=none; b=gkGYYNQd73oYsXYRR3t5G02JL8vpCy3RiCv0pAyn09x7T6Lez4F2IfaY02ZqDCa82nFEhqOvPqBlcaKfFTNBMhzlEuo22t7zVElgrNx4n0K4Ke3aT2x194Qz7A7qcFHzYsgyl3xRNaEnIf42itrnFkjijWovTfdjKPKVDMK0QPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035806; c=relaxed/simple;
	bh=NDLD3NsVvCXtl7LDr+SPcEI3AsU+BouXXm9SZWAoNvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=awAH3vW1s5c+U8CyXlS8bjdbyxg2ym3acgaIzLsSSEMwVSkM50uQTM4/MSEtDJRVOdVaHvC7tF49EqLyD2QZXgI3PkHX/b68I65TAqzvrdCD2RzIKrwdnrryAIauLI4ZPJNjxN05pQhLIauYt5LsRazxdkAZUjOGsKKUBKORybQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qZ5Z459G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9988C4CEFB;
	Tue, 12 Aug 2025 21:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755035804;
	bh=NDLD3NsVvCXtl7LDr+SPcEI3AsU+BouXXm9SZWAoNvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qZ5Z459GffBJIyh6TZhRYzXPGGhVALpP4XAaVJjz0ooCUr7FWpFaMx6/daU26qfig
	 ELva8aAQPv74C2Z7ekqlfzAWSb0Z5d7BkCK8Dh21WQpIkW00+ERMFl2dhNa5DTCOUj
	 k74qx2fwNea0QFypcDWhqlrp684GFA+docEH12VP1WkpNmVFYze295W0q0ldgl7rL8
	 QSAz/2xRCAwogmwFrLuIebgrS2iPyPOkXFoi81ewhywsjlv+eSY4VChMH72WwOHRhd
	 1nT7eruMiT9/a972171OfhW5erTH4xgjWxMtRrpNWEPsuJHFeLWWxn+dGaGlSrdlny
	 HLNFJGBvVBFgA==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/6] clk: qcom: Add video clock controller and resets for X1E80100
Date: Tue, 12 Aug 2025 16:56:21 -0500
Message-ID: <175503322861.231048.10717647956893595316.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
References: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Jul 2025 12:08:52 +0200, Stephan Gerhold wrote:
> In preparation of adding iris (video acceleration) for Qualcomm X1E80100,
> enable support for the video clock controller and additional needed reset
> controls. Since iris in X1E is largely identical to SM8550, reuse the
> existing videocc-sm8550 driver with slightly adjusted PLL frequencies and
> adapt the reset definitions from the SM8550 GCC driver.
> 
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: x1e80100: Add videocc
      commit: a8a5ea012471dd19ea9cb4d668c27ac678e84a3e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

