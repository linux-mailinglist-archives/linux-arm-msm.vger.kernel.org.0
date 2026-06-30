Return-Path: <linux-arm-msm+bounces-115262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 46HMCj5cQ2oMXQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:03:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 758146E0903
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:03:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="np7Fny/j";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cJORygiw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115262-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115262-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61084302DFB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE5126A1C4;
	Tue, 30 Jun 2026 06:03:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E54233927
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:03:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782799392; cv=none; b=LRePZ8agePEgMPOtpO1GOsCJrDMWvSmL7hedVgUHmnJcAYu+CzPvPjvgRv/DMiwOpWaeyv/coWz1uxQV+kNTQ7ym37fVe7WWDWdfYsWqvr8czIolLKc8hU8VDsuMdTkQK7c7rV34xnv859jdkk/smUIVdj5+sO4XrJAVpTNa+tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782799392; c=relaxed/simple;
	bh=SsMm0ZABx5wKE0RNJoBN1GlttY4OwMPyyO9ucW7m4lI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O3Jz3OVc3j7NU8HQzyLyeRGuiVzBI05cNciU04CFaD26vNrnoraFH32Z9FD515keACAhbz/OcK5YWbTkHAx2bgzmBgSgyzfq2Kg1HHMlhJsuRbG4ePsFN6HGOdZPmhCX6Y4TJ9Qm/evFTFZ3bOYV2jq0JWGXbbrFHiWOSKTva8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=np7Fny/j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJORygiw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5cM11979525
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p5DD/knY0r+8MsNJLC7rflq2rFmViC8t0JP5VSOYGek=; b=np7Fny/jj7gf6WjX
	5jsYU65AC0aU+sLWv0T2YLHgusD6x/kq+xLsiSpvxhAaVta4fn2Pv1BPJYazYwzF
	2gYsYUCxlq6vYQqocebC2OL9ItrzQtaNtFT6wS/9KDKjGTsRGF5rQbAfUeHj2bBK
	OrSgbryQQw421L4WuD/2CnOjuYYsqY1hc1zsYxpTZAzR6rpHrKXRgwr7CNfTYHLR
	7xqC7rE4n7QD4i9C+jYZibXq9S1o7BmJJGKml92dzoOaTKauBJ2mHFOlT2Doj+pu
	zfK+Pd7awNkkSfhXlFP84bGsksQEXN33QNBFqBfE9xN4L0SURAtz/SMqwTVvGI6A
	8ZYMuw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46860e4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:03:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso4580746b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 23:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782799389; x=1783404189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5DD/knY0r+8MsNJLC7rflq2rFmViC8t0JP5VSOYGek=;
        b=cJORygiwKqMEc/rqoRgNfApKFhsH906Z6AJKZID07oPq+ot24TwZincP1WYE3a033d
         /ZTiA6eGM/vYTNifALIyNobQatlOZyzxKr2FDQTNcrMlEJEww46e0LuLdrPjVI9JOp6D
         DbliSaCmYuQ+t0sqvs8DooIv/BsBhr3ZqcIXAWw9atdOTKgjyvL8u6H4A+3JZ+VJm7Ox
         GRZ+tGQSynvh0XoGza8HrGsQVHPdetDabogS8g1kKwhgGVe8rN9s0NaYUTv1hRVd+GLR
         S9982TL/Y7aS68MWfVOquJIakUJHSrlOZZlMNKM21C6fcKqvugsdM4xcJiopDX96zRU4
         IASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782799389; x=1783404189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p5DD/knY0r+8MsNJLC7rflq2rFmViC8t0JP5VSOYGek=;
        b=UJqdtun/yF9dyst37Nm4k5ZjboXWHS1iWhJ4pGitguhgBZhlbjz+8EFNqTs54gMWzs
         SCp4P2PGMHkQaKk/zZ3+WJN0ZTFZLgJb2A4IdK+FzGIS6XuVU8jU4edlzg61BfB9STwK
         hu7B88QGWNrP0ROZlItrWb8j2nUPhB25Kubb7SwN5G/g5F8JHGAdAqMJWsitZWdXq+5t
         e/gorSYAAO2TMLZUTXbGYZq9OsfGISzxmh6gAK1n3bqtZWHyAySP7zQea7KivTGBkrVQ
         9JWBx3iCC5hdl5AVSP0vVP35htu6Uj30NpUSA1CCE5TgcvE5MElqhBxB9hSTxLq53dsh
         GdOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjQ2XdX8NSnHl0WH9GrHLExoc42a2V6D8pIrNG0nXhv11Km/am1H/y64XjS944mIu+xzKWRU9gcDq/u7ZH@vger.kernel.org
