Return-Path: <linux-arm-msm+bounces-64532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F100FB0186F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D73A01CA53D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C7C27FB25;
	Fri, 11 Jul 2025 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gjnTcck3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2E327E070;
	Fri, 11 Jul 2025 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752226864; cv=none; b=YLnjjMVe/pdf3UIPUqTeqQYXCl2yG4rGk0jCazATz3349bWzDkQ4Xus/LtQt67S6x1ELVxWNhV0HdcbVyb0XJBrMe+1OM9ZeFb6UCPPAbkhV4arymy44wL/KW6sGKbZMSe7Qf+rHhVcKGfo3CVaXfsJlSjybI7d3OwxUB/0/ZMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752226864; c=relaxed/simple;
	bh=JGZ5Glrse9GYkW28mhgSUB2iig1LlcZUFWQNftqEqoY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CRMAQtjvVupVWEMF0KhDIka3Xvqhu7lkKgZRv7ozCxxRlJSNRIbpirzTrMZVTN4ynf67NfEqCtbxTkdhldMnxhg6wC1BroBj+nbdHkRWh76awxcRfEqtF8qv7c3w645ikTMIhi2xJyKOweJUiTUHqVQNcLq+XTCmF+iBfoX67+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gjnTcck3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X5RK001257;
	Fri, 11 Jul 2025 09:40:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9To5ycp2taIEsca0JwMAClHW/FGVpyZHoKmyHKPJoVg=; b=gjnTcck3KixUWJp+
	EPuEtqreC9Z+IQlsIlr6UwPtit85oB9Uu1hXnMgqtnD0fSapfR/QqclCNPL9ir8s
	jIAMpqJr22q/GxAsDHxVGFBUubbJnB5Eq5toknVPI6j+O2ud77rutpqCdpsCn1E7
	9JjIx5ruNJ9CRPN7HUxcSEWUQEe8VCkRNXxilF74alg3y5zWlIzghK5WclbkofkT
	VVIsSC3Ve73GtMQFDUgxoWMjgCfBaF/YXsqo0Dy9VR9pxI8F/EZw5D0nwJHnHDOV
	cLyD/IJEc1A4ogMGbZ3w2y1XuYYZr6M6wtblhNSUg0M2t7JoAG/rwMJpOx8EjuTN
	MY39fw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucnbhet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56B9emp7024471
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 09:40:48 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 02:40:47 -0700
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
Subject: [PATCH v6 4/5] coresight: Add remote etm support
Date: Fri, 11 Jul 2025 02:40:30 -0700
Message-ID: <20250711094031.4171091-5-quic_jinlmao@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=6870dc21 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=3H110R4YSZwA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=K0pT7PK9Rrvve967010A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ts3IcflmLGo56f3ivtt3u1BHktb0FzMr
X-Proofpoint-ORIG-GUID: ts3IcflmLGo56f3ivtt3u1BHktb0FzMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA2NyBTYWx0ZWRfX42zzOa/rHup8
 1CqElJ7QfbySeLpZ+AWvDy0E/8f5V7zi6bdENRsurIhUKuSgPn6BYRgWK4nKb9Xy9lelN3E0/GK
 yeDFAuMK70DB9o1y2IHEd/fMUPF4RZPSVZ0a32udupqHe6dVHo9m1yrmVHNmSkna0XXY0CrUbL1
 Ojy5Ee4Ty+IFQgK+EmM6rSHXcnxEP/H1rs/0TcxFrhlZZjYs8dzzd8tegVUweAq3h1C/PmyjtWc
 L+QdX74OuxLI6XltvVSKy55mKLik4LEBE63ovVW6iJtVF201bJtEFHyltJq/K4Mcmke8jNMzAsD
 o3BGV6K24GPcWoE0spudUpI2kOvoTKDIqNzZC71VIP589G3Oe/76nkATX9F6sXyYQa2/LLDaan7
 NX+NjBgLUJPKR6gmXhVQOQWMBzMXqpRPgNHDQm8y76hTSR4wOs8FAJvjdOAxb/gtkKcUPrtX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110067

