Return-Path: <linux-arm-msm+bounces-22434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4A39052B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 14:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F574B24C05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B2B175541;
	Wed, 12 Jun 2024 12:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m1LFhNOa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1439217083F;
	Wed, 12 Jun 2024 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718196097; cv=none; b=oT4f6Qtd72gUNYoJSQrV3Bn8ZCbGqEREqPiRyKOSyn8UX9pt7zzT+j0CEwzjUllY5fMTDL1mlaWLjib86RtNRFuhars/QvJS2Ej5Gytwf0MvW2sUH7v0wdBeF5VqA8cIpAXe4vbvNvY2taaH+zSCNqpuvo1SPus8r6oiUxGw7as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718196097; c=relaxed/simple;
	bh=fciwbvkwElib0rWkq44DFgPnz8D0ptM12knM527M3U0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I8UYOmLEeWX7yJI0t8O1AQhaj9z4H+eIHmQvJL/33G26bVix0oM1UrchWZ1R0plDlzdQswGDdyaACVBZxhktNtGGIpEzl0WAoVhk5cG8b/eniUlq0YzduzF+QsQ7S/JYWTlcFjfxbgeHZ7d7RBb+N6GbaLKacgnhZWxNp+wiDEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m1LFhNOa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C8ML8Q012620;
	Wed, 12 Jun 2024 12:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/JdXZBa4GrMtuicML+4MzEBTjUHGVlzRO4eLQA3UVVg=; b=m1LFhNOaWB8oA95B
	hYccCa6kPGCZPmiscMVTNJCKeMmyMcEdbGgCFvimL7ZBZgS6AuD9P3UBCRxd1TNx
	AglkI15hYlHqi9kzAepwY0Iuuiffn8MDMqHz8l56xD2BTLuC5iEpaQCCINrRvZ98
	2TXupARcoQ1xJkXA3TXMVKMlczJmRI4jUsLBGB4yHBIeCT99I0CnsT3HL9SivCCb
	tVepS8idOac3wrhiiHr8ePxc9ibnNGr0pT2qrTE1mKhOrich6WlRTkMMqbCXISb9
	W5oclFGuxi63A+DuPO3moOqLfLKsFHlCKI++ueBahnMkkC3tAjidlWQ0oqETx18/
	LC8+LQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq83wgmp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 12:41:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CCfSuR003365
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 12:41:28 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 05:41:22 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <jassisinghbrar@gmail.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <quic_sibis@quicinc.com>,
        <conor+dt@kernel.org>, <quic_nkela@quicinc.com>,
        <quic_psodagud@quicinc.com>, <abel.vesa@linaro.org>
Subject: [PATCH V6 2/5] mailbox: Add support for QTI CPUCP mailbox controller
Date: Wed, 12 Jun 2024 18:10:53 +0530
Message-ID: <20240612124056.39230-3-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240612124056.39230-1-quic_sibis@quicinc.com>
References: <20240612124056.39230-1-quic_sibis@quicinc.com>
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
X-Proofpoint-GUID: 4AJ-RQ9JHHnnBLc_lz7GEdyvTzWYHvM3
X-Proofpoint-ORIG-GUID: 4AJ-RQ9JHHnnBLc_lz7GEdyvTzWYHvM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120092

Add support for CPUSS Control Processor (CPUCP) mailbox controller,
this driver enables communication between AP and CPUCP by acting as
a doorbell between them.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---

v5:
* Fix build error reported by kernel test robot by adding 64BIT requirement
  to COMPILE_TEST

 MAINTAINERS                       |   7 ++
 drivers/mailbox/Kconfig           |   8 ++
 drivers/mailbox/Makefile          |   2 +
 drivers/mailbox/qcom-cpucp-mbox.c | 187 ++++++++++++++++++++++++++++++
 4 files changed, 204 insertions(+)
 create mode 100644 drivers/mailbox/qcom-cpucp-mbox.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e04f583780c5..d7c00abe2f93 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18533,6 +18533,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/power/avs/qcom,cpr.yaml
 F:	drivers/pmdomain/qcom/cpr.c
 
+QUALCOMM CPUCP MAILBOX DRIVER
+M:	Sibi Sankar <quic_sibis@quicinc.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+F:	drivers/mailbox/qcom-cpucp-mbox.c
+
 QUALCOMM CPUFREQ DRIVER MSM8996/APQ8096
 M:	Ilia Lin <ilia.lin@kernel.org>
 L:	linux-pm@vger.kernel.org
diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 3b8842c4a340..d1f6c758b5e8 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -276,6 +276,14 @@ config SPRD_MBOX
 	  to send message between application processors and MCU. Say Y here if
 	  you want to build the Spreatrum mailbox controller driver.
 
