Return-Path: <linux-arm-msm+bounces-26367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EE1932F3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 19:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B721D285F60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 17:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB3C1A0700;
	Tue, 16 Jul 2024 17:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OIQm1EbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A4C1A01C0;
	Tue, 16 Jul 2024 17:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721151555; cv=none; b=rV8pyCqATP6AnJYIJYEMn1ttLHtjod8cPSZVGqIgYJA8ahlxi7eyC7JF4CDpcxIULrslB4frTVEO/Dy4jiXOBMDjLk0q5cy3P2Y61SAGPCYqz3V15n/W2lTBNPzuWIy2l5KzW8GK7TbP4K6dCGS49qVLnqMll38gT0xFqNlGLL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721151555; c=relaxed/simple;
	bh=fSsFJqFnGSFNmEueqlpzN3oQOW/4/+RuTayn9tgyTEc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b3OTR8QwN7lVRXopWoLONtvxbcVROCb/lP7XnjRbg3vzNLLrUA0RCnL1QA8wjHMCPZi/BHj69T2fn2Ti6GocN9sV59Up6ss3nIHUFf8NBb/0iSyyqz92ccUtNl8BIi+gTBJakZJWiYxP4Hck8XX2BKLsMIMsagonkdRQQx0ka8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OIQm1EbE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GDVb5C027359;
	Tue, 16 Jul 2024 17:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ur0zweHse1Y6U6m3AM9sfhzUjKO4Fx6AhgfLLWB+EY8=; b=OIQm1EbEoGxfi2S2
	awLAjsM1fl95P+v0C9zI4h1xTlKw2MssmLvHCxYyVJ845EBiJ1dGH5mbbsoFqVyZ
	ncE8LSHW2xjS9bDLvRqH2ROmLdqNCns18ZNkZRnJ1HXRBGPnyHr8OBrAYNJN0ive
	YusmPLHgj1gGUq6khbRQATG+HeHeeYV+8bONiu2GWreEjdxtt38RmNhh4Qxe3I1V
	/IQ+wWqqbbyMiNzL83eD4y4tdAOndSiYcltaHFhYewu9POJ84X6D8ZzHP8zROItG
	Os6B/S1zQJ0DM2QwDNwVMglC3NLHPxROpR2fSCNUD5r5SEKmOarY6RASuip/semG
	xNPuVA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bghrqsj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 17:39:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46GHd9OE028280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 17:39:09 GMT
Received: from hu-vishsant-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 16 Jul 2024 10:39:06 -0700
From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
To: <quic_bjorande@quicinc.com>, <andersson@kernel.org>,
        <quic_clew@quicinc.com>, <mathieu.poirier@linaro.org>,
        <quic_deesin@quicinc.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <quic_sudeepgo@quicinc.com>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>
Subject: [PATCH v4 2/2] soc: qcom: smp2p: Introduce tracepoint support
Date: Tue, 16 Jul 2024 23:08:34 +0530
Message-ID: <20240716173835.997259-3-quic_sudeepgo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240716173835.997259-1-quic_sudeepgo@quicinc.com>
References: <20240716173835.997259-1-quic_sudeepgo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XrjhJ4DBZVh6ZbJI5RTl0_NG7V--45mq
X-Proofpoint-ORIG-GUID: XrjhJ4DBZVh6ZbJI5RTl0_NG7V--45mq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407160129

Introduce tracepoint support for smp2p to enable
communication logging between local and remote processors.
Include tracepoints with information about the remote subsystem
name, negotiation details, supported features, bit change
notifications, and ssr activity. These logs are useful for
debugging issues between subsystems.

Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
---
 drivers/soc/qcom/Makefile      |  1 +
 drivers/soc/qcom/smp2p.c       |  9 ++++
 drivers/soc/qcom/trace-smp2p.h | 98 ++++++++++++++++++++++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 drivers/soc/qcom/trace-smp2p.h

diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index ca0bece0dfff..30c1bf645501 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -23,6 +23,7 @@ qcom_rpmh-y			+= rpmh.o
 obj-$(CONFIG_QCOM_SMD_RPM)	+= rpm-proc.o smd-rpm.o
 obj-$(CONFIG_QCOM_SMEM) +=	smem.o
 obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
+CFLAGS_smp2p.o := -I$(src)
 obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
 obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
 obj-$(CONFIG_QCOM_SOCINFO)	+= socinfo.o
diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 696c2a8387d0..4aa61b0f11ad 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -161,6 +161,9 @@ struct qcom_smp2p {
 	struct list_head outbound;
 };
 
