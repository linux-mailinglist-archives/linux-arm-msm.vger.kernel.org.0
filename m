Return-Path: <linux-arm-msm+bounces-55386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81784A9ACA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 13:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77DCE1B669B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 12:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4A322F3AB;
	Thu, 24 Apr 2025 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K6UQC6X/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AD8226CFD;
	Thu, 24 Apr 2025 11:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495965; cv=none; b=Fp/9+ia6rJjwx7RBdx8mIBGKGg6mIMAPANIJHwpyY+08hrH8yjmoRYpvwePGdzFmnDt0se6ErlLnF6m8GzYO7nfvsYAIdJ0X7k5LuNRFxNZgwHBVrpk3UmMaN/JZ78kDMagu6YJNvbkD0kIzog4FoVWXHjsbPzdpH0KB7ycQ/jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495965; c=relaxed/simple;
	bh=2CM9x1Ph04ysm4eAZo1lcX0z3b1PbynQQuz5EMq7obw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XXQWujbmLJ6dtaky7xxgWgDjwSDqGYLMCCvq/+utt+Zcn7njJqMQM42IaxZB1Gj0+wg0ez5rf4gHgZq/0yLuQmrqzloLxUSJVCz9+FkFY+N0sSNi+kwGB3xb07LVa86Dx5tPvZfFnlpSi0to4pQXcqSS41S4wc7ZayiQ2C6kabg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K6UQC6X/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OBoZ3x004645;
	Thu, 24 Apr 2025 11:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TgSq7c5OUMpiciRAgE0n9PHZu4IbtRo6VY9JvTPqROs=; b=K6UQC6X/F3xhMiPb
	5OxB65Aialq0N+Nm1tszKDfcqR0cY7f+0n8AV6eZTBQ9QIeIJRP2/sa4Mm0uKcSc
	i1U8XIcL617opDN2WWSpf56VePIalZ07WH737fasq1ZFKsdFk+waz1zqnPB3uJIa
	d9bzlcyclAhOhszil+EH9nOldcNBhX5hpceVmmvba7hn8xBG0SBuEd8zTtyqOwz7
	01oeaxiwxfJ/vJvW+5M273i8FVI9v5Cm1J7VrFWrmS+eKXCIzFrrc0/wCxXq3bO6
	UPvPbR+gE8MT2CzyIlTVDbTPyOa8n5pr5bC/fzLZQhSViP7AW6K/H5mr5EXSWMwt
	pw8Z8Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy5f6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 11:59:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53OBx9Sd016729
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
Subject: [PATCH v5 4/5] coresight: Add remote etm support
Date: Thu, 24 Apr 2025 04:58:53 -0700
Message-ID: <20250424115854.2328190-5-quic_jinlmao@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA4MCBTYWx0ZWRfXzverCcV2nNkv HJ4xasfjx6B7MJhfml6hFSD6qzWDqvrWLSxeMVK6bxX38Zf1FAabWnWUc9t5ZQVZyS/ryYwSvxl VZoQUHlJMDVNAVcYbsepb8uE2Rhjytj2J/OwynrQRGTFLoXJQRzTTjR4N+9iSXj8jcJNYj03USJ
 cj3WUDgk/ioh0PT/Ij0CWVYtK4KPANd7WPb3omf2Mten7Zx6J4W4K1pwJR2xwPZD9Yb+PBgja1a 15m6aSG/sL593hkWahtPkyn/nhq0mzNRGIc27jH33bVtaOIVTOpdw0MsQNZt5OFbpTQ2knHuN48 1Ci9YR0aPNDlzvWk1CoYfRihD0uudDeXY2KybAvMETjtt55JomumhbchSF1h3g7edNQ7rsspaLz
 Xs2AEfaNAjfH4ga3R4ytTtsnchgEL0dK8k5AX2fwrqum77G5fMqVurnOzOuuteDo6ytIXoFZ