The system on chip (SoC) consists of main APSS(Applications
processor subsytem) and additional processors like modem, lpass.
Coresight remote etm(Embedded Trace Macrocell) driver is for
enabling and disabling the etm trace of remote processors. It
uses QMI interface to communicate with remote processors' software
and uses coresight framework to configure the connection from
remote etm source to TMC sinks.

                 +-----------------+
                 |  Remote ETM     |
                 +-----------------+
                          |
                          |
                 +-----------------+
                 | Coresight Funnel|
                 +-----------------+
                          |
                          |
                 +-----------------+
                 |     TMC ETF     |
                 +-----------------+

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/Kconfig           |  12 +
 drivers/hwtracing/coresight/Makefile          |   1 +
 .../coresight/coresight-remote-etm.c          | 262 ++++++++++++++++++
 3 files changed, 275 insertions(+)
 create mode 100644 drivers/hwtracing/coresight/coresight-remote-etm.c

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index a55b7d875e0a..0a5ab1c0a397 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -279,4 +279,16 @@ config CORESIGHT_QMI
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
index d4b1c74d183f..60bfe6ff0ecb 100644
--- a/drivers/hwtracing/coresight/Makefile
+++ b/drivers/hwtracing/coresight/Makefile
@@ -53,6 +53,7 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
 		   coresight-cti-sysfs.o
 obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
 obj-$(CONFIG_CORESIGHT_QMI) += coresight-qmi.o
+obj-$(CONFIG_CORESIGHT_REMOTE_ETM) += coresight-remote-etm.o
 obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
 obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
 coresight-ctcu-y := coresight-ctcu-core.o
diff --git a/drivers/hwtracing/coresight/coresight-remote-etm.c b/drivers/hwtracing/coresight/coresight-remote-etm.c
new file mode 100644
index 000000000000..facc1e4d057f
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-remote-etm.c
@@ -0,0 +1,262 @@
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
+#include "coresight-trace-id.h"
+
+#define CORESIGHT_QMI_SET_ETM_REQ_MAX_LEN	7
+
+DEFINE_CORESIGHT_DEVLIST(remote_etm_devs, "remote-etm");
+
+/**
+ * struct remote_etm_drvdata - specifics associated to remote etm device
+ * @dev:	the device entity associated to this component
+ * @csdev:	component vitals needed by the framework
+ * @mutex:	lock for seting etm
+ * @inst_id:	the instance id of the remote connection
+ * @traceid:	value of the current trace ID for this component.
+ */
+struct remote_etm_drvdata {
+	struct device			*dev;
+	struct coresight_device		*csdev;
+	struct mutex			mutex;
+	u32				inst_id;
+	u8				traceid;
+};
+
+/*
+ * Element info to descrbe the coresight_set_etm_req_msg_v01 struct
+ * which is used to encode the request.
+ */
+static struct qmi_elem_info coresight_set_etm_req_msg_v01_ei[] = {
+	{
+		.data_type = QMI_UNSIGNED_4_BYTE,
+		.elem_len  = 1,
+		.elem_size = sizeof(enum coresight_etm_state_enum_type_v01),
+		.array_type  = NO_ARRAY,
+		.tlv_type  = 0x01,
+		.offset    = offsetof(struct coresight_set_etm_req_msg_v01,
+							state),
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
+/*
+ * Element info to describe the coresight_set_etm_resp_msg_v01 struct
+ * which is used to decode the response.
+ */
+static struct qmi_elem_info coresight_set_etm_resp_msg_v01_ei[] = {
+	{
+		.data_type = QMI_STRUCT,
+		.elem_len  = 1,
+		.elem_size = sizeof(struct qmi_response_type_v01),
+		.array_type  = NO_ARRAY,
+		.tlv_type  = 0x02,
+		.offset    = offsetof(struct coresight_set_etm_resp_msg_v01,
+							resp),
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
+static int remote_etm_enable(struct coresight_device *csdev, struct perf_event *event,
+		enum cs_mode mode,
+		__maybe_unused struct coresight_path *path)
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
+		coresight_set_etm_resp_msg_v01_ei,
+		coresight_set_etm_req_msg_v01_ei,
+		&resp, &req, CORESIGHT_QMI_SET_ETM_REQ_MAX_LEN);
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
+	coresight_trace_id_put_system_id(drvdata->traceid);
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
+	mutex_unlock(&drvdata->mutex);
+}
+
+static int remote_etm_trace_id(struct coresight_device *csdev,
+			__maybe_unused enum cs_mode mode,
+			__maybe_unused struct coresight_device *sink)
+{
+	int trace_id;
+	struct remote_etm_drvdata *drvdata;
+
+	drvdata = dev_get_drvdata(csdev->dev.parent);
+
+	trace_id = coresight_trace_id_get_system_id();
+	drvdata->traceid = (u8)trace_id;
+
+	return drvdata->traceid;
+}
+
+static const struct coresight_ops_source remote_etm_source_ops = {
+	.enable		= remote_etm_enable,
+	.disable	= remote_etm_disable,
+};
+
+static const struct coresight_ops remote_cs_ops = {
+	.source_ops	= &remote_etm_source_ops,
+	.trace_id       = remote_etm_trace_id,
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
+	ret = of_property_read_u32(dev->of_node, "qcom,qmi-instance-id",
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
+module_platform_driver(remote_etm_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("CoreSight Remote ETM driver");
-- 
2.25.1


