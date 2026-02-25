Return-Path: <linux-arm-msm+bounces-94142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LcMLPwOn2neYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:02:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C5A199248
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9048C304762A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5973D5243;
	Wed, 25 Feb 2026 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7vvOyJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HzH0kqRg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F533D5221
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031715; cv=none; b=rtaHf8vw5+iBjFDRWbR+1PD3KcAMTDqs4II5Eea/Vn8ZZWA9Hu5RYZ1hzzc3Vq/uQ5y6a5ahzc+h2jPw4Q0bH6KReirwpNTXa7ap8ZdZTBaxZL5+Z51tiXT/BOPWqp0KxPUVwueGLBWlfrW9SYakUZ2N831oymaDpE3x1mmKMzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031715; c=relaxed/simple;
	bh=ctsKjQ8pwXwqej/Qj+cFPJCHHMHgaW3LzO3MUBGDncA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tNujUdCr66hrhMYJcEL2AGZO5Ftdn5sFE6jVSX4Y3DAk6lNkwuWU44tNv1aZcv1orMlYle6xUXH9nEpx8slrXXFl0PA1os7blxbBaFSsQCr2vHMonNLojcLsEUIhd6Nhsz3qlgU/F8LmgOlHtp9hvHAK+aKB4vhyDGwlS65qHro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7vvOyJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HzH0kqRg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PB3EVs789059
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sy/C6mL1bqk
	mxcisFCIjaSDenP5o5m7Jb+jd871MGQc=; b=M7vvOyJTld3FbWIsdcu33IlWPUh
	PnOC16E2pQK3LhxnoEJ3FXmOIshq699K6JZ+Ni5EvsHUWARbRtVmZ3kTawYcTy2T
	8KC0qdxPQPEOW6ge4smn24f+UAzCY6so6Zikjc9+iijVQ+KoPCbFzy2phwT5cGWo
	88Oc4sb0p+r8S0hkkOMY63ig5AyX98gsfWs5MuESxcf8RbdRWjFWteIjgvQYChVv
	tQirDkjzIYgjHDiAqRoCgHEbhND6CkLn7DB57gFsiRB3HWXn53RV/HNXSuqsUpQr
	3Sdf8KVa022lMo0TzthYgVNiS68wxK/ZR4dbH20SciVrLRcUME2WYMqJmWQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyv9gktg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:01:50 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-679e73c3766so10682077eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772031710; x=1772636510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy/C6mL1bqkmxcisFCIjaSDenP5o5m7Jb+jd871MGQc=;
        b=HzH0kqRggpMmLHTPIrvYQZTi3Nl5XGj47kXEIZ2j4DbCjTDpk9R8cm+slMeH1pVRMr
         2JNFh8QSn+jtC7GFg4u1tDoMgfltNPwRgUc4z471Z6Vswt6OBSXvVJqH6ENxIl0KSlM9
         fQJTd+A1aDpBvYvOFItGc57qblFKWsAccJZoc/lzhJj03ETq+qXNAX2d4kzgKPQII0PP
         5TfwVq/QqYl99smVZe8wEerc47sfJhPZ143M0YqbxjfSWRkau3hWF3hTAOPys5nrkBp7
         uI/0Bgw3A8VoDR1SfDeohtz8ug/KaMs18lTGJR3ww+TGYzER6AWzLHfORWU+VapY9gsu
         bXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772031710; x=1772636510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sy/C6mL1bqkmxcisFCIjaSDenP5o5m7Jb+jd871MGQc=;
        b=iFbXe59m2diP8VPWFgQZ6sS1AwyRyvzEb95qFw0o5Ko5aEu0oS7P/QWOHwVD76tgdi
         /ZGgZ09oGv7kdbitXWt7fljvwTnvWJmVhso5I732jTL8pv9kx2EC49ek8PRcfqpFQhU0
         NwJyoGuvhYrek/38e35Y5eE0vrVlzF5dT9leNQ0u7vQlUFVnaqHyfPv1KHlR3EAA+mOs
         4xI8rLJLbi4GavQsXep6DdaJ+SZN1H6Za+M49POKgA/3PdYLRwhYJAlT9vak6m+EADlB
         35Nd7mlhpJze9y79Ib5Wye6x28jXjM+zHxlCMo4rIoD4GKmOhANJ03cZvDilkNtCap5o
         QvGA==
