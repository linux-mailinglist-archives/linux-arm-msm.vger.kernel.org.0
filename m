Return-Path: <linux-arm-msm+bounces-12966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9340A86C9B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 14:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 469C42888C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 13:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6E97E58D;
	Thu, 29 Feb 2024 13:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q3bsZ+Sr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229327E10B
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 13:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709212036; cv=none; b=t9sB8aY0eNi7uxuG4rQzl17Qkzt0WM0aYqWpPMBGHWjylsL1rZ4zePKuLp/OATXRPgvx6AswOfhe3irQNI3yA6/Jxg+JSjN0UxhhPYXrqYP1aFU1C26DvPwSCrYKTT0PBAD6IX4KdWWGaL8VA1Jwi0Tg1ROngR27XR3f0yIXeL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709212036; c=relaxed/simple;
	bh=X1JC6Xko/brlq2AN9Kavl/JUaqcQsV6GNBW/pXtYk2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FDyPJ+oEnnDYmZ8zQUOUdQIz1FiP53y6KQ6ye0Y8TnOFJmQb8vqqTT2LNDHRzfcZnj5A4+etn8y0MyLo1OyPeNn+HmkLIn51Rf/hbTGdg6nCODdGj7OaNRBPS3I0mT1OVGq2luYLqCy5pnokTCl+mgtywC/vzeg32gTeLSt7PwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q3bsZ+Sr; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-412bfacd146so2760765e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 05:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709212033; x=1709816833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uIfY5ntnNufGy4UYEPo9i3yGnfffKpCKmKs8Z7x9Cg=;
        b=q3bsZ+Sryrek3Dp0PONMDHUeprLNmBcJV/dUgHjpVgoTW5r/SVuUqKhAwsEOptWI6N
         arCOeiGBriFJRMpQAs6aoQk1liLLYHZyqcUfzNFeXqQX1cuqe+ykguOWDeFRQUPCb6D5
         6A3b2ws8n2bkY9govH/NX4mStfYL3kZj2mfujkn7etR/9s4N6Vz1vE4LNmK/ZKnOSozY
         VMvP9Qpkk9Jde/5aQhm/CeHe8Eh2oE69t2hV88xjQTjY70wKwxC0CuQs+7l/dBO1+UTi
         9LvumiNGGKSz4yHZq7vupoBELLBlwClcYlMw6pxRDgmUHCWGd7755zfWrx1aIIpuVvep
         A3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709212033; x=1709816833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uIfY5ntnNufGy4UYEPo9i3yGnfffKpCKmKs8Z7x9Cg=;
        b=BwH4wk3Dfz6x1JivzehHrEZsphulE4dsYSJd88D8cNSrZoUGXonDUL78pZaYRjbt6Y
         MuTrdFeeidGb6O4rryGcdZdNXCu0dKsSiHTKYWXIZHblSjZZgmV2XoUAGf/qZoQoHSI5
         8NzWZp3bW5vVyRdqwOYK6QUrBfJpW68pC67aMwIw8TUAnYBE57+y/V0rOsu2iFR1Jgsy
         L9Xmu15UckpHpGY9L3MqYPwV1OkBXu555ByvsG8H36f0z57lwpBe9WQOYHzq2EvYFuK0
         kiHj1vzWF8op1mnASqFtcsex1kUYoivba4R/Wd6ERJFZYRMCmczq3b6npjTeWSxrMCkE
         ozcw==
X-Gm-Message-State: AOJu0Yx4pZTEMJh4i9GFIwmf14z0dHwbT9/qXtTfM0Yu6K8a7NcuwZ1Q
	fkXd98NYNez4JMTN+cLA8eMTxxf6WnOLvqpcQUEDw+3S1A0fYn4TaMBF2kLPg5Eky2HSis6EooF
	ERMw=
X-Google-Smtp-Source: AGHT+IFs4nV8miq0IK8B287pip+3Gpyj9/MX3VZQhKrSuFji1E+4+hZHhgsqd+s9dN8nbt2XIkHbiQ==
X-Received: by 2002:a05:600c:1f07:b0:412:a0f9:391 with SMTP id bd7-20020a05600c1f0700b00412a0f90391mr1978004wmb.2.1709212033570;
        Thu, 29 Feb 2024 05:07:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600c198700b00412a38e732csm2071473wmq.35.2024.02.29.05.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 05:07:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 29 Feb 2024 14:07:03 +0100
