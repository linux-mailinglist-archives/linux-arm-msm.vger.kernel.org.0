Return-Path: <linux-arm-msm+bounces-7462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 694B7830780
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 15:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 564D81C21586
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 14:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E30F20312;
	Wed, 17 Jan 2024 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TuRMmDSQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8DC20319
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 14:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705500270; cv=none; b=XJzGF0IERhLryjkT8ayKlUZcSIPYQtNZHpSNbsaefN2H1dlCamLXhJ7FcDqhMzlInQjnZPQABbdrT7vsI+kFf9Gxn4X3+krPVcl8kYQq5i5jL6MIrWLYCjIxxSE4oxxMSnqX6ZDvzDc2Cq7+Nh+jWykAKZdqpSrKaxyQOP0bkd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705500270; c=relaxed/simple;
	bh=XQ5Pv7+enL8CAcnblULFpJMoVjMYx0Ov7jzzVvGDtFw=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key; b=n+gRS3d/K/sxAo/EKxO0TFIlqMcVDoK03egj/yAKxph7/JSVt0rxfGZfV1T3NWXtH+9DY+em3Ir8efUcTM9EEZseJFis58TuVnQbPvulYRkYHuaXAeFGHAsrKKFFj1yB7lGS0MKiMrkg1mvvkb6LlL6mhAfrfmEyBR7scWNgE9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TuRMmDSQ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e4e3323a6so11532997e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 06:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705500266; x=1706105066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72k1xLJVwiMJbLRb7ZUUcy6cJZtX/coZxcCHHlFdCmQ=;
        b=TuRMmDSQvhd4Z3baN0Qh1X8y0hoZgwO6Uwz33r/wZuloIqGPZO/zCQ5b0DEOwI3zvO
         sFGbXD+BoXwfaCBIDQaf0yIFt53a998029YSyMUO2PeFzgArml92eDeoPvio9SGukC7C
         7sbY0sSWCU7WLnl5Z9ixeZgoL9k5lhvCI4OX4blq5yD8UzWv6LR/OHA0DbxJkYOsKIb+
         19ic5FBQMzz6/Db0lnBD3OVx3GmkUJwzmlMqZznR6QQWlcrrxxcz+ErjJ7zJo9lUu2uP
         gcQvS88aVa6EqIvJzDymiL3l8MqERrQ2vuuttNAlUhmxzO1VuUegSVXFNstHFO+mDDc2
         T2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705500266; x=1706105066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72k1xLJVwiMJbLRb7ZUUcy6cJZtX/coZxcCHHlFdCmQ=;
        b=uVHMRERbBSvON4fP2G4PgV9RFP41DvpnXvygohGtSyTB/4O/vwLzjBntF0nBLhrrrz
         ewCzpFSqH/0ej23pdxvjdDg2SbpGHXI8r8vRW/Ug3LJD/+xhJoD6ZtPSL1K/HbuIdOGX
         Q6iUiHp6BuBdm/kmGPA3PYN6jcSUlu2WW0q0wqiOAsNuvY0VXfSq90bipu1qfa5t8FKo
         Gznpey5lWXYL4MhaCJ2mWgduoacuMWBFiZcxnPkTbCQUV5NPpQJ69hVFqY4rKn/7bHfF
         gtIeGwOOSZ+OpXMbovvhBrcmyXJYl18eviaFDj6GNkqFK4WITTjpAMO7rm1bZTREJ1FE
         dMXg==
X-Gm-Message-State: AOJu0YyimCSSsPx9wiRz94qK0FWnAORVebAwmPbdWJaUVwuPBAahaIp4
	niKSrxAWOwdiFdgQ+adGlp2h/st6FO+3gkqAvmsBOhd/qjoZpzZp8PExKp/pSCo=
X-Google-Smtp-Source: AGHT+IF4LwyCoukcpgt8rgqEw0LpkrX/Ucil34MzXMX67x66tM4HWKETBO/i4geX6cAeJ32JTkl5UQ==
X-Received: by 2002:a19:2d4d:0:b0:50e:7e45:4e43 with SMTP id t13-20020a192d4d000000b0050e7e454e43mr586156lft.15.1705500266641;
        Wed, 17 Jan 2024 06:04:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y29-20020a19915d000000b0050ec7a26420sm269711lfj.204.2024.01.17.06.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 06:04:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 16:04:24 +0200
Subject: [PATCH v2 3/6] phy: qcom: qmp-usbc: handle CLAMP register in a
 correct way
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240117-usbc-phy-vls-clamp-v2-3-a950c223f10f@linaro.org>
References: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
In-Reply-To: <20240117-usbc-phy-vls-clamp-v2-0-a950c223f10f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5055;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XQ5Pv7+enL8CAcnblULFpJMoVjMYx0Ov7jzzVvGDtFw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+rye+kxLw8d6ZKJDiu35KtJPjCHr2pR9MUNjQn3P1za+
 mJanl1kJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmsr2Mg6E5VXfJ8sz3dfNU
 nvRGTpaVy3L+4mfk81ekrLCEcyLj71+/1zz0qPm/Q0ZGpI3t8534bROcrLvtUk4lpXPc3Tb3rPT
 +Q+Jsp8oDPqxq/vJirkd/ty87ryKT2ZqavlllzzhWrZa01xd5vexq6kMLjRTPkgS/sOqufFuLXi
 lhzYsZlgd/m4TP9Fmo+qNrUmR/63O149oyC+5Lsjdvf6iVNS0kd+ZGaefjS2Q+rL2ZdTh5svDF6
 vUT1sqdfMgr/2+PTK2zTXNsivli5qnzX7TpW0z7pG2nZz+7mXeGxoF0HS3FrvY1U1oPM9lJ8jvo
 u57jfnur5MynOdGHOwWzFDwOGSTfqQytuDhH8EKabGs9AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The QMP USB PHYs on msm8998, qcm2290 and some other platforms don't have
