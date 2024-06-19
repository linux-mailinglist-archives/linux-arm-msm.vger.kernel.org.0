Return-Path: <linux-arm-msm+bounces-23219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EFF90EFDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 16:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C63C2824CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 14:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B7914E2E1;
	Wed, 19 Jun 2024 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ma7rT9HF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334171369BB;
	Wed, 19 Jun 2024 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718806460; cv=none; b=DWTYOnNlzfQ5kRSeCceYJUIwMtvKuZuxxKOs4oEbipTFM6w007RDDiJiCMApU2Wj9rDot3mtrQ+koVmzJFvzpW2GwB7bWfJbE1mYg8NS7dP7AxxHdiFdulnQdSl40nG0i65k8npo3odYbrzLwUa66ihPBqLz8XmT74sjzco5B/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718806460; c=relaxed/simple;
	bh=zpRor5o8seRH1rrrqANiimySX1ZFehCBeLGhHXD+kEI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=py2LyvITrUK7a0WTZ3UZ2/fYc3+TCTM/gGHBTFTvDGNaRL9fk/uNUlt5P/bh42hw0LkDiPbZt+eWPmxvoK181HvITBlEafMmO1BMPkANE4MUVzpT0CNolP/GEer6ziwDNMgGgT5hGkDqb5vclASIlcCpov8+AutFF9rNrs+6EUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ma7rT9HF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9LgDo016142;
	Wed, 19 Jun 2024 14:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0+wfIXGd2KDcuUHv8J0Jpb
	o2J2z2nWCl15tSQ1b9UxQ=; b=ma7rT9HFc2KfU9lSjw+2nvedgTep5/3iNRnlsA
	b/mspuDKicp6xWC3v6XNCbKAVFOwqiGItOx/YxoxczDjJ0gklzofjQbXY8ZPKli+
	GR3wAUsd67D2Oj66tV4yyw4qrVRvo8N1kvoRT348ewqiblfVdWgFV9NdTwJwOXlq
	PDLe02Q4QK3goYsKQKrf9+RjmKyqbr3/NazDHDTF0NodJpyx+bzUTdi9osJzCU+o
	/20QglSarsYfXG4kBjRa2TIwxO1ZF7DZGeD8ydbh3o6q34tEGeG8zpSs2Wz454o9
	F1SqOxKz5UMEisyh0LPR7ksoE4ehnCAHajtJgDIbEaX59GZA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuja51wfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 14:14:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JEEDdk019682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 14:14:13 GMT
Received: from hu-kshivnan-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 07:14:11 -0700
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_rgottimu@quicinc.com>,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: [PATCH] soc: qcom: icc-bwmon: Add tracepoints in bwmon_intr_thread
Date: Wed, 19 Jun 2024 19:21:40 +0530
Message-ID: <20240619135140.3581119-1-quic_kshivnan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: aSs72N7S48wph9N-QKTy8icDBSAlFChy
X-Proofpoint-GUID: aSs72N7S48wph9N-QKTy8icDBSAlFChy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 clxscore=1011 mlxscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190106

Add tracepoint for tracing the measured traffic in kbps,
up_kbps and down_kbps in bwmon. This information is valuable
for understanding what bwmon hw measures at the system cache
level and at the DDR level which is helpful in debugging
bwmon behavior.

Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
---
 MAINTAINERS                        |  1 +
 drivers/soc/qcom/icc-bwmon.c       |  7 +++--
 drivers/soc/qcom/trace_icc-bwmon.h | 49 ++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soc/qcom/trace_icc-bwmon.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 242fc612fbc5..1b410c0183bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18573,6 +18573,7 @@ M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+F:	drivers/soc/qcom/trace_icc-bwmon.h
 F:	drivers/soc/qcom/icc-bwmon.c

 QUALCOMM IOMMU
diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index fb323b3364db..9b5ac1e62673 100644
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
@@ -645,9 +647,9 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
 	struct icc_bwmon *bwmon = dev_id;
 	unsigned int irq_enable = 0;
 	struct dev_pm_opp *opp, *target_opp;
-	unsigned int bw_kbps, up_kbps, down_kbps;
+	unsigned int bw_kbps, up_kbps, down_kbps, meas_kbps;

-	bw_kbps = bwmon->target_kbps;
+	meas_kbps = bw_kbps = bwmon->target_kbps;

 	target_opp = dev_pm_opp_find_bw_ceil(bwmon->dev, &bw_kbps, 0);
 	if (IS_ERR(target_opp) && PTR_ERR(target_opp) == -ERANGE)
@@ -679,6 +681,7 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
 	bwmon_clear_irq(bwmon);
 	bwmon_enable(bwmon, irq_enable);

+	trace_qcom_bwmon_update(dev_name(bwmon->dev), meas_kbps, up_kbps, down_kbps);
 	if (bwmon->target_kbps == bwmon->current_kbps)
 		goto out;

diff --git a/drivers/soc/qcom/trace_icc-bwmon.h b/drivers/soc/qcom/trace_icc-bwmon.h
new file mode 100644
index 000000000000..5bdba0b77b72
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
+		__assign_str(name);
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


