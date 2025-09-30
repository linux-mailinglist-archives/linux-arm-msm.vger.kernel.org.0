Return-Path: <linux-arm-msm+bounces-75615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A3CBAE60A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 20:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E971E4A0BD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 18:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343EE27A462;
	Tue, 30 Sep 2025 18:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gF/6+cHi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0523B1C68F;
	Tue, 30 Sep 2025 18:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759258584; cv=none; b=kxu05fcyo+Pqb79qcmW9K6OXCchvQeD0kVAbm/4S79m2xTueuGnOTBj9hHQmPDolpvj0l0nLY0afISJKaRFT2+oXO6gTmTADmuYIeuqWDBdhGE6HeCuf3QtFeu0vcMINogLkXKiDm90/OgERcLWzPHrQZOv68FlixnJNng/6f+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759258584; c=relaxed/simple;
	bh=fgnAYxcMrRCgX+i+l7YC4q2cl3BBIPoevLQdigNTtlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W1q05UrKVJfPoqLQesvofD80fdbzFfKs88ObznMvyfaTX8kPKfnBn93nhViSmObPofECcxqU9qZHep7R1kneEKJCSuKY2QVCRhNkLu2KNt2e2jP6QJiAnDSecpvjkeFbzfUib7bfL4kS2exYP3XBDTL7+4POiLhi3aAmDt6bTD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gF/6+cHi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5428EC116B1;
	Tue, 30 Sep 2025 18:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759258583;
	bh=fgnAYxcMrRCgX+i+l7YC4q2cl3BBIPoevLQdigNTtlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gF/6+cHiUYT4FzbgmZnMIlXFrg/grJekMm7ZfEdAzfRWzpbYEcjPgZZLRlzmWskZj
	 i70RYosXNUM4lnsS+9mGZEk4V7S1pJDDu61aAd1Q2b9aLX0h57b7xMCYjf6IFCRDud
	 P3BTeZsyw6Fpq5BVjplXXMYSXuIAMeKVNvS8ms2938zXG9zWDtKV0gamsx82BBdXtl
	 kARVwvEmv/JuaJk263sTGRLSuxjVP+EGDbl502Vyq1n7ByWe5ICPaNWp9Cyjb7ZTQT
	 Bk0DF93K1iMvudpCjZjEofoqN0ad/07ccXCRs3SzZTJRmIbUHIgFvstCFgncVbYsYT
	 vlKR377sc2SaA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 30 Sep 2025 11:56:09 -0700
Subject: [PATCH 2/2] clk: qcom: Fix dependencies of
 QCS_{DISP,GPU,VIDEO}CC_615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-clk-qcom-kconfig-fixes-arm-v1-2-15ae1ae9ec9f@kernel.org>
References: <20250930-clk-qcom-kconfig-fixes-arm-v1-0-15ae1ae9ec9f@kernel.org>
In-Reply-To: <20250930-clk-qcom-kconfig-fixes-arm-v1-0-15ae1ae9ec9f@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 patches@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053; i=nathan@kernel.org;
 h=from:subject:message-id; bh=fgnAYxcMrRCgX+i+l7YC4q2cl3BBIPoevLQdigNTtlQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBl31M//mR/08NwDz+Q3ze6HY1ZPX6URwlp1fbXZo4xl6
 37IKmvHdJSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJSB9jZNivKrP+EVuthc3h
 kknZ2vaxmlk3biiEnEp4vf7kyQTnz6cZ/kct/q59aMvByu4vX/0u/tyVV8D8/VS11/lvy65tvOr
 OP4MBAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

It is possible to select CONFIG_QCS_{DISP,GPU,VIDEO}CC_615 when
targeting ARCH=arm, causing a Kconfig warning when selecting
CONFIG_QCS_GCC_615 without its dependencies, CONFIG_ARM64 or
CONFIG_COMPILE_TEST.

  WARNING: unmet direct dependencies detected for QCS_GCC_615
    Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
    Selected by [m]:
    - QCS_DISPCC_615 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
    - QCS_GPUCC_615 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]
    - QCS_VIDEOCC_615 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]

Add the same dependency to these configurations to clear up the
warnings.

Cc: stable@vger.kernel.org
Fixes: 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver")
Fixes: f4b5b40805ab ("clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver")
Fixes: f6a8abe0cc16 ("clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/clk/qcom/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index ec7d1a9b578e..6fef0bfc1773 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -531,6 +531,7 @@ config QCM_DISPCC_2290
 
 config QCS_DISPCC_615
 	tristate "QCS615 Display Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
@@ -586,6 +587,7 @@ config QCS_GCC_615
 
 config QCS_GPUCC_615
 	tristate "QCS615 Graphics clock controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
 	help
 	  Support for the graphics clock controller on QCS615 devices.
@@ -594,6 +596,7 @@ config QCS_GPUCC_615
 
 config QCS_VIDEOCC_615
 	tristate "QCS615 Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select QCS_GCC_615
 	help
 	  Support for the video clock controller on QCS615 devices.

-- 
2.51.0


