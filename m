Return-Path: <linux-arm-msm+bounces-90705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLkoOGqWeGnmrAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:41:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8417D92F80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E25BC30484FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C8E342177;
	Tue, 27 Jan 2026 10:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Na9TLvCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jo6PZj5o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFB2341ADF
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510358; cv=none; b=PiHRfrrJQNgLKgRYSc+9/z2ISfwdTzuNLvejqTYz7Mdeh6DiROg1abgp/xLxAjmnseTQ1m4VazZET7MDp5rKtQxp2mFZkzgMhdLrnNDt/LZfbOFLB19Zve3381lH9z+fz/dzhq/K9vIOLxEgY+QFCpEklr49kPRwucV9FHATHvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510358; c=relaxed/simple;
	bh=cxJ4VdcrQIdBaduDp5qis7qeARGaQBXQeXY7fhETlLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1R4euuvIQFRqvoOww+qF4GeyhBjUvFzdTi8KtyH5fMwCh640/ypZQ9MuSIL0tfgC9R1KrgMNcl3VC7xXznQ1lLgWzunP6TMgHhQ9nPU2LXLCcbT//t6BE3ps37UfTPPnhaizkYVoJ0Nd6r4ynrRInqF+Z24G+1uECxvF0IbOSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Na9TLvCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jo6PZj5o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAHwAd1269328
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ts3+BFe71LMpdymqrw7oEWcom1uBiKsmeMjJ1+uDeGQ=; b=Na9TLvCvuCS/LgF5
	QX3+W1whozlgKoVrdxTu/VGeqd3BAhFTrLFjBBeTq2lP9IMvYFe/8zhqV65qfPMQ
	CpjbXPKpGvtFcN5/Htk7Cws12KZIIBAKBQPyqIPpzZmLRY4w8pjmSpCQlOi7iz56
	omICC7qRiWtZqybeVKjNQFxWfqP/qRnZyqOQx6gHeIDSzgyy6x+7Yjq+ZIGYFtLq
	9wQkZHJvXeN6sj6IcJATbDS8eY8EJk9Tlum7cAqMKNF0XVbkjMa+G2Lbimn0pXQe
	vfVhN4eecYY7qndwad78lt2I+f3WGrtVsMNxJGCjN4HQ3RLD6JNJJH1c1LJEtzQR
	CEVVTw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyasbfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:39:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a07fa318fdso49402185ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769510355; x=1770115155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ts3+BFe71LMpdymqrw7oEWcom1uBiKsmeMjJ1+uDeGQ=;
        b=Jo6PZj5ooNIc/LOR5nTkw7YQ/Pdyz7ibJOPAtodaC8NYOxVpPyfMKfppGDQnuqL9I6
         cl/71hel9SVcYvPQfO7M4nFJSzOjulGcYuVM3QxEiXVChUoqJD6Dmxjgb6vsWGq5A3CQ
         dJdNCg9mFYnSZZsF9opKPds8FW8n1Iu/F9GxJLeTJz4RhnffG347+zB5re1P8Jp0sBso
         Kf/ZU/RKKT0gk9hiRcD8mC2RJXF16mg80MztvmeNHTMglWohJ+kstmki/uRaiGvrpGQz
         AhHL0SvxA/3D0h25wdB9skXSkSE973amS2yFclYiBy6j6Gm/zyH/IDf4Fliy0lvHpNdf
         T8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510355; x=1770115155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ts3+BFe71LMpdymqrw7oEWcom1uBiKsmeMjJ1+uDeGQ=;
        b=L2l7LgGr3ni4qcHuIMzpbIB1nl131KdAqTvaTsd+8fGgnGtJvIDcR/2Ff3gBGocmJD
         8X2mdcNEQ5rOnubAPn0ZHrqdfgi+D3TNzKSw71zcj+HJaJSvfBkSgkB1lp3Dj0A5W4pb
         aE0TXEza6v/0TYfgv0lwxH5gOb6bxu7KpoFmYK6JkOpM30hZv+S2dcTwx6O4NC8kd73z
         Zm/IGb6ybTYVZRzZsO2lmEnxQr/Jsy0viJBGaOrXJgxb5RvdrxAwIG32oArbxMdxoEF9
         J16G3svHXz/F2VAK4Fo54pAwQ/ctKweXlaoJcdTjc8YOnO9oW01j6rsomj8sc0ju7k1z
         zTgA==
X-Gm-Message-State: AOJu0Yxw+m+Bs6FIaTOvHBJtg8sro5+boj6Ubt5e5L28gRZj55nopLS1
	xs5P2RLb+SuqoT8YwlBJK3lS++ZNI7gOz4CVJR6Ig+zakhH0UioyrOeUJZ5DA89TWokerXdcI9n
	4iSYf7+LeX8tPdmu7hjI7hkbWRaaFmglPdgOvxH012hs1zI9PKLj4VyznJW8Z3T6aI3NL
