Return-Path: <linux-arm-msm+bounces-96838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGVoMHngsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:24:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAC025B85B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76090303CB02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F3F371897;
	Wed, 11 Mar 2026 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UF70PI67";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cI9OSP6X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EB736E497
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199435; cv=none; b=a15b7J0I0V2g5jAjGPxR4r1HddbIJOKxuzmKtkbA+xrnE+ub2CWRWNuFb8Exw8h3avxW3j0wgEbiPLTKisrlsru95I2T/rqfu7Gn+ZuyZsLqsa9q4RY17nKF5sLmPyfE7Z3dfWEcwi+o7o21CvQHXekF31SOXf/St4Z3wyN7jfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199435; c=relaxed/simple;
	bh=BQXxAsNkcgoIebP1VAZBuBHx3qvfk0HLeeYsTxoyeyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NH3HlgXp3Kak99WsyExmJSrMQjB2PTBzGZjHHcLW16t5Ju2QeJIMGI+J5fh5sp2GIqz6fRSE8FR/rINzvsSfDlzACI7A2XrPB+zdlQhtpAWhkClXfOUk8pV6gN1UZJBOUaz8L+vuf3ktKXRrdRuqfGoHhtYUD3J8yXab8dGd4hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UF70PI67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cI9OSP6X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B2gsuR1572954
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=; b=UF70PI673THNW/9y
	GURpeEGLod+gCEH4KvjdYCxvaNJ7YwIy45zGgKJYqnDqPJcm25OOyadZQNqOCdeT
	4mDlGcqPFRzjR+WVXF2MhWM9yev5Rjz4D2Ut/PFA6aIb0gMVFR+buRL2ckN2ukS3
	4sj+t1mdW+Udu5iiBJ7DRrSfAnOyNTt6Av0txdm6q486KWFrRHef3EKBC7ZWxZlp
	n6XPLEVpuXYRtXgvhQN44nAqAVyx8lMdcemdL69Nr1G+fVOgdq59Em+GRRLMF64D
	I1cY6Mv4woKS0WdklThhgydvQX7DXKYICOYThUR2K/uuJCsFmf4KBq9krYNkLQ3Z
	XkXN2g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgk9raw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:52 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ac4a7230dso20841685241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199432; x=1773804232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=;
        b=cI9OSP6XEye7LpOfskLGJxxFvpyiaiRoLI/g/kO7OtSkCA3uNpuksHOMCHryNdBTET
         mhODBiEU300oOaBLq1VuuF/8gujhStutm8XLLO4CPa9wy+0vvlmGF+tWHXT2FBV72F1D
         4ZN1D8kl9kALeXyu2doQcLQO1ibneE2wVvez2kCiKrM0jwiEVRAAnt6RZAuWD0RZdcfV
         oDpYvc9AToatgG01sPLFbKj68ClmEUQFLHumvjEeS97J4tpVdJ6Hf9WGe/rTi8g86wkr
         B8roN73Cv5fzX6borWYO12Lu2ZN8DlFa31Jf31fNuJORX8TpgL1gQBbR2jS/ILM0ov05
         2flQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199432; x=1773804232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wJB79bVUZrsbxSexjswx340+SsqpUDunWLmQTkIAkcU=;
        b=dUPvcEho+sjXuNYF2OWJ58JX6LyHfG1KfvyUuF8w/MSsraxHgomvW+Y5KStS1nhq8y
         ezCZ+M0JSGdj5BjC3ZkXDhHjCvXM7gBP2uGS8wbeTSb4cOIvRXaPynen2IR0MtCYueJw
         A5zsmxZlYLdsEJEzhENkkGdy/W2SqyVEe3PaGoejQ+yjVO+cM6PBXKrI4p4FVVlVsJOr
         1F0SgDpFc4Rg4ewEXSEw11Gt8BVRtT0/BRNHqVg2DOaJIbUeRJnsttWxJrpKuP6AMSuX
         wuQFLkg+gfp9wObPwtiAQ93/zdERKArDBvx4eMrEpU8AVBabk8E1m0VQb07lS/6nG5PN
         RUrw==
X-Gm-Message-State: AOJu0YyVhIp5kTVk30LgAC4tC1EXlfdk+DNpV5j77RXqyQKvev8b3Ok1
	3s5aPuGQmc8yXlURx3h1gXWPZnK2YQ5ys3yEl6Zyz1Xyh8QFGYqMIIWRGW5V92DfQb3lyuUrxF2
	ejgslJgP/0mDI+8RqC4om8N8Z8zqskTlgT8/L6P9vQc/pNOzyIzMAn2lY4yLhC8wEtMVa
