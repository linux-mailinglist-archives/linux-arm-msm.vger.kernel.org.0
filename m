Return-Path: <linux-arm-msm+bounces-64528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E444CB01880
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3DC6B46632
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93B727E043;
	Fri, 11 Jul 2025 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JvIIlncd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF2427AC25;
	Fri, 11 Jul 2025 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226861; cv=none; b=m73uiR9T0+b9oVL857Uvww5ZG21VkXrcgY+RQPNGuLRzMH0FYGhYbK/J8feFMMDwaOtCtUH515qkRasLqfUPdz+6RHMztEsjfukTqwD/wNZtU52xQwOaUB06ZY6Y6GNWacUiILZqyUkdjdZZoSjQrBE6KkvwuxJ4Sdr1l7CmcZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226861; c=relaxed/simple;
	bh=Z/0NROSEmCgpyxPdJj+HIgTBy1ElFF0DaR/WLun5Mg8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EL6Lm++r6Jhldi4HAdfGdFGECgmjMqzPqeZ4t/KkmoGevgFhSsMvcAl2xQ9Xxfaak2wqban+j4SjXpNvo2StBkuBrRv622l3Rgj1H16KikXTubGVOix5k2I6SNOwv30hAlP7napAWAFl4KEOE3PnZCRskXv1eE5dsu8dJgO5wso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JvIIlncd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B3GfhE016850;
	Fri, 11 Jul 2025 09:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gspBJ2Ipj40QOHZq6OOqXQdiYxcFnrOqjoKD88xQcrA=; b=JvIIlncdBn8T1Bqn
	/p378SNKg1OTb4VkBmQpk7TkotA9Vk1Rr04xmGWHOm9Q8L/auTbJQouDtMnxd86Q
	kUoP+cRTsFe4BONG+gcIYTOszueOBS+rqZNvz5adypr7S+hnvcrUGJZJhh0SOMkm
	A8+wErE2dx9izPV+/cz/1AlB+JpRoOBfFJaQYOzQLM1YzBg9thK4/x3mkYNi+B5t
	CvVtf+kK67Efet0F9M6t4kAmw9+KKNkOcP2ktt1goBd0VuXSkxGOE3WqnP6Lz9sV
	1B2OYfRVKepqwsVhtDLK7Mvy2RGVHgBoOiBgtcBiS8Seujth6I3naAmIdsfJr+E9
	2N3sPA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ttj9rxg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56B9elJU032077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:47 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 02:40:46 -0700
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
Subject: [PATCH v6 2/5] coresight: Add coresight QMI driver
Date: Fri, 11 Jul 2025 02:40:28 -0700
Message-ID: <20250711094031.4171091-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
References: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA2OCBTYWx0ZWRfXxKbMX6L5NUMz
 0wY+TkuEO0ksEEAkkR5VfKmYNsHvsHaba+BK175fYfsrIBsIRDu1eKkGlZ3FErYHVFFGK9N38/h
 3V/GzkXw4SEaQNqXFaodPPpEcHiBc+yM2cqFIjJwI8Ybu1VkY5YzrPio/kBrVJwEWieqHHNpxnQ
 FkyRM1ImPjs/0J40XmN9TRcdqD7cXdqCMLvVsNmhm46l4ZGncHtmcyJFLNDkzgjlcF6b8o+liYV
 vLg3cGb/4GstJA4Tmx8GkL5PkXDFSJpKSuu1kQ0ZQXfWHn6RvZ7erlWS1nay0NYZTwYCzLlDg9B
 xHuR1UkEhBSgehSiaATdPduVfMfsuUTYhXoFzUYRd4FQ0oaoM08FpogY9lIn+aTxOybJH3ZjVM9
 GElveJzWcYouMRHHzLvTvuvlqCCh0cVaYnCtWPgoRku/iq9S2u5tFyUL1+hpMCEgJLIV7/ro
X-Proofpoint-ORIG-GUID: 4U959h0qroy3Z7WW6ht-8O-oqUZQodIi
X-Authority-Analysis: v=2.4 cv=Gu1C+l1C c=1 sm=1 tr=0 ts=6870dc20 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=3H110R4YSZwA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=L9yW8--91L8JoJtvOOUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4U959h0qroy3Z7WW6ht-8O-oqUZQodIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110068

Coresight QMI driver uses QMI(Qualcomm Messaging Interface) interfaces
to communicate with remote subsystems. Driver gets the instance id and
service id from device tree node and init the QMI connections to remote
subsystems. Send request function is for other coresight drivers to
communicate with remote subsystems.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig         |  11 ++
 drivers/hwtracing/coresight/Makefile        |   1 +
 drivers/hwtracing/coresight/coresight-qmi.c | 198 ++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-qmi.h | 101 ++++++++++
 4 files changed, 311 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.c
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.h

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index f064e3d172b3..a55b7d875e0a 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -268,4 +268,15 @@ config CORESIGHT_KUNIT_TESTS
 	    Enable Coresight unit tests. Only useful for development and not
 	    intended for production.
 
+config CORESIGHT_QMI
+	tristate "CORESIGHT QMI support"
+	depends on QCOM_QMI_HELPERS
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
index 4e7cc3c5bf99..d4b1c74d183f 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_CORESIGHT_TPDA) += coresight-tpda.o
 coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
+obj-$(CONFIG_CORESIGHT_QMI) += coresight-qmi.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
 obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
 coresight-ctcu-y := coresight-ctcu-core.o
diff --git a/drivers/hwtracing/coresight/coresight-qmi.c b/drivers/hwtracing/coresight/coresight-qmi.c
new file mode 100644
index 000000000000..d487280d516b
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-qmi.c
@@ -0,0 +1,198 @@
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
+	/*
+	 * Create QMI handle and register new lookup for each
+	 * QMI connectioni based on qmi-id and service-id.
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
+	{ .compatible = "qcom,coresight-qmi" },
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
+module_platform_driver(coresight_qmi_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("CoreSight QMI driver");
diff --git a/drivers/hwtracing/coresight/coresight-qmi.h b/drivers/hwtracing/coresight/coresight-qmi.h
new file mode 100644
index 000000000000..dce10d899a53
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-qmi.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef _CORESIGHT_QMI_H
+#define _CORESIGHT_QMI_H
+
+#include <linux/soc/qcom/qmi.h>
+
+#define CORESIGHT_QMI_VERSION			1
+
+#define CORESIGHT_QMI_SET_ETM_REQ_V01		0x002C
+#define CORESIGHT_QMI_SET_ETM_RESP_V01		0x002C
+
+#define CORESIGHT_QMI_MAX_MSG_LEN 50
+
+#define TIMEOUT_MS				10000
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
+/* Enum of QMI service IDs */
+enum coresight_qmi_service_id {
+	CORESIGHT_QMI_QDSSC_SVC_ID = 0x33,
+	CORESIGHT_QMI_QDCP_SVC_ID = 0xff,
+};
+
+/* Enum of QMI instance ids */
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


