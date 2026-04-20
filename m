Return-Path: <linux-arm-msm+bounces-103852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FmSLZCo5mnTzQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:28:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DB438434A98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2809E3002F41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 22:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F3A3D1CAF;
	Mon, 20 Apr 2026 22:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LjbbeOY2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHEh0LyU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C423D090D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776724052; cv=none; b=Z5eYaZ3rOWg7KudvAoK4KuNcgO5aAVul6kUbk8Z8sUgVcsCzg1QTHr43obeuCi3M/Vl4FTByg7u5F+9ITc/4+G9ZsuKrvKy8LOAfnCrObMPomH6i7E8J2hjtBi/M9+/LVR+zFeIPSc3Z1gP9vk3egUQEksE0sFTyfqWZoVIAdj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776724052; c=relaxed/simple;
	bh=JDrQwNs4919NzZH+8oOH5NbRB+XDVzEr8xdAnJrQeGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0F48EGJJV75aYHzgeSmF0yjiOdtPpSv/JuFSo/cLxjUkGdizH9laFyVm7dnsWogEqbQPx23K8scfxojouZbGohFtg5tMycARTosznwkx53lb2Ic+Tk2FUROj57jPCkyRdhI6UvcXBvIqZH0k1p+SgLlZdR9aCSRgGMS8NcyNpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LjbbeOY2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHEh0LyU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KHQb3r3015211
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IFiZL1NwQ6D
	Due2SMJYnEumDyH19FQ9OaaUBkjM94uI=; b=LjbbeOY22ifHM127fqhgvoCT64J
	gN+RbGjIgH8iiud0O/Tq8uyZ8wg0z7iHG3M+6MyLLRmmYRuDKUXCklPvx+1p6tjL
	dTuQwLACelL4r7PnUIxEZEW5nOdcWUQXQs+e8FX+xT9BSC1Tndz8RWQfsiuDcZrN
	vipEW5qJM3hTs7p0CjWX40fi55CB/6nzb8SXEkkQpo0t2LyDvXiHI+hApN46gxaD
	soItEJ5dre8L1/6M1+ZHZkXTTpuRhRChHiEChc7VrPsH1KtLkBi7GX2Z2einL8cY
	2XsoN90zV9P2rO3+c/sEhOfiHnqHfFCgGQfT4+5icLbMJVzN6Kptkd0vLBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjuktca2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so49564835ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776724047; x=1777328847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFiZL1NwQ6DDue2SMJYnEumDyH19FQ9OaaUBkjM94uI=;
        b=WHEh0LyUhWgMeQQ8SeByMaE1r0HvGr43Gn6VEpNpRCtBqTAnNTu+o7tiumcrnEYhiP
         KV1Y8keJ9ZbHk5iMU3W8Ud0Ao9vHrRGe4/P+fwOy5aN+KE9oVoaDWiygfTj9CX54pXv2
         b43KwTUYIwAa54Uh0RbbvaffEO0dol7dts1Quh9HfnLluwHa+omDlnL3dqvqKcGFR3M6
         etZwATbNavXc4ytitew9tYDUQdWjnQw0OCZ+UQBm/Jzlnr1UMfk8UpeanTtmOjFkyfvB
         FrbeewfBKfmCV/gZ8/9o0/So1V+qLgtVBZx5uP0L3tRQWe5Sy/V241M7QGPnXvtR/V8p
         2CpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776724047; x=1777328847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IFiZL1NwQ6DDue2SMJYnEumDyH19FQ9OaaUBkjM94uI=;
        b=ePO/aAmMdFqLVTwkR85oGxN5NQSxruVQgN1JT427vT7DeyaqFBWHacDw5+EcvNL6Re
         kz8WvfWVed+SUjWYOIhNco6boI2d7YA+iqOLc15cOxXab3+brY+AiWrlAmWcpqPkmhp9
         0fFF9bi/vQK0uAuCNdIDpCd50lVayrkPghEeoLZ98G1V5SrNz0KcAxGsKkYn7jf/1YAM
         T7QL3CJpWyTOI34Kz9NFP55eq3F4pEcQfKQkkoUSqs7yaIuKn/e5rP9LyV45pkEEDPMY
         Mx3x31TT8hoHlpQyW60fBI/GrzpiKlfs9X4w7cl4shnrwPy1rvuqBopTfcIbZrX7Mp4t
         LeuA==
X-Gm-Message-State: AOJu0YxmMKdK4gAPAsREyZJkD2R3i0wr/IulZf3HDr0U41Uf5JQV1tH+
	m8zONe+ZFhsl5gCdhf6jR21XV4JnkcEZaWl93Z0mx3l6G6lRKtCf0p5vDFwyqw/eAzif3bWt4jr
	gFMFFBmoIpdZfiAzSBiFLH1sYV8Aa1aojSaLyJqSo9+nyVk+8XPiRaGJbSQplgD3/Jmpw
