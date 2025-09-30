Return-Path: <linux-arm-msm+bounces-75614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99935BAE605
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 20:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5E697A068A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 18:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94636279DB6;
	Tue, 30 Sep 2025 18:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aqpn9FuF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6244A1C68F;
	Tue, 30 Sep 2025 18:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759258581; cv=none; b=Fbl3H5qdol9rrcYmZYBpjdnOncOaMYwKccI7aUxqrEkoLDyeGrVTVCf3hahS+FDwZIsZCtgGMfSuZNqlCAA6i/A/wVCa83fplRTsxigwEanoBWBdVAVBxFwE6+Ii7h0+zE8G6Ti2tgQ0Nnk0Gp3kXS2lCIXIjnrOUw6pqwCHfSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759258581; c=relaxed/simple;
	bh=3dGfOTfGYbToy1zsBaX3bJWYDhbpgq34EGfxUcuPmoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GEJepSG6VMQ64mXX5vfKqZfnCOYetRG7Y+t7SNSADplOs3t+nSUZ8yyi04WlscSgUYTaYk4gvE1lRy3SIGjYqwzFrwGI39iZROcNZgSxgCq4IIJ6L5plKQ9kCKongozGrpoM3f+Q7RRmUBuv+n4lr+5BJrP+5FzYNr4j8sCOv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aqpn9FuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7780C4CEF7;
	Tue, 30 Sep 2025 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759258580;
	bh=3dGfOTfGYbToy1zsBaX3bJWYDhbpgq34EGfxUcuPmoo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Aqpn9FuFZPyyMoVTv5yhpL1hTRGvoHKBSrglVx7v8QKZDm/pPPsMHUND1HD882Gk/
	 T3CiBEW/KXbLUfkyLNgRGWCyQhn+8PRK0kPqIhlt5OEIxFW79gvG241SkH2LjfG25t
	 QhWSshwzDFpBuqz2Q9dbgT4uaFuH8YuVlW+AO5D3irtAle0ao1ri5N7czK4LdRKeuT
	 SwmgZRIOEejKkXMYY7iyoLI+RLkheulbzrfpiyjIJ6xYiVUkVr16Tr1mPGVx3YetxO
	 QQD0DbuF9mJwbyTqxORZUs5dj+MJ87hxYJsSJJbJK0l/9bXnc0ZCp4aK9Im0nXSUVJ
	 uNkzkLXBlf9tQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 30 Sep 2025 11:56:08 -0700
Subject: [PATCH 1/2] clk: qcom: Fix SM_VIDEOCC_6350 dependencies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-clk-qcom-kconfig-fixes-arm-v1-1-15ae1ae9ec9f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=nathan@kernel.org;
 h=from:subject:message-id; bh=3dGfOTfGYbToy1zsBaX3bJWYDhbpgq34EGfxUcuPmoo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBl31M+fPsDSzbGqUUHD20ky0MjXkbd80Q7nGXp60tPmC
 3u3t97sKGVhEONikBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABPxNmf4p1wy5bpVi8Gl2wUM
 jo8l7i6fFnY05zFD1f0jT9yFznXsfMvIcOcGc3fnqmOCT3dH3T6lWSLw3MWEx8LS+PTH6knsJX8
 U2AA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

It is possible to select CONFIG_SM_GCC_6350 when targeting ARCH=arm,
causing a Kconfig warning when selecting CONFIG_SM_GCC_6350 without
its dependencies, CONFIG_ARM64 or CONFIG_COMPILE_TEST.

  WARNING: unmet direct dependencies detected for SM_GCC_6350
    Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=m] && (ARM64 || COMPILE_TEST [=n])
    Selected by [m]:
    - SM_VIDEOCC_6350 [=m] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=m]

Add the same dependency to clear up the warning.

Cc: stable@vger.kernel.org
Fixes: 720b1e8f2004 ("clk: qcom: Add video clock controller driver for SM6350")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 78a303842613..ec7d1a9b578e 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1448,6 +1448,7 @@ config SA_VIDEOCC_8775P
 
 config SM_VIDEOCC_6350
 	tristate "SM6350 Video Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6350
 	select QCOM_GDSC
 	help

-- 
2.51.0


