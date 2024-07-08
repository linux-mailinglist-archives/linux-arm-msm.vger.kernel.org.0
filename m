Return-Path: <linux-arm-msm+bounces-25477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D3492A005
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 12:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75A6E1C21068
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 10:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D323A27B;
	Mon,  8 Jul 2024 10:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i2Pr6DjM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0DC208B8;
	Mon,  8 Jul 2024 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720433975; cv=none; b=UmMFVlGT3vWhh9M7f3nXSX6wCnuFnssy2ZFWBCwCumb7LoTi5OrfEJndQYhsuEZ8BQd/aTAr5D4gWXGsSWUXTpdpMa8icSHbXaSx3xVx3MhegPXD2UQMSDx5g/TYZbPVT/FdTP/r0h5qr8AzYvVmaLTbKxZpVMpVRVbjnzMUwp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720433975; c=relaxed/simple;
	bh=3LmBQ5pj7lLO3tuAgIdTYWWnsfVcobp6ACv7w5pDOBg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CB1yqsxy5ogXF9Rymtum52Y9syT2AKTBOCsQsF3Kpw1G26bG3KcEFWUeJyRy29GU+1mr9ORBCcva9iEGWpiGSyM8BVrd4jsNW7prFkr1NoLthlitOQHsyUJv39rUKPaezva3Dth6lYszOfTK9nW+h5eGcuejdsh/xg+zYEsmbWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i2Pr6DjM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468ACZC7001275;
	Mon, 8 Jul 2024 10:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ejnjm01v7wcJvQkMafFq++
	rWAupVay7HrKi4Jsj6d+A=; b=i2Pr6DjMfEZoehM16lC3iUfz/vaH0xEE1z3XA3
	TcosLCAuBzWEc5m+Cq263udIEUNfIIEtE08DRdjfvb8fF9SoqjfCVDT7hzVIJGJ2
	mEKPNu0Is+phDP352Z/uEHArjyLWBgzJ+3aeEsgpVIqP1w6/O3hxqdeW+q2bbR51
	WFKZW5gzWWTFppHDjE82A78Y3418xba7Asng29tKvemU6uGWaYeEJ/XZNdVwsusa
	K35JXRPTin/ND++kmWSIrRo++yUNS55nlGOExfvwv7kSJNKLWdQ3952MrmzDWaES
	KZQ/NMiOH4WZYYI+MLbKsM5mclBAZvGMApFdjQsPfiIRsykg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406we8ub4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 10:19:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 468AJQZ6029698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 10:19:26 GMT
Received: from hu-kshivnan-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 03:19:23 -0700
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_rgottimu@quicinc.com>, <quic_sibis@quicinc.com>,
        Shivnandan Kumar
	<quic_kshivnan@quicinc.com>
Subject: [PATCH v3] soc: qcom: icc-bwmon: Add tracepoints in bwmon_intr_thread
Date: Mon, 8 Jul 2024 15:47:34 +0530
Message-ID: <20240708101734.1999795-1-quic_kshivnan@quicinc.com>
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
X-Proofpoint-GUID: V2-ALqkpy5c24aGsXrr-nPcw16zdiduq
X-Proofpoint-ORIG-GUID: V2-ALqkpy5c24aGsXrr-nPcw16zdiduq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_05,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080080

Add tracepoint for tracing the measured traffic in kbps,
up_kbps and down_kbps in bwmon. This information is valuable
for understanding what bwmon hw measures at the system cache
level and at the DDR level which is helpful in debugging
bwmon behavior.

Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Reviewed-by: Sibi Sankar <quic_sibis@quicinc.com>
---

v3:
* Add file in sorted order [Sibi]

v2:
* Fix multiple assignments [Dmitry]
* Fix alignment [Dmitry]


 MAINTAINERS                        |  1 +
 drivers/soc/qcom/icc-bwmon.c       |  6 +++-
 drivers/soc/qcom/trace_icc-bwmon.h | 48 ++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/qcom/trace_icc-bwmon.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 242fc612fbc5..7354cd4c2079 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18574,6 +18574,7 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
 F:	drivers/soc/qcom/icc-bwmon.c
+F:	drivers/soc/qcom/trace_icc-bwmon.h

 QUALCOMM IOMMU
 M:	Rob Clark <robdclark@gmail.com>
diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index fb323b3364db..fc391d077d93 100644
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
@@ -645,9 +647,10 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
 	struct icc_bwmon *bwmon = dev_id;
 	unsigned int irq_enable = 0;
 	struct dev_pm_opp *opp, *target_opp;
-	unsigned int bw_kbps, up_kbps, down_kbps;
+	unsigned int bw_kbps, up_kbps, down_kbps, meas_kbps;

 	bw_kbps = bwmon->target_kbps;
+	meas_kbps = bwmon->target_kbps;

 	target_opp = dev_pm_opp_find_bw_ceil(bwmon->dev, &bw_kbps, 0);
 	if (IS_ERR(target_opp) && PTR_ERR(target_opp) == -ERANGE)
@@ -679,6 +682,7 @@ static irqreturn_t bwmon_intr_thread(int irq, void *dev_id)
 	bwmon_clear_irq(bwmon);
 	bwmon_enable(bwmon, irq_enable);

+	trace_qcom_bwmon_update(dev_name(bwmon->dev), meas_kbps, up_kbps, down_kbps);
 	if (bwmon->target_kbps == bwmon->current_kbps)
 		goto out;

diff --git a/drivers/soc/qcom/trace_icc-bwmon.h b/drivers/soc/qcom/trace_icc-bwmon.h
new file mode 100644
index 000000000000..beb8e6b485a9
--- /dev/null
+++ b/drivers/soc/qcom/trace_icc-bwmon.h
@@ -0,0 +1,48 @@
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
+	    TP_PROTO(const char *name,
+		     unsigned int meas_kbps, unsigned int up_kbps, unsigned int down_kbps),
+
+	    TP_ARGS(name, meas_kbps, up_kbps, down_kbps),
+
+	    TP_STRUCT__entry(
+			     __string(name, name)
+			     __field(unsigned int, meas_kbps)
+			     __field(unsigned int, up_kbps)
+			     __field(unsigned int, down_kbps)
+	    ),
+
+	    TP_fast_assign(
+			   __assign_str(name);
+			   __entry->meas_kbps = meas_kbps;
+			   __entry->up_kbps = up_kbps;
+			   __entry->down_kbps = down_kbps;
+	    ),
+
+	    TP_printk("name=%s meas_kbps=%u up_kbps=%u down_kbps=%u",
+		      __get_str(name),
+		      __entry->meas_kbps,
+		      __entry->up_kbps,
+		      __entry->down_kbps)
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


