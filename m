Return-Path: <linux-arm-msm+bounces-107040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMJ7BqjFAmp7wQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:16:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A586151ACFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 325283008C1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 06:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7092A477E3B;
	Tue, 12 May 2026 06:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7e8O3pt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBxZAsME"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9188428856
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566417; cv=none; b=krUS66ygZk7qxtdevTwJXSwHbRhg/tY0O3nomk5vVMdWNHxIxNjyPGGawRM37kmtpRW8g7cNDaBTpE3iP8hhsDuDNxQRD60RRe25ska8tVYhjy+aDkTcq4asXn7s9KlVY/dcJxJyQXF5XJ4HrIiWpw4yjKo9ClGDlw/BaltVcEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566417; c=relaxed/simple;
	bh=nhlgkVfDWgn+TRcBARa7NMZ79rHyudShi2Dvyt2IBC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NxBJvp0N0lSnw4+rxfI7v3ND2PORyfi4XfKOjIoy2BfHkM2v5ikaD8HSOrS8BHAEgu9gs1Qkbpj+iovme3A71WJ9t99VXXTAvhisbvObn8HH/KCAMSpB7IfRAZz/7bvcOto8FExgtjJTvBvvN3ENK2S0Pz3DmfnSZmJkGA6+IT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7e8O3pt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBxZAsME; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5VSaW2994874
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVKsegk5yrtLSMKIfMnOH6O9mKt5aoYLnvSKHe6uEls=; b=H7e8O3ptyCiRYvnz
	CHWpfvPUSZi4MbtHWTJRZ2OTdMgTLwIuyn4gNLtGGwsdK0wkX1eJ85HKURz8o2Lk
	K/+q55vCdZB0yTR0T7RXfbQcn3SJChxmTuS7zL1AuUByAc8CvmLEWQCf9AJdu3V8
	8I9kxpQ5y646P3xydkOdMi0dG29H0kdaAIi+V7ynfCJjc1soMtQe7hDi9VB7Y5s6
	JV7Ag3O6jyo+/yMByzWm8cHbjzOo+82kDNy66aTZ3CJBGSoYfwFmGnU7HCK/VgSX
	tTG3Y6iLARQFivAkpyGHTO8x7FJh6x6T6E35+efp5c40aTCYW57wudV/4NMjVJ9+
	ilFAkQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0srxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:13:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so6635159a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 23:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778566402; x=1779171202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVKsegk5yrtLSMKIfMnOH6O9mKt5aoYLnvSKHe6uEls=;
        b=PBxZAsME2TdfefAVv57aNMOOOgQDfXo54v3PtG73h866yERZgxInHrd9XJLSlQc45k
         VT1pi3oAYOLAznRP01oajlK52Zil5mbXRA2fXEcbQ+WcpY2eNxE/DKljXfLjB4Pka2Vk
         rDR3X0WJcNW21K0xXAxdVOfOljTZEZIekIvVVnfJ9IqrVqb7vv25iOic1N3IWS4CIrGf
         AK+VQJLpx6tN+Q0+xrwFcWY8Rc0iQVq3SwYpU84i4G8BNTnd84gUGIPyt9nKFF00BaiY
         hfdQr+evhBzX4Zjg2ndT3bJjybP542wSbktPmq10wdaU3b2tAqM/paVqi2uYpT9xq9Mn
         ApKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778566402; x=1779171202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wVKsegk5yrtLSMKIfMnOH6O9mKt5aoYLnvSKHe6uEls=;
        b=WniIYYc8W58rufXToQbu6yfIaAiw7k215rhEuk0g0+6N/ffMLQhwZ1K7SmzkJT5C2B
         RXLZj/Vjl1D8q/5jXjEvmAtYjUSdvgiUqboh0ExUj2RfoWZ+BSfVrBZRKdfXNMxsFk/B
         pPrtLlexcvCspH9cNKVUjTdgZoLqJCMZlz+d7ppGN7ziX2HkDNnBCIDPUjJ7xN30tjvb
         tVWsEP9LAgXuXBYgLXCFzInnvag5PvaVN+reCsG/TY+fSDNbLwnfvf4R2fCZ+RWuaqOU
         gG8ky5V5PN3kFND6hmFQdF2qvMjOl2bzYOQ5Bg7CbkHYScNu4+ngJv170XVaujmvIC07
         uSfA==
