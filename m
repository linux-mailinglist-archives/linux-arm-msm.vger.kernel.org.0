Return-Path: <linux-arm-msm+bounces-17705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1610B8A84AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 15:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38F501C21D3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 13:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA8714039D;
	Wed, 17 Apr 2024 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nkkCRq2C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888BC1420D5;
	Wed, 17 Apr 2024 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713360584; cv=none; b=eoxv/zvMgo9XIa91wobVVbLGQqC7xbn9TDWdDZn9mVfF7eKegBKoznX1LJVyDzWf4NWQ5CVk4pHI8AncMtKWP8gbcBi+UH/qMjllo+7GNJroO9HNP3PoLlTMaS+2NxzJ03y5XZ0GyiqC9aI+5VPGaqaSK0fm+z/cCpR+v+AYv0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713360584; c=relaxed/simple;
	bh=pBzVrceJkrfSqxjYHLXqFtkb7sm5O0JX+rpNIQ5y6do=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sm+7zAj+nInKYmd8SU0bCTXZllSWodfLOzsf8Ly6iN4JdTypieVjktsoSXfviNMeSuYIBq688J9+ZnpuXLkWcbFyxpRZE7uX9RsZxHpg5JDp/x95AuarD6UcDtbioAkXHOIf+X994U7QNLcSrTeG+jbvfk0AAFIdS505jsCt4WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nkkCRq2C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43H7GjSE026531;
	Wed, 17 Apr 2024 13:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=k5jUMk4vqRLL3ytcriAAAnylRNIZuaDRPfAwEchufZQ=; b=nk
	kCRq2COxmbZJwG7dkMN9DPR1fYt+42kt7X+wInJYIr8yP3AnY5gqMoDbs/c3Hras
	zPDGIGNlaT8UmEL33hMTsWqWBY5PySHCarpBFU+6ENSiBqwT52lsgbF1WZ64XsJf
	WJ1+xjOaroqfHJNForK1q3rKZHcJLVFCuIHqiFGRO4VUX3wAPSkomMEomg0p/aAB
	KJs4VGH863zEAG+zHe8+5eYT3zHOZJ8DQlLaw3lIyjhyTfjIZgwi4ZJtOP5KWajS
	+9LD+f/2I0D2qic/uILDpKaypp3VelYeThuxYMfsa7a174o8cVV2FWO53XWcjQeP
	+Z0/Q8Co1F6d3k7oU3Jw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xj9w58u5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 13:29:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43HDTXYY010282
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 13:29:33 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Apr 2024 06:29:28 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <jassisinghbrar@gmail.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <quic_gkohli@quicinc.com>,
        <quic_nkela@quicinc.com>, <quic_psodagud@quicinc.com>
Subject: [PATCH V3 2/5] mailbox: Add support for QTI CPUCP mailbox controller
Date: Wed, 17 Apr 2024 18:58:53 +0530
Message-ID: <20240417132856.1106250-3-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417132856.1106250-1-quic_sibis@quicinc.com>
References: <20240417132856.1106250-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nJ_zG3H_cPNXUvbgmkmIwfB5ZscQGG-F
X-Proofpoint-GUID: nJ_zG3H_cPNXUvbgmkmIwfB5ZscQGG-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_10,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404170092

Add support for CPUSS Control Processor (CPUCP) mailbox controller,
this driver enables communication between AP and CPUCP by acting as
a doorbell between them.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---

v2:
* Use BIT() instead of manual shift. [Dmitry]
* Define RX_MBOX_CMD to account for chan calculation. [Dmitry]
* Clear the bit instead of the entire status within the spinlock. [Dmitry]
* Use dev_err_probe instead. [Dmitry]
* Drop superfluous error message while handling errors from get_irq. [Dmitry]
* Use devm_mbox_controller_register and drop remove path. [Dmitry]
* Define TX_MBOX_CMD to account for chan calculation.
* Use cpucp->dev in probe path for conformity.

 drivers/mailbox/Kconfig           |   8 ++
 drivers/mailbox/Makefile          |   2 +
 drivers/mailbox/qcom-cpucp-mbox.c | 188 ++++++++++++++++++++++++++++++
 3 files changed, 198 insertions(+)
 create mode 100644 drivers/mailbox/qcom-cpucp-mbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 42940108a187..23741a6f054e 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -273,6 +273,14 @@ config SPRD_MBOX
 	  to send message between application processors and MCU. Say Y here if
 	  you want to build the Spreatrum mailbox controller driver.
 
