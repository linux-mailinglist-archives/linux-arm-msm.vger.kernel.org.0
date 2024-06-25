Return-Path: <linux-arm-msm+bounces-24069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D88915E81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 07:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C70C51F23166
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 05:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38ABA145FF1;
	Tue, 25 Jun 2024 05:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bQ5rl1sx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BF9145FE4;
	Tue, 25 Jun 2024 05:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719295015; cv=none; b=XUme0ZbpARplq7xbaye+jjO/8UReZkv5xC0tl/GgGeJhtWGSsMXkOmAUfrCWiqWRdb70Kk2a+z2u6B95olnHB1q0huieosPcJ3vz/lgDFYzPKarp4B1BEUoodhxJLDFY8sqkyXLE8+HWvsFfnCN/sZK7thcDfcH0D7YGiAfgvtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719295015; c=relaxed/simple;
	bh=ZB7Mz6gtH9b5BvWQkyMyWRwbWNU2M19sW8KwcbZ0Bsw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kjiHIBZRJmW2cGwLSCoJB2UC5k2Hi2nvsplFqdJF2dnMEMDlVer/6FzTxWu4+ho23AAXgqJ1jRhLpodgmBnWE+9it6LGsZ46FZbIjocGX7mGn7WVCWVgXK4atFtA7d5QfoWPtYR1Mpy8LXy18uL6dm91fONzxjg+0Tb3qZhKJ1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bQ5rl1sx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OJMkc9031591;
	Tue, 25 Jun 2024 05:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dlN2+PRPkHN1NR7qzHwb7h
	aLNKrscoNXSgDA+AqB/J4=; b=bQ5rl1sxHBk5Z73qfiinWc+2Sg7Z3jLRr8c2OD
	WWEjj1leZs3/srlllLWniXdVkNSGKFnDv+19UPQpa/raL7ryXfVUtm5ZlysRLVrj
	K3PsIKZ02yyLN3Y7LGWrAhCNp3bwWBYnB9/qYpOwwsf7zoj1pZUv1/YNyYxUvpR6
	Z6X0Kc9H6q0ZohHsmOF5tX8a9sjshiBUs+8jzozqlMoUsGS2mroKj/nI32g+sH8E
	5KFVhVW0fXdK8ZSIv28RxtyWOqXctvxN2ifF/zjYOJ+VOmHxycmGW9zFqiqdLPV3
	ke+MvP6m/u98mpDpAFsEjwFkrcYqxUXMcIuxWR8WeZqn5Cjw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywppv5euy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 05:56:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45P5umTw023398
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 05:56:48 GMT
Received: from hu-kshivnan-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Jun 2024 22:56:45 -0700
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_rgottimu@quicinc.com>,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: [PATCH v2] soc: qcom: icc-bwmon: Add tracepoints in bwmon_intr_thread
Date: Tue, 25 Jun 2024 11:26:11 +0530
Message-ID: <20240625055611.1375273-1-quic_kshivnan@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9iM7gy2ufKUN_bhAHgvgdy5tVqjvBw0J
X-Proofpoint-ORIG-GUID: 9iM7gy2ufKUN_bhAHgvgdy5tVqjvBw0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_02,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406250044

Add tracepoint for tracing the measured traffic in kbps,
up_kbps and down_kbps in bwmon. This information is valuable
for understanding what bwmon hw measures at the system cache
level and at the DDR level which is helpful in debugging
bwmon behavior.

Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
---

v2:
* Fix multiple assignments [Dmitry]
* Fix alignment [Dmitry]

 MAINTAINERS                        |  1 +
 drivers/soc/qcom/icc-bwmon.c       |  6 +++-
 drivers/soc/qcom/trace_icc-bwmon.h | 48 ++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)
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