X-Forwarded-Encrypted: i=1; AFNElJ/jBJnChVzkV8Ipvx3I7WQO2erPwSbPnu9+k0XmXgTMM8Sox2yMGpGQGEGADnBaDS2D3Kd9fMS3xLz0P+pv@vger.kernel.org
X-Gm-Message-State: AOJu0YyceSOANHGxQR5kFwFuIOswNkhe5/WCnCzsJ+pfTkX+aY/I0Zi2
	N8cXvpz/3i7ujay3W+fO/6OVG04Jn/ZCDlZ3AG13w7JQKYyNJ2vP8NvMXuMNS5uLVSkWpJSfuMT
	gl8ZbE1x26e9l2vAaCPwIh10oj6/wGl0MvurulPxMwtZdDqnnVe77rNRMNB7HuwR5EM68
X-Gm-Gg: Acq92OFfOwZrI21rN4ELRYfIXemzCGUyAw4GQ5mdv9fx/2Itc0PCivDfk6+e42cWrFM
	6FLvYo8dPylWWPlIfDTYtNIT8rBxg0crzUEA/kYzWVy0CUlOe9EvJaxh5Ryihj6+HxPEkAS8Li7
	7L96xEpg0pwZC/L2i/2gdoIkSkembRz7r08yBzyh8ZB2A/G2DI1GZndmsCqevBt91RZlIqaBfuu
	LjKct38YpZOTN+ZPeoDCMpPenICzp4o2/iBW8orvq+Y8zypEcL6WV1Y4n8NMHidWPzcEHUxny3s
	41Jt8dPrSEyzBdYSPGcADQX1F+csnTt8vy+PVJOcfhBqw0vZcURfHQ8Qqb5wMRJAGWpA4UI0+3H
	7wBkE8li4FONWzUGuTy2fsBOfALabAB7OBLrwu+fgeEtMi6BOJp0h+oQ=
X-Received: by 2002:a17:90a:38c5:b0:367:c442:3f24 with SMTP id 98e67ed59e1d1-367c442412fmr8907715a91.19.1778566402267;
        Mon, 11 May 2026 23:13:22 -0700 (PDT)
X-Received: by 2002:a17:90a:38c5:b0:367:c442:3f24 with SMTP id 98e67ed59e1d1-367c442412fmr8907668a91.19.1778566401523;
        Mon, 11 May 2026 23:13:21 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b00d2131sm842518a91.1.2026.05.11.23.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 23:13:21 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Tue, 12 May 2026 11:42:52 +0530