X-Forwarded-Encrypted: i=1; AJvYcCVRlBc5fzLOpT0HsoqdRBFWFJnJ3/tyxS0qanvR5x0cYsBUJhboYNaDuaV7PU+td+mPkHhtjNPAlBjDJbmT@vger.kernel.org
X-Gm-Message-State: AOJu0YyyWpPIKkP4lvr2zMIhJQYAM2zU+eIF4BWesEk1xqwJc6J1LHi9
	rNiTkjQDg4ojlJoOehyStgM3Wo0n+8F5Xcjw+B2XnfKqKt41ZhmQeXr2KIwo3JhuawkoobntDru
	STajXL3PEVEOC3RtkqsHDDOt4y2Kase9pD4WxYR/1e723sXR5z1wvjo3n2F8A7KxF1tUj
X-Gm-Gg: ATEYQzxinxB9HaosJZDaSgY+2CFdioae74PYDUMKxMSTU78UoaKcRZ396kE8q1iFqX7
	CJ7UY2O8m2d22Uft0y15fUu7mZGPTVya8Eol8XayGRMn8AJ33kJZDQF4CbPRUAdByfvjtJPhvqI
	sJczlHsA61+Jkr3TUA2B0ty2t7SBsJ7GL+3k3juyUEwx9F9xnXsQD1iz9iW5pHWo+1aCisdYcm4
	GJtWbX8vmrV6ebgzoVbWq8PZw4ViV8AydiyigfYZNpopx1qIr4+musg+p0r8D7i/vd0XCOobZCF
	NHYyBjU4yQ2IK9fvdQo46ArS+m9FAqWUNH0ZxHKuwbexywKHbqE88rkAuonG3wz8SkyseTpBpqx
	659rfI24CFI7FOFhDNrw7xCyGkV+6cDHwXOiN/pH8ybZK2lhig23i2BZtTHYQTk+AAuMqxBVqCW
	AVvS2ar9Eg03U=
X-Received: by 2002:a4a:ec4c:0:b0:672:5a31:709c with SMTP id 006d021491bc7-679e62c7be2mr1913213eaf.20.1772031708407;
        Wed, 25 Feb 2026 07:01:48 -0800 (PST)
X-Received: by 2002:a4a:ec4c:0:b0:672:5a31:709c with SMTP id 006d021491bc7-679e62c7be2mr1913147eaf.20.1772031706259;
        Wed, 25 Feb 2026 07:01:46 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:bd3f:a77b:995:768e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9a08edsm4306552a12.5.2026.02.25.07.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:01:45 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 4/5] media: qcom: camss: vfe-340: Proper client handling
Date: Wed, 25 Feb 2026 16:01:21 +0100
Message-Id: <20260225150122.766220-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
References: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -WEX8Nfx2qc_POwcbx76gBWm-3JFlOXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0NCBTYWx0ZWRfX1fxZL+GCniz3
 08mbwj6s0g+yoeGdfv5c8dv45weTjvtG0YSDJ5CfaFD1ekz5IB4fLZ0zAoI0HZ59hVPFpeYkrBv
 Rj2IjkmWdvuX6Wyq7lt74zlrzo5hc6w7YlbzVKxU/Y2oK10eR9zJQ79/gkR+QcVVHcKbfFTogw/
 8zVD5+tgiYyQaA+tB/xp+EIoBfIoOvdZwQOoKQK0LbmDiIpnkMJoVzYxaXcsMWyiT8Md5wjCVN2
 Ev3yyE05zi+YSxAYu4Holsxb1WWprAkxMiTe1FjkDS7nxkCb7sMU6tDDqt82yOKzqlHr1i1Xjdk
 NXLJrzDtJcH67QuYdH878JJZ2ziVS3/ru8zxLlvyGhF/w0HqKWgbgh7H2Ax6EJnqEJih7LpxyEk
 2B1Qjxokkqn7OTnVknT7XEvsDwUVamcQ73h4NHIQITntaxHnMva64lwtWa1+gRA0wD/r1COFRST
 jMbLCMVAxHxS9j1tWKw==
X-Authority-Analysis: v=2.4 cv=GZwaXAXL c=1 sm=1 tr=0 ts=699f0ede cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=h8qAYbA_W9CmfXd5NcUA:9
 a=SNiEU36zzXyr6W74:21 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: -WEX8Nfx2qc_POwcbx76gBWm-3JFlOXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94142-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57C5A199248
X-Rspamd-Action: no action

We need to properly map camss WM index to our internal WM client
instance. Today we only support RDI interfaces with the RDI_WM
macro, introduce a __wm_to_client helper to support any interface.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-vfe-340.c | 94 +++++++++++--------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 30d7630b3e8b..2f8205fa40a4 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -69,24 +69,19 @@
 #define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
 #define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
 
