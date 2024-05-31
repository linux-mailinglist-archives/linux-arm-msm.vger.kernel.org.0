Return-Path: <linux-arm-msm+bounces-21257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FCC8D6012
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 12:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC6711F258DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 10:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78EC156257;
	Fri, 31 May 2024 10:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ocDdwhwh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2557F18756A;
	Fri, 31 May 2024 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717152882; cv=none; b=pOw6rZLOOqEo+QupE59P/1aeislo0dB7SRItY0eL1MaJdPGyCAyLNW5dc4RcpTp89Cg+PSGpfnLsg5vizGXjLlCNiAOQIsoPXccoXupJbuIfFGNPAlZVTcOW6RFFqOwP8OAFoTumWV5gSr65v7RQ75M94qOBioxjv4TlhIeQmgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717152882; c=relaxed/simple;
	bh=k2udwgRnRNnhEpAUX0hw5im1I9SWALjW5nHxAe+CqDk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l2vm+0LQqjiW1xyB4p9dzKzCbbljikWouGdKrWvtPhDfyIwq/xpVxnOi19VGYV8GAyLS6FEwiwTOvQsjpsDMoX482znSp7C4lJL6z0+14v7EdTY9ImcgYr4/vr1O0WCnRAjdcpPtazLtwet6b4XhfEeJEBze8zH17wUVw4Wufqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ocDdwhwh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V73dN9019268;
	Fri, 31 May 2024 10:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=40IoWb0CnW8ZkNBhg8uS3w
	2AH/q/T00qehZjBzQ97gI=; b=ocDdwhwhB/rC3UYe6aXvGB0KD3UrxNwaQvDnHZ
	n/PxNhRjI8ha9BbfOW7unoaJYziM7Wrb2tvFekW8TYVpI+vafxE/+qN1kRVt/Ukd
	HSH0tX/oxSVT+3fnG4IIG56rck8sqnGlY9StqJnGH66RWYbHF02xefyfRJQRe4by
	IfqrbiiqolFkYrpYjgj9yRyySZ2YKmbx+s3zIsqDYg1wa0HELmBUmBtsFV+//VBj
	JJ/0g/Y3n/u6dxJsb9nfGkRCw8TfazOO9qUkmLEfqEMbFVclv4KjzTq/XbG1KxTs
	Ar4ZvrVBzb3Gvirb2hcOxKUpWdkc0kqklnSQvm8GNE28ESQA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0geunx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:54:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VAsZv1020943
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:54:35 GMT
Received: from hu-kshivnan-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 03:54:32 -0700
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Ramakrishna Gottimukkula" <quic_rgottimu@quicinc.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: [PATCH] soc: qcom: icc-bwmon: Add tracepoints in bwmon_intr_thread
Date: Fri, 31 May 2024 16:24:04 +0530
Message-ID: <20240531105404.879267-1-quic_kshivnan@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X2amfJl0g7t4mpCldKxR6Y5wA1USnbPj
X-Proofpoint-ORIG-GUID: X2amfJl0g7t4mpCldKxR6Y5wA1USnbPj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_07,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310080

Add tracepoint for tracing the measured traffic, up_kbps
and down_kbps in bwmon. This information is valuable for
understanding what bwmon hw measures at the system cache
level and at the DDR level which is helpful in debugging
bwmon behavior.

Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
---
 MAINTAINERS                        |  1 +
 drivers/soc/qcom/icc-bwmon.c       |  4 ++-
 drivers/soc/qcom/trace_icc-bwmon.h | 49 ++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/qcom/trace_icc-bwmon.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 9ed4d3868539..dc864e3870b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18135,6 +18135,7 @@ M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+F:	drivers/soc/qcom/trace_icc-bwmon.h
 F:	drivers/soc/qcom/icc-bwmon.c

 QUALCOMM IOMMU
diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index 656706259353..dedf0070654b 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -17,6 +17,8 @@
 #include <linux/pm_opp.h>
 #include <linux/regmap.h>
 #include <linux/sizes.h>
+#define CREATE_TRACE_POINTS
+#include "trace_icc-bwmon.h"

 /*
  * The BWMON samples data throughput within 'sample_ms' time. With three
@@ -681,7 +683,7 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)

 	if (bwmon->target_kbps == bwmon->current_kbps)
 		goto out;
-
+	trace_qcom_bwmon_update(dev_name(bwmon->dev), bw_kbps, up_kbps, down_kbps);
 	dev_pm_opp_set_opp(bwmon->dev, target_opp);
 	bwmon->current_kbps = bwmon->target_kbps;

diff --git a/drivers/soc/qcom/trace_icc-bwmon.h b/drivers/soc/qcom/trace_icc-bwmon.h
new file mode 100644
index 000000000000..977e46ade4b8
--- /dev/null
+++ b/drivers/soc/qcom/trace_icc-bwmon.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM icc_bwmon
+
+#if !defined(_TRACE_ICC_BWMON_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_ICC_BWMON_H
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(qcom_bwmon_update,
+
+	TP_PROTO(const char *name,
+		 unsigned int meas_kbps, unsigned int up_kbps, unsigned int down_kbps),
+
+	TP_ARGS(name, meas_kbps, up_kbps, down_kbps),
+
+	TP_STRUCT__entry(
+		__string(name, name)
+		__field(unsigned int, meas_kbps)
+		__field(unsigned int, up_kbps)
+		__field(unsigned int, down_kbps)
+	),
+
+	TP_fast_assign(
+		__assign_str(name, name);
+		__entry->meas_kbps = meas_kbps;
+		__entry->up_kbps = up_kbps;
+		__entry->down_kbps = down_kbps;
+	),
+
+	TP_printk("name=%s meas_kbps=%u up_kbps=%u down_kbps=%u",
+		__get_str(name),
+		__entry->meas_kbps,
+		__entry->up_kbps,
+		__entry->down_kbps)
+);
+
+#endif /* _TRACE_ICC_BWMON_H */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH ../../drivers/soc/qcom/
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace_icc-bwmon
+
+#include <trace/define_trace.h>
--
2.25.1


