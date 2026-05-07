Return-Path: <linux-arm-msm+bounces-106374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO6wCMyP/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:12:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D3A4E8FF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94CF7302E333
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CB6410D24;
	Thu,  7 May 2026 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGkqHeF1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvbQ3sTJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1CD410D03
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159046; cv=none; b=am+ZF7YOUglC9tuMJulRXPRx8F8Owk0nvBA1kEO+fJc4LcFLOuAtkcEc0mFke2/VbqMO2il5vbBeqp5/+0eNI02AvzjBhWy4pUMwEWhkEqS7DdT7uYQZQjKFLMkkqwHffNKrVrA0y/AELZz4WUyc7cXB3RVMW6WlXUpoRoO7bPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159046; c=relaxed/simple;
	bh=7nrYY1d9un3JHGJyq3BRJ2z/M2VzjkpGLEXSGdy8WNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sYdT32HlqALru8y20Pbi1nSjBtW4Ic6PJ+qtADAyOjpI2dDrBBU9QNWofuTTiXJMGbgnsMjxSfWffAaTsJ3yBxgmZ4/pfAilv0oRoBP27gigQ0hnvaEtUdP5+8VbBPNaMY2I9Xsf7S3wfi2qdJG+7AMPUMyGmsovIeOv4YF4+rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGkqHeF1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvbQ3sTJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647A4RAu026480
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ldlgil6T6/5NKJw8KrYulsZxvlpSBIcIWd4s+HQX6w4=; b=ZGkqHeF1URW+SCws
	e9IK+7TJRn6F/L5exOtydPHDI2U/ZaVuyWvSDNjjJYtPAImLL5e2y8IDkwZHaBb9
	H5w2Rits0o5L1Ysk5avfwnDbAYcLdeanRQu0qNnSRygjvyAuS4xzjX906Baa+7GX
	shj7zB/8xcOvPDEP5raWDQttkBWDQN7ZkGV7GhE7kfWb9aa1wLDjV9e4RqMOJfY9
	5ZTakvA904rUPyetsdOf+mLrQ4Ly7Toyi0PvwV60zgLlIvrK0qbodJpsiXZY+Ayy
	kHhTbO679wHBG3pcapmLQz34OZV3mJe47y2j+PLZ6J7uCrKxH7B7bKQ04USEc90m
	2/5e5w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t1yv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:04:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba268cb5e6so10789475ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159043; x=1778763843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ldlgil6T6/5NKJw8KrYulsZxvlpSBIcIWd4s+HQX6w4=;
        b=NvbQ3sTJpcJzzwaMCLPFT+ZZj2/eDLobfLJwuRttyQNK6Nl9TsojY89JvmtLSsP95k
         W1XgCXvZL37PKegKxsRuFHAMCYPNtLoUNF1mBWmo6z04vrCTkarYA6nFW5NwOo6vL4Tq
         aEw8UMWNCvuv3lRXlqMRCHpkC1Er8BbcSWrIb1ImZ0V4XWhlMk1e4niC47tVQyf+gJ4+
         /5u5fsu+L0z3jlBGX/0yvFnbXUQvkmfHgAwg27PY5iEvjKve+D/8qr40by1mvoXGj52D
         H7yMXgtEKJdsSi/n9GtU625twkxoX0Q0bXOVaLQN9GpZGc/Jgz1pU9ObdbnTxi0SFVLq
         6+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159043; x=1778763843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ldlgil6T6/5NKJw8KrYulsZxvlpSBIcIWd4s+HQX6w4=;
        b=LIJ9/QtpbpZInA7cdtW7s1ER4vfuDmUAg2cq68VST4I/tmsOMHhmEuWVRGDL0npzSl
         rS9m1vGODuyIgN15KEox3hwzHYC6bBuX66e9CuweV6RWkxkJnDcys68ngbo5rDAQ276Y
         IwFtoc4WDIpoBALQ6tNJkhP1dwxWlAaSw+m3/Iryuif3MnuZ3DxyhR9Zc4tfGKxtu09/
         KmzvFw5iovIWqP1cndGEcfHsFKWy1phPg/Pjkv/r3hRe87yVSv6thrN2orAWHFlFltiW
         +9G5sRjDk6vys7FLCQ6PDlpJ78pKwuOtRqy2WOc79TAUy2XF04jmn7UnyrZtUOQ00CRx
         S5Sg==
X-Gm-Message-State: AOJu0Yw5zfkXCGMdKR30jbUpF+ql0R1GIPMFNWUWoeRX5eGoboqhUQp8
	k4zkfUfmNJnm01c84OUYfA3JuvoCM+W75qhAuphbjjhR/LJs9Ytwf3hd4CKtKlukPC4TBTtPQLW
	0S8aE+B1HoP76khBaov25MPfjyIgD1xdyqWJKwkW96em8dAEv1NbRfX3GZvWhkTWmZZ8W