X-Gm-Gg: AeBDievTRZztBJQ6Rkejr/T2SSs5uL1/rCqMCL272WVmDKp2DmBEwKHHEEfxnUybCTZ
	71DEX8Dhc5n+HQ/2BnRPXE4TvARNvE+49LrMfJ8lJIGBQ6wYyFkiUtWaOhNIPy0B0dolIKAtcto
	jaCGm+l4o5/VUCuntMVfvPnkyggTDjrJJZZDAJJ8nCTHzj1JnT3knsxeXRK0/n1C8+vhz05tfkh
	vefQZjn6p/F1YJNuEQ1tmSRNuc/vzXD6RjPDuGDfYEsOUS8wGM6M2NbboW2iKpmMnG3uHxEOVU7
	QV20817dXS0sb/d7qnhuQkx1THZePd4RQSP/o0V5y+WPyJX6ChmraaUrarDxcKGVWCI4lQm85fF
	3qnBivtegngN583DZNUwHmL2rxqZMxlj8dcdXk5OeTeE=
X-Received: by 2002:a17:902:cec8:b0:2b0:5b4e:370c with SMTP id d9443c01a7336-2b5f9f8b3ccmr168361185ad.32.1776724047446;
        Mon, 20 Apr 2026 15:27:27 -0700 (PDT)
X-Received: by 2002:a17:902:cec8:b0:2b0:5b4e:370c with SMTP id d9443c01a7336-2b5f9f8b3ccmr168360905ad.32.1776724047015;
        Mon, 20 Apr 2026 15:27:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm115829825ad.54.2026.04.20.15.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:27:26 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 12/13] drm/msm/a8xx: Add perfcntr flush sequence
Date: Mon, 20 Apr 2026 15:25:34 -0700
Message-ID: <20260420222621.417276-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4vXNLkhvn24YPXkDi8ljOFrqFvQKne2x
X-Proofpoint-ORIG-GUID: 4vXNLkhvn24YPXkDi8ljOFrqFvQKne2x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIyMCBTYWx0ZWRfXxkOjO4HP3lMF
 6Qew/kOsjFO6K+bpbPOJJZVkOd4lX2JMVoXpSN8vLWzJS82l47Wk8j5tY8NEv2P1IYHJumjzvi9
 +gwZpUNh/Il/G/Smg35EYD145IyqtVgPeBODBaKZ1/sPy7T0xqau78A4KT0M12Zj4+rVdb7AXuT
 nEpCzdlhky7womk2CmGjxCeaFbKzBMCOWmcM9s3fRKbqW8QcybIfVXup09R4s5YsvaLuzC3wCrl
 QmIQWbTSGYYeNLWg2nS8JyJEtEHTfZj3FbvHE3ZF4wHqrwbO9NwkWyigSJFIrSEjDv7/w0PuNho
 UCM5kwVEoiX1nB9gz9kbuDaXfpXsunipqMIFOHBpyV9SVFAjXVI3M1ICZwTFSlW/v7BrdwUR/2/
 bD0dKYwTN+anrxlelArpTUBReKLHAUw4zv0Sjj7WlK+riWg3yKVoBWoqTeroZBbGdyz+i+KPkG6
 fqp1E6l6I6l94IXTKqQ==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e6a850 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=W-43u8CF5Pkpiqpb4b0A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200220
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103852-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB438434A98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the slice architecture, we need to flush the slice and unslice
counters to perf RAM before reading counters.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 0149eba403e4..e25853909a5c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2918,6 +2918,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 		.progress = a8xx_progress,
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
 		.perfcntr_configure = a6xx_perfcntr_configure,
+		.perfcntr_flush = a8xx_perfcntr_flush,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a8xx_gmu_get_timestamp,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 99c3e55f5ca8..3491a24a9320 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -334,5 +334,6 @@ void a8xx_preempt_hw_init(struct msm_gpu *gpu);
 void a8xx_preempt_trigger(struct msm_gpu *gpu);
 void a8xx_preempt_irq(struct msm_gpu *gpu);
 bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+void a8xx_perfcntr_flush(struct msm_gpu *gpu);
 void a8xx_recover(struct msm_gpu *gpu);
 #endif /* __A6XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 124d315b2469..6c040f718176 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -1345,3 +1345,23 @@ bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	return true;
 }
+
+void a8xx_perfcntr_flush(struct msm_gpu *gpu)
+{
+	u32 val;
+
+	/*
+	 * Flush delta counters (both perf counters and pipe stats) present in
+	 * RBBM_S and RBBM_US to perf RAM logic to get the latest data.
+	 */
+	gpu_write(gpu, REG_A8XX_RBBM_PERFCTR_FLUSH_HOST_CMD, BIT(0));
+	gpu_write(gpu, REG_A8XX_RBBM_SLICE_PERFCTR_FLUSH_HOST_CMD, BIT(0));
+
+	/* Ensure all writes are posted before polling status register */
+	wmb();
+
+	if (gpu_poll_timeout(gpu, REG_A8XX_RBBM_PERFCTR_FLUSH_HOST_STATUS, val,
+			     val & BIT(0), 100, 100 * 1000)) {
+		dev_err(&gpu->pdev->dev, "Perfcounter flush timed out: status=0x%08x\n", val);
+	}
+}
-- 
2.53.0


