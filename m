Return-Path: <linux-arm-msm+bounces-7220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE3982CE8F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 21:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61317B22272
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 20:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAE41862B;
	Sat, 13 Jan 2024 20:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="odk6Jq1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15844182A3
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 20:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so9222823e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 12:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705179359; x=1705784159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfCDPHRZshUclTE7Q60hNvhZq8fsj+/CQe3BirP36lM=;
        b=odk6Jq1/bR2zxzMo/gVWxOsC72msgbkU8Lblw8LUdqvMCbqBmoGo5QLYSW81TgaE6b
         7qYbWQClg1/CobJNdB627Sl+e26KPwY7sis17lysWTiEqgbys94l/VMSMpY9sYOzxpeY
         TFx7pdEzyShh/cS6l3OVgW9sKyuPoFqmvlQbuOni0y3CpSTHzJkSkkb1uWR3YTXBZ/n1
         rC3pYxVyLqTh8lsXU0rnXZQFg69f/f0XciaI9Umerr19OMktwqpdyda0OjBR2aOZ3hBx
         Ic9jSAW012+j5Nc7cRqhNmhe0roHffjXqf8u2XB2gIBDUEr7Yw0aQ/gtiDLkUpNbUOHo
         mBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705179359; x=1705784159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfCDPHRZshUclTE7Q60hNvhZq8fsj+/CQe3BirP36lM=;
        b=aFjTnt5cZUH6xcVQ11gaKZgtZ8VxtH2+/Vm/tNZoz9aFtfpGTooz+cAXEjr1jfDB3H
         F+SPgDyaURezyfZ5WXC4/HwK7T7M2/mkD6Yviomb5kI8/lmkEDJgXCN7kumC6z5WQzdK
         w1+bai4yoVTG3aHPNCZ45nVh5G7WxD1LKpCmUYcUdxFAt3c+V1EysPHne+q4b60xvzIA
         YxQFooFg//D+FqkQ2IIZIlIek2SujQbkTGHdH89upahJdfQhITl+X5pTpnQlVGU79rGd
         XZhu1J+erTU5Oou3PDXAqGVOAV5/PE8fC/SsZO8VKmCtjDE9qqrDE9OzGskHT1Rcndyw
         jOhw==
X-Gm-Message-State: AOJu0YyX2t8A5I+TeMMjnLOXl3RvKFVr6LhImtZrDW1tVNUw94PJyg3d
	vqH9lQix78Wt6N58WngH2+9YgjJksrVE9Q==
X-Google-Smtp-Source: AGHT+IHusO1vG7W52BGFKamLfH32wJn7Z07eOGbCYsTYUA2QIc++slHBcDivGkUT5YMhpNkBx+LTQA==
X-Received: by 2002:ac2:4c26:0:b0:50e:9eaf:98ec with SMTP id u6-20020ac24c26000000b0050e9eaf98ecmr1556512lfq.54.1705179359169;
        Sat, 13 Jan 2024 12:55:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512328e00b0050e9355d7eesm919802lfe.103.2024.01.13.12.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:55:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 22:55:50 +0200
Subject: [PATCH v2 07/15] usb: typec: qcom-pmic-typec: allow different
 implementations for the PD PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v2-7-182d9aa0a5b3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18738;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FpV3mWAJeYNC5njvp3M2TJhjiJJSyONyWk1ydvxodyg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+qiH9fDvU3Pl/6NLdAtKEt4l15z41SRSVONxw3O5P+ZJ
 xkWCTJ2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAivFvZ/8oee+FbZfVd8Xj8
 lCncLaZzOn46srxf7HGg6GXn3C+RdQZXDxv1XxNyeu6S+6pB+0Wicrvy7RfXLZkUTsjopk0LPr/
 qcajD3DOWwgV8QXGNp7hVVNPzFrsWOq10ks2t+PHxA7OA95TP8maXBV7KJDc+m+rIuuWW4bPgpR
 +7FZu+ic2rl5GvfPOtSyr/1G1JiZDUzHWu578VCD+33zNVflehx5ncW6l3yjIP/Ov68/jFFKa1r
 jkO90+WGppp/uB5onW+fMW53N/8RopCykevtPSemCiw4qip1ARtI6XWm6q6CzIUJ8+Qnf1fY22E
 ZKZv3+K7Iv3HGwVsAn4ULi7f/Wp/tG7WT2cf+9J1wsqtAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Rework Qualcomm PMIC TCPM driver to allow different platform-specific