X-Gm-Gg: AeBDieuD2+IAYwteNiFwxPaqSw0QrYbqcFFg3xN613oFeSz5ZJZC03GPVdC9lG4XUac
	4W9g0uLQO9YUBjr51Dl2c9/DQqFvjn7INqPrlfFeNH2015A9zp1j4gCAIrmV0aYBXQx0UUpf/+a
	Ev8QZQCny1wE0Z5W4O1UbufTtKLa3AF3vuJsRlZ5Ryk+iaRhUg1iT0cP/kfKLeQ4NauPyBHVKKl
	esCA7IOKgjKUumiux8cyegttlAYiW3738UdZQ9K7hSuZqkkGpaMleW5shogVA+ad+BOgnCElYCK
	uBCiSojhWFtWOwLi5A4JIXchNhokW5xk3pizsChpIvPuKxtPKL+WOYK66hYzqqiR58I5Nm+lOnq
	eqw7TdoxMdGsT+Rn7iLwzfMYL2PHRWrqqtv6m5wG1OTVL+iLkTUCyRsmKpEu/Pl++9UB/7U0HMx
	GUOCtboPnWxKEayupOiBbZaO9te0Olgac5p+0K+zGGJLSrI4AcDyAOrR5H
X-Received: by 2002:a17:902:e98e:b0:2b4:5e65:5d0e with SMTP id d9443c01a7336-2ba78c40260mr59501295ad.10.1778159043044;
        Thu, 07 May 2026 06:04:03 -0700 (PDT)
X-Received: by 2002:a17:902:e98e:b0:2b4:5e65:5d0e with SMTP id d9443c01a7336-2ba78c40260mr59500525ad.10.1778159042416;
        Thu, 07 May 2026 06:04:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:04:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:15 +0300
Subject: [PATCH v4 19/29] drm/msm/adreno: use version ranges in A8xx UBWC
 code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-19-c19593d20c1d@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7nrYY1d9un3JHGJyq3BRJ2z/M2VzjkpGLEXSGdy8WNA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2HFV4iNIrPevcsyGW3PsJzGnufpXhvHluG9
 3Ff4QHdI3GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhwAKCRCLPIo+Aiko
 1QDcB/437NhF9MKKW93Zd05HQPiicGhTU0u6hIPpew+wfkTAC4xq4RwTh1ts1t189E9zzu6VKar
 tW+jE/Bo4MLyoAjJmlMAyprUwA0p6rWl0pgjYNsd25R/FfA8cx6XywsVi6CLTM6JXP1/7nM1VJX
 N21pjP9hgGrVg5J2H7F2dCVWkn4fjK69vxr3q03fJFSiug2T678vJRKJI7oS4d0WHl8XQbbNCZv
 YxRtg3UX7IBa739UqCGDxo6M0dFFz2oDQ7wxVVhlESxhRljaCQr16B554hxXHXI1tMMvm7s7Lc4
 9bMW2hILye+7e8SSFqEzQOdveSaT83ye8L34Wowi2XpNoZ7o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc8dc4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=gyY6hpWVHAyQZ-18BSkA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: OmuuYpgCbFgWJYxZ8tMHL0oceEGuf_iF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX92SWpgcL76rV
 Hrn//Rk6o4znAblJqD7FXfqIatSHDYY/jnhDyufj4NWcOVFRXQtvp2V8VY7YKYGuX4hdggfJPU2
 J1RsbI+oWuNUGZzJV5jgWh+zMFiXjNEYVT9wuzD53tz0CEDF8s8CbcYVMeXs/SPk678BmOtAd0k
 3cePoRvHjkat9yxLP25rinXNhqxX5g+vRCHIPmplRAbO8SYS3nFFM9o+JKZERhm2lRxmQQYfRlA
 CX0yOy+pdg1Dzp0Dv0PyqzxsnmkeAI+ohi8/+mSb5WR3abwfZYrawF5HUAsLjHPsTbHuQwp37cM
 8nQOD2usn3CUeMrppNtawtgNZ1MLmF4sqYZyF1MY8JgjRZTbwm68W8NlElx8Gm2dWF9pSL6RkWB
 lhXEBZCO4oeKRXSvkqJfKsy4K95xsLd5EGPJWFLvZzAvddBcgAxwEIjz/tKAZ4EzQ4IeNIeY4x5
 38T7fNOU2XgY7IXeEAw==
X-Proofpoint-GUID: OmuuYpgCbFgWJYxZ8tMHL0oceEGuf_iF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 26D3A4E8FF5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106374-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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

In order to simplify handling of UBWC minor revisions (like 3.1 or 4.3)
use version ranges instead of a case switch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 5c73a9ebb22b..29d559fe4683 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -286,26 +286,24 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 hbb, hbb_hi, hbb_lo, mode;
 	u8 uavflagprd_inv = 2;
 
-	switch (ubwc_version) {
-	case UBWC_6_0:
+	if (ubwc_version > UBWC_6_0)
+		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
+
+	if (ubwc_version == UBWC_6_0)
 		yuvnotcomptofc = true;
-		rgb565_predicator = true;
-		break;
-	case UBWC_5_0:
-		rgb565_predicator = true;
-		break;
-	case UBWC_4_0:
-		rgb565_predicator = true;
-		fp16compoptdis = true;
+
+	if (ubwc_version < UBWC_5_0 &&
+	    ubwc_version >= UBWC_4_0)
 		rgba8888_lossless = true;
-		break;
-	case UBWC_3_0:
+
+	if (ubwc_version < UBWC_4_3)
 		fp16compoptdis = true;
-		break;
-	default:
-		dev_err(&gpu->pdev->dev, "Unknown UBWC version: 0x%x\n", ubwc_version);
-		break;
-	}
+
+	if (cfg->ubwc_enc_version >= UBWC_4_0)
+		rgb565_predicator = true;
+
+	if (ubwc_version < UBWC_3_0)
+		dev_err(&gpu->pdev->dev, "Unsupported UBWC version: 0x%x\n", ubwc_version);
 
 	mode = qcom_ubwc_version_tag(cfg);
 

-- 
2.47.3


