Return-Path: <linux-arm-msm+bounces-34845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC0B9A3359
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 05:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 881F61F2400C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 03:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D900517837F;
	Fri, 18 Oct 2024 03:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cvYR/SBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138FF157E9F;
	Fri, 18 Oct 2024 03:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729221782; cv=none; b=YGE/tZFAPNJnWTQB1Ri2yu7qf6FvspOfcrrzjD6nKb9WsURaTkTdxslW+5EQt7e6K/7UZcDMYqzzcuwcTOk2q0BX6puGbB3qEx32fDC84ZHkwULXJLD+5f3MtUQFUOhtv97Hy4FCbeGrd79es106QgOarKp6GiwOWhH8APqN3T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729221782; c=relaxed/simple;
	bh=gJlh61E1nfu34PqB5f7qcBkZwGwX7T0BWs4HdWJDYtE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AxoB2208Y87m5ChrC3ukLZ0sqYBlV7SFC2Quc+awWTCEij+I9MdiJiYUAiVf+jSBG34woGpwfje26tBXBtpPiPa/CnAoWZsq8bNO964/V3PvhQuj1ny6r3XjpHn1EbkWI7mG12pkY6YvPP076Ymn/bbcETEq2g1eJOOUaZtZAP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cvYR/SBA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I1gNMj022062;
	Fri, 18 Oct 2024 03:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kVPTS7C/R+EaeG9oLDsaFo9B
	tvKX+wm/cwTEkjqVKy8=; b=cvYR/SBAX2l7ym3h+lHVqtjqvJtPw/4qLrn2AbNK
	KhRCQhY1qBdGjfQ/Y1q5+y5P/aGtBtkRkhnZpUE9uTDRcfK6ura3i04Bq6xqgC9r
	8qeKvE/fEzIRLTY7lbFk/C+i3WzFjQm2611MPosCx41+1Tp6mAauvAtwHlWOWFNU
	Um9fI2T6bVUCIA4tuSXMRLqNkPLzTLvSlccKb6RLnvQhgRHoE/wR/kVAMq+Gnpvt
	pJkuROkPD3tkL4S2UlCBzKP9EyhSsUrhov0Tvly3CIaCjMMOROq853ZArwk1Qs/N
	ZY9lJLgiz1Z0wSup71vPXTLVnu6PRXJjidLjTwRbQt65Cg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42be8c87bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 03:22:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I3Mm5d016886
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 03:22:48 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 20:22:45 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v5 3/3] coresight: dummy: Add static trace id support for dummy source
Date: Fri, 18 Oct 2024 11:22:17 +0800
Message-ID: <20241018032217.39728-4-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241018032217.39728-1-quic_jinlmao@quicinc.com>
References: <20241018032217.39728-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fBXbwWIunZ95LeCr4Pe04H1-_bDYz_aa
X-Proofpoint-ORIG-GUID: fBXbwWIunZ95LeCr4Pe04H1-_bDYz_aa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180019

Some dummy source has static trace id configured in HW and it cannot
be changed via software programming. Configure the trace id in device
tree and reserve the id when device probe.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../sysfs-bus-coresight-devices-dummy-source  | 15 +++++
 drivers/hwtracing/coresight/coresight-dummy.c | 59 +++++++++++++++++--
 2 files changed, 70 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
new file mode 100644
index 000000000000..c7d975e75d85
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
@@ -0,0 +1,15 @@
+What:		/sys/bus/coresight/devices/dummy_source<N>/enable_source
+Date:		Oct 2024
+KernelVersion:	6.13
+Contact:	Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:	(RW) Enable/disable tracing of dummy source. A sink should be activated
+		before enabling the source. The path of coresight components linking
+		the source to the sink is configured and managed automatically by the
+		coresight framework.
+
+What:		/sys/bus/coresight/devices/dummy_source<N>/traceid
+Date:		Oct 2024
+KernelVersion:	6.13
+Contact:	Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:	(R) Show the trace ID that will appear in the trace stream
+		coming from this trace entity.
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index bb85fa663ffc..602a7e89e311 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -11,10 +11,12 @@
 #include <linux/pm_runtime.h>
 
 #include "coresight-priv.h"
+#include "coresight-trace-id.h"
 
 struct dummy_drvdata {
 	struct device			*dev;
 	struct coresight_device		*csdev;
+	u8				traceid;
 };
 
 DEFINE_CORESIGHT_DEVLIST(source_devs, "dummy_source");
@@ -72,6 +74,32 @@ static const struct coresight_ops dummy_sink_cs_ops = {
 	.sink_ops = &dummy_sink_ops,
 };
 
+/* User can get the trace id of dummy source from this node. */
+static ssize_t traceid_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	unsigned long val;
+	struct dummy_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	val = drvdata->traceid;
+	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+}
+static DEVICE_ATTR_RO(traceid);
+
+static struct attribute *coresight_dummy_attrs[] = {
+	&dev_attr_traceid.attr,
+	NULL,
+};
+
+static const struct attribute_group coresight_dummy_group = {
+	.attrs = coresight_dummy_attrs,
+};
+
+static const struct attribute_group *coresight_dummy_groups[] = {
+	&coresight_dummy_group,
+	NULL,
+};
+
 static int dummy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -79,6 +107,11 @@ static int dummy_probe(struct platform_device *pdev)
 	struct coresight_platform_data *pdata;
 	struct dummy_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
+	int ret, trace_id;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
 
 	if (of_device_is_compatible(node, "arm,coresight-dummy-source")) {
 
@@ -90,6 +123,25 @@ static int dummy_probe(struct platform_device *pdev)
 		desc.subtype.source_subtype =
 					CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS;
 		desc.ops = &dummy_source_cs_ops;
+		desc.groups = coresight_dummy_groups;
+
+		ret = coresight_get_static_trace_id(dev, &trace_id);
+		if (!ret) {
+			/* Get the static id if id is set in device tree. */
+			ret = coresight_trace_id_get_static_system_id(trace_id);
+			if (ret < 0)
+				return ret;
+
+		} else {
+			/* Get next available id if id is not set in device tree. */
+			trace_id = coresight_trace_id_get_system_id();
+			if (trace_id < 0) {
+				ret = trace_id;
+				return ret;
+			}
+		}
+		drvdata->traceid = (u8)trace_id;
+
 	} else if (of_device_is_compatible(node, "arm,coresight-dummy-sink")) {
 		desc.name = coresight_alloc_device_name(&sink_devs, dev);
 		if (!desc.name)
@@ -108,10 +160,6 @@ static int dummy_probe(struct platform_device *pdev)
 		return PTR_ERR(pdata);
 	pdev->dev.platform_data = pdata;
 
-	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
 	drvdata->dev = &pdev->dev;
 	platform_set_drvdata(pdev, drvdata);
 
@@ -131,7 +179,10 @@ static void dummy_remove(struct platform_device *pdev)
 {
 	struct dummy_drvdata *drvdata = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
 
+	if (IS_VALID_CS_TRACE_ID(drvdata->traceid))
+		coresight_trace_id_put_system_id(drvdata->traceid);
 	pm_runtime_disable(dev);
 	coresight_unregister(drvdata->csdev);
 }
-- 
2.17.1


