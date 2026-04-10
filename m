Return-Path: <linux-arm-msm+bounces-102655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFymGVvJ2GmkiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:56:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B52DA3D5495
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B755530E8ACB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1843B9613;
	Fri, 10 Apr 2026 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRjVzElQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fg3XdeQ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A17A3BC664
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813795; cv=none; b=ju5FAJ4af0xS/Af2o1B9wrRnzQTXfDguXsuDFefrX8rTNaUYbv2ifgZTKaQTV2IWP4eI+mLTKsz/j6x6CoBwK3EOpQ7pUYq+ZfE4an4aUPfUahAgf+NyI9jebkCmfzpiGk6hm7aI2Bp+VYrbajdAgQB6lTJnxm8bqpmcuCs2NKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813795; c=relaxed/simple;
	bh=hh7cPjxyA+5XkQy2l4wuOiGfJywbpFosqHP2MMCA2HE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/Y6GXlGUzWC44pL4vLHyy+0JsYkxiQY+ze3CslpBNdc1ZLBTfcqFIwJMMb0g7Y7gGEcpy8w6w66t8AlliUE52qRn4MVqeRWvLGyzUGinM/snLO8gSzjk9zh4sbwwcEtWufYafgyxkwrIqQqKmjr3Z0sx4UolWwjiO0iZ3USE50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRjVzElQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fg3XdeQ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6qeIv1433198
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZzNBEVNfQONkq54ts470xxouWY76yWan6UzpjU3w8s=; b=CRjVzElQ1tRsp8f3
	uR5un3eESVJ36efLwc0QJUnvEoMXRLCgxfQDVrd2yTlxiJXxjrLiIfD1ivXMLi4Z
	v2KhDv43vcCFYaTTdjuxqbFsPhNWu8uCnLP4H+hSAfqPy2wLeU2Fyjwhk2lmf0H0
	ObptMLKX5gELBGrz3qPEm0+SXdm/uTSAu74uplTZ+QjzSiXfvnJn4K3bycKjLgpP
	FsqOjMKjQR24T3KaXSF2BSSMomjhNexsGxyHPO40tmLkMbzs+84zOF46I5C70Srt
	6Z/p92aMIAOtrC/Gir3GoEurefge0dV54heK0XIgUWIC7wAOfdg50O0AKVod5flY
	zZvLNg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfbpap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:36:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89cd03be011so41281676d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813793; x=1776418593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZzNBEVNfQONkq54ts470xxouWY76yWan6UzpjU3w8s=;
        b=fg3XdeQ4q/6e8n1t1q32blk1y8hKPx/eXrIS2PzFlgg829M1X+RoPN34jul4B3LykS
         Gsvu5nmFB0MJzSlzgdcH5wtuA6zz0xtJ6ZtlRl1Y/6JDZpGgCTfFX+M57axTDVQOaoxH
         Br95XMP3K2Y7r6Zq2p5+bv1DryxylcyTh6I/u8SlvA+Y06tFmwsaAnbxO5H+/8ucJ4zi
         I4j0+DAdEtqM1p60GSboQTcYo1tJsRKUCm+0eDOvZohybszHCAhF5ESrpcYj3i7EAwnX
         ZyEgog8QbSS7cdwrkGAYHpttJmVROW9iuypCJ3XB+B68LOixc9qMCqu4djZJ0oZFaffH
         Mftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813793; x=1776418593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VZzNBEVNfQONkq54ts470xxouWY76yWan6UzpjU3w8s=;
        b=Xtan6g2I5X6xFEcTWg+Bm42BDdvoXmtBTH7o+h0qLI0CmxiHia+2QXdLLQoPkbfVhr
         yw/XFgfhr1l3Y2XFB67phjUNigvOiI97gFg9l8+UN1+ZqKIu5bVLEcgNnX5+pONMzCPS
         To1wVGrq9AxcpM8hWvfZMB4Itupkx+p3oH0pUja2izf5vz5lSn2eyBm+aMidwt1OFg3e
         kWmSjt9vWOujAMb6ONBxj9dqwfkOlQKNXkp6HOkryrp+qNSdPcZZBYLdd+cJHjNDvGy3
         Uq/k+n8h9pHU3vstLNFk7eXUm0aFG/xfI1Qb5vL79txmEsHmrvAgm5CoXgs2zptt7gM1
         23eQ==
X-Gm-Message-State: AOJu0YxobdLKRntsPgW1jLNthO1x3lLw7PtKt6cZTXcpHOYg8bVcdMic
	5+vCuyXV4nXLPQxuWPmBDc3zB1fbSj6Jp19oNxj4NTSu3PdmkjA+xui4jWga7Ln8iS4/tExtD6U
	buHxKb/+eTLhWpuaBHgZixwywnxJ/8wIXvCTa4H8Siq3LeS3i/AJSNvW3qoXz/TY+IZfoLuaCaI
	J/AmQxUw==
