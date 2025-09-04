Return-Path: <linux-arm-msm+bounces-72080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A1EB43F5A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42C50188EB76
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 14:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F5B34166A;
	Thu,  4 Sep 2025 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sb79g85H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CC534165B;
	Thu,  4 Sep 2025 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996545; cv=none; b=Hys1lHaBI1Rp8vy6tJK6s53PSVh+M1xD04+3mjACDo2GcG5zyKnsGt79mcKs59r60VVub4l/+zb5FrKxVSXR5LEZADDr83LUSogEoe/btSg084vvOeO7Pqm9QdcSmZ5w5qYte8A453t3c4/OZ4/s0bSTze/mxLeMiwHM0/UW19k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996545; c=relaxed/simple;
	bh=JMDqKW4dIOsCfKCm5QFxM4QxJl4y71tZE8rr++qsLhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TEM4zY1kiM6D7EuBAom34NxkUao7NnkkjxdHtO8/XPowxjcJjLBUyWcjU7PFbpfDnRfSGKOz1d8llblTzjjpg9KoIB3myH6cl8O7LdI+dHNb3AHmjQRnAhvstvAgdMRLSerKOBaxDVpu2ozjYzRJtbd49UzgeZXRlbAhZovj6h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sb79g85H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575BDC4CEF1;
	Thu,  4 Sep 2025 14:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756996545;
	bh=JMDqKW4dIOsCfKCm5QFxM4QxJl4y71tZE8rr++qsLhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sb79g85HOthvPgQlTjcsYfsLdwd6ccLws5ZCTvjQB1o0mM71mClcQfMxAuj0FDB7r
	 vYz00uHX7TWRvbyF0rdaiD7rltoj1+UvxYfpKw2WkrlYHAXfJNZJZ3BULmbpAj9/ik
	 jQsy3B5/UC2H+QDqnvSyl/swR+C3D6jvQJigRUBtc9EGEHG4u2kgA1zJbqAmOytXY6
	 0oOUqqmEzKKC+BBF9zh6ZnWhcMo0ZjbG5ALl34d6ADfKyJdaePM3wzQk++Xgrq1CA3
	 u/k0QbTy3C0Y8fWWGjygekMjKsbTV9vUkpjjQNDmOx2Z/vpFEV5gbXhbzxVHWDgW6G
	 YPvn2LFbcQI9g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/7] Add support for Clock controllers for Glymur SoC
Date: Thu,  4 Sep 2025 09:35:37 -0500
Message-ID: <175699653018.2182903.17957472526259857581.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com>
References: <20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 25 Aug 2025 23:49:07 +0530, Taniya Das wrote:
> Introduce the support for Global clock controller(GCC), TCSR and the RPMH clock controller for
> 
> Qualcomm's next gen compute SoC - Glymur.
> 
> Device tree changes aren't part of this series and will be posted separately after the
> official announcement of the Glymur SoC.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: clock: qcom-rpmhcc: Add support for Glymur SoCs
      commit: f9b007a96a89567372a77cbddd24d5ca4be71523
[2/7] dt-bindings: clock: qcom: Document the Glymur SoC TCSR Clock Controller
      commit: ae5b84788e5a7876a67f64761b7265529cb5a39a
[3/7] clk: qcom: Add TCSR clock driver for Glymur SoC
      commit: 2c1d6ce4f3da622773a7a6be570e4dfbf2cefbb7
[4/7] clk: qcom: rpmh: Add support for Glymur rpmh clocks
      commit: ebcb9db98bdab8b7490421355e6705e964b99675
[5/7] clk: qcom: clk-alpha-pll: Add support for Taycan EKO_T PLL
      commit: 2c7a7fe4ec3fc6eddd25b013b6210dbf1f98e5fc
[6/7] dt-bindings: clock: qcom: document the Glymur Global Clock Controller
      commit: ee2d967030fee156ceb2de80ef63ddeb80d60779
[7/7] clk: qcom: gcc: Add support for Global Clock Controller
      commit: efe504300a1705b71a69382ade4dbe44bea9d457

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

