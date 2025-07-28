Return-Path: <linux-arm-msm+bounces-66935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD0B14361
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 22:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AAB13A23B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 20:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEC427877D;
	Mon, 28 Jul 2025 20:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyGqrtlg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293D02798E5
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734865; cv=none; b=pMVk96ZtZ2M2bPZg71S0iiFFTZS1gry1qrssZWk9cv0um/Tifo6LFgnMwne+E8Zy5J8eED39v/pP+wGJHJP9RpckhIz5Ys5oXRERs3YZA5ZhBCD0XIPMMYZiH7/kyfsY2PDVVrZqIBW/MikniosKgqmWOw2SxJD6pnsT3w2FyCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734865; c=relaxed/simple;
	bh=7b70Q5zVK0DyCnXcj0bZzDoejA++eiLTDbI0ImTj2nM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QasHDGhvIkbfWhT/gV/KCxutPfvyjcTc60IYbceJesqQ9gw/SUg8mVq0/g0ABd9Lgz77hN97mkb6hxCmTdU4Ww9GBDJe1xi/q1Xcyhz3UYSamUNiG6GdYK7cZNwuL1ruiEXWBZouJAWdmTUOqmfeZXsQlMFQ8WnQYHiz02ggKN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyGqrtlg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlInt027612
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DJLMxQSPLul
	XmS86Qmm/+/LPCMloXGev8Y4y4Psl0K4=; b=dyGqrtlgUB93eDbcmXDouyadnwJ
	sNmpiwmsgyDI3+qLxbqFJVPzLsU1SWMAl5OOT55TRM0Eukkyn5WFy567grwzxSio
	yEWruDcHGv/Flv2AGfNskRvylbeg8Ulg+Ayrg0Lo7LErC1DcY0B1NoPD5LuGT0Fo
	XRXg/4km8fceVlfaNvyOSIbDzmTJOmLc30F6OxPXktAFheXPggZ5Mhne78PYTQ+3
	TabloM8V0mIuEY21ENDdtGySXV7kTdXRdq2Agwycugt1LlODTTknVh28v4UvvNmu
	jRsCwFsJALaboxqmGHD1HJzmjlZnhbyDFtRMm6vnLJ3Dek7nVlk6tnXAHAw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860enu0gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so3950299a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734862; x=1754339662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJLMxQSPLulXmS86Qmm/+/LPCMloXGev8Y4y4Psl0K4=;
        b=PyU50SiCBX/DMHhetBtrSuhv/SEEPg+afGACyYjMugvF/OFkjw+ltnaj+uusQxLKMH
         8UcpIObnf3lzUGZRkrSuK8RM2SZzAThMXwaYGbPzGgj9ph5CSN3nBuD2JeNzjcdaxacC
         xC7GrLbYolZR5vxRl2kdjHaP6V1XTTNIhpNLIJIEPa0ZA8nWX98F4gQSZZR4QSfbjH2f
         klVMnUPLpl8/yK3uorqAmgrz5Xicc/W6vOV1cl8DrifF8XG6Ihof4VDBIt5pumynOJ7G
         wGuKrmSHECR7S2WflYf4OTTy5CqlOhpVKRxkb+KXeKyMXQGw8/0UZnT86Ie0XdNdWdET
         3AuA==
X-Gm-Message-State: AOJu0YzJJ+50/2Eo4YP8QEatqr2BuoNHqygEJM5umOrllwO37qlsJQ8m
	RToWogW1frS64WXYMKXpacuqieQuniFCijIJinYuPih2kiBazq9Rp+BJyrIGJk1wo6oSur5r4wu
	yfw9v7aV/G9IoR7GwNWecB4RLNkMe9Hvcmc4xk2IETmsju+mpskN0/Yk6XuWXy1qYEDa4iHE7Ky
	+d
