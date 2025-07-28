Return-Path: <linux-arm-msm+bounces-66934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1B8B14357
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 22:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5540D160F56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 20:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF9B279DA0;
	Mon, 28 Jul 2025 20:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jiT+1fOi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B772265281
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734864; cv=none; b=jxzM5ROdrg2ioarH+ZJ2X/IJpo4lXTSJbwBBcFwCEmGsPb3Ga8OWpLLgtLP1xYwCkvxhjOsrB/8femI1KlqujNfVul97RkTeJC032AuSWFJAEhTvP7H9kZXoLb+ddRBjZw4jqIGUz2twXSXj1N+sh85Q+cVOjEV6dHtYs/HCVxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734864; c=relaxed/simple;
	bh=XjzBbwfbdEpy4W7vo1Z59g8aiB5UZLToq3ha1Cf9kVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZaw3Y/H/ep3Cy4sjjRybJ+w/t60ao26NxtkqlLuyeQ6fPmZjPzKvoImmMyF4jOBbIKZfK1l6zQIwOR6Mu3UM09KGkW0lUQTZXRWBEVoIu6RoshkYZg/k1vouQWiNIQl0Fc82tnDXSg6aDqmYjQb4/yrOfgD/ujKcxjaT+Thy9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jiT+1fOi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlJAk004997
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V64f0Tb0OQD
	ZfJWk6fOVfLfxBrme2uWqEWKLnRNchS8=; b=jiT+1fOi7qMSWQineZfxMnSUJP5
	ZM12idTth0Sysc5CpoKal88rAKbyegcqFNu0H36UAXrgZIFkPSFAbeDolJWOkrDp
	bbc7cwg3Oou7t+XYG0jWNGZ2Z+jDEmSuhL+zu1NAsQffTFmUab0wX5JGwLGwgXuF
	n1sDd4tCKqP1PzxqNiDAnkOaNKXYq2N5aHV6RrzaRLU+XEI0aPeNhEm3OAzSAs+M
	vxwEtnXvJotzFkXJAkQ6eGdxC/Y9eohw+Z2cAJO6/Cnq3jzyjliwEbgBuCKWzp4t
	4ZxjksQm/pOoikZFVyTYdzQEncofAa2yriCjepEV8V9isZ+YnA4fqLVagqg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytx06u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31ea14cc097so1964775a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734861; x=1754339661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V64f0Tb0OQDZfJWk6fOVfLfxBrme2uWqEWKLnRNchS8=;
        b=pxaXeaJeovr1CadXBOkbR5Enno2lfJcQKaL8neRAo4XM1Pdr7j8cGpzwefivSqCxRO
         PMNDPXYJy+i+kCbllOBzwbiwOzCmnhQ3P1IC5bflZL7lRmFbF+Js4JfcpQBU+zsAYmQH
         IPIE936itFMiLfzsxHdyVoUQJUrZGZlMi9n+aZHIDYs45n5GXvQUk54NSOjxKhpcCG9t
         00aSKa38/qrGDei6CfDD41Ib3haIrAbtba9zaOKQ6ZowVSilpLJ5YNeosWSNlss2Zydf
         lW2805t6zPyuoc4ex/DH6dmHiJF8KfYzwmghYCv1aOI5rfUilTAaxXBstRBSFXUhSfM4
         mYnw==
X-Gm-Message-State: AOJu0Yx6b5XbBFd8w7/FUvjRCf939XD8Ccc/W+5gN+U/KSl4626IixK8
	by+ZvPScfVDmdx6hUh1PMSQOM/6dNJptfRebIxhAdQnfjsQBN1/FjntbibWTI2SPaItEZF7EHmY
	AyyQoCUQBzZIwPYKOQQGXjPlTxo6LzbbeCOg4rXAd28li74tUBlhlLANZ2NAfT1TRElbP
