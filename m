Return-Path: <linux-arm-msm+bounces-21461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 357208D7F4C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 11:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5907D1C216E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2BE86130;
	Mon,  3 Jun 2024 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n259sazz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0A184DE3;
	Mon,  3 Jun 2024 09:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717407865; cv=none; b=nWmbisxgpN97N28olDwNwYAKjH8FgZ0+Ja/R2Kiw6cJcKkPooPdrKeGBfNXSIBz0u/TPYpGQOwUmxdEcvxSwNi3+LxaJ9/XmZokgRHtGEicftyGhHUj17rZmOvIIuNOTKUtQHSvi6ZQXOBmndHK8+x//MkMI6i3DhfC3i+kjgAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717407865; c=relaxed/simple;
	bh=dCqEbmTaudpLgLl8ucbqbhIyQpM65xDEjo70k6fWigo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RgTg6y92vjFQ4s57nrftO8/qocrLO0jxyVxe3synoK9KOwjtaj8fNwQn7bxIsEL/PcCk7+r1gNgn8y1LoGQMMDwSIreRnK25mFH+2FT6IaVt24wtGaX5YR49RIQRQuZ4lL6tA/jY+sTlBk0AVws1FgV6yWE8EGzV0ZkRBiorG8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n259sazz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4538uooP003580;
	Mon, 3 Jun 2024 09:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6MTJCl+5n5cfnNoWLvjxem5/xGteEqpggfWGm1SzZpk=; b=n259sazzKoVQPRWS
	gXUQuhugt35E1uIKTnGzEH0VD1J2+RrOQy69M8XZqaSVTKF8UVWKawvemliWQAcj
	/QMAlv7eKur6HE4QIONuQpxVnElqdK61P1EOGmcssust3SnNIyb6xEtLVdVhErBa
	QMl8vBEziod467HiafIjN1hdCrJDhFwQqE42PmY1UplZ6McUkJaHlE2n8+8xONpC
	O3NsGv7mh9O9SzEA2rykeBC+4/BlR3eDyPUdJL+E34IZYF9Mj+soljZO0GVnJZG3
	YTurlFFp0kJa/xjCWRSDs3kwHpezeen7OSHGKofJJRiaqd99v4m7jIfbyoup/Cwa
	Rhkwzg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw6v3q4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 09:44:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4539i6T4018047
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 09:44:06 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 02:44:06 -0700
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
Subject: [PATCH v2 2/3] coresight: Add support to get preferred id for system trace sources
Date: Mon, 3 Jun 2024 02:43:51 -0700
Message-ID: <20240603094354.2348-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240603094354.2348-1-quic_jinlmao@quicinc.com>
References: <20240603094354.2348-1-quic_jinlmao@quicinc.com>
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
X-Proofpoint-GUID: _IwLDsUVuLUToKiQIw8xlqf5GofBrnU8
X-Proofpoint-ORIG-GUID: _IwLDsUVuLUToKiQIw8xlqf5GofBrnU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406030081

Dynamic trace id was introduced in coresight subsystem, so trace id is
allocated dynamically. However, some hardware ATB source has static trace
id and it cannot be changed via software programming. For such source,
it can call coresight_get_source_traceid to get the fixed trace id from
device node and pass id to coresight_trace_id_get_system_id to reserve
the id.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../hwtracing/coresight/coresight-platform.c  | 26 +++++++++++++++
 drivers/hwtracing/coresight/coresight-stm.c   |  2 +-
 .../hwtracing/coresight/coresight-trace-id.c  | 32 ++++++++++++-------
 .../hwtracing/coresight/coresight-trace-id.h  |  5 ++-
 include/linux/coresight.h                     |  1 +
 5 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 9d550f5697fa..8dd3cbd676b8 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -183,6 +183,17 @@ static int of_coresight_get_cpu(struct device *dev)
 	return cpu;
 }
 
