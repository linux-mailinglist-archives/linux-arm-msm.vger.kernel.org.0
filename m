Return-Path: <linux-arm-msm+bounces-109178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGK7OiH6D2qESAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:39:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E545AF964
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2C4C83015432
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B978D382F1E;
	Fri, 22 May 2026 06:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYUducgv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XN5GOiR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12480384CE9
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779431967; cv=none; b=H5Tg17wif+dq+JpVOa5UjyGG1z1UCtwMzqkI00PBvjXtSJb3ZpQoAGAQoDS9syOWuU7EKeguyx69sHuyDsMCuuYBQxi0pxeM0PgugASSpHstQ8YY+Ud4jzbXr3gulg9Dbd4DIwpJ+x3aQR/Ay9SBae40G1QbXC5HGg+ALftR2w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779431967; c=relaxed/simple;
	bh=rvFFneORD0Dbgh2QGrsz1FyVUySZSlf6xvEpguD3GD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QDX2kvs9J8RlaMXLrlZbgcsnU7lmT2ClBL687aZ1zn/4ipo7PN/eUz1MNKdL3NyVpePvS3r4cC4Co4yowZvqDcdWWxImVQHgSCEZ4t/+2vHIzt7XfXYw710Ldkn3MBMsY/FvB9VfcoTo0Qo6K6HbpL4zy0fhPFYE3JAqcM9rkos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYUducgv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XN5GOiR9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M2dY4q3674139
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7lZAB3LZQPlM8w6vhzswPmoYQZmKcDj4rpm1SKgcRw=; b=WYUducgvS09R13PQ
	ufAd6Ym8IkWmN7x5rtutByRonHvT/u03XVKN8kIdXW3t2sthJoEQyd+36PBxdy2H
	0bouMYmiUE5ab93JBF1YPWuUCTitWEh5lhbfRxdJxQUjLI5X1aG47G8ijsYLzF44
	q0MhtOfQvgKjRIlvVATly+Sy2aVYd+lOfQzbXjBtLYg7JjmYkWu48nxmbfDv/iHV
	W7THG6O/quYfQ+YxVmpFd7F8HRr9Mlfm+954hCoNwqEEChk/UYRfmXF2Ya2IRBag
	msqXw4VzzaH+Wx5sKTAKeJcmA+ZzLVo4/QnRj3KSfULmCoynlfL+tQPrpRda9ztA
	x1RCQA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea4dc37rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:39:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365faf6006dso7032855a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779431965; x=1780036765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7lZAB3LZQPlM8w6vhzswPmoYQZmKcDj4rpm1SKgcRw=;
        b=XN5GOiR9ruA+CowWqk4JSfF8R5HG4wOUSF21925KpfSGU6ub1ZlqcM1kedqYLWseeK
         CFWuVDaJMVQy8k9FKSGTn2+iG8I8jpm5s19WDpGGLNQmSyLRIA8fkPIzEVkjiJGq+ayO
         QTfh6V6NLDjJQyPFtrXgA8TJabUlMnXtjFrXG8+lVlCUCZ2cJmDUH+WUj21eBeY1xEW/
         jBHirJt/71D23R8Efdb17o1xmtasaaQKRjZNgKjgyVyrFH8js3fo3nfSDVBkmtFyoWyK
         LGSSkLfHpAkxpVUR9NfuQE+7wxAtZ+Re0nbwpL2PRcMluSDymsNJWHsCUNh7ynvA6TKw
         vVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779431965; x=1780036765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S7lZAB3LZQPlM8w6vhzswPmoYQZmKcDj4rpm1SKgcRw=;
        b=nH4/Py54ASYKiaU6hcsMGrMzdpokIgCGm5ArsTnMMus+/twtS3jWJ2ZuuA6eRNzsiS
         iBOfzomkUhAhVAxZb4ZfQGDupc8Y+BG1bZhcfIHel7sg6wwitqxDVmM0YNFlEtWwn1yo
         0sNzqm5lQ/vzaToqeaEiho+Z4mkISga1kuvBQSJtgemsm0m3YA6rpehmiRU8WeeDgeUv
         ZL02P20DQt4iEKIg/m5Xg6JLS9Am/UnYxiVEzA4k8N/RNrdiAHSh2D1s3Vf3oRTGnubx
         fSikVdcwz3mVJ5+EA3b1auF3YrTAb8H/oMQ0ktT5YvftvKnxUpWIDRwokk140ACQ7qC6
         +cWg==
