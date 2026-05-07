Return-Path: <linux-arm-msm+bounces-106383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JRtNXeP/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:11:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761B4E8F5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5278B303ED76
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 938DF4279ED;
	Thu,  7 May 2026 13:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAT2o7Fy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GAC5JmgQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23295426ED6
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159072; cv=none; b=LPq1jhjrTcZn3bYrl+0aTOprgn6wh7aTDiGB3o4mHLM8iSGlcs9bxR+KM34Am/hgALHkRBxBrj5wPloEa6uzB7nPBmHemAG1eh5untxxWCT4SiQidjnJVmyqh0XBChs7y2EFhbIazsAwZah018t74CEWm65DM/X1vQH48Yi4qMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159072; c=relaxed/simple;
	bh=gvMDo6slYGiqJv3R26vftFLiDexyE8LeQxJKV4S7Idw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XwOW7JMdvNlikB4aZBq8tef1NnGvi9NeBc76vhtLbavQqdLSbRydcaFKg9pBPUZmkfoWuhb02/QnibPSuSY3XwAzG46cUpxcvMtVsKt4zlkNN5loOlN+er5gEYNLHHnE68OXHjMUZcMAvqLTmx3GmbNdJ02QM6Gl3TdrYtwPcZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAT2o7Fy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GAC5JmgQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AOmEA879574
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4qvxpoQH2bQDtPLlCKngSNqf1Sqrv1yauYDlLuj2z2E=; b=jAT2o7Fydhfp38/1
	bxu/JYB/3nMY2RtJgEByutw9KgcXpuUyeaHeYt1nZdR3zm9RZejBpyLbhcYA1mvD
	1Oy0JtznyiaFV9zOgtFmyumY0k+k47upz3xBC8Za7PRdBCwjlxocidblZ0/9uXLB
	hnt5LvUnM+Kn++L1jIt57Xko9riY7A0YMgyxF7SOaFZ6x+ksrSGw5CQviZhacaxv
	ASdpCE4WphNKsXozJ+i3Dxe1LQGTq3TGQ68icvl4B8rKtGgonuEct4LwUFvE6wXL
	bP2Bflf035n/Xu/XzEz7eMMnFeSKy4YoyJgI0V9JyU9CUS8dM/byy8ZROxrEn8pE
	ksKwxg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq1vg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:04:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b7aba0af02so10324225ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159069; x=1778763869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qvxpoQH2bQDtPLlCKngSNqf1Sqrv1yauYDlLuj2z2E=;
        b=GAC5JmgQUZf/LLJGsuwibxkBsEOE9ypPj4rtJNKuwcwqtQp/y90LqenaBCc9DCW5ja
         857buDQDtpzsgxUt8FPp13S5H1JCl+MXshGQRUeyPHnMcJDYWNkQiQ9wql+LroRcC8/5
         XpTIISV6hveK0rsawdoVx9Xg01pjIneoRhApLQ5SHvROs44uyOCZ0Q5YhcLd95QSESqZ
         jsb44q31birneDOQ0pPZzWFq2m6W8s1ofYWbfyCxAmUSDPHQd9x7l93DMt8q5mzQ2ox0
         TuSUigUE9ODcQUqhr8iGq495eC1hl64v46lNcOr9ah3axRux9lOSln0NE5//RI8TutxA
         couQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159069; x=1778763869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4qvxpoQH2bQDtPLlCKngSNqf1Sqrv1yauYDlLuj2z2E=;
        b=Jrpbd0VudJOf2KEUl6IVagFkNcQu5WQ87hrUEJmh/6n/Vaxt2BMZt26ALpGbTAFpMd
         WTAFp1gOglrDuiU/tqYiEZXSa95hpoie8QDutuPDc8jZkAnA2IwNJTHEqGEl+Xftz0pC
         D155DEhVOuEaYnGLZ3NZU2+1JPZl6ARltNi5z/0AISu2DeioTt/r6BF0jV4TacW0aVz1
         oUN7LYeacluEAy55IdZDYtEwaDDGG6ce/inmoi2guuho4VdRjCTxltUnkrYkEkCFGPc1
         sfaTMT3lsTEkGHzUccx9ht+o089ycg/6VFCHLCeI8skYK4IT+HMkny24J+L4V9fRms1o
         M1Ug==
