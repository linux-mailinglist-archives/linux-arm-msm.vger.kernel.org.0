Return-Path: <linux-arm-msm+bounces-106175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OElFHx7+2n0bgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:33:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9D34DEE3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9FC1307317B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B6E48BD58;
	Wed,  6 May 2026 17:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KWs6V9lH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QyvP5pcN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACA23ED5C3
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778088598; cv=none; b=bTmfbDp1P5vJ3dUV/rahEM0TlmdYrsepcn7ifJv6NKREaRjrh83VhkRmJKkCxNPQtYdMhPG13HnGotNGzRYxyS8SeAuB+wtpfa4AyMdvKb4ltVurUtA/hRvd/TLDRsJQ/6LBz2JVLsJn+OPffcgMLkXeAzeO99wcGjKpHFwv3d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778088598; c=relaxed/simple;
	bh=u3bJeT3eDVmlNrUBwxjO996p7ZSnVqK4Iw+5gr5vR20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kqKgGO0QWFcWAa696+Epk3mSulhyPLKG+BoBE6eugJctgiUVlgNzYYMRoW28jZmmRBro4XHLaXrgTa6bq3IFwU4kO7OQGIFVZHGrip+cRVba1W6+IvTsRH6zczlvpa5zSaBhd+EW8JM8wOfgB2E1b0J+EcIs4z2QFisRcs6qSqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWs6V9lH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QyvP5pcN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646DCKNY1527743
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NdAyBwaa85FOCAnUpY3giPygT8RfYNiQT75Hl2udw94=; b=KWs6V9lHOkExU3DT
	U9pOClt4EElte/pNh2n+5Mfwwka+aDxBJi7jKQpuan6NLHZe3z1I79AdBhGRtmrV
	p0frV6mCH0eudz3WSlVgYKIpS8IHDPQ3zguWE2DMSUhFMdPuUGbzG32o41R6cpwk
	QJm4NjpDIvgXg8+kWE27zo0IVUrSEYCEwm87GJaS5h3L3GXFwSA1/sG41zNiK0I5
	l+L1gVK3WGK1/JeuNOfrLnj/cyKAIx/Ro66aG8ogFFoseYKvne0x6p1LL7khY3MJ
	u8gYJW8eS/nNSLYC9DE7TTMv0PXAYbmWVQDBM0/MqFE74+Dwg23OZw5HW/TQ4mIF
	R5rq6A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0128ad2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:29:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-364ef32a758so10552098a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778088595; x=1778693395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdAyBwaa85FOCAnUpY3giPygT8RfYNiQT75Hl2udw94=;
        b=QyvP5pcNNbw5GGbxRkScwo2+AlXP1bMnnQPx1UBlbWMrJ9YAhRbPnZa6l3v9oHO88m
         yZssT+w9tiL5ABmToLqFZbymlk0XDMf98nZOucxo7G6hnbW5HIYzMNQwV2KxTBOKf6t0
         2ZjXypymMwe4HDE6hq0jK0er5737osxOGyefjMbHrdzZmk+Rg1drwBQ/W+RklyCOjIye
         RNa4qNe9bqpT4CCl5TKS0gIxyWLkOItJI091joUtQBep50bj9ots8MG6AFKA+Fzke50O
         DjYpOamaMbBFU9lM3dun6Bs6kdxXwr0IhqQqb56jksB6ZGuDNBZI4chZE5DxViUyvIGg
         rdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778088595; x=1778693395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NdAyBwaa85FOCAnUpY3giPygT8RfYNiQT75Hl2udw94=;
        b=auPq0rKbfW0Rygutxrugr4yIDgX93PetGB86SY68m9jqSHTVldz+yxazFknZ1JEInR
         RejtC9+yMydkY17PSijweRjUp/aNVaRv7Sg+/vhS/ujVPQUcjHYlrRKpKLn+qAxy+2GJ
         bPRH2FcgIM04JmnmC9Ck/uecQTAHrgraSfkS6ACokLtC3dOsN2ixWt3KLszRUYIfdfdh
         Ws88Ug4j35teTshkpyEnUUqMJYQ4YcaWQHv7DYDz9LBL4MiSCgycSnNULQl4E5CWKMiB
         4rh9zmbAOBaHAoJ+1rXvy2wOkZdy9cHw5ai6B5u6slX9EiYTI/2QbtZsqiYx4J2qfoHj
         2p9Q==
X-Forwarded-Encrypted: i=1; AFNElJ813DLBZRgPs38eW9wcpoYx2uCbrtVvMmSFcWfr+43StI9c97AzomPP4YWq03x7aWjLGi57k6P7yrTT5Axf@vger.kernel.org
X-Gm-Message-State: AOJu0YynSSRxUZor/J6E2YJWi0INyV7cOsv7Q4bp3CJMQqmSmD8LwVi2
	lsPHDwzhn9uGyy/4kukqB5P4zL8wER/lgIm6vgHeQXIfXY+gLGE1GXn0A+ovXBtJZJ3Fhlu42wy
	na8H3HwfRhPJ/QIDyJQQ1dgCqccawF2jV5060+BRGpsqM9dodF4ZYdw9Cy4qHXOZTZ0LC
X-Gm-Gg: AeBDieuoGuP+kKozMYzCZt0jD3fCyvcxXLd8wH95iwAktDGoolBpR5zpj54PcNYE9Sg
	8dE37bQXeDdpz2m2zDRvvHBt5TVNv9mnb7VSneOareD6a5OdYNfw1rWp8EsUk8turT8X2C1Gs9W
	rzT3iw5i8fGIv5gtZt0drtEzJbLgPqzkOOn3QanxWNQoyF7FqzVj/sEuzztoOqL/brKuMSwnVMH
	HhpmJZszHDIEfUeSC+koLOZQftFzkBNyMVX9eu5uVapNmY8m5KQGZykmh5DqAQK+sqjyGFGWpay
	krFxfLEIgOUMur2RNqyFsVZz+oRfcgWmEqNBcW7QLfv/VJyv3kIndRUIpaNlu36/0qoO0uXJaKJ
	Zf8tSqfnWKPAVr/JfWCLpqP6pN9WL24GCV2JcwaUyAMLtPn/IRjBIOSjGaLzMJQbKsQ==
