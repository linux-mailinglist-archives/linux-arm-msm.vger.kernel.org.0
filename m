Return-Path: <linux-arm-msm+bounces-49963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C0EA4B6BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 04:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D71C7A605D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 03:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2C01E32C5;
	Mon,  3 Mar 2025 03:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GMFCzpXZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159CE1DB13A;
	Mon,  3 Mar 2025 03:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740972773; cv=none; b=fUTRAw4EtUA+EiSx9DVQpCn+HPTdu+C8g4wTOWJT/MS9mPAvt/40aH2vPVbNZm+H+yQiCaUdVjlzbDr0qeKcxK2PKxYFK7stAdLYD9MzjMkfcnpLQNA/93pVr3bxXgX4P0P5XGw/clfyaNeMqDbDEp2Qfuiu/gu3JbUCtkPWGS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740972773; c=relaxed/simple;
	bh=GOzIuNfxqtGoh7RqoJXwQcNh5lG0pvSxxcaSTXg8R+0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCPnpnsLCz2zygmAt4k1kb0TT4niNiT8CfYbr2i8huAiTo7rPS8lxPWVwNBJyGuvxfx5p8YamMv9N/Cdi9EhOb3a1JyMv1T1SKTTDVCSGH2SnwErbNkrZ/9SWJQF88XHLcxuVeoZG9/KZXPMJukTRd++c3h18WJ8xGeaHVtf4y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GMFCzpXZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 522MhWDY031395;
	Mon, 3 Mar 2025 03:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2G283LuV8Bz4Zvoli/tXzk1nYVyGE7jaJ73Q5WrZ5t0=; b=GMFCzpXZ0sCKgCbP
	bXlbXPkWNbUQ3WbMAuh2U+0zNO3P2oZ/+Pukq16PuyHvQsg+skskED1+45iCwmDi
	ojhjAGfKjHQ+t4FJo2YmTwS2m4SDB7bGelmXZaPxQ24q8e0WDf7R1scgb91Y6U5b
	7u9YZH6s4kWDWkpAGP003YIivMKDHlH4H8CUVkRbgMHkcOqBMDHi7cU1URC3PhRC
	lNFzPA7ANyU6pyBQiVKe1J4TCxOx8KM+dCRc8UkPKXGJajXOomUYnJAdM/MnVSXE
	sQUQblmZlMPVMlRscQYJ1/UkxfmHGq5Fsidu3K/g04k8SAb/w52OwyXQNc4spQLp
	m+ehAw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t993cey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 03:30:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5233UcKX032432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 03:30:38 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Mar 2025 19:30:32 -0800
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v15 07/10] Coresight: Change functions to accept the coresight_path
Date: Mon, 3 Mar 2025 11:29:28 +0800
Message-ID: <20250303032931.2500935-8-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TejwsRMnh-2JJIILR2eHVrGjgrWZUf09
X-Proofpoint-GUID: TejwsRMnh-2JJIILR2eHVrGjgrWZUf09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_01,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030024

Modify following functions to accept the coresight_path. Devices in the path
can read data from coresight_path if needed.
 - coresight_enable_path
 - coresight_disable_path
 - coresight_get_source
 - coresight_get_sink
 - coresight_enable_helpers
 - coresight_disable_helpers

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 37 ++++++++++---------
 .../hwtracing/coresight/coresight-etm-perf.c  | 16 ++++----
 drivers/hwtracing/coresight/coresight-priv.h  |  6 +--
 drivers/hwtracing/coresight/coresight-sysfs.c |  6 +--
 4 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6adc06995d76..630667673136 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -77,14 +77,14 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
 }
 EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
 
-static struct coresight_device *coresight_get_source(struct list_head *path)
+static struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
 
 	if (!path)
 		return NULL;
 
-	csdev = list_first_entry(path, struct coresight_node, link)->csdev;
+	csdev = list_first_entry(&path->path_list, struct coresight_node, link)->csdev;
 	if (!coresight_is_device_source(csdev))
 		return NULL;
 
@@ -333,12 +333,12 @@ static int coresight_enable_helper(struct coresight_device *csdev,
 	return helper_ops(csdev)->enable(csdev, mode, data);
 }
 