+/*
+ * of_coresight_get_trace_id: Get the atid of a source device.
+ *
+ * Returns 0 on success.
+ */
+static int of_coresight_get_trace_id(struct device *dev, u32 *id)
+{
+
+	return of_property_read_u32(dev->of_node, "trace-id", id);
+}
+
 /*
  * of_coresight_parse_endpoint : Parse the given output endpoint @ep
  * and fill the connection information in @pdata->out_conns
@@ -782,6 +793,12 @@ static inline int acpi_coresight_get_cpu(struct device *dev)
 {
 	return -ENODEV;
 }
+
+static int of_coresight_get_trace_id(struct device *dev, u32 *id)
+{
+	return -ENODEV;
+}
+
 #endif
 
 int coresight_get_cpu(struct device *dev)
@@ -794,6 +811,15 @@ int coresight_get_cpu(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(coresight_get_cpu);
 
+int coresight_get_source_traceid(struct device *dev, u32 *id)
+{
+	if (!is_of_node(dev->fwnode))
+		return -EINVAL;
+
+	return of_coresight_get_trace_id(dev, id);
+}
+EXPORT_SYMBOL_GPL(coresight_get_source_traceid);
+
 struct coresight_platform_data *
 coresight_get_platform_data(struct device *dev)
 {
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index e1c62820dfda..802f9e4ae570 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -901,7 +901,7 @@ static int __stm_probe(struct device *dev, struct resource *res)
 		goto stm_unregister;
 	}
 
-	trace_id = coresight_trace_id_get_system_id();
+	trace_id = coresight_trace_id_get_system_id(0);
 	if (trace_id < 0) {
 		ret = trace_id;
 		goto cs_unregister;
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index af5b4ef59cea..5c25c75a2f08 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.c
+++ b/drivers/hwtracing/coresight/coresight-trace-id.c
@@ -75,20 +75,23 @@ static int coresight_trace_id_find_odd_id(struct coresight_trace_id_map *id_map)
  * Allocate new ID and set in use
  *
  * if @preferred_id is a valid id then try to use that value if available.
+ * if @only_preferred is true, if @preferred_id is used, return error EINVAL.
  * if @preferred_id is not valid and @prefer_odd_id is true, try for odd id.
  *
  * Otherwise allocate next available ID.
  */
 static int coresight_trace_id_alloc_new_id(struct coresight_trace_id_map *id_map,
-					   int preferred_id, bool prefer_odd_id)
+			   int preferred_id, bool prefer_odd_id, bool only_preferred)
 {
 	int id = 0;
 
 	/* for backwards compatibility, cpu IDs may use preferred value */
-	if (IS_VALID_CS_TRACE_ID(preferred_id) &&
-	    !test_bit(preferred_id, id_map->used_ids)) {
-		id = preferred_id;
-		goto trace_id_allocated;
+	if (IS_VALID_CS_TRACE_ID(preferred_id)) {
+		if (!test_bit(preferred_id, id_map->used_ids)) {
+			id = preferred_id;
+			goto trace_id_allocated;
+		} else if (WARN(only_preferred, "Trace ID %d is used.\n", preferred_id))
+			return -EINVAL;
 	} else if (prefer_odd_id) {
 	/* may use odd ids to avoid preferred legacy cpu IDs */
 		id = coresight_trace_id_find_odd_id(id_map);
@@ -175,7 +178,7 @@ static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_
 	 */
 	id = coresight_trace_id_alloc_new_id(id_map,
 					     CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
-					     false);
+					     false, false);
 	if (!IS_VALID_CS_TRACE_ID(id))
 		goto get_cpu_id_out_unlock;
 
@@ -222,14 +225,21 @@ static void coresight_trace_id_map_put_cpu_id(int cpu, struct coresight_trace_id
 	DUMP_ID_MAP(id_map);
 }
 
-static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map)
+static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map,
+				int preferred_id, bool only_preferred)
 {
 	unsigned long flags;
 	int id;
 
 	spin_lock_irqsave(&id_map_lock, flags);
-	/* prefer odd IDs for system components to avoid legacy CPU IDS */
-	id = coresight_trace_id_alloc_new_id(id_map, 0, true);
+
+	if (preferred_id > 0) {
+		/* use preferred id if it is available */
+		id = coresight_trace_id_alloc_new_id(id_map, preferred_id, false, true);
+	} else {
+		/* prefer odd IDs for system components to avoid legacy CPU IDS */
+		id = coresight_trace_id_alloc_new_id(id_map, 0, true, false);
+	}
 	spin_unlock_irqrestore(&id_map_lock, flags);
 
 	DUMP_ID(id);
@@ -269,9 +279,9 @@ int coresight_trace_id_read_cpu_id(int cpu)
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id);
 
-int coresight_trace_id_get_system_id(void)
+int coresight_trace_id_get_system_id(int id)
 {
-	return coresight_trace_id_map_get_system_id(&id_map_default);
+	return coresight_trace_id_map_get_system_id(&id_map_default, id, true);
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_get_system_id);
 
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
index 3797777d367e..9189a33c5857 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.h
+++ b/drivers/hwtracing/coresight/coresight-trace-id.h
@@ -118,9 +118,12 @@ int coresight_trace_id_read_cpu_id(int cpu);
  *
  * Used to allocate IDs for system trace sources such as STM.
  *
+ * @id: Preferred id value. If id is 0, get a free id from id map. If id is greater
+ *      than 0, get a preferred id.
+ *
  * return: Trace ID or -EINVAL if allocation is impossible.
  */
-int coresight_trace_id_get_system_id(void);
+int coresight_trace_id_get_system_id(int id);
 
 /**
  * Release an allocated system trace ID.
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index f09ace92176e..0599303be326 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -643,6 +643,7 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
 void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
 
 extern int coresight_get_cpu(struct device *dev);
+extern int coresight_get_source_traceid(struct device *dev, u32 *id);
 
 struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
 struct coresight_connection *
-- 
2.41.0


