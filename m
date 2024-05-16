Return-Path: <linux-arm-msm+bounces-19907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9F58C707B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 04:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0EEA1F21E21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 02:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1A6AD5F;
	Thu, 16 May 2024 02:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OBZ0k70u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6122B522F;
	Thu, 16 May 2024 02:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715828235; cv=none; b=gxTN80UQp8hh6xB+igIHhIrBWRCl3vQw1fgsP9bxZBePz1/X3tFAvNFsKpvSZqEuUB3W2b8ty8ON77O5+HSuxwZNPrWTzdIQlC83E+Dn5FcqOeia0B6Eqw/tIHW0Ea3EgEnE60ykP5lbHeP+0lRQ0lBqDOnMsDz0sF9hC6d2Pv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715828235; c=relaxed/simple;
	bh=IbG2LA1T4ooQ7IqkdlCvlADRsdfz5MBNOa25e1s7ch4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wk/xz4E1KOvLL2gJt08qIsNLw679c3zoyX4BrnY0/sgdMRiM4HNnWQXZTVrZvQUeKmbjDxGKlahR+kQVOhOZTzBGrTsDMliTU84qC/ceoaR5/YDihQOGXyXm3xD51mpdwmmDgOZezSscfzcRzxD44/RMhXQEIURW2Wn2Noi4DHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OBZ0k70u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FJM1iw029034;
	Thu, 16 May 2024 02:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=uUsJJlNiTJf4lhIbfUlTkawjo6kONZAUbpLHi32XELI=; b=OB
	Z0k70uTzcsBQ2RUFf0scm/DwfAONgPwQ5dDA8SzZu9SOSOUCd1i4XgupNFoCWfCL
	TxX696egTdvOaE5e1hwa3STwhj7RxAutFmJxJOWOkRSardPoYi90bGTk1Ce8PvQY
	s8X1tJ65f3Now9qeIQUhS83+dwDej4CH5K2GgkWXEtYjKyh+RxTKsfURkMiWaMcz
	Lgqalwi1jjIKVvkMkM8zNwRDTlYI4LrLTkoWt1r8s70MIkzKhlexH8D0ua28AciK
	7JBKET14jfy0rlKFA0ZL7micBpPwN9/T1oSpo0by9UiY+rMEgmJLpbVANx7qnnLL
	tpxuMKeXPu0zjQLNlwRg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21edjckf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 02:56:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44G2uvZR010549
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 02:56:57 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 19:56:56 -0700
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
Subject: [PATCH v1 2/3] coresight: Add reserve trace id support
Date: Wed, 15 May 2024 19:56:41 -0700
Message-ID: <20240516025644.4383-3-quic_jinlmao@quicinc.com>
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
X-Proofpoint-GUID: 9-CzIp9obgezX-R0az4wa16inSVU02cj
X-Proofpoint-ORIG-GUID: 9-CzIp9obgezX-R0az4wa16inSVU02cj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_01,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160019

Dynamic trace id was introduced in coresight subsystem so trace id is
allocated dynamically. However, some hardware ATB source has static trace
id and it cannot be changed via software programming. Reserve trace id
for this kind of hardware source.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../hwtracing/coresight/coresight-platform.c  | 26 +++++++++++++++++++
 .../hwtracing/coresight/coresight-trace-id.c  | 24 +++++++++++++++++
 .../hwtracing/coresight/coresight-trace-id.h  | 11 ++++++++
 include/linux/coresight.h                     |  1 +
 4 files changed, 62 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 9d550f5697fa..d3e22a2608df 100644
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
@@ -315,6 +326,12 @@ static inline int of_coresight_get_cpu(struct device *dev)
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
 
 #ifdef CONFIG_ACPI
@@ -794,6 +811,15 @@ int coresight_get_cpu(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(coresight_get_cpu);
 
+int coresight_get_trace_id(struct device *dev, u32 *id)
+{
+	if (!is_of_node(dev->fwnode))
+		return -EINVAL;
+
+	return of_coresight_get_trace_id(dev, id);
+}
+EXPORT_SYMBOL_GPL(coresight_get_trace_id);
+
 struct coresight_platform_data *
 coresight_get_platform_data(struct device *dev)
 {
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index af5b4ef59cea..536a34e9de6f 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.c
+++ b/drivers/hwtracing/coresight/coresight-trace-id.c
@@ -110,6 +110,24 @@ static int coresight_trace_id_alloc_new_id(struct coresight_trace_id_map *id_map
 	return id;
 }
 
+static int coresight_trace_id_set(int id, struct coresight_trace_id_map *id_map)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&id_map_lock, flags);
+
+	if (WARN(!IS_VALID_CS_TRACE_ID(id), "Invalid Trace ID %d\n", id))
+		return -EINVAL;
+	if (WARN(test_bit(id, id_map->used_ids), "ID is already used: %d\n", id))
+		return -EINVAL;
+	set_bit(id, id_map->used_ids);
+
+	DUMP_ID_MAP(id_map);
+
+	spin_unlock_irqrestore(&id_map_lock, flags);
+	return 0;
+}
+
 static void coresight_trace_id_free(int id, struct coresight_trace_id_map *id_map)
 {
 	if (WARN(!IS_VALID_CS_TRACE_ID(id), "Invalid Trace ID %d\n", id))
@@ -275,6 +293,12 @@ int coresight_trace_id_get_system_id(void)
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_get_system_id);
 
+int coresight_trace_id_reserve_system_id(int id)
+{
+	return coresight_trace_id_set(id, &id_map_default);
+}
+EXPORT_SYMBOL_GPL(coresight_trace_id_reserve_system_id);
+
 void coresight_trace_id_put_system_id(int id)
 {
 	coresight_trace_id_map_put_system_id(&id_map_default, id);
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
index 3797777d367e..255716887051 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.h
+++ b/drivers/hwtracing/coresight/coresight-trace-id.h
@@ -122,6 +122,17 @@ int coresight_trace_id_read_cpu_id(int cpu);
  */
 int coresight_trace_id_get_system_id(void);
 
+/**
+ * Reserve trace id for a system component.
+ *
+ * Reserve the trace id if system component needs a static id for the trace.
+ *
+ * @id: value of trace ID.
+ *
+ * return: 0 if reserve successfully or -EINVAL if fail.
+ */
+int coresight_trace_id_reserve_system_id(int id);
+
 /**
  * Release an allocated system trace ID.
  *
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index f09ace92176e..f65dc20ca76e 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -643,6 +643,7 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
 void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
 
 extern int coresight_get_cpu(struct device *dev);
+extern int coresight_get_trace_id(struct device *dev, u32 *id);
 
 struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
 struct coresight_connection *
-- 
2.41.0


