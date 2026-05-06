Return-Path: <linux-arm-msm+bounces-106100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKd/E0oa+2mtWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 12:39:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E074D9647
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 12:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4915A3037DDA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 10:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8478141C310;
	Wed,  6 May 2026 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="So9I9tx0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7LQqRJU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCCC368275
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778063854; cv=none; b=o8wwlLTCTfqmPKDcS+4iRdhbd/NLtRBk71sh2FMRwY+DEvQ9UvHrmYnDL7+rCtohpQ9PKYa5FgIHZ/uqt+c/o6wy7I8wkLD0bvcuLB+XrQTXg3w8FaoPCnXFckrEsITAssbr2wV2cVk87RofQ1hQCx6cHctyN4dK+D5ytdPWQU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778063854; c=relaxed/simple;
	bh=gLihIN548vUTh9zMyZBigSL1qNZry4i9B6idag+UWv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EYPnyAL56PpnSy0lIQT2Wuvhvtc+dZZwOAwTyczedERBpFR5un0Z098EiQnVc7xRfCh4772kH4LzA0NZ2HAlaSPu4LbvKmPxlcpzGQBHPxDS3IQ8lZ42OqP7NzkggFyUeB+8BECc5nHG91uATcnFLbRdaCSqJD1ff9pytWEZQEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=So9I9tx0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7LQqRJU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466JdvY152013
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 10:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVqCihSIdFZaOQNn3p5pIOaLLZKzNr7E0qMAQ7FyMg8=; b=So9I9tx06OxMz5tU
	8OTnjTkjuBqJgDGOPGLsLdtMcrJNVjTIZT9TE9kl7l786AoAX9qb5Y6DsnhSWVRk
	vJwDJb+DR/UfcfswnC/5JKxZK4+T01oeHquYcHjfrISHLxSZzCtT7y/yQwiZv9lo
	Z7ysT9QFb+y/NI4HGlFEKVbuJAPmh/g0h87MpV3sNXoBj//ZjVk262R6bNha1uwi
	Grl3twZRIPj7YVjHQwVpbqE3pLvdeESa3+kL5CqVKVnGZfLiKfa+yU6Ju7G47QtQ
	EUjywVKZHDHZDC7cexBv/gjZ+zuCVjyhBMNcPN7unqk2S+d0GWqc2hJ8V7JwZO1l
	BxvRVg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj80c9s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:37:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8386367b23cso1812985b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 03:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778063851; x=1778668651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVqCihSIdFZaOQNn3p5pIOaLLZKzNr7E0qMAQ7FyMg8=;
        b=S7LQqRJURMTzSzBIdJG8CK9C1McYYuDfD4fv/lKbsixvZYbg4+2LALNjqr4d3h6edY
         l5ryFJuKDiTACcaQgnIFuq0H5DevDJ6h/tREXwtG0RStSpggSRCyPMNgU/6blIKNiqiq
         6sDiSYsCE5SEteIIpwxNGV2QQStiyI2ZC+ta4HZDvPSPujHLxBtNv7i2rgSjd962nNeZ
         YkG9RQ8Pgv8lXlKVnBaImSy+m1A5sjoqn8BVLpSkN67TmV00bbSawiOjKIs7FcXGqvP+
         klJi6vEEr+lYLsxAmULQlzukAnh5vZsU41H2CBBTl0ShDE225+AJdEtTU7+NzPMAl6J7
         7Ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778063851; x=1778668651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uVqCihSIdFZaOQNn3p5pIOaLLZKzNr7E0qMAQ7FyMg8=;
        b=bMTGxDoRl2etFpTiEL39myJNuOWHiGpa9mcm961pfxXbNMd46k7WyQzOKtOCbaukX8
         vaksyhYTw7oqFNlt2dzxQk59zJtz5AmYPEmuZXypuX4+d5/xk3ZQi3CXYnV646PF2fnv
         GgzruNQ09DFm8g9agmI3G1atjXfjlFL2b7sBuZm64xHVBWDJU5e2hnUAvbo++SfmNl/P
         HC5S3M1syuV0qXzFQbGKatSWEWLJXnnptaTHz/jVV9V0aOd7E/BlDMIE6V8V77LGSogQ
         0V68x5+4RfHwEfzxaekOXyc6FdM3RmfjXGblXNjPSh9wzqQJaeYJVUg3cyZqH1xJHL8i
         YZuw==
X-Forwarded-Encrypted: i=1; AFNElJ8c3yfN6Rfd8g4mKwCxzbEZLAszFeLS6ZUrktscXv3C9iV1MidkKfaIiUZjKE5/m1acbvhNt+JRz/RZjmT/@vger.kernel.org
X-Gm-Message-State: AOJu0YwnXEdv3GSrQpM+9NcnRXJxNIEQYL/C9audYn7k7H3iqlJAWz45
	5ad9rOqXZQAseZuAUI0pSj260UnMCp/2bwMu+lLDNVK5aSttefbpQM1reOTn6HmPgHw1OozmyqJ
	UweI0LmaGKwbAMia0blEecbildO1iad8eCy0LHwXF10BLVyE8oBY/Wk9PtM+uWCvN6e5RIlSCh5
	lU
