Return-Path: <linux-arm-msm+bounces-27194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2F493EE39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 09:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BD921F23587
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 07:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6DC126F1A;
	Mon, 29 Jul 2024 07:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AXFa0MWA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C5355886;
	Mon, 29 Jul 2024 07:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722237295; cv=none; b=ZqmoYG1q4ZfR/sVHRnO9wxxaNU159fQGOc120sagSROOMcuaEU36dAbiJDWOfBrlXYgzmfoFIfEj1JCLtQXZPEj/zCxzA/NMCyT6qXavLknWd7ssN920uukHp2NvlnGCTl8t5Z5sA0jU6+kBVVscuUhgmgk9PUTd+G2sH+HDrlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722237295; c=relaxed/simple;
	bh=6CZ7OQPMmWcyhCMTEix2Ga+Ejn0YwDBr8uOfVcUxFxE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qtGNFgQ0KkYXRnVxFODcxIjgHu7yknermuH0iM0g/FQE4xHn3j5hiXGDD70cbXkLvA2ToqHtv7f23whA/7wqDMrcx1DHh/OTrlPgryH+aJPzekl9MWhBhbRMR/rHmjylEnTwlXufGMW2fnS7e73cvqxHkcWeOYkzAQOGvFEbRVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AXFa0MWA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SIUWDr022998;
	Mon, 29 Jul 2024 07:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sqb50u1fEA4/UEwHKAP7AB9PnNbz5TNQcIm7EvC12TI=; b=AXFa0MWA0RHtutnP
	cvVdlC15BEMvQKo2P2ohlVpSR7S4AaJ2eMaqtE5zVlArH3Tbb8k3qkuc+WxEu1iU
	zt07H5jcJ7Y3PWsR4VysxpLuW2xyKfhE85sG0W7Cy9YVgni1H2ZntCW+1caRo2Dw
	gjK417ZCEbIEjbFHy6Hkyr/jAVzO4nZ2Ju0v/m6h9f47ICkaOkQc1tW11M66d3aQ
	WJzO/jtXTrNYIwwyTL4UMXaAZHVluACsmqc8eOQO4KVTXKGmfFiXTDRSluPfxfU2
	g9CqSBGaks70Yq0fVpTERQJvzYdXuaVBvGGaRkAVglwEvz3y4m7Z/vprmmBjYrTu
	3Gio4w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msne380k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 07:14:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46T7EQq8024954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 07:14:26 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Jul 2024 00:14:25 -0700
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
Subject: [PATCH v4 2/3] coresight: Add support to get static id for system trace sources
Date: Mon, 29 Jul 2024 00:14:10 -0700
Message-ID: <20240729071414.5410-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240729071414.5410-1-quic_jinlmao@quicinc.com>
References: <20240729071414.5410-1-quic_jinlmao@quicinc.com>
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
X-Proofpoint-GUID: ES2oZAwKnPpUW5DDVsnia9XYdwNljM5v
X-Proofpoint-ORIG-GUID: ES2oZAwKnPpUW5DDVsnia9XYdwNljM5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_05,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290048

Dynamic trace id was introduced in coresight subsystem, so trace id is
allocated dynamically. However, some hardware ATB source has static trace
id and it cannot be changed via software programming. For such source,
it can call coresight_get_static_trace_id to get the fixed trace id from
device node and pass id to coresight_trace_id_get_static_system_id to
reserve the id.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../hwtracing/coresight/coresight-platform.c  | 26 +++++++++++++
 .../hwtracing/coresight/coresight-trace-id.c  | 38 ++++++++++++++-----
 .../hwtracing/coresight/coresight-trace-id.h  |  9 +++++
 include/linux/coresight.h                     |  1 +
 4 files changed, 64 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 64e171eaad82..703abf0fa3f9 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -183,6 +183,18 @@ static int of_coresight_get_cpu(struct device *dev)
 	return cpu;
 }
 
+/*
+ * of_coresight_get_trace_id: Get the atid of a source device.
+ *
+ * Returns 0 on success.
+ */
+static int of_coresight_get_static_trace_id(struct device *dev, u32 *id)
+{
+
+	return of_property_read_u32(dev->of_node, "arm,static-trace-id", id);
+}
+
+
 /*
  * of_coresight_parse_endpoint : Parse the given output endpoint @ep
  * and fill the connection information in @pdata->out_conns
@@ -317,6 +329,11 @@ static inline int of_coresight_get_cpu(struct device *dev)
 {
 	return -ENODEV;
 }
+
+static inline int of_coresight_get_static_trace_id(struct device *dev, u32 *id)
+{
+	return -ENODEV;
+}
 #endif
 
 #ifdef CONFIG_ACPI
@@ -796,6 +813,15 @@ int coresight_get_cpu(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(coresight_get_cpu);
 
+int coresight_get_static_trace_id(struct device *dev, u32 *id)
+{
+	if (!is_of_node(dev->fwnode))
+		return -EINVAL;
+
+	return of_coresight_get_static_trace_id(dev, id);
+}
+EXPORT_SYMBOL_GPL(coresight_get_static_trace_id);
+
 struct coresight_platform_data *
 coresight_get_platform_data(struct device *dev)
 {
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index af5b4ef59cea..ca3c3de4683e 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.c
+++ b/drivers/hwtracing/coresight/coresight-trace-id.c
@@ -11,6 +11,12 @@
 
 #include "coresight-trace-id.h"
 
+enum trace_id_flags {
+	TRACE_ID_ANY = 0x0,
+	TRACE_ID_PREFER_ODD = 0x1,
+	TRACE_ID_REQ_STATIC = 0x2,
+};
+
 /* Default trace ID map. Used on systems that don't require per sink mappings */
 static struct coresight_trace_id_map id_map_default;
 