X-Forwarded-Encrypted: i=1; AFNElJ9BRqKi2HFp7K5atn19XvPeLXkSvWM/3kRAlUqzU7HL2CkzgaxrdrC8rL6e6e9H+dofENoa/NWax5yhDfq2@vger.kernel.org
X-Gm-Message-State: AOJu0YwkV8x0vDefWK/Y9S6AhqLBAWVELEGYukQOtZmQXoQHJoF6MQDL
	XVewI7bUF+aVLMQD/8RQEjp/VGhfP+BhbEcAIyZ+4h10BA9fx5KfPcfCxlRkJBa1MTg5Id2LZKD
	fkDZxhlRw9dLlEULz83pE0BQbdbC6y+ueMW3D4fXLGFe2t056fHx+lHqIiHc2plYvPeaA
X-Gm-Gg: Acq92OH+CtwI7NEinlgnHEP++c9VCD8ngVCcntLt3Ph8Q4jmNiM4IMh/Cco1klcv2ef
	M7puVOBNo4kFqjTBDN+nHidcpT5cJ92KuLYedSBo38ngFtjrn25oEgDh0ClkbYypbOctHlv+pAH
	w01pY+g0HHggiDTF5016aV+DWocUpxMB4hdDQuf1RKXitUBLoaIceneuhWL8Mr+SBiNZu3ZY1C6
	qSCWSQ2lnEqIevqPbfyFvElp5dTYNPZDVosXaM5+drGh5bGxt2WSxI1tAf4DfuXavoHCg3L+zyV
	JxyyKY5ncxuOlRZZlxBQz5jaiYSObWfzX+csU3CZNrF+4yVhEpb9lgqeuI+0Djb1Ncsl9S22pCE
	yWDnmyDIk7wp+po6lJltkLFFkkEpPhNW/wKgyItRCy9xd7ia/aschNvZWz8UTpP/el1PpDcNNRk
	H8Eq+3tw4TGV6VGY4DtNpC6PRn827zcJupzHh+/nbXqVu/INfw/Bg=
X-Received: by 2002:a17:90b:3f85:b0:369:73a:3266 with SMTP id 98e67ed59e1d1-36a67765ae5mr2314783a91.10.1779431964562;
        Thu, 21 May 2026 23:39:24 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:369:73a:3266 with SMTP id 98e67ed59e1d1-36a67765ae5mr2314750a91.10.1779431964053;
        Thu, 21 May 2026 23:39:24 -0700 (PDT)
Received: from hu-yrangana-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c4cf56sm888822a91.12.2026.05.21.23.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 23:39:23 -0700 (PDT)
From: Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:08:59 +0530
Subject: [PATCH v2 1/2] firmware: qcom: scm: add trace events for the SMC
 call interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-scm-tracepoints-v2-1-e27cdbe0c585@oss.qualcomm.com>
References: <20260522-scm-tracepoints-v2-0-e27cdbe0c585@oss.qualcomm.com>
In-Reply-To: <20260522-scm-tracepoints-v2-0-e27cdbe0c585@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779431958; l=5541;
 i=yuvaraj.ranganathan@oss.qualcomm.com; s=20260506;
 h=from:subject:message-id; bh=rvFFneORD0Dbgh2QGrsz1FyVUySZSlf6xvEpguD3GD4=;
 b=iePkhOojhdQmuelXiAzmxaG4/Ye6BEtUfQIcjJ9U8hxA3sgRyKSkr0VTRx8NvM7TQlPWqK4Pw
 dEZa0cg/Zx9A3mwpeEkx8wdhr3hriSk5369HudBdz6mb5ZZI1OF0Ryq
X-Developer-Key: i=yuvaraj.ranganathan@oss.qualcomm.com; a=ed25519;
 pk=ln7RObom4c2W8MEnQqwZbOi6X198/6toN51al5+6rKI=