+#define CREATE_TRACE_POINTS
+#include "trace-smp2p.h"
+
 static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
 {
 	/* Make sure any updated data is written before the kick */
@@ -192,6 +195,7 @@ static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)
 	struct smp2p_smem_item *out = smp2p->out;
 	u32 val;
 
+	trace_smp2p_ssr_ack(smp2p->dev);
 	smp2p->ssr_ack = !smp2p->ssr_ack;
 
 	val = out->flags & ~BIT(SMP2P_FLAGS_RESTART_ACK_BIT);
@@ -214,6 +218,7 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
 			smp2p->ssr_ack_enabled = true;
 
 		smp2p->negotiation_done = true;
+		trace_smp2p_negotiate(smp2p->dev, out->features);
 	}
 }
 
@@ -252,6 +257,8 @@ static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
 		status = val ^ entry->last_value;
 		entry->last_value = val;
 
+		trace_smp2p_notify_in(entry, status, val);
+
 		/* No changes of this entry? */
 		if (!status)
 			continue;
@@ -415,6 +422,8 @@ static int smp2p_update_bits(void *data, u32 mask, u32 value)
 	writel(val, entry->value);
 	spin_unlock_irqrestore(&entry->lock, flags);
 
+	trace_smp2p_update_bits(entry, orig, val);
+
 	if (val != orig)
 		qcom_smp2p_kick(entry->smp2p);
 
diff --git a/drivers/soc/qcom/trace-smp2p.h b/drivers/soc/qcom/trace-smp2p.h
new file mode 100644
index 000000000000..9a6392043f10
--- /dev/null
+++ b/drivers/soc/qcom/trace-smp2p.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM qcom_smp2p
+
+#if !defined(__QCOM_SMP2P_TRACE_H__) || defined(TRACE_HEADER_MULTI_READ)
+#define __QCOM_SMP2P_TRACE_H__
+
+#include <linux/device.h>
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(smp2p_ssr_ack,
+	TP_PROTO(const struct device *dev),
+	TP_ARGS(dev),
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(dev))
+	),
+	TP_fast_assign(
+		__assign_str(dev_name);
+	),
+	TP_printk("%s: SSR detected", __get_str(dev_name))
+);
+
+TRACE_EVENT(smp2p_negotiate,
+	TP_PROTO(const struct device *dev, unsigned int features),
+	TP_ARGS(dev, features),
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(dev))
+		__field(u32, out_features)
+	),
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__entry->out_features = features;
+	),
+	TP_printk("%s: state=open out_features=%s", __get_str(dev_name),
+		__print_flags(__entry->out_features, "|",
+			{SMP2P_FEATURE_SSR_ACK, "SMP2P_FEATURE_SSR_ACK"})
+	)
+);
+
+TRACE_EVENT(smp2p_notify_in,
+	TP_PROTO(struct smp2p_entry *smp2p_entry, unsigned long status, u32 val),
+	TP_ARGS(smp2p_entry, status, val),
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(smp2p_entry->smp2p->dev))
+		__string(client_name, smp2p_entry->name)
+		__field(unsigned long, status)
+		__field(u32, val)
+	),
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__assign_str(client_name);
+		__entry->status = status;
+		__entry->val = val;
+	),
+	TP_printk("%s: %s: status:0x%0lx val:0x%0x",
+		__get_str(dev_name),
+		__get_str(client_name),
+		__entry->status,
+		__entry->val
+	)
+);
+
+TRACE_EVENT(smp2p_update_bits,
+	TP_PROTO(struct smp2p_entry *smp2p_entry, u32 orig, u32 val),
+	TP_ARGS(smp2p_entry, orig, val),
+	TP_STRUCT__entry(
+		__string(dev_name, dev_name(smp2p_entry->smp2p->dev))
+		__string(client_name, smp2p_entry->name)
+		__field(u32, orig)
+		__field(u32, val)
+	),
+	TP_fast_assign(
+		__assign_str(dev_name);
+		__assign_str(client_name);
+		__entry->orig = orig;
+		__entry->val = val;
+	),
+	TP_printk("%s: %s: orig:0x%0x new:0x%0x",
+		__get_str(dev_name),
+		__get_str(client_name),
+		__entry->orig,
+		__entry->val
+	)
+);
+
+#endif /* __QCOM_SMP2P_TRACE_H__ */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+
+#undef TRACE_INCLUDE_FILE
+#define TRACE_INCLUDE_FILE trace-smp2p
+
+#include <trace/define_trace.h>
-- 

