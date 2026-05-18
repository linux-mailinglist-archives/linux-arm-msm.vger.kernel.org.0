Return-Path: <linux-arm-msm+bounces-108246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFW0HyJHC2rgFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:06:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FE8571686
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4A9230ACB28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A85358363;
	Mon, 18 May 2026 17:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5/5j4A2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FF0TuSKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77D535BDA4
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123672; cv=none; b=rsqkPdHWDz2TY64k5ucS9eWlto1L38HcipeOA/z6dBMZuany2W+n1m4q8XCmkpscjG9ouTl3vVYkUk9LGvT5aATvtqjYu9dpeR60pT9Af92REdbOoQy3slRCo6yHPWN1KmiVymesEGbyNRVJU28anVhbvcPs43K4IBd5UcdWIS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123672; c=relaxed/simple;
	bh=/wGIaUhBxlSuewsn/cKPbyPBkGIrIlpdsbtD3XVrlQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MfTTTeFzs4Pv2yCdpCtsUOt6qFYAn/ED7/ptDdrKVlfTDNFpyudPlRAR4PlLqK78AvkkLnlJk1E3UZRGCxrPIiO+SZyx6RxTZ0/j3s0CgDP4UYtVHE/XgCJoJV5Ea6vuarfRTBx4RrgXXuWUm2R0prZZlPpaQP3d59N04/wmHsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5/5j4A2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FF0TuSKH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IDhekD353004
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uot5zVHiOWvQW+9qfq21wfXkU0gBHqKnmGA97D8OoaI=; b=D5/5j4A2ar1qkS8C
	kgbVnKtLC/07YjIOXvlYKS2iJzQWvj3VHwuDScWrcp4fQGxNqTXENzsBphgKazch
	BecJRDEt0vOZ8xmTGmO7SUrKmWbQlUGA8Hl7AtToIrbURXPBH+Bh2SE1r5Y3Jcpo
	keYzLUlxjNXnNcTv7A1FMFYaCPjPywWmPtwAljME0YWZyuGAq410q/XWRSmFgd4y
	a4xraVl8y+4I6zVakN5rpFw/UZvpWuqr4YOUoG57mYWqe397FUPc8mNwK/45XJWb
	7t9NRBh6E3Qzmnhb4v4opLPDTKTYGdZp72BIx+eQx3vRdd1OnyvKWnBBVx3I2hsD
	w0lFiw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xjaj8f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:01:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3692f395339so2544794a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779123669; x=1779728469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uot5zVHiOWvQW+9qfq21wfXkU0gBHqKnmGA97D8OoaI=;
        b=FF0TuSKHr2CWhSU6ou7dYsgEjKu/Fb4dJfMscDh9EXWtVCQ12pRoLq/a4ewN9LrJY4
         W9HKnr6YZ2sa4v+bzyng/yKLXdFtaCU6xp7eiLsA0eZ7XAy/kcNoOeu8wnwYw7aUkM1k
         /WitkX3RwjpL0cJXypyTsyGrCSKSQAurlOn9m8ncmruIarrLZC0WVYvbmiwvX4dX2ZUO
         XfMJeh/gt+F6EWoKPepuZF1uJmYbbwV2Lgt1tCni6lJWI35K5w/mEY7BFNVbuJoOLSeU
         SW71yTzp4WDXbNZ9eA4Urn9KQG9GZLdwGdWq0UhW/OEWFccmm4q8NGo1/Mb9OtFaQl/2
         QP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123669; x=1779728469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uot5zVHiOWvQW+9qfq21wfXkU0gBHqKnmGA97D8OoaI=;
        b=LcaScwnNk5SGToyZA+n+a86KaKNClCNSONPWFSWihHeqyq11fp4IEo1enGYeanxG5J
         OXpX6uRANlSARx5mVV8hw9sYuwt/j2Z1k/JBNupKTiqGP8ay1zDxcMBvnTr51jsVTFtE
         /Uq3pymP4tO2qvZIZ2p/sD17dwoIGqvwdPzJWDXRkxTQ/v+/xZpHinNxRYbv1sEGXP3p
         XsDnLpEu6LgukBWShJWsu6NRLuxQoQctFHP7rlJPiOMISnEo4g8L6weDHDcqSqDRmXyP
         J9TZNOfAb9MGLiwCVcxANzP/r0BVTQgNqc/nglNTYy4ixvg7/In1bNPll672Au4y4tqG
         Aoig==
X-Forwarded-Encrypted: i=1; AFNElJ+q2rdBtwB+S7uy4aTykninK3gWQtz50PASR7EjIkpwSkKei5ViH0r0vzmo/cGBoDLT0PahYIIMWDPxgDzh@vger.kernel.org
X-Gm-Message-State: AOJu0YwjqQhE6S7Jw9Wu2hl4ujTiAiq+rg+qzf58N4uoFVug6QrfO/ow
	jPZdMffVz71KZ2koYvNOrVsLINeF+Dmhc3Kewe4q9lkqLtu3e8+u/rcLWmKMu0toA2Ai7/nyeOc
	+YkgSLJi9sF64yPpkjTJVLevQ7OaP6kCESNpCDpgE+aDgRrtb6RucvRE4o/FeDYH3I3qe
