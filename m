Return-Path: <linux-arm-msm+bounces-48819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 221BAA3ED8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 08:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27065162F4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 07:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCAC204094;
	Fri, 21 Feb 2025 07:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O2jqxr4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AF420370D;
	Fri, 21 Feb 2025 07:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740123691; cv=none; b=DvSsYolRYATLxWhk9vvIF7/RXW9z6b9G+g+3wrUvmMCQthjAHEM7W+gp2/KYXet+Jp8/p82v6nxAmLT+8dy02KaDvBlRrJiql1s2+ofLyE3EtWZcpkSmfuaGHTzilvVVXP5u2ttkhFiMJD6ewv/GSaKwSL9w07i/3C62Xfo8HDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740123691; c=relaxed/simple;
	bh=D9nO0Rw8IFdx8/JC61W3qCybMF46rPTusGdMNvOiv98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VuWcZ590ua3YR1dfH5rF+53mZ1u0bWEs1WJcjbBXSWsRAj37qdfR0F+4sWXR9TPROc1jDbkD717hhlRR0WbsJlc11+Wp0Os93x7juW2fz01Bl6OmgbpipFYk/qLBJzPaKnyz2KVtkDbv1HERAcg/Go4E+Cd+nyKDTrbeGKXf88w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O2jqxr4Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KMWKVs026296;
	Fri, 21 Feb 2025 07:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJyVAzse7xLFb8xCPnWRvVTtifhlIa8lHqL9vpKMvTY=; b=O2jqxr4ZEEJOeRiS
	ViSaQNSqa0GB74b4u6s/jHCpXNDUxUvBBVJtFt8pZ2mODRDujKrL5WpJBz0s3jRz
	METwXjlnllYnWSrtqG8ZZcdzhRZNY99VhY0SwVwYreq9lbOeWsST/TdKRr75Ahdt
	NX/NCFY74fUVz6zH5qjJWnWLfXAO86KkvVvOrHj7M6c+aEPr1A5khl6yo0fE7xCM
	Gsky+jt5ybY2G/TafNEOF2rRLajMwKV1Fy7tH1y1S+21aC0sIOP11me8ulIq7owX
	fhNe5tC8M/QGX9EwswI14FISyA3AgX+TcGGk3atwiiXQ0KtNbIJIFEM17Ys3YGXq
	VmGhYA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2r3u4q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:41:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L7fLi6010585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:41:21 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 23:41:15 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Fri, 21 Feb 2025 15:40:32 +0800
Subject: [PATCH 5/5] coresight-tnoc: add nodes to configure freq packet
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250221-trace-noc-driver-v1-5-0a23fc643217@quicinc.com>
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
In-Reply-To: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740123657; l=3505;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=D9nO0Rw8IFdx8/JC61W3qCybMF46rPTusGdMNvOiv98=;
 b=Pg9D/It6JCg3UbWpboZ7/yl03luOty/kj91bts+ObZgzhD0bK+AkH3++9Ddqc8nOGpOTErFwC
 Yp6bgMtxsTyA37r6nllO0l4TbHjYOxxMFxOMj4QXdOQomIUv6xLqla5
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oPYiKrnMqhSUHPyHOZ4HPQlBRtihjGZN
X-Proofpoint-GUID: oPYiKrnMqhSUHPyHOZ4HPQlBRtihjGZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502210056

Three nodes for freq packet config are added here:

1. freq_type: used to set the type of issued ATB FREQ packets.
0: 'FREQ' packets; 1: 'FREQ_TS' packets.

2. freq_req_val: used to set frequency values carried by 'FREQ'
and 'FREQ_TS' packets.

3. freq_ts_req: writing '1' to issue a 'FREQ' or 'FREQ_TS' packet.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 97 ++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 3ff3504603f66bd595484374f1cdac90c528b665..629df98959d1bfb55771376fac2818a48cb9c259 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -112,10 +112,107 @@ static ssize_t flag_type_show(struct device *dev,
 }
 static DEVICE_ATTR_RW(flag_type);
 
+static ssize_t freq_type_show(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", drvdata->freq_type);
+}
+
+static ssize_t freq_type_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf,
+			       size_t size)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	if (val != 1 && val != 0)
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	if (val)
+		drvdata->freq_type = FREQ_TS;
+	else
+		drvdata->freq_type = FREQ;
+	spin_unlock(&drvdata->spinlock);
+
+	return size;
+}
+static DEVICE_ATTR_RW(freq_type);
+
+static ssize_t freq_req_val_show(struct device *dev,
+				 struct device_attribute *attr,
+				char *buf)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", drvdata->freq_req_val);
+}
+
+static ssize_t freq_req_val_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf,
+				  size_t size)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	if (val) {
+		spin_lock(&drvdata->spinlock);
+		drvdata->freq_req_val = val;
+		spin_unlock(&drvdata->spinlock);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RW(freq_req_val);
+
+static ssize_t freq_ts_req_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf,
+				 size_t size)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct coresight_device	*csdev = drvdata->csdev;
+	unsigned long val;
+	u32 reg;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	if (csdev->refcnt == 0) {
+		spin_unlock(&drvdata->spinlock);
+		return -EPERM;
+	}
+
+	if (val) {
+		reg = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
+		reg = reg | TRACE_NOC_CTRL_FREQTSREQ;
+		writel_relaxed(reg, drvdata->base + TRACE_NOC_CTRL);
+	}
+	spin_unlock(&drvdata->spinlock);
+
+	return size;
+}
+static DEVICE_ATTR_WO(freq_ts_req);
+
 static struct attribute *trace_noc_attrs[] = {
 	&dev_attr_flush_req.attr,
 	&dev_attr_flush_status.attr,
 	&dev_attr_flag_type.attr,
+	&dev_attr_freq_type.attr,
+	&dev_attr_freq_req_val.attr,
+	&dev_attr_freq_ts_req.attr,
 	NULL,
 };
 

-- 
2.34.1


