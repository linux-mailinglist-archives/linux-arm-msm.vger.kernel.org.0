Return-Path: <linux-arm-msm+bounces-68033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A720B1DBBF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 18:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32D45583029
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 16:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58122271456;
	Thu,  7 Aug 2025 16:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QVqX96ba"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1151E5207;
	Thu,  7 Aug 2025 16:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754584416; cv=none; b=U+xPip90cbgaw0/ztfY4Lep9MXGjsnhEEqvXUFglS+xdcl6NSqJoezgCddXFoj90a/cHbmJnGF5Fm6mnDe2Mgm0pcboblWy0ql5YDOOvJzQSjW9TQHTjHt0xoByZARFUk/3MGD6cFumHPDFxTDWQkyIdL/PMwHp0CuPE/6NNhSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754584416; c=relaxed/simple;
	bh=pA19sZ42BZajVjYKOabBiRIt+Rnz8rtfme/PEUxiTnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PpAoA/Dns/IX7WAgq/PwZVnK0htrs/8H4ex9GopMwsBA47KSv4M3y1FD7xwr6eWjE+jINJDpVjSDqBxvoGeOvnXhBF9o5EH2/8ff4P/2ZpCijPZQA6Smh4LYdvEFt6kCbdRCN/2pKcznjHvf+xyiOuGPAz3QFlDsm8+QcjcSp5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QVqX96ba; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C90C4CEEB;
	Thu,  7 Aug 2025 16:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754584415;
	bh=pA19sZ42BZajVjYKOabBiRIt+Rnz8rtfme/PEUxiTnA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QVqX96baNidINxbX0llwlb7Ty5zXd1G8jLebOWqs5ipFzhLVpGA+VXar+fHNTz/1p
	 XKl98sxLevpGcgpFuj7pbxWKVnazD0p5CqvuhYh5/ge00l6ELdsdCgvOn4+vBgIiaN
	 DQLK8pZitPydHmzBO/+UH0PQZjdHO1uYhbJYAxadvbEb+z0R8bxrpGu3lWt3vBxfUG
	 MeXLO+umGa1/SaqOXYScwKjxcMek3FL0g00DvHIdMftEFfKIcfD8EA2ZLQ78wNaKzN
	 mxSb6HFERb76z7SkwtlYxqScKo4Zhqq/oxDDng/73Koqo6+6Jvpi0VCU/Ofkpvm2G2
	 HFDi7uirGa2QA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 07 Aug 2025 18:33:20 +0200
Subject: [PATCH v4 2/6] phy: qcom: qmp-combo: Rename 'mode' to 'phy_mode'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250807-topic-4ln_dp_respin-v4-2-43272d6eca92@oss.qualcomm.com>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
In-Reply-To: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754584403; l=2402;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=kCUGw2ZG4jADwmyw1DR7mxx+tUirNJ8dufluE/gZfMU=;
 b=RVFvlh2VFtFHI/0LV1PdsnCTQLkqID5tl54VfFMW9rq5TP6hD0LXShLfOWFj6SNoblpQz8SuU
 8Zd2z5bMnCLBZoEIJrVTnBjaCmPru/NBLw9KhKD8ezHNg0mz69yZz10
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

There are a numbers of ""modes"" involved: USB mode, Type-C mode (with
its altmodes), phy_mode and QMP_PHY mode (DP/combo/USB/off).

Rename the generic sounding 'mode' to 'phy_mode' to hopefully make
the code easier to follow.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index f07d097b129fb7b3fad003103b7468b16c1c4390..30749943f66280c3aa9e9673466f6f736d1adbc8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1846,7 +1846,7 @@ struct qmp_combo {
 	int init_count;
 
 	struct phy *usb_phy;
-	enum phy_mode mode;
+	enum phy_mode phy_mode;
 	unsigned int usb_init_count;
 
 	struct phy *dp_phy;
@@ -3282,7 +3282,7 @@ static int qmp_combo_usb_set_mode(struct phy *phy, enum phy_mode mode, int submo
 {
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
 
-	qmp->mode = mode;
+	qmp->phy_mode = mode;
 
 	return 0;
 }
@@ -3311,8 +3311,8 @@ static void qmp_combo_enable_autonomous_mode(struct qmp_combo *qmp)
 	void __iomem *pcs_misc = qmp->pcs_misc;
 	u32 intr_mask;
 
-	if (qmp->mode == PHY_MODE_USB_HOST_SS ||
-	    qmp->mode == PHY_MODE_USB_DEVICE_SS)
+	if (qmp->phy_mode == PHY_MODE_USB_HOST_SS ||
+	    qmp->phy_mode == PHY_MODE_USB_DEVICE_SS)
 		intr_mask = ARCVR_DTCT_EN | ALFPS_DTCT_EN;
 	else
 		intr_mask = ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL;
@@ -3355,7 +3355,7 @@ static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
 {
 	struct qmp_combo *qmp = dev_get_drvdata(dev);
 
-	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
+	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->phy_mode);
 
 	if (!qmp->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
@@ -3375,7 +3375,7 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
 	struct qmp_combo *qmp = dev_get_drvdata(dev);
 	int ret = 0;
 
-	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
+	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->phy_mode);
 
 	if (!qmp->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");

-- 
2.50.1