X-Gm-Gg: AZuq6aLYIHowO2gq5q+KxgyLHbQO/jJBs4u5v4obPQu0ZpaDoaCyp4JXHaYDLxL0XMa
	J/JEjhxoc+8sgn8pCZ5ns+xqsjGOtHiz+JEISx8N8m1WN+Z+OQplfL5xDRUVpnWF6hhpR4gHxFQ
	1qOHdNwQT3Tp8CjpCgKzrfHC0KaWqTXgPpnWKndShZsQP0SMKqCqunpWQBnyUoFlu4iAQhJ3XPn
	b715jsoNgD6+0Qo4oyqcCa2u7H1H8ZA035Uv7uaEH4/PhhW827dYyjL5V+2CIESyNI6Dy1HUtbc
	a308jH/oeR2Q8+xMyzBI8WlT/Aepp7Nb0UB/liBB6VPR4ouQl3pILx4GVoSjclbFXUyQK2dN5v1
	JNPqv1QCDkvNgu9Kc6u1MNyCNJdFbOcXfI+m569Q=
X-Received: by 2002:a17:902:ceca:b0:2a1:35df:2513 with SMTP id d9443c01a7336-2a870d613bfmr15373925ad.17.1769510354620;
        Tue, 27 Jan 2026 02:39:14 -0800 (PST)
X-Received: by 2002:a17:902:ceca:b0:2a1:35df:2513 with SMTP id d9443c01a7336-2a870d613bfmr15373645ad.17.1769510354158;
        Tue, 27 Jan 2026 02:39:14 -0800 (PST)
Received: from hu-deesin-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa782sm113957055ad.5.2026.01.27.02.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 02:39:13 -0800 (PST)
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 16:08:46 +0530
Subject: [PATCH v3 2/2] soc: qcom: smp2p: Add support for smp2p v2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-smp2pv2-v3-2-4060b859b1e2@oss.qualcomm.com>
References: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
In-Reply-To: <20260127-smp2pv2-v3-0-4060b859b1e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-remoteproc@vger.kernel.org,
        Chris Lew <chris.lew@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769510346; l=4477;
 i=deepak.singh@oss.qualcomm.com; s=20260127; h=from:subject:message-id;
 bh=0kmo34xgxtd3p7aNtS9qS/h5rGxQvbqqlAEE/tk0JjE=;
 b=VVxpYh1Dl9gTy16I6UhRuCAr1U065E8b1tjpwNv9fx7EAp1lV+g9Q0Wc/jFAFADZxHVORWvjA
 drROdLhD8QeC5voiGuXT+f7gEUPaTRDN4Cpo87tNekt+tmABjTKrYaG
X-Developer-Key: i=deepak.singh@oss.qualcomm.com; a=ed25519;
 pk=fVTLtknRa0voM2B2QT8dD1HmvNdAnw5PY0XmwOE0ldU=
