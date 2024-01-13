Return-Path: <linux-arm-msm+bounces-7224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6260B82CE97
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 21:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A7591C210D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 20:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13F118AF8;
	Sat, 13 Jan 2024 20:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="raUpzt/Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88F418645
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 20:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50edf4f478eso4380678e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 12:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705179363; x=1705784163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDmXNNNMDIUsx3SecO6xUq1d/5Ek5JHAsPdmOAwi4V4=;
        b=raUpzt/QSNnwPtLIC3DEDciQSVr2gjiQY+ELZE4qchzyiTvo3kp9/8B2CdkTSDxG9D
         N+iHIgmQPlOaSef9hlWVMYqTE6cHtp04A4spVDShIxHct1qPz1K/mr5xSGT33hpR8CQt
         o7Zpr3kvFESHr155OdP0ADEXnwesBxNgzeb19ob+tVFU+CGvB7nFva01UfNx0TM1OzgH
         k+f+ofT5QxzTio0pRmjYyZWarHB6ZNwgX0c0Sph3IspWOLkdMIi/cdLUQKVU7qPP1dhZ
         W/DBc2ZbiuPlk9VQEpsjHVjoHF1TjUEKVDJJuLqM79Ue37kyPSkxzrWmDHRICr6ZbUV1
         B2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705179363; x=1705784163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDmXNNNMDIUsx3SecO6xUq1d/5Ek5JHAsPdmOAwi4V4=;
        b=H59XOOl4UE6VPbkXNNKUfkfEJBYR/XxvlX/b6g7vIj4AyyQhMqOYaRUmdcfZCXxzNq
         qvQB+io25qGitPx0a+L9TB8vpn0bZo1O2IU01JhrGQPd3e5Y7HDaDpMCIjv7/QN/aCfa
         vDqD5ue1spn9rDcnU5UBt0FKZhySJIfH+x7Dd/jtD+u854Ap+WQcLNdRmPMPVdOtd0t5
         5bol1JNxraSF+4nFAf7q1PqTGn0WR+EmVMaUMWbCMGQlh4lLOTqlmEMc59B7uCRVBqH2
         cbl2Xwd8Ix4xN+OyYht5iPNqaCRmpRW+zffycP8uTJzrRDpbRSJYuL4/ab/X+V2aZSqd
         q6JQ==
X-Gm-Message-State: AOJu0YxdCo4UrlJAjhgkpw2iKXXrByHqcP9XwjI1kauZay8ZlE3oKUQR
	mVoiT03FDHUBsfgM+KOyQP9WuuFtEsLcYe9tUNPnvLLRIWjMf8yU
X-Google-Smtp-Source: AGHT+IHg1ChbCZhYhZVrw3GoGq+oWnuqO7CKhbyVRPhKsJFnZBYWQnt2AS+4IMR8gs4bIWRNSuFg6Q==
X-Received: by 2002:a19:9115:0:b0:50e:4fd8:d293 with SMTP id t21-20020a199115000000b0050e4fd8d293mr1526154lfd.124.1705179363099;
        Sat, 13 Jan 2024 12:56:03 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512328e00b0050e9355d7eesm919802lfe.103.2024.01.13.12.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:56:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 22:55:55 +0200
Subject: [PATCH v2 12/15] phy: qcom: qmp-usbc: add support for the Type-C
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v2-12-182d9aa0a5b3@linaro.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5165;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AyyWXpZHbJcJG3JSjU+Vci0NPOyVsEJSPF3MW67UenM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlovjX7Ul2DQgqlUqachDmhog01C0SodaYjP0t9
 arg9gqjLj+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaL41wAKCRCLPIo+Aiko
 1fQzB/9dVLzfCNGXvel2vaFvwwCyM21MknDLKlm3leyef7xE88Jdl9+nbbt3kj9MfA9d9Xn6wyA
 yBfU6HRvwfp1OVgmyThFk2EDROuv+X0PvZC4X3G8e7xr65Fz/Paxmqnces5ZnBKuma6GkVPqadP
 35jX0Aum4tkSU6bm25JxH1A+7k0Kt6wVWMP4vLmWJGKnjZ6LKsc5CyHtcBGgG4vscnUJ5NR+RMp
 xz0bUqc0+mzyImP+VUKj6UGoJfFzEVFy7zT+8pmoJENX8dgV+c/FzNUSG2T/7mJvt4CKLz1tmiS
 IiFAKIbS2O1ZTCNavaofNoyC/gzi8OVFAmtnT1kFgbDbEj4a
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The USB-C PHYs on the msm8998, QCM2290 and SM6115 platforms use special
register to control which lanes of the Type-C port are used for the
SuperSpeed USB connection. Mimic the qmp-combo driver and handle this
register.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 97 +++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 52f1b3f7b81e..214cf4203de4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -18,6 +18,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/usb/typec.h>
+#include <linux/usb/typec_mux.h>
 
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
@@ -374,11 +376,17 @@ struct qmp_usbc {
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
+	struct mutex phy_mutex;
+
 	enum phy_mode mode;
+	unsigned int usb_init_count;
 
 	struct phy *phy;
 
 	struct clk_fixed_rate pipe_clk_fixed;
+
+	struct typec_switch_dev *sw;
+	enum typec_orientation orientation;
 };
 
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
@@ -497,6 +505,7 @@ static int qmp_usbc_init(struct phy *phy)
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	void __iomem *pcs = qmp->pcs;
+	u32 val = 0;
 	int ret;
 
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
@@ -523,6 +532,14 @@ static int qmp_usbc_init(struct phy *phy)
 
 	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
 
