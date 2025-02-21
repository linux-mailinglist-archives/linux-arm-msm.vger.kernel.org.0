Return-Path: <linux-arm-msm+bounces-48818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A360A3ED85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 08:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00A1D701DD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 07:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E8F2036E1;
	Fri, 21 Feb 2025 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XVcdcZLZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B21202F8D;
	Fri, 21 Feb 2025 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740123688; cv=none; b=K3vy296Nv+QfMO3Y+EAyuex6BzsRf96fP+VxjCvwZe+KCkDqfEfMjJt3ei8XnzABHMoaf2c69Z98VqXIeroOeqoNN40LqymGt4ZdjH3Rr23qXwJnay8RgsputCYlUT6RbuYOteghkMB7VAb5jRqcBJVFbCkgJW+ncYFUS0rkUqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740123688; c=relaxed/simple;
	bh=XbTCKvIMDyl2DMpRiyDboA4ABVpbG+2OBuCevF1YKhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Abro9TAmJDb5aQ4WKVJoUk0uYH+YjbuPmE23eljc1V3fFy4glHtMonoa4l2daS9h5FRxm5eW7KrlmHWFlmqw187N45EbUAwsn06nGAfMGZ+1vhANkaR/7SQKQk6pLcfeBw06CgtVYVCjp9RbfzpRrygyivVAVs/aD04iisxcs18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XVcdcZLZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6P0Vh020486;
	Fri, 21 Feb 2025 07:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ARB5psRXmL5x7dm7O2B78qjvJCsCcFRky0xfe+WKbYI=; b=XVcdcZLZjmO/eHXn
	rygMPFqcYazBbvtMPas59fSobdtqBGggV98jH7N/23t+Uavc0gKBCEGX7NiwOlby
	DBcgIXzT1tQdIVDV1ZTp/GiHcGdP0fZq3x8AA8pOFBJ/RlwMpMwC7eDn85F74xEQ
	oE3z0H5p/sNrpUfr6J6W5vjZyvWU05Mve4lSKvwU54q7n4LKY6RclIUWl1b7qzFo
	6hAOxEf5JFFyOg6WzkHUiKQNpC2VpH+tXLeRpd1nLeI+7voNJRzyc4UEcqdG4y8x
	m2u6IidlNt8JkHX2qxyCcouEPrGTIYHwGNpzqsvSpTXOeHiwDNKR6o5RrXI2P3Oq
	SlBvOQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x06t3mnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:41:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L7fH1B023914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:41:17 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 23:41:11 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Fri, 21 Feb 2025 15:40:31 +0800
Subject: [PATCH 4/5] coresight-tnoc: add node to configure flag type
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250221-trace-noc-driver-v1-4-0a23fc643217@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740123657; l=2045;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=XbTCKvIMDyl2DMpRiyDboA4ABVpbG+2OBuCevF1YKhI=;
 b=h3lN4iyQ0R343+Tv1yEdSNH4l3a9RPQjnnZKzRHrQmEvHRCk5ITMKEmvSl8fVDScZXHJYZwAd
 c56GsTc/3e1A/pdWKj91JFAozUJAvOJFskVabypMRqgX+/hwU4blmWt
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: q4I_8HE6VWh_Gifj3GpvwNgPP_kw408E
X-Proofpoint-GUID: q4I_8HE6VWh_Gifj3GpvwNgPP_kw408E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxlogscore=953 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210056

flag_type：used to set the type of issued ATB FLAG packets.
0: 'FLAG' packets; 1: 'FLAG_TS' packets.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 42 +++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 25962af3850af106f7a8b7e1738ad93d44b81ee7..3ff3504603f66bd595484374f1cdac90c528b665 100644
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