+config QCOM_CPUCP_MBOX
+	tristate "Qualcomm Technologies, Inc. CPUCP mailbox driver"
+	depends on ARCH_QCOM || (COMPILE_TEST && 64BIT)
+	help
+	  Qualcomm Technologies, Inc. CPUSS Control Processor (CPUCP) mailbox
+	  controller driver enables communication between AP and CPUCP. Say
+	  Y here if you want to build this driver.
+
 config QCOM_IPCC
 	tristate "Qualcomm Technologies, Inc. IPCC driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 5cf2f54debaf..3c3c27d54c13 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -61,4 +61,6 @@ obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
 
 obj-$(CONFIG_SPRD_MBOX)		+= sprd-mailbox.o
 
+obj-$(CONFIG_QCOM_CPUCP_MBOX)	+= qcom-cpucp-mbox.o
+
 obj-$(CONFIG_QCOM_IPCC)		+= qcom-ipcc.o
diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
new file mode 100644
index 000000000000..e5437c294803
--- /dev/null
+++ b/drivers/mailbox/qcom-cpucp-mbox.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/bitops.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define APSS_CPUCP_IPC_CHAN_SUPPORTED		3
+#define APSS_CPUCP_MBOX_CMD_OFF			0x4
+
+/* Tx Registers */
+#define APSS_CPUCP_TX_MBOX_CMD(i)		(0x100 + ((i) * 8))
+
+/* Rx Registers */
+#define APSS_CPUCP_RX_MBOX_CMD(i)		(0x100 + ((i) * 8))
+#define APSS_CPUCP_RX_MBOX_MAP			0x4000
+#define APSS_CPUCP_RX_MBOX_STAT			0x4400
+#define APSS_CPUCP_RX_MBOX_CLEAR		0x4800
+#define APSS_CPUCP_RX_MBOX_EN			0x4c00
+#define APSS_CPUCP_RX_MBOX_CMD_MASK		GENMASK_ULL(63, 0)
+
+/**
+ * struct qcom_cpucp_mbox - Holder for the mailbox driver
+ * @chans:			The mailbox channel
+ * @mbox:			The mailbox controller
+ * @tx_base:			Base address of the CPUCP tx registers
+ * @rx_base:			Base address of the CPUCP rx registers
+ */
+struct qcom_cpucp_mbox {
+	struct mbox_chan chans[APSS_CPUCP_IPC_CHAN_SUPPORTED];
+	struct mbox_controller mbox;
+	void __iomem *tx_base;
+	void __iomem *rx_base;
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
+	u64 status;
+	int i;
+
+	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
+
+	for_each_set_bit(i, (unsigned long *)&status, APSS_CPUCP_IPC_CHAN_SUPPORTED) {
+		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
+		struct mbox_chan *chan = &cpucp->chans[i];
+		unsigned long flags;
+
+		/* Provide mutual exclusion with changes to chan->cl */
+		spin_lock_irqsave(&chan->lock, flags);
+		if (chan->cl)
+			mbox_chan_received_data(chan, &val);
+		writeq(BIT(i), cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
+		spin_unlock_irqrestore(&chan->lock, flags);
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
+	struct device *dev = &pdev->dev;
+	struct qcom_cpucp_mbox *cpucp;
+	struct mbox_controller *mbox;
+	int irq, ret;
+
+	cpucp = devm_kzalloc(dev, sizeof(*cpucp), GFP_KERNEL);
+	if (!cpucp)
+		return -ENOMEM;
+
+	cpucp->rx_base = devm_of_iomap(dev, dev->of_node, 0, NULL);
+	if (IS_ERR(cpucp->rx_base))
+		return PTR_ERR(cpucp->rx_base);
+
+	cpucp->tx_base = devm_of_iomap(dev, dev->of_node, 1, NULL);
+	if (IS_ERR(cpucp->tx_base))
+		return PTR_ERR(cpucp->tx_base);
+
+	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
+	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
+	writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq, qcom_cpucp_mbox_irq_fn,
+			       IRQF_TRIGGER_HIGH, "apss_cpucp_mbox", cpucp);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register irq: %d\n", irq);
+
+	writeq(APSS_CPUCP_RX_MBOX_CMD_MASK, cpucp->rx_base + APSS_CPUCP_RX_MBOX_MAP);
+
+	mbox = &cpucp->mbox;
+	mbox->dev = dev;
+	mbox->num_chans = APSS_CPUCP_IPC_CHAN_SUPPORTED;
+	mbox->chans = cpucp->chans;
+	mbox->ops = &qcom_cpucp_mbox_chan_ops;
+
+	ret = devm_mbox_controller_register(dev, mbox);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to create mailbox\n");
+
+	return 0;
+}
+
+static const struct of_device_id qcom_cpucp_mbox_of_match[] = {
+	{ .compatible = "qcom,x1e80100-cpucp-mbox" },
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
+
+static int __init qcom_cpucp_mbox_init(void)
+{
+	return platform_driver_register(&qcom_cpucp_mbox_driver);
+}
+core_initcall(qcom_cpucp_mbox_init);
+
+static void __exit qcom_cpucp_mbox_exit(void)
+{
+	platform_driver_unregister(&qcom_cpucp_mbox_driver);
+}
+module_exit(qcom_cpucp_mbox_exit);
+
+MODULE_DESCRIPTION("QTI CPUCP MBOX Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


