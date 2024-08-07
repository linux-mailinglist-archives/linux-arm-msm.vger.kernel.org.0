Return-Path: <linux-arm-msm+bounces-28062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 966AF94A166
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 09:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 092FBB2174A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 07:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8161C689B;
	Wed,  7 Aug 2024 07:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OQepLXE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BE11C6889;
	Wed,  7 Aug 2024 07:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723014690; cv=none; b=TkU4wGvTnUmQ7jSG/pvbarzzEOEVPhxD3GbvLPstb7fMAIrbTTxyCNML54j8Jh2ncV10GJzVBi1Z995voCLBkXhiu64K2icP7jj8VMrGdW4npIm+2BQ68yr8klX3Y40th9I1qmcHGLTLrB6wVfcFLq01YebJa9N4GlEQvZh8nQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723014690; c=relaxed/simple;
	bh=7EMOOrA9juqBJsmmX7EgZgS51vxu0hwBZoO35aZmg/c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/cVzEpabBOdbd+/W0IWPYujPp+D3zPuR3NxtiaxA0rSo7UAoSbWUn5ZirIzBZI5zugzO+dEQ7EBuSXZV/oQPCHs0IXLc2DpVDI5yHpADOa3/W6NHk6EVsuzurd5PgtCsJQWJNKv0ijHfRD8HRyRFlFRzmrcFtybeoYjsJAEYgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OQepLXE0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 476H6TT9000442;
	Wed, 7 Aug 2024 07:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	195XW6lCZsrJFNtgk+K2OS/XxBNx8T4UUpevNrQHK5w=; b=OQepLXE09JJhOv+E
	ej/GDBwYTCmlLjALciIxVpWOt9z6ZCFmytGpYyIBuExAgF01ukZMycGUIQI8EXnw
	wB465aI1G5+nuO0mLT7CPmGInHAE8gTF37BjX8nswBbjIaIffdJXR2GHBcbVMpEW
	5OSaSmy5v9YhNJMTAS7Dd0POv6vH47Eu6oC6GndPnJ/6ShPdOqID/fXsM4Ol3hmU
	N7e02euddEfhc3GJupTIyY0HHeqI8GXm3LWZdIVAHdfxp1ZsbX1hHYkAIgL/mU9r
	PXpJsjXuC66PlB6e2uKZLQ1/jhzXWVxiWVSK1OTlEvZS0e10bufPqMuu4mA7577a
	n8fqyg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scs31nqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 07:11:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4777B5W4023221
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 07:11:05 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 Aug 2024 00:11:05 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 2/2] coresight: Add remote etm support
Date: Wed, 7 Aug 2024 00:10:51 -0700
Message-ID: <20240807071054.12742-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240807071054.12742-1-quic_jinlmao@quicinc.com>
References: <20240807071054.12742-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nvxKuH7uF0hMhqrWINjM_9LDOUl27dQX
X-Proofpoint-GUID: nvxKuH7uF0hMhqrWINjM_9LDOUl27dQX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_04,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070048

The system on chip (SoC) consists of main APSS(Applications
processor subsytem) and additional processors like modem, lpass.
Coresight remote etm(Embedded Trace Macrocell) driver is for
enabling and disabling the etm trace of remote processors. It
uses QMI interface to communicate with remote processors' software
and uses coresight framework to configure the connection from
remote etm source to TMC sinks.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig           |  13 +
 drivers/hwtracing/coresight/Makefile          |   1 +
 drivers/hwtracing/coresight/coresight-qmi.h   |  89 +++++
 .../coresight/coresight-remote-etm.c          | 308 ++++++++++++++++++
 4 files changed, 411 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.h
 create mode 100644 drivers/hwtracing/coresight/coresight-remote-etm.c

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 06f0a7594169..27a1c61613c7 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -247,4 +247,17 @@ config CORESIGHT_DUMMY
 
 	  To compile this driver as a module, choose M here: the module will be
 	  called coresight-dummy.
+
+config CORESIGHT_REMOTE_ETM
+	tristate "Remote processor ETM trace support"
+	select QCOM_QMI_HELPERS
+	help
+	  Enables support for ETM trace collection on remote processor using
+	  CoreSight framework. Enabling this will allow turning on ETM
+	  tracing on remote processor via sysfs by configuring the required
+	  CoreSight components.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called coresight-remote-etm.
+
 endif
diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
index 4ba478211b31..e0781d729eb3 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
+obj-$(CONFIG_CORESIGHT_REMOTE_ETM) += coresight-remote-etm.o
diff --git a/drivers/hwtracing/coresight/coresight-qmi.h b/drivers/hwtracing/coresight/coresight-qmi.h
new file mode 100644
index 000000000000..76ce9b7fdf0a
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-qmi.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _CORESIGHT_QMI_H
+#define _CORESIGHT_QMI_H
+
+#include <linux/soc/qcom/qmi.h>
+
+#define CORESIGHT_QMI_SVC_ID			(0x33)
+#define CORESIGHT_QMI_VERSION			(1)
+
+#define CORESIGHT_QMI_GET_ETM_REQ_V01		(0x002B)
+#define CORESIGHT_QMI_GET_ETM_RESP_V01		(0x002B)
+#define CORESIGHT_QMI_SET_ETM_REQ_V01		(0x002C)
+#define CORESIGHT_QMI_SET_ETM_RESP_V01		(0x002C)
+
+#define CORESIGHT_QMI_GET_ETM_REQ_MAX_LEN	(0)
+#define CORESIGHT_QMI_GET_ETM_RESP_MAX_LEN	(14)
+#define CORESIGHT_QMI_SET_ETM_REQ_MAX_LEN	(7)
+#define CORESIGHT_QMI_SET_ETM_RESP_MAX_LEN	(7)
+
+#define TIMEOUT_MS				(10000)
+
+enum coresight_etm_state_enum_type_v01 {
+	/* To force a 32 bit signed enum. Do not change or use */
+	CORESIGHT_ETM_STATE_ENUM_TYPE_MIN_ENUM_VAL_V01 = INT_MIN,
+	CORESIGHT_ETM_STATE_DISABLED_V01 = 0,
+	CORESIGHT_ETM_STATE_ENABLED_V01 = 1,
+	CORESIGHT_ETM_STATE_ENUM_TYPE_MAX_ENUM_VAL_01 = INT_MAX,
+};
+
+struct coresight_set_etm_req_msg_v01 {
+	/* Mandatory */
+	/* ETM output state */
+	enum coresight_etm_state_enum_type_v01 state;
+};
+
+struct coresight_set_etm_resp_msg_v01 {
+	/* Mandatory */
+	struct qmi_response_type_v01 resp;
+};
+
+static struct qmi_elem_info coresight_set_etm_req_msg_v01_ei[] = {
+	{
+		.data_type = QMI_UNSIGNED_4_BYTE,
+		.elem_len  = 1,
+		.elem_size = sizeof(enum coresight_etm_state_enum_type_v01),
+		.array_type  = NO_ARRAY,
+		.tlv_type  = 0x01,
+		.offset    = offsetof(struct coresight_set_etm_req_msg_v01,
+				      state),
+		.ei_array  = NULL,
+	},
+	{
+		.data_type = QMI_EOTI,
+		.elem_len  = 0,
+		.elem_size = 0,
+		.array_type  = NO_ARRAY,
+		.tlv_type  = 0,
+		.offset    = 0,
+		.ei_array  = NULL,
+	},
+};
+
+static struct qmi_elem_info coresight_set_etm_resp_msg_v01_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len  = 1,
+		.elem_size = sizeof(struct qmi_response_type_v01),
+		.array_type  = NO_ARRAY,
+		.tlv_type  = 0x02,
+		.offset    = offsetof(struct coresight_set_etm_resp_msg_v01,
+				      resp),
+		.ei_array  = qmi_response_type_v01_ei,
+	},
+	{
+		.data_type = QMI_EOTI,
+		.elem_len  = 0,
+		.elem_size = 0,
+		.array_type  = NO_ARRAY,
+		.tlv_type  = 0,
+		.offset    = 0,
+		.ei_array  = NULL,
+	},
+};
+
+#endif
diff --git a/drivers/hwtracing/coresight/coresight-remote-etm.c b/drivers/hwtracing/coresight/coresight-remote-etm.c
new file mode 100644
index 000000000000..7d01e17b9210
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-remote-etm.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/types.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/io.h>
+#include <linux/err.h>
+#include <linux/sysfs.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/coresight.h>
+#include "coresight-qmi.h"
+#include "coresight-priv.h"
+
+DEFINE_CORESIGHT_DEVLIST(remote_etm_devs, "remote-etm");
+
+#define MAX_INSTANCE_ID		0xFF
+
+struct remote_etm_drvdata {
+	struct device			*dev;
+	struct coresight_device		*csdev;
+	struct mutex			mutex;
+	struct qmi_handle		handle;
+	u32				inst_id;
+	bool				enabled;
+	bool				service_connected;
+	struct sockaddr_qrtr		s_addr;
+};
+
+static int service_remote_etm_new_server(struct qmi_handle *qmi,
+		struct qmi_service *svc)
+{
+	struct remote_etm_drvdata *drvdata = container_of(qmi,
+					struct remote_etm_drvdata, handle);
+
+	drvdata->s_addr.sq_family = AF_QIPCRTR;
+	drvdata->s_addr.sq_node = svc->node;
+	drvdata->s_addr.sq_port = svc->port;
+	drvdata->service_connected = true;
+	dev_info(drvdata->dev,
+		"Connection established between QMI handle and %d service\n",
+		drvdata->inst_id);
+
+	return 0;
+}
+
+static void service_remote_etm_del_server(struct qmi_handle *qmi,
+		struct qmi_service *svc)
+{
+	struct remote_etm_drvdata *drvdata = container_of(qmi,
+					struct remote_etm_drvdata, handle);
+	drvdata->service_connected = false;
+	dev_info(drvdata->dev,
+		"Connection disconnected between QMI handle and %d service\n",
+		drvdata->inst_id);
+}
+
+static struct qmi_ops server_ops = {
+	.new_server = service_remote_etm_new_server,
+	.del_server = service_remote_etm_del_server,
+};
+
+static int remote_etm_enable(struct coresight_device *csdev,
+			     struct perf_event *event, u32 mode)
+{
+	struct remote_etm_drvdata *drvdata =
+		dev_get_drvdata(csdev->dev.parent);
+	struct coresight_set_etm_req_msg_v01 req;
+	struct coresight_set_etm_resp_msg_v01 resp = { { 0, 0 } };
+	struct qmi_txn txn;
+	int ret;
+
+	mutex_lock(&drvdata->mutex);
+
+	if (!drvdata->service_connected) {
+		dev_err(drvdata->dev, "QMI service not connected!\n");
+		ret = -EINVAL;
+		goto err;
+	}
+	/*
+	 * The QMI handle may be NULL in the following scenarios:
+	 * 1. QMI service is not present
+	 * 2. QMI service is present but attempt to enable remote ETM is earlier
+	 *    than service is ready to handle request
+	 * 3. Connection between QMI client and QMI service failed
+	 *
+	 * Enable CoreSight without processing further QMI commands which
+	 * provides the option to enable remote ETM by other means.
+	 */
+	req.state = CORESIGHT_ETM_STATE_ENABLED_V01;
+
+	ret = qmi_txn_init(&drvdata->handle, &txn,
+			coresight_set_etm_resp_msg_v01_ei,
+			&resp);
+
+	if (ret < 0) {
+		dev_err(drvdata->dev, "QMI tx init failed , ret:%d\n",
+				ret);
+		goto err;
+	}
+
+	ret = qmi_send_request(&drvdata->handle, &drvdata->s_addr,
+			&txn, CORESIGHT_QMI_SET_ETM_REQ_V01,
+			CORESIGHT_QMI_SET_ETM_REQ_MAX_LEN,
+			coresight_set_etm_req_msg_v01_ei,
+			&req);
+	if (ret < 0) {
+		dev_err(drvdata->dev, "QMI send ACK failed, ret:%d\n",
+				ret);
+		qmi_txn_cancel(&txn);
+		goto err;
+	}
+
+	ret = qmi_txn_wait(&txn, msecs_to_jiffies(TIMEOUT_MS));
+	if (ret < 0) {
+		dev_err(drvdata->dev, "QMI qmi txn wait failed, ret:%d\n",
+				ret);
+		goto err;
+	}
+
+	/* Check the response */
+	if (resp.resp.result != QMI_RESULT_SUCCESS_V01)
+		dev_err(drvdata->dev, "QMI request failed 0x%x\n",
+				resp.resp.error);
+
+	drvdata->enabled = true;
+	mutex_unlock(&drvdata->mutex);
+
+	dev_dbg(drvdata->dev, "Remote ETM tracing enabled for instance %d\n",
+				drvdata->inst_id);
+	return 0;
+err:
+	mutex_unlock(&drvdata->mutex);
+	return ret;
+}
+
+static void remote_etm_disable(struct coresight_device *csdev,
+			       struct perf_event *event)
+{
+	struct remote_etm_drvdata *drvdata =
+		 dev_get_drvdata(csdev->dev.parent);
+	struct coresight_set_etm_req_msg_v01 req;
+	struct coresight_set_etm_resp_msg_v01 resp = { { 0, 0 } };
+	struct qmi_txn txn;
+	int ret;
+
+	mutex_lock(&drvdata->mutex);
+	if (!drvdata->service_connected) {
+		dev_err(drvdata->dev, "QMI service not connected!\n");
+		goto err;
+	}
+
+	req.state = CORESIGHT_ETM_STATE_DISABLED_V01;
+
+	ret = qmi_txn_init(&drvdata->handle, &txn,
+			coresight_set_etm_resp_msg_v01_ei,
+			&resp);
+
+	if (ret < 0) {
+		dev_err(drvdata->dev, "QMI tx init failed , ret:%d\n",
+				ret);
+		goto err;
+	}
+
+	ret = qmi_send_request(&drvdata->handle, &drvdata->s_addr,
+			&txn, CORESIGHT_QMI_SET_ETM_REQ_V01,
+			CORESIGHT_QMI_SET_ETM_REQ_MAX_LEN,
+			coresight_set_etm_req_msg_v01_ei,
+			&req);
+	if (ret < 0) {
+		dev_err(drvdata->dev, "QMI send req failed, ret:%d\n",
+				 ret);
+		qmi_txn_cancel(&txn);
+		goto err;
+	}
+
+	ret = qmi_txn_wait(&txn, msecs_to_jiffies(TIMEOUT_MS));
+	if (ret < 0) {
+		dev_err(drvdata->dev, "QMI qmi txn wait failed, ret:%d\n",
+				ret);
+		goto err;
+	}
+
+	/* Check the response */
+	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
+		dev_err(drvdata->dev, "QMI request failed 0x%x\n",
+				resp.resp.error);
+		goto err;
+	}
+
+	drvdata->enabled = false;
+	dev_info(drvdata->dev, "Remote ETM tracing disabled for instance %d\n",
+				drvdata->inst_id);
+err:
+	mutex_unlock(&drvdata->mutex);
+}
+
+static const struct coresight_ops_source remote_etm_source_ops = {
+	.enable		= remote_etm_enable,
+	.disable	= remote_etm_disable,
+};
+
+static const struct coresight_ops remote_cs_ops = {
+	.source_ops	= &remote_etm_source_ops,
+};
+
+static int remote_etm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct coresight_platform_data *pdata;
+	struct remote_etm_drvdata *drvdata;
+	struct coresight_desc desc = {0 };
+	int ret;
+
+	desc.name = coresight_alloc_device_name(&remote_etm_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata))
+		return PTR_ERR(pdata);
+	pdev->dev.platform_data = pdata;
+
+	pm_runtime_enable(dev);
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &pdev->dev;
+	platform_set_drvdata(pdev, drvdata);
+
+	ret = of_property_read_u32(pdev->dev.of_node, "qcom,inst-id",
+			&drvdata->inst_id);
+	if (ret)
+		return ret;
+
+	if (drvdata->inst_id >= MAX_INSTANCE_ID) {
+		dev_err(dev, "inst_id is invalid.\n");
+		return -EINVAL;
+	}
+
+	mutex_init(&drvdata->mutex);
+
+	ret = qmi_handle_init(&drvdata->handle,
+			CORESIGHT_QMI_SET_ETM_REQ_MAX_LEN,
+			&server_ops, NULL);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Remote ETM client init failed.\n");
+		return ret;
+	}
+
+	qmi_add_lookup(&drvdata->handle,
+			CORESIGHT_QMI_SVC_ID,
+			CORESIGHT_QMI_VERSION,
+			drvdata->inst_id);
+
+	desc.type = CORESIGHT_DEV_TYPE_SOURCE;
+	desc.subtype.source_subtype = CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS;
+	desc.ops = &remote_cs_ops;
+	desc.pdata = pdev->dev.platform_data;
+	desc.dev = &pdev->dev;
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev)) {
+		ret = PTR_ERR(drvdata->csdev);
+		goto err;
+	}
+
+	return 0;
+err:
+	qmi_handle_release(&drvdata->handle);
+	return ret;
+}
+
+static int remote_etm_remove(struct platform_device *pdev)
+{
+	struct remote_etm_drvdata *drvdata = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_disable(dev);
+	qmi_handle_release(&drvdata->handle);
+	coresight_unregister(drvdata->csdev);
+	return 0;
+}
+
+static const struct of_device_id remote_etm_match[] = {
+	{.compatible = "qcom,coresight-remote-etm"},
+	{}
+};
+
+static struct platform_driver remote_etm_driver = {
+	.probe          = remote_etm_probe,
+	.remove         = remote_etm_remove,
+	.driver         = {
+		.name   = "coresight-remote-etm",
+		.of_match_table = remote_etm_match,
+	},
+};
+
+module_platform_driver(remote_etm_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("CoreSight Remote ETM driver");
-- 
2.41.0