the PCS_MISC_CLAMP_ENABLE register. Instead they need to toggle the
register in the TCSR space. Make the new phy-qcom-qmp-usbc driver
correctly handle the clamp register.

Fixes: a51969fafc82 ("phy: qcom-qmp: Add QMP V3 USB3 PHY support for msm8998")
Fixes: 8abe5e778b2c ("phy: qcom-qmp: Add QCM2290 USB3 PHY support")
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 48 ++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 214cf4203de4..3a4b4849db0f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -10,11 +10,13 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -56,9 +58,6 @@
 /* QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR register bits */
 #define IRQ_CLEAR				BIT(0)
 
-/* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
-#define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
-
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
 struct qmp_phy_init_tbl {
@@ -94,7 +93,6 @@ enum qphy_reg_layout {
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	QPHY_PCS_POWER_DOWN_CONTROL,
-	QPHY_PCS_MISC_CLAMP_ENABLE,
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
 };
@@ -106,7 +104,6 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V3_PCS_AUTONOMOUS_MODE_CTRL,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = QPHY_V3_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V3_PCS_POWER_DOWN_CONTROL,
-	[QPHY_PCS_MISC_CLAMP_ENABLE]	= QPHY_V3_PCS_MISC_CLAMP_ENABLE,
 };
 
 static const unsigned int qmp_v3_usb3phy_regs_layout_qcm2290[QPHY_LAYOUT_SIZE] = {
@@ -369,6 +366,9 @@ struct qmp_usbc {
 	void __iomem *tx2;
 	void __iomem *rx2;
 
+	struct regmap *tcsr_map;
+	u32 vls_clamp_reg;
+
 	struct clk *pipe_clk;
 	struct clk_bulk_data *clks;
 	int num_clks;
@@ -691,7 +691,6 @@ static void qmp_usbc_enable_autonomous_mode(struct qmp_usbc *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *pcs = qmp->pcs;
-	void __iomem *pcs_misc = qmp->pcs_misc;
 	u32 intr_mask;
 
 	if (qmp->mode == PHY_MODE_USB_HOST_SS ||
@@ -712,19 +711,18 @@ static void qmp_usbc_enable_autonomous_mode(struct qmp_usbc *qmp)
 	qphy_setbits(pcs, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL], intr_mask);
 
 	/* Enable i/o clamp_n for autonomous mode */
-	if (pcs_misc && cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE])
-		qphy_clrbits(pcs_misc, cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE], CLAMP_EN);
+	if (qmp->tcsr_map && qmp->vls_clamp_reg)
+		regmap_write(qmp->tcsr_map, qmp->vls_clamp_reg, 1);
 }
 
 static void qmp_usbc_disable_autonomous_mode(struct qmp_usbc *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *pcs = qmp->pcs;
-	void __iomem *pcs_misc = qmp->pcs_misc;
 
 	/* Disable i/o clamp_n on resume for normal mode */
-	if (pcs_misc && cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE])
-		qphy_setbits(pcs_misc, cfg->regs[QPHY_PCS_MISC_CLAMP_ENABLE], CLAMP_EN);
+	if (qmp->tcsr_map && qmp->vls_clamp_reg)
+		regmap_write(qmp->tcsr_map, qmp->vls_clamp_reg, 0);
 
 	qphy_clrbits(pcs, cfg->regs[QPHY_PCS_AUTONOMOUS_MODE_CTRL],
 		     ARCVR_DTCT_EN | ARCVR_DTCT_EVENT_SEL | ALFPS_DTCT_EN);
@@ -1063,6 +1061,30 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 	return 0;
 }
 
+static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
+{
+	struct of_phandle_args tcsr_args;
+	struct device *dev = qmp->dev;
+	int ret;
+
+	/*  for backwards compatibility ignore if there is no property */
+	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 0,
+					       &tcsr_args);
+	if (ret == -ENOENT)
+		return 0;
+	else if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to parse qcom,tcsr-reg\n");
+
+	qmp->tcsr_map = syscon_node_to_regmap(tcsr_args.np);
+	of_node_put(tcsr_args.np);
+	if (IS_ERR(qmp->tcsr_map))
+		return PTR_ERR(qmp->tcsr_map);
+
+	qmp->vls_clamp_reg = tcsr_args.args[0];
+
+	return 0;
+}
+
 static int qmp_usbc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1093,6 +1115,10 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = qmp_usbc_parse_vls_clamp(qmp);
+	if (ret)
+		return ret;
+
 	/* Check for legacy binding with child node. */
 	np = of_get_child_by_name(dev->of_node, "phy");
 	if (np) {

-- 
2.39.2