X-Gm-Message-State: AOJu0Yx26nib5AKgm5Ek27pwWUchJvaEfZSWs2qGUb6AJKq10S0V+siN
	ZJJfsks4ZEhh+3khkvtdJRW0IJn1mvR7xNpVp9ne9biSKZ0M7lTJlzqCMYHZpJvq7vZePIoDKhx
	ben9c1cAWCcDH1Nknpx4lA/CVJITWwQsFX/4Ave90OiMsseu47Xo4SH5NqaNHf/HyXGdQ
X-Gm-Gg: AfdE7ckp04H9erG0e9XjXwBsE/bvM9cq1EnVKk3kdLYZPsz5MXBvjRLXtLvIv6ByXYh
	tOT60+NHJNJZVCdWsi6rLU+WNFi2nz5D7N6Lq96Omt9G3ZyhKL5n4ZlF/Ulm8YxgO07xrZqDP0C
	p5GxGTpGErkROf5BiYh7DMuCVdBkqXmYhzi363hvFJRVWdaEGR5Y51Y+1ywRWA1PGdCQcrpT0gN
	BdS6x2eF58GuAS6LQVUWeVW9rXVcLt8AuLF8yG1h0SdinrVl5Tbn+gLlAUf1DGW8hAmVHOVGsB+
	a90LXFMjtXeW7wc4zxIp46PblwedYP5MYDZcumw/WWIdeYE2xeZjodSQ3Xa4X+B95ExuKjm0yaL
	6ZhixP95YJCyaRM5f0BcYQInL6Y2QovsxAsrCo18fMAef
X-Received: by 2002:a05:6a00:288e:b0:845:e08c:a4eb with SMTP id d2e1a72fcca58-8479f2c573bmr1799862b3a.58.1782799389462;
        Mon, 29 Jun 2026 23:03:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:288e:b0:845:e08c:a4eb with SMTP id d2e1a72fcca58-8479f2c573bmr1799817b3a.58.1782799388686;
        Mon, 29 Jun 2026 23:03:08 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a00029d3sm1112600b3a.20.2026.06.29.23.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:03:08 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:32:45 +0530
Subject: [PATCH 1/2] i2c: qcom-geni: trace: Add trace events for Qualcomm
 GENI I2C
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-add-tracepoints-for-qcom-geni-i2c-v1-1-474cd6cdbe27@oss.qualcomm.com>
References: <20260630-add-tracepoints-for-qcom-geni-i2c-v1-0-474cd6cdbe27@oss.qualcomm.com>
In-Reply-To: <20260630-add-tracepoints-for-qcom-geni-i2c-v1-0-474cd6cdbe27@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782799380; l=3195;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=SsMm0ZABx5wKE0RNJoBN1GlttY4OwMPyyO9ucW7m4lI=;
 b=UnmM8bgAUs7lt0XO04uWA1E17SiL3u9696UGM2pYGrmhR5SjAF9Bgh3i4OfnBZe9+/FU0eehU
 89iyhkqvsLiBQD+X7VvpZJMNy8WWrIM3LM2YL426fd54RveI0K2JUSR
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: vufghGyj5GV5h24alGPbQ4AtJsSl4WqC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA0OSBTYWx0ZWRfX7kBbOVKDWVmv
 jmUQ4q2RWBEmfabFAqLsStAtHD0X0OXJQh+aeaZrGiNjxANYv3j7QINmD8EJBQC5Lj40tb6n21c
 5sRPaRDql5/arvGCPtACoHPNKo4/H/alTcALD6lNgFhXZkPvquggU5R7YLf5D/plfn6rOrWdC6G
 ef+EACL4ecbcShNoKcFTk44GpRnFBIIBbgAR8juSbKyCP3A5YKkvG7gdMRCTrOexixt2RmxQbu5
 iOeeoxxApARZV2eKSHDW4AWdEw0XqHIKzcxh6EHQd3J3HY+5PdYOGsWaZuzlJaO5HuJl6p1Etqr
 oIfmcjhi26iBGQMYk/nAemHuH3ORTcXefR+Kk7gxhMAgYk9G3ZW3VtbjloJochWTnS94ygkLDdU
 ejeUoobvO3LFDois6pwmLYpuLpOml0/kkoufQL4XM2CYpfPIay5uizZs6T+T3jeN3TC5qAQXwJP
 IUEiRmE2DEQwHdn9HEA==