-/*
- * TODO: differentiate the port id based on requested type of RDI, BHIST etc
- *
- * TFE write master IDs (clients)
- *
- * BAYER		0
- * IDEAL_RAW		1
- * STATS_TINTLESS_BG	2
- * STATS_BHIST		3
- * STATS_AWB_BG		4
- * STATS_AEC_BG		5
- * STATS_BAF		6
- * RDI0			7
- * RDI1			8
- * RDI2			9
- */
-#define RDI_WM(n)		(7 + (n))
-#define TFE_WM_NUM		10
+enum tfe_client {
+	TFE_CLI_BAYER,
+	TFE_CLI_IDEAL_RAW,
+	TFE_CLI_STATS_TINTLESS_BG,
+	TFE_CLI_STATS_BHIST,
+	TFE_CLI_STATS_AWB_BG,
+	TFE_CLI_STATS_AEC_BG,
+	TFE_CLI_STATS_BAF,
+	TFE_CLI_RDI0,
+	TFE_CLI_RDI1,
+	TFE_CLI_RDI2,
+	TFE_CLI_NUM
+};
 
 enum tfe_iface {
 	TFE_IFACE_PIX,
@@ -108,6 +103,13 @@ enum tfe_subgroups {
 	TFE_SUBGROUP_NUM
 };
 
+static enum tfe_client tfe_wm_client_map[VFE_LINE_NUM_MAX] = {
+	[VFE_LINE_RDI0] = TFE_CLI_RDI0,
+	[VFE_LINE_RDI1] = TFE_CLI_RDI1,
+	[VFE_LINE_RDI2] = TFE_CLI_RDI2,
+	[VFE_LINE_PIX] = TFE_CLI_BAYER,
+};
+
 static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
 	[VFE_LINE_RDI0] = TFE_IFACE_RDI0,
 	[VFE_LINE_RDI1] = TFE_IFACE_RDI1,
@@ -126,6 +128,16 @@ static enum vfe_line_id tfe_subgroup_line_map[TFE_SUBGROUP_NUM] = {
 	[TFE_SUBGROUP_RDI2] = VFE_LINE_RDI2,
 };
 
+static inline enum tfe_client  __wm_to_client(u8 wm)
+{
+	if (wm >= ARRAY_SIZE(tfe_wm_client_map)) {
+		pr_warn("VFE: Invalid WM%u\n", wm);
+		return TFE_CLI_RDI0;
+	}
+
+	return tfe_wm_client_map[wm];
+}
+
 static inline enum tfe_iface  __line_to_iface(enum vfe_line_id line_id)
 {
 	if (line_id <= VFE_LINE_NONE || line_id >= VFE_LINE_NUM_MAX) {
@@ -209,10 +221,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	status = readl_relaxed(vfe->base + TFE_BUS_OVERFLOW_STATUS);
 	if (status) {
 		writel_relaxed(status, vfe->base + TFE_BUS_STATUS_CLEAR);
-		for (i = 0; i < TFE_WM_NUM; i++) {
+		for (i = 0; i < TFE_CLI_NUM; i++) {
 			if (status & BIT(i))
 				dev_err_ratelimited(vfe->camss->dev,
-						    "VFE%u: bus overflow for wm %u\n",
+						    "VFE%u: bus overflow for client %u\n",
 						    vfe->id, i);
 		}
 	}
@@ -235,49 +247,49 @@ static void vfe_enable_irq(struct vfe_device *vfe)
 	       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
 }
 
-static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 			  struct vfe_line *line)
 {
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
-	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(wm));
+	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
 }
 
-static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
 	/* Configuration for plain RDI frames */
-	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(wm));
-	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(wm));
-	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(wm));
-	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(wm));
-	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(wm));
+	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
 
 	/* No dropped frames, one irq per frame */
-	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(wm));
-	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(wm));
-	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(wm));
-	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(wm));
+	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
+	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(client));
+	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(client));
+	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(client));
 
 	vfe_enable_irq(vfe);
 
 	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
-	       vfe->base + TFE_BUS_CLIENT_CFG(wm));
+	       vfe->base + TFE_BUS_CLIENT_CFG(client));
 
-	dev_dbg(vfe->camss->dev, "VFE%u: Started RDI%u width %u height %u stride %u\n",
-		vfe->id, rdi, pix->width, pix->height, stride);
+	dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u height %u stride %u\n",
+		vfe->id, client, pix->width, pix->height, client);
 }
 
-static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
 {
-	u8 wm = RDI_WM(rdi);
+	u8 client = __wm_to_client(wm);
 
-	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(wm));
+	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(client));
 
-	dev_dbg(vfe->camss->dev, "VFE%u: Stopped RDI%u\n", vfe->id, rdi);
+	dev_dbg(vfe->camss->dev, "VFE%u: Stopped client %u\n", vfe->id, client);
 }
 
 static const struct camss_video_ops vfe_video_ops_520 = {
-- 
2.34.1


