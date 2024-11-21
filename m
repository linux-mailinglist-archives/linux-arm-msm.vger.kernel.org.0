Return-Path: <linux-arm-msm+bounces-38612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 025D79D478D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 07:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 872FF1F20FD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 709F51CB312;
	Thu, 21 Nov 2024 06:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k2rqLQbv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E001CACE5;
	Thu, 21 Nov 2024 06:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732170589; cv=none; b=MDpEy3VT4LRzesGrV/BGGeiE8jtRDu6ntQQME6r2n7UGAKxIe3XpGKmrhGW2wRWEAyT0PAjZWuOm2E6lkr9Z87KG57BfKOwIAWsO05aOI1bukFndA0XsRzdJMPzgu4cu3ZI/ruWbHVndyy2NbpEu5f2J39AcLOi4P7axAJOPMLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732170589; c=relaxed/simple;
	bh=02OMCjDTekeFkO4QlSzuys9GrA6Kbv2qsQpucTpXbrU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SYJ8VmPs88C4MfQLsp58qFKWWD3Xv7upLtBOmRr2Tgct+fIq9l52qqGZ7RtWL6Um2gMThQQ/Cw5MxpHJD5Y/MHkKxwWQsb0zHnkwxWO8ojLHXog/Xq8qqw8da1OZHXq8ntNGJBakMWXRPg6uqL4m4hS6ngzbf8Wdc+UHz+51i34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k2rqLQbv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKMcR3026025;
	Thu, 21 Nov 2024 06:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e8ywS48pvo0nbEefVW3/4wBu
	/FfDIT+pXFZkV8Shp4U=; b=k2rqLQbvYyHRu18bZsLZ/UfK5bWRsqTh8d7OyBRT
	nCXYp4372EASHhB4p6/qSr4soAn5Q8JeO3C8LtOSCw4qT3FO/d+GYdZjm4hPNiMW
	WCUaOaXbGLk6Xenn6ihdlij3nkv3ofjioM583TArtnLPGjcIPo2jGbvhgACzc63+
	kwaBU7uRW69yAclmLsg4KKvZpF8GKfCXdnVBUVgWBSuox3+DlmvaL54Mjd9hUgsd
	qfQImYVPOCphTOn1WW4KmBLPks05p24EpFt6C6r0voWCToLyob1NsPDbrd5A06Ua
	raLVMzHqc3laMOIJA9bom6dRnB8fj84P+aFj1MfuEa0G7w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431byjk1h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:29:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL6TZdt028356
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:29:35 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 22:29:31 -0800
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
Subject: [PATCH v7 3/3] coresight: dummy: Add static trace id support for dummy source
Date: Thu, 21 Nov 2024 14:28:29 +0800
Message-ID: <20241121062829.11571-4-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241121062829.11571-1-quic_jinlmao@quicinc.com>
References: <20241121062829.11571-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pW4fz9uZ1Qr1Mqs2a4kfEHx9ItKP_fTw
X-Proofpoint-ORIG-GUID: pW4fz9uZ1Qr1Mqs2a4kfEHx9ItKP_fTw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210048

Some dummy source has static trace id configured in HW and it cannot
be changed via software programming. Configure the trace id in device
tree and reserve the id when device probe.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../sysfs-bus-coresight-devices-dummy-source  | 15 ++++
 drivers/hwtracing/coresight/coresight-dummy.c | 81 ++++++++++++++++---
 2 files changed, 87 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
new file mode 100644
index 000000000000..a1309ddaa4b9
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source
@@ -0,0 +1,15 @@
+What:		/sys/bus/coresight/devices/dummy_source<N>/enable_source
+Date:		Nov 2024
+KernelVersion:	6.13
+Contact:	Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:	(RW) Enable/disable tracing of dummy source. A sink should be activated
+		before enabling the source. The path of coresight components linking
+		the source to the sink is configured and managed automatically by the
+		coresight framework.
+
+What:		/sys/bus/coresight/devices/dummy_source<N>/traceid
+Date:		Nov 2024
+KernelVersion:	6.13
+Contact:	Mao Jinlong <quic_jinlmao@quicinc.com>
+Description:	(R) Show the trace ID that will appear in the trace stream
+		coming from this trace entity.
diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index bb85fa663ffc..ac65ac1dad87 100644
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
+	return sysfs_emit(buf, "%#lx\n", val);
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
+	int ret = 0, trace_id = 0;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
 
 	if (of_device_is_compatible(node, "arm,coresight-dummy-source")) {
 
@@ -90,6 +123,26 @@ static int dummy_probe(struct platform_device *pdev)
 		desc.subtype.source_subtype =
 					CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS;
 		desc.ops = &dummy_source_cs_ops;
+		desc.groups = coresight_dummy_groups;
+
+		ret = coresight_get_static_trace_id(dev, &trace_id);
+		if (!ret) {
+			/* Get the static id if id is set in device tree. */
+			ret = coresight_trace_id_get_static_system_id(trace_id);
+			if (ret < 0) {
+				dev_err(dev, "Fail to get static id.\n");
+				return ret;
+			}
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
@@ -104,27 +157,35 @@ static int dummy_probe(struct platform_device *pdev)
 	}
 
 	pdata = coresight_get_platform_data(dev);
-	if (IS_ERR(pdata))
-		return PTR_ERR(pdata);
+	if (IS_ERR(pdata)) {
+		ret = PTR_ERR(pdata);
+		goto free_id;
+	}
 	pdev->dev.platform_data = pdata;
 
-	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
 	drvdata->dev = &pdev->dev;
 	platform_set_drvdata(pdev, drvdata);
 
 	desc.pdata = pdev->dev.platform_data;
 	desc.dev = &pdev->dev;
 	drvdata->csdev = coresight_register(&desc);
-	if (IS_ERR(drvdata->csdev))
-		return PTR_ERR(drvdata->csdev);
+	if (IS_ERR(drvdata->csdev)) {
+		ret = PTR_ERR(drvdata->csdev);
+		goto free_id;
+	}
 
 	pm_runtime_enable(dev);
 	dev_dbg(dev, "Dummy device initialized\n");
 
-	return 0;
+	ret = 0;
+	goto out;
+
+free_id:
+	if (IS_VALID_CS_TRACE_ID(drvdata->traceid))
+		coresight_trace_id_put_system_id(drvdata->traceid);
+
+out:
+	return ret;
 }
 
 static void dummy_remove(struct platform_device *pdev)
@@ -132,6 +193,8 @@ static void dummy_remove(struct platform_device *pdev)
 	struct dummy_drvdata *drvdata = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	if (IS_VALID_CS_TRACE_ID(drvdata->traceid))
+		coresight_trace_id_put_system_id(drvdata->traceid);
 	pm_runtime_disable(dev);
 	coresight_unregister(drvdata->csdev);
 }
-- 
2.17.1