implementations of the PD PHY interface. While majority of platforms
has the same of register for the PD PHY, some obscure ones (PMI632) do
not have real PD PHY support. Add proper interface between the main
module and the PD PHY backend to allow switching the PD PHY
implementation.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |  91 +-----------
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h      |  25 ++++
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    | 153 ++++++++++++++++++---
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h    |  93 +------------
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h |   4 +-
 5 files changed, 171 insertions(+), 195 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index a243648abb4a..4c7c38c58a02 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -20,26 +20,15 @@
 
 #include <drm/bridge/aux-bridge.h>
 
+#include "qcom_pmic_typec.h"
 #include "qcom_pmic_typec_pdphy.h"
 #include "qcom_pmic_typec_port.h"
 
 struct pmic_typec_resources {
-	struct pmic_typec_pdphy_resources	*pdphy_res;
+	const struct pmic_typec_pdphy_resources	*pdphy_res;
 	struct pmic_typec_port_resources	*port_res;
 };
 
-struct pmic_typec {
-	struct device		*dev;
-	struct tcpm_port	*tcpm_port;
-	struct tcpc_dev		tcpc;
-	struct pmic_typec_pdphy	*pmic_typec_pdphy;
-	struct pmic_typec_port	*pmic_typec_port;
-	bool			vbus_enabled;
-	struct mutex		lock;		/* VBUS state serialization */
-};
-
-#define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_typec, tcpc)
-
 static int qcom_pmic_typec_get_vbus(struct tcpc_dev *tcpc)
 {
 	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
@@ -116,34 +105,6 @@ static int qcom_pmic_typec_start_toggling(struct tcpc_dev *tcpc,
 						   port_type, cc);
 }
 