@@ -80,16 +86,19 @@ static int coresight_trace_id_find_odd_id(struct coresight_trace_id_map *id_map)
  * Otherwise allocate next available ID.
  */
 static int coresight_trace_id_alloc_new_id(struct coresight_trace_id_map *id_map,
-					   int preferred_id, bool prefer_odd_id)
+					   int preferred_id, unsigned int flags)
 {
 	int id = 0;
 
 	/* for backwards compatibility, cpu IDs may use preferred value */
-	if (IS_VALID_CS_TRACE_ID(preferred_id) &&
-	    !test_bit(preferred_id, id_map->used_ids)) {
-		id = preferred_id;
-		goto trace_id_allocated;
-	} else if (prefer_odd_id) {
+	if (IS_VALID_CS_TRACE_ID(preferred_id)) {
+		if (!test_bit(preferred_id, id_map->used_ids)) {
+			id = preferred_id;
+			goto trace_id_allocated;
+		} else if (WARN((flags & TRACE_ID_REQ_STATIC), "Trace ID %d is used.\n",
+					preferred_id))
+			return -EINVAL;
+	} else if (flags & TRACE_ID_PREFER_ODD) {
 	/* may use odd ids to avoid preferred legacy cpu IDs */
 		id = coresight_trace_id_find_odd_id(id_map);
 		if (id)
@@ -175,7 +184,7 @@ static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_
 	 */
 	id = coresight_trace_id_alloc_new_id(id_map,
 					     CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
-					     false);
+					     TRACE_ID_ANY);
 	if (!IS_VALID_CS_TRACE_ID(id))
 		goto get_cpu_id_out_unlock;
 
@@ -222,14 +231,15 @@ static void coresight_trace_id_map_put_cpu_id(int cpu, struct coresight_trace_id
 	DUMP_ID_MAP(id_map);
 }
 
-static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map)
+static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map,
+					int preferred_id, unsigned int traceid_flags)
 {
 	unsigned long flags;
 	int id;
 
 	spin_lock_irqsave(&id_map_lock, flags);
 	/* prefer odd IDs for system components to avoid legacy CPU IDS */
-	id = coresight_trace_id_alloc_new_id(id_map, 0, true);
+	id = coresight_trace_id_alloc_new_id(id_map, preferred_id, traceid_flags);
 	spin_unlock_irqrestore(&id_map_lock, flags);
 
 	DUMP_ID(id);
@@ -271,10 +281,18 @@ EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id);
 
 int coresight_trace_id_get_system_id(void)
 {
-	return coresight_trace_id_map_get_system_id(&id_map_default);
+	return coresight_trace_id_map_get_system_id(&id_map_default, 0,
+			TRACE_ID_PREFER_ODD);
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_get_system_id);
 
+int coresight_trace_id_get_static_system_id(int trace_id)
+{
+	return coresight_trace_id_map_get_system_id(&id_map_default,
+			trace_id, TRACE_ID_REQ_STATIC);
+}
+EXPORT_SYMBOL_GPL(coresight_trace_id_get_static_system_id);
+
 void coresight_trace_id_put_system_id(int id)
 {
 	coresight_trace_id_map_put_system_id(&id_map_default, id);
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
index 3797777d367e..ca2fdf31c835 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.h
+++ b/drivers/hwtracing/coresight/coresight-trace-id.h
@@ -122,6 +122,15 @@ int coresight_trace_id_read_cpu_id(int cpu);
  */
 int coresight_trace_id_get_system_id(void);
 
+/**
+ * Allocate a CoreSight static trace ID for a system component.
+ *
+ * Used to allocate static IDs for system trace sources such as dummy source.
+ *
+ * return: Trace ID or -EINVAL if allocation is impossible.
+ */
+int coresight_trace_id_get_static_system_id(int id);
+
 /**
  * Release an allocated system trace ID.
  *
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index f09ace92176e..2cdc0b1cd536 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -643,6 +643,7 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
 void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
 
 extern int coresight_get_cpu(struct device *dev);
+extern int coresight_get_static_trace_id(struct device *dev, u32 *id);
 
 struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
 struct coresight_connection *
-- 
2.41.0