X-Gm-Gg: Acq92OFsS+xicLhMe4nj87R4DXRuhuyhI/ZpLvJc/bPeImH7HIFmIYLF6ax9j/Hi38S
	ymZtISzV15HGwMAHhSZ0/IrATw8frdOMfH7TEf0IZyqRTj4CDww4ifJowZdUMpgSrThDG8ufKa8
	/NJREkRkkKsAQrMvSyjRY124TvBNQ3mZ2Jol6is4wtNJokdbPvzMh9EKbtwltYH06RVE1Iv4oYI
	krqJB1AJMF2mQSvPfK5XafApq050YQu7TYui7j5nIn8lmcis3CUQgs4xZYtJFtF1UQQs1NFwnPu
	MuuseTsGJjv4U8OekIfpznTvzcG0CqnUUuO77/4DsqoGSn4Ji4ljhDsRGt9fCrD8lbVpv96cxEP
	n9KpJOMs/8G7C6gjWZstut+84aVPrCjXKmiTMKKHUs4yy3MQ6TPXZPAs=
X-Received: by 2002:a17:90b:2549:b0:368:ac5f:d31b with SMTP id 98e67ed59e1d1-36951b8708amr14660942a91.24.1779123668798;
        Mon, 18 May 2026 10:01:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2549:b0:368:ac5f:d31b with SMTP id 98e67ed59e1d1-36951b8708amr14660849a91.24.1779123668005;
        Mon, 18 May 2026 10:01:08 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695652466dsm5783808a91.0.2026.05.18.10.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:01:07 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:30:51 +0530
Subject: [PATCH v3 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-add-tracepoints-for-qcom-geni-spi-v3-1-7928f6810a79@oss.qualcomm.com>
References: <20260518-add-tracepoints-for-qcom-geni-spi-v3-0-7928f6810a79@oss.qualcomm.com>
In-Reply-To: <20260518-add-tracepoints-for-qcom-geni-spi-v3-0-7928f6810a79@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779123658; l=4219;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=/wGIaUhBxlSuewsn/cKPbyPBkGIrIlpdsbtD3XVrlQc=;
 b=YPm1dG8N41CJijQOOCeBCx1LBG3qYiuz/AhsTBIFw62sYrX8POoGPOnnJ7Kdp19uB+CpbB3oJ
 GgETwGffEydAO3r0mUCdbKG12iAHNOiLcVVbFctRhNyHcWlrjBaO2xc
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NiBTYWx0ZWRfXyTwxorQDx2hb
 iYhYArlXOqVVx9ArCZCo0DPgdfAX5e8vPU8Inn4ridvdksD45TmakCFD8FU6UrxODRX3XDSJaTt
 Q+MKuiAbN7ftSgzdM3oiZWJjofX9366a1XUN0qLf+MRwV5b3GDotOtu4EzKW8W6B67ShqIGg9qI
 S9crjPD0iz2vrAS9Z8eEjBKFRMQM/2l2NNgoihf8torQUz3Ouxs9NzFws29JTFl1fHlooYRlObs
 WAetMoIqYgjy5+zN/b/oTCq+iCHYabCKHCngy4NzbWKoDaSNDjKj9GvdZO0ccewn0ahyiWz6aEU
 DujRPhWnAjX/ed2DGHV1H9wYK07O/CBLBlzC8WGlGqz58wkUIQy5rvP/Ib9pJkGBdZy/dNBdkkB
 Qwya2C/3CY6/F1TEB7i0F634huOo+I0boXww0gKUTWQ2vNO1kHKNspgxbZsXvFukztmOtwNcqtO
 qgUZ9pYnaf86ICHEsCQ==
X-Authority-Analysis: v=2.4 cv=BYHoFLt2 c=1 sm=1 tr=0 ts=6a0b45d5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=niy05HpUbDCNYMLfpPAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 8nviOkU8O0FQHccjlupuCKjZDr_Mtm-a
X-Proofpoint-GUID: 8nviOkU8O0FQHccjlupuCKjZDr_Mtm-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180166
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108246-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9FE8571686
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add tracepoint support to the Qualcomm GENI SPI driver to provide
runtime visibility into driver behavior without requiring invasive debug
patches.

The trace events cover clock and setup parameter configuration,
transfer metadata, interrupt status to be making it easier to diagnose
communication issues in the field..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v2->v3:
- Renamed geni_spi_fifo_params to geni_spi_setup_params trace event.
- Updated commit text.

v1->v2:
- Removed TX/RX data tracepoints.
- Updated commit text.
---
 include/trace/events/qcom_geni_spi.h | 103 +++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/include/trace/events/qcom_geni_spi.h b/include/trace/events/qcom_geni_spi.h
new file mode 100644
index 000000000000..6d027adf2e1d
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
+TRACE_EVENT(geni_spi_setup_params,
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