X-Authority-Analysis: v=2.4 cv=VefH+lp9 c=1 sm=1 tr=0 ts=6a0ffa1d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9OSSLOKjDFKvovXBaDAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: DNJYwGksLjrOCqLgOe7FJDQzwrup_e0U
X-Proofpoint-ORIG-GUID: DNJYwGksLjrOCqLgOe7FJDQzwrup_e0U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA2NCBTYWx0ZWRfX10dr1zU+jQ9i
 lAuUBr3GMnv0a8nMbhGtaTWIr2ueRqRxc0Setx1VaF4mj7jp1WlvW8Bh5el7zPMhhEHr9esEnvr
 XNTcCNEsXfzHYtYSm3S9etREi536oxS5DLAPAP/EUne8P3KwiGEiqRBiA401O52pzupMoWfUzH/
 VHO8ftO2LRKmSIMME3y+kDIyNf20G/3euTrKKL64PloFFFF/xNKSfC1KeQE+YNa/k7RwifcXjUG
 C18iOOdDef+47/t/xkh+zZ7nibCUdtkmYizYD/HL1wHTz1mUAaBUBE2tgclJfvz0VH/pLohdY/2
 AqCEOd+qxKSO/nwquFViAX3BR86V82DaBuoDbcXskHP/TE/qTOHF39iq3GR3tsuZv3XNQGJCKkz
 W+SONu8Lj2eyvpcoiSVUQj+u/DVeY3LeuDrL+dcXbOA1S5VLGL5MC23yBfUp7nTstDY7iJnv0Gm
 HTAVdyXhqNYjHh75eNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220064
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109178-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yuvaraj.ranganathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 92E545AF964
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SCM SMC call path is opaque at runtime. Stalls caused by firmware
congestion, QCOM_SCM_WAITQ_SLEEP/RESUME cycles, and EBUSY retry loops
are invisible without recompiling the kernel with temporary printk
statements or attaching a hardware debugger.

Add five TRACE_EVENTs covering the complete lifecycle of an SCM call:

  scm_smc_request
    Emit before each arm_smccc_smc_quirk() invocation. Records the
    SMC function ID, decoded service and command identifiers, argument
    count, and up to six register arguments in hex and decimal. Because
    the caller loops on QCOM_SCM_INTERRUPTED, this event fires once per
    physical SMC instruction including inte

  scm_smc_done
    Emit after the outer __scm_smc_do() returns, pairing each
    request with its final outcome. Records the SMC function ID, the
    kernel error code returned to the caller, and the four firmware
    result registers a0-a3.

  scm_waitq_sleep
    Emit when the firmware returns QCOM_SCM_WAITQ_SLEEP. Records
    the wait-queue context and the SMC call context handles required
    to issue the matching WAITQ_RESUME.

  scm_waitq_resume
    Emit just before constructing and sending the WAITQ_RESUME
    follow-up call. Records the SMC call context handle being resumed.

  scm_waitq_get_wq_ctx
    Emit after a successful WAITQ_GET_WQ_CTX fast-call. Records
    the returned wait-queue context, flags, and more_pending indicator.