X-Proofpoint-GUID: xVi8qmuq6sy1f7whGn5mTWmSxydf-tg5
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=697895d3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fmVGlCcVQYp_hzYLufIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: xVi8qmuq6sy1f7whGn5mTWmSxydf-tg5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NyBTYWx0ZWRfX24P1uwzQ9qxu
 fpJNcYxmENVN+gy/woXrpRZWnm4XwMroKAFd8U0Tws7MedI2HyvNZrB9qh4Em89q9guIYPZlEOF
 pZ8dN6LxTZiMh/YdzMVjdZ72Ime0W8LpbqzkhhMyyes6vZ21Nuu6Vna5ymNkvhGUYGNbkqZGPoH
 T/VfrGbGu4oFVEvEjctSglV8FMhWIzuZP+F+e0mVw0eH5Yu8Cn+G7j+NkNscaKZ3zv5sEJAqTwn
 dWbP3/TiPj8F/hF221jIpT3ZYP75OB1mCR1nvlGy/CEabnlr35Ypv+wSvEQ1utT9lmpzy6lGmf4
 l9qNsMjnCGV3My1k7MM1vHOy9oJgpGZP+QthEO1l64kLF7yOwgkhUjEXF9wmVjW89d4RsQleiHU
 U+X3Vcyg6meW3W8sYLUQSM5HaTXyuvHN6un5ZgwKbOBNOLwXoJ+wQcdOsmiP9UjrDSEhkD4K/20
 gHjWoaGU/MVp6uDkBLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1011 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90705-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[deepak.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8417D92F80
X-Rspamd-Action: no action

From: Chris Lew <chris.lew@oss.qualcomm.com>

smp2p v2 adds support for allowing remote processors to write outbound
smp2p items without completing the feature negotiation. This is required
for processors that start before linux to write out signals like error
and clock ready and unblock their bootup.

If a remote processor only supports v1, smp2p can version down by
mirroring the peer version during the negotiation stage.

When using smp2p version 2, the remote does not wait for the ssr ack
before setting the items. To accommodate this, set the last_value of all
the entries to 0 when SSR is detected. This forces smp2p to detect the
new values written by the remote. Because the SSR ack is skipped, the
down transition of bits is missed in smp2p version 2.

Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
---
 drivers/soc/qcom/smp2p.c | 48 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index c27ffb44b825..af0ceeaf6e07 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -36,6 +36,10 @@
  * The driver uses the Linux GPIO and interrupt framework to expose a virtual
  * GPIO for each outbound entry and a virtual interrupt controller for each
  * inbound entry.
+ *
+ * V2 of SMP2P allows remote processors to write to outbound smp2p items before
+ * the full smp2p connection is negotiated. This is important for processors
+ * started before linux runs.
  */
 
 #define SMP2P_MAX_ENTRY 16
@@ -47,11 +51,12 @@
 
 #define SMP2P_MAGIC 0x504d5324
 #define SMP2P_ALL_FEATURES	SMP2P_FEATURE_SSR_ACK
+#define MAX_VERSION 2
 
 /**
  * struct smp2p_smem_item - in memory communication structure
  * @magic:		magic number
- * @version:		version - must be 1
+ * @version:		version
  * @features:		features flag - currently unused
  * @local_pid:		processor id of sending end
  * @remote_pid:		processor id of receiving end
@@ -180,14 +185,22 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
 static bool qcom_smp2p_check_ssr(struct qcom_smp2p *smp2p)
 {
 	struct smp2p_smem_item *in = smp2p->in;
+	struct smp2p_entry *entry;
+	bool restart_done;
 	bool restart;
 
 	if (!smp2p->ssr_ack_enabled)
 		return false;
 
-	restart = in->flags & BIT(SMP2P_FLAGS_RESTART_DONE_BIT);
+	restart_done = in->flags & BIT(SMP2P_FLAGS_RESTART_DONE_BIT);
+	restart = restart_done != smp2p->ssr_ack;
+	list_for_each_entry(entry, &smp2p->inbound, node) {
+		if (!entry->value)
+			continue;
+		entry->last_value = 0;
+	}
 
-	return restart != smp2p->ssr_ack;
+	return restart;
 }
 
 static void qcom_smp2p_do_ssr_ack(struct qcom_smp2p *smp2p)
@@ -219,9 +232,26 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
 
 		smp2p->negotiation_done = true;
 		trace_smp2p_negotiate(smp2p->dev, out->features);
+	} else if (in->version && in->version < out->version) {
+		out->version = in->version;
+		qcom_smp2p_kick(smp2p);
 	}
 }
 
+static int qcom_smp2p_in_version(struct qcom_smp2p *smp2p)
+{
+	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
+	unsigned int pid = smp2p->remote_pid;
+	struct smp2p_smem_item *in;
+	size_t size;
+
+	in = qcom_smem_get(pid, smem_id, &size);
+	if (IS_ERR(in))
+		return 0;
+
+	return in->version;
+}
+
 static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
 {
 	unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
@@ -516,6 +546,7 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
 	struct smp2p_smem_item *out;
 	unsigned smem_id = smp2p->smem_items[SMP2P_OUTBOUND];
 	unsigned pid = smp2p->remote_pid;
+	u8 in_version;
 	int ret;
 
 	ret = qcom_smem_alloc(pid, smem_id, sizeof(*out));
@@ -537,12 +568,21 @@ static int qcom_smp2p_alloc_outbound_item(struct qcom_smp2p *smp2p)
 	out->valid_entries = 0;
 	out->features = SMP2P_ALL_FEATURES;
 
+	in_version = qcom_smp2p_in_version(smp2p);
+	if (in_version > MAX_VERSION) {
+		dev_err(smp2p->dev, "Unsupported smp2p version %d\n", in_version);
+		return -EINVAL;
+	}
+
 	/*
 	 * Make sure the rest of the header is written before we validate the
 	 * item by writing a valid version number.
 	 */
 	wmb();
-	out->version = 1;
+	if (in_version && in_version <= 2)
+		out->version = in_version;
+	else
+		out->version = 2;
 
 	qcom_smp2p_kick(smp2p);
 

-- 
2.34.1