X-Gm-Message-State: AOJu0YzRBjsc/IARxpUiBlS+ELTxXUfs2qL4CGgUyKDlBC9NuCTr6u7Y
	dxekxKlB4r71W835CKcKYkH3Xkw7stdOrgg97ej+jT7Srn5rFuxa15oqYF30dALlWTbgM+GeBPK
	XoN/wtIsau1KC1Vrm50NM4rQLVg19ajXCeB502XNMXE2ThqeRWFatp5AXLTZyxhKLIk4azltULF
	UT
X-Gm-Gg: AeBDiet1SklDToXvi5fMqqUsyRCkLdfVHy/yALj0wlE5tyjFdT6FYTR9fhQKTpThOtd
	Ax+N86dljpPlHuxm5N7meEyzOAnmkmHq/c+NpLit8ieO7tALENMMpJBUHOt+D2ZiZT4X8FGTKoT
	ehmnyOcIpNArfLp/+uCT5RS1ko1o3NKLSlIyp/qU/sIAr8trb/GASgZCh8Aw7QqFcZGtgRZIRXn
	xlI+0cKX82slzYFSRob8pF3camYIYLVgTzFIwfH92LGS92pYFAlhxra4aonqGu46VIKIaHpAkKh
	GZlBczyljAHZQpMaq3lL8g7pKEJxg8pfBg+Nf7+GEsguRzTdVTRKs+kzIiLOB6TCMzL2gCtEXVU
	3OQJXIpRXHTyMMhmGiElKg6tC/SCjVrdZOjyGJoWZpCGxWcaaBFVakBSGkzJb9TQKVlyuOLO2LE
	n12Rdo45YBk84uP5+Q418yRwmZXDepcX118fWOQ6dgoa41Kw==
X-Received: by 2002:a17:902:ebc9:b0:2b0:445a:8c7b with SMTP id d9443c01a7336-2ba7928e644mr86459845ad.15.1778159068386;
        Thu, 07 May 2026 06:04:28 -0700 (PDT)
X-Received: by 2002:a17:902:ebc9:b0:2b0:445a:8c7b with SMTP id d9443c01a7336-2ba7928e644mr86458955ad.15.1778159067613;
        Thu, 07 May 2026 06:04:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:04:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:24 +0300
Subject: [PATCH v4 28/29] soc: qcom: ubwc: sort out the rest of the UBWC
 swizzle settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-28-c19593d20c1d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4424;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gvMDo6slYGiqJv3R26vftFLiDexyE8LeQxJKV4S7Idw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2Id2NKe/WGj9GWDX+yBm6UHibLIS83qp3aH
 ga0aLNmTpCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNiAAKCRCLPIo+Aiko
 1fjmB/979mhR6QqIm1YCLdRJ5GbJ1Hc4YUqVoo0XetJAndmbFzBLdLfvJjP46SjkIYTlNPz0OuA
 ABe3Hei0V2jrMSqVWFxitVIl6LKoV4EL5vf205bF7/fnuRNH6x9dKrWtjHEkOKY0mMAlzZHRjbC
 3+rnl2+1dwlVvquF5qRF+nmc8uSsCq/ZENw45MeDkTDBa8WjyuNL+7hLij+Y+bMiLAV+mDa7zCQ
 6NX29CRaa5TIq6EJ0nr7161es1HeBUzIrKis1Y2+L3LJm10kL7l8NsQJqps9/PRMnBiFYFvHo8x
 OYu9z0hwCS6/EE/7lCV+Jr0R2LUDGrOQCSpF1dva0Mf3RhUS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc8ddd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3htL6sknLGLhwEng4zIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: _yN99-Ezb1zxcHBbkTwCcRh0e1PTuRTL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX1l0VZ3EnSrgz
 5ME+CyMpPazpQ0pW9Z5Kb4mDn/Ib2T4JW5/QfRh0Gc8O2ucDPayHT0aG0i1Bn7E29HOOAy3Fp5/
 owzQc1Uc0zZIlwZptxyKrUN2VU+SluzerdLtiUq/WWeTYjYvLJDx4ipbL0owYx4hnXNzpdNZkD+
 nMFtzHxohA4q2iQpjCRE0kYu7DIEKeNp1rZf40Gzp7Bn64OoGqSploBjcznByXgitaABSwM2Jrw
 pSWvG8LTAo/M5SfRD35tHofgjE3UUnS/xKXoAtdtCXO4g/F+EQPsjBZFW9sBnEfQtChOjlsOPz1
 Uorui4d1ZFjsL3oleAdTKf4pGKzVTrD3TkJylHMFyC+O1jlA80D7qappNF3EDL8pwEYph4Av9lg
 k1urMA8CQ3z2pf+tF5Dp08qT9ozoPxiCTNEMvPigkzzsWakPbU/UbfWdUC9EJNem7rhOp+Y3tfW
 Ul+wO3Yq+fxKeMILJFw==