X-Gm-Gg: ASbGnctZSlcQ3uLeuyFKHKJr4zzhWBsMdJFE3KdgMYCaBzTszpxALXSx9CwuP6N7Jfk
	MlbTiJoXjCcKAPLnocY2JZZPESFYc1Ra+ORcLm3BB9+zK9PuOS29fZwWeA7O/ovUKEnfiAgG9/e
	LxrhJdf0bzHZk4xAAre/dosbGWAHN0bURvSgNHUBUr3LfpXOtYaZ/wLd0SBodYJubguOpXwYOIJ
	ZdNlr6Tjv7YNTLkBL1rvpbnfIoV/yOtJRJNXlI+6o+iDG3kzvcmYhdMhNovyel3Sm7L/REUQmql
	FvfeaohykM+uX/dF7KOx/9MFNu7utixXfhmk8YMA3JHk2DHbBns=
X-Received: by 2002:a17:90a:e187:b0:315:6f2b:ce53 with SMTP id 98e67ed59e1d1-31e77a02a27mr17887866a91.25.1753734861184;
        Mon, 28 Jul 2025 13:34:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR1UArWMnuT3Lfnq40WABT+az9jBP7E1GXqzV/gWXAwAyfbyAPGCkeu5AZxQwL8MukowkpPA==
X-Received: by 2002:a17:90a:e187:b0:315:6f2b:ce53 with SMTP id 98e67ed59e1d1-31e77a02a27mr17887830a91.25.1753734860615;
        Mon, 28 Jul 2025 13:34:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31eb413d7basm4771303a91.16.2025.07.28.13.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:34:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/7] drm/msm: Fix section names and sizes
Date: Mon, 28 Jul 2025 13:34:02 -0700
Message-ID: <20250728203412.22573-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Zms9TkWliHJF4Q65YDueTTiF1fGjvXWE
X-Proofpoint-ORIG-GUID: Zms9TkWliHJF4Q65YDueTTiF1fGjvXWE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE1MSBTYWx0ZWRfX5zXVUoIrsQxn
 ItepO8vSTGW2XLAIwoO3JlJqLAMXO0qb2liBPGIGIfn6dQfxGTrOoCapKIIJ/kHPBs8Zay7128W
 LE+0801VIRgUy9V0fUlquaXQq2JVmvAJoTAt3fI8neQeCzNlTD4CaID25BDaJlWAbLsPOYGNb+P
 uEP6E9a49GKh/QPzs+jRcARtGoBfgicwr2nIPfrNR7qgOP5rXtnBXBISbCiMFGHb8Jh9SSwS6O7
 GCdryOd1j9Vyz+XPPZ1ygX8oCtJTyBvlfoY6DyzaLBZz1YR/nJFisGHQ3Uo0E3Ill24MMA+srUP
 nnrVJaFg0AirU8h79x1gYt8iybv6aUG03vsOMzKTVVnnZNnY0TbgKPiBt6cB/uKXaqoTO/EkodA
 gfGmvP66lgNSeqc0pfjk9DwaQ8Zeo5Qx9qhi8NDYkBjjpeavObsth/BQj5Ad2RPO61xva5F3
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6887dece cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=BuD92i612R-MOt5tPB4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280151

The section names randomly appended _DATA or _ADDR in many cases, and/or
didn't match the reg names.  Fix them so crashdec can properly resolve
the section names back to reg names.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   | 38 +++++++++----------
 .../drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 24 ++++++------
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 95d93ac6812a..1c18499b60bb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -419,47 +419,47 @@ static const struct a6xx_indexed_registers a6xx_indexed_reglist[] = {
 		REG_A6XX_CP_SQE_STAT_DATA, 0x33, NULL },
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
 		REG_A6XX_CP_DRAW_STATE_DATA, 0x100, NULL },
-	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
+	{ "CP_SQE_UCODE_DBG", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
 		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x8000, NULL },
-	{ "CP_ROQ", REG_A6XX_CP_ROQ_DBG_ADDR,
+	{ "CP_ROQ_DBG", REG_A6XX_CP_ROQ_DBG_ADDR,
 		REG_A6XX_CP_ROQ_DBG_DATA, 0, a6xx_get_cp_roq_size},
 };
 
 static const struct a6xx_indexed_registers a7xx_indexed_reglist[] = {
 	{ "CP_SQE_STAT", REG_A6XX_CP_SQE_STAT_ADDR,
-		REG_A6XX_CP_SQE_STAT_DATA, 0x33, NULL },
+		REG_A6XX_CP_SQE_STAT_DATA, 0x40, NULL },
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
 		REG_A6XX_CP_DRAW_STATE_DATA, 0x100, NULL },
