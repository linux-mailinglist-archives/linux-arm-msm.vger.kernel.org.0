Return-Path: <linux-arm-msm+bounces-85624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 049A2CCA21F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 04:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A4A6301E9A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 03:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0F42BE7AD;
	Thu, 18 Dec 2025 03:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cm9tv9rQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16E52FD1D6;
	Thu, 18 Dec 2025 03:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766027034; cv=none; b=DxwUpxi9UzQ6KEM8koL8xWf97U9ZzRBgQPHYmsxK3cuyarM3MyhEHqCru7bgtkADoHhReV2b2Jw9f01R6T1sDGNTpzDl7OeJD3ufXMtmMAA/bsxHmgud5MpMVO5OdA0iCgxHkJ9J81pGQ/o3uS8COtIZb/SOH01rNQfMSvFX7mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766027034; c=relaxed/simple;
	bh=X0xOLhoU7bqfrQbZ4zwbsy967qNOdyTqGoenxYDjTnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GAMTrVChXnUmQOF3oEa7mq5niedOKNdCSyMV++8snF0j1yTtj0v1RJcx3wDMCibM5CkBx+rK80+AuTvYdIBUl8Wi0+mbbeUfx/1UK4DJylWRKpMMdR8E2VUTibVEUp8+tlX2CzQQ+To55nk9LraFQTpATCG2tfysMelCf4VIoCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cm9tv9rQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DAD6C4CEF5;
	Thu, 18 Dec 2025 03:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766027034;
	bh=X0xOLhoU7bqfrQbZ4zwbsy967qNOdyTqGoenxYDjTnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cm9tv9rQYa9HqeFOWCWZqQpTmyZz1j+1xiqWBnySN4elZP/ZcpPK6pFP4Yzkjx0hU
	 4E4ZrWJRXeARX2RqX+COIVq1VbBsDcPtwxQLapbm01eKcpdlVNVz2zhcCT1jPiPBRt
	 HHu/RrQPowMlIqdyH8erAj/VAROyEWz1QziOxJiMwYyimJI5HIs4JnS+XLC4GSWSDl
	 neGxpQdSDNwpBRR1N2JIAUtXkt/iLVyBiUCPTOXjyDsMzEpuQjCbWjRp4aPtgL9/gL
	 w1xzxS9Bs35IPILZsBgqlIHMN5CmcsyeOIo4cRDRN1in0A816UUBN0hv71vuMdKhue
	 +mYhdzeS6Ac7g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v5 0/4] Add support for Clock controllers for Kaanapali
Date: Wed, 17 Dec 2025 21:11:53 -0600
Message-ID: <176602747924.229487.14558603114009132510.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209-gcc_kaanapali-v3-v5-0-3af118262289@oss.qualcomm.com>
References: <20251209-gcc_kaanapali-v3-v5-0-3af118262289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 09 Dec 2025 14:19:23 +0530, Taniya Das wrote:
> Add support for Global clock controller(GCC), TCSR and the RPMH clock
> controller for the Qualcomm Kaanapali SoC.
> 
> Kaanapali(Snapdragon SoC from Qualcomm):
> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
> 
> Changes in v5:
>  - update the commit message for the glymur clock pmic resources to
>    describe the problem statement. [Dmitry].
>  - Move the clock definitions for clk1 & clk2 before the clk3.
>  - Add RB-by tag from [Konrad] for RPHCC for Glymur and Kaanapali
>  - Link to v4: https://lore.kernel.org/r/20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[1/4] clk: qcom: rpmh: Update the clock suffix for Glymur
      commit: 3dadc1dc5e85cefc7a2f1c9d428b5622fda12d3d
[2/4] clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
      commit: acabfd13859dfa343aa5289f7c2d55fddbaf346f
[3/4] clk: qcom: Add TCSR clock driver for Kaanapali
      commit: e5682c953f5a9fbaad060ea000beff80f11c4048
[4/4] clk: qcom: Add support for Global clock controller on Kaanapali
      commit: d1919c375f211a2aeef898496b6f3efbefebf7f5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

