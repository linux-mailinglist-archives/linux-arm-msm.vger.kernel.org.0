Return-Path: <linux-arm-msm+bounces-58015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7700FAB7A40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 02:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52959176AA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 00:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390E2227BB9;
	Wed, 14 May 2025 23:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvP18TXu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A40204592
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266767; cv=none; b=F/RLObA/yPjTd8P3XPGlQFZaTGibIUhjgM88qm0FFS8kPX7fuRnUCs82xCay3A3Ncoho2XA+UPxN0wuPMaqoE6KLznqW1zilOwkzM+dSX4ATscz7z2sFps7opb+t3b8piPTt0LrZJMy6LZdz+9lxkeAgli67ivihOPytZko5ckY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266767; c=relaxed/simple;
	bh=BsgyS5TVX9bNk5OPlLRIxhQvZxWCd+vRbBAP94yBF6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UOFX1geRFAIj3+AVO7YdAMBHttxo+jizXS6pnKtBIupKgIn6Iyuozy0OQaVwO+AgR1hNebmwwGvb64hk95a6AnsaaVHuJjZoRy1zP+7WSwHd0N9lBeRwv+M65BtqUaEugaClmgw/mWmkqpYUoOcbIko1nR5s9GTqlI27MNw2FCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvP18TXu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ELpZjw015407
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CuBzJCBuNWzefLz6iW0PPRQ/pOOPIkBFXN2o8I++3E0=; b=UvP18TXuamuHvsm7
	rMy5HDcseGPiLDpmYlQORzLqSuBjYh/ixymmiEMpZYocBMDldUbTgurBpviWIb7i
	+3kZyYkDPzhgLR5qKGwS+wc7P0YRNfrUaa3dtHeFbky4ngVMrPbkalE5Qv+yBeeV
	bSabPoqRCNdXtrOLyuARlgOAecdAAFDIyHcG8eBYopRwfSqkRqd4/LRhF2jSQKVM
	64fvYe8iXnzFexbfp9EIFB84i49QkXiXC1Rwmt999zQxyXZzaZ30bPlAvUfcX6Gu
	QV+efMPOvt+mh9sCeuBpn9yF3uz9CiXnGVVPYc6KD/W2aZ4Q9qhLNQI3HDeDHWio
	VZ1rsw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr499f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 23:52:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22e40e747a3so2926105ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 16:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266763; x=1747871563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuBzJCBuNWzefLz6iW0PPRQ/pOOPIkBFXN2o8I++3E0=;
        b=C6ZepKvOqEjaEmYEq6wfHWt6wi73NFTeqQ29ajGtTJi3DmtAMUWsoJY38mSVoTx+2d
         WM8+l1K/1xhFgNC67E7xo6n+ZEL29xJOj086o6jRGTs16ld41AZlgSAAT8aKq7eiuAQ9
         1W8YtvY0bNVRaucHqlN6Zx8BZl3WspZoTbReYxekvJ7YlfSzxp/5LNCoiuJuqlcfe5+C
         I8olEM/CQtitLpqdZDRvsaxDrCuUCZnJ+Yf3WKfjGrJS1JqSmitNytkcN1NnzIGfZivs
         nmlM1y1s+rtaVSAeWfc8HHWfFKTz2cYOnZ4xKV7pZ/Mfj+OkdqNAgC4/LWCi4jE2wpb5
         9Tww==
X-Forwarded-Encrypted: i=1; AJvYcCXBm0Qj9p5xkxxNEj3sPcUIWlsyLTgUAgWfD8aSxDcpaugrRjY27EeS5Lh/KRAollXwm3IdIfUxyKdJ2R6Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yx22svGPkeKpFH+jK9PMNMjvei6u6mgJasnfebgWMD3yxwsOkW0
	lsyWiI5qzu9d8Xa1zrXFwJLFrDwSH6cexcwlxQzDzvAeXJkiOA/YSDcSp3knkInUVeWRVe6rfyj
	St7zGs0HtvT8jBCRz9+UUT3YQRCm7xFTIbNCs69kFtfBFwrycdtXCCKoTt4/oXCa1
X-Gm-Gg: ASbGncvSJ5DnL6Fi3y3F70ItfDfNqitnXmKxhWaKX5Qe9NMCVXBl6JmEUo4oqsLJOWW
	IWbuVqgRCDzXb/va8sap2ZIx3jKSgityUj5fC5BcMRxOb+SfTpkREnBc6JR17hGtDyO28wOErjn
	XgtziMkSyXtweczqZ/a0qUkrHaAyR38a4sdrdhF2D6bHw2KGq5vw8oFFdr8S69r/Iap9+wSI8/p
	f73Nxh22MZQXnMvKG+OuyJXfCdo1mfLNYn3g4yN5SF4r54KhTLaZSjJP8FINH6FKtFe6h97FNW5
	5Fuz9ScGIwtBGturdONsBmZH5XDxOQtWioub1s2xT9X4B+n2zbuLXRwEquQxo4EiMJN+W2YW
