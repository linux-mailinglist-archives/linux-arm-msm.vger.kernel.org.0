Return-Path: <linux-arm-msm+bounces-34423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0065D99E94C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1818281AA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 12:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914391E5727;
	Tue, 15 Oct 2024 12:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OM/8T+WK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6800D1D5ADB;
	Tue, 15 Oct 2024 12:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994511; cv=none; b=IzBV3MbmpVMjmn4JB24fsJMeOfOd8z/mhEpV4P9HLODFRV11zT0j/Mv87q4mb9HTvokwgPdQ06IjfcRzzuSFWECLJz44eGS6u4OacvuUWQfJPmErCvBpW5ln8Kd/oL20k5xIZlW3O1WObYQrj0MoDVFXWjf86aYFJPJv9dhB2OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994511; c=relaxed/simple;
	bh=1dTvursAVotDjwh/ETMarv28WWUMW3C4nw02ITS1GJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X8EiPTJsgW33QZdqiBvyKguQY1dl6kDP2mW64HJkwNZzrEZSArvsrUqZvg19JbnAyJUTs4GRc27koS6OwBlGPsc6MMBGfCYsEWzo5b9qVL8/UWDTScSp+6/2EIlQ0Zv5w3bruBdt2kRlSysmlT2pbRYabOBpigCzczTzv7ZD6uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OM/8T+WK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C17C4CEC6;
	Tue, 15 Oct 2024 12:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728994511;
	bh=1dTvursAVotDjwh/ETMarv28WWUMW3C4nw02ITS1GJQ=;
	h=From:To:Cc:Subject:Date:From;
	b=OM/8T+WK16XjIesrzIdumV3GCukFt+gD39AhYdM3ckhfJzrEDjQYS4qh0fwxy3COU
	 R48eXoQ7aZHF7EKsD3rp52UX7KiOwaxC3fTGQ1gjCoo+F6F95vl+yYx1yPVZfwIxch
	 b8mL+MapqPhpzeV33LVZGwxGbmF00RDtqgBhPBQzX4BGTnotgxh9d6A19QtzCxT6/D
	 OY65/AcxzBtgLw4oUfs0oKgrUNYP6ItQFIGQT+s1tDY2ukB+XgDaQxGrsu2IFwHGjS
	 h+TsxJFdIjnnRVq8V7gv4LJ0QfHwd5PeEAR7mjyLA1y/GU85xkN+BL4aavxG6VPa/q
	 WVDqXMzsmdyDw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t0gSK-000000003vj-17ni;
	Tue, 15 Oct 2024 14:15:16 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies
Date: Tue, 15 Oct 2024 14:14:06 +0200
Message-ID: <20241015121406.15033-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe PHYs on x1e80100 do not a have a qref supply so stop requesting
one. This also avoids the follow warning at boot:

	qcom-qmp-pcie-phy 1bfc000.phy: supply vdda-qref not found, using dummy regulator

Fixes: 9dab00ee9544 ("phy: qcom: qmp-pcie: Add Gen4 4-lanes mode for X1E80100")
Fixes: 606060ce8fd0 ("phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE")
Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index f71787fb4d7e..36aaac34e6c6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3661,8 +3661,8 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= sm8550_qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(sm8550_qmp_phy_vreg_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= pciephy_v6_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -3695,8 +3695,8 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x4_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= sm8550_qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(sm8550_qmp_phy_vreg_l),
+	.vreg_list		= qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
 	.regs			= pciephy_v6_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
-- 
2.45.2