X-Proofpoint-GUID: _yN99-Ezb1zxcHBbkTwCcRh0e1PTuRTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070130
X-Rspamd-Queue-Id: 8761B4E8F5A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106383-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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

Sort out the remaining UBWC swizzle values, using flags to control
whether level 2 and level 3 swizzling are enabled or not.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 16 +++-------------
 include/linux/soc/qcom/ubwc.h  | 26 +++++++++++++-------------
 2 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 2509aed0e743..e9a6063e9297 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -18,16 +18,12 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 
 static const struct qcom_ubwc_cfg_data eliza_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
 	.highest_bank_bit = 15,
 };
 
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
@@ -48,7 +44,7 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
+	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2,
 	.highest_bank_bit = 13,
 };
 
@@ -119,38 +115,32 @@ static const struct qcom_ubwc_cfg_data sm8150_data = {
 
 static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_swizzle = 6,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_swizzle = 0,
+	.flags = UBWC_FLAG_DISABLE_SWIZZLE_LVL2 |
+		 UBWC_FLAG_DISABLE_SWIZZLE_LVL3,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 };
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 7c9506741001..a7372d9c25fb 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -14,15 +14,6 @@
 struct qcom_ubwc_cfg_data {
 	u32 ubwc_enc_version;
 
-	/**
-	 * @ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
-	 *
-	 * UBWC 1.0 always enables all three levels.
-	 * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
-	 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
-	 */
-	u32 ubwc_swizzle;
-
 	/**
 	 * @highest_bank_bit: Highest Bank Bit
 	 *
@@ -30,6 +21,10 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
+
+	unsigned int flags;
+#define UBWC_FLAG_DISABLE_SWIZZLE_LVL2	BIT(0)
+#define UBWC_FLAG_DISABLE_SWIZZLE_LVL3	BIT(1)
 };
 
 #define UBWC_1_0 0x10000000
@@ -98,11 +93,16 @@ static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 		       UBWC_SWIZZLE_ENABLE_LVL2 |
 		       UBWC_SWIZZLE_ENABLE_LVL3;
 
-	if (cfg->ubwc_enc_version < UBWC_4_0)
-		return UBWC_SWIZZLE_ENABLE_LVL2 |
-		       UBWC_SWIZZLE_ENABLE_LVL3;
+	u32 ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			   UBWC_SWIZZLE_ENABLE_LVL3;
+
+	if (cfg->flags & UBWC_FLAG_DISABLE_SWIZZLE_LVL2)
+		ubwc_swizzle &= ~UBWC_SWIZZLE_ENABLE_LVL2;
+
+	if (cfg->flags & UBWC_FLAG_DISABLE_SWIZZLE_LVL3)
+		ubwc_swizzle &= ~UBWC_SWIZZLE_ENABLE_LVL3;
 
-	return cfg->ubwc_swizzle;
+	return ubwc_swizzle;
 }
 
 static inline u32 qcom_ubwc_version_tag(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