+#define SW_PORTSELECT_VAL			BIT(0)
+#define SW_PORTSELECT_MUX			BIT(1)
+	/* Use software based port select and switch on typec orientation */
+	val = SW_PORTSELECT_MUX;
+	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
+		val |= SW_PORTSELECT_VAL;
+	writel(val, qmp->pcs_misc);
+
 	return 0;
 
 err_assert_reset:
@@ -620,23 +637,34 @@ static int qmp_usbc_power_off(struct phy *phy)
 
 static int qmp_usbc_enable(struct phy *phy)
 {
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	int ret;
 
+	mutex_lock(&qmp->phy_mutex);
+
 	ret = qmp_usbc_init(phy);
 	if (ret)
-		return ret;
+		goto out_unlock;
 
 	ret = qmp_usbc_power_on(phy);
-	if (ret)
+	if (ret) {
 		qmp_usbc_exit(phy);
+		goto out_unlock;
+	}
+
+	qmp->usb_init_count++;
+out_unlock:
+	mutex_unlock(&qmp->phy_mutex);
 
 	return ret;
 }
 
 static int qmp_usbc_disable(struct phy *phy)
 {
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	int ret;
 
+	qmp->usb_init_count--;
 	ret = qmp_usbc_power_off(phy);
 	if (ret)
 		return ret;
@@ -874,6 +902,61 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
 	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
 }
 
+#if IS_ENABLED(CONFIG_TYPEC)
+static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
+				      enum typec_orientation orientation)
+{
+	struct qmp_usbc *qmp = typec_switch_get_drvdata(sw);
+
+	if (orientation == qmp->orientation || orientation == TYPEC_ORIENTATION_NONE)
+		return 0;
+
+	mutex_lock(&qmp->phy_mutex);
+	qmp->orientation = orientation;
+
+	if (qmp->usb_init_count) {
+		qmp_usbc_power_off(qmp->phy);
+		qmp_usbc_exit(qmp->phy);
+
+		qmp_usbc_init(qmp->phy);
+		qmp_usbc_power_on(qmp->phy);
+	}
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
+static void qmp_usbc_typec_unregister(void *data)
+{
+	struct qmp_usbc *qmp = data;
+
+	typec_switch_unregister(qmp->sw);
+}
+
+static int qmp_usbc_typec_switch_register(struct qmp_usbc *qmp)
+{
+	struct typec_switch_desc sw_desc = {};
+	struct device *dev = qmp->dev;
+
+	sw_desc.drvdata = qmp;
+	sw_desc.fwnode = dev->fwnode;
+	sw_desc.set = qmp_usbc_typec_switch_set;
+	qmp->sw = typec_switch_register(dev, &sw_desc);
+	if (IS_ERR(qmp->sw)) {
+		dev_err(dev, "Unable to register typec switch: %pe\n", qmp->sw);
+		return PTR_ERR(qmp->sw);
+	}
+
+	return devm_add_action_or_reset(dev, qmp_usbc_typec_unregister, qmp);
+}
+#else
+static int qmp_usbc_typec_switch_register(struct qmp_usbc *qmp)
+{
+	return 0;
+}
+#endif
+
 static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np)
 {
 	struct platform_device *pdev = to_platform_device(qmp->dev);
@@ -994,16 +1077,24 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	qmp->dev = dev;
 
+	qmp->orientation = TYPEC_ORIENTATION_NORMAL;
+
 	qmp->cfg = of_device_get_match_data(dev);
 	if (!qmp->cfg)
 		return -EINVAL;
 
+	mutex_init(&qmp->phy_mutex);
+
 	ret = qmp_usbc_vreg_init(qmp);
 	if (ret)
 		return ret;
 
+	ret = qmp_usbc_typec_switch_register(qmp);
+	if (ret)
+		return ret;
+
 	/* Check for legacy binding with child node. */
-	np = of_get_next_available_child(dev->of_node, NULL);
+	np = of_get_child_by_name(dev->of_node, "phy");
 	if (np) {
 		ret = qmp_usbc_parse_dt_legacy(qmp, np);
 	} else {

-- 
2.39.2


