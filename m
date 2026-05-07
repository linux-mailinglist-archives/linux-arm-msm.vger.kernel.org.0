Return-Path: <linux-arm-msm+bounces-106369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IElcF02P/GnDRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:10:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F514E8F17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3205F30B7A38
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2C73F9F33;
	Thu,  7 May 2026 13:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmY4plwD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZrq7OjZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D621401A22
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159032; cv=none; b=Yu5MN84v1ceGy7tX4Jv2WnRSWHujsNgCZQqVfjGKu6TuS0aic3jYwvaTHPHfXX9vjapsLGG4Z7XBoebCIiGdjsu4t4CoXfUr9hGvXBb4Yt+T37MpGhATu2yOirP3b7LFdw7jl8rtSwvojxLo3U4yOlIacq292PXc8UyESBvqKFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159032; c=relaxed/simple;
	bh=BQXxAsNkcgoIebP1VAZBuBHx3qvfk0HLeeYsTxoyeyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PkvQZtJ3QRPX72HanBjo2uu/iXZ0XKViiTaevpHvteW207jWX6aUuR4yorxFNXnBF0p1O3zkqlSxF2YFtCa9utCRJpAmEE1Xa88f28T7X+KCySLzQH/u4j3JSCMWhxTa+MR8Al7COlQFARPbaIAuDkEi7qtR+5++b8ZtoeYlNJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmY4plwD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZrq7OjZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BGBt5682852
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=; b=VmY4plwDjhCHYlYM
	+Z+AAP7KgsP8llBGO/UbD9X3TbSWHtCYTmNMCia/A7EAbPcS4fdTwsbMYUKo9SXd
	rahkoVLcSzU4lrqMAeYQDAWTBAXTyuk4o9VSkewMn2WynRYp1NgsBQJ34DP1FnyQ
	nB5EeU6prn/by7zBP6gdRwPM6AsTd/yJjRZhpXIyp8LzvG1CMDVd1/fxaOLXrTDy
	IhbO8/T4SKriOzTrJMGZePLooZqj52Jfy7J5yJUnz1Vzpjy0Fuv8jCxTc4YxEl/X
	ZZvJa73v4WTuHGdX4xVFJnD/xcrytWgDHWJRu45ETMGclfIcyyJm4BxAcoOPEnIH
	WDM1ow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhasmyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4530a90fdso20511395ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159030; x=1778763830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=;
        b=FZrq7OjZ3jKuPs21q3aOpH+FxMrcZ9YuqHNkK9VbJ4faXa16Cf51oJX9YIxHkPi6ia
         Pntlgn5oEMm+G+wkEDiN93jkkSQ3QbRgqcutttIvyXB1/6FneCmEBY+dP/6vk6pxzY5V
         R2XkAQge3fH5VuUDYA/ffk1HzbKYuWnIRfmduNSlV6oEdFPog+uaHXOXDH65JXnrKD3w
         zZfbH1gLSCXulLpyVhbtxWpo8j142pVXQkChLHpvB0ZiBCZ3+0Dd5KUNj8StMIR5exrm
         4axNFRrC6vFZjuJh6OutDO9ut6AaXUzkhlxvVBWg9LBIXJHAkOyLZahfZ7xltevSbJjF
         6Y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159030; x=1778763830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=;
        b=YaRdAsc3e0RZE0RX8zIXX8nX1hg+mmYXkQSLxG/J3Z31EQrJRmkw8oSnOoLYPHgzOu
         0Nw0TLIf8x7/8w92r5oKFP39fd5jvhvinpvGB3atAyxVCUJpByI83DYnSBKiK4wOdu39
         JNTw8z6UsEzNjrwY9/akjsj8m49O5DPN5yBsAS3qqwVp6ZvxtPOit6mcsuHL1P89DnAx
         kn6BANEQTC2Ot8OlJbq6mdJMKT4ybMBuBwG49hRnV+FSGsd+HiZN06qH9/Ci1kIEqWn6
         3NTUyW26NbrMgbMhKZkuB+BmuI01J/ShpXVFz+idk5hwnMeqORxv1MwOK2Y8vuLZhbUL
         PTqA==
X-Gm-Message-State: AOJu0Yz98IrW2irm4h7SGpTxIsL64vQwE0lCaDEMNYwcoJ5d6I7z4IHR
	LTx6+990d1oly9FmYhc6gAbLihRUNV8CyiJ98MdpZvEJ5gLOHSzqDK00MpRPprk92SmiP9aAQJg
	+q9qFOEFey+Nmc0oAWgT6mp4Tf+QMFXiuJ3rMV7IsHAZGJw2iz7y6jYN1Ro/ol19b072W