Subject: [PATCH v2 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-add-tracepoints-for-qcom-geni-spi-v2-1-3b184068ecf9@oss.qualcomm.com>
References: <20260512-add-tracepoints-for-qcom-geni-spi-v2-0-3b184068ecf9@oss.qualcomm.com>
In-Reply-To: <20260512-add-tracepoints-for-qcom-geni-spi-v2-0-3b184068ecf9@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778566392; l=4051;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=nhlgkVfDWgn+TRcBARa7NMZ79rHyudShi2Dvyt2IBC8=;
 b=I3gkvz/NlpoT0yJ+STIDXSejHUNnROwikLsZy6Lbj+6h+xssUg9KupkfdlUmyGUc9Dq0HFrAT
 pyVvYnkdu7CA83BdwtT78TLjGAEYppDcULnJASYHAZm5txpikDA0dVL
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a02c503 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=uI40SpaImk96dJ2R2O8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: BWIdmp5mRG2LyQnGAR4aSuxC9Uaeto2O
X-Proofpoint-ORIG-GUID: BWIdmp5mRG2LyQnGAR4aSuxC9Uaeto2O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA1OCBTYWx0ZWRfX0R3K3uE41sRk
 kzXZYoD7p8ADB/fPAX7FPTo7SjGqxVTKgWrmQNhbxKxjeisz95Y9QmFIuIh3JeroBrX0ZF2RTsS
 xExZjeokIJ8H6m2Mk1R/z6KtWan6kBD/Umx+bNPWlHrXC0jW28UkFkzSDPOQI6mMvShzpSqdp4S
 F1Y9lZH6VKpsm8VNFuWy+N2/DkgQcw/Xtysqk+sV5I9+o/sZtVat6ZxTaNwNdd1xtGcU9mgmks1
 7hv1KW16ZK9+s8UooqSAMPDIlnkv7VPPbTQaXerLc7UXolfGBJ+gAAhKF855vsor03s1wT1obHR
 9H12HSogi60fhy5NkMgRtj+TURemT3NcRiQL1zrDa5UvK6WPVRjLGTGlKLHmhj8XCog0w+RjS6D
 G4RNyrkXfZk6IDj2lxdoOzTD1tehuySE/7p58e4kcH/pe4h3LUyAJio5KbzRKqJgAMykXg4Qh1h
 Gawy9bHiJUgr9p8jkwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120058
X-Rspamd-Queue-Id: A586151ACFD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107040-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add tracepoint support to the Qualcomm GENI SPI driver to provide
runtime visibility into driver behavior without requiring invasive debug
patches.

The trace events cover clock and FIFO parameter configuration,
transfer metadata, interrupt status to be making it easier to diagnose
communication issues in the field..

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
- Removed TX/RX data tracepoints.
- Updated commit text.
---
 include/trace/events/qcom_geni_spi.h | 103 +++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/include/trace/events/qcom_geni_spi.h b/include/trace/events/qcom_geni_spi.h
new file mode 100644
index 000000000000..5f39dab47e4e
--- /dev/null
+++ b/include/trace/events/qcom_geni_spi.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM qcom_geni_spi
+
+#if !defined(_TRACE_QCOM_GENI_SPI_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_QCOM_GENI_SPI_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(geni_spi_fifo_params,
+	    TP_PROTO(struct device *dev, u8 cs, u32 mode,
+		     u32 mode_changed, bool cs_changed),
+	    TP_ARGS(dev, cs, mode, mode_changed, cs_changed),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u8, cs)
+			     __field(u32, mode)
+			     __field(u32, mode_changed)
+			     __field(bool, cs_changed)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->cs = cs;
+			   __entry->mode = mode;
+			   __entry->mode_changed = mode_changed;
+			   __entry->cs_changed = cs_changed;
+	    ),
+
+	    TP_printk("%s: cs=%u mode=0x%08x mode_changed=0x%08x cs_changed=%d",
+		      __get_str(name), __entry->cs, __entry->mode,
+		      __entry->mode_changed, __entry->cs_changed)
+);
+
+TRACE_EVENT(geni_spi_clk_cfg,
+	    TP_PROTO(struct device *dev, unsigned long req_hz,
+		     unsigned long sclk_hz, unsigned int clk_idx,
+		     unsigned int clk_div, unsigned int bpw),
+	    TP_ARGS(dev, req_hz, sclk_hz, clk_idx, clk_div, bpw),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(unsigned long, req_hz)
+			     __field(unsigned long, sclk_hz)
+			     __field(unsigned int, clk_idx)
+			     __field(unsigned int, clk_div)
+			     __field(unsigned int, bpw)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->req_hz = req_hz;
+			   __entry->sclk_hz = sclk_hz;
+			   __entry->clk_idx = clk_idx;
+			   __entry->clk_div = clk_div;
+			   __entry->bpw = bpw;
+	    ),
+
+	    TP_printk("%s: req_hz=%lu sclk_hz=%lu clk_idx=%u clk_div=%u bpw=%u",
+		      __get_str(name), __entry->req_hz, __entry->sclk_hz,
+		      __entry->clk_idx, __entry->clk_div, __entry->bpw)
+);
+
+TRACE_EVENT(geni_spi_transfer,
+	    TP_PROTO(struct device *dev, unsigned int len, u32 m_cmd),
+	    TP_ARGS(dev, len, m_cmd),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(unsigned int, len)
+			     __field(u32, m_cmd)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->len = len;
+			   __entry->m_cmd = m_cmd;
+	    ),
+
+	    TP_printk("%s: len=%u m_cmd=0x%08x",
+		      __get_str(name), __entry->len, __entry->m_cmd)
+);
+
+TRACE_EVENT(geni_spi_irq,
+	    TP_PROTO(struct device *dev, u32 m_irq, u32 dma_tx, u32 dma_rx),
+	    TP_ARGS(dev, m_irq, dma_tx, dma_rx),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, m_irq)
+			     __field(u32, dma_tx)
+			     __field(u32, dma_rx)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->m_irq = m_irq;
+			   __entry->dma_tx = dma_tx;
+			   __entry->dma_rx = dma_rx;
+	    ),
+
+	    TP_printk("%s: m_irq=0x%08x dma_tx=0x%08x dma_rx=0x%08x",
+		      __get_str(name), __entry->m_irq, __entry->dma_tx,
+		      __entry->dma_rx)
+);
+
+#endif /* _TRACE_QCOM_GENI_SPI_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>

-- 
2.34.1


