Return-Path: <linux-arm-msm+bounces-72518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6D6B48720
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0886D1B22D7E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5272F60A7;
	Mon,  8 Sep 2025 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIRXbtpG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890222F3C35
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320076; cv=none; b=Omn7jpAcTR3anfnoPI0WtR0qPZIaGcUyRD2odeo3L6KGCT5kwdfvx7ktdJ3w2oqCVf2ClptC7oHlwMbiPYoptcHKHhcAE31AUfZhIdW2fOAOD3bem/zXSMYJ1E4oaNLXa45DeCxur9V1q3kFNOD8HRwjPmJERQeRQthwUfSdZV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320076; c=relaxed/simple;
	bh=gCVnHvNqEFHEXeSZVUKwjtK61YZKpfeHrmYf0fEaxvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rwfVYWo8BvJQbz2BjUdT95btF7r+SBb+n44dMtNwmxY8zXLk9/0y+2PEhCrllDo/ypJmdNskhBfk/KtAj7y/MPaeCxJJ/TnYsIQ/dAIcNeBaKxfMwawcpSmgDYzWmi+byvGMUexfWxn9w2B4go3vcV4psP9YbufIYPsVTxkGDY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIRXbtpG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Kt1dL003963
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjYclTunnZKXJ32H+XLcYEQN4yrHDXTjo7er5qBOfnY=; b=aIRXbtpGW4XvPsDJ
	dJ5x9qfdn5dwVNcafQpsl1yGbhxRhdvK5kUkDqyFNmFTkZ4xnJktk8dKn/7esj9w
	9SJZN3HX+rHQU+/D+VIh00addNvpMV5X3byqw6SWZkX7uaeEUZdjedLaicFcSjPo
	p24pviherZ5oP6edHc8LNx1Ns7NgloXdtvBPfNP9Qc7SIWOa/mnuRXujThTQTxTs
	29SIUYeustbSzDkqF0hQoKoZshXVPhMBAC4+YIXY54oOm1cggoEQNWrEgA/BlbGI
	9Bbb+pC1U3K/yZFmX8UAqPZsmrBA4r7cDV9EomWFRNeedAPJPyPoQxolVeACUXOq
	3v1o1Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqfuqug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:27:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77260b29516so9991522b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320073; x=1757924873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjYclTunnZKXJ32H+XLcYEQN4yrHDXTjo7er5qBOfnY=;
        b=lKO8JUGGv9G+7klH6pzEjBSPX2Bd1eHxfUFBI/Nav6JKld7aY6Ri4Kko0k8FbFGab6
         LmhuN4AP1wnRDHgY+/flfL4OdqDWLLMIgTPcVfgsgWeCyCmLSnWg/XGrcnjU7l1nH/3d
         UF3sWoSEgK+nyosrAyli7UBdEPf+Q/17QBHQBAXpwF2L90bA+QlO0V7YOnux9zW33XWh
         pKdg6AQQytC7ghMu66nRPWniIXrmHMPyUENESyDaUa4U71j+JyKjC60yLDaPD+VfS+y9
         UBMBeb8A7MOboE+9MwHvx9yc9HBZdER15xOm9LuQBQyFdgLUhp4u0bbTbSU79f/IQPSp
         m2Ag==
X-Gm-Message-State: AOJu0YzAch2PPUIwf2koAjzpyDhX/5gRFbLQm1wgx6YseS6k4c6od/Fy
	V0p4DcKZXW7ZJE5Br+fjFZ/4LVGzAXPh5cWelIGylfjYVlKZUGFz8gZrIsoczeh2kC9NE5RiDuN
	Tp0b2/6mWqFlf6jW3HtvS9E4nqrswAcU5axOEExxrMm7+VrdDGa8uzb8apZdXllb9pv+q
