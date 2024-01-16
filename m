Return-Path: <linux-arm-msm+bounces-7302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE65182E780
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 02:48:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E29151C22C22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 01:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EA820B39;
	Tue, 16 Jan 2024 01:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vzqpqr3E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D09A41C94
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 01:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e67e37661so12814278e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 17:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705367319; x=1705972119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72k1xLJVwiMJbLRb7ZUUcy6cJZtX/coZxcCHHlFdCmQ=;
        b=Vzqpqr3EuW0c7yh2ucx51PygdL0kqQAm5t69SK79wMc6ZNlnnv9XGhQl6pwXxN5xQf
         1pgfgqLqz7ygVJF/MmvNYJXnutGMSUkQ2kKebYMFYnQCfKF/w2ttm7X+cDTyOTKBksvc
         x/vekHmuvJan/IeeRGjJdZDya1Uv87XboBsMBnq8WOK6n79tM7g0bpsxFAc6w2ryMNPW
         mRu+Npwtr8EObzZ/nwtG3sjDbtt3TSSlOy8eUNzTBK+fFY3lERYpLXDUkYsg7mxFeFRA
         p5hDPacfCh2W4RhYcHxQ3Ng3ckYUK22bEGarbh9sPoMF4Mr1ermaKdxVQs1i1XOwMxOo
         Bdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705367319; x=1705972119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72k1xLJVwiMJbLRb7ZUUcy6cJZtX/coZxcCHHlFdCmQ=;
        b=QkuXsJvWrbUzoqBCllK6OAqRyjZyYoNTBkBl+KGH5sW/xiY5qQOO4zfSiaF53+oYwV
         xO/Ay/P3sV1hPzH25pIH8Knx9nLD+lf+TZ6iuw7lOsde2Yo0TM6wmKzeH+wi/LHDWdyn
         moJo/2AQkCQCDDDucQ8fH75Ii71bLtOCTaqJ/AL5p9mgkEOlTY9mdgozjwLml5zeEyeV
         n82oLfNu6yaE4X9m5+0hNcnY0LeKnNOshWQ5fVLWErTDbv975TQgQasj6myi9JaeD1lq
         KVtXEkaFrHzFtVK6ln9MMaLDfFvXvXqi6KvfAwHfTVyBA01/I5fG8v4sKll30vLIzczl
         D61g==
X-Gm-Message-State: AOJu0YwgtI2goxNvkMevN5vwJbbx/G19GiYTALXvXBzSvxYXjaBTfD5p
	kL0v622CdrjjhSqnA7c+vG1aOSGJgzO1ug==
X-Google-Smtp-Source: AGHT+IEHdQjC67yxbs6st+8RK0H1j+plr/G5cN8fl+jFYO03z1ncTKNkq6S882wQrVV+SIuwuG943g==
X-Received: by 2002:a05:6512:31c3:b0:50e:cae4:1c52 with SMTP id j3-20020a05651231c300b0050ecae41c52mr3533875lfe.106.1705367319726;
        Mon, 15 Jan 2024 17:08:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t3-20020a056512208300b0050eb2325472sm1615507lfr.37.2024.01.15.17.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 17:08:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jan 2024 03:08:29 +0200
Subject: [PATCH 3/6] phy: qcom: qmp-usbc: handle CLAMP register in a
 correct way
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-usbc-phy-vls-clamp-v1-3-73b2da7691c5@linaro.org>
References: <20240116-usbc-phy-vls-clamp-v1-0-73b2da7691c5@linaro.org>
In-Reply-To: <20240116-usbc-phy-vls-clamp-v1-0-73b2da7691c5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5055;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XQ5Pv7+enL8CAcnblULFpJMoVjMYx0Ov7jzzVvGDtFw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlpdcUGwNBPnlX0CcdJ9wAyEjTedGPvRMPpezqV
 KveL8p7W3eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaXXFAAKCRCLPIo+Aiko
 1f6eB/4tLjA4jNoELTTVUVfj7LoUH4GVYHmuiq1uVXGznyXax4TS9ZuxNQK6rcHQnRfV8jdq7fm
 3NFs26on14zIR0gWIFuqKiuBZ81mI0B+VNzXyKmOpKxYfo0ctY2Qy3dheLrSYB8xX9WJynLMzpO
 Eesq73QMO9pePPTr8mUFV7raPRuVudW/jmZfEVVag25lf5w4BmnfBkj0PtwzMtDN2ilh4b1Qvd2
 3kPT4ds+U3c987kDhz2yYeUOSQdUbwN8wOK5A17C6onM4bhMNkf0j/17ODI6NOlXrC5ZVmx0VHF
 zXd/d4F/NmBAZegDevoCnXbDtERoqDZbEefBjiNrjSCQdZVU
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


