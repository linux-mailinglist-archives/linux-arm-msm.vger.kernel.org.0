Return-Path: <linux-arm-msm+bounces-49478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C141A45CA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E86187A1D8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 11:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AA5215171;
	Wed, 26 Feb 2025 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p2TKSMSe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C64E215066;
	Wed, 26 Feb 2025 11:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568007; cv=none; b=eRFdTw/c9khNXkvGN4U7JjNdKhWux0yKBYZ3llg2Q2k7DMsST4DeWxsbMXXRkQ5BlytIUOza5VqTDa2ZI9U6o2pF/BvS3z0E4mMiw3mAxWW3xqS4XsTHM9hozz6xH5BlS+Vgj/ttOolKc4hn3MHH+l60LygaZwMpZsOPT6bYnhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568007; c=relaxed/simple;
	bh=woWx7BCA3qM8Qe0dZBdeROv3XUQ44gsKewoaDs/FE28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IOiupA+OMN+zDzmEJunBk24c6XKRArP+Zjk4Ps/6P6HNN9+JxXxn+o3ljON4Jvlt8zTMh+YGRd4iHuBifN9wCqmapjwNBgIGlHhswhCGmv8iAlfrrUf1J7MwQMpMPICznVaA9r3Yus+WuNqYKu7cw2BrbsXpS5odihEijuE+ENQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p2TKSMSe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9RBhZ011791;
	Wed, 26 Feb 2025 11:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DxjsSkS45nJozA5YXF2A7BnW09G45yQREDI/PetKHZY=; b=p2TKSMSeNm1hctfO
	GNulH28SNTJpbRTbCEwsG0s8ZhfiXrVcswE14dJ/zbeR6LotSVyikR//DtnjoE+7
	xHMNAz3WuMndAZduzIOY7p+aZy9a6lFYV7Ou+XegOjORhuOHWoohQ3tEwhSvbWr5
	PGdPJ8O64YCOn8ibULaMiTduwrJ4I1ea8QOB106QUjiaCRBK/FsitbhLzYSNk1+q
	UF/bZK6874+rtkxMrNXmLeigQvYdwwKsO2olIcgTDd4IEk5siInDyRrL4+d+PjeK
	KY08nzPx+0HsmfUNIQnTfWerL3RlB0/bZVJI8bL2Vy6rYRtVFwOnWX8/KV23gAL0
	MXfdKQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk9qjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:06:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QB6YZe015448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 11:06:34 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 03:06:27 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Wed, 26 Feb 2025 19:05:53 +0800
Subject: [PATCH v2 4/5] coresight-tnoc: add node to configure flag type
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250226-trace-noc-driver-v2-4-8afc6584afc5@quicinc.com>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
In-Reply-To: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740567972; l=2045;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=woWx7BCA3qM8Qe0dZBdeROv3XUQ44gsKewoaDs/FE28=;
 b=iZgVmN3emcQ/GX8GWBc33AHMUQd5SGlKVQPfOR8UCKD0sNhLToiufV1VH7vsL5F/HCnQ8XndP
 0NCxfQQcFDmBwK8Ti0y0UYQoKr8eS4CI+gTBRLNQiu+orvCO+jCLBs9
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: evzXqg4Nun5xQgMVqd4otFcn-IidgYrN
X-Proofpoint-ORIG-GUID: evzXqg4Nun5xQgMVqd4otFcn-IidgYrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=952 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260088

flag_type：used to set the type of issued ATB FLAG packets.
0: 'FLAG' packets; 1: 'FLAG_TS' packets.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 42 +++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 20231f28ddcb6a60d9b3c1ca3e0ca4d731dac39c..ad973749250644760adc4dfd855240026d0a744c 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -26,7 +26,7 @@ static ssize_t flush_req_store(struct device *dev,
 	unsigned long val;
 	u32 reg;
 
-	if (kstrtoul(buf, 10, &val))
+	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
 	if (val != 1)
@@ -73,9 +73,49 @@ static ssize_t flush_status_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(flush_status);
 
+/*
+ * Sets the type of issued ATB FLAG packets:
+ * 0: 'FLAG' packets;
+ * 1: 'FLAG_TS' packets.
+ */
+static ssize_t flag_type_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf,
+			       size_t size)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 10, &val))
+		return -EINVAL;
+
+	if (val != 1 && val != 0)
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	if (val)
+		drvdata->flag_type = FLAG_TS;
+	else
+		drvdata->flag_type = FLAG;
+	spin_unlock(&drvdata->spinlock);
+
+	return size;
+}
+
+static ssize_t flag_type_show(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", drvdata->flag_type);
+}
+static DEVICE_ATTR_RW(flag_type);
+
 static struct attribute *trace_noc_attrs[] = {
 	&dev_attr_flush_req.attr,
 	&dev_attr_flush_status.attr,
+	&dev_attr_flag_type.attr,
 	NULL,
 };
 

-- 
2.34.1