X-Gm-Gg: AeBDieuDz1N1xKtvjxOWe4SbrfkWrNJyRfD0gvqF3GM1j/IGIpQ4uqYgr1LVVGFsaXM
	/Ln9Ol4uK8wnhB4VW9L/X5iPfWn5Jd+vvJo3wcKv2bmIIiDtIRthzMoibOSCktG91FQuk2Vs/TY
	QC3dYx0YXTYRPWAlZD76p+NtxFvZiRrZ2oTuNkI/lBtVVLmjkx0znnuV7If1oIE/fnvewPvkO7X
	FBObaZwp19Yxc8U0qBe+ngH7FWxlAmkcAUvHnJMn8x3y8bYE7tvCDLn5fVDxM5UpnSvqg7zDokH
	RVgOBb632hA6itr6Tgwa5xsaElFj/TDayw3eaaxP+NW76wg9r1QVPaB+DWzvfxJCoDfPO8OFkI3
	mE2cHZM8sDF6YOft/OkiYAkzc0qhEMGy+K3cPVjFVPp9NN61cYqiKnfHWPKkO3w0m8cmKYIVlki
	xutMe0iQvtlxMXbVN4vEMbqejGwsWWStfksJr8n+P9ZPR4RGP/cfxlCIQ4
X-Received: by 2002:a17:903:4b03:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2ba7a2102eemr83850845ad.29.1778159028785;
        Thu, 07 May 2026 06:03:48 -0700 (PDT)
X-Received: by 2002:a17:903:4b03:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2ba7a2102eemr83849895ad.29.1778159028153;
        Thu, 07 May 2026 06:03:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:10 +0300
Subject: [PATCH v4 14/29] drm/msm/dpu: use new helper to set ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-14-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BQXxAsNkcgoIebP1VAZBuBHx3qvfk0HLeeYsTxoyeyM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2Gg97HW7S2QBtityj6ZF3/0f1VawHXqg4xG
 fLihnyoO6CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhgAKCRCLPIo+Aiko
 1Y8DB/98etxhYYzreJFwxxpVfnzD1VfbodcVaUAhsHte5PZ7vdAu3l/05HpIogj2ZmlD8DJR2DE
 oj6/T2Esto34Sc5dlGNZSLdjBrXIcD9FPHV+SJSuT2vf0Ws6e3Hb3IUdeS1RMK/D8SXekm2f5UL
 Uv9OFqCU32NNRiGm+W5pHcdFcnjIfk5r2//igu2Q9J/e3QmO9Ur0FyxSXc/bI5djI7UtJZTNGfd
 prtffJVCuqfxZGPsN4PnCNT9FC/1GdT1Cm/nREzDhkqBS1XvTMcVr9XsEi1T1sh9/tEO+2VhTHl
 9Wy/EYlkHHE8/QL9u5uSe85/5ej65cZ3E/A3s+dlTcFLSGOM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX/LPNd92pgIW0
 53mU75LJkX9qMDLlPwJgX864IQotIGIOBAc8mUo3Iy6Pu2TIQvPSi0eHepMOwAkGXQhS2XtqREt
 JeNkQDA20AQzmqG/TliXkFZrzT4HF+d0GNBuNRDveVi7Hdv/f8Nz7EOTlK/MZeOVihJYK+8hZo4
 ijJm2gM9ovOzDvOfO2v6D+eq2QmkXimYt1K0vUFpVOHAEZCGIAMBI4pDEJASKjio3sKv+tpC7rQ
 sUsEyMNjqRGdieHDMgUZYxHN3vf2m+u1C3FX4fgQ1SzlZQ+WpYXx1bMWxuJGCXZRSl/ZgrPkOs5
 MQMf2h379wlBvkm/FfmifpoLldS7zK8ITgNRO6etOkZUQCzLXAsvrGCfabmUidYDe1GvAO6bdTw
 LLR76WqV+OuibaaUomu05J6yCXHU4GsU3mwKdnTnd4P8m44NA2EVuXTRO1PkJShHEOKgua1GonL
 Lm0eYsMWOeTsGhBg9fw==
X-Proofpoint-ORIG-GUID: k_X8CEyY2s5joOVQMNRtvg46ToP8Yfin
X-Proofpoint-GUID: k_X8CEyY2s5joOVQMNRtvg46ToP8Yfin
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fc8db6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=46QewcZEoJiMQYndSOUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070130
X-Rspamd-Queue-Id: 56F514E8F17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106369-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index d3da70009234..6089a58074ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -318,13 +318,14 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
 
 		if (ctx->ubwc->ubwc_enc_version == UBWC_1_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			ctrl_val = fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
+			ctrl_val = fast_clear |
+				(qcom_ubwc_swizzle(ctx->ubwc) & UBWC_SWIZZLE_ENABLE_LVL1) |
 				BIT(8) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
-			ctrl_val = fast_clear | ctx->ubwc->ubwc_swizzle | (hbb << 4);
+			ctrl_val = fast_clear | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
-			ctrl_val = BIT(30) | (ctx->ubwc->ubwc_swizzle) | (hbb << 4);
+			ctrl_val = BIT(30) | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
 			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);
 		} else if (ctx->ubwc->ubwc_enc_version <= UBWC_6_0) {

-- 
2.47.3


