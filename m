Return-Path: <linux-arm-msm+bounces-81930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E9DC5FF37
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 04:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A35513AB8F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 03:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518261DE4E1;
	Sat, 15 Nov 2025 03:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAWU0XNi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdHMnUSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BDD2AE99
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 03:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763176096; cv=none; b=F6WE3OzYqEGB6py/IReTJC2FBcz6mGjXiPkrgivkS0TFjk9b5CkXfX2baj36KkvD+Ud2BCL+s5DtfBjO4nqX2n55/+cxpY9fNKzmYsYvZHcz30p+6X12lZ8dakDW8t5KwmBt5Mhx8T8E0sUvKybaK6Ts3LWFzhBtE51aeXDIl/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763176096; c=relaxed/simple;
	bh=Ar/QIifOQLCAoE88Y/UPeNAcQ8ZidFpXscg4CHs0wGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bd4PKq80CPdhl42I/cVZSku9Y+tSVDFv55Uz+GhyAWrRzB4usJIbdkU5hHKRiYsnOedFRIyHnbFiqCtcNioTFKTKUmM/E9O66HX6XulDf9fDsPAfpnP7apPnoMMt5LgIle4FyCFVbUPLZfvEN76XabpiSFLLDAuWMFHGIVa6lM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAWU0XNi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdHMnUSj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AF0Jsws1136468
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 03:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U65TdZ0xWh9RTPUOJQQdTg
	JX0pVxkPF+VkIbt7jf5ZY=; b=RAWU0XNicy2pzeWvhi+GH8iUklYxRBrHGlITlP
	In1P47D7RICMJOAHNrspvyOSkViaQ6ui+JklEhXF7C1+O9FYl+YWfe+bcr2DpjpP
	Qi2u4qSFEhCMCL49BL1uRlIJYuKBsmtij8LdhNNk2q6lRxDRjqkOaVwocZboC0hm
	RUDBfOCetco35fIqO15KPz5OdcyEY8AkpDHyaGYjeoVY1mT9+V6uv1aAW5zGqQvD
	noKzpLwjdkFy+TvJaXqpEMISe/VmhC1OZyOaFTaGc73aptncWjfPuNJ66dhsJYU9
	cGL/rTRxCGrZ0GTkHJxkBP2wFhQI2DJ9Y2gaJzjP6A0mCkGg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aeevpr8uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 15 Nov 2025 03:08:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8803f43073bso95046166d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 19:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763176092; x=1763780892; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U65TdZ0xWh9RTPUOJQQdTgJX0pVxkPF+VkIbt7jf5ZY=;
        b=BdHMnUSjtQuUQTEWivKPKDyc3Kqyy+k4g9DivFhZrD7MvPcMLB5NIJlxmc6qvBbwLb
         S2ya59uxbEnRyX1meJeOMA1prXGzoMiu1X1wnRNn0OZg0qIa7/Ewk693E/43Bv7uHsV1
         sfbxkmA6lja1lOAlWz93uPlckAwWJ6j9W5eIqxavV9tphaVhwBncfaou03N+Rtui7AAJ
         upHFBVY7J45g+nELPCaA6Is5aOTV/s+t4/RgrSre6kjPx/XBVlDen0bwbCyWFon6wH8b
         VmXmWcKq2d8HfI0eKx9+xM7VkDkDkL0f40GBF2g5C2mjE9c9X6okWigx2W8odJbuNipR
         R5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763176092; x=1763780892;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U65TdZ0xWh9RTPUOJQQdTgJX0pVxkPF+VkIbt7jf5ZY=;
        b=PitABoMmtXwIQiFW4Z6S9HhCBF1ciHlylYEKRSvA+7hXTPgRpIwfV5R5l1q9VyUQWH
         pmO/dfyg2CGv/taUqFs67dmConJeMG9kzStNk1aipSUn/WJ+GQ7Vi3Wbn7Z2IHzQigGH
         Pci/tECQW1m+dRSeZtsRS45Jmmd447tJYksEcb3Xf0mpWFUu7mZV/rCX4D9kdDNkrKkf
         u0dJQVAfP9RIQ299/jX2OYnPznacwYGTRFxAhtfoNKOiTbnlJIcJ88UDoJx5TaDmstMu
         veIyVIrpSR+eWO3dQHjlgtwUU10ZCdNpTeL+D/7H/qw5OiNeJORlYMldBsgAnuc002tT
         1R6w==
X-Gm-Message-State: AOJu0YzDS1lEMRLF4ozmpK7v3qFBbZ4Pby6mjedEiM5lUEjknvvZXtGX
	JFa45wFL4PzAyNgTUgsRA6lSjbvHHQiqHMchiH3fMd6JtYXAPd7TB/aB7h40DwKDvbNgFCZ2GgU
	BV/CRGQPX67Htnupiy8g8oDME72xP4HfNZp6ZK87dj5ryVRAGwuvChk1kZQV5nl0p8lHY
X-Gm-Gg: ASbGncs7iGhyzooh91IE1bx1DvtpgBnY+sC/Cem24S83qe4Vf/Iw/Qke0BJCBH4XSgG
	MMkputs8N46jdRE0TzD46h5TnzsS2CZ7nBoxPjsizTw7M2DIfZKkNN2UaEtMrM5PE0CK8MGSXcd
	RkvHxJ+Fq2W0qEXJUV1ubw/Mlinppcdyfs//XsvKZjdBZmD0oA+iRofzhlYwPEramcAZujjWWRI
	iYOCeQ0+9tubrfAbtHU80+L5alEYqv3t5pJEuBW1VxDQoG//uMr9vhi5kE72X1iX9UWNNfhrRb6
	djlxd5kMVKhUWPb86OGcrczTxFTXr+wT90cq7d2MfVWoUHmyuYVD0iITY0k2NaepoSBDRMwwd7a
	SD5/KpeSgS96eA2dqqr83BUouWeYRalRWGFoP++bNt4M297/QIEk9TpGi+2G+S/VtCQDgTT/L1x
	FZkiu7OmEP5T5y
