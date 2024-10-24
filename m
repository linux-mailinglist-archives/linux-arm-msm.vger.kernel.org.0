Return-Path: <linux-arm-msm+bounces-35653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3489ADCA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 08:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0CD8B22D20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 06:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C08918B488;
	Thu, 24 Oct 2024 06:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EMBKh0VL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6C618A957;
	Thu, 24 Oct 2024 06:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729752834; cv=none; b=oXxuoJ7a8qkgNLImSRspktx9bQAS7+Q7sn/0kOLJXvS+pmPys5mkNTJG1R778XEK33QdS9SH0f4OV/soefS4K2MiSmoEMlsdx+36bgssxFhw0DKzgbiTHznvrmse6Lc8YvY6I7HggfVs0YqtMkWrzMFQPrG/JJBppmKKdOp/0+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729752834; c=relaxed/simple;
	bh=RYr2ubf87sC5AIBufWvK08+4DsM0hsw9/XM75RGioyM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o6jWPCGgutJbWjo96EGl2cS3YpvyfOo6pdkSb1O37IJDKVhW/owbesgRiX8M3sHFA+yde9XuftnKkRbTQxgu9xiQgLLzsM7SQp/bfweoHfDLOzHPVKk227OdQWsEa5wwxMNlsSuw0oI0f/zJbZ66znW7CxE1abs9TjxKp6faeSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EMBKh0VL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NN7sAU027446;
	Thu, 24 Oct 2024 06:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yqdhML8OCPF9rhKKvdee8Zbr
	8/zKOieGbqeu3JDpee0=; b=EMBKh0VLojQP9Y+j6XQk+NrNKSGHuPEb+V/tREWT
	zFCfXIN+GRlDF9q7GMgHCu88TVwQ4oqIu50rEkEOnGucYhEuoOKs9h2oPxPYfOol
	uJpH+vFjuIVnRhw+kFVARfOvlYLHKDPqNsWT0np24uIwfmUshuuSgWkOhbslIo4S
	ja+KYLRc/Zl0EFMJ3oHrFUyzPqW5W/qy3xE3Pqg1KcRpwCMc6HKBT+IdycWX8jUm
	Zl90c/t0fDPcsPpO/kFvXaEdL4lhIwTZNN95Hxut5fcwqkHXcDBnLt/EFbuclkYH
	3iE1eEVnB7h6A3atJSIfZqIk92S7Ci/YeYP2375KCbHGqA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wmqe4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 06:53:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49O6rdr4029101
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 06:53:39 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Oct 2024 23:53:36 -0700
From: Tao Zhang <quic_taozha@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: Tao Zhang <quic_taozha@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v4 3/4] coresight: Add a helper to check if a device is source
Date: Thu, 24 Oct 2024 14:53:05 +0800
Message-ID: <20241024065306.14647-4-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241024065306.14647-1-quic_taozha@quicinc.com>
References: <20241024065306.14647-1-quic_taozha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YgzVUo2aOf9WWAdbsIYoNtYPJzqJOqV3
X-Proofpoint-ORIG-GUID: YgzVUo2aOf9WWAdbsIYoNtYPJzqJOqV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=989 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240052

Since there are a lot of places in the code to check whether the
device is source, add a helper to check it.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c     | 9 ++++-----
 drivers/hwtracing/coresight/coresight-platform.c | 4 ++--
 drivers/hwtracing/coresight/coresight-tpda.c     | 2 +-
 include/linux/coresight.h                        | 7 ++++++-
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d9d256b3e8aa..e205a21f7078 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -83,7 +83,7 @@ static struct coresight_device *coresight_get_source(struct list_head *path)
 		return NULL;
 
 	csdev = list_first_entry(path, struct coresight_node, link)->csdev;
-	if (csdev->type != CORESIGHT_DEV_TYPE_SOURCE)
+	if (!coresight_is_device_source(csdev))
 		return NULL;
 
 	return csdev;
@@ -976,9 +976,8 @@ static int coresight_orphan_match(struct device *dev, void *data)
 		/* Fix filter source device before skip the port */
 		if (conn->filter_src_fwnode && !conn->filter_src_dev) {
 			if (dst_csdev && (conn->filter_src_fwnode
-			    == dst_csdev->dev.fwnode)
-			    && !WARN_ON_ONCE(dst_csdev->type
-			    != CORESIGHT_DEV_TYPE_SOURCE))
+			    == dst_csdev->dev.fwnode) && !WARN_ON_ONCE(
+			    !coresight_is_device_source(dst_csdev)))
 				conn->filter_src_dev = dst_csdev;
 			else
 				still_orphan = true;
@@ -1053,7 +1052,7 @@ static void coresight_remove_conns(struct coresight_device *csdev)
 	int i, j;
 	struct coresight_connection *conn;
 
-	if (csdev->type == CORESIGHT_DEV_TYPE_SOURCE)
+	if (coresight_is_device_source(csdev))
 		bus_for_each_dev(&coresight_bustype, NULL, csdev,
 				 coresight_clear_filter_source);
 
diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 6ef4b26f04bb..b6fec0c498dc 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -255,8 +255,8 @@ static int of_coresight_parse_endpoint(struct device *dev,
 		else {
 			conn.filter_src_dev =
 			 coresight_find_csdev_by_fwnode(conn.filter_src_fwnode);
-			if (conn.filter_src_dev && (conn.filter_src_dev->type
-			    != CORESIGHT_DEV_TYPE_SOURCE))
+			if (conn.filter_src_dev &&
+				  !coresight_is_device_source(conn.filter_src_dev))
 				dev_warn(&conn.filter_src_dev->dev,
 				  "Filter source is not a source device\n");
 		}
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index bfca103f9f84..ad023a2a99d1 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -24,7 +24,7 @@ DEFINE_CORESIGHT_DEVLIST(tpda_devs, "tpda");
 
 static bool coresight_device_is_tpdm(struct coresight_device *csdev)
 {
-	return (csdev->type == CORESIGHT_DEV_TYPE_SOURCE) &&
+	return (coresight_is_device_source(csdev)) &&
 	       (csdev->subtype.source_subtype ==
 			CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM);
 }
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 52f05f01b287..f372c01ae2fc 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -593,9 +593,14 @@ static inline void csdev_access_write64(struct csdev_access *csa, u64 val, u32 o
 }
 #endif	/* CONFIG_64BIT */
 
+static inline bool coresight_is_device_source(struct coresight_device *csdev)
+{
+	return csdev && (csdev->type == CORESIGHT_DEV_TYPE_SOURCE);
+}
+
 static inline bool coresight_is_percpu_source(struct coresight_device *csdev)
 {
-	return csdev && (csdev->type == CORESIGHT_DEV_TYPE_SOURCE) &&
+	return csdev && coresight_is_device_source(csdev) &&
 	       (csdev->subtype.source_subtype == CORESIGHT_DEV_SUBTYPE_SOURCE_PROC);
 }
 
-- 
2.17.1


