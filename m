Return-Path: <linux-arm-msm+bounces-93756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCjJABWYnGluJgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:10:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36E17B4D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B33BE303BCD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4273533D4F9;
	Mon, 23 Feb 2026 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3UKlMMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpgfWJMV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C638733D514
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870087; cv=none; b=VwesP/eur6dlO5XUZ5nxRRU7eD/kx1NlFGzLgaGoCbVU9M2aXam5cFpZKMArH/GOKUeeTqagxiXOfo0/seADhPaQ7D47d3KILhU3i3Z1ujMU5Ow1Y2TGs3CSp5JWnlus1Ut+vM/xukaUA7e2PoYno5o3dB4BsxK/50DZT+ihYT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870087; c=relaxed/simple;
	bh=k+V9np/k8kxcG0TemOtAqNElAc/Y6WE69Qv6f0bpv5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rg5Q2pErhdFFaVxOWjg4JkxhJZjPs5ZWGiCz4yp4CkXVDzL/eQanhyhqO+TAzvbS5EsYfR4r9tk4Q5keJ4VBmEErv0umGD1Mj0QXfyD5lC1yI7KCQCwyfy1FSt8eGHik/KL6hNx0u8C/6jKvBKKhVwbzsrtal+K23f4GE8/62VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3UKlMMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpgfWJMV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NHh3BR322187
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GCQtUWK31BU
	Ldny6QyCqYw32AyO5oDoICxT6CT2h5Hs=; b=V3UKlMMa53IEVtRUvpH7OOtBK6F
	asBxIhDCVBZQEtmCbcMW6sQaHptOg3blPD5EBDC5GyKmcZuJDOGA/1dYHe57P6cG
	IrM6jqefjVFxlbTYQC4O8BRO0+uMrg9Snb3BkBrNYfjPuzk4ky6XVwuxGzffSqb2
	fRIaqOqEcz46Z8alWfYDrzBGrzvFYM/fzcHc6O6CSR52ISom/XGRbI8ecgDJh9yw
	GvgrbCCrChoGDRdBbLQq+T0TlMgNrm41Ns9DknAewuadn/r3uOWClWJ0A/eur6xY
	FL+a0gensUDUHQmjafoPmaaDmGBlJKUL9OKAY8n118YGfCu1lZb875aJ/Zw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y1e6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:08:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb5359e9d3so4498962585a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870084; x=1772474884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCQtUWK31BULdny6QyCqYw32AyO5oDoICxT6CT2h5Hs=;
        b=RpgfWJMVf2S2h3LUnMKqMz1UuyzEb1sNmVFjdqRFoy6GygYwThVkdXUGCuHN3yMl63
         6hsJUDGFg9eHmKDbkz8SqC+sAxvhS2Ws9YPTMELVnKRdec/a5lQX0N9zoy7vmUk7ZgNr
         sLXgAYdwtU3RJ4rxKFkkUDsWzKmzI/+PRwWv3bLX6k2wwQVV5LA7Sp/nBRbf+bPqrHmN
         Od1QpwBVLMtSJRGSLZfZSYOzCTwRT4OsnLr92kvfYtDTV6tAU8ngV0G+I4ZC0JVY8z6+
         KjOBLWci/9DWj7STx05rnniHhS6aRZEmNHaxhjzJrDLwjJN33yQPJlu/E1orSjEZ8XpY
         r+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870084; x=1772474884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCQtUWK31BULdny6QyCqYw32AyO5oDoICxT6CT2h5Hs=;
        b=sAAU63vccCrr7mP4SoPePOC7ujRfSpQh52QCEFwU2jMhkl8ixHQcmO1wfJ7fj98CYG
         o6KPf1O/Gpo1VxI+YiAY15Nf3jinig1QfLDhFqiKO7vjmlhBFXZI3OxsvMiGTwXeiAzB
         dpr68VYxSvf4X9mhfrGAWw69uuFBFHlF5q1zsZIECH2QtkAVxQlLamkSPQtL7x1K9++F
         YCIi36k0GQg7buCCFxydEs+1SUn9e/s5TUqlPaOizsOuz0pb1Ph356A2Eb2nBL84jast
         LvR/S+cZGiyEJKR0/45OaPyRDzQDkG6Rjw9+STBIllhYD/aWPztV7iFK80roFXFXVYGA
         JZtw==
