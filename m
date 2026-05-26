Return-Path: <linux-arm-msm+bounces-109870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKHPCMq2FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:05:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A81D65D8491
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C7B333A52CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8BC40C5C2;
	Tue, 26 May 2026 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtRwLKhT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTdwnPnY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD55409628
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807265; cv=none; b=lZmsWjaLbaTTdUufVJGr8kRTQQtcySx7MxCM26KUxCwlA1CrJ8GEiA1jEqVExW6diVEBn7KRYUmgamOzlZrUQ+g6c2tcPAVcXtwopiTyhP0SX3PpPHbFQp+XmmteIiLqEXe9WelbOvzd+1qFKSd7LLahBS3c+baX2H+tASwktJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807265; c=relaxed/simple;
	bh=J21gY2Oa0Lq/I3m/376HfnUTl1mHOuBcWrkSSc/IPj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yo67r1Nt/Xc6J/cakt+iWPjzoQwmLmpecXiqVMrzSNpBncSVvY2rDiH2EmVZIJecBlAq7rOrdWBKxVoPkIbQNOBRrJ6UzGt5KkYcqGDjYgjMc34HIFHfyof23qe5IP4+Glu7QYqCr19+h73UlepnVW9KG3a3adE9r2ihlyC888A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtRwLKhT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YTdwnPnY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsCN12554555
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ScHhidnB094
	qXmqcj2I9GQS4JCvqHfks8d61PZbHe84=; b=gtRwLKhT2ZLfch1ZgVmlohpAHYX
	FRO6WIGAwS4ZvAvcwX7ATl523xxkF4JiGQ1N5giwvT9zOIK3goavJ+Nb1KL2g+h8
	+BHrMaS0SVeUots/M87SETJiC/wQ/avpqk3HGhpcT3HunVkUQYFynHF/MMwE1MaF
	nmTgTfjyMSmBPOpFZLAQLPHQi+nLcR5bFRmqSWO/lGnz5OHNNMpL/1/8Mj6Xxf49
	1rIW1HM23bJRMiThZ2AXhOY1psiPhMRDRk5+sp8Q7nNxTBt3aWbmpL1EaY/U4SfU
	bes92XpOUGB/46IY67IK0ikLS4+/aCkE4MbM6cyiMoacBKtFq0Dk2wRFehg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3tdyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b7aba0af02so102019905ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779807260; x=1780412060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScHhidnB094qXmqcj2I9GQS4JCvqHfks8d61PZbHe84=;
        b=YTdwnPnYwpmbIt5hmNqJFghp6W5zqxhulscPVuzHwmU9ocqbkWqOziZjzoFlY+v0XA
         K0A+8rGax7alx+iMYe0LfLiw7JbkP8rBUnrJeaS2MVitghEzv4TRFF/Id0+dyiyVgfnd
         JD2V886p10UYX5DW7BJ51i/iRMLkJcMhNqyUdjsqWg5/66Tzu5nX6qyw0aal58iD/pop
         LF41SnI9pvm9rHZp/oX30f46Q0g51r9J2SmQgC1nG/k2N8lE5J4MSXtl8CxMgQSPB1tR
         5NsyeTrMp3L0fdEwjiLwKgTrB9uHhPvCYbv4+cncgoVMmy/yLHvBk9edX5+HdvAtWsX9
         /FEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807260; x=1780412060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ScHhidnB094qXmqcj2I9GQS4JCvqHfks8d61PZbHe84=;
        b=NzmJ6z3BZ1Uixfgbq+oNovORD/9WBvhv1aFlJjhRVAN3lqxsFN4QbeSTIDLOv8s0bw
         6uNkJ1S6ePJVRxK+U6qSjac47uyTeWnQYmxcHAc1PSvIwo/XZZGflPiSdAtDjVI0j6FU
         dRZwacYVdLglANRHTzOOZT+NtNIA+0pa8f/gpROcqOMRlT5ADDhOZEKf1+DeiB4hFElj
         igEqJqEyN+H6WAW5TFb2FTeCNjJxOz0WP+S90Kj38tb+G5Qs5gRXAt1Sg9j8hj+wKDdt
         WPiiFl4XAc3wJrf1FzDLLva6shc6GvSwDuFdRfznQe2RkNfHJvmKDtr7gfFT51Rvlz73
         WdSg==