X-Gm-Gg: ATEYQzy/6iKr7wEfSpXiFwXxwDAk65epD/kwWA0UioOfO+gjq+6TbcyQHDfhEHYCRhv
	cZDBi1bWuVAoCOUS7IrCCoU9l6/OAG7kcnMV0Mus8hAN5e5FkAAWY+CKWvbnfyxKno7KQDx4v1Q
	FPLDrBUHH9iCQXKda/ryMz/+YixOzQA+Hq7cWgnuIyZLTwWCRx5VDZ8xBkFleDXhEMcO1zj8n3r
	HEY+sWDMPTm2IpD+uatyGxrE5nrVdeFJHbSuzk1h/9Eqvzv3dBsoEs8uk+pneezerNJRJYQ5TpN
	0WAfIEJKZ2NUl0Zy5XVmMC1AV0W5qCSZ/YHCN43RwqIUdkriqf1okSy11GyjGc4ttfOI6gu3YAT
	+tu7DFGaOPlaNkvJGdI6Mi6LjC/p+/POo98qG1NwlMxvd3FZurO0ONMLVBOQpAjXAhb//X1ix14
	h1BNliWNP1t1zDSWuXHpgBEJDKB98pi2pJLTg=
X-Received: by 2002:a05:6102:cc6:b0:5ff:cb2c:a013 with SMTP id ada2fe7eead31-601def2ae84mr377073137.29.1773199431654;
        Tue, 10 Mar 2026 20:23:51 -0700 (PDT)
X-Received: by 2002:a05:6102:cc6:b0:5ff:cb2c:a013 with SMTP id ada2fe7eead31-601def2ae84mr377064137.29.1773199431215;
        Tue, 10 Mar 2026 20:23:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:07 +0200
Subject: [PATCH v2 13/25] drm/msm/dpu: use new helper to set ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-13-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BQXxAsNkcgoIebP1VAZBuBHx3qvfk0HLeeYsTxoyeyM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAf+MEDFiFXRzUYyYP9Bp3XX7gDytbRI1moX
 AQYEekYgcKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHwAKCRCLPIo+Aiko
 1V0gB/wIaYDlzH6MS3WkaAX++Av89arWPoM5JKEjyf8PpWgMhvDUDFknGf3vd9NzrlX3iaGJn+V
 qWxzovrHwKsOd1YPBRz96EsaAXJLgNSYRHHNFretd4UTmTK56YeeEzOCaZZU9T+9xl+cOQV9urE
 LCPgsCdYAxJniHQaAlKuw9tAU08kYPd8uA4UCf7YInUKdojr/rn7BnrhGC024SQlHc8oJ42SdA2
 UwPop7zg7gbA2saFyUT7Jyye2Im0xKc54qLnpulw+UIXm7mhWAPPJYtw6C1J7dTpLp5pUG/iqS4
 9WmuJE6UX4oECKee1+anJnj9Aoei58aUeoslAzN7yrlW6nUh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: VRLfG354G6ki7meeON5Oh7-KetSlawd3
X-Proofpoint-ORIG-GUID: VRLfG354G6ki7meeON5Oh7-KetSlawd3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX3b7GGI0cUltx
 b9/oL+ro0yhyciKjFqsIj/bk4FqjOJ94DzS4D5ihGZuXYDw9QxfP58SGZ9q8attTSVORK1Ziqqv
 wS14VlxkVdJxfdg6y8DxOfnI3c5uFRZbPFOIhMITXh4RoKp7yLZQJ0E59UhSk+5UH2P865kI6tC
 2J081U+8hCsfyVebLNHq7ERpRXJHtEzV7m0WwJRialSIPf8waOR+YoXcY7caWBpySKGu9A1HMKi
 KkL77kcuZFw3yHE9as3yMX3cEndqaR0lMH2FUxMEUnoZnBHDbCp532v0fzbd3317CGpKZarUWIw
 1iOptbYIdPzvS2t6GgZnnUV7/UR1NgQnrdlmFdlBG1S3bYeiZ+RH8grdYLfhBHgSSOAjbgGIakG
 i0dwjLJ1tm+1EGUsoia1ntIn6iF3CjQ50F43S4ktuUcXYG81TV1G8XwFFdavDbQl23QV1XPtcqD
 8pjwxpUwwbYAVRcgq0g==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b0e048 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=46QewcZEoJiMQYndSOUA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: ADAC025B85B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96838-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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