-	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
+	{ "CP_SQE_UCODE_DBG", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
 		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x8000, NULL },
-	{ "CP_BV_SQE_STAT_ADDR", REG_A7XX_CP_BV_SQE_STAT_ADDR,
-		REG_A7XX_CP_BV_SQE_STAT_DATA, 0x33, NULL },
-	{ "CP_BV_DRAW_STATE_ADDR", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
+	{ "CP_BV_SQE_STAT", REG_A7XX_CP_BV_SQE_STAT_ADDR,
+		REG_A7XX_CP_BV_SQE_STAT_DATA, 0x40, NULL },
+	{ "CP_BV_DRAW_STATE", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
 		REG_A7XX_CP_BV_DRAW_STATE_DATA, 0x100, NULL },
-	{ "CP_BV_SQE_UCODE_DBG_ADDR", REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR,
+	{ "CP_BV_SQE_UCODE_DBG", REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR,
 		REG_A7XX_CP_BV_SQE_UCODE_DBG_DATA, 0x8000, NULL },
-	{ "CP_SQE_AC_STAT_ADDR", REG_A7XX_CP_SQE_AC_STAT_ADDR,
-		REG_A7XX_CP_SQE_AC_STAT_DATA, 0x33, NULL },
-	{ "CP_LPAC_DRAW_STATE_ADDR", REG_A7XX_CP_LPAC_DRAW_STATE_ADDR,
+	{ "CP_SQE_AC_STAT", REG_A7XX_CP_SQE_AC_STAT_ADDR,
+		REG_A7XX_CP_SQE_AC_STAT_DATA, 0x40, NULL },
+	{ "CP_LPAC_DRAW_STATE", REG_A7XX_CP_LPAC_DRAW_STATE_ADDR,
 		REG_A7XX_CP_LPAC_DRAW_STATE_DATA, 0x100, NULL },
-	{ "CP_SQE_AC_UCODE_DBG_ADDR", REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR,
+	{ "CP_SQE_AC_UCODE_DBG", REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR,
 		REG_A7XX_CP_SQE_AC_UCODE_DBG_DATA, 0x8000, NULL },
-	{ "CP_LPAC_FIFO_DBG_ADDR", REG_A7XX_CP_LPAC_FIFO_DBG_ADDR,
+	{ "CP_LPAC_FIFO_DBG", REG_A7XX_CP_LPAC_FIFO_DBG_ADDR,
 		REG_A7XX_CP_LPAC_FIFO_DBG_DATA, 0x40, NULL },
-	{ "CP_ROQ", REG_A6XX_CP_ROQ_DBG_ADDR,
+	{ "CP_ROQ_DBG", REG_A6XX_CP_ROQ_DBG_ADDR,
 		REG_A6XX_CP_ROQ_DBG_DATA, 0, a7xx_get_cp_roq_size },
 };
 
 static const struct a6xx_indexed_registers a6xx_cp_mempool_indexed = {
-	"CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
+	"CP_MEM_POOL_DBG", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
 		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2060, NULL,
 };
 
 static const struct a6xx_indexed_registers a7xx_cp_bv_mempool_indexed[] = {
-	{ "CP_MEMPOOL", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
-		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2100, NULL },
-	{ "CP_BV_MEMPOOL", REG_A7XX_CP_BV_MEM_POOL_DBG_ADDR,
-		REG_A7XX_CP_BV_MEM_POOL_DBG_DATA, 0x2100, NULL },
+	{ "CP_MEM_POOL_DBG", REG_A6XX_CP_MEM_POOL_DBG_ADDR,
+		REG_A6XX_CP_MEM_POOL_DBG_DATA, 0x2200, NULL },
+	{ "CP_BV_MEM_POOL_DBG", REG_A7XX_CP_BV_MEM_POOL_DBG_ADDR,
+		REG_A7XX_CP_BV_MEM_POOL_DBG_DATA, 0x2200, NULL },
 };
 
 #define DEBUGBUS(_id, _count) { .id = _id, .name = #_id, .count = _count }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
index e02cabb39f19..fc62820c0a9d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
@@ -1299,29 +1299,29 @@ static struct a6xx_indexed_registers gen7_9_0_cp_indexed_reg_list[] = {
 		REG_A6XX_CP_SQE_STAT_DATA, 0x00040},
 	{ "CP_DRAW_STATE", REG_A6XX_CP_DRAW_STATE_ADDR,
 		REG_A6XX_CP_DRAW_STATE_DATA, 0x00200},
-	{ "CP_ROQ", REG_A6XX_CP_ROQ_DBG_ADDR,
+	{ "CP_ROQ_DBG", REG_A6XX_CP_ROQ_DBG_ADDR,
 		REG_A6XX_CP_ROQ_DBG_DATA, 0x00800},
-	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
+	{ "CP_UCODE_DBG", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
 		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x08000},
-	{ "CP_BV_DRAW_STATE_ADDR", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
+	{ "CP_BV_DRAW_STATE", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
 		REG_A7XX_CP_BV_DRAW_STATE_DATA, 0x00200},
-	{ "CP_BV_ROQ_DBG_ADDR", REG_A7XX_CP_BV_ROQ_DBG_ADDR,
+	{ "CP_BV_ROQ_DBG", REG_A7XX_CP_BV_ROQ_DBG_ADDR,
 		REG_A7XX_CP_BV_ROQ_DBG_DATA, 0x00800},
-	{ "CP_BV_SQE_UCODE_DBG_ADDR", REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR,
+	{ "CP_BV_SQE_UCODE_DBG", REG_A7XX_CP_BV_SQE_UCODE_DBG_ADDR,
 		REG_A7XX_CP_BV_SQE_UCODE_DBG_DATA, 0x08000},
-	{ "CP_BV_SQE_STAT_ADDR", REG_A7XX_CP_BV_SQE_STAT_ADDR,
+	{ "CP_BV_SQE_STAT", REG_A7XX_CP_BV_SQE_STAT_ADDR,
 		REG_A7XX_CP_BV_SQE_STAT_DATA, 0x00040},
-	{ "CP_RESOURCE_TBL", REG_A7XX_CP_RESOURCE_TABLE_DBG_ADDR,
+	{ "CP_RESOURCE_TABLE_DBG", REG_A7XX_CP_RESOURCE_TABLE_DBG_ADDR,
 		REG_A7XX_CP_RESOURCE_TABLE_DBG_DATA, 0x04100},
-	{ "CP_LPAC_DRAW_STATE_ADDR", REG_A7XX_CP_LPAC_DRAW_STATE_ADDR,
+	{ "CP_LPAC_DRAW_STATE", REG_A7XX_CP_LPAC_DRAW_STATE_ADDR,
 		REG_A7XX_CP_LPAC_DRAW_STATE_DATA, 0x00200},
-	{ "CP_LPAC_ROQ", REG_A7XX_CP_LPAC_ROQ_DBG_ADDR,
+	{ "CP_LPAC_ROQ_DBG", REG_A7XX_CP_LPAC_ROQ_DBG_ADDR,
 		REG_A7XX_CP_LPAC_ROQ_DBG_DATA, 0x00200},
-	{ "CP_SQE_AC_UCODE_DBG_ADDR", REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR,
+	{ "CP_SQE_AC_UCODE_DBG", REG_A7XX_CP_SQE_AC_UCODE_DBG_ADDR,
 		REG_A7XX_CP_SQE_AC_UCODE_DBG_DATA, 0x08000},
-	{ "CP_SQE_AC_STAT_ADDR", REG_A7XX_CP_SQE_AC_STAT_ADDR,
+	{ "CP_SQE_AC_STAT", REG_A7XX_CP_SQE_AC_STAT_ADDR,
 		REG_A7XX_CP_SQE_AC_STAT_DATA, 0x00040},
-	{ "CP_LPAC_FIFO_DBG_ADDR", REG_A7XX_CP_LPAC_FIFO_DBG_ADDR,
+	{ "CP_LPAC_FIFO_DBG", REG_A7XX_CP_LPAC_FIFO_DBG_ADDR,
 		REG_A7XX_CP_LPAC_FIFO_DBG_DATA, 0x00040},
 	{ "CP_AQE_ROQ_0", REG_A7XX_CP_AQE_ROQ_DBG_ADDR_0,
 		REG_A7XX_CP_AQE_ROQ_DBG_DATA_0, 0x00100},
-- 
2.50.1


