Return-Path: <linux-arm-msm+bounces-55384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE403A9ACA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 13:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D67A9221F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAE322C321;
	Thu, 24 Apr 2025 11:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cttSiC9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE1522489A;
	Thu, 24 Apr 2025 11:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495964; cv=none; b=iCHpgJWfOx7xi+8EHHmi/vMKcL3ygheQ/IHhkknkAlXGhOhs4QyrIQir3giVMWBi0Jj/6DQDDjnKX4cZxOinuVOUgxtJh4WsS0ZCqLgSHSNURo/F2/8eUBzdACoarc0pVBA3x+zxLIglRStqLKWpauwhv9uFv6JzcdLH7mf8QGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495964; c=relaxed/simple;
	bh=VaZCPrpi147eF22c0d4sX6m0dUWVaY4iHeYxSfztC5Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GhHaco0EgLTg7FKdnLU3Jy5KN7I3aZVlA5cFm9KY4CdXYcHSMYPH3BfUs43qH2A4TL2EQDPMKQ9LknWdutdqNKBRAp79csKV4BCRM1LNhsH3CH28AnRu9Dnz/ogtxss9/VuLvj+7HIBUTSeipg+NmrM07C4VhUTgcNU/mrr6vlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cttSiC9k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OBoqxg017307;
	Thu, 24 Apr 2025 11:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8M5Jzls9TcSom1dGsz53hBKlu7EpdgXdYG6CYuRvLU=; b=cttSiC9kU4WTLei3
	lYEooaT48phS7rs0fBSx0NLC/q0nUjyuBsn3PM0NrLe/OKe0gS1MQvrEWv6mB9qI
	QWsTxVNZtr68mL8YsbLQ5TGGoKtmr3+CeJVkmO59pfsxSwSH2udJ0w91rPMxnwMN
	BOScusk1K59mssdXoxK3ZrfwP1yxybtleED+oZQYLNW6KzLgPxWi1qmDAmgML3Ix
	T97VCTRftQLWTX3PMwHxC5EX9gLZb3qvWmB+tgLxkmD6qV1pRQqDVfjRLMMGEOcR
	x6MehEgLimQNhWtDpsU40hqLVpyU4ya6A7pWf7EuRrzMkfBUc/GNgTwbyIgjXn9L
	VnJeJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2dg4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OBx9Bp018134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:09 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 04:59:09 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 2/5] coresight: Add coresight QMI driver
Date: Thu, 24 Apr 2025 04:58:51 -0700
Message-ID: <20250424115854.2328190-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8LgjbWKd3ISW_c8ZSyWM72QJY1FL3sK6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4MCBTYWx0ZWRfX7budGTu8g2IP hAmlYUyypBP+y9bGGQ3U9dSxhKZ7n7vObxX5RbweBYheHnZlJrQBvtiMiUi3roUunGUJb1TdhCS WIQY2mi3yintgKhEzdt9ldf0BTEg2hVbI0hd3b5Mh6OqSc3vc7JR1tPh2ZNpFi52umr5BTV8GCk
 U0RG8igdKDQS7zO1R32zb3nOQHZZLAvdNvGQ/jrPJ1dw/U97U329Ixp3h9ftIZ+oEV1uT/CqFRl 6CjKHunXQNAOflqFwGZhD7qwUs7D8bT9cKhQSDR09wpVOVppOyXD+PrrMItUG7emK1duyDJ/4Wu Uxdh2NROrBkq6SKBVaWRRtf0JrpdtPNZaY5ZShqe4HztqfdWdLFAeMxuSrR+aMQNq2Zx9xyeEGu
 ITmez6G7W7E7Yhp/L9m6OsnX+Es6aUZeLKrUzm/faHyxAPsxAKBFWIUT8MNX1hnNHWeNcMW9
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680a278e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=L9yW8--91L8JoJtvOOUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8LgjbWKd3ISW_c8ZSyWM72QJY1FL3sK6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240080