X-Gm-Gg: ASbGncsPXSDv23Fxe4fy9vzU+f84cxP0zoEGYMceSSOEK1MbIK1dAShAh+lqQPW2ELG
	3A4kPZObOAOX/p8Lzj6lR7NlqLNgqOplqiBqTfSWVBaSw6qywj5B10NWOeS5ufZ4rgs5qDxx3fy
	SiJobvcOX5vgT5uemY+qGrL4NAF4Gy3Aa9AN73yPGk/aa7WraDDn4fylFSjVf6jIeIBFWDipivf
	bUBEF5YKy8doDvm3dGPFgIwMInJIXA/jShfU7hyHwxazJ5e0uf5k1TUWVHLknhzbY52kTiG9Y3s
	urRRBwgvDaxA+fTNV1LM6n4Z6eMfHQLwQthmt3S5PehLKBmqsl0+dS9+ZWoTzPM9
X-Received: by 2002:a05:6a00:1789:b0:772:48c5:c758 with SMTP id d2e1a72fcca58-7742dde288bmr10351111b3a.8.1757320072822;
        Mon, 08 Sep 2025 01:27:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoeOm+Hk8wiYTptE53Toghc/9oJAHArmq3zNncrkwsrIFJw9O6pu1iKlKXuhALo7nzpDuBvg==
X-Received: by 2002:a05:6a00:1789:b0:772:48c5:c758 with SMTP id d2e1a72fcca58-7742dde288bmr10351074b3a.8.1757320072269;
        Mon, 08 Sep 2025 01:27:52 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:27:51 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:00 +0530
Subject: [PATCH v2 07/16] drm/msm/adreno: Add fenced regwrite support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-7-631b1080bf91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=6919;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=gCVnHvNqEFHEXeSZVUKwjtK61YZKpfeHrmYf0fEaxvU=;
 b=6ZHRUDeA8ijXXKJL/1600PFk0POlc17dUEsZ7EHSLWucCjIqgHyYg4k91yZdJnKkXCUlbxpRG
 vkz9VG/iKKGA9n8yX/E/7sJcGMOhrRtvJz2q0/CjZcFRS1sR1PfhnRW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: Ndy9TO_Qk-7C4jjGmfRHDDPHq2LQ-jGw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX28+lYT1xlqND
 OzuIzx4bQAcI8bUtmKLrs2cGCHPfwZoWp+NJrikJvbxX8KQ+O6CN57B4l31nBZPepMM8XODAkWy
 CaRcde+N87XgUaGX3VoPOBSdXlzfchTE0VdUV0x5t9eMUsokeUJDecE/Ha6PCpOXDARq5BTdOm0
 yZKpUDYHumXdX2Zi2ktOV+r46wqyLM7h3dN968KYtpGQV2kplZeGzHPiPUXZxh0hppOIQMZiIAj
 VAOVcP7DlXo7HlM32WbLaffnLoi+M3AC/0ZvNWUx4do9YkejGl49XMCyjY+OPGNji94r+tDDB17
 zLPNxG93AthHI/YRsb+EuU3iEdoDxjww/lbjf7D12W/FMQffN4Ee/g9+1L9DBC9YBzxapdhiOH8
 vLzeu25v
X-Proofpoint-GUID: Ndy9TO_Qk-7C4jjGmfRHDDPHq2LQ-jGw
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68be9389 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YYoBuv6U7x1zitwOiNcA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

There are some special registers which are accessible even when GX power
domain is collapsed during an IFPC sleep. Accessing these registers
wakes up GPU from power collapse and allow programming these registers
without additional handshake with GMU. This patch adds support for this
special register write sequence.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 80 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++----
 3 files changed, 90 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 45dd5fd1c2bfcb0a01b71a326c7d95b0f9496d99..a63dad80ef461da45d5c41a042ed4f19d8282ef5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -16,6 +16,84 @@
 
 #define GPU_PAS_ID 13
 
