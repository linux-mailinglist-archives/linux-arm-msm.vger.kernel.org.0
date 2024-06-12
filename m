Return-Path: <linux-arm-msm+bounces-22503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A1B905AF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 20:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB8FEB25AD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112AC6EB4A;
	Wed, 12 Jun 2024 18:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UMX+9nxB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B5E6214D;
	Wed, 12 Jun 2024 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217079; cv=none; b=DNxEcyJ22AOhhkyXuGjeDqKdeGOc4UZCSWl221CpuvKFxtTyHlUJy6lNIO64eK/4NV/13tegpwzOa3/hpye/+f+XOCPsOJr6wTSHSx+fGmQ4WmbMuSt6xRWBsXHREgmdnjskO3a4EFVr2X4l/PJqmVCQFWJSYb+LF/LKdeAH0ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217079; c=relaxed/simple;
	bh=BLoZJ4bi2OEMeUpnz3dhev0ANghngVOc+fxUT6k/Hh4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JDe966rrEwgORVU4GQvUtM7/2kP9Jr/ak9hWBmpfSux9GM590l8IUay2J/kS+nUpe+LPU4us2IxkP7Uyh+FDmr9dUeNONIXrdgFsDSuN0qxrUH5KSWT7TLhQzSaqzhlZWje45BOlokkaj2TW/k3UGBvLtboQOlOZ92AG2QTFlx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UMX+9nxB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CDqiLK019095;
	Wed, 12 Jun 2024 18:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNv419ymt13TEImL0lQWU1KdquoPPrPW5oQHQBmS4/k=; b=UMX+9nxBPY/6Rmln
	L4r3iDI5AH4UQl4+kEf9kzRW/2NEgMOF7vCIfZMvmbjIvDwzh7/T4SOTnS0p8UiS
	y+QWc4RsjQgEvw4ZzhldMUrql6JkWYAMizJOVfO0StKTDkLzyHipk6RvfC/+GEZM
	W+aCpB9j9DnsyVJzF95p4lcAY/GkhgxzxLSWGRV6dPdjBkw5qnyrr+hHSAESmIBG
	0/B2RWK/z1nxa7ID1/hn77sJCueaRzjEYKP5tFcCAKs1YHCEtoPXdIIOwooEK17c
	Imbw16m3OL0ux+GZyzNerfyfYjc+0w0IRN916DqBElxh+JqN7WDJPkZzn/DYUcO/
	sFZaFg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yqcxtgxmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 18:31:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CIV7t5030202
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 18:31:07 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 11:31:02 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <quic_sibis@quicinc.com>, <conor+dt@kernel.org>,
        Amir Vajid
	<avajid@quicinc.com>
Subject: [RFC V2 2/4] firmware: arm_scmi: vendors: Add QCOM vendor protocol
Date: Thu, 13 Jun 2024 00:00:29 +0530
Message-ID: <20240612183031.219906-3-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240612183031.219906-1-quic_sibis@quicinc.com>
References: <20240612183031.219906-1-quic_sibis@quicinc.com>
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
X-Proofpoint-ORIG-GUID: JM_Ev-nFmj52rdPMNqecw_4ESl3XwBNi
X-Proofpoint-GUID: JM_Ev-nFmj52rdPMNqecw_4ESl3XwBNi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120132

The SCMI QCOM vendor protocol provides a generic way of exposing a
number of Qualcomm SoC specific features (like memory bus scaling)
through a mixture of pre-determined algorithm strings and param_id
pairs hosted on the SCMI controller.

Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
Co-developed-by: Amir Vajid <avajid@quicinc.com>
Signed-off-by: Amir Vajid <avajid@quicinc.com>
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---

v1:
* Rebase on top of Cristian's "SCMI multiple vendor protocol support" series. [Cristian]
* Add more documentation wherever possible. [Sudeep]

 drivers/firmware/arm_scmi/vendors/Kconfig     |  12 ++
 drivers/firmware/arm_scmi/vendors/Makefile    |   2 +-
 .../arm_scmi/vendors/qcom_scmi_vendor.c       | 184 ++++++++++++++++++
 include/linux/qcom_scmi_vendor.h              |  39 ++++
 4 files changed, 236 insertions(+), 1 deletion(-)
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom_scmi_vendor.c
 create mode 100644 include/linux/qcom_scmi_vendor.h

