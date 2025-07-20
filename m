Return-Path: <linux-arm-msm+bounces-65798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E6BB0B603
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 14:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0DE7189BC67
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26972202F7C;
	Sun, 20 Jul 2025 12:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+UdZTmG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508DF2147E5
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753013862; cv=none; b=qy6u9yTfhMgIid8p2MoiTOCpiS0d6RrUUu3ky3pMO+VnaRBONVabbG/Iw8XZCzaebgHOljo9kVzINVKily1yR99rktZfHLI1CWRp/sJSi9c7bXJOQql5QGwUKg0r/24Uc1ppwkWyJTuSw4WwH4312g4oAgfp7h+Mlg9AYxiwV7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753013862; c=relaxed/simple;
	bh=92w4ozCPNKwCPL77+wX422Eit7Q9t+OWWUxkAhscsWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ULV4eg+nsNirAFWdlj77eg5flq9UY3ufTwfkGhpQXwyEyUSfaRfga+7tVCFocM1FOFE88jlEIqy6AE0gIeK0ztOVKxV3Bmvio/WsN15WKK7tgR3CBuZGQALHaQgioIzWbopD6VSIf4EqGAlES7gE/oTFshbQG1CSbFvdm3rtCoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+UdZTmG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K6MbsU002182
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZtnI8bcnbJXKJYAmBx3Wywp2wMJJNt4wjH+SLXdqKvI=; b=I+UdZTmG7AIsch+N
	R/lAxZjJeZZvblxgTIpthuHtV3ZsFJFaEnRL1YtNqstC+YesU2PmLf1NzN9dEAMD
	YBdPfgVxqRxaxGtTH4xYXvxsPcmPQvEkp7h0JgUen4ZduE+llJRjTSOUnSC+pImp
	TEaiNiFYLMw55S6yVTGG4LXp4K1rx02vc1bryYryUpjvYQJr7wat24V4vkFvq1FS
	Mj75mY2z6OScDGxbBmC27prhCKWMJN5i8E+qN3jtYQUyiRpPYG1AjctAIf0LZlW2
	YCrhI4X/HcZCBezbJyjQXqWbqLHUpHAeMeeSPPMu230kh985taihug1oCb2Uvdlh
	c3ODYg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q26t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b00e4358a34so2327459a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 05:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753013851; x=1753618651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtnI8bcnbJXKJYAmBx3Wywp2wMJJNt4wjH+SLXdqKvI=;
        b=R/nH0g+doA5ousTZsCiHMqfw9jm9L47VxSwKKwgE6ls9MaDEg2EzUBgCKTxC4mroN2
         po8pGsmlxVe5tvhtgjdMkx4ML5V/YkB+sdn4Pvq1lYtIMF7PJUeqt2e91vFUlyTcN3dO
         Ef0MxUZ0/s3sHty6UB97NJ7SCeisuEDH9b9P8uo2wBOamZtzJKoJI2WTA+7AMN9i4iyu
         EnyGunaFuly4GRtPHhNSFfOdBEyzLmx/25unFgYllg6axY6Vzmb+W/EbLdFm8I7X/T8R
         AJKAePFOBLropSetZRndmtB5w/o86i0ePs3Tm0DHQYcOhy7VmNbvLYha41ahlTpo9Ul2
         j1Hw==
X-Gm-Message-State: AOJu0Yw1chu/4uiKKpSxRUzH5HdvMOsdcvesBU8/RG8pBmu66AVJ/P7L
	ZBeTrfDoFxqFXhzJw6gflOepGW6LBYOoELM7edspAGW0zihlekfBftGkvnCDs3JFullhM1ubHcf
	8vML5yqbTmfLTSKTzXIrbRSBWKP5boowjne9SoawNk/zPwSBXRYj2mYpXdT2NUD5WfU/9ucnZ8Q
	Z4
X-Gm-Gg: ASbGncsLRpB19FbWTbp+kKtqsOTO7gQHAdpAPld70eMTm8f0var0ddPhWnwf2VpTbtk
	VQyosrjNTttSHBoRpZI3VzyrlLEq0QKoQ7kAzbw6pqj9i17Vl9KAcUg+L2LZP5Dp90n7JWLo5C2
	WDxotLdJINUhevpd4rvXt48POyVJM0nwTQ7Af76qMn7EqsgC6BEnIhKVeSrypTaLnxDtv4TbUAx
	GIgKg1Xd2UmSd+KXoUFwX7l2pQgdf8EDMS21aFSVDVllJf/TFlAWab2o4habbgRlSKeiWdOtVtc
	9e4JV4tqUlPZmsESmspNXy/0i4gZ/Y6Q2WA8iZknueXxhY+85rj5LneaWG6pN+Iz