X-Received: by 2002:a05:6214:d01:b0:880:51ab:a3e3 with SMTP id 6a1803df08f44-882926e53a2mr72211576d6.67.1763176092590;
        Fri, 14 Nov 2025 19:08:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETRNQmWX8aGvtyoUqPy2210fEEuV0gG5CavmUUbG/DhynOs/idqSmfZ0BxhEj1o5mR+Mms2A==
X-Received: by 2002:a05:6214:d01:b0:880:51ab:a3e3 with SMTP id 6a1803df08f44-882926e53a2mr72211336d6.67.1763176092032;
        Fri, 14 Nov 2025 19:08:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003afsm1470162e87.71.2025.11.14.19.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 19:08:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 15 Nov 2025 05:08:08 +0200
Subject: [PATCH] drm/msm/dpu: disable gamma correction unit on SC7180
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJfuF2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0NT3ZSCUt20zArd9GRdS2PDtNTEZHNTcwNTJaCGgqJUoAzYsOjY2lo
 Ac/x6PVwAAAA=
X-Change-ID: 20251115-dpu-fix-gc-931feac75705
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Federico Amedeo Izzo <federico@izzo.pro>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ar/QIifOQLCAoE88Y/UPeNAcQ8ZidFpXscg4CHs0wGs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpF+6aIYfjo0upzZFrpTKA6w5gwaS8l/xy/i+Bg
 XtDzufUWqyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRfumgAKCRCLPIo+Aiko
 1a4SCACRd6VY2fRsbqKupUjg02if9uHDZMa1MI2Rl7krml3BiE1IJahoi8BOkY3tEwKN6oP+XFE
 HDmVMgWp+LJLImUqHSeoe/QvRjgvoZpq2piGjKWFuuSMsA0LHLIFTDkfKEURPqDIGZ3YSuChfbn
 fuqh/6Kv7+oBml+JT1uNL3UnL4MzG0JjE/hcNBcou161YO0eLGnRwAW6vcG7IU9fowU7cktvB7D
 HcixQQZLA/KwGO9fKVaiHdEfQ+400BUDzbwTRO9G5oMAzQoHVC2+ywnPt1p1AAujIUtwUA/FqlF
 ptdWiKrQHXo0G2VGV0b0weiVkUmu/ntXrC7UQ4GrPffgVg1F
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: IQBtzrrZTckJSSNfRku6wnmVJNuUB7kX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAyNCBTYWx0ZWRfXxQSAzwywe5oC
 6t687Hqqit6zgrAqAWf0VNP6XfH9P8iv6lxUP9hUwCoOAJcYtovJiNIxFQU/x7sCsfIzqPrgIaL
 za9HobAsC6SnvZ5Zubus/bN+QGG9bz2UAhzDyy2rNu1j8P320sfeZ9NMjUUa3NhfQuNrL1rb8Jn
 22ywVKZss/SF1rtdHkg6JqPjhXrUs2sGRRhgcKP7wtfgiuSVXMTc4sBE+FIxWNaZxkiqcA8JqjA
 qgX86EyF1/UBIdV4Zbb8kh/IHA1EGOuwZWwVmk0/+9bSphZPNqwBOwq+9BYM3GJrX1pSwkxmvC7
 dIeR1aOIVgEebZa0gXczOhEa1xGQbHNghVQyyw7RLzHoZI1Q+aLGfQ6L3sY/VjuhfnY5F6ZDZnl
 ozvCyTDAXlobhGzYMybVv8TiYxCufg==
X-Authority-Analysis: v=2.4 cv=NLfYOk6g c=1 sm=1 tr=0 ts=6917ee9d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=njhVRvNgssgpu8VHMlYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: IQBtzrrZTckJSSNfRku6wnmVJNuUB7kX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-15_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511150024

IGT reported test failures with Gamma correction block on SC7180.
Disable GC subblock on SC7180 until we trage the issue.

Cc: Federico Amedeo Izzo <federico@izzo.pro>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Most likely I will squash this into the GC patch
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index c990ba3b5db02d65934179d5ad42bd740f6944b2..b6415adcea10126fb6bb29d60a9d4159052a61ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -103,7 +103,7 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.sblk = &sdm845_dspp_sblk,
+		.sblk = &sc7180_dspp_sblk,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 23bb39b471b71e3f313321ad1c7a6bd4d2159019..bfd34368a03641651530d9c564a74d2e9398f656 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -389,6 +389,15 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
 		.len = 0x90, .version = 0x40000},
 };
 
+/*
+ * Some of Gamma-related IGT tests fail on SC7180. Disable GC until we triage
+ * those failures.
+ */
+static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
+	.pcc = {.name = "pcc", .base = 0x1700,
+		.len = 0x90, .version = 0x40000},
+};
+
 static const struct dpu_dspp_sub_blks sm8750_dspp_sblk = {
 	.pcc = {.name = "pcc", .base = 0x1700,
 		.len = 0x90, .version = 0x60000},

---
base-commit: e2f085ab8636fae2ebe0adf42071e7558234cd7b
change-id: 20251115-dpu-fix-gc-931feac75705

Best regards,
-- 
With best wishes
Dmitry


