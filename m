Return-Path: <linux-arm-msm+bounces-72521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5838FB48728
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CCB1165E55
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690682EB853;
	Mon,  8 Sep 2025 08:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L++RGMzf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08CE2F8BD1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320089; cv=none; b=Rq6wjg/zPwMVydDtsjkymNOnSryIDHCk/EBi4CsRtPJmDd6yFMGByEtZ3W3LJX9aLJndGCohXh7V8vRxE/HGSoa16YFf/EK0cGZGWjrFpTBdzisUYLUbeKfiJE+0Tbxdf6eUSiY1+n5s9egXjBbEHSb7neeAo/bxc/q9PJhY4nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320089; c=relaxed/simple;
	bh=JP84fQZ5StXytXsVMM5Llki3XcWXp1F96tEU7pXVga0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kxixVAEOvU3iYNGs17mU6mihqeOjrEfp3wiEUlqJmxJjc9vcULe8qztiTYfXFJVc3LvwqHgQ2rs3t1uQuDIerdnYoGNwI8eT7wUTfyixaiwvcHrxDImndK0dhMTDueb5/68YAM1Fb76W0fQ3WBLtsPRbP+Sbwek9cdZh/HouuNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L++RGMzf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5886fKP2004725
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y9+0w6aj+VovrkvZGEnCwhaFMPQwBRAyOTuHjX1iCig=; b=L++RGMzf4+i5QMbk
	HVQTrDGcieweY9nc7/oe3xuD4kyBVRiQkjB7X7NfM6AxF4Ae3NcTj18o2x0nrTJA
	YuYbr+BsNUqXhcOH+LVhfyE0ruUeFNLPwa/b9OoLCYpt61nl+j+xS8KLj0ffu+RJ
	QVjpvPtuCrf9mhw9yM1z/B6MoHyk+/eejBszs1kG9jvjK7gWmBEaO/85StJBQK0D
	ZpO9equwUTDmGOcTaJzshcz8GD1TmGMR/HJcBvhtqRymKc/rBz/+2cWXr3Y2GTB6
	DZPO+eDw8/5IHo6R3xkQzzXJGLChzxe1XGALuTBB5pCd2kdQnVRuigKvNGmRmbSH
	OR0Dlw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37r9vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:28:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-324e4c3af5fso4286264a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320086; x=1757924886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9+0w6aj+VovrkvZGEnCwhaFMPQwBRAyOTuHjX1iCig=;
        b=X1H04oT4kNI4pjwxFxnpG+UN6qEAYWejwbLUYJeDhaT/7ywNiyRb6tR52T6oENgrrO
         vlv82bBJZ8pZ3XLJQzEBi/k+9cNGM2qKric03tPXRLPvWF1lKfFnojeNHNdKJpt66UQ0
         e33zpnIH5BOWfUg2EAGraV9Hcqmd/KG+hu68690WjBlhUeWakoVSxjOns1tGWsfjSS5P
         9iq8BRFBdN2gI+S1e6CsXe7HyCYTYXXmQmIxZipZ4oNqNOT3cbLeWI3/H4GUJsYBklj8
         gvUrJaMIG3brhPRqyzBM+jMMQe5MP22aFfgUnfjBGRa+21abaaBcZvJCaYJ+XQQ16m/+
         EL9w==
X-Gm-Message-State: AOJu0Yx0CMaFR7R69+enYs5Fdi/9Z1Q35qJllvv1sZcL7DCpZ7feKNtf
	eZPVL9rxpKhYjZmH2Gzg/HgPCTtCyKdlbbHpxgw0/zHNX1p0hXxe3y3Z3uHtRMPmeZGgDKsV3Gf
	0obl+OlaYugMTSQywTjwxP2adc9qGkeRfcErZ+nTzBfScI/hW4jXXCK0uzDd5R1N2GqyU
X-Gm-Gg: ASbGncvyoT3uje/HM5FgrhVznO072O1kO/Ndd8mqzrySg5cQcY1ZLESANjGPU8nSrwW
	mZ9s4rcUbayVFlmK0YWXW3xDS0vNr6qbeYnjnZfnNfpEirXshNKdH83lyZZOZkf7HjhwVSJ9UWN
	OF2mwUfIX+c+ITCgkWALwmwzHbQZGV3HFJIQzomD2Zg6/Nfsx7I0CjbLTVSEhaV72SR6xjWF2GV
	E7ao84DB8Hjxm2vFe2RIU0j9j0imgznZGyHgXDJtEL3yRTmyK5lDFZJZnpS5ZMZPZCXsMbpFK6r
	d9sqMAgAnV1VHivHsjTJQnKnPERZ+0Icokt4S2fIP1F/fPfIrnwzkgqN/4CeHMPd
X-Received: by 2002:a17:90b:1343:b0:32b:58d4:e9d0 with SMTP id 98e67ed59e1d1-32d43f98ca9mr9661446a91.23.1757320085837;
        Mon, 08 Sep 2025 01:28:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG48xqx8usx8On3LNc8R0d6aOc3he+bmmqnXldSJTuYe4L9QKMkwfBMWCQU7leDED5ti62huQ==
