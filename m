Return-Path: <linux-arm-msm+bounces-25154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F5D926038
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA82C1C22E17
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4E7177981;
	Wed,  3 Jul 2024 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dnsrn2Rv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF7713DBB1;
	Wed,  3 Jul 2024 12:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720009449; cv=none; b=Qwo5NDxFzet2cfMA8GjCGX+oyOF020S5nCZD/a68zMBENOzhvSz3VVQxmHZA+zNuEUk+nU/AY+lpzeNuHnmeQsPNel8t7220SJ5w9xIVVnpBqv5J5SR3SW/26vHZS66lEU/UhV7IvRvZOqilO5YROITr8Z9UWozAC6AvxlS+B5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720009449; c=relaxed/simple;
	bh=UknA50AULAPPPRbaoGSnb7Tm0jPybyLdJvg6iHUfNow=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VA9XeZlrhpFgAR6ZnwgpynxryTerbEUBhJ1oHSBhBQq82+7ndFoB6HlVpDpVXXz4hd1C74/QjERGRIuGpaKnQRXLNAUrourrthI0Q6OMwVsKuUbQ6IKtT8pjtsPBVFTuhji8m8l1qjiXMo+PgHvun4MZzzKiy6f8l4fdjMadgPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dnsrn2Rv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463AMw07025449;
	Wed, 3 Jul 2024 12:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NnitEIjYFBOWgWWk5P/dDl4/1kTXF1buECwX65+Udrc=; b=dnsrn2RvtrkUsW3/
	EOrrg8/x9BuYtMI3YdZ4cH7KHdumI3FKZK7cUu0dLakRn7oUJNiguYy25oQD00gv
	PP1bE5XT/gKg5aC21Xsx9wM+7ot62h4wC4/6piWxtAaf0jcFkjBm5hzDequy9d1J
	yTUNSqbMgK64YbsJLgE1DCOKuCbSl3n70jXNPt7SfPKpGce32sM/LWEbzK4RpmV8
	Hcox7QJu4pYKgS7tcOWjx8WjK3TqjpKKVDWZydp8ojnNkM4PBkGwKt1NjTPinJL9
	1lZoGgTdVyRX8H/N0H2YF5ndrOZQtFaPTuri9pd1QbsafUze+R0XkFmPT4uf3t34
	/6J3aQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402an78sxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 12:23:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 463CNtnL005947
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jul 2024 12:23:55 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 3 Jul 2024 05:23:54 -0700
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
        songchai <quic_songchai@quicinc.com>,
        Jie Gan
	<quic_jiegan@quicinc.com>
Subject: [PATCH v4 2/2] coresight: core: Add device name support
Date: Wed, 3 Jul 2024 05:23:38 -0700
Message-ID: <20240703122340.26864-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240703122340.26864-1-quic_jinlmao@quicinc.com>
References: <20240703122340.26864-1-quic_jinlmao@quicinc.com>
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
X-Proofpoint-GUID: O4CplGfsGGw_X__9FY1jMNdWPnlcxurc
X-Proofpoint-ORIG-GUID: O4CplGfsGGw_X__9FY1jMNdWPnlcxurc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_08,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407030090

For some coresight components like CTI and TPDM, there could be
numerous of them. From the node name, we can only get the type and
register address of the component. We can't identify the HW or the
system the component belongs to. Add the device-name support for
adding the intuitive name of the device.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 37 ++++++++++---------
 .../hwtracing/coresight/coresight-platform.c  | 30 +++++++++++++++
 include/linux/coresight.h                     |  3 +-
 3 files changed, 52 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 9fc6f6b863e0..1d43333bbeb0 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1328,33 +1328,36 @@ EXPORT_SYMBOL_GPL(coresight_loses_context_with_cpu);
  * duplicate indices for the same device (e.g, if we defer probing of
  * a device due to dependencies), in case the index is requested again.
  */
