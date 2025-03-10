Return-Path: <linux-arm-msm+bounces-50758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B377A58A6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 03:24:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40271188AE79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 02:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3201618E361;
	Mon, 10 Mar 2025 02:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i37EexwF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6DA170A11;
	Mon, 10 Mar 2025 02:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741573460; cv=none; b=ZDd6Osn5zoinQZeaotXqiceGVO8Dnr+6bdq3+zEj7XpQAMAAg9wdYvHBOrAIPzhzrfIiqwTlSAtdNAKhdKp1AQWv4V3N1gTf4BfPd8jNHpal5xdJ/8CnFZ5oQ14B5oHckWsYU6z1kfQt3mLcl2Q/lHlfaNAcqxqFKGF31zjnuoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741573460; c=relaxed/simple;
	bh=ZGY3mUwhSLt87YI4E4b2unFwn2sXf/BEJb0BzP+0zPo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uQc4KxDo3vP4k7+zuxMFPpqH7l+itsco6WjaGotSNqwdOnCnh6QUd01hdW5IkrLpMwu/ArtJNR7GApbj17bzlpd3E+NcRYaj+/MJususj1d9FMpBvrVdkIY7vvXOX/lCmxM1z8M/gGMB03+MD4ZuUqu/8LcxGPgO/zSOBL0JcJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i37EexwF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529MquXU015437;
	Mon, 10 Mar 2025 02:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vU0z+9J+rBNCxPQO8HZEdG
	Sqw5gIcCbIf0D0nliP6Gw=; b=i37EexwFyOehAUk+puhOzMGRRVOvsYCXvbAdRs
	rUBxF3wrK1I9y4oF2eQ9eYcgr2RuBYnuccMqptkklmsEJIKM/6kGL8NhseYTjKbP
	PwUdVGzygbzjCcpGGyQ3NVpObKP9G9bpAGGCNluiN1kIjB1jNa91JBbss9MY5FhA
	L1pr65nCnb1hYN+OlVVYlIC5GnWjCsJjY0bamjYl/t+uFpYj948IR/I7j3c2XGrk
	7vdc+TqfieZMr6cnNULIJYtlGRwvhyq6nAzwkMNfA5lwaZ2idQzGcU0fRW0gzKtj
	EEAY90AYbJjpueWV9EA0hIVpD0gK/3WHddePvIBkqlz3winw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0pu6js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 02:24:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52A2O8eC007706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 02:24:08 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 9 Mar 2025 19:24:05 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH] coresight: add verification process for coresight_etm_get_trace_id
Date: Mon, 10 Mar 2025 10:23:48 +0800
Message-ID: <20250310022348.1654501-1-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: aL7Arnzvvk8P2yHfW7YG7OJa8mdh5HF3
X-Authority-Analysis: v=2.4 cv=KK2gDEFo c=1 sm=1 tr=0 ts=67ce4d49 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=sWKEhP36mHoA:10 a=COk6AnOGAAAA:8 a=cSwQvQB4SgJn8oxX0GsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aL7Arnzvvk8P2yHfW7YG7OJa8mdh5HF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=972
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100017

The coresight_etm_get_trace_id function is a global function. The
verification process for 'csdev' is required prior to its usage.

Fixes: c367a89dec26 ("Coresight: Add trace_id function to retrieving the trace ID")
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index bd0a7edd38c9..5a7cd2376e2d 100644
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
+	if (csdev->type != CORESIGHT_DEV_TYPE_SOURCE && !source_ops(csdev)->cpu_id)
+		return -EINVAL;
 
+	cpu = source_ops(csdev)->cpu_id(csdev);
 	switch (mode) {
 	case CS_MODE_SYSFS:
 		trace_id = coresight_trace_id_get_cpu_id(cpu);
-- 
2.34.1