X-Received: by 2002:a05:6a21:2d4c:b0:234:8b24:1088 with SMTP id adf61e73a8af0-23811d5b78fmr24683988637.3.1753013850888;
        Sun, 20 Jul 2025 05:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx30tjF6gwYV7rkqRpaVYmG5lbPA8fIxGKqVeIgZ+j/bE8yXx0Xojg3IZCKQ0lFLGMlIHAiA==
X-Received: by 2002:a05:6a21:2d4c:b0:234:8b24:1088 with SMTP id adf61e73a8af0-23811d5b78fmr24683956637.3.1753013850453;
        Sun, 20 Jul 2025 05:17:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 05:17:30 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:11 +0530
Subject: [PATCH 10/17] drm/msm/a6xx: Poll AHB fence status in GPU IRQ
 handler
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-10-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=3057;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=92w4ozCPNKwCPL77+wX422Eit7Q9t+OWWUxkAhscsWA=;
 b=GQNmGNlfhWDoudZenUlVQZEBDuln8mN+w2UiZ/6l95GobP3bnS2kxBzqeshY1HiueMRoDaGUT
 O+P2jLcMz4IDaEzPlxZEMhTZVCvN2h2PpyhVOzrCbV3vbmH3lao0Xb0
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX2wWQwvfstD74
 tNxeg82kOtKiP1oafAYuf7XpcxVimX+L+JMvDX06jBIqtVMqTDbtpAqKfoGoKZnGcPMTl/XpURW
 3ruWhLZ3NwVTaXt5bSQLLB+wMRq/OwFTIuSi1Pn9666vcuELoQ5OEztuc8wo/vvlLnSv2oVNLc6
 pTRsIojtMpxpWw+jdtGijDcChP9yGF0crAKzN1bXO7z2TC8ZWYHUr6MvLK2pajeE6muPacWcIAk
 Czp061h8CsHCQ2CuRt9VUfVxRVGAegL7PtuFY0XFJRmEFfCW/jeKQ1pSvwI1LEvSXZv1tjWZDJd
 LmnoAmk8Vp+n1HfxI0ogBe4J4e8AliOWA9NsRB+db5MU9I9ViFnCYf+LdaYmNmqraM+Z9qWp8uX
 r5etT1yZoXe33tm/tUMD8lqaptyrSen8Jih/dX0TG01MjnILmicSLf+1B9cKY3dGKbXlK3yD
X-Proofpoint-ORIG-GUID: b-N7X-kue-tCvccgEausfiIRxmIjN8IZ
X-Proofpoint-GUID: b-N7X-kue-tCvccgEausfiIRxmIjN8IZ
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687cde62 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=TOkoRBElmyVxNVlyPtAA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=619 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200118

Even though GX power domain is kept ON when there is a pending GPU
interrupt, there is a small window of potential race with GMU where it
may move the AHB fence to 'Drop' mode. Close this race window by polling
for AHB fence to ensure that it is in 'Allow' mode.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  3 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 034f1b4e5a3fb9cd601bfbe6d06d64e5ace3b6e7..62c98b198551f26b99bd6e094f8fa35e16ec550d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -164,6 +164,9 @@ static inline u64 gmu_read64(struct a6xx_gmu *gmu, u32 lo, u32 hi)
 #define gmu_poll_timeout(gmu, addr, val, cond, interval, timeout) \
 	readl_poll_timeout((gmu)->mmio + ((addr) << 2), val, cond, \
 		interval, timeout)
+#define gmu_poll_timeout_atomic(gmu, addr, val, cond, interval, timeout) \
+	readl_poll_timeout_atomic((gmu)->mmio + ((addr) << 2), val, cond, \
+		interval, timeout)
 
 static inline u32 gmu_read_rscc(struct a6xx_gmu *gmu, u32 offset)
 {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f000915a4c2698a85b45bd3c92e590f14999d10d..e331cbdb117df6cfa8ae0e4c44a5aa91ba93f8eb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1823,6 +1823,28 @@ static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
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
@@ -1830,6 +1852,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	/* Set keepalive vote to avoid power collapse after RBBM_INT_0_STATUS is read */
 	set_keepalive_vote(gpu, true);
 
+	if (irq_poll_fence(gpu))
+		goto done;
+
 	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
 
 	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
@@ -1866,6 +1891,7 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
 		a6xx_preempt_irq(gpu);
 
+done:
 	set_keepalive_vote(gpu, false);
 
 	return IRQ_HANDLED;

-- 
2.50.1