X-Received: by 2002:a17:90b:5683:b0:361:45df:f5 with SMTP id 98e67ed59e1d1-365abe8a5b2mr4800227a91.16.1778088595131;
        Wed, 06 May 2026 10:29:55 -0700 (PDT)
X-Received: by 2002:a17:90b:5683:b0:361:45df:f5 with SMTP id 98e67ed59e1d1-365abe8a5b2mr4800196a91.16.1778088594566;
        Wed, 06 May 2026 10:29:54 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365c25f8cf9sm3370143a91.4.2026.05.06.10.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:29:53 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Wed, 06 May 2026 22:59:42 +0530
Subject: [PATCH v1 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-add-tracepoints-for-qcom-geni-spi-v1-1-c957cfe712d1@oss.qualcomm.com>
References: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
In-Reply-To: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        "Mukesh Kumar Savaliya mukesh.savaliya"@oss.qualcomm.com,
        "Aniket Randive aniket.randive"@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778088585; l=5434;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=u3bJeT3eDVmlNrUBwxjO996p7ZSnVqK4Iw+5gr5vR20=;
 b=di6BH35HrTFhQUZWuiJyNXlNW/guEVk92mbrMTwu+l0/jOJy2pM9BkL55nWXQGJWNvd4Im9Vg
 A+wduBf3ZftAhxC7CRwNeG6TNY+7P3LOVd1dZf+6LkkpAZPg5mJi0u3
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: BMikNet-RQtNUyq3IBWVQ4pYFGeIY_-H
X-Proofpoint-ORIG-GUID: BMikNet-RQtNUyq3IBWVQ4pYFGeIY_-H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE3MCBTYWx0ZWRfXzNyXlcG5/DT+
 rKZaqGCGFy8WnhR+0D3jdQVI6YqKsxG/yX6mdWWikKtT3zbhy5d1m3+9oIdoXkNkyvAja/Ufj+M
 tLUI5Znlh22knpMWygS4tCke6JzlP613r6+7YMRT4W/KI6xhX75MoAQSJWhCeAuAvAwkGOxs4pS
 HrfnSDj9moujXhezTY+bYWx8AHAIJX9dqBy5xpzew5h5JxKA94scphPtID2e5BNATWrYekDlPMI
 9b4X9YZPjM/bk5WzlPdbVIZ0/Cq10P7u/rqCnvnZQQ6k8ou5lqVtVYY7v1O2bXXYPB+M06HACpm
 gPBbX/bkAXIz3oL10NA8lILBVdduUiTA/OoDe6DVQNnUJazbieZdpGEX0XXKneJtk/9ML/E6JzN
 eENKl24S0YD6XhTiapnGtHgQ1kY9GS8VapjTYlzmVdECwAq6efHUbgqafX1ovOuYDZukSemKt35
 V71Ib8a6HLrB4Wa+xjg==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fb7a94 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=T3KqLDxVtFGtYd1-cMQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060170
X-Rspamd-Queue-Id: AF9D34DEE3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-106175-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add tracepoint support to the Qualcomm GENI SPI driver to provide
runtime visibility into driver behavior without requiring invasive debug
patches.

The trace events cover clock and FIFO parameter configuration,
transfer metadata, interrupt status, and optional TX/RX payload dumps
to be making it easier to diagnose communication issues in the field..

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 include/trace/events/qcom_geni_spi.h | 147 +++++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/include/trace/events/qcom_geni_spi.h b/include/trace/events/qcom_geni_spi.h
new file mode 100644
index 000000000000..a2e6ff9df520
--- /dev/null
+++ b/include/trace/events/qcom_geni_spi.h
@@ -0,0 +1,147 @@
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
+TRACE_EVENT(geni_spi_tx_data,
+	    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len,
+		     unsigned int tx_rem),
+	    TP_ARGS(dev, buf, len, tx_rem),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(unsigned int, len)
+			     __field(unsigned int, tx_rem)
+			     __dynamic_array(u8, data, len)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->len = len;
+			   __entry->tx_rem = tx_rem;
+			   memcpy(__get_dynamic_array(data), buf, len);
+	    ),
+
+	    TP_printk("%s: tx_len=%u tx_rem=%u data=%s",
+		      __get_str(name), __entry->len, __entry->tx_rem,
+		      __print_hex(__get_dynamic_array(data), __entry->len))
+);
+
+TRACE_EVENT(geni_spi_rx_data,
+	    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len,
+		     unsigned int rx_rem),
+	    TP_ARGS(dev, buf, len, rx_rem),
+
+	    TP_STRUCT__entry(__string(name, dev_name(dev))
+			     __field(unsigned int, len)
+			     __field(unsigned int, rx_rem)
+			     __dynamic_array(u8, data, len)
+	    ),
+
+	    TP_fast_assign(__assign_str(name);
+			   __entry->len = len;
+			   __entry->rx_rem = rx_rem;
+			   memcpy(__get_dynamic_array(data), buf, len);
+	    ),
+
+	    TP_printk("%s: rx_len=%u rx_rem=%u data=%s",
+		      __get_str(name), __entry->len, __entry->rx_rem,
+		      __print_hex(__get_dynamic_array(data), __entry->len))
+);
+
+#endif /* _TRACE_QCOM_GENI_SPI_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>

-- 
2.34.1