diff --git a/drivers/firmware/arm_scmi/vendors/Kconfig b/drivers/firmware/arm_scmi/vendors/Kconfig
index 7c1ca7a12603..6bff4550fa25 100644
--- a/drivers/firmware/arm_scmi/vendors/Kconfig
+++ b/drivers/firmware/arm_scmi/vendors/Kconfig
@@ -1,4 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menu "ARM SCMI Vendor Protocols"
 
+config ARM_SCMI_PROTOCOL_VENDOR_QCOM
+	tristate "Qualcomm Technologies, Inc. Qcom SCMI vendor Protocol"
+	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
+	help
+	  The SCMI QCOM vendor protocol provides a generic way of exposing a
+	  number of Qualcomm SoC specific features (like memory bus scaling)
+	  through a mixture of pre-determined algorithm strings and param_id
+	  pairs hosted on the SCMI controller.
+
+	  This driver defines/documents the message ID's used for this
+	  communication and also exposes the ops used by the clients.
+
 endmenu
diff --git a/drivers/firmware/arm_scmi/vendors/Makefile b/drivers/firmware/arm_scmi/vendors/Makefile
index c6c214158dd8..c1d6a355f579 100644
--- a/drivers/firmware/arm_scmi/vendors/Makefile
+++ b/drivers/firmware/arm_scmi/vendors/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-# obj-$(CONFIG_ARM_SCMI_PROTOCOL_<your_vendor_proto>) += <your_vendor_proto>.o
+obj-$(CONFIG_ARM_SCMI_PROTOCOL_VENDOR_QCOM) += qcom_scmi_vendor.o
diff --git a/drivers/firmware/arm_scmi/vendors/qcom_scmi_vendor.c b/drivers/firmware/arm_scmi/vendors/qcom_scmi_vendor.c
new file mode 100644
index 000000000000..e02163381d4b
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/qcom_scmi_vendor.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/qcom_scmi_vendor.h>
+
+#include "../common.h"
+
+/**
+ * qcom_scmi_vendor_protocol_cmd - vendor specific commands supported by Qualcomm SCMI
+ *                                 vendor protocol.
+ *
+ * This protocol is intended as a generic way of exposing a number of Qualcomm SoC
+ * specific features through a mixture of pre-determined algorithm string and param_id
+ * pairs hosted on the SCMI controller.
+ *
+ * The QCOM SCMI Vendor Protocol has the protocol id as 0x80 and vendor id set to
+ * Qualcomm and the implementation version set to 0x20000. The PROTOCOL_VERSION command
+ * returns version 1.0.
+ *
+ * @QCOM_SCMI_SET_PARAM: message_id: 0x10 is used to set the parameter of a specific algo_str
+ *                       hosted on QCOM SCMI Vendor Protocol. The tx len depends on the
+ *                       algo_str used.
+ * @QCOM_SCMI_GET_PARAM: message_id: 0x11 is used to get parameter information of a specific
+ *                       algo_str hosted on QCOM SCMI Vendor Protocol. The tx and rx len
+ *                       depends on the algo_str used.
+ * @QCOM_SCMI_START_ACTIVITY: message_id: 0x12 is used to start the activity performed by
+ *                            the algo_str.
+ * @QCOM_SCMI_STOP_ACTIVITY: message_id: 0x13 is used to stop a pre-existing activity
+ *                           performed by the algo_str.
+ */
+enum qcom_scmi_vendor_protocol_cmd {
+	QCOM_SCMI_SET_PARAM = 0x10,
+	QCOM_SCMI_GET_PARAM = 0x11,
+	QCOM_SCMI_START_ACTIVITY = 0x12,
+	QCOM_SCMI_STOP_ACTIVITY = 0x13,
+};
+
+/**
+ * struct qcom_scmi_msg - represents the various parameters to be populated
+ *                        for using the QCOM SCMI Vendor Protocol
+ *
+ * @ext_id: reserved, must be zero
+ * @algo_low: lower 32 bits of the algo_str
+ * @algo_high: upper 32 bits of the algo_str
+ * @param_id: serves as token message id to the specific algo_str
+ * @buf: serves as the payload to the specified param_id and algo_str pair
+ */
+struct qcom_scmi_msg {
+	__le32 ext_id;
+	__le32 algo_low;
+	__le32 algo_high;
+	__le32 param_id;
+	__le32 buf[];
+};
+
+static int qcom_scmi_set_param(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
+			       u32 param_id, size_t size)
+{
+	struct scmi_xfer *t;
+	struct qcom_scmi_msg *msg;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_SET_PARAM, size + sizeof(*msg), 0, &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
+	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
+	msg->param_id = cpu_to_le32(param_id);
+
+	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));
+
+	ret = ph->xops->do_xfer(ph, t);
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int qcom_scmi_get_param(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
+			       u32 param_id, size_t tx_size, size_t rx_size)
+{
+	struct scmi_xfer *t;
+	struct qcom_scmi_msg *msg;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_GET_PARAM, tx_size + sizeof(*msg), rx_size, &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
+	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
+	msg->param_id = cpu_to_le32(param_id);
+	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));
+
+	ret = ph->xops->do_xfer(ph, t);
+	memcpy(buf, t->rx.buf, t->rx.len);
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int qcom_scmi_start_activity(const struct scmi_protocol_handle *ph,
+				    void *buf, u64 algo_str, u32 param_id, size_t size)
+{
+	struct scmi_xfer *t;
+	struct qcom_scmi_msg *msg;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_START_ACTIVITY, size + sizeof(*msg), 0, &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
+	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
+	msg->param_id = cpu_to_le32(param_id);
+
+	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));
+
+	ret = ph->xops->do_xfer(ph, t);
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int qcom_scmi_stop_activity(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
+				   u32 param_id, size_t size)
+{
+	struct scmi_xfer *t;
+	struct qcom_scmi_msg *msg;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_STOP_ACTIVITY, size + sizeof(*msg), 0, &t);
+	if (ret)
+		return ret;
+
+	msg = t->tx.buf;
+	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
+	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
+	msg->param_id = cpu_to_le32(param_id);
+
+	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));
+
+	ret = ph->xops->do_xfer(ph, t);
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static struct qcom_scmi_vendor_ops qcom_proto_ops = {
+	.set_param = qcom_scmi_set_param,
+	.get_param = qcom_scmi_get_param,
+	.start_activity = qcom_scmi_start_activity,
+	.stop_activity = qcom_scmi_stop_activity,
+};
+
+static int qcom_scmi_vendor_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	u32 version;
+
+	ph->xops->version_get(ph, &version);
+
+	dev_dbg(ph->dev, "SCMI QCOM Vendor Version %d.%d\n",
+		PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	return 0;
+}
+
+static const struct scmi_protocol qcom_scmi_vendor = {
+	.id = QCOM_SCMI_VENDOR_PROTOCOL,
+	.owner = THIS_MODULE,
+	.instance_init = &qcom_scmi_vendor_protocol_init,
+	.ops = &qcom_proto_ops,
+	.vendor_id = "Qualcomm",
+	.impl_ver = 0x20000,
+};
+module_scmi_protocol(qcom_scmi_vendor);
+
+MODULE_DESCRIPTION("QTI SCMI vendor protocol");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/qcom_scmi_vendor.h b/include/linux/qcom_scmi_vendor.h
new file mode 100644
index 000000000000..60f85fedee80
--- /dev/null
+++ b/include/linux/qcom_scmi_vendor.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * QTI SCMI vendor protocol's header
+ *
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _QCOM_SCMI_VENDOR_H
+#define _QCOM_SCMI_VENDOR_H
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/types.h>
+
+#define QCOM_SCMI_VENDOR_PROTOCOL    0x80
+
+struct scmi_protocol_handle;
+
+/**
+ * struct qcom_scmi_vendor_ops - represents the various operations provided
+ *				 by QCOM SCMI Vendor Protocol
+ *
+ * @set_param: set parameter specified by param_id and algo_str pair.
+ * @get_param: retrieve parameter specified by param_id and algo_str pair.
+ * @start_activity: initiate a specific activity defined by algo_str.
+ * @stop_activity: halt previously initiated activity defined by algo_str.
+ */
+struct qcom_scmi_vendor_ops {
+	int (*set_param)(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
+			 u32 param_id, size_t size);
+	int (*get_param)(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
+			 u32 param_id, size_t tx_size, size_t rx_size);
+	int (*start_activity)(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
+			      u32 param_id, size_t size);
+	int (*stop_activity)(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
+			     u32 param_id, size_t size);
+};
+
+#endif /* _QCOM_SCMI_VENDOR_H */
-- 
2.34.1