These events let ftrace and perf reconstruct the full sequence of
firmware interactions, measure per-call and end-to-end latency, and
attribute waitqueue stalls to specific service/command pairs without
modifying driver source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm_trace.h | 143 +++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm_trace.h b/drivers/firmware/qcom/qcom_scm_trace.h
new file mode 100644
index 000000000000..6c911124fc56
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_scm_trace.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM qcom_scm
+
+#if !defined(_TRACE_SCM_SMC_INTERFACE_H) || defined(TRACE_HEADER_MULTI_READ)
+
+#define _TRACE_SCM_SMC_INTERFACE_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(scm_smc_request,
+
+	TP_PROTO(unsigned long a0, const struct arm_smccc_args *smc),
+
+	TP_ARGS(a0, smc),
+
+	TP_STRUCT__entry(
+		__field(u64, smc_id)
+		__field(u8, svc_id)
+		__field(u8, cmd_id)
+		__field(u8, args_cnt)
+		__dynamic_array(unsigned long, args,
+				min_t(u8, (smc->args[1] & 0xF), (u8)6))
+	),
+
+	TP_fast_assign(
+		__entry->smc_id = a0;
+		__entry->svc_id = (smc->args[0] >> 8) & 0xFF;
+		__entry->cmd_id = smc->args[0] & 0xFF;
+		u8 n = min_t(u8, (smc->args[1] & 0xF), (u8)6);
+
+		__entry->args_cnt = n;
+
+		unsigned long *dst = __get_dynamic_array(args);
+
+		for (int i = 0; i < n; i++)
+			dst[i] = smc->args[2 + i];
+	),
+
+	TP_printk("smc_id:0x%08llx svc_id:0x%02x cmd_id:0x%02x args_cnt:%u args:%s",
+		  __entry->smc_id, __entry->svc_id, __entry->cmd_id, __entry->args_cnt,
+		  __print_dynamic_array(args, sizeof(unsigned long)))
+);
+
+TRACE_EVENT(scm_waitq_sleep,
+
+	TP_PROTO(u32 wq_ctx, u32 smc_ctx),
+
+	TP_ARGS(wq_ctx, smc_ctx),
+
+	TP_STRUCT__entry(
+		__field(u32, wq_ctx)
+		__field(u32, smc_call_ctx)
+	),
+
+	TP_fast_assign(
+		__entry->wq_ctx = wq_ctx;
+		__entry->smc_call_ctx = smc_ctx;
+	),
+
+	TP_printk("wq_ctx:%u, smc_call_ctx:%u", __entry->wq_ctx, __entry->smc_call_ctx)
+);
+
+TRACE_EVENT(scm_waitq_resume,
+
+	TP_PROTO(u32 smc_ctx),
+
+	TP_ARGS(smc_ctx),
+
+	TP_STRUCT__entry(
+		__field(u32, smc_call_ctx)
+	),
+
+	TP_fast_assign(
+		__entry->smc_call_ctx = smc_ctx;
+	),
+
+	TP_printk("smc_call_ctx:%u", __entry->smc_call_ctx)
+);
+
+TRACE_EVENT(scm_waitq_get_wq_ctx,
+
+	TP_PROTO(u32 wq_ctx, u32 flags, u32 pending),
+
+	TP_ARGS(wq_ctx, flags, pending),
+
+	TP_STRUCT__entry(
+		__field(u32, wq_ctx)
+		__field(u32, flags)
+		__field(u32, more_pending)
+	),
+
+	TP_fast_assign(
+		__entry->wq_ctx = wq_ctx;
+		__entry->flags = flags;
+		__entry->more_pending = pending;
+	),
+
+	TP_printk("wq_ctx:%u, flags:%u, more_pending:%u",
+		  __entry->wq_ctx, __entry->flags, __entry->more_pending)
+);
+
+TRACE_EVENT(scm_smc_done,
+
+	TP_PROTO(int ret, u64 smc_id, struct arm_smccc_res *smc_res),
+
+	TP_ARGS(ret, smc_id, smc_res),
+
+	TP_STRUCT__entry(
+		__field(int, ret)
+		__field(u64, smc_id)
+		__field(unsigned long, res)
+		__field(unsigned long, res0)
+		__field(unsigned long, res1)
+		__field(unsigned long, res2)
+	),
+
+	TP_fast_assign(
+		__entry->ret = ret;
+		__entry->smc_id = smc_id;
+		__entry->res = smc_res->a0;
+		__entry->res0 = smc_res->a1;
+		__entry->res1 = smc_res->a2;
+		__entry->res2 = smc_res->a3;
+	),
+
+	TP_printk("smc_id:0x%08llx, ret:%d res_to_callee:0x%lx res0:0x%lx res1:0x%lx res2:0x%lx",
+		  __entry->smc_id, __entry->ret, __entry->res,
+		  __entry->res0, __entry->res1, __entry->res2)
+);
+
+#endif /* _TRACE_SCM_SMC_INTERFACE_H */
+
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE qcom_scm_trace
+
+#include <trace/define_trace.h>
+

-- 
2.34.1


