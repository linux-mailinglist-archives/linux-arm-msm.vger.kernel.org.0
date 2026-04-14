Return-Path: <linux-arm-msm+bounces-103219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INcVEdON3mkIFwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:56:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1F93FDDEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33F2A30C2465
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4D9262FF8;
	Tue, 14 Apr 2026 18:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z2Y3sMeQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXXqAcd9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B45231C91
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192741; cv=none; b=Ezae1Wjjfy7rvHNMjZ9lZPyQ67ygSs3O2igELuF89tWe6uA2vW+KFduyZyjtczTiX1rHbEytmxbSukTdsQouyZbJizafCq+5d157seoli798z++ZRRNy3Uf4kBfnYXjlnG6eP6URrFUc7kR5S7d284hEygyGNoal6zumC53J28E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192741; c=relaxed/simple;
	bh=PmejZ+XPe6Ou9vONh3i7mcbnQzFXijPDsanWVjvDFKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cx8iVJ9twFo4AafUwIm2dVI+0YXyN2KyXUPDVIgl2EkzIcMdzi6kCIWn7A0DVCFA1ZcqGnYBC4DLmQUHYtBTc0itjZYcqGZE1249wj/zbuoJJ5B7jynC8wfOdo8bPNnkucaGIZXrvCXh1TQ+t7G/UGll2G7QzMmNH0UNVr7be6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z2Y3sMeQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXXqAcd9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHvoUM3059008
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ISeWlszDFyt
	2fKuoc12YWOgSRcf1YnWfU2kQ4McmyCk=; b=Z2Y3sMeQjgCuzghWCNnYz9lvrsV
	B9f+tvq4/yYXMD6COLFghSOZM7A1h3zPnAtUpFbkS8ZWlOBqmaKjxa5uG2RPq6Tf
	d4xoTgbUl2X6OdXX87iBZW4mzM8NF20ezOFshERoM29PUdoEwWWK92xNJ57pGRuY
	uBj5qGa9HeO3P4UZkF5PyJrdQgmHodf/NAteVJZblJtt2r1gJcPjr7/w7WXykqIz
	U3Jw6qY/+zQY6EpA5uhpg3WijDcqo6cNNtkh49pE8MTfcLUUFTCN89i+ImYGAy95
	+SROPP3hEw+761nzNMFqfcKvEdEdn0jE/dbjZ4QEexViS7pEv5n05z5dt+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtepr6jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:52:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4987c698so159435781cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776192738; x=1776797538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISeWlszDFyt2fKuoc12YWOgSRcf1YnWfU2kQ4McmyCk=;
        b=ZXXqAcd9n/jye76LmtxXyZ2P6HgwGkp9OeDfWp7pLvnr/1ZVjU/4cg9MPpXBqgyhiT
         V0FErS9vewrms+hkVtT8KR2zCKNviAoiDTERCbaGlgj354J7b/3lu72o+VvDBsmqf/O7
         zytGCbQPPvdmaWwlhwXc7tZSdP3P+9jGKsDRM5q4ZIxQz+d1wFEwgZ3cJaCyW+kMLKIv
         DGcAv0COFJRc2Xr0eVgIovsGaU8ySp2HWRmuTahwCLSF+/eRw+KQjHMJP3e/91DVoJtG
         KOJE4T/7RCnfVMX6kElWACemKR/6NJG8/D1lsxIzEHybXJ0HoKgEqOba27ZRTg+TVCPS
         UlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776192738; x=1776797538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ISeWlszDFyt2fKuoc12YWOgSRcf1YnWfU2kQ4McmyCk=;
        b=XLAzuNV+OPT+QyLLw975cFgIXrHtufnJbZ3NM3FvTMT5e6DrlQizLJsz32pd1Vg0uh
         vDvrC8ODUIkDTTRwDi6wbg9ve8Dcp4GvLnzbZbYHwBtLMOEEH9btZAHt7SHaUisZtP0c
         iB6SShNkza+CU0aDjZ3PSOFJ66qoLwnInmn6y1xMEDfjaBtNPcMuXiyg5Gubn6hRzW4w
         RFsRMPArGPuGDxbpZT2CdkShkZ8hdTbRVLsaNdhXOeXFX3Tp0eN4FhFOwesFf+aNNVNL
         l82W+s/KEdyHqMU1x0CdQeIH8x+VmzvIYE6WNeN73YfsmByVsIWdpqz75cYwIiMeFJEK
         w3wQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gBwK/JdD5RMlrgQbjNJ2Srzn/+H0OArnlBEOj+/l/0NMdHJGKmdC25v7XV8KQPDihrNdaaDR8MsSviF9d@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi9XYtEMQ6sGzDRZabRAmdSmoJB1vei8oZcQIfH7V9Nh/es2M1
	bfuSRCEhuHKFPElRINeL9WCGZgSYgCgPJkHBZDtXcg0sFgb6P5trGhfTbB9XyMQKYDANdctkSTl
	URqCit0swxdBbCSP0vsoIugrpBbPjSrGVB8aWYxW3pQPc1dFY1BI20jqeV/Yy61laFZGp