-char *coresight_alloc_device_name(struct coresight_dev_list *dict,
+const char *coresight_alloc_device_name(struct coresight_dev_list *dict,
 				  struct device *dev)
 {
 	int idx;
-	char *name = NULL;
+	const char *name = NULL;
 	struct fwnode_handle **list;
 
 	mutex_lock(&coresight_mutex);
 
-	idx = coresight_search_device_idx(dict, dev_fwnode(dev));
-	if (idx < 0) {
-		/* Make space for the new entry */
-		idx = dict->nr_idx;
-		list = krealloc_array(dict->fwnode_list,
-				      idx + 1, sizeof(*dict->fwnode_list),
-				      GFP_KERNEL);
-		if (ZERO_OR_NULL_PTR(list)) {
-			idx = -ENOMEM;
-			goto done;
+	name = coresight_get_device_name(dev);
+	if (!name) {
+		idx = coresight_search_device_idx(dict, dev_fwnode(dev));
+		if (idx < 0) {
+			/* Make space for the new entry */
+			idx = dict->nr_idx;
+			list = krealloc_array(dict->fwnode_list,
+					      idx + 1, sizeof(*dict->fwnode_list),
+					      GFP_KERNEL);
+			if (ZERO_OR_NULL_PTR(list)) {
+				idx = -ENOMEM;
+				goto done;
+			}
+
+			list[idx] = dev_fwnode(dev);
+			dict->fwnode_list = list;
+			dict->nr_idx = idx + 1;
 		}
 
-		list[idx] = dev_fwnode(dev);
-		dict->fwnode_list = list;
-		dict->nr_idx = idx + 1;
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s%d", dict->pfx, idx);
 	}
-
-	name = devm_kasprintf(dev, GFP_KERNEL, "%s%d", dict->pfx, idx);
 done:
 	mutex_unlock(&coresight_mutex);
 	return name;
diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 64e171eaad82..66de52bd6c5e 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -183,6 +183,22 @@ static int of_coresight_get_cpu(struct device *dev)
 	return cpu;
 }
 
+static const char *of_coresight_get_device_name(struct device *dev)
+{
+	const char *name = NULL;
+
+	if (!dev->of_node)
+		return NULL;
+
+	/*
+	 * Get the device name from DT. The name describes the HW or
+	 * system the device is for.
+	 */
+	of_property_read_string(dev->of_node, "arm,cs-dev-name", &name);
+
+	return name;
+}
+
 /*
  * of_coresight_parse_endpoint : Parse the given output endpoint @ep
  * and fill the connection information in @pdata->out_conns
@@ -317,6 +333,11 @@ static inline int of_coresight_get_cpu(struct device *dev)
 {
 	return -ENODEV;
 }
+
+static inline const char *of_coresight_get_device_name(struct device *dev)
+{
+	return NULL;
+}
 #endif
 
 #ifdef CONFIG_ACPI
@@ -796,6 +817,15 @@ int coresight_get_cpu(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(coresight_get_cpu);
 
+const char *coresight_get_device_name(struct device *dev)
+{
+	if (is_of_node(dev->fwnode))
+		return of_coresight_get_device_name(dev);
+	else
+		return NULL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_device_name);
+
 struct coresight_platform_data *
 coresight_get_platform_data(struct device *dev)
 {
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index f09ace92176e..f021f3e93978 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -626,7 +626,7 @@ extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
 
 extern void coresight_disclaim_device(struct coresight_device *csdev);
 extern void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
-extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,
+extern const char *coresight_alloc_device_name(struct coresight_dev_list *devs,
 					 struct device *dev);
 
 extern bool coresight_loses_context_with_cpu(struct device *dev);
@@ -643,6 +643,7 @@ void coresight_relaxed_write64(struct coresight_device *csdev,
 void coresight_write64(struct coresight_device *csdev, u64 val, u32 offset);
 
 extern int coresight_get_cpu(struct device *dev);
+extern const char *coresight_get_device_name(struct device *dev);
 
 struct coresight_platform_data *coresight_get_platform_data(struct device *dev);
 struct coresight_connection *
-- 
2.41.0


