Return-Path: <linux-arm-msm+bounces-88182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B8383D072C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 05:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4E9183003482
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 04:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAFA19309C;
	Fri,  9 Jan 2026 04:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="QsQyL8jz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754942030A
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 04:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767934372; cv=none; b=pIErpKdHwi6CnA1oebYkBi8CezBF+Gi3r21OqXskde9rjkEhFmBxFA9PZSrwjQBw9Xj2UnSUDewY0enMNhnSg1wdRliLsqEOQzArSfUb1ooh2evhf6zQzHowUKTu0Gvn+Gsy6jJsWoiEfywXx/mx5McsRNfVMJALk9538NKUJpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767934372; c=relaxed/simple;
	bh=Ub/3B+5s6x/ZliFSYWzeUUQFbBFzzPcvDp5hBVKLFNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ME8aFk48tITyXRNQEOLMte0QncQQYeMqGHqHqgSeISJi6gj4j3z7hgd1g+eFp7lwoRJptCgFo5xb7Jftq05sciWK427IJJeuRVTsi1gmplYyBBI0H/IMcrfhXIqmopewgkTIe+hznegp/lYJKmHOwlzsOn5N72LvLIoac0y8gOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=QsQyL8jz; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1767934369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0sT/VZ1CSwla233JrqBYhiBuZRpeUu4pgJTS5UY//NI=;
	b=QsQyL8jzlaFe6wLdYzHyHRY39UomvJmyvsHYEWLwjdra/NwAJqUiO/UC0z3PGy0vjwVOR3
	oq7Q3AmJQ78j4uDAR1uESizPzWtmhwW3fZuvLAxApF/kSnERyHbye8y5//r6cvlWbZbJgZ
	4fSwjcNKTtVHMmQRIz8LLYMxpfRYGQtpGiEFn2WKqW8Z7tl5CFEVj8o4tgkcERCupFj9s5
	3mHS+XoXrgApF2oECi6pVJPbNGNB1ANGsv3tThCo/6ppu/brV3zqRPQCXNXjUudjzK1SBg
	43UOv5wt418MBZJm/IUT/Q+ThG/H2QeRPVcYVO247/ZA17zI4hDZyPenaKRqCA==
From: Val Packett <val@packett.cool>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: qcom: edp: Fix NULL pointer dereference for phy v6 (x1e80100)
Date: Fri,  9 Jan 2026 01:50:28 -0300
Message-ID: <20260109045214.5983-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

For Glymur SoC support, the com_clk_fwd_cfg callback was added, and a
stub implementation was added for the v4 of the hardware. However it
was omitted for the v6, causing a NULL pointer dereference oops on
Hamoa/Purwa (X1E/X1P) SoC devices. Fix by adding the appropriate stub.

Fixes: add66a6673bc ("phy: qcom: edp: Add Glymur platform support")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 13feab99feec..a17492db21d8 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -613,6 +613,11 @@ static int qcom_edp_phy_com_resetsm_cntrl_v6(const struct qcom_edp *edp)
 				     val, val & BIT(0), 500, 10000);
 }
 
+static int qcom_edp_com_clk_fwd_cfg_v6(const struct qcom_edp *edp)
+{
+	return 0;
+}
+
 static int qcom_edp_com_bias_en_clkbuflr_v6(const struct qcom_edp *edp)
 {
 	/* Turn on BIAS current for PHY/PLL */
@@ -758,6 +763,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 	.com_power_on		= qcom_edp_phy_power_on_v6,
 	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v6,
 	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v6,
+	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v6,
 	.com_configure_pll	= qcom_edp_com_configure_pll_v6,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v6,
 };
-- 
2.51.2