X-Gm-Gg: AeBDievP8kj2CjXlBxuxVKevkjpqTgW3jAK3T6QgMHAT6zPuXO1XIXVWURRMdr6MXzx
	5pD6+v9bJ9hQFT+EVSPL8X58cmbbjw5Di0OxAIQu6xEAfTzMm62cr/yllq+Ch959EoppNwL70PC
	mThc3SaZoxT184ol5SAMxCm3YE8JEpB5Orxh1f6xJThpdIy+oz2xsA8OouVxKMPOHa+/xAh//wp
	VzLqryYI9dqjXSM9lGH1pmZglL3aC2Yf3fLworkG1WFfhwpC7j1w6Icf2kBeKDBzEUZFv0rfPJc
	LlbwCRU0Rx+64Bpv+b80eHr4meVbsPdoybkE8vguOY3q47POTJe9KRfdEztAwBNdD/Sbj518mTH
	ACWQdEyVJr9s3nV34WBITz87VfGniBuotB/FdhNVkVLPIUwaTpm3LWbmFptALDGPi6poKAjGtWy
	TZTb39p68b9Hw=
X-Received: by 2002:a05:622a:3d4:b0:50b:292d:94e3 with SMTP id d75a77b69052e-50dc1b9a1f4mr310295331cf.42.1776192738029;
        Tue, 14 Apr 2026 11:52:18 -0700 (PDT)
X-Received: by 2002:a05:622a:3d4:b0:50b:292d:94e3 with SMTP id d75a77b69052e-50dc1b9a1f4mr310294911cf.42.1776192737614;
        Tue, 14 Apr 2026 11:52:17 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:f062:40f:6621:e20e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e9esm427647366b.11.2026.04.14.11.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:52:16 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 5/5] media: qcom: camss: vfe-340: Support for PIX client
