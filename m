Return-Path: <linux-arm-msm+bounces-61054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2F0AD6683
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D920D7A2EE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCAD22F763;
	Thu, 12 Jun 2025 04:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qxi8/9Qj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C19722F16E;
	Thu, 12 Jun 2025 04:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700868; cv=none; b=LqtwunL1fw8URX0YTKIWoW8q+PGbK/+dteHdf9h/NzcN+qsDHbirVWtJWsgs2cZqgIo3lSN2X67tMKXHSNpmG5Q+eM87LpW0GdxmTzmlg9Id4Seju6q5j450gjAhus99ueQrh5YIH73fK6jqoG01z+Yg3OXIsIrcxsHJn6Wzp2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700868; c=relaxed/simple;
	bh=AGdYoClIDt+Fgd0xZMYIXSlP7pPbqLv1o1AqH1cdgWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kCG8yESjSMkFvK45P7TwNhGxBl5oCcOCXDB1KmcL1ReT5IDKccTiSa80L0CzniOkoCXH2hbE/j/UbRMiJcrn/GrjJKnMhLpFtsJnd6CnHs/PRK06L6y/B1ZlVgbROelP+jp7cq/rTZ5vyagccWaL86ZFRO3mOE05/JeVq6CDB7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qxi8/9Qj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB71BC4CEF5;
	Thu, 12 Jun 2025 04:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700868;
	bh=AGdYoClIDt+Fgd0xZMYIXSlP7pPbqLv1o1AqH1cdgWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qxi8/9QjiIuz68lq4x17D98mNwuVd1UZ9X3JdBSQ1na0sw6VdDOCmV1VSc4N7pLVD
	 ilf5W/+d9fiKBwXPBhNLAxa8zDBHiuq02VpHs17K5UrtJbiX21l0SMmMIeCptK5FJh
	 Dhw2J20eWoQji+MGknfOrKYttxe5s4b1m6waUyhikHL8P+WrSC/pVGtEtb/0+0TbOw
	 u/1s3BMVdP4h0xWXMsTp7DegVY/A0v4qMJ6uBLSPj0vowpw12MazvtD7Aq8kVX6atx
	 wg9sgxwH7XAsBC5aCLOeUguYR4wiJWOlfMhUaWwHtoPMpPfsbvR2YRQ+Dm1IqSvr5p
	 EVPXMs+zxPKpg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 00/18] clk: qcom: Add support to attach multiple power domains in cc probe
Date: Wed, 11 Jun 2025 23:00:47 -0500
Message-ID: <174970084192.547582.612305407582982706.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 30 May 2025 18:50:45 +0530, Jagadeesh Kona wrote:
> In recent QCOM chipsets, PLLs require more than one power domain to be
> kept ON to configure the PLL. But the current code doesn't enable all
> the required power domains while configuring the PLLs, this leads to
> functional issues due to suboptimal settings of PLLs.
> 
> To address this, add support for handling runtime power management,
> configuring plls and enabling critical clocks from qcom_cc_really_probe.
> The clock controller can specify PLLs, critical clocks, and runtime PM
> requirements using the descriptor data. The code in qcom_cc_really_probe()
> ensures all necessary power domains are enabled before configuring PLLs
> or critical clocks.
> 
> [...]

Applied, thanks!

[01/18] dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
        commit: 1a42f4d4bb92ea961c58599bac837fb8b377a296
[02/18] dt-bindings: clock: qcom,sm8450-camcc: Allow to specify two power domains
        commit: a02a8f8cb7f6f54b077a6f9eb74ccd840b472416
[03/18] dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc
        commit: 842fa748291553d2f56410034991d0eb36b70900
[04/18] clk: qcom: clk-alpha-pll: Add support for common PLL configuration function
        commit: 0f698c16358ef300ed28a608368b89a4f6a8623a
[05/18] clk: qcom: common: Handle runtime power management in qcom_cc_really_probe
        commit: c0b6627369bcfec151ccbd091f9ff1cadb1d40c1
[06/18] clk: qcom: common: Add support to configure clk regs in qcom_cc_really_probe
        commit: 452ae64997dd1db1fe9bec2e7bd65b33338e7a6b
[07/18] clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
        commit: 512af5bf312efe09698de0870e99c0cec4d13e21
[08/18] clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
        commit: a9dc2cc7279a1967f37192a2f954e7111bfa61b7
[09/18] clk: qcom: camcc-sm8450: Move PLL & clk configuration to really probe
        commit: eb65d754eb5eaeab7db87ce7e64dab27b7d156d8
[10/18] clk: qcom: camcc-sm8550: Move PLL & clk configuration to really probe
        commit: adb50c762f3a513a363d91722dbd8d1b4afc5f10
[11/18] clk: qcom: camcc-sm8650: Move PLL & clk configuration to really probe
        commit: 3f8dd231e60b706fc9395edbf0186b7a0756f45d
[12/18] clk: qcom: camcc-x1e80100: Move PLL & clk configuration to really probe
        commit: d7eddaf0ed07e79ffdfd20acb2f6f2ca53e7851b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