Coresight QMI driver uses QMI(Qualcomm Messaging Interface) interfaces
to communicate with remote subsystems. Driver gets the instance id and
service id from device tree node and init the QMI connections to remote
subsystems. Send request function is for other coresight drivers to
communicate with remote subsystems.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig         |  12 ++
 drivers/hwtracing/coresight/Makefile        |   1 +
 drivers/hwtracing/coresight/coresight-qmi.c | 209 ++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-qmi.h | 107 ++++++++++
 4 files changed, 329 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.c
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.h

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 06f0a7594169..61f673dbc2e9 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -247,4 +247,16 @@ config CORESIGHT_DUMMY
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called coresight-dummy.
+
+config CORESIGHT_QMI
+	tristate "CORESIGHT QMI support"
+	select QCOM_QMI_HELPERS
+	help
+	  Enables support for sending command to subsystem via QMI. This is
+	  primarily used for sending QMI message to subsystems for remote trace
+	  sources.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called coresight-qmi.
+
 endif
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 4ba478211b31..99ee0f8c25d2 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -50,4 +50,5 @@ obj-$(CONFIG_CORESIGHT_TPDA) += coresight-tpda.o
 coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
+obj-$(CONFIG_CORESIGHT_QMI) += coresight-qmi.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
diff --git a/drivers/hwtracing/coresight/coresight-qmi.c b/drivers/hwtracing/coresight/coresight-qmi.c
new file mode 100644
index 000000000000..d93b606e7108
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-qmi.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/coresight.h>
+
+#include "coresight-qmi.h"
+static LIST_HEAD(qmi_data);
+
+static int service_coresight_qmi_new_server(struct qmi_handle *qmi,
+		struct qmi_service *svc)
+{
+	struct qmi_data *data = container_of(qmi,
+					struct qmi_data, handle);
+
+	data->s_addr.sq_family = AF_QIPCRTR;
+	data->s_addr.sq_node = svc->node;
+	data->s_addr.sq_port = svc->port;
+	data->service_connected = true;
+	pr_debug("Connection established between QMI handle and %d service\n",
+		data->qmi_id);
+
+	return 0;
+}
+
+static void service_coresight_qmi_del_server(struct qmi_handle *qmi,
+		struct qmi_service *svc)
+{
+	struct qmi_data *data = container_of(qmi,
+					struct qmi_data, handle);
+	data->service_connected = false;
+	pr_debug("Connection disconnected between QMI handle and %d service\n",
+		data->qmi_id);
+}
+
+static struct qmi_ops server_ops = {
+	.new_server = service_coresight_qmi_new_server,
+	.del_server = service_coresight_qmi_del_server,
+};
+
+static int coresight_qmi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = pdev->dev.of_node;
+	struct device_node *child_node;
+	int ret;
+
+	/**
+	 * Get the instance id and service id of the QMI service connection
+	 * from DT node. Creates QMI handle and register new lookup for each
+	 * QMI connection.
+	 */
+	for_each_available_child_of_node(node, child_node) {
+		struct qmi_data *data;
+
+		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+		if (!data)
+			return -ENOMEM;
+
+		ret = of_property_read_u32(child_node, "qmi-id", &data->qmi_id);
+		if (ret)
+			return ret;
+
+		ret = of_property_read_u32(child_node, "service-id", &data->service_id);
+		if (ret)
+			return ret;
+
+		ret = qmi_handle_init(&data->handle,
+				CORESIGHT_QMI_MAX_MSG_LEN,
+				&server_ops, NULL);
+		if (ret < 0) {
+			dev_err(dev, "qmi client init failed ret:%d\n", ret);
+			return ret;
+		}
+
+		qmi_add_lookup(&data->handle,
+				data->service_id,
+				CORESIGHT_QMI_VERSION,
+				data->qmi_id);
+
+		list_add(&data->node, &qmi_data);
+	}
+
+	return 0;
+}
+
+/**
+ * coresight_get_qmi_data() - Get the qmi data struct from qmi_data
+ * @id:	instance id to get the qmi data
+ *
+ * Return: qmi data struct on success, NULL on failure.
+ */
+static struct qmi_data *coresight_get_qmi_data(int id)
+{
+	struct qmi_data *data;
+
+	list_for_each_entry(data, &qmi_data, node) {
+		if (data->qmi_id == id)
+			return data;
+	}
+
+	return NULL;
+}
+
+/**
+ * coresight_send_qmi_request() - Send a QMI message to remote subsystem
+ * @instance_id:	QMI Instance id of the remote subsystem
+ * @msg_id:	message id of the request
+ * @resp_ei:	description of how to decode a matching response
+ * @req_ei:	description of how to encode a matching request
+ * @resp:	pointer to the object to decode the response info
+ * @req:	pointer to the object to encode the request info
+ * @len:	max length of the QMI message
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int coresight_send_qmi_request(int instance_id, int msg_id, struct qmi_elem_info *resp_ei,
+			struct qmi_elem_info *req_ei, void *resp, void *req, int len)
+{
+	struct qmi_txn txn;
+	int ret;
+	struct qmi_data *data;
+
+	data = coresight_get_qmi_data(instance_id);
+	if (!data) {
+		pr_err("No QMI data for QMI service!\n");
+		ret = -EINVAL;
+		return ret;
+	}
+
+	if (!data->service_connected) {
+		pr_err("QMI service not connected!\n");
+		ret = -EINVAL;
+		return ret;
+	}
+
+	ret = qmi_txn_init(&data->handle, &txn,
+			resp_ei,
+			resp);
+
+	if (ret < 0) {
+		pr_err("QMI tx init failed , ret:%d\n", ret);
+		return ret;
+	}
+
+	ret = qmi_send_request(&data->handle, &data->s_addr,
+			&txn, msg_id,
+			len,
+			req_ei,
+			req);
+
+	if (ret < 0) {
+		pr_err("QMI send ACK failed, ret:%d\n", ret);
+		qmi_txn_cancel(&txn);
+		return ret;
+	}
+
+	ret = qmi_txn_wait(&txn, msecs_to_jiffies(TIMEOUT_MS));
+	if (ret < 0) {
+		pr_err("QMI qmi txn wait failed, ret:%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(coresight_send_qmi_request);
+
+static void coresight_qmi_remove(struct platform_device *pdev)
+{
+	struct qmi_data *data;
+
+	list_for_each_entry(data, &qmi_data, node) {
+		qmi_handle_release(&data->handle);
+	}
+}
+
+static const struct of_device_id coresight_qmi_match[] = {
+	{.compatible = "qcom,coresight-qmi"},
+	{}
+};
+
+static struct platform_driver coresight_qmi_driver = {
+	.probe          = coresight_qmi_probe,
+	.remove         = coresight_qmi_remove,
+	.driver         = {
+		.name   = "coresight-qmi",
+		.of_match_table = coresight_qmi_match,
+	},
+};
+
+static int __init coresight_qmi_init(void)
+{
+	return platform_driver_register(&coresight_qmi_driver);
+}
+module_init(coresight_qmi_init);
+
+static void __exit coresight_qmi_exit(void)
+{
+	platform_driver_unregister(&coresight_qmi_driver);
+}
+module_exit(coresight_qmi_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("CoreSight QMI driver");
diff --git a/drivers/hwtracing/coresight/coresight-qmi.h b/drivers/hwtracing/coresight/coresight-qmi.h
new file mode 100644
index 000000000000..1d57e46177b8
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-qmi.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef _CORESIGHT_QMI_H
+#define _CORESIGHT_QMI_H
+
+#include <linux/soc/qcom/qmi.h>
+
+#define CORESIGHT_QMI_VERSION			(1)
+
+#define CORESIGHT_QMI_SET_ETM_REQ_V01		(0x002C)
+#define CORESIGHT_QMI_SET_ETM_RESP_V01		(0x002C)
+
+#define CORESIGHT_QMI_MAX_MSG_LEN (50)
+
+#define TIMEOUT_MS				(10000)
+
+/* Qmi data for the QMI connection */
+struct qmi_data {
+	u32			qmi_id;
+	u32			service_id;
+	struct list_head	node;
+	struct qmi_handle	handle;
+	bool			service_connected;
+	struct sockaddr_qrtr	s_addr;
+};
+
+/**
+ * QMI service IDs
+ *
+ * CORESIGHT_QMI_QDSSC_SVC_ID for remote etm
+ * CORESIGHT_QMI_QDCP_SVC_ID for STM/TPDM/CTI
+ */
+enum coresight_qmi_service_id {
+	CORESIGHT_QMI_QDSSC_SVC_ID = 0x33,
+	CORESIGHT_QMI_QDCP_SVC_ID = 0xff,
+};
+
+enum coresight_qmi_instance_id {
+	CORESIGHT_QMI_INSTANCE_MODEM_V01 = 2,
+	CORESIGHT_QMI_INSTANCE_WLAN_V01 = 3,
+	CORESIGHT_QMI_INSTANCE_AOP_V01 = 4,
+	CORESIGHT_QMI_INSTANCE_ADSP_V01 = 5,
+	CORESIGHT_QMI_INSTANCE_VENUS_V01 = 6,
+	CORESIGHT_QMI_INSTANCE_GNSS_V01 = 7,
+	CORESIGHT_QMI_INSTANCE_SENSOR_V01 = 8,
+	CORESIGHT_QMI_INSTANCE_AUDIO_V01 = 9,
+	CORESIGHT_QMI_INSTANCE_VPU_V01 = 10,
+	CORESIGHT_QMI_INSTANCE_MODEM2_V01 = 11,
+	CORESIGHT_QMI_INSTANCE_SENSOR2_V01 = 12,
+	CORESIGHT_QMI_INSTANCE_CDSP_V01 = 13,
+	CORESIGHT_QMI_INSTANCE_NPU_V01 = 14,
+	CORESIGHT_QMI_INSTANCE_CDSP_USER_V01 = 15,
+	CORESIGHT_QMI_INSTANCE_CDSP1_V01 = 16,
+	CORESIGHT_QMI_INSTANCE_GPDSP0_V01 = 17,
+	CORESIGHT_QMI_INSTANCE_GPDSP1_V01 = 18,
+	CORESIGHT_QMI_INSTANCE_TBD_V01 = 19,
+	CORESIGHT_QMI_INSTANCE_GPDSP0_AUDI0_V01 = 20,
+	CORESIGHT_QMI_INSTANCE_GPDSP1_AUDI0_V01 = 21,
+	CORESIGHT_QMI_INSTANCE_MODEM_OEM_V01 = 22,
+	CORESIGHT_QMI_INSTANCE_ADSP1_V01 = 23,
+	CORESIGHT_QMI_INSTANCE_ADSP1_AUDIO_V01 = 24,
+	CORESIGHT_QMI_INSTANCE_ADSP2_V01 = 25,
+	CORESIGHT_QMI_INSTANCE_ADSP2_AUDIO_V01 = 26,
+	CORESIGHT_QMI_INSTANCE_CDSP2_V01 = 27,
+	CORESIGHT_QMI_INSTANCE_CDSP3_V01 = 28,
+	CORESIGHT_QMI_INSTANCE_SOCCP_V01 = 29,
+	CORESIGHT_QMI_INSTANCE_QECP_V01 = 30,
+};
+
+enum coresight_etm_state_enum_type_v01 {
+	/* To force a 32 bit signed enum. Do not change or use */
+	CORESIGHT_ETM_STATE_ENUM_TYPE_MIN_ENUM_VAL_V01 = INT_MIN,
+	CORESIGHT_ETM_STATE_DISABLED_V01 = 0,
+	CORESIGHT_ETM_STATE_ENABLED_V01 = 1,
+	CORESIGHT_ETM_STATE_ENUM_TYPE_MAX_ENUM_VAL_01 = INT_MAX,
+};
+
+/**
+ * Set remote etm request message
+ *
+ * @state enable/disable state
+ */
+struct coresight_set_etm_req_msg_v01 {
+	enum coresight_etm_state_enum_type_v01 state;
+};
+
+/**
+ * Set remote etm response message
+ */
+struct coresight_set_etm_resp_msg_v01 {
+	struct qmi_response_type_v01 resp;
+};
+
+#if IS_ENABLED(CONFIG_CORESIGHT_QMI)
+extern int coresight_send_qmi_request(int instance_id, int msg_id,
+		struct qmi_elem_info *resp_ei,
+		struct qmi_elem_info *req_ei, void *resp, void *req, int len);
+#else
+
+static inline int coresight_send_qmi_request(int instance_id, int msg_id,
+		struct qmi_elem_info *resp_ei,
+		struct qmi_elem_info *req_ei, void *resp, void *req, int len) {return NULL; }
+#endif
+
+#endif
-- 
2.25.1


