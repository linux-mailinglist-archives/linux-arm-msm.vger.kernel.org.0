Return-Path: <linux-arm-msm+bounces-41954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 256F39F0919
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80626169AB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273E11B87D8;
	Fri, 13 Dec 2024 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jPoWRrkW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3801B415F;
	Fri, 13 Dec 2024 10:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734084543; cv=none; b=o5Ql3HA23LnlEY3RgxlDdcZAVtDqgq0bxog6ZIfXNVArfTZwXSVQCFOGn3iQ7TYq6n2RmqaeoCIeCLq4XGmLFV0IXuSU6/+Xw4vMzHUxjzXpTmIEueEX6CyJIcuU0bNxJcjIAmtxkJxDdXxl+rhnp9wbCcIdXlWoLcD122By5LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734084543; c=relaxed/simple;
	bh=hGudUKUZP1Fh10q6nxYaeSZ+jQbcYDUYwL1T9BgXR98=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GqAKKRwO3A7wC/DOeel3z0k0YomiglCocsbRPbSSpsohkmJ1IGNSK0b728jBr/dcQ1oU2TG6rAnbJrZ8IdexbOFJuEyYq5GYVaehkE7lf2tMYxxTSqi9WkcPZ0mEYz1s8LzFACrr0rekfOL9Dv7im1cYxPs/Bn3W2b77XDt3VRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jPoWRrkW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDA3cFh012394;
	Fri, 13 Dec 2024 10:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Fy2rL8m8jvOebQhr6t6Ifte
	XCT/CZC5XBywzrJ1b20=; b=jPoWRrkWTusRxaIbvCXMiqDk2kQSSiOkhejo/BkJ
	Clxzvb+/w9rKYZOSuaq+rXb2DMOZkcxBEUejHdAxrI+PPgZHgrCsQbXlhs+WbfWX
	A9U7mB62W/J5vXUCCnIF7lAdX0YU+q5QEhQlYL6vGW3rjN8jpWlzTNxyaTHuKvN6
	52BpMTx4LH3LAKYO7jUAGOjFT7llx2Q6eXm+2i8/sO1PAh0Q4uN+E2sxhAnWiBD2
	LN7GGurKv5IgUl97J6Shq4QkuzQD2semK5VIj67BpMejT++IHe8blJbwOrS14qgX
	r0QCbgNMcIkhiI9oXkfhUEVWI5qvqODJoacQmJ7xONGqig==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjudg0cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:08:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDA8jrl015692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:08:45 GMT
Received: from taozha2-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 02:08:41 -0800
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
Subject: [PATCH v7 2/4] coresight: Add a helper to check if a device is source
Date: Fri, 13 Dec 2024 18:07:29 +0800
Message-ID: <20241213100731.25914-3-quic_taozha@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241213100731.25914-1-quic_taozha@quicinc.com>
References: <20241213100731.25914-1-quic_taozha@quicinc.com>
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
X-Proofpoint-GUID: eqS-X7a_kKVyr8NFIgxFp-ijo2UAtYSR
X-Proofpoint-ORIG-GUID: eqS-X7a_kKVyr8NFIgxFp-ijo2UAtYSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=903 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130069

Since there are a lot of places in the code to check whether the
device is source, add a helper to check it.

Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 2 +-
 include/linux/coresight.h                    | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 4ec676bea1ce..ab94067c0ed3 100644
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
index 055ce5cd5c44..c50d128e8d93 100644
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


