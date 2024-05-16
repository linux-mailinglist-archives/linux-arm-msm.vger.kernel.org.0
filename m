Return-Path: <linux-arm-msm+bounces-19905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B51F78C7075
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 04:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9F221C20E83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 02:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B041862;
	Thu, 16 May 2024 02:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C8eZQ7u4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0B61C2D;
	Thu, 16 May 2024 02:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715828233; cv=none; b=iT3fUfS6gEqLNgIAkYHlpepSaTBZ3/76B/8OeX9Si4jkCTNrcwxcua6IY3kiledrQugpzbrvOchAjfWw2vcidmH9QZFVixv1438izm+E1AQvRfNqshBXDXS2vk5brvjBDaT7bZuHfl0YOuQdKrpfsgpM8uKEFwlVALET6wsIRrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715828233; c=relaxed/simple;
	bh=Q+UXxd9cVmF8D14wAh0tGcvXygENG9CxPCUqLKj4x2E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eLV1Y2adknFqBaXd8TQ4rWtiBuqa2fAebVEHwm7BTj0t1jEhE1id0YHLgZMfCKscXTMIcpT7QHyqBjVTbZlsqtDX3w2Qrz1PRpb9YSXqyF01bJlusMiaUv9SQ1uW0yk5yYLtfJofFtELS/tGj8tcCP0c3TubqQ94uSSp3bhJxr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C8eZQ7u4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FKjjU5007802;
	Thu, 16 May 2024 02:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=Z/LoJcAhhByDiHRy+Qir+p5EdheHOXjygRXCAGN4nQ8=; b=C8
	eZQ7u4Uu7poUTk/sRP11Q7EbNVDwDRk8oKDmv20KMllao+7lolXpw38AV0M8b45p
	CJ/NfqyaapwdMjoK4xBdIe8+mo+9hMjU9auuCejJn34F+LX3xMLUYk2oquwkZ4P1
	Y0AKrGM1pCneKWpU1vGlJweGDQNu7SlhukceTntCQujnk0GITSedK3TA72Yfnqw0
	n37VCLZWolWdG9wQeeb26w7PPAkHmS5B3oHY7p8hXT7gwrQ5gwypcVhFvf1xX4os
	R0UqqiL0Di/73vfyc+Q+lYa3KUSB2yveERVGBMKuw5vtxvfEK8C6O/CGgGpSucbK
	nf7jLbv8rnTvOyz236UQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47f44d8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 02:56:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44G2uv8g009782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 02:56:57 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 19:56:57 -0700
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
        <linux-arm-msm@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        songchai <quic_songchai@quicinc.com>
Subject: [PATCH v1 3/3] coresight: dummy: Add reserve atid support for dummy source
Date: Wed, 15 May 2024 19:56:42 -0700
Message-ID: <20240516025644.4383-4-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240516025644.4383-1-quic_jinlmao@quicinc.com>
References: <20240516025644.4383-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LXgVICuOPZv7pR0LGb-PCfsMNX3w1Doz
X-Proofpoint-ORIG-GUID: LXgVICuOPZv7pR0LGb-PCfsMNX3w1Doz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_01,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160019

Some dummy source has static trace id configured in HW and it cannot
be changed via software programming. Configure the trace id in device
tree and reserve the id when device probe.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../sysfs-bus-coresight-devices-dummy-source  | 15 +++++
 drivers/hwtracing/coresight/coresight-dummy.c | 56 +++++++++++++++++--
 2 files changed, 67 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
new file mode 100644
index 000000000000..608ea6d0f39a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
@@ -0,0 +1,15 @@
+What:		/sys/bus/coresight/devices/dummy_source<N>/enable_source
+Date:		May 2024
+KernelVersion:	6.9
+Contact:	Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:	(RW) Enable/disable tracing of dummy source. A sink should be activated
+		before enabling the source. The path of coresight components linking
+		the source to the sink is configured and managed automatically by the
+		coresight framework.
+
+What:		/sys/bus/coresight/devices/dummy_source<N>/traceid
+Date:		May 2024
+KernelVersion:	6.9
+Contact:	Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:	(R) Show the trace ID that will appear in the trace stream
+		coming from this trace entity.
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index ac70c0b491be..2564e1c8ae26 100644
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
@@ -67,6 +69,32 @@ static const struct coresight_ops dummy_sink_cs_ops = {
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
@@ -74,6 +102,11 @@ static int dummy_probe(struct platform_device *pdev)
 	struct coresight_platform_data *pdata;
 	struct dummy_drvdata *drvdata;
 	struct coresight_desc desc = { 0 };
+	int ret, trace_id;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
 
 	if (of_device_is_compatible(node, "arm,coresight-dummy-source")) {
 
@@ -85,6 +118,22 @@ static int dummy_probe(struct platform_device *pdev)
 		desc.subtype.source_subtype =
 					CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS;
 		desc.ops = &dummy_source_cs_ops;
+		desc.groups = coresight_dummy_groups;
+
+		ret = coresight_get_trace_id(dev, &trace_id);
+		if (!ret) {
+			ret = coresight_trace_id_reserve_system_id(trace_id);
+			if (ret)
+				return ret;
+		} else {
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
@@ -103,10 +152,6 @@ static int dummy_probe(struct platform_device *pdev)
 		return PTR_ERR(pdata);
 	pdev->dev.platform_data = pdata;
 
-	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
 	drvdata->dev = &pdev->dev;
 	platform_set_drvdata(pdev, drvdata);
 
@@ -126,7 +171,10 @@ static void dummy_remove(struct platform_device *pdev)
 {
 	struct dummy_drvdata *drvdata = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
 
+	if (of_device_is_compatible(node, "arm,coresight-dummy-source"))
+		coresight_trace_id_put_system_id(drvdata->traceid);
 	pm_runtime_disable(dev);
 	coresight_unregister(drvdata->csdev);
 }
-- 
2.41.0