Date: Tue, 14 Apr 2026 20:52:02 +0200
Message-Id: <20260414185202.2714019-6-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
References: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3EwkbZ7cqZ6TDqMdUhjI2j8h4RZEw7rx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE3NCBTYWx0ZWRfXztbAtzfefHIZ
 iQ/FZj6FxYld+S0zOU1Q4vivYqhFUTynwiev/IyUUtyKfzy6YGgfjyxJNpggfMyw8P/0aG8SlcI
 54B0TDlhNStXxgC+/iEUBFklcU7/4GIXNWvsQ4gGaJzO0O6kr+sMdeAKGB03vF6m9IIbJlH5MHp
 6OC8as9d39Hy903WqIFbps54oF6nu2rY968qHL9Z3HCx3kCEbfqkA661311NGrqM1XwLHL6OFha
 FAPlKGdptsKddvUktacPSt/5RWyMi7V4KdiQwNCEJca+kyMMHWnZH2x8rXcTYpcD0XUhBwIEKNf
 b4J4TshFXgUBaTvPp3hXzmvzFLNwq+8CJcx7QWebOz5mfAQwYoEFR9vOJPQD+m1L+RduNjSfrL1
 chRL36/OlPZIRqIFa9Faxzzr/r2lzuLg4H3eh/6ecfah45EMePRGG8cdDZXvhdfH/zdWMHgpNyT
 fcEeZwK7/oJnPyCtrkg==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69de8ce2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=T0JAYaUI_TIkQzIuI_sA:9
 a=QEj_SxXEJzKJbFzb:21 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 3EwkbZ7cqZ6TDqMdUhjI2j8h4RZEw7rx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140174
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103219-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA1F93FDDEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the vfe-340 PIX write engine, enabling frame capture
through the PIX video device (e.g. msm_vfe0_pix). The PIX path requires
a separate configuration flow from RDI, including cropping setup, line-
based write engine configuration, and the correct packer format based
on the input pixel format.

In contrast to RDI, the PIX interface embeds a lightweight processing
engine we can use for cropping, configuring custom stride/alignment,
and, in the future, extracting frame statistics.

The functionality has been validated on Arduino-Uno-Q with:
media-ctl -d /dev/media0 --reset
media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csid0":4->"msm_vfe0_pix":0[1]'
media-ctl -d /dev/media0 -V '"imx219 1-0010":0[fmt:SRGGB8_1X8/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB8_1X8/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB8_1X8/640x480 field:none]'
media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB8_1X8/640x480 field:none]'
yavta -B capture-mplane --capture=3 -n 3 -f SRGGB8 -s 640x480 /dev/video3

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-vfe-340.c | 82 ++++++++++++++++---
 1 file changed, 72 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index d129b0d3a6ed..a01b78c805cd 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -54,6 +54,7 @@
 
 #define TFE_BUS_CLIENT_CFG(c)				BUS_REG(0x200 + (c) * 0x100)
 #define		TFE_BUS_CLIENT_CFG_EN		BIT(0)
+#define		TFE_BUS_CLIENT_CFG_AUTORECOVER	BIT(4)
 #define		TFE_BUS_CLIENT_CFG_MODE_FRAME	BIT(16)
 #define TFE_BUS_IMAGE_ADDR(c)				BUS_REG(0x204 + (c) * 0x100)
 #define TFE_BUS_FRAME_INCR(c)				BUS_REG(0x208 + (c) * 0x100)
@@ -63,12 +64,23 @@
 #define TFE_BUS_IMAGE_CFG_2(c)				BUS_REG(0x214 + (c) * 0x100)
 #define		TFE_BUS_IMAGE_CFG_2_DEFAULT	0xffff
 #define TFE_BUS_PACKER_CFG(c)				BUS_REG(0x218 + (c) * 0x100)
+#define		TFE_BUS_PACKER_CFG_FMT_PLAIN8	0x1
 #define		TFE_BUS_PACKER_CFG_FMT_PLAIN64	0xa
+#define		TFE_BUS_PACKER_CFG_FMT_MIPI10	0xc
+#define		TFE_BUS_PACKER_CFG_FMT_MIPI12	0xd
 #define TFE_BUS_IRQ_SUBSAMPLE_CFG_0(c)			BUS_REG(0x230 + (c) * 0x100)
 #define TFE_BUS_IRQ_SUBSAMPLE_CFG_1(c)			BUS_REG(0x234 + (c) * 0x100)
 #define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
 #define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
 