X-Gm-Message-State: AOJu0YyKdzGac3plvQKGxSfKIfdLBrjol9AtEWfMhxri0DZdPH2m6HO5
	Ccx15Q68/vmJHI4jpplc+pbJnxsw0x9n5ur3sOWmdmlH/U0NtJeQPl8STX+KQ2IaaqY2u2o7B/C
	qa/s96tD2XL8aT+yFm27lVkPqfv+V6fQ6BM9vlKlAfkyZHVRrkinZVKVGuHSSaMr11cVL
X-Gm-Gg: Acq92OHeYUuw0gk1Oo1etpLgy/ukKk7tHaw/XULVNT0RRjAIOxMghMX076+leCVYbtE
	a7PPCLgZx41cDyzkYp3WmTCdF+Lv2BuIbb0lu2+sR2UNKTuUyUrz2OTnUmdk5aBqZHopHVNuJ+Y
	glYYq/3S4tcrUenX9YSK5PuBJBuXgsqaQv6QoIJwkWGTpDLruzBxNNeBzJh4tjXIncSUOAgJv/U
	bBemV0niafzFkjNpub07EQXVKYnvO/WSgmn19FYig/4BaQ+lGh7wcEj4loXuuIXL9K+MstcLau1
	t4JjCZ1hu1ew3J3UF1RWhLc+97R/CAaGejb49mLXWeYZkBOttmqCjJCZe55oYhSexD2klQtI6BT
	SoieH0bUuAKW0/53zekAMepgQCl1oqWFi
X-Received: by 2002:a17:903:3c28:b0:2bd:3c1a:473e with SMTP id d9443c01a7336-2beb038b83amr207706715ad.14.1779807260025;
        Tue, 26 May 2026 07:54:20 -0700 (PDT)
X-Received: by 2002:a17:903:3c28:b0:2bd:3c1a:473e with SMTP id d9443c01a7336-2beb038b83amr207706305ad.14.1779807259554;
        Tue, 26 May 2026 07:54:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b387dsm130855465ad.50.2026.05.26.07.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:54:19 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v10 12/16] drm/msm/a8xx: Add perfcntr flush sequence
Date: Tue, 26 May 2026 07:50:46 -0700
Message-ID: <20260526145137.160554-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526145137.160554-1-robin.clark@oss.qualcomm.com>
References: <20260526145137.160554-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNyBTYWx0ZWRfXyRv1RkAnR+Pa
 NaDJxfhHZRRUrUjfaS2awbay6uQbhpATl0hk6WkBFTOSwTYpfjByRdGlYWvumzJlaJljw/JBGAB
 U4SFfSpkIAlqxtb4Wwq8lubKqzAbQ5GagELUY6wEewvejv61lzhS3HvINGPkaVf8Nhnd+b2NuCu
 EsUYSHkZybSK6fnLOwZZnV/tFNZtmFB6q/qfS5ZBJQbxHtG6soLgVxWUsdxSZF7b5bK4GVv5neH
 7tWprxs+g5Pprmcc4Od5Wqgksk5+kELaI4YL2KDoXePIizm+dkhK3mkLS8bk5KkAU4svQcMhkxQ
 6Ishjr3Rp6OyK50Afe3YARM//w826P/j1E8mx+ojqF5ey3YZVEkGvmQK0soOj2+JDseM+uLSuMC
 qlx0AXqw/udUrk8ZXdKl07CVOFc5jVHum4Wngas1pXHRv+ejdXKpCEXFEFOdwyyV7wI72mo1JoE
 D7csY8hFU40Jsat86xQ==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15b41d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=W-43u8CF5Pkpiqpb4b0A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: jnugLwtlsLBQ4ZtwXl1Xtyez6kv-PXQh
X-Proofpoint-GUID: jnugLwtlsLBQ4ZtwXl1Xtyez6kv-PXQh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260127
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109870-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A81D65D8491
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the slice architecture, we need to flush the slice and unslice
counters to perf RAM before reading counters.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 30df9bfa9ef8..a329d20033d7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2921,6 +2921,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
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
2.54.0