X-Gm-Gg: AeBDiethX135hx3r2aRT+ojsOIQHUaE0lz9e5raOF9I9HRg/1caUiBC//UG87BsScSK
	EpK5mGkBmES3xpzxfxGzLFV/Tsvwj2TgtL8KQDrn8yx4XRgi55jE4GHrd6RaSX5EohJDaBilXV0
	73ZTCvjlu7Pl9NV5rQqIx6aLD7Kogbvh7ExdhqomAlBRNXHPgpXSb/t5WbHBclMC9yY5prprIVV
	m9pcllohJ77nNxieP0jc/2uiNc8abmWjUx+H564iMzL2gWPlraKtRVr0APzMQnAb2uc8qy5rfAa
	PyfbaP9oQs/4SudOsMT5GL2+114RfqbhffZvKOlwvQ+qCQPpf4vKtqJJBraLT6sV3B/RtbGBKd5
	FHeICez4TCZDLL+t99IXkL6Y7LfgQjCSp45LY71sbs+GMKXc6xUe9EoSLBjd+5+H3IC5S8c8lDK
	Tjc18VwWE=
X-Received: by 2002:ad4:4ee4:0:b0:89c:a2c8:9432 with SMTP id 6a1803df08f44-8ac8602249dmr33805266d6.0.1775813792844;
        Fri, 10 Apr 2026 02:36:32 -0700 (PDT)
X-Received: by 2002:ad4:4ee4:0:b0:89c:a2c8:9432 with SMTP id 6a1803df08f44-8ac8602249dmr33804826d6.0.1775813792224;
        Fri, 10 Apr 2026 02:36:32 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:36:31 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:34:07 +0800
Subject: [PATCH v4 32/39] drm/msm/dpu: initialize encoders per stream for
 DP MST
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-32-b20518dea8de@oss.qualcomm.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
In-Reply-To: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=2364;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=hh7cPjxyA+5XkQy2l4wuOiGfJywbpFosqHP2MMCA2HE=;
 b=P2+SxIBHLLxI66zJRWxm2TlBTA3piaOS0zYEWENl24H+1AWttps72/9mFA4jfPDqTRWHyrQ5g
 r22R534dqxGA5SL6ieWB9KE3KchshXYhUDljaLOApiAnU9enNx1wrQY
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d8c4a1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=CHjaKMol-vWaWBnFkvwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OSBTYWx0ZWRfX+vX+cepkYo6L
 3GarSCtNP0DK5x3lSJOA2wHKgEBaZGGMyAz17e36DfFFoGLDUw7V0nkqB50LoIRmNKiy2I7cz0F
 Cla4/1CL4ulUxEJCmWEhsYRxYPIXdudqOWh6+Jz6GXc2mXeaXtfZcLpy9YPt0kEB8u/TLjtV4b5
 9ghuaCVb5lwjc8oCgkmQeZnELMUDtlGhp2l0WfZ/JxnEjBTeTVRqeDVoZ47iWxeaNR5TiAL0MQG
 WBhPL+S/w7GmEzCS9X6bvIRakKjwRsxBbjeKbZOHrc7YwauCEqhefelJmCW41yizTY4Pvk4X1FF
 3A2wJRk2W8W0pfGP7JvRVMgVZ1TjLwhjaGczj+sM/M1pZqZrIdrseJuH0gG7zW+9OgNMop4zfHB
 NivCbJJ4tOVWUi+GWSEN8tkIEhTuG7yupD+wfFJ4j2MX1fS11Z882pCLrLquZCsUxawRns0oI4T
 IRiSx4icsNRpYwpuHpA==
X-Proofpoint-ORIG-GUID: xihzpUwTnk5QP5suf7Cr-3dcfru8JqEe
X-Proofpoint-GUID: xihzpUwTnk5QP5suf7Cr-3dcfru8JqEe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102655-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B52DA3D5495
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simply initialize MST encoders for MST-capable DP controllers, and
introduce msm_dp_get_mst_max_stream to query MST streams.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h           |  7 ++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 61d7e65469b3..090e7d790593 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -653,7 +653,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	struct msm_display_info info;
 	bool yuv_supported;
 	int rc;
-	int i;
+	int i, stream_id, stream_cnt;
 
 	for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++) {
 		if (!priv->kms->dp[i])
@@ -676,6 +676,18 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			return rc;
 		}
+
+		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
+
+		if (stream_cnt > 1) {
+			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
+				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
+				if (IS_ERR(encoder)) {
+					DPU_ERROR("encoder init failed for dp mst display\n");
+					return PTR_ERR(encoder);
+				}
+			}
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6d847d593f1a..3061eca49cb2 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -362,7 +362,7 @@ bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
 bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
-
+int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
 #else
 static inline int __init msm_dp_register(void)
 {
@@ -379,6 +379,11 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
 	return -EINVAL;
 }
 
+static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
 static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
 {
 }

-- 
2.43.0


