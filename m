Return-Path: <linux-arm-msm+bounces-61244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A73AD8FDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C83CD1894017
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C6D19D88F;
	Fri, 13 Jun 2025 14:43:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DAD1DE4CA;
	Fri, 13 Jun 2025 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825784; cv=none; b=F3mKKcE5I8yo0qd9G8SDpX6XUU24peBNrv2vZ95DCDcVA8Fj7J5HYHRo/CDwQRdnaalctTLHTHbdbQNe6qtFX0tZl6NbTxs+yowvqmXS9JfoFLf9q8ekw1JmHfGUPzyD7TU9gGpqjb/+/Db6eWC7gWj2JkIV2wGGvd3PaGoANGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825784; c=relaxed/simple;
	bh=tPl/PEIb8eSUeiYkBoCGfQu4ggnOVkwSBcpHJFJlX+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o18ibQfeQNuTS0uW/Lb/WqX4QSlCE8RE/5h4MmxLmKnma0VBLKrIyyJ9vZ684p2c0m5miHALvUb4iDKS8lij/hEK9Z2SjUuTDsocT7BIkaheUX1zORlbteCSSeqB6OMEudLZAcKuvO2d9g88t5PiL0dcz1uJ/sXMf1zPeQGXR+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1749825713tbe4f63a0
X-QQ-Originating-IP: V63lOhA8be4jkOMxbffSjrLoj7ZrMWN4e7cYEOp3Yfc=
Received: from [192.168.30.36] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Jun 2025 22:41:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6568943623001376254
EX-QQ-RecipientCnt: 9
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 13 Jun 2025 22:41:48 +0800
Subject: [PATCH] phy: qcom-qmp-ufs: Fix HS-G4 PHY init table for sc7280
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-sc7280-ufsphy-g4-fix-v1-1-1bf60744f5ac@radxa.com>
X-B4-Tracking: v=1; b=H4sIAKs4TGgC/x2MSQqAMAwAvyI5G2jTuuBXxIPUVHNRaVAU8e8Wj
 zMw84ByElboigcSn6KyrRlsWUBYxnVmlCkzkKHK1NahhoZag0fUfblx9hjlQkO+8hSdjWOAnO6
 Js/63/fC+H2qSSPVmAAAA
X-Change-ID: 20250613-sc7280-ufsphy-g4-fix-024542f31fac
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, 
 Manish Pandey <quic_mapa@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749825712; l=1667;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=tPl/PEIb8eSUeiYkBoCGfQu4ggnOVkwSBcpHJFJlX+E=;
 b=TjZ2DBGaELqKjKwUCVZYItwat+JLv7VGMiBu46gSHT+NLI6IL6S34l0NvKdoZJLxA8weVyFov
 WSnE5vBfj2jDyLaAUmZ8l+7kXNOSyBxXAyUwGUW3+lBIHjNo2Aa2YH0
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NDaL9YIDjH+JVfTGJPjC0drK2S3l6oMd3sX5QMU8QcrEPwj//KVurX/4
	x0DMEfg89F9b35oZ9c/645mhKqkHufdB3p5lsOx5BTfK0nzNtXtpxF6a2/qJASpGgm9MNg0
	gSCLgEXzBS3rmhN+WQRwCHxIPH6A1wsTNakGcW8sLQT8w1N0lsS3qMN2gFEIogU5ft6P1+t
	5rfuzVvbHj1o+uIgDMIgnNikl99dPglr9t8+vvJqtU7ao6LsalmBL6Bz2R0QXTZXKLC9fic
	gmZ0SvoxkpaWm/0Y3DNpIDZXUceHfb4gtA3Kq8Il6ap1QhU1smk+aGN5dTkFlWNiKfhULYu
	g4rjGIaAnmYfrHQ660CxqoTehbkPJgIF7Vk/fe9eiHlwHJ0mF+8m5HnZccsdJBdqw0lmBqo
	1UHMSgDV4QJVmILNIxTIWOx1LKR95x5vvyZGmF8TZGNhqtdcn8U8Nj6qZiTnbAfC88ela0+
	rRdkUk52HlMIFsNu3DVaVNARhMdVYqEQihjz8eOazgmcAzqV2VzJO33IHqLN9ksd+R05zno
	BFCpJQ/ipPD48oFmdR5D7+lXqyDlDi4Wil2zlfamtcVbIZ2/PgDKpPlEz1m7AeGVKJfnJiJ
	pE/fdqIH+2lNzxeqiyzFBAwwyM9D0lyxmFk7tVDv1+wJN4nIPF/pe+ARNtBPNhkuQOU6YbY
	DUSuGymQJSksdGXMhlCLMnm6nTf3Blf6ZJZhctVzbQjEQ0/ONnTZZbjFmmD6LAL2/NBpVcS
	h21EliiOMyQODF6ZSaOaLemTJY+B3kuVw4wt/2U2ePiQDcAMzyrYn5K6/JPQUjhcLdWLRKt
	QYj4zgMIwcvyNNOitsGbxtzVLkRXI310oowqxbkvXBSq59JD2yUO09BQzrJDF6wiKLHcFeb
	qlqBZLebPGJLbag/52GexvAAMANYiBdQMoc8lwPhNSe79BaBVUSFqOvLliiYUnBe5PW72TW
	CZceVTKkF3nL3ybBnyB9l5BZBzLuqdreD27Y8BusDvmi81IoZvxOk3+dy
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

The PHY is limited to operating in HS-G3 mode during the initial PCS
registers initialization. Extra PHY init sequence is required to allow
HS-G4 mode to work when needed.

Fixes: 8abe9792d1ff ("phy: qcom-qmp-ufs: Add Phy Configuration support for SC7280")
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
This might need testing on sm8150, sm8250 and sc8180x as well.
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index b33e2e2b5014d3ca8f19b623ba080887f53e616d..7797be329d75f95c80863e05351d0cf55fdf38c2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -570,6 +570,13 @@ static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs[] = {
 
 static const struct qmp_phy_init_tbl sm8150_ufsphy_hs_g4_pcs[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x10),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_PLL_CNTL, 0x0b),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB, 0x2d),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB, 0xb0),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_PWM_GEAR_BAND, 0xff),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_HS_GEAR_BAND, 0x1b),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x04),
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_BIST_FIXED_PAT_CTRL, 0x0a),
 };
 

---
base-commit: bc6e0ba6c9bafa6241b05524b9829808056ac4ad
change-id: 20250613-sc7280-ufsphy-g4-fix-024542f31fac

Best regards,
-- 
Xilin Wu <sophon@radxa.com>