X-Gm-Gg: AeBDieuM3HUfkt0dfBovtLD3GlsoVnFWg8rALj90rn/y3ovP7MMSnaeGjoamPyx2imq
	Ix1N6OAzms3E28/Yu9zkdL0M/7B8t9MmgeDqJT9neA2kmD0dLELF1N3yaJme2GFxt/zQnLyyGin
	IwjhclwBs2PWLAxpKgD3uZ6GuVPGas5mqUJlsCIJ0c6pkdLL0auQlBkVEjRxrceInC/IxQzcvNC
	qBisO9LAaGUdh0tXN9v10qEnmX0kk86Ljbe/ynEeDH0vajSeNbV50mjQcO8SftuUlcwciR5giUQ
	otgw0I8j4umH6o8VMvDKTQY+KCAGX/0KaTCQa1Nud1ao/ysqPlUoq6jae4YXfuf6WougcS2JO1x
	c+ayHY23Ijej1aArqbYLbnIUOqZfwII/AIJSJXOwnhsS0qb8nVDnYysuzslvZEu8d8LOaocjq7m
	vDnuwGvzlLvWMpw3+T1p9+dZkHZ8m5BV2fKbqmqVKIM8UC9soiwEUSZ4hy7ewuIg==
X-Received: by 2002:a05:6a00:bd8a:b0:81e:b2ba:5b3a with SMTP id d2e1a72fcca58-83a5b6d0a61mr2806868b3a.8.1778063851420;
        Wed, 06 May 2026 03:37:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd8a:b0:81e:b2ba:5b3a with SMTP id d2e1a72fcca58-83a5b6d0a61mr2806846b3a.8.1778063850920;
        Wed, 06 May 2026 03:37:30 -0700 (PDT)
Received: from hu-yrangana-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965b333f2sm6167123b3a.20.2026.05.06.03.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 03:37:30 -0700 (PDT)
From: Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
Date: Wed, 06 May 2026 16:07:13 +0530
Subject: [PATCH 1/2] firmware: qcom: scm: add trace events for the SMC call
 interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-scm-tracepoints-v1-1-4bc983264014@oss.qualcomm.com>
References: <20260506-scm-tracepoints-v1-0-4bc983264014@oss.qualcomm.com>
In-Reply-To: <20260506-scm-tracepoints-v1-0-4bc983264014@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778063845; l=5508;
 i=yuvaraj.ranganathan@oss.qualcomm.com; s=20260506;
 h=from:subject:message-id; bh=gLihIN548vUTh9zMyZBigSL1qNZry4i9B6idag+UWv0=;
 b=tFtPfq4FdIRkchDK02ytyi5W3UdogRtooGhMVIN11YMOP+89Mu8S9Ov/i8wb1I/3MpprUpMah
 drpA3wDJYkfACvQCuAfepbbTrTMZovlSH5f4SDSyng4yLyxE0olYNxW
X-Developer-Key: i=yuvaraj.ranganathan@oss.qualcomm.com; a=ed25519;
 pk=ln7RObom4c2W8MEnQqwZbOi6X198/6toN51al5+6rKI=
X-Authority-Analysis: v=2.4 cv=XvnK/1F9 c=1 sm=1 tr=0 ts=69fb19ec cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9OSSLOKjDFKvovXBaDAA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: iEuzVfvzsvUDxX7KEnMkwEUv6F2OR01g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEwMyBTYWx0ZWRfX1t3NatJURMCM
 kgRO3K0FZXs61t0OGFLoOaWv0I1NsUh0gukp3kSZGj5JsxdEC/yUL0iEQvHzb9splbm6m49E0t1
 pPg2o16olOcV6Nrpb0hKVkFC4tY2PLK+RN8rdBsZ8vbgXx2I5M8BhGwMSHZhJEJCLTXYPKfhPUW
 cN8YDzQHmmBZHmkfCiYQ45e+Sq9kJ/BlVnc9F63dI7ZL1JIEDn0Z8Ofz4lgqwXk3aQpSPDQDVyG
 7u2quPctcv6LKmA07lsMV581AbV/n/2Rze6xJTR2yLcmSToICUx5XQP/M3wBxuwTrTCqZDAwgMR
 ZYWsPoTPEikUR/mgEI8w2xLocf12fI/FmDMe0lga8ISPfIC1BItOOMkMD9BMvJcrEZiPEfSMJLr
 ebwudGDPTyVhygIJYZ7r0VDA0XXLjyO01lvlU93y5G77y93kM8IS9yKAzrwS6VJ5umajz3bi1Hh
 EmeLjkd2uvXmGmPMhxw==
X-Proofpoint-GUID: iEuzVfvzsvUDxX7KEnMkwEUv6F2OR01g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1011 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060103
X-Rspamd-Queue-Id: E2E074D9647
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-106100-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuvaraj.ranganathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

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

Signed-off-by: Yuvaraj Ranganathan <yuvaraj.ranganathan@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm_trace.h | 143 +++++++++++++++++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm_trace.h b/drivers/firmware/qcom/qcom_scm_trace.h
new file mode 100644
index 000000000000..ca8b120563ad
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
+		__entry->wq_ctx        = wq_ctx;
+		__entry->smc_call_ctx  = smc_ctx;
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
+		__entry->smc_call_ctx  = smc_ctx;
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
+		__entry->wq_ctx        = wq_ctx;
+		__entry->flags         = flags;
+		__entry->more_pending  = pending;
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
+		__entry->ret  = ret;
+		__entry->smc_id  = smc_id;
+		__entry->res  = smc_res->a0;
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


