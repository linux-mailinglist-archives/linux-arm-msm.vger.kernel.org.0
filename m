Return-Path: <linux-arm-msm+bounces-59613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5E0AC5B7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 22:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2B721BC1AA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8011020B801;
	Tue, 27 May 2025 20:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Owtdtunm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D832F5E;
	Tue, 27 May 2025 20:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378430; cv=none; b=ihZx0oAJFZiZklwKji952PFyqT8TLXiwSZyR6D4TMufS2YhQiMMapGPAiS0vPcY6r9dGXKg3FBhdczc0ookPUt7ckrdgps7bD/UkrLK1O4PaYXUd0D/qvIUazhEWTVo9MaDJ3ix17+xUh6Z6wMtclGYXfKIHU0f0o25Hj1u2hlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378430; c=relaxed/simple;
	bh=80WshDR6zLihMIQ1Fuov3rKfCExcliWYG7gNxmXPk7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yk6yyPAc2hOWc4dIMKPayEWT9+x49tnMdUb41Y7MmqNBSGcBC2lJ0x6soYH6mjNRYVIB8GvcrO/KjOirYl2626W7rSyhMynWYJUW1jUqyEFrPtpt9QiUkNiTe30ts29q7wCPpfoRaYA16UOuNIbtyDWlbnnCz6tXdlV0Yk1TKIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Owtdtunm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DC6C4CEEB;
	Tue, 27 May 2025 20:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748378429;
	bh=80WshDR6zLihMIQ1Fuov3rKfCExcliWYG7gNxmXPk7c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OwtdtunmXPkzmcPo5Zvv90XBDCf3clkTZfEJ+lQkMvBnR6NGp1JWLo4YpnpQouhY5
	 l91S4Y2z4hOLNvUIwbuO+zRT6T98CGMNGJV8Tm+jaIKhRJQa2KfTk5Ql5KtiL0ma76
	 +b1N7UYQo+403snDupipODXZ2vQl5eDtfjiGRIWFGaf3uMKCxAoiHIndK927UDnR9A
	 toNThqSZKsDQTMf81hXqIDAKZV96zls8uomnZ1fsH2fG6yCUTWVNBnsTocx/L2Gh0m
	 r65qn+57Lbr3hkFzPvDP4gqKqcY810sai7xe9A1HmZc4ZW87RP0LwprblFFSq0L368
	 jwY8oDt868zPw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 27 May 2025 22:40:04 +0200
Subject: [PATCH v3 2/6] phy: qcom: qmp-combo: Rename 'mode' to 'phy_mode'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-topic-4ln_dp_respin-v3-2-f9a0763ec289@oss.qualcomm.com>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
In-Reply-To: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748378414; l=2335;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=8zsk6pY1mGQ9V2CSqJ6lVOkHlqYoE0Q7NoLJL4vEC8U=;
 b=5MZe69aj4TYyDsj0Y9IbfBXXuhHnoYF7mfs5DjE0ElcTr5cxe9zX++shRcDvpWPbFqlYIvSs5
 LxW3ZppyI3TDwJFWCZLKRQ4nHbjHj7FWOBJ8JnX3o1n6gqjn/nKG0y/
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

There are a numbers of ""modes"" involved: USB mode, Type-C mode (with
its altmodes), phy_mode and QMP_PHY mode (DP/combo/USB/off).

Rename the generic sounding 'mode' to 'phy_mode' to hopefully make
the code easier to follow.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index b09fa00e9fe7db8d97b7179ee15d3f07fe578b0c..d0396817f3a05c7e4baeef0de1332c3a83942a51 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1687,7 +1687,7 @@ struct qmp_combo {
 	int init_count;
 
 	struct phy *usb_phy;
-	enum phy_mode mode;
+	enum phy_mode phy_mode;
 	unsigned int usb_init_count;
 
 	struct phy *dp_phy;
@@ -3062,7 +3062,7 @@ static int qmp_combo_usb_set_mode(struct phy *phy, enum phy_mode mode, int submo
 {
 	struct qmp_combo *qmp = phy_get_drvdata(phy);
 
-	qmp->mode = mode;
+	qmp->phy_mode = mode;
 
 	return 0;
 }
@@ -3091,8 +3091,8 @@ static void qmp_combo_enable_autonomous_mode(struct qmp_combo *qmp)
 	void __iomem *pcs_misc = qmp->pcs_misc;
 	u32 intr_mask;
 
-	if (qmp->mode == PHY_MODE_USB_HOST_SS ||
-	    qmp->mode == PHY_MODE_USB_DEVICE_SS)
+	if (qmp->phy_mode == PHY_MODE_USB_HOST_SS ||
+	    qmp->phy_mode == PHY_MODE_USB_DEVICE_SS)
 		intr_mask = ARCVR_DTCT_EN | ALFPS_DTCT_EN;
 	else
 		intr_mask = ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL;
@@ -3135,7 +3135,7 @@ static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
 {
 	struct qmp_combo *qmp = dev_get_drvdata(dev);
 
-	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
+	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->phy_mode);
 
 	if (!qmp->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
@@ -3155,7 +3155,7 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
 	struct qmp_combo *qmp = dev_get_drvdata(dev);
 	int ret = 0;
 
-	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
+	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->phy_mode);
 
 	if (!qmp->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");

-- 
2.49.0