X-Forwarded-Encrypted: i=1; AJvYcCX3iLXzd/gxdIkYaETFAHEDTEmCifTRhdTfVc2nf059+nuRDX+W+PqmyITMkkcmQ+X9CzxiKnPxi6mEqXV/@vger.kernel.org
X-Gm-Message-State: AOJu0YyWMAk94d/+nhYtCEerUHYBl4fX48VOrhg3vwKHCoC1QN8kDdp6
	Q4NEc2bHHkGVCbDmFoo6U6EYXJg4clJRrxtTAi9/JXyzFRRG4Kik1XiTrtmZ/vyAijYg493YqJD
	JWRZoOdG2ZENmyGA1TttCaCllfTKsIpzvLuPRo8UCkQvspgCH22FODXvFpdHYnq0hR4Lf
X-Gm-Gg: AZuq6aL6/MWEesKtF+1TsdboVePlGHZ6SN6zQXiS4gMQCJM09qg4kZYj0yDu3YdraRB
	MbpqEhU/B6QpqXaMpWO87utCRVp8OhtNiSk6lYZoG34D/4SoiTps3317Zo9nvBysCODBoRvFYIl
	tnFmt9GpSnA4Ezp5t/utD7q+HTqUSq+JAACFEI5LniFggstpmqzpP4kr11qD27+QKKEKJxtmUh8
	bdb4+jJqJ9Yb80hxnpNTa60LYWPzX0hF6FgVpq1Y3KKntop4B6qj7dszH6CrnbrZarFmgCn2n7H
	K/g1PO9DuT7Czp9s1O+6A038mf0YdfvOdWh3UVD8YcVBOYT8D2J41KL5/Yle0FFUSM9Vl6Khpo/
	k59gvZvwnn4WE66ctgfFBh8lv5SKdjI/w6535Fim4cMOS7DX4OjRtFXM=
X-Received: by 2002:a05:620a:3711:b0:8cb:8150:b1cd with SMTP id af79cd13be357-8cb8ca0d7e1mr1183559385a.26.1771870083820;
        Mon, 23 Feb 2026 10:08:03 -0800 (PST)
X-Received: by 2002:a05:620a:3711:b0:8cb:8150:b1cd with SMTP id af79cd13be357-8cb8ca0d7e1mr1183551785a.26.1771870083202;
        Mon, 23 Feb 2026 10:08:03 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:08:02 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 07/14] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
Date: Mon, 23 Feb 2026 18:07:33 +0000
Message-ID: <20260223180740.444311-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX5FfYZZj0g7tQ
 J0cgx01h5hxPERFirlE8b0xWSWC2HYBQ3mpzuw/4tMPHRbP6uY6ojUvg1gmuo695m53XQIhOtbr
 Vwi+wYn5R8FdGd13YMN+7BBUe+RobrNWLOICZ21Q5jXL65lWeUpvZcVfhAu8iFg/IxUoTuWe5qu
 LkD9PSvD9ZarxhPS3SoS6xu0I9kfUA3hECWDtPDMfI67ZSMqpCjVp6hmtGMep6emO7vgxuFyxdV
 8qMFiyN16dg2QvRnDGyw8g1xcXihtd2/ovj5T6aeTgJUX9ynhheBb4swTZYvKy8ablFaJSJYzDp
 /GkUZm9buuracwOfr5fWIomMSiVgcvhSfhDN7cCWEdbvqOn8CMUCTp+EmRaYyQZSpjB7HMR2sVc
 IA1ZYdqx2zfweXukkBM+vDePAQcvu/rq5mf1pzWURh2sdFv+I/fMh8lcj3+FLyyr4V+mcXc/OSp
 2K5rDwprPanZMZJj1Sg==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c9784 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=O6SSznAZH13pnem00RwA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hifwVENETp_Ri2b24kl2sv6ZQAhjocxC
X-Proofpoint-ORIG-GUID: hifwVENETp_Ri2b24kl2sv6ZQAhjocxC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230156
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93756-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B36E17B4D4
X-Rspamd-Action: no action

Add new dai ids entries for LPASS LPI MI2S lines.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 10 ++++++++++
 sound/soc/qcom/common.h                            |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 6d1ce7f5da51..e27a31ece1f2 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,6 +140,16 @@
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
 #define USB_RX			136
+#define LPI_MI2S_RX_0		137
+#define LPI_MI2S_TX_0		138
+#define LPI_MI2S_RX_1		139
+#define LPI_MI2S_TX_1		140
+#define LPI_MI2S_RX_2		141
+#define LPI_MI2S_TX_2		142
+#define LPI_MI2S_RX_3		143
+#define LPI_MI2S_TX_3		144
+#define LPI_MI2S_RX_4		145
+#define LPI_MI2S_TX_4		146
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index ab8061049375..85ca73408151 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -7,7 +7,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
-#define LPASS_MAX_PORT			(USB_RX + 1)
+#define LPASS_MAX_PORT			(LPI_MI2S_TX_4 + 1)
 
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
-- 
2.47.3


