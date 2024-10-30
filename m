Return-Path: <linux-arm-msm+bounces-36388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A35479B5EED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 10:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A4121F220DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 09:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1991E2832;
	Wed, 30 Oct 2024 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CkFfTS7S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9A1E201C;
	Wed, 30 Oct 2024 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730280824; cv=none; b=dA70jQTBG3SwqTHOH9cX8zMkieykk8I4buyrZ5BlJgtY79OmwqWd0tpJIahQ5tQv3SpkWM8VRUiDov5Z9/CSlf8Pu06Z0luvnzS9k/Yy/mjTiYpao+NZ7Sfcf7o1RotdRpNJO2KIcoSJVwjdEqcdetIhBwZ2+P2abr5Sv3EowyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730280824; c=relaxed/simple;
	bh=sMwYsX8bkonPYBCdnEumeXQ0kPYUZQR35Y1NAzrzNJ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A/LMi19JjdzB0ERAbcqhQm3nbGZzNA5DkvtC+aDYlYWchOafNZZv531cpNyiEX5kO9IudrXXOR4MPHdVddWMOh24o4p81t66s3Dey9NWY4cfjvvXnNOfHxS4jsluHzskcgQMZeA7EfbIrbvu6EyLbekZA3uL5/txMU4ld1PMIrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CkFfTS7S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U8tG1e007054;
	Wed, 30 Oct 2024 09:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mf7KFV+hbtusH/XSAREKJCBj
	R9jclp7UmMM3e76fQls=; b=CkFfTS7SJWoVA9+82OLk7REB+f2n0SFs8u4RNqfN
	TmTlO3F+nJbVCPscQJP1dbhqiCNZ6rvergd2uoJpdYUTqcau9oDFMtlEjNJ0jXvP
	WpqMfIKIaEB8/4s1RvgKoVcmlG0JQVJNVW/D1aZNoLFjyE1XOMjdCt++1py7pOHd
	8T7zatMhqLHO8FsqF9JlxVMhsyHt8fG9LZKv4XNgrmSfy4zwpkxpBfp+f/n9MPnl
	XrJY1bS9PmAcQpS5gVVUZ9ErYRIWtEIQkuzTyQp6R8b48iTCU+afT8urbN08kal7
	Qysm5s1RCM2rTTUFITa7m6VcZMmrnFkO+gzgaaH+R5INNw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42khqbr3y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 09:33:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49U9XRoQ025610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 09:33:27 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 02:33:23 -0700
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
Subject: [PATCH v5 2/4] coresight: Add a helper to check if a device is source
Date: Wed, 30 Oct 2024 17:32:53 +0800
Message-ID: <20241030093255.26915-3-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241030093255.26915-1-quic_taozha@quicinc.com>
References: <20241030093255.26915-1-quic_taozha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -X1xkpsfHRg71X2kVtpVuU9_yPOW9a6M
X-Proofpoint-ORIG-GUID: -X1xkpsfHRg71X2kVtpVuU9_yPOW9a6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=896
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300074

Since there are a lot of places in the code to check whether the
device is source, add a helper to check it.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 2 +-
 include/linux/coresight.h                    | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

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
index c13342594278..9311df8538fc 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -588,9 +588,14 @@ static inline void csdev_access_write64(struct csdev_access *csa, u64 val, u32 o
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


