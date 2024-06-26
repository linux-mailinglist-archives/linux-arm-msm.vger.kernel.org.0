Return-Path: <linux-arm-msm+bounces-24218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB51917881
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 08:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 412AB1C21C82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C49014D71F;
	Wed, 26 Jun 2024 06:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TM1Mozol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E80914A61E;
	Wed, 26 Jun 2024 06:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719382081; cv=none; b=j74Ex+8fEimPm56qWpr000iYbFVwNPhp6N9O0i16gf+cwM7zQro2468bcYViiNzpVOdpSCBsGNya7F9MpAtVjABuuBccqR5n/cwS/tZ4DJo7hVWG21OlMY+lkhM+LxsYTghHgby/vVOcSfSI+wRD4oycDPnJVDAK/NiAdlk1QZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719382081; c=relaxed/simple;
	bh=RyzWeMoVDV2ifn7VuhA2mgksvUa7aleRO9gtqYd5EhQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4VXJgV7n3qFgKA3hjzN2+ql4r2A/dqTUNV86UDgMvGDhke0Rh0/gj08RKLXZVV9sI28MBlzq6KE8nDE9/ypgvqQdzEpy2yKmIz8rAm0FY76WbpfMJz0m400zamG4YuaTDKxt/I838qytuhcn9yyTY6R8L8Ero0JqDPlsD1Tf5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TM1Mozol; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PIEROs020247;
	Wed, 26 Jun 2024 06:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9UAIqpLERD25+bLqBDK9J9hAK5VaX7D+ySXGaSBT1Fo=; b=TM1MozolfEDn3TGV
	Mj+JxDTEA3y/AdUZwGfZ6C3LLKUSVOEShmKnYUf2SGz3XtlngWdV0J/F+P+/q31P
	yHV7StLhZHoc62DM1RiR07FHSV4c0uScI6zHNFpJ8PY1YzOuA3vvTwdgcVpEbwSv
	jRc0UGeEx57Ik792t8PnLo8EPO4P0vTKGXsDaMa1OO8C/pGTOHOsm1fm7Ivpj7s7
	P2kGIWUFD7CdNcoRm/XCY60VZv/REcqozL45Sh7Pgsx4q9UvCUeXQy/a4nKjlCFx
	JBeV46mGmHfbfMo6ZLZEUXkLx58fFzWY4qppSxcAkVNykHTqXnIVQm2dj9oZO8pL
	sKhXoQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6yrhrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 06:07:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45Q67bGQ006880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 06:07:37 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Jun 2024 23:07:37 -0700
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
Subject: [PATCH v3 2/3] coresight: Add support to get preferred id for system trace sources
Date: Tue, 25 Jun 2024 23:07:21 -0700
Message-ID: <20240626060724.28862-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240626060724.28862-1-quic_jinlmao@quicinc.com>
References: <20240626060724.28862-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pFEpNPn-FcGPcr5vUQuA8T455m8S3wNT
X-Proofpoint-ORIG-GUID: pFEpNPn-FcGPcr5vUQuA8T455m8S3wNT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_03,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260046

Dynamic trace id was introduced in coresight subsystem, so trace id is
allocated dynamically. However, some hardware ATB source has static trace
id and it cannot be changed via software programming. For such source,
it can call coresight_get_source_traceid to get the fixed trace id from
device node and pass id to coresight_trace_id_get_system_id to reserve
the id.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../hwtracing/coresight/coresight-platform.c  | 25 +++++++++++++
 drivers/hwtracing/coresight/coresight-stm.c   |  2 +-
 drivers/hwtracing/coresight/coresight-tpda.c  |  2 +-
 .../hwtracing/coresight/coresight-trace-id.c  | 35 ++++++++++++-------
 .../hwtracing/coresight/coresight-trace-id.h  | 11 +++++-
 include/linux/coresight.h                     |  1 +
 6 files changed, 61 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 9d550f5697fa..df169f3f367e 100644
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
+	return of_property_read_u32(dev->of_node, "arm,trace-id", id);
+}
+
 /*
  * of_coresight_parse_endpoint : Parse the given output endpoint @ep
  * and fill the connection information in @pdata->out_conns
@@ -315,6 +326,11 @@ static inline int of_coresight_get_cpu(struct device *dev)
 {
 	return -ENODEV;
 }
+
+static inline int of_coresight_get_trace_id(struct device *dev, u32 *id)
+{
+	return -ENODEV;
+}
 #endif
 
 #ifdef CONFIG_ACPI
@@ -794,6 +810,15 @@ int coresight_get_cpu(struct device *dev)
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
index e1c62820dfda..34fab2ce9a76 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -901,7 +901,7 @@ static int __stm_probe(struct device *dev, struct resource *res)
 		goto stm_unregister;
 	}
 
-	trace_id = coresight_trace_id_get_system_id();
+	trace_id = coresight_trace_id_get_system_id(TRACE_ID_ANY);
 	if (trace_id < 0) {
 		ret = trace_id;
 		goto cs_unregister;
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 7739bc7adc44..46161cadb9e5 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -251,7 +251,7 @@ static int tpda_init_default_data(struct tpda_drvdata *drvdata)
 	 * same trace-id. When TPDA does packetization, different
 	 * port will have unique channel number for decoding.
 	 */
