Return-Path: <linux-arm-msm+bounces-22307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D66903C04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 14:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 845B21C23189
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 12:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DA917BB25;
	Tue, 11 Jun 2024 12:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lw4R2yuy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CE817B419;
	Tue, 11 Jun 2024 12:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718109266; cv=none; b=Jr+5egPfca8DonEAOjLm0+3iYbj1qO6AlNCjcjtcSCKQv65zRtESi8p0GKFmeC9g/+3e5jqa1LHGGjdl/evMHcA6mOD5LmfpZ9d9wz3O0OLGk25P+lSOl68nCcF3XguJUaNEBbAB4o7PZeOMzxdYAiSPO9JmGxvhV+ee42C/AdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718109266; c=relaxed/simple;
	bh=EyM1u9ZKe6RXpkKkO1gO546IqM3mrWKmiPWqPtgqQlo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EIjFePWi+qXm0naYOuS9T87QmK4T7heC8/gleawcJhD84HiLSUoO/wMbUVW0t4zTiyvyG2i23Hu71kj29L6tHg/75UlOmzG/j2ph6VK9zQgqAPa7LS0qkgpnzqTrm8LEvaaPbl/RfY1APmNR0qB4XOBIzyeDvRSgVV5+DB6d5X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lw4R2yuy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B2xV5k009732;
	Tue, 11 Jun 2024 12:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NMXj1JawtjRXjntkAzVmr7kVTXCwojgvR3vABEV0sFw=; b=Lw4R2yuyfsGrO0+x
	9bGDJngAfeuFp46G1G+Qg+tnoER444Cbs2DLMSnah+ws7MiIP0jo5hEmbhhyfUdf
	lC8stVzUWWh8h4qFXn8/+BFK4Kxu5xfLO5h2iICblTrw/cVr6h3FfiYolOlgTKG6
	+TqnmC/97WwNLNBri7CQb1jUIEC6LX80lMuk3ZJFBxgsJEkXMiGFaPISddAd4nQk
	zlomE8O6WkyGzFufVI2GHz5vu1lFWT2mA6Ak/dsNkDMd/CBeIDKbTkOJVRThMhPE
	wkPu3GJSivbt3lPT46bjGzCSGnnF5GKkuUdVWuiQ2yqEjP02pZMymT0bxIjvfkcq
	Oq7uTg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ype9115nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:34:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BCYJ2E012562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:34:19 GMT
Received: from hu-sudeepgo-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 05:34:16 -0700
From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
To: <quic_bjorande@quicinc.com>, <andersson@kernel.org>,
        <quic_clew@quicinc.com>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <quic_deesin@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>
Subject: [PATCH V2 2/2] soc: qcom: smp2p: Introduce tracepoint support
Date: Tue, 11 Jun 2024 18:03:51 +0530
Message-ID: <20240611123351.3813190-3-quic_sudeepgo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611123351.3813190-1-quic_sudeepgo@quicinc.com>
References: <20240611123351.3813190-1-quic_sudeepgo@quicinc.com>
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
X-Proofpoint-GUID: _ySqj0ijsY5bglCyGvdcCSJa-mrQuY9X
X-Proofpoint-ORIG-GUID: _ySqj0ijsY5bglCyGvdcCSJa-mrQuY9X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406110092

This commit introduces tracepoint support for smp2p,
enabling logging of communication between local and remote processors.
The tracepoints include information about the remote processor ID,
remote subsystem name, negotiation details, supported features,
bit change notifications, and ssr activity.
These tracepoints are valuable for debugging issues between subsystems.

Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
---
 drivers/soc/qcom/Makefile      |   1 +
 drivers/soc/qcom/smp2p.c       |  12 ++++
 drivers/soc/qcom/trace-smp2p.h | 116 +++++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+)
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
index a77fee048b38..6eab8ff55691 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -20,6 +20,9 @@
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/spinlock.h>
 
+#define CREATE_TRACE_POINTS
+#include "trace-smp2p.h"
+
 /*
  * The Shared Memory Point to Point (SMP2P) protocol facilitates communication
  * of a single 32-bit value between two processors.  Each value has a single
@@ -193,6 +196,7 @@ static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)
 	struct smp2p_smem_item *out = smp2p->out;
 	u32 val;
 
+	trace_smp2p_ssr_ack(smp2p->remote_pid, smp2p->irq_devname);
 	smp2p->ssr_ack = !smp2p->ssr_ack;
 
 	val = out->flags & ~BIT(SMP2P_FLAGS_RESTART_ACK_BIT);
@@ -215,6 +219,8 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
 			smp2p->ssr_ack_enabled = true;
 
 		smp2p->negotiation_done = true;
+		trace_smp2p_negotiate(smp2p->remote_pid, smp2p->irq_devname,
+				out->features);
 	}
 }
 
@@ -253,6 +259,9 @@ static void qcom_smp2p_notify_in(struct qcom_smp2p *smp2p)
 		status = val ^ entry->last_value;
 		entry->last_value = val;
 
+		trace_smp2p_notify_in(smp2p->remote_pid, smp2p->irq_devname,
+				entry->name, status, val);
+
 		/* No changes of this entry? */
 		if (!status)
 			continue;
