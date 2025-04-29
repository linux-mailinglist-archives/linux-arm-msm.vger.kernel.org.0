Return-Path: <linux-arm-msm+bounces-56050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3943AA050F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 516674607D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09247227EAE;
	Tue, 29 Apr 2025 07:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtzbOD0x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35C41DF244;
	Tue, 29 Apr 2025 07:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913474; cv=none; b=Ow7Vqx1wHLgLrIJWy30ak0gYSXCGOA4cZy2yw4A3Pm1N7RsDbELRb4hJXre38sNkc3r8HWdU3jZkrP1dkjc1t00QAoKUlMKDy6bU5MnEpS0YE2NS2xAAKcZQRVxDTmTdCwHXPUygJXf+DkPkE+RwMSc35toC+mv1wgOCW5bq9go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913474; c=relaxed/simple;
	bh=KLtqZvRbwbJaTol6oN7BIQ2k7etrDhCdVBh80rPYzXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ovD3j8y/5sSbQkJHUdpzFvE+50MR8zpOhyAxEh/qynsdNH1sLFDyJHxxA9rvqFvepy3v/QZLS5lPlRzJ+rXB9aWswNZWfhQKoV+qQ4ArKZCQb8noCR3hx84pvfIdVIMVQa6/mibAIFwssYtScUlHuu3aYk8asSO7LA8FDElVtQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtzbOD0x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF95C4CEE3;
	Tue, 29 Apr 2025 07:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745913473;
	bh=KLtqZvRbwbJaTol6oN7BIQ2k7etrDhCdVBh80rPYzXU=;
	h=From:To:Cc:Subject:Date:From;
	b=KtzbOD0xICGpO1H1ey7a+kojCYIJ7/6Ji+KUNZmwLchN3Sk3wKJiQvmX1bBHyYVi2
	 Dgqxp+sAKuArCB/lbDInT9ulKmIDwBCK5HtMfPQB97o3ojW4EFI/aFvixzkzYTwbeh
	 4kRdzEGfpgvk01iY+xfjTGr6j6rbSYSagvYS8tRrkdxnTSgeS14wyzPqdD1dCO5/bt
	 dZhlAGPYL+ER57SZH6o8RQWaEJYaqsmgwNs2aF6KiKlo/ZozWAZpGLABqtMKKGF1Bv
	 E2nBrMYv/oBXMokHw1AgPAPLVeltD44301Irag2F3b4QVv6I2ESv57JehbOsD7S0A9
	 cOsORqUehG5gg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u9fqk-000000007H8-43Um;
	Tue, 29 Apr 2025 09:57:55 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Qiang Yu <quic_qianyu@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] phy: qcom: qmp-pcie: drop bogus x1e80100 qref supply
Date: Tue, 29 Apr 2025 09:54:40 +0200
Message-ID: <20250429075440.19901-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe PHYs on x1e80100 do not a have a qref supply so stop requesting
one. This also avoids the follow warning at boot:

	qcom-qmp-pcie-phy 1be0000.phy: supply vdda-qref not found, using dummy regulator

Fixes: e961ec81a39b ("phy: qcom: qmp: Add phy register and clk setting for x1e80100 PCIe3")
Cc: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index c232b8fe9846..e5277ce9c136 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4233,8 +4233,8 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= sm8550_qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(sm8550_qmp_phy_vreg_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= pciephy_v6_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
-- 
2.49.0