-static int qcom_pmic_typec_set_roles(struct tcpc_dev *tcpc, bool attached,
-				     enum typec_role power_role,
-				     enum typec_data_role data_role)
-{
-	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
-
-	return qcom_pmic_typec_pdphy_set_roles(tcpm->pmic_typec_pdphy,
-					       power_role, data_role);
-}
-
-static int qcom_pmic_typec_set_pd_rx(struct tcpc_dev *tcpc, bool on)
-{
-	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
-
-	return qcom_pmic_typec_pdphy_set_pd_rx(tcpm->pmic_typec_pdphy, on);
-}
-
-static int qcom_pmic_typec_pd_transmit(struct tcpc_dev *tcpc,
-				       enum tcpm_transmit_type type,
-				       const struct pd_message *msg,
-				       unsigned int negotiated_rev)
-{
-	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
-
-	return qcom_pmic_typec_pdphy_pd_transmit(tcpm->pmic_typec_pdphy, type,
-						 msg, negotiated_rev);
-}
-
 static int qcom_pmic_typec_init(struct tcpc_dev *tcpc)
 {
 	return 0;
@@ -177,9 +138,6 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	tcpm->tcpc.set_polarity = qcom_pmic_typec_set_polarity;
 	tcpm->tcpc.set_vconn = qcom_pmic_typec_set_vconn;
 	tcpm->tcpc.start_toggling = qcom_pmic_typec_start_toggling;
-	tcpm->tcpc.set_pd_rx = qcom_pmic_typec_set_pd_rx;
-	tcpm->tcpc.set_roles = qcom_pmic_typec_set_roles;
-	tcpm->tcpc.pd_transmit = qcom_pmic_typec_pd_transmit;
 
 	regmap = dev_get_regmap(dev->parent, NULL);
 	if (!regmap) {
@@ -195,16 +153,12 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	if (IS_ERR(tcpm->pmic_typec_port))
 		return PTR_ERR(tcpm->pmic_typec_port);
 
-	tcpm->pmic_typec_pdphy = qcom_pmic_typec_pdphy_alloc(dev);
-	if (IS_ERR(tcpm->pmic_typec_pdphy))
-		return PTR_ERR(tcpm->pmic_typec_pdphy);
-
 	ret = qcom_pmic_typec_port_probe(pdev, tcpm->pmic_typec_port,
 					 res->port_res, regmap, base[0]);
 	if (ret)
 		return ret;
 
-	ret = qcom_pmic_typec_pdphy_probe(pdev, tcpm->pmic_typec_pdphy,
+	ret = qcom_pmic_typec_pdphy_probe(pdev, tcpm,
 					  res->pdphy_res, regmap, base[1]);
 	if (ret)
 		return ret;
@@ -231,8 +185,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	if (ret)
 		goto fwnode_remove;
 
-	ret = qcom_pmic_typec_pdphy_start(tcpm->pmic_typec_pdphy,
-					  tcpm->tcpm_port);
+	ret = tcpm->pdphy_start(tcpm, tcpm->tcpm_port);
 	if (ret)
 		goto fwnode_remove;
 
@@ -248,46 +201,12 @@ static void qcom_pmic_typec_remove(struct platform_device *pdev)
 {
 	struct pmic_typec *tcpm = platform_get_drvdata(pdev);
 
-	qcom_pmic_typec_pdphy_stop(tcpm->pmic_typec_pdphy);
+	tcpm->pdphy_stop(tcpm);
 	qcom_pmic_typec_port_stop(tcpm->pmic_typec_port);
 	tcpm_unregister_port(tcpm->tcpm_port);
 	fwnode_remove_software_node(tcpm->tcpc.fwnode);
 }
 
-static struct pmic_typec_pdphy_resources pm8150b_pdphy_res = {
-	.irq_params = {
-		{
-			.virq = PMIC_PDPHY_SIG_TX_IRQ,
-			.irq_name = "sig-tx",
-		},
-		{
-			.virq = PMIC_PDPHY_SIG_RX_IRQ,
-			.irq_name = "sig-rx",
-		},
-		{
-			.virq = PMIC_PDPHY_MSG_TX_IRQ,
-			.irq_name = "msg-tx",
-		},
-		{
-			.virq = PMIC_PDPHY_MSG_RX_IRQ,
-			.irq_name = "msg-rx",
-		},
-		{
-			.virq = PMIC_PDPHY_MSG_TX_FAIL_IRQ,
-			.irq_name = "msg-tx-failed",
-		},
-		{
-			.virq = PMIC_PDPHY_MSG_TX_DISCARD_IRQ,
-			.irq_name = "msg-tx-discarded",
-		},
-		{
-			.virq = PMIC_PDPHY_MSG_RX_DISCARD_IRQ,
-			.irq_name = "msg-rx-discarded",
-		},
-	},
-	.nr_irqs = 7,
-};
-
 static struct pmic_typec_port_resources pm8150b_port_res = {
 	.irq_params = {
 		{
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
new file mode 100644
index 000000000000..da035916c12a
--- /dev/null
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023, Linaro Ltd. All rights reserved.
+ */
+
+#ifndef __QCOM_PMIC_TYPEC_H__
+#define __QCOM_PMIC_TYPEC_H__
+
+struct pmic_typec {
+	struct device		*dev;
+	struct tcpm_port	*tcpm_port;
+	struct tcpc_dev		tcpc;
+	struct pmic_typec_pdphy	*pmic_typec_pdphy;
+	struct pmic_typec_port	*pmic_typec_port;
+	bool			vbus_enabled;
+	struct mutex		lock;		/* VBUS state serialization */
+
+	int (*pdphy_start)(struct pmic_typec *tcpm,
+			   struct tcpm_port *tcpm_port);
+	void (*pdphy_stop)(struct pmic_typec *tcpm);
+};
+
+#define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_typec, tcpc)
+
+#endif
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
index 44d8342ed0ad..984d90b0d763 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
@@ -14,8 +14,74 @@
 #include <linux/slab.h>
 #include <linux/usb/pd.h>
 #include <linux/usb/tcpm.h>
+#include "qcom_pmic_typec.h"
 #include "qcom_pmic_typec_pdphy.h"
 
+/* PD PHY register offsets and bit fields */
+#define USB_PDPHY_MSG_CONFIG_REG	0x40
+#define MSG_CONFIG_PORT_DATA_ROLE	BIT(3)
+#define MSG_CONFIG_PORT_POWER_ROLE	BIT(2)
+#define MSG_CONFIG_SPEC_REV_MASK	(BIT(1) | BIT(0))
+
+#define USB_PDPHY_EN_CONTROL_REG	0x46
+#define CONTROL_ENABLE			BIT(0)
+
+#define USB_PDPHY_RX_STATUS_REG		0x4A
+#define RX_FRAME_TYPE			(BIT(0) | BIT(1) | BIT(2))
+
+#define USB_PDPHY_FRAME_FILTER_REG	0x4C
+#define FRAME_FILTER_EN_HARD_RESET	BIT(5)
+#define FRAME_FILTER_EN_SOP		BIT(0)
+
+#define USB_PDPHY_TX_SIZE_REG		0x42
+#define TX_SIZE_MASK			0xF
+
+#define USB_PDPHY_TX_CONTROL_REG	0x44
+#define TX_CONTROL_RETRY_COUNT(n)	(((n) & 0x3) << 5)
+#define TX_CONTROL_FRAME_TYPE(n)        (((n) & 0x7) << 2)
+#define TX_CONTROL_FRAME_TYPE_CABLE_RESET	(0x1 << 2)
+#define TX_CONTROL_SEND_SIGNAL		BIT(1)
+#define TX_CONTROL_SEND_MSG		BIT(0)
+
+#define USB_PDPHY_RX_SIZE_REG		0x48
+
+#define USB_PDPHY_RX_ACKNOWLEDGE_REG	0x4B
+#define RX_BUFFER_TOKEN			BIT(0)
+
+#define USB_PDPHY_BIST_MODE_REG		0x4E
+#define BIST_MODE_MASK			0xF
+#define BIST_ENABLE			BIT(7)
+#define PD_MSG_BIST			0x3
+#define PD_BIST_TEST_DATA_MODE		0x8
+
+#define USB_PDPHY_TX_BUFFER_HDR_REG	0x60
+#define USB_PDPHY_TX_BUFFER_DATA_REG	0x62
+
+#define USB_PDPHY_RX_BUFFER_REG		0x80
+
+/* VDD regulator */
+#define VDD_PDPHY_VOL_MIN		2800000	/* uV */
+#define VDD_PDPHY_VOL_MAX		3300000	/* uV */
+#define VDD_PDPHY_HPM_LOAD		3000	/* uA */
+
+/* Message Spec Rev field */
+#define PD_MSG_HDR_REV(hdr)		(((hdr) >> 6) & 3)
+
+/* timers */
+#define RECEIVER_RESPONSE_TIME		15	/* tReceiverResponse */
+#define HARD_RESET_COMPLETE_TIME	5	/* tHardResetComplete */
+
+/* Interrupt numbers */
+#define PMIC_PDPHY_SIG_TX_IRQ		0x0
+#define PMIC_PDPHY_SIG_RX_IRQ		0x1
+#define PMIC_PDPHY_MSG_TX_IRQ		0x2
+#define PMIC_PDPHY_MSG_RX_IRQ		0x3
+#define PMIC_PDPHY_MSG_TX_FAIL_IRQ	0x4
+#define PMIC_PDPHY_MSG_TX_DISCARD_IRQ	0x5
+#define PMIC_PDPHY_MSG_RX_DISCARD_IRQ	0x6
+#define PMIC_PDPHY_FR_SWAP_IRQ		0x7
+
+
 struct pmic_typec_pdphy_irq_data {
 	int				virq;
 	int				irq;
@@ -231,11 +297,13 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
 	return ret;
 }
 
-int qcom_pmic_typec_pdphy_pd_transmit(struct pmic_typec_pdphy *pmic_typec_pdphy,
-				      enum tcpm_transmit_type type,
-				      const struct pd_message *msg,
-				      unsigned int negotiated_rev)
+static int qcom_pmic_typec_pdphy_pd_transmit(struct tcpc_dev *tcpc,
+					     enum tcpm_transmit_type type,
+					     const struct pd_message *msg,
+					     unsigned int negotiated_rev)
 {
+	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
+	struct pmic_typec_pdphy *pmic_typec_pdphy = tcpm->pmic_typec_pdphy;
 	struct device *dev = pmic_typec_pdphy->dev;
 	int ret;
 
@@ -336,8 +404,10 @@ static irqreturn_t qcom_pmic_typec_pdphy_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-int qcom_pmic_typec_pdphy_set_pd_rx(struct pmic_typec_pdphy *pmic_typec_pdphy, bool on)
+static int qcom_pmic_typec_pdphy_set_pd_rx(struct tcpc_dev *tcpc, bool on)
 {
+	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
+	struct pmic_typec_pdphy *pmic_typec_pdphy = tcpm->pmic_typec_pdphy;
 	unsigned long flags;
 	int ret;
 
@@ -353,10 +423,12 @@ int qcom_pmic_typec_pdphy_set_pd_rx(struct pmic_typec_pdphy *pmic_typec_pdphy, b
 	return ret;
 }
 
-int qcom_pmic_typec_pdphy_set_roles(struct pmic_typec_pdphy *pmic_typec_pdphy,
-				    enum typec_role power_role,
-				    enum typec_data_role data_role)
+static int qcom_pmic_typec_pdphy_set_roles(struct tcpc_dev *tcpc, bool attached,
+					   enum typec_role power_role,
+					   enum typec_data_role data_role)
 {
+	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
+	struct pmic_typec_pdphy *pmic_typec_pdphy = tcpm->pmic_typec_pdphy;
 	struct device *dev = pmic_typec_pdphy->dev;
 	unsigned long flags;
 	int ret;
@@ -437,9 +509,10 @@ static int pmic_typec_pdphy_reset(struct pmic_typec_pdphy *pmic_typec_pdphy)
 	return ret;
 }
 
-int qcom_pmic_typec_pdphy_start(struct pmic_typec_pdphy *pmic_typec_pdphy,
-				struct tcpm_port *tcpm_port)
+static int qcom_pmic_typec_pdphy_start(struct pmic_typec *tcpm,
+				       struct tcpm_port *tcpm_port)
 {
+	struct pmic_typec_pdphy *pmic_typec_pdphy = tcpm->pmic_typec_pdphy;
 	int i;
 	int ret;
 
@@ -459,8 +532,9 @@ int qcom_pmic_typec_pdphy_start(struct pmic_typec_pdphy *pmic_typec_pdphy,
 	return 0;
 }
 
-void qcom_pmic_typec_pdphy_stop(struct pmic_typec_pdphy *pmic_typec_pdphy)
+static void qcom_pmic_typec_pdphy_stop(struct pmic_typec *tcpm)
 {
+	struct pmic_typec_pdphy *pmic_typec_pdphy = tcpm->pmic_typec_pdphy;
 	int i;
 
 	for (i = 0; i < pmic_typec_pdphy->nr_irqs; i++)
@@ -471,21 +545,21 @@ void qcom_pmic_typec_pdphy_stop(struct pmic_typec_pdphy *pmic_typec_pdphy)
 	regulator_disable(pmic_typec_pdphy->vdd_pdphy);
 }
 
-struct pmic_typec_pdphy *qcom_pmic_typec_pdphy_alloc(struct device *dev)
-{
-	return devm_kzalloc(dev, sizeof(struct pmic_typec_pdphy), GFP_KERNEL);
-}
-
 int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
-				struct pmic_typec_pdphy *pmic_typec_pdphy,
-				struct pmic_typec_pdphy_resources *res,
+				struct pmic_typec *tcpm,
+				const struct pmic_typec_pdphy_resources *res,
 				struct regmap *regmap,
 				u32 base)
 {
+	struct pmic_typec_pdphy *pmic_typec_pdphy;
 	struct device *dev = &pdev->dev;
 	struct pmic_typec_pdphy_irq_data *irq_data;
 	int i, ret, irq;
 
+	pmic_typec_pdphy = devm_kzalloc(dev, sizeof(*pmic_typec_pdphy), GFP_KERNEL);
+	if (!pmic_typec_pdphy)
+		return -ENOMEM;
+
 	if (!res->nr_irqs || res->nr_irqs > PMIC_PDPHY_MAX_IRQS)
 		return -EINVAL;
 
@@ -524,5 +598,48 @@ int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
 			return ret;
 	}
 
+	tcpm->pmic_typec_pdphy = pmic_typec_pdphy;
+
+	tcpm->tcpc.set_pd_rx = qcom_pmic_typec_pdphy_set_pd_rx;
+	tcpm->tcpc.set_roles = qcom_pmic_typec_pdphy_set_roles;
+	tcpm->tcpc.pd_transmit = qcom_pmic_typec_pdphy_pd_transmit;
+
+	tcpm->pdphy_start = qcom_pmic_typec_pdphy_start;
+	tcpm->pdphy_stop = qcom_pmic_typec_pdphy_stop;
+
 	return 0;
 }
+
+const struct pmic_typec_pdphy_resources pm8150b_pdphy_res = {
+	.irq_params = {
+		{
+			.virq = PMIC_PDPHY_SIG_TX_IRQ,
+			.irq_name = "sig-tx",
+		},
+		{
+			.virq = PMIC_PDPHY_SIG_RX_IRQ,
+			.irq_name = "sig-rx",
+		},
+		{
+			.virq = PMIC_PDPHY_MSG_TX_IRQ,
+			.irq_name = "msg-tx",
+		},
+		{
+			.virq = PMIC_PDPHY_MSG_RX_IRQ,
+			.irq_name = "msg-rx",
+		},
+		{
+			.virq = PMIC_PDPHY_MSG_TX_FAIL_IRQ,
+			.irq_name = "msg-tx-failed",
+		},
+		{
+			.virq = PMIC_PDPHY_MSG_TX_DISCARD_IRQ,
+			.irq_name = "msg-tx-discarded",
+		},
+		{
+			.virq = PMIC_PDPHY_MSG_RX_DISCARD_IRQ,
+			.irq_name = "msg-rx-discarded",
+		},
+	},
+	.nr_irqs = 7,
+};
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
index 070822dc6f17..5f428e67ccfe 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.h
@@ -8,74 +8,6 @@
 
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/usb/tcpm.h>
-
-#define USB_PDPHY_MAX_DATA_OBJ_LEN	28
-#define USB_PDPHY_MSG_HDR_LEN		2
-
-/* PD PHY register offsets and bit fields */
-#define USB_PDPHY_MSG_CONFIG_REG	0x40
-#define MSG_CONFIG_PORT_DATA_ROLE	BIT(3)
-#define MSG_CONFIG_PORT_POWER_ROLE	BIT(2)
-#define MSG_CONFIG_SPEC_REV_MASK	(BIT(1) | BIT(0))
-
-#define USB_PDPHY_EN_CONTROL_REG	0x46
-#define CONTROL_ENABLE			BIT(0)
-
-#define USB_PDPHY_RX_STATUS_REG		0x4A
-#define RX_FRAME_TYPE			(BIT(0) | BIT(1) | BIT(2))
-
-#define USB_PDPHY_FRAME_FILTER_REG	0x4C
-#define FRAME_FILTER_EN_HARD_RESET	BIT(5)
-#define FRAME_FILTER_EN_SOP		BIT(0)
-
-#define USB_PDPHY_TX_SIZE_REG		0x42
-#define TX_SIZE_MASK			0xF
-
-#define USB_PDPHY_TX_CONTROL_REG	0x44
-#define TX_CONTROL_RETRY_COUNT(n)	(((n) & 0x3) << 5)
-#define TX_CONTROL_FRAME_TYPE(n)        (((n) & 0x7) << 2)
-#define TX_CONTROL_FRAME_TYPE_CABLE_RESET	(0x1 << 2)
-#define TX_CONTROL_SEND_SIGNAL		BIT(1)
-#define TX_CONTROL_SEND_MSG		BIT(0)
-
-#define USB_PDPHY_RX_SIZE_REG		0x48
-
-#define USB_PDPHY_RX_ACKNOWLEDGE_REG	0x4B
-#define RX_BUFFER_TOKEN			BIT(0)
-
-#define USB_PDPHY_BIST_MODE_REG		0x4E
-#define BIST_MODE_MASK			0xF
-#define BIST_ENABLE			BIT(7)
-#define PD_MSG_BIST			0x3
-#define PD_BIST_TEST_DATA_MODE		0x8
-
-#define USB_PDPHY_TX_BUFFER_HDR_REG	0x60
-#define USB_PDPHY_TX_BUFFER_DATA_REG	0x62
-
-#define USB_PDPHY_RX_BUFFER_REG		0x80
-
-/* VDD regulator */
-#define VDD_PDPHY_VOL_MIN		2800000	/* uV */
-#define VDD_PDPHY_VOL_MAX		3300000	/* uV */
-#define VDD_PDPHY_HPM_LOAD		3000	/* uA */
-
-/* Message Spec Rev field */
-#define PD_MSG_HDR_REV(hdr)		(((hdr) >> 6) & 3)
-
-/* timers */
-#define RECEIVER_RESPONSE_TIME		15	/* tReceiverResponse */
-#define HARD_RESET_COMPLETE_TIME	5	/* tHardResetComplete */
-
-/* Interrupt numbers */
-#define PMIC_PDPHY_SIG_TX_IRQ		0x0
-#define PMIC_PDPHY_SIG_RX_IRQ		0x1
-#define PMIC_PDPHY_MSG_TX_IRQ		0x2
-#define PMIC_PDPHY_MSG_RX_IRQ		0x3
-#define PMIC_PDPHY_MSG_TX_FAIL_IRQ	0x4
-#define PMIC_PDPHY_MSG_TX_DISCARD_IRQ	0x5
-#define PMIC_PDPHY_MSG_RX_DISCARD_IRQ	0x6
-#define PMIC_PDPHY_FR_SWAP_IRQ		0x7
 
 /* Resources */
 #define PMIC_PDPHY_MAX_IRQS		0x08
@@ -87,34 +19,17 @@ struct pmic_typec_pdphy_irq_params {
 
 struct pmic_typec_pdphy_resources {
 	unsigned int				nr_irqs;
-	struct pmic_typec_pdphy_irq_params	irq_params[PMIC_PDPHY_MAX_IRQS];
+	const struct pmic_typec_pdphy_irq_params	irq_params[PMIC_PDPHY_MAX_IRQS];
 };
 
 /* API */
 struct pmic_typec_pdphy;
 
-struct pmic_typec_pdphy *qcom_pmic_typec_pdphy_alloc(struct device *dev);
-
+extern const struct pmic_typec_pdphy_resources pm8150b_pdphy_res;
 int qcom_pmic_typec_pdphy_probe(struct platform_device *pdev,
-				struct pmic_typec_pdphy *pmic_typec_pdphy,
-				struct pmic_typec_pdphy_resources *res,
+				struct pmic_typec *tcpm,
+				const struct pmic_typec_pdphy_resources *res,
 				struct regmap *regmap,
 				u32 base);
 
-int qcom_pmic_typec_pdphy_start(struct pmic_typec_pdphy *pmic_typec_pdphy,
-				struct tcpm_port *tcpm_port);
-
-void qcom_pmic_typec_pdphy_stop(struct pmic_typec_pdphy *pmic_typec_pdphy);
-
-int qcom_pmic_typec_pdphy_set_roles(struct pmic_typec_pdphy *pmic_typec_pdphy,
-				    enum typec_role power_role,
-				    enum typec_data_role data_role);
-
-int qcom_pmic_typec_pdphy_set_pd_rx(struct pmic_typec_pdphy *pmic_typec_pdphy, bool on);
-
-int qcom_pmic_typec_pdphy_pd_transmit(struct pmic_typec_pdphy *pmic_typec_pdphy,
-				      enum tcpm_transmit_type type,
-				      const struct pd_message *msg,
-				      unsigned int negotiated_rev);
-
 #endif /* __QCOM_PMIC_TYPEC_PDPHY_H__ */
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h
index d4d358c680b6..4a892048908e 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
  * Copyright (c) 2023, Linaro Ltd. All rights reserved.
  */
-#ifndef __QCOM_PMIC_TYPEC_H__
-#define __QCOM_PMIC_TYPEC_H__
+#ifndef __QCOM_PMIC_TYPEC_PORT_H__
+#define __QCOM_PMIC_TYPEC_PORT_H__
 
 #include <linux/platform_device.h>
 #include <linux/usb/tcpm.h>

-- 
2.39.2