+config QCOM_CPUCP_MBOX
+	tristate "Qualcomm Technologies, Inc. CPUCP mailbox driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	help
+	  Qualcomm Technologies, Inc. CPUSS Control Processor (CPUCP) mailbox
+	  controller driver enables communication between AP and CPUCP. Say
+	  Y here if you want to build this driver.
+
 config QCOM_IPCC
 	tristate "Qualcomm Technologies, Inc. IPCC driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 18793e6caa2f..53b512800bde 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -59,4 +59,6 @@ obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
 
 obj-$(CONFIG_SPRD_MBOX)		+= sprd-mailbox.o
 
+obj-$(CONFIG_QCOM_CPUCP_MBOX)	+= qcom-cpucp-mbox.o
+
 obj-$(CONFIG_QCOM_IPCC)		+= qcom-ipcc.o
diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
new file mode 100644
index 000000000000..059eb25f217c
--- /dev/null
+++ b/drivers/mailbox/qcom-cpucp-mbox.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/platform_device.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+
+#define APSS_CPUCP_IPC_CHAN_SUPPORTED		3
+#define APSS_CPUCP_MBOX_CMD_OFF			0x4
+
+/* Tx Registers */
+#define APSS_CPUCP_TX_MBOX_IDR			0
+#define APSS_CPUCP_TX_MBOX_CMD(i)		(0x100 + ((i) * 8))
+
+/* Rx Registers */
+#define APSS_CPUCP_RX_MBOX_IDR			0
+#define APSS_CPUCP_RX_MBOX_CMD(i)		(0x100 + ((i) * 8))
+#define APSS_CPUCP_RX_MBOX_MAP			0x4000
+#define APSS_CPUCP_RX_MBOX_STAT			0x4400
+#define APSS_CPUCP_RX_MBOX_CLEAR		0x4800
+#define APSS_CPUCP_RX_MBOX_EN			0x4C00
+#define APSS_CPUCP_RX_MBOX_CMD_MASK		0xFFFFFFFFFFFFFFFF
+
+/**
+ * struct qcom_cpucp_mbox - Holder for the mailbox driver
+ * @chans:			The mailbox channel
+ * @mbox:			The mailbox controller
+ * @tx_base:			Base address of the CPUCP tx registers
+ * @rx_base:			Base address of the CPUCP rx registers
+ * @dev:			Device associated with this instance
+ * @irq:			CPUCP to AP irq
+ */
+struct qcom_cpucp_mbox {
+	struct mbox_chan chans[APSS_CPUCP_IPC_CHAN_SUPPORTED];
+	struct mbox_controller mbox;
+	void __iomem *tx_base;
+	void __iomem *rx_base;
+	struct device *dev;
+	int irq;
+};
+
+static inline int channel_number(struct mbox_chan *chan)
+{
+	return chan - chan->mbox->chans;
+}
+
+static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
+{
+	struct qcom_cpucp_mbox *cpucp = data;
+	struct mbox_chan *chan;
+	unsigned long flags;
+	u64 status;
+	u32 val;
+	int i;
+
+	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
+
+	for (i = 0; i < APSS_CPUCP_IPC_CHAN_SUPPORTED; i++) {
+		val = 0;
+		if (status & BIT(i)) {
+			val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
+			chan = &cpucp->chans[i];
+			spin_lock_irqsave(&chan->lock, flags);
+			if (chan->cl)
+				mbox_chan_received_data(chan, &val);
+			writeq(BIT(i), cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
+			spin_unlock_irqrestore(&chan->lock, flags);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int qcom_cpucp_mbox_startup(struct mbox_chan *chan)
+{
+	struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
+	unsigned long chan_id = channel_number(chan);
+	u64 val;
+
+	val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
+	val |= BIT(chan_id);
+	writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
+
+	return 0;
+}
+
+static void qcom_cpucp_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
+	unsigned long chan_id = channel_number(chan);
+	u64 val;
+
+	val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
+	val &= ~BIT(chan_id);
+	writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
+}
+
+static int qcom_cpucp_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct qcom_cpucp_mbox *cpucp = container_of(chan->mbox, struct qcom_cpucp_mbox, mbox);
+	unsigned long chan_id = channel_number(chan);
+	u32 *val = data;
+
+	writel(*val, cpucp->tx_base + APSS_CPUCP_TX_MBOX_CMD(chan_id) + APSS_CPUCP_MBOX_CMD_OFF);
+
+	return 0;
+}
+
+static const struct mbox_chan_ops qcom_cpucp_mbox_chan_ops = {
+	.startup = qcom_cpucp_mbox_startup,
+	.send_data = qcom_cpucp_mbox_send_data,
+	.shutdown = qcom_cpucp_mbox_shutdown
+};
+
+static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
+{
+	struct qcom_cpucp_mbox *cpucp;
+	struct mbox_controller *mbox;
+	int ret;
+
+	cpucp = devm_kzalloc(&pdev->dev, sizeof(*cpucp), GFP_KERNEL);
+	if (!cpucp)
+		return -ENOMEM;
+
+	cpucp->dev = &pdev->dev;
+
+	cpucp->rx_base = devm_of_iomap(cpucp->dev, cpucp->dev->of_node, 0, NULL);
+	if (IS_ERR(cpucp->rx_base))
+		return PTR_ERR(cpucp->rx_base);
+
+	cpucp->tx_base = devm_of_iomap(cpucp->dev, cpucp->dev->of_node, 1, NULL);
+	if (IS_ERR(cpucp->tx_base))
+		return PTR_ERR(cpucp->tx_base);
+
+	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
+	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
+	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
+
+	cpucp->irq = platform_get_irq(pdev, 0);
+	if (cpucp->irq < 0)
+		return cpucp->irq;
+
+	ret = devm_request_irq(cpucp->dev, cpucp->irq, qcom_cpucp_mbox_irq_fn,
+			       IRQF_TRIGGER_HIGH, "apss_cpucp_mbox", cpucp);
+	if (ret < 0)
+		return dev_err_probe(cpucp->dev, ret, "Failed to register irq: %d\n", cpucp->irq);
+
+	writeq(APSS_CPUCP_RX_MBOX_CMD_MASK, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
+
+	mbox = &cpucp->mbox;
+	mbox->dev = cpucp->dev;
+	mbox->num_chans = APSS_CPUCP_IPC_CHAN_SUPPORTED;
+	mbox->chans = cpucp->chans;
+	mbox->ops = &qcom_cpucp_mbox_chan_ops;
+	mbox->txdone_irq = false;
+	mbox->txdone_poll = false;
+
+	ret = devm_mbox_controller_register(cpucp->dev, mbox);
+	if (ret)
+		return dev_err_probe(cpucp->dev, ret, "Failed to create mailbox\n");
+
+	platform_set_drvdata(pdev, cpucp);
+
+	return 0;
+}
+
+static const struct of_device_id qcom_cpucp_mbox_of_match[] = {
+	{ .compatible = "qcom,x1e80100-cpucp-mbox"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_cpucp_mbox_of_match);
+
+static struct platform_driver qcom_cpucp_mbox_driver = {
+	.probe = qcom_cpucp_mbox_probe,
+	.driver = {
+		.name = "qcom_cpucp_mbox",
+		.of_match_table = qcom_cpucp_mbox_of_match,
+	},
+};
+module_platform_driver(qcom_cpucp_mbox_driver);
+
+MODULE_DESCRIPTION("QTI CPUCP MBOX Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


