Return-Path: <linux-arm-msm+bounces-50809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C5AA59124
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 11:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A35683A90CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 10:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42636225797;
	Mon, 10 Mar 2025 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HVCdFzsF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000D618C011;
	Mon, 10 Mar 2025 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741602477; cv=none; b=HwWgE3t+cQDYWQTaHJMPbwgl0AwGrNaqeX+YhnBFDofWlRh/bId0HMRu/fyGfGz7ILgSxIGhhF1fKUCAoKCqTYkYBF8uxCNJyKzdFwtqelCdfNWxhokP94BhhCVQ3ZqD6s8te6PYZ4aUhxMf6N7OMLEG9S6QaPLBjXBrA8D4guI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741602477; c=relaxed/simple;
	bh=ZIeltqqgvPG6QLEr95dIsShmG2/XI7cF5NQTgUH3AA0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kOhib3x4Zhymb3qpCd1cUiMdX0cU7AfMB8niGHz17urHaLq13tyTYLrpDRGmGCKhefr3QDwYZoHazGl4TdsCABEezGxz54kcVCAV6//T9+a4CQ3Fgw9CUE7zOz0T2tJD/7KkxNWANxv8TVZtcK7Z6Zl12yUsTT284kP3JIXEIhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HVCdFzsF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9tWgY008001;
	Mon, 10 Mar 2025 10:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ItFtQPh8goKqoORKLHsi1U
	1zPD9c0KetLhzZJcHV/4c=; b=HVCdFzsFINvLmz/2a0g8SiDBmPnuLlqOhJDm8W
	fN/R4ED6uGSqWmFXnkSMkeWIZu/XLPs8WzRcWZmbYJxqfra5ENcRX5JQ4+AmW5+V
	8Z/zSocXKEjuZlkH7u+w52AnXxHCCjdNqKzR6FgwDD67yeHPpZc6z4HtJQ6l+FUH
	AIPPC7h9SvsLpfhdM6RECxDvNtTZ0RehpHRb/dp9/FROEswAMdQpHOWlQfgW63sD
	vQ79D+hoHhCbMva3eOupWucwiwyELYjIHez9f++oZFjcLes1eVU7IlldbUhYBqlh
	wlcd95dte6CbK03tj2cLlppSGZkySaI3QORwjZ/wrtoGY95w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyt4e6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 10:27:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52AARhYk013263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 10:27:43 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 03:27:40 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2] coresight: add verification process for coresight_etm_get_trace_id
Date: Mon, 10 Mar 2025 18:27:24 +0800
Message-ID: <20250310102724.2112905-1-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uyGYAAlFAIJQ8ieapiLz5KH6Qrm30VJC
X-Authority-Analysis: v=2.4 cv=CupFcm4D c=1 sm=1 tr=0 ts=67cebea2 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=sWKEhP36mHoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=cSwQvQB4SgJn8oxX0GsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uyGYAAlFAIJQ8ieapiLz5KH6Qrm30VJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxlogscore=981 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100083

The coresight_etm_get_trace_id function is a global function. The
verification process for 'csdev' is required prior to its usage.

Fixes: c367a89dec26 ("Coresight: Add trace_id function to retrieving the trace ID")
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
Changes in V2:
1. fix the logic error.
Link to V1 - https://lore.kernel.org/all/20250310022348.1654501-1-quic_jiegan@quicinc.com/
---
 drivers/hwtracing/coresight/coresight-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index bd0a7edd38c9..c915a055534e 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1616,9 +1616,12 @@ EXPORT_SYMBOL_GPL(coresight_remove_driver);
 int coresight_etm_get_trace_id(struct coresight_device *csdev, enum cs_mode mode,
 			       struct coresight_device *sink)
 {
-	int trace_id;
-	int cpu = source_ops(csdev)->cpu_id(csdev);
+	int cpu, trace_id;
+
+	if (csdev->type != CORESIGHT_DEV_TYPE_SOURCE || !source_ops(csdev)->cpu_id)
+		return -EINVAL;
 
+	cpu = source_ops(csdev)->cpu_id(csdev);
 	switch (mode) {
 	case CS_MODE_SYSFS:
 		trace_id = coresight_trace_id_get_cpu_id(cpu);
-- 
2.34.1