@@ -408,6 +417,9 @@ static int smp2p_update_bits(void *data, u32 mask, u32 value)
 	writel(val, entry->value);
 	spin_unlock_irqrestore(&entry->lock, flags);
 
+	trace_smp2p_update_bits(entry->smp2p->remote_pid, entry->smp2p->irq_devname,
+		entry->name, orig, val);
+
 	if (val != orig)
 		qcom_smp2p_kick(entry->smp2p);
 
diff --git a/drivers/soc/qcom/trace-smp2p.h b/drivers/soc/qcom/trace-smp2p.h
new file mode 100644
index 000000000000..833782460b57
--- /dev/null
+++ b/drivers/soc/qcom/trace-smp2p.h
@@ -0,0 +1,116 @@
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
+#include <linux/tracepoint.h>
+
+#define SMP2P_FEATURE_SSR_ACK 0x1
+
+TRACE_EVENT(smp2p_ssr_ack,
+	TP_PROTO(unsigned int remote_pid, char *irq_devname),
+	TP_ARGS(remote_pid, irq_devname),
+	TP_STRUCT__entry(
+		__field(u32, remote_pid)
+		__string(irq_devname, irq_devname)
+	),
+	TP_fast_assign(
+		__entry->remote_pid = remote_pid;
+		__assign_str(irq_devname, irq_devname);
+	),
+	TP_printk("%d: %s: SSR detected, doing SSR Handshake",
+		__entry->remote_pid,
+		__get_str(irq_devname)
+	)
+);
+
+TRACE_EVENT(smp2p_negotiate,
+	TP_PROTO(unsigned int remote_pid, char *irq_devname, unsigned int features),
+	TP_ARGS(remote_pid, irq_devname, features),
+	TP_STRUCT__entry(
+		__field(u32, remote_pid)
+		__string(irq_devname, irq_devname)
+		__field(u32, out_features)
+	),
+	TP_fast_assign(
+		__entry->remote_pid = remote_pid;
+		__assign_str(irq_devname, irq_devname);
+		__entry->out_features = features;
+	),
+	TP_printk("%d: %s: state=open out_features=%s",
+		__entry->remote_pid,
+		__get_str(irq_devname),
+		__print_flags(__entry->out_features, "|",
+			{SMP2P_FEATURE_SSR_ACK, "SMP2P_FEATURE_SSR_ACK"})
+	)
+);
+
+TRACE_EVENT(smp2p_notify_in,
+	TP_PROTO(unsigned int remote_pid, char *irq_devname,
+		 const char *name, unsigned long status, u32 val),
+	TP_ARGS(remote_pid, irq_devname, name, status, val),
+	TP_STRUCT__entry(
+		__field(u32, remote_pid)
+		__string(irq_devname, irq_devname)
+		__string(name, name)
+		__field(unsigned long, status)
+		__field(u32, val)
+	),
+	TP_fast_assign(
+		__entry->remote_pid = remote_pid;
+		__assign_str(irq_devname, irq_devname);
+		__assign_str(name, name);
+		__entry->status = status;
+		__entry->val = val;
+	),
+	TP_printk("%d: %s: %s: status:0x%0lx val:0x%0x",
+		__entry->remote_pid,
+		__get_str(irq_devname),
+		__get_str(name),
+		__entry->status,
+		__entry->val
+	)
+);
+
+TRACE_EVENT(smp2p_update_bits,
+	TP_PROTO(unsigned int remote_pid, char *irq_devname,
+		 const char *name, u32 orig, u32 val),
+	TP_ARGS(remote_pid, irq_devname, name, orig, val),
+	TP_STRUCT__entry(
+		__field(u32, remote_pid)
+		__string(irq_devname, irq_devname)
+		__string(name, name)
+		__field(u32, orig)
+		__field(u32, val)
+	),
+	TP_fast_assign(
+		__entry->remote_pid = remote_pid;
+		__assign_str(irq_devname, irq_devname);
+		__assign_str(name, name);
+		__entry->orig = orig;
+		__entry->val = val;
+	),
+	TP_printk("%d: %s: %s: orig:0x%0x new:0x%0x",
+		__entry->remote_pid,
+		__get_str(irq_devname),
+		__get_str(name),
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


