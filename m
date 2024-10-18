Return-Path: <linux-arm-msm+bounces-34844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB0F9A3356
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 05:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4EE8285697
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 03:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBA61547C3;
	Fri, 18 Oct 2024 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WGR4P6SI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC3014900E;
	Fri, 18 Oct 2024 03:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729221779; cv=none; b=jwgk9rFjyRAw9Ii42wA9ZbBdGAYMUlNcNCr5DfuU6GoEBXK9bpjX3GiEoPR9Zt74VTj5Vz7fsL7y5ngQ9V0XV1E50D9g7LkcztZVA8VkVPcdueO2GSh9MVOecLPizxeAHKe9C1EyD2PDiSFr6gkPKAVyUvEFq8MdlW8QXRN/gGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729221779; c=relaxed/simple;
	bh=jFwD5uDP+zlDfEOJzXnEGXHpJZUpFIjrwRTg9j0+kkk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZzWI9IHl1wRVnAJiiXJnQCORJlB/FrS2PYC6HwZw2PrG3lKkXgObc16HPkHN2ofDrGIqhXR+GMYZKTOiyLPO44cvhN5HFk1c/iQesfn60JWEXlzrjMavDPAQE75BIVaUxb7YZNSTAI7iCUe1A/VmzUdLIT7AoNr/+k/4yMV9OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WGR4P6SI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HG12PW017439;
	Fri, 18 Oct 2024 03:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GlMxFlNZ5pRVmFa3FcWAnt/P
	4yqOhU/4OW+4wz1qaEg=; b=WGR4P6SIyFC63mgi7MJowPgDpN4tLUum4x0tjVI0
	wYcPZG+YfyU4F49XR3HutOcU4jTRnTdQ/pdQ7bc7Gd4sz9Wg/zA17BFNGiwguXFd
	FD3zgDmkCWVGdvWAMbQXHy+WWisJeRw6XOXiSC+HR9SPnrLoI/3SJfbS6he6QuiS
	m1gAGj7JhMSGaMvMJBBGYowijYIDRWXWpL5jQ40KPfIuz4Et7rVngECKoYvnRgsF
	p2kFk1uyXu6xQiwQbRs70m6RczVZ8D7VDyfhIhednBLjbcCGo0fC41LQ6XMAz4sI
	hj8F86Npz/mVACdQcD/R5S+rX9yjfB1uD1UmS++zamWevw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42athc3k87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 03:22:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I3Mj76016878
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 03:22:45 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 20:22:41 -0700
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
Subject: [PATCH v5 2/3] coresight: Add support to get static id for system trace sources
Date: Fri, 18 Oct 2024 11:22:16 +0800
Message-ID: <20241018032217.39728-3-quic_jinlmao@quicinc.com>
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
X-Proofpoint-GUID: Y8EVgOMIXB7IAwtzrz7dGrtzH6-upYej
X-Proofpoint-ORIG-GUID: Y8EVgOMIXB7IAwtzrz7dGrtzH6-upYej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180019

Dynamic trace id was introduced in coresight subsystem, so trace id is
allocated dynamically. However, some hardware ATB source has static trace
id and it cannot be changed via software programming. For such source,
it can call coresight_get_static_trace_id to get the fixed trace id from
device node and pass id to coresight_trace_id_get_static_system_id to
reserve the id.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../hwtracing/coresight/coresight-platform.c  |  9 +++++
 .../hwtracing/coresight/coresight-trace-id.c  | 38 ++++++++++++++-----
 .../hwtracing/coresight/coresight-trace-id.h  |  9 +++++
 include/linux/coresight.h                     |  1 +
 4 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 64e171eaad82..b03aa43d3cba 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -796,6 +796,15 @@ int coresight_get_cpu(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(coresight_get_cpu);
 
+int coresight_get_static_trace_id(struct device *dev, u32 *id)
+{
+	if (!is_of_node(dev->fwnode))
+		return -EINVAL;
+
+	return fwnode_property_read_u32(dev_fwnode(dev), "arm,static-trace-id", id);
+}
+EXPORT_SYMBOL_GPL(coresight_get_static_trace_id);
+
 struct coresight_platform_data *
 coresight_get_platform_data(struct device *dev)
 {
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index d98e12cb30ec..269a5f7b279f 100644
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
@@ -74,16 +80,19 @@ static int coresight_trace_id_find_odd_id(struct coresight_trace_id_map *id_map)
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
@@ -153,7 +162,7 @@ static int _coresight_trace_id_get_cpu_id(int cpu, struct coresight_trace_id_map
 	 */
 	id = coresight_trace_id_alloc_new_id(id_map,
 					     CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
-					     false);
+					     TRACE_ID_ANY);
 	if (!IS_VALID_CS_TRACE_ID(id))
 		goto get_cpu_id_out_unlock;
 
@@ -188,14 +197,15 @@ static void _coresight_trace_id_put_cpu_id(int cpu, struct coresight_trace_id_ma
 	DUMP_ID_MAP(id_map);
 }
 
-static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map)
+static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map,
+					int preferred_id, unsigned int traceid_flags)
 {
 	unsigned long flags;
 	int id;
 
 	spin_lock_irqsave(&id_map->lock, flags);
 	/* prefer odd IDs for system components to avoid legacy CPU IDS */
-	id = coresight_trace_id_alloc_new_id(id_map, 0, true);
+	id = coresight_trace_id_alloc_new_id(id_map, preferred_id, traceid_flags);
 	spin_unlock_irqrestore(&id_map->lock, flags);
 
 	DUMP_ID(id);
@@ -255,10 +265,18 @@ EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id_map);
 
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