X-Gm-Gg: ASbGncu9h+kwMUD/t4F+/KVnSaqQZNcsCjZGQR1oS+0yRhgRSohyMKRYYhT5kZPX9zm
	waaGjR/ufUgTHRcNdd3ylxjm24ns6vOAfs0+k5oeMj1EArSDr0dSDypDa7tNnQ1oeyIkg1CJeUW
	6K9rDI79p8upww9opw+2AOktgsGRzpcZllRfFgr93DViSp5n5Y3XriaQclR1iCXIuJe+7tExe4N
	6jCr3eHW02iPr2GfbJPLAiD8xkubb5HS3xX5Ng0PHZWclG7Ti4qvNWg8rYsnHWhaGhFTpopX+L0
	RmmWlu2D80NTlWtuKmLSjANJA4XxvcqWSicTp34D9u9XbkJPewQ=
X-Received: by 2002:a17:903:1b10:b0:235:2ac3:51f2 with SMTP id d9443c01a7336-23fb3100edcmr234346475ad.45.1753734862413;
        Mon, 28 Jul 2025 13:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuxUhcvGJgtF6rDcn2PilTqgQgn7t0oHSLKPK2e//pz1CGm2wbhZkHISTRxQ7mDDyxLpBecA==
X-Received: by 2002:a17:903:1b10:b0:235:2ac3:51f2 with SMTP id d9443c01a7336-23fb3100edcmr234346205ad.45.1753734862031;
        Mon, 28 Jul 2025 13:34:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-240469a8111sm16679085ad.168.2025.07.28.13.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:34:21 -0700 (PDT)
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
Subject: [PATCH 3/7] drm/msm: Fix order of selector programming in cluster snapshot
Date: Mon, 28 Jul 2025 13:34:03 -0700
Message-ID: <20250728203412.22573-4-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: LONXd6oka5s5q-n3JcK-_AreYI5-V6_n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE0OSBTYWx0ZWRfX5X+MUktQW4sX
 0mPUNRdElPXciV/P7CqIdvGJxB3/9a5JgtbQDpFgc0yUHL/OrfoP9sWkLTUf/RHtBjFrpwz3nHG
 iC0jfXwgQL96DLd6zQRld5HC/X56eH7qZot7NzAlfaOzsHLuwLMCht500Tk9k/2sLtC88HexMjN
 l5cVaLEMXuALLRH+rhFNHJvNeNdaynfw1HiFiyWzva01uC1oUwg7RutqsXbKgJoU1eRnZ/DENEM
 43KmhjAMyUzprTqDYayk8llEF+26vJfFXgNhFFsPQ5fLh80BP0OZRN/DHuhMPSXjMwxpMPa/xPW
 /ljL6h5+plEYTeG8B8emOD0aDi6l+Nxb6EM1+yTaO/FDVINVvHMQ201kHsC9MqLMr+byAcUkggu
 DgCzE0AHT7/7YGsRpVUgdC9yb3X6hM9TlvnV4MsG4qopIdaqtxishyKDmgKI0TO0Cdl5paBm
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=6887decf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=5vtJ6i-I-lkEOiUwjbYA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: LONXd6oka5s5q-n3JcK-_AreYI5-V6_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280149

Program the selector _after_ selecting the aperture.  This aligns with
the downstream driver, and fixes a case where we were failing to capture
ctx0 regs (and presumably what we thought were ctx1 regs were actually
ctx0).

Suggested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index e586577e90de..b253ef38eebf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -759,15 +759,15 @@ static void a7xx_get_cluster(struct msm_gpu *gpu,
 	size_t datasize;
 	int i, regcount = 0;
 
-	/* Some clusters need a selector register to be programmed too */
-	if (cluster->sel)
-		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
-
 	in += CRASHDUMP_WRITE(in, REG_A7XX_CP_APERTURE_CNTL_CD,
 		A7XX_CP_APERTURE_CNTL_CD_PIPE(cluster->pipe_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CLUSTER(cluster->cluster_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CONTEXT(cluster->context_id));
 
+	/* Some clusters need a selector register to be programmed too */
+	if (cluster->sel)
+		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
+
 	for (i = 0; cluster->regs[i] != UINT_MAX; i += 2) {
 		int count = RANGE(cluster->regs, i);
 
-- 
2.50.1