Subject: [PATCH RFT 3/7] phy: qcom: qmp-combo: introduce QPHY_MODE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-3-07e24a231840@linaro.org>
References: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>
In-Reply-To: <20240229-topic-sm8x50-upstream-phy-combo-typec-mux-v1-0-07e24a231840@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2847;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=X1JC6Xko/brlq2AN9Kavl/JUaqcQsV6GNBW/pXtYk2g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl4IF7bR995LMpFRuBZdMowgnvRMAzKvP6HT+j6bBn
 u6qijAOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZeCBewAKCRB33NvayMhJ0dQnD/
 4hNlvIyL/Ebb4vd28Lo3pt7v0cvIWPEgi6PPa/eZ5GmfzzRU6yKgZYIaKc6aJa6PVdZy5nOY534bbM
 C9Z5GPriw4NAxtshNm8QqBAjTU4JsnWWnjnFl/uh6vUJKjvvx8nmFLfTCiUU5Ld4Sjz72lq4BGQsdx
 CZBpiP+9l1wvfC0sQMHCZd8H3bbcw+kDOYbNaddUPUX9WBs0+/Gly0eD6RIppiPsVmI10kVcHCOPsV
 cDjdboIKv3VP5jgNKB59IjGgG94HLPR8sCyyWCpQsfT6NPsKER06GeDaEN+U1BOwwhivt8KbHtvIuW
 dYExHtEopydMXRbuK3RKSTNRt/aSp/NLcsSkX8Up4FtIYVc9sSov8qYuVpK8HgvtyUk5WbIKA+nLa3
 OKTV5RsMCTcPBMreqQcGlYH45vYN7Fl6m1DANR5Hr1OvbvVkhu0uFpYPLLx8xuyopRHj7TZHllTAOP
 oDBgQDYry4ojq3ngLDPIEADXMe7wlZghvBUUHrSIIi6KWAroAjkLv0bljBNjhu+K2/oDxnlsTVi58a
 4euoIMmLUHEhxyRea7K7Zdvcs7Th8kKZ3z6dSGR/00l/8v7INoyvCrXySk4Hqorx2ePkrsXHxwaYQi
 2yrXhNLfgwlsZ/1jfqWVpnbKmyx2bZsv1dJp46javpCAf5/bNawRFV7P3ERQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Introduce an enum for the QMP Combo PHY modes, use it in the
QMP commmon phy init function and default to COMBO mode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 41 +++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 3721bbea9eae..ac5d528fd7a1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -61,6 +61,12 @@
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
+enum qphy_mode {
+	QPHY_MODE_COMBO = 0,
+	QPHY_MODE_DP_ONLY,
+	QPHY_MODE_USB_ONLY,
+};
+
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
 	/* PCS registers */
@@ -1491,6 +1497,7 @@ struct qmp_combo {
 
 	struct mutex phy_mutex;
 	int init_count;
+	enum qphy_mode init_mode;
 
 	struct phy *usb_phy;
 	enum phy_mode mode;
@@ -2531,12 +2538,33 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
 		val |= SW_PORTSELECT_VAL;
 	writel(val, com + QPHY_V3_DP_COM_TYPEC_CTRL);
-	writel(USB3_MODE | DP_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
 
-	/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
-	qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
-			SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
-			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+	switch (qmp->init_mode) {
+		case QPHY_MODE_COMBO:
+			writel(USB3_MODE | DP_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
+
+			/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
+			qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
+					SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
+					SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+			break;
+
+		case QPHY_MODE_DP_ONLY:
+			writel(DP_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
+
+			/* bring QMP DP PHY PCS block out of reset */
+			qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
+					SW_DPPHY_RESET_MUX | SW_DPPHY_RESET);
+			break;
+
+		case QPHY_MODE_USB_ONLY:
+			writel(USB3_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
+
+			/* bring QMP USB PHY PCS block out of reset */
+			qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
+					SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+			break;
+	}
 
 	qphy_clrbits(com, QPHY_V3_DP_COM_SWI_CTRL, 0x03);
 	qphy_clrbits(com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
@@ -3545,6 +3573,9 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	/* Set PHY_MODE as combo by default */
+	qmp->init_mode = QPHY_MODE_COMBO;
+
 	qmp->usb_phy = devm_phy_create(dev, usb_np, &qmp_combo_usb_phy_ops);
 	if (IS_ERR(qmp->usb_phy)) {
 		ret = PTR_ERR(qmp->usb_phy);

-- 
2.34.1