+#define PP_CROP_REG(a)					(0x2800 + (a))
+#define TFE_PP_CROP_CFG					PP_CROP_REG(0x60)
+#define		TFE_PP_CROP_CFG_EN	(BIT(0) | BIT(9))
+#define	TFE_PP_CROP_LINE_CFG				PP_CROP_REG(0x68)
+#define		TFE_PP_CROP_FIRST	GENMASK(29, 16)
+#define		TFE_PP_CROP_LAST	GENMASK(13, 0)
+#define	TFE_PP_CROP_PIX_CFG				PP_CROP_REG(0x6C)
+
 enum tfe_client {
 	TFE_CLI_BAYER,
 	TFE_CLI_IDEAL_RAW,
@@ -245,18 +257,69 @@ static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
 	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
 }
 
+static u32 vfe_packer_format(struct vfe_device *vfe, u32 pixelformat)
+{
+	const struct camss_formats *fmt = vfe->res->formats_rdi;
+	unsigned int bpp = 0;
+	int i;
+
+	for (i = 0; i < fmt->nformats; i++) {
+		if (fmt->formats[i].pixelformat == pixelformat) {
+			bpp = fmt->formats[i].mbus_bpp;
+			break;
+		}
+	}
+
+	switch (fmt->formats[i].mbus_bpp) {
+	case 10:
+		return TFE_BUS_PACKER_CFG_FMT_MIPI10;
+	case 12:
+		return TFE_BUS_PACKER_CFG_FMT_MIPI12;
+	default:
+		return TFE_BUS_PACKER_CFG_FMT_PLAIN8;
+	}
+}
+
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
 	u32 stride = pix->plane_fmt[0].bytesperline;
 	u8 client = tfe_wm_client_map[wm];
-
-	/* Configuration for plain RDI frames */
-	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
-	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
-	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
-	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
-	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
+	u32 cfg = TFE_BUS_CLIENT_CFG_EN;
+
+	if (client == TFE_CLI_BAYER) { /* PIX - Line based */
+		struct v4l2_rect *crop = &line->crop;
+
+		/* Cropping */
+		writel_relaxed(TFE_PP_CROP_CFG_EN, vfe->base + TFE_PP_CROP_CFG);
+		writel_relaxed(FIELD_PREP(TFE_PP_CROP_FIRST, crop->top) |
+			       FIELD_PREP(TFE_PP_CROP_LAST, crop->top + crop->height - 1),
+			       vfe->base + TFE_PP_CROP_LINE_CFG);
+		writel_relaxed(FIELD_PREP(TFE_PP_CROP_FIRST, crop->left) |
+			       FIELD_PREP(TFE_PP_CROP_LAST, crop->left + crop->width - 1),
+			       vfe->base + TFE_PP_CROP_PIX_CFG);
+
+		/* Write Engine */
+		writel_relaxed(pix->width | (pix->height << 16),
+			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+		writel_relaxed(stride, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+		writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+		writel_relaxed(vfe_packer_format(vfe, pix->pixelformat),
+			       vfe->base + TFE_BUS_PACKER_CFG(client));
+
+		cfg |= TFE_BUS_CLIENT_CFG_AUTORECOVER;
+	} else { /* RDI - Frame based */
+		writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT,
+			       vfe->base + TFE_BUS_IMAGE_CFG_0(client));
+		writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
+		writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT,
+			       vfe->base + TFE_BUS_IMAGE_CFG_2(client));
+		writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
+		writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64,
+			       vfe->base + TFE_BUS_PACKER_CFG(client));
+		cfg |= TFE_BUS_CLIENT_CFG_MODE_FRAME;
+	}
 
 	/* No dropped frames, one irq per frame */
 	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
@@ -266,11 +329,10 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 
 	vfe_enable_irq(vfe);
 
-	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
-	       vfe->base + TFE_BUS_CLIENT_CFG(client));
+	writel(cfg, vfe->base + TFE_BUS_CLIENT_CFG(client));
 
 	dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u height %u stride %u\n",
-		vfe->id, client, pix->width, pix->height, client);
+		vfe->id, client, pix->width, pix->height, stride);
 }
 
 static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
-- 
2.34.1