X-Proofpoint-GUID: vufghGyj5GV5h24alGPbQ4AtJsSl4WqC
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a435c1e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CL0R8eYuxTG9Dar42d0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA0OSBTYWx0ZWRfX+ZBMcKgGW21W
 VGTQqQIjNWDYVJHwIXjMU76A9AKEjBYFXLDHGac9mJUFl7+xFVnSMxhjZ6S1gjhiwgeClQkJFOO
 9tm9VlMwlDN+yP4ObZFHjDn3FqyYhUY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115262-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 758146E0903

Add trace event support to the Qualcomm GENI I2C driver to enable
detailed runtime debugging and analysis.

The trace events capture I2C clock configuration, interrupt status
and error code and message.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 include/trace/events/qcom_geni_i2c.h | 82 ++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/include/trace/events/qcom_geni_i2c.h b/include/trace/events/qcom_geni_i2c.h
new file mode 100644
index 000000000000..c7e7984f3620
--- /dev/null
+++ b/include/trace/events/qcom_geni_i2c.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM qcom_geni_i2c
+
+#if !defined(_TRACE_QCOM_GENI_I2C_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_QCOM_GENI_I2C_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(geni_i2c_bus_setup,
+	    TP_PROTO(struct device *dev, u32 clk_freq, u8 clk_div,
+		     u8 t_high_cnt, u8 t_low_cnt, u8 t_cycle_cnt),
+	    TP_ARGS(dev, clk_freq, clk_div, t_high_cnt, t_low_cnt, t_cycle_cnt),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, clk_freq)
+			     __field(u8,  clk_div)
+			     __field(u8,  t_high_cnt)
+			     __field(u8,  t_low_cnt)
+			     __field(u8,  t_cycle_cnt)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->clk_freq   = clk_freq;
+			   __entry->clk_div    = clk_div;
+			   __entry->t_high_cnt = t_high_cnt;
+			   __entry->t_low_cnt  = t_low_cnt;
+			   __entry->t_cycle_cnt = t_cycle_cnt;
+	    ),
+
+	    TP_printk("%s: clk_freq=%u clk_div=%u t_high=%u t_low=%u t_cycle=%u",
+		      __get_str(name), __entry->clk_freq, __entry->clk_div,
+		      __entry->t_high_cnt, __entry->t_low_cnt,
+		      __entry->t_cycle_cnt)
+);
+
+TRACE_EVENT(geni_i2c_irq,
+	    TP_PROTO(struct device *dev, u32 m_stat, u32 rx_st,
+		     u32 dm_tx_st, u32 dm_rx_st),
+	    TP_ARGS(dev, m_stat, rx_st, dm_tx_st, dm_rx_st),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(u32, m_stat)
+			     __field(u32, rx_st)
+			     __field(u32, dm_tx_st)
+			     __field(u32, dm_rx_st)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->m_stat = m_stat;
+			   __entry->rx_st = rx_st;
+			   __entry->dm_tx_st = dm_tx_st;
+			   __entry->dm_rx_st = dm_rx_st;
+	    ),
+
+	    TP_printk("%s: m_stat=0x%08x rx_st=0x%08x dm_tx=0x%08x dm_rx=0x%08x",
+		      __get_str(name), __entry->m_stat, __entry->rx_st,
+		      __entry->dm_tx_st, __entry->dm_rx_st)
+);
+
+TRACE_EVENT(geni_i2c_err,
+	    TP_PROTO(struct device *dev, int err, const char *msg),
+	    TP_ARGS(dev, err, msg),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(int, err)
+			     __string(msg, msg)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->err = err;
+			   __assign_str(msg);
+	    ),
+
+	    TP_printk("%s: err=%d msg=%s",
+		      __get_str(name), __entry->err, __get_str(msg))
+);
+
+#endif /* _TRACE_QCOM_GENI_I2C_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>

-- 
2.34.1