-static void coresight_disable_helper(struct coresight_device *csdev)
+static void coresight_disable_helper(struct coresight_device *csdev, void *data)
 {
-	helper_ops(csdev)->disable(csdev, NULL);
+	helper_ops(csdev)->disable(csdev, data);
 }
 
-static void coresight_disable_helpers(struct coresight_device *csdev)
+static void coresight_disable_helpers(struct coresight_device *csdev, void *data)
 {
 	int i;
 	struct coresight_device *helper;
@@ -346,7 +346,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
 	for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
 		helper = csdev->pdata->out_conns[i]->dest_dev;
 		if (helper && coresight_is_helper(helper))
-			coresight_disable_helper(helper);
+			coresight_disable_helper(helper, data);
 	}
 }
 
@@ -363,7 +363,7 @@ static void coresight_disable_helpers(struct coresight_device *csdev)
 void coresight_disable_source(struct coresight_device *csdev, void *data)
 {
 	source_ops(csdev)->disable(csdev, data);
-	coresight_disable_helpers(csdev);
+	coresight_disable_helpers(csdev, NULL);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
 
@@ -372,16 +372,16 @@ EXPORT_SYMBOL_GPL(coresight_disable_source);
  * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
  * disabled.
  */
-static void coresight_disable_path_from(struct list_head *path,
+static void coresight_disable_path_from(struct coresight_path *path,
 					struct coresight_node *nd)
 {
 	u32 type;
 	struct coresight_device *csdev, *parent, *child;
 
 	if (!nd)
-		nd = list_first_entry(path, struct coresight_node, link);
+		nd = list_first_entry(&path->path_list, struct coresight_node, link);
 
-	list_for_each_entry_continue(nd, path, link) {
+	list_for_each_entry_continue(nd, &path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
 
@@ -419,11 +419,11 @@ static void coresight_disable_path_from(struct list_head *path,
 		}
 
 		/* Disable all helpers adjacent along the path last */
-		coresight_disable_helpers(csdev);
+		coresight_disable_helpers(csdev, path);
 	}
 }
 
-void coresight_disable_path(struct list_head *path)
+void coresight_disable_path(struct coresight_path *path)
 {
 	coresight_disable_path_from(path, NULL);
 }
@@ -448,7 +448,7 @@ static int coresight_enable_helpers(struct coresight_device *csdev,
 	return 0;
 }
 
-int coresight_enable_path(struct list_head *path, enum cs_mode mode,
+int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			  void *sink_data)
 {
 	int ret = 0;
@@ -458,12 +458,12 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
 	struct coresight_device *source;
 
 	source = coresight_get_source(path);
-	list_for_each_entry_reverse(nd, path, link) {
+	list_for_each_entry_reverse(nd, &path->path_list, link) {
 		csdev = nd->csdev;
 		type = csdev->type;
 
 		/* Enable all helpers adjacent to the path first */
-		ret = coresight_enable_helpers(csdev, mode, sink_data);
+		ret = coresight_enable_helpers(csdev, mode, path);
 		if (ret)
 			goto err;
 		/*
@@ -511,20 +511,21 @@ int coresight_enable_path(struct list_head *path, enum cs_mode mode,
 	goto out;
 }
 
-struct coresight_device *coresight_get_sink(struct list_head *path)
+struct coresight_device *coresight_get_sink(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
 
 	if (!path)
 		return NULL;
 
-	csdev = list_last_entry(path, struct coresight_node, link)->csdev;
+	csdev = list_last_entry(&path->path_list, struct coresight_node, link)->csdev;
 	if (csdev->type != CORESIGHT_DEV_TYPE_SINK &&
 	    csdev->type != CORESIGHT_DEV_TYPE_LINKSINK)
 		return NULL;
 
 	return csdev;
 }
+EXPORT_SYMBOL_GPL(coresight_get_sink);
 
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
@@ -680,7 +681,7 @@ static int coresight_get_trace_id(struct coresight_device *csdev,
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				    enum cs_mode mode)
 {
-	struct coresight_device *sink = coresight_get_sink(&path->path_list);
+	struct coresight_device *sink = coresight_get_sink(path);
 	struct coresight_node *nd;
 	int trace_id;
 
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 300305d67a1d..f4cccd68e625 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -197,7 +197,6 @@ static void free_sink_buffer(struct etm_event_data *event_data)
 	int cpu;
 	cpumask_t *mask = &event_data->mask;
 	struct coresight_device *sink;
-	struct coresight_path *path;
 
 	if (!event_data->snk_config)
 		return;
@@ -206,8 +205,7 @@ static void free_sink_buffer(struct etm_event_data *event_data)
 		return;
 
 	cpu = cpumask_first(mask);
-	path = etm_event_cpu_path(event_data, cpu);
-	sink = coresight_get_sink(&path->path_list);
+	sink = coresight_get_sink(etm_event_cpu_path(event_data, cpu));
 	sink_ops(sink)->free_buffer(event_data->snk_config);
 }
 
@@ -232,7 +230,7 @@ static void free_event_data(struct work_struct *work)
 
 		ppath = etm_event_cpu_path_ptr(event_data, cpu);
 		if (!(IS_ERR_OR_NULL(*ppath))) {
-			struct coresight_device *sink = coresight_get_sink(&((*ppath)->path_list));
+			struct coresight_device *sink = coresight_get_sink(*ppath);
 
 			/*
 			 * Mark perf event as done for trace id allocator, but don't call
@@ -494,12 +492,12 @@ static void etm_event_start(struct perf_event *event, int flags)
 
 	path = etm_event_cpu_path(event_data, cpu);
 	/* We need a sink, no need to continue without one */
-	sink = coresight_get_sink(&path->path_list);
+	sink = coresight_get_sink(path);
 	if (WARN_ON_ONCE(!sink))
 		goto fail_end_stop;
 
 	/* Nothing will happen without a path */
-	if (coresight_enable_path(&path->path_list, CS_MODE_PERF, handle))
+	if (coresight_enable_path(path, CS_MODE_PERF, handle))
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
@@ -531,7 +529,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 	return;
 
 fail_disable_path:
-	coresight_disable_path(&path->path_list);
+	coresight_disable_path(path);
 fail_end_stop:
 	/*
 	 * Check if the handle is still associated with the event,
@@ -596,7 +594,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	if (!path)
 		return;
 
-	sink = coresight_get_sink(&path->path_list);
+	sink = coresight_get_sink(path);
 	if (!sink)
 		return;
 
@@ -640,7 +638,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	}
 
 	/* Disabling the path make its elements available to other sessions */
-	coresight_disable_path(&path->path_list);
+	coresight_disable_path(path);
 }
 
 static int etm_event_add(struct perf_event *event, int mode)
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 2bea35bae0d4..82644aff8d2b 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -132,10 +132,10 @@ static inline void CS_UNLOCK(void __iomem *addr)
 	} while (0);
 }
 
-void coresight_disable_path(struct list_head *path);
-int coresight_enable_path(struct list_head *path, enum cs_mode mode,
+void coresight_disable_path(struct coresight_path *path);
+int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			  void *sink_data);
-struct coresight_device *coresight_get_sink(struct list_head *path);
+struct coresight_device *coresight_get_sink(struct coresight_path *path);
 struct coresight_device *coresight_get_sink_by_id(u32 id);
 struct coresight_device *
 coresight_find_default_sink(struct coresight_device *csdev);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 3ac5b52413a6..feadaf065b53 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -214,7 +214,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
 		goto err_path;
 
-	ret = coresight_enable_path(&path->path_list, CS_MODE_SYSFS, NULL);
+	ret = coresight_enable_path(path, CS_MODE_SYSFS, NULL);
 	if (ret)
 		goto err_path;
 
@@ -256,7 +256,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	return ret;
 
 err_source:
-	coresight_disable_path(&path->path_list);
+	coresight_disable_path(path);
 
 err_path:
 	coresight_release_path(path);
@@ -302,7 +302,7 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
 		break;
 	}
 
-	coresight_disable_path(&path->path_list);
+	coresight_disable_path(path);
 	coresight_release_path(path);
 
 out:
-- 
2.34.1