X-Proofpoint-GUID: enkA29PeFT8E6uHZNeCJrxlDZLDJRKVJ
X-Proofpoint-ORIG-GUID: enkA29PeFT8E6uHZNeCJrxlDZLDJRKVJ
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680a278f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=L51hKv014lsWBt7CwNIA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1011
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240080

The system on chip (SoC) consists of main APSS(Applications
processor subsytem) and additional processors like modem, lpass.
Coresight remote etm(Embedded Trace Macrocell) driver is for
enabling and disabling the etm trace of remote processors. It
uses QMI interface to communicate with remote processors' software
and uses coresight framework to configure the connection from
remote etm source to TMC sinks.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig           |  12 +
 drivers/hwtracing/coresight/Makefile          |   1 +
 .../coresight/coresight-remote-etm.c          | 252 ++++++++++++++++++
 3 files changed, 265 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/coresight-remote-etm.c

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 61f673dbc2e9..2795efa516c9 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -259,4 +259,16 @@ config CORESIGHT_QMI
 	  To compile this driver as a module, choose M here: the module will be
 	  called coresight-qmi.
 
+config CORESIGHT_REMOTE_ETM
+	tristate "Remote processor ETM trace support"
+	depends on QCOM_QMI_HELPERS
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
index 99ee0f8c25d2..18528532112d 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -51,4 +51,5 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_QMI) += coresight-qmi.o
+obj-$(CONFIG_CORESIGHT_REMOTE_ETM) += coresight-remote-etm.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
diff --git a/drivers/hwtracing/coresight/coresight-remote-etm.c b/drivers/hwtracing/coresight/coresight-remote-etm.c
new file mode 100644
index 000000000000..f9640246e280
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-remote-etm.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/coresight.h>
+
+#include "coresight-qmi.h"
+
+#define CORESIGHT_QMI_SET_ETM_REQ_MAX_LEN	(7)
+
+DEFINE_CORESIGHT_DEVLIST(remote_etm_devs, "remote-etm");
+
+/**
+ * struct remote_etm_drvdata - specifics associated to remote etm device
+ * @dev:	the device entity associated to this component
+ * @csdev:	component vitals needed by the framework
+ * @mutex:	lock for seting etm
+ * @inst_id:	the instance id of the remote connection
+ */
+struct remote_etm_drvdata {
+	struct device			*dev;
+	struct coresight_device		*csdev;
+	struct mutex			mutex;
+	u32				inst_id;
+};
+
+/*
+ * Element info to descrbe the coresight_set_etm_req_msg_v01 struct
+ * which is used to encode the request.
+ */
+static struct qmi_elem_info coresight_set_etm_req_msg_v01_ei[] = {
+	{
+			.data_type = QMI_UNSIGNED_4_BYTE,
+			.elem_len  = 1,
+			.elem_size = sizeof(enum coresight_etm_state_enum_type_v01),
+			.array_type  = NO_ARRAY,
+			.tlv_type  = 0x01,
+			.offset    = offsetof(struct coresight_set_etm_req_msg_v01,
+								state),
+			.ei_array  = NULL,
+	},
+	{
+			.data_type = QMI_EOTI,
+			.elem_len  = 0,
+			.elem_size = 0,
+			.array_type  = NO_ARRAY,
+			.tlv_type  = 0,
+			.offset    = 0,
+			.ei_array  = NULL,
+	},
+};
+
+/*
+ * Element info to describe the coresight_set_etm_resp_msg_v01 struct
+ * which is used to decode the response.
+ */
+static struct qmi_elem_info coresight_set_etm_resp_msg_v01_ei[] = {
+	{
+			.data_type = QMI_STRUCT,
+			.elem_len  = 1,
+			.elem_size = sizeof(struct qmi_response_type_v01),
+			.array_type  = NO_ARRAY,
+			.tlv_type  = 0x02,
+			.offset    = offsetof(struct coresight_set_etm_resp_msg_v01,
+								resp),
+			.ei_array  = qmi_response_type_v01_ei,
+	},
+	{
+			.data_type = QMI_EOTI,
+			.elem_len  = 0,
+			.elem_size = 0,
+			.array_type  = NO_ARRAY,
+			.tlv_type  = 0,
+			.offset    = 0,
+			.ei_array  = NULL,
+	},
+};
+
+static int remote_etm_enable(struct coresight_device *csdev,
+			     struct perf_event *event, enum cs_mode mode,
+			     __maybe_unused struct coresight_trace_id_map *trace_id)
+{
+	struct remote_etm_drvdata *drvdata =
+		dev_get_drvdata(csdev->dev.parent);
+	struct coresight_set_etm_req_msg_v01 req;
+	struct coresight_set_etm_resp_msg_v01 resp = { { 0, 0 } };
+	int ret = 0;
+
+	mutex_lock(&drvdata->mutex);
+
+	if (mode != CS_MODE_SYSFS) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if (!coresight_take_mode(csdev, mode)) {
+		ret = -EBUSY;
+		goto err;
+	}
+
+	req.state = CORESIGHT_ETM_STATE_ENABLED_V01;
+
+	ret = coresight_send_qmi_request(drvdata->inst_id, CORESIGHT_QMI_SET_ETM_REQ_V01,
+			coresight_set_etm_resp_msg_v01_ei,
+			coresight_set_etm_req_msg_v01_ei,
+			&resp, &req, CORESIGHT_QMI_SET_ETM_REQ_MAX_LEN);
+
+	if (ret)
+		goto err;
+
+	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
+		dev_err(drvdata->dev, "QMI request failed 0x%x\n", resp.resp.error);
+		ret = -EINVAL;
+		goto err;
+	}
+
+	mutex_unlock(&drvdata->mutex);
+	return 0;
+err:
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
+	mutex_unlock(&drvdata->mutex);
+	return ret;
+
+}
+
+static void remote_etm_disable(struct coresight_device *csdev,
+			       struct perf_event *event)
+{
+	struct remote_etm_drvdata *drvdata =
+		 dev_get_drvdata(csdev->dev.parent);
+	struct coresight_set_etm_req_msg_v01 req;
+	struct coresight_set_etm_resp_msg_v01 resp = { { 0, 0 } };
+	int ret = 0;
+
+	mutex_lock(&drvdata->mutex);
+
+	req.state = CORESIGHT_ETM_STATE_DISABLED_V01;
+
+	ret = coresight_send_qmi_request(drvdata->inst_id, CORESIGHT_QMI_SET_ETM_REQ_V01,
+					coresight_set_etm_resp_msg_v01_ei,
+					coresight_set_etm_req_msg_v01_ei,
+					&resp, &req, CORESIGHT_QMI_SET_ETM_REQ_MAX_LEN);
+	if (ret)
+		dev_err(drvdata->dev, "Send qmi request failed %d\n", ret);
+
+	if (resp.resp.result != QMI_RESULT_SUCCESS_V01)
+		dev_err(drvdata->dev, "QMI request failed %d\n", resp.resp.error);
+
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
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
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = dev;
+	platform_set_drvdata(pdev, drvdata);
+
+	ret = of_property_read_u32(dev->of_node, "qcom,qmi-id",
+			&drvdata->inst_id);
+	if (ret)
+		return ret;
+
+	mutex_init(&drvdata->mutex);
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
+	dev_dbg(dev, "Remote ETM initialized\n");
+
+	return 0;
+
+err:
+	return ret;
+}
+
+static void remote_etm_remove(struct platform_device *pdev)
+{
+	struct remote_etm_drvdata *drvdata = platform_get_drvdata(pdev);
+
+	coresight_unregister(drvdata->csdev);
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
+static int __init remote_etm_init(void)
+{
+	return platform_driver_register(&remote_etm_driver);
+}
+module_init(remote_etm_init);
+
+static void __exit remote_etm_exit(void)
+{
+	platform_driver_unregister(&remote_etm_driver);
+}
+module_exit(remote_etm_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("CoreSight Remote ETM driver");
-- 
2.25.1