X-Received: by 2002:a17:903:2443:b0:223:2630:6b82 with SMTP id d9443c01a7336-231981058d0mr88360325ad.10.1747266762976;
        Wed, 14 May 2025 16:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhWKAog4NA4K76orc9FFW6gSJW+dnOTRSdWtcPrFRPKjWtNX9etR1Q3S0r4hzqbzyGJBHhvA==
X-Received: by 2002:a17:903:2443:b0:223:2630:6b82 with SMTP id d9443c01a7336-231981058d0mr88359935ad.10.1747266762585;
        Wed, 14 May 2025 16:52:42 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 16:52:42 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Wed, 14 May 2025 16:52:29 -0700
Subject: [PATCH 1/5] drm/msm/dpu: Drop maxwidth from dpu_lm_sub_blks struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-max-mixer-width-v1-1-c8ba0d9bb858@oss.qualcomm.com>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
In-Reply-To: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=2434;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=BsgyS5TVX9bNk5OPlLRIxhQvZxWCd+vRbBAP94yBF6U=;
 b=+Hs/R20Lqd8VjpMZfSaRGzJzzDWiDQddM0F7j5Y2CU07J0IGS2UuXDWrTeLdD0J1T9Z0Tx08T
 cDWAJOqXSD/DQSjH7PLwlw1YvoAZkYmlZNsB+9v5lyJ1pArXfo4dLz/
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: 0BZ2nqbLQlx4G-v6r0_GWuttrBNnkupA
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=68252ccc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=s8xGxOBDnglVIm_wuFwA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 0BZ2nqbLQlx4G-v6r0_GWuttrBNnkupA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfX2m5zrYtjNIdg
 KDhooLTE/1jq9qBVkQHwNYPo75lBZZ9mGV23eq2rdaZ7S+qOR1o/MBPaMVmFn+nNcsjYk2vxqf1
 yTa6iL9WNCGFHj+5pLhQfLykl/2e3SLUnd6zpWtzPU5drUETN717ZsYjt6ZedEgdRk0T4MIbkYG
 wXjUd4QTcxAATYbVQ63TSJbZBMKmKWaU+yk/f25dHJtyqXDqZjA8yzNDYgbj9xMGSeikc6m0ODI
 b6ii9o+BJAnRCzw1Nbo1cVDCKKMV3b4PjCzDijYuAi8DWiLmqKxdGSkzpSPJpHLL3Np4Iv5Ttq5
 JWvavOtS7W+LsVd35GVV3idmCVgslJhH0FnxTx4RtiLT6wVyuPDnNRkcv3gdVt+pQC5C/teL+c8
 KmzQJv3Y28paAFeH8ulosEjbJ9407nRmP+tZIUEpehScER1I1JGF5HSxjGezjiLz+clcBeE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=975
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140222

Drop the unused maxwidth field from the dpu_lm_sub_blks struct

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 64265ca4656a..65f3ebd86270 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -379,7 +379,6 @@ static const struct dpu_sspp_sub_blks dpu_dma_sblk = _DMA_SBLK();
 /* MSM8998 */
 
 static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x50, 0x80, 0xb0, 0x230,
@@ -390,7 +389,6 @@ static const struct dpu_lm_sub_blks msm8998_lm_sblk = {
 /* SDM845 */
 
 static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 11, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x38, 0x50, 0x68, 0x80, 0x98,
@@ -401,7 +399,6 @@ static const struct dpu_lm_sub_blks sdm845_lm_sblk = {
 /* SC7180 */
 
 static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.maxblendstages = 7, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x38, 0x50, 0x68, 0x80, 0x98, 0xb0
@@ -411,7 +408,6 @@ static const struct dpu_lm_sub_blks sc7180_lm_sblk = {
 /* QCM2290 */
 
 static const struct dpu_lm_sub_blks qcm2290_lm_sblk = {
-	.maxwidth = DEFAULT_DPU_LINE_WIDTH,
 	.maxblendstages = 4, /* excluding base layer */
 	.blendstage_base = { /* offsets relative to mixer base */
 		0x20, 0x38, 0x50, 0x68
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4cea19e1a203..5f1f3eae0f6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -390,7 +390,6 @@ struct dpu_sspp_sub_blks {
  * @blendstage_base:        Blend-stage register base offset
  */
 struct dpu_lm_sub_blks {
-	u32 maxwidth;
 	u32 maxblendstages;
 	u32 blendstage_base[MAX_BLOCKS];
 };

-- 
2.49.0