+static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
+{
+	/* Success if !writedropped0/1 */
+	if (!(status & mask))
+		return true;
+
+	udelay(10);
+
+	/* Try to update fenced register again */
+	gpu_write(gpu, offset, value);
+
+	/* We can't do a posted write here because the power domain could be
+	 * in collapse state. So use the heaviest barrier instead
+	 */
+	mb();
+	return false;
+}
+
+static int fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u32 value, u32 mask)
+{
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	u32 status;
+
+	gpu_write(gpu, offset, value);
+
+	/* Nothing else to be done in the case of no-GMU */
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return 0;
+
+	/* We can't do a posted write here because the power domain could be
+	 * in collapse state. So use the heaviest barrier instead
+	 */
+	mb();
+
+	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
+			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
+		return 0;
+
+	/* Try again for another 1ms before failing */
+	gpu_write(gpu, offset, value);
+	mb();
+
+	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
+			fence_status_check(gpu, offset, value, status, mask), 0, 1000)) {
+		/*
+		 * The 'delay' warning is here because the pause to print this
+		 * warning will allow gpu to move to power collapse which
+		 * defeats the purpose of continuous polling for 2 ms
+		 */
+		dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
+				offset);
+		return 0;
+	}
+
+	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
+			offset);
+
+	return -ETIMEDOUT;
+}
+
+int a6xx_fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u64 value, u32 mask, bool is_64b)
+{
+	int ret;
+
+	ret = fenced_write(a6xx_gpu, offset, lower_32_bits(value), mask);
+	if (ret)
+		return ret;
+
+	if (!is_64b)
+		return 0;
+
+	ret = fenced_write(a6xx_gpu, offset + 1, upper_32_bits(value), mask);
+
+	return ret;
+}
+
 static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -86,7 +164,7 @@ static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	/* Update HW if this is the current ring and we are not in preempt*/
 	if (!a6xx_in_preempt(a6xx_gpu)) {
 		if (a6xx_gpu->cur_ring == ring)
-			gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
+			a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, wptr, BIT(0), false);
 		else
 			ring->restore_wptr = true;
 	} else {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 6e71f617fc3d0d564e51650dfed63a18f31042ac..e736c59d566b3fcf8c62a212494e3b110c09caa9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -295,5 +295,6 @@ int a6xx_gpu_state_put(struct msm_gpu_state *state);
 
 void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
+int a6xx_fenced_write(struct a6xx_gpu *gpu, u32 offset, u64 value, u32 mask, bool is_64b);
 
 #endif /* __A6XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 6a12a35dabff1e64aae8440c2a8c88f5feb4803e..10625ffbc4cfc26edc36efcf11dbb4efd55ab3e0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -41,7 +41,7 @@ static inline void set_preempt_state(struct a6xx_gpu *gpu,
 }
 
 /* Write the most recent wptr for the given ring into the hardware */
-static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+static inline void update_wptr(struct a6xx_gpu *a6xx_gpu, struct msm_ringbuffer *ring)
 {
 	unsigned long flags;
 	uint32_t wptr;
@@ -51,7 +51,7 @@ static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	if (ring->restore_wptr) {
 		wptr = get_wptr(ring);
 
-		gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
+		a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, wptr, BIT(0), false);
 
 		ring->restore_wptr = false;
 	}
@@ -172,7 +172,7 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
 
-	update_wptr(gpu, a6xx_gpu->cur_ring);
+	update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
@@ -268,7 +268,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	 */
 	if (!ring || (a6xx_gpu->cur_ring == ring)) {
 		set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
-		update_wptr(gpu, a6xx_gpu->cur_ring);
+		update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
 		set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 		spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
 		return;
@@ -302,13 +302,13 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
-	gpu_write64(gpu,
-		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
-		a6xx_gpu->preempt_smmu_iova[ring->id]);
+	a6xx_fenced_write(a6xx_gpu,
+		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
+		BIT(1), true);
 
-	gpu_write64(gpu,
+	a6xx_fenced_write(a6xx_gpu,
 		REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
-		a6xx_gpu->preempt_iova[ring->id]);
+		a6xx_gpu->preempt_iova[ring->id], BIT(1), true);
 
 	a6xx_gpu->next_ring = ring;
 
@@ -328,7 +328,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	set_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED);
 
 	/* Trigger the preemption */
-	gpu_write(gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl);
+	a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl, BIT(1), false);
 }
 
 static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,

-- 
2.50.1