X-Received: by 2002:a17:90b:1343:b0:32b:58d4:e9d0 with SMTP id 98e67ed59e1d1-32d43f98ca9mr9661406a91.23.1757320085236;
        Mon, 08 Sep 2025 01:28:05 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:28:04 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:03 +0530
Subject: [PATCH v2 10/16] drm/msm/a6xx: Poll AHB fence status in GPU IRQ
 handler
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-10-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=3161;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JP84fQZ5StXytXsVMM5Llki3XcWXp1F96tEU7pXVga0=;
 b=LUsR+1o2QFjjj1wszOZBM2K/4buHS5h/22KptVTEaPnZgom85L4OkJTAc+9iGWqfJJZ9neMGZ
 1wvGFoFffvxDQH89Z9ppr4a3DtDHgPViBiVvhp22e8yXWmes4TkkLZe
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 9xb-LiPxkms3DV8x4KfdL1v10oAd7ZFj
X-Proofpoint-GUID: 9xb-LiPxkms3DV8x4KfdL1v10oAd7ZFj
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68be9396 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tkQJxTYZj4y7NR_BhXkA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX13fVx4Ot6EQr
 Os+UADxNJB7VF5hriJpKvltySLLlaDDxCryCTXxRBH8VhwT/7EKmCcBCMcYxgJ+r+mupAU4Bb3w
 C5oDWvPvdZnBxKd0LIL4OkyhKKZNI3XmtujfnPDlet85UZDOlv74J1iZV1vnjG5Yl5JlfZFDLXS
 A1g6rb9Z93GuzwC9kq/v5ZPvMimuT4EdeLJ6CUxGU9LGOgGPsuGTthD6mlFS9084agx5RPQ5052
 gcbcAPiipalyyj8Q1vngYUHYZn49mxvMr0cM6zbT1tFBJ0QKBUPQ/gmYvO1j7wryLiu+XOW1nJP
 YiYu+ApeZjjZTw31AUgZ2Q4ImLoF9HPUt+4ODO/qpXcChlF1Q38gbKAgmkQVcIZI7v10fuzM1IG
 UCJQcRIR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

Even though the GX power domain is kept ON when there is a pending GPU
interrupt, there is a small window of potential race with GMU where it
may move the AHB fence to 'Drop' mode. Once the GMU sees the pending IRQ,
it will move back the fence state to ALLOW mode. Close this race window
by polling for AHB fence to ensure that it is in 'Allow' mode.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  3 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 9494bbed9a1ff86b19acec139d7ab27697d7ec8a..40c4c0445b8e4349c9111850df9c0b1d355f0b73 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -167,6 +167,9 @@ static inline u64 gmu_read64(struct a6xx_gmu *gmu, u32 lo, u32 hi)
 #define gmu_poll_timeout(gmu, addr, val, cond, interval, timeout) \
 	readl_poll_timeout((gmu)->mmio + ((addr) << 2), val, cond, \
 		interval, timeout)
+#define gmu_poll_timeout_atomic(gmu, addr, val, cond, interval, timeout) \
+	readl_poll_timeout_atomic((gmu)->mmio + ((addr) << 2), val, cond, \
+		interval, timeout)
 
 static inline u32 gmu_read_rscc(struct a6xx_gmu *gmu, u32 offset)
 {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c64c84affa6821f79ea74b80b2f2014df38ec918..bba09c02f9809ed24b4a9c30b1eb993ce01c7ec0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1842,6 +1842,28 @@ static void a6xx_gpu_keepalive_vote(struct msm_gpu *gpu, bool on)
 	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, on);
 }
 
+static int irq_poll_fence(struct msm_gpu *gpu)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	u32 status;
+
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return 0;
+
+	if (gmu_poll_timeout_atomic(gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, status, !status, 1, 100)) {
+		u32 rbbm_unmasked = gmu_read(gmu, REG_A6XX_GMU_RBBM_INT_UNMASKED_STATUS);
+
+		dev_err_ratelimited(&gpu->pdev->dev,
+				"irq fence poll timeout, fence_ctrl=0x%x, unmasked_status=0x%x\n",
+				status, rbbm_unmasked);
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
 static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 {
 	struct msm_drm_private *priv = gpu->dev->dev_private;
@@ -1849,6 +1871,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	/* Set keepalive vote to avoid power collapse after RBBM_INT_0_STATUS is read */
 	a6xx_gpu_keepalive_vote(gpu, true);
 
+	if (irq_poll_fence(gpu))
+		goto done;
+
 	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
 
 	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
@@ -1885,6 +1910,7 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
 		a6xx_preempt_irq(gpu);
 
+done:
 	a6xx_gpu_keepalive_vote(gpu, false);
 
 	return IRQ_HANDLED;

-- 
2.50.1


