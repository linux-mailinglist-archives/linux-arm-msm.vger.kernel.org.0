Return-Path: <linux-arm-msm+bounces-38610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E0A9D4784
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 07:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A49A4283C77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FA7156F39;
	Thu, 21 Nov 2024 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NWm0wYn6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C8B3DBB6;
	Thu, 21 Nov 2024 06:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732170583; cv=none; b=YY3i+9+AgiXNvx4dU5VCxwzaJ7h/NSDwQEYYnEX2h0Lxs8h4/AV24HTMgm7JTYMI1ABYJcAVLM1R7QOOdNguecYmPViyHolq0+w1tTrBU467Xstub5sZ1jjs32X352jw7IjIrgUsvvH7Kh2swQvYpTr/spXwNsAc14mVyMTRreA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732170583; c=relaxed/simple;
	bh=SwPJe3iF9xmf6X48ja8JVh/1B7PQw9A5ie2GuqTOmaA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tqBsy/6OgtH7P+zB4DUuN+EjQdSlrRfzv7urh1l7IKY4Qvh4JWCmst3j1f83veOg202qqEBjJniGz/Ml+GcQNkbHsRB8ce9+OTx+vkQO9n2Mw6VckiC7plZfsRxJ5AvkZShnBU0FWwtV7X1C1s/bhGsCpUmVhyUK9gjLvgv+cgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NWm0wYn6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKwD7F007603;
	Thu, 21 Nov 2024 06:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yiteIrukDnU6un4jtLQ0C/js
	F8RJG79T7zmFyKbyjU8=; b=NWm0wYn6FeHTyZsTGF2RS0clSnm5ARWNVHVlFlqj
	cmNMfbVwz00zL4D+1q0cZ1I7E4DLNMKGQpJ638T9XY4Xcvry6W+8lAHfFAsUz4P0
	bEiiF62I1WoTMnHUZOb0Fq6RqSUyZNGsUCPUBQkPU+2i2es1WwinG32KB0k4dIVM
	G/Vjga2yhKPFitgPjWhAiwIpEDHDHrU1Wd4/2jA+kpOhpvC8gwuk/gpvuKuw4zDk
	w7KL7GOSVK/YJI1aVe6L+8oUQwbZE1fyTRrSsaOxlsxm+uV1xK52euTSmGHyXmde
	WEJpxUdfP1rHVBpnyi/8mzXnjmaiCF2pblJIxbXmRL7Xeg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4318uvkery-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:29:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL6TVe1028317
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:29:31 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 22:29:26 -0800
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
Subject: [PATCH v7 2/3] coresight: Add support to get static id for system trace sources
Date: Thu, 21 Nov 2024 14:28:28 +0800
Message-ID: <20241121062829.11571-3-quic_jinlmao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: gIu36xhNHhFMBGAearw22Dpz9a80Dftw
X-Proofpoint-GUID: gIu36xhNHhFMBGAearw22Dpz9a80Dftw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210047

Dynamic trace id was introduced in coresight subsystem, so trace id is
allocated dynamically. However, some hardware ATB source has static trace
id and it cannot be changed via software programming. For such source,
it can call coresight_get_static_trace_id to get the fixed trace id from
device node and pass id to coresight_trace_id_get_static_system_id to
reserve the id.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 .../hwtracing/coresight/coresight-platform.c  |  6 +++
 .../hwtracing/coresight/coresight-trace-id.c  | 43 +++++++++++++------
 .../hwtracing/coresight/coresight-trace-id.h  |  9 ++++
 include/linux/coresight.h                     |  1 +
 4 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 64e171eaad82..633d96b9577a 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -796,6 +796,12 @@ int coresight_get_cpu(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(coresight_get_cpu);
 
+int coresight_get_static_trace_id(struct device *dev, u32 *id)
+{
+	return fwnode_property_read_u32(dev_fwnode(dev), "arm,static-trace-id", id);
+}
+EXPORT_SYMBOL_GPL(coresight_get_static_trace_id);
+
 struct coresight_platform_data *
 coresight_get_platform_data(struct device *dev)
 {
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index d98e12cb30ec..378af743be45 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.c
+++ b/drivers/hwtracing/coresight/coresight-trace-id.c
@@ -12,6 +12,12 @@
 
 #include "coresight-trace-id.h"
 
+enum trace_id_flags {
+	TRACE_ID_ANY = 0x0,
+	TRACE_ID_PREFER_ODD = 0x1,
+	TRACE_ID_REQ_STATIC = 0x2,
+};
+
 /* Default trace ID map. Used in sysfs mode and for system sources */
 static DEFINE_PER_CPU(atomic_t, id_map_default_cpu_ids) = ATOMIC_INIT(0);
 static struct coresight_trace_id_map id_map_default = {
@@ -74,21 +80,25 @@ static int coresight_trace_id_find_odd_id(struct coresight_trace_id_map *id_map)
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
+		} else if (flags & TRACE_ID_REQ_STATIC)
+			return -EBUSY;
+	} else if (flags & TRACE_ID_PREFER_ODD) {
 	/* may use odd ids to avoid preferred legacy cpu IDs */
 		id = coresight_trace_id_find_odd_id(id_map);
 		if (id)
 			goto trace_id_allocated;
-	}
+	} else if (!IS_VALID_CS_TRACE_ID(preferred_id) &&
+			(flags & TRACE_ID_REQ_STATIC))
+		return -EINVAL;
 
 	/*
 	 * skip reserved bit 0, look at bitmap length of
@@ -153,7 +163,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
 	 */
 	id = coresight_trace_id_alloc_new_id(id_map,
 					     CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
-					     false);
+					     TRACE_ID_ANY);
 	if (!IS_VALID_CS_TRACE_ID(id))
 		goto get_cpu_id_out_unlock;
 
@@ -188,14 +198,14 @@ static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_ma
 	DUMP_ID_MAP(id_map);
 }
 
-static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map)
+static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map,
+					int preferred_id, unsigned int traceid_flags)
 {
 	unsigned long flags;
 	int id;
 
 	spin_lock_irqsave(&id_map->lock, flags);
-	/* prefer odd IDs for system components to avoid legacy CPU IDS */
-	id = coresight_trace_id_alloc_new_id(id_map, 0, true);
+	id = coresight_trace_id_alloc_new_id(id_map, preferred_id, traceid_flags);
 	spin_unlock_irqrestore(&id_map->lock, flags);
 
 	DUMP_ID(id);
@@ -255,10 +265,19 @@ EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id_map);
 
 int coresight_trace_id_get_system_id(void)
 {
-	return coresight_trace_id_map_get_system_id(&id_map_default);
+	/* prefer odd IDs for system components to avoid legacy CPU IDS */
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
index 9aae50a553ca..db68e1ec56b6 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.h
+++ b/drivers/hwtracing/coresight/coresight-trace-id.h
@@ -116,6 +116,15 @@ int coresight_trace_id_read_cpu_id_map(int cpu, struct coresight_trace_id_map *i
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
index c13342594278..129795873072 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -662,6 +662,7 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
 void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
 
 extern int coresight_get_cpu(struct device *dev);
+extern int coresight_get_static_trace_id(struct device *dev, u32 *id);
 
 struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
 struct coresight_connection *
-- 
2.17.1