-	atid = coresight_trace_id_get_system_id();
+	atid = coresight_trace_id_get_system_id(TRACE_ID_ANY);
 	if (atid < 0)
 		return atid;
 
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index af5b4ef59cea..59194f60362c 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.c
+++ b/drivers/hwtracing/coresight/coresight-trace-id.c
@@ -75,21 +75,26 @@ static int coresight_trace_id_find_odd_id(struct coresight_trace_id_map *id_map)
  * Allocate new ID and set in use
  *
  * if @preferred_id is a valid id then try to use that value if available.
- * if @preferred_id is not valid and @prefer_odd_id is true, try for odd id.
+ * if TRACE_ID_WANT_PREFERRED is set, @preferred_id must be free, otherwise return
+ * error -EINVAL.
+ * if @preferred_id is not valid and TRACE_ID_WANT_ODD is true, try for odd id.
  *
  * Otherwise allocate next available ID.
  */
 static int coresight_trace_id_alloc_new_id(struct coresight_trace_id_map *id_map,
-					   int preferred_id, bool prefer_odd_id)
+			   int preferred_id, unsigned int flags)
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
+		} else if (WARN((flags & TRACE_ID_WANT_PREFERRED), "Trace ID %d is used.\n",
+					preferred_id))
+			return -EINVAL;
+	} else if (flags & TRACE_ID_WANT_ODD) {
 	/* may use odd ids to avoid preferred legacy cpu IDs */
 		id = coresight_trace_id_find_odd_id(id_map);
 		if (id)
@@ -175,7 +180,7 @@ static int coresight_trace_id_map_get_cpu_id(int cpu, struct coresight_trace_id_
 	 */
 	id = coresight_trace_id_alloc_new_id(id_map,
 					     CORESIGHT_LEGACY_CPU_TRACE_ID(cpu),
-					     false);
+					     TRACE_ID_ANY);
 	if (!IS_VALID_CS_TRACE_ID(id))
 		goto get_cpu_id_out_unlock;
 
@@ -222,14 +227,20 @@ static void coresight_trace_id_map_put_cpu_id(int cpu, struct coresight_trace_id
 	DUMP_ID_MAP(id_map);
 }
 
-static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map)
+static int coresight_trace_id_map_get_system_id(struct coresight_trace_id_map *id_map,
+				int preferred_id)
 {
 	unsigned long flags;
 	int id;
+	unsigned int traceid_flags = 0;
 
 	spin_lock_irqsave(&id_map_lock, flags);
+
 	/* prefer odd IDs for system components to avoid legacy CPU IDS */
-	id = coresight_trace_id_alloc_new_id(id_map, 0, true);
+	traceid_flags = TRACE_ID_WANT_ODD;
+	traceid_flags |= preferred_id > 0 ? TRACE_ID_WANT_PREFERRED : 0;
+
+	id = coresight_trace_id_alloc_new_id(id_map, preferred_id, traceid_flags);
 	spin_unlock_irqrestore(&id_map_lock, flags);
 
 	DUMP_ID(id);
@@ -269,9 +280,9 @@ int coresight_trace_id_read_cpu_id(int cpu)
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_read_cpu_id);
 
-int coresight_trace_id_get_system_id(void)
+int coresight_trace_id_get_system_id(int id)
 {
-	return coresight_trace_id_map_get_system_id(&id_map_default);
+	return coresight_trace_id_map_get_system_id(&id_map_default, id);
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_get_system_id);
 
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
index 3797777d367e..a236cf87c169 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.h
+++ b/drivers/hwtracing/coresight/coresight-trace-id.h
@@ -61,6 +61,12 @@ struct coresight_trace_id_map {
 	DECLARE_BITMAP(pend_rel_ids, CORESIGHT_TRACE_IDS_MAX);
 };
 
+enum trace_id_flags {
+	TRACE_ID_ANY = 0x0,
+	TRACE_ID_WANT_ODD = 0x1,
+	TRACE_ID_WANT_PREFERRED = 0x2,
+};
+
 /* Allocate and release IDs for a single default trace ID map */
 
 /**
@@ -118,9 +124,12 @@ int coresight_trace_id_read_cpu_id(int cpu);
  *
  * Used to allocate IDs for system trace sources such as STM.
  *
+ * @id: Preferred id value. If id is TRACE_ID_ANY, get a free id from id map.
+ * If id is greater than TRACE_ID_ANY, get a preferred id.
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


