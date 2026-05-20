Return-Path: <linux-arm-msm+bounces-108848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHRRMqTpDWrM4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:04:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E42592E34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40BDF339EED6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1443F0773;
	Wed, 20 May 2026 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQ4W+raY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R09rHmag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5853371CE3
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294343; cv=none; b=gwsmQi+IlmHwDBhpPs3BtIapjEZL4/77umG3WO9PAYFjXO87Z4MSW2rm4yZJuwgz/rX+44DqPzt1lXyR4WrqxbGnSkvzeMDgLkjZJ/iAxY/68ap5Hj1QIz0dvgOsGPsJmxR27X+cp6qU+LOSc+GnJLb372tuu9BmcV9H7qq1jWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294343; c=relaxed/simple;
	bh=J21gY2Oa0Lq/I3m/376HfnUTl1mHOuBcWrkSSc/IPj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=APw6Ud18eyea26f3tUbfr/NlMzVtM1jHP6msOTbP5gAjRt1Esk657JY2kcc+QIkLh3W/Mad5MbR2y8wX+K4b8h5nURdPwL6wvTC8td++2N0nYXdcQyD0Pw2r6kWDsrGvVe9nK4zXuU9pLcEBt3S0sKTO46felvKlnnfjB7ppACE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kQ4W+raY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R09rHmag; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDuTDw3680300
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ScHhidnB094
	qXmqcj2I9GQS4JCvqHfks8d61PZbHe84=; b=kQ4W+raYwanWTNXYUy+4w+R+/6G
	1JlIJcqlsLhQinFRAxnJofbf3KoXV8jTrhKDq57cZrOLRKJUDd32Mq2vQBw6nPlb
	luxbSBbUzgQgIDpoYhHg2ZhbJVD4EIHQ4fzzP/m5bUVHtwE+uMiCskHl1gflT2lz
	UpTrh1TpS1Z3JhgTV4/raPf+av5bmNbR+l5t0qIJSeWw3nLQhyT2cevGd4I5tSWM
	Zi1bMr8Ml70Ml0sDGQUeH6+rTO6nVtUqotxoHi1KeUWH4aq2NS24HfME0cAYmjqs
	44Km3s5CC3KNQvrQnCmwZsSqHlazyu6QjodWdkcYhq6Frf89RVRtbYNsdzw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j0p87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36603ad6709so4357194a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294340; x=1779899140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScHhidnB094qXmqcj2I9GQS4JCvqHfks8d61PZbHe84=;
        b=R09rHmagW8y8ejpd3snqaHEmQMXJi1noScHAvMJCamOep0DvlEJlDWzyPyRRW1/Tx5
         GscmW0siqHYq8liNSpUFOxuzz/sdU8z9g/eN1q+ljy9HPVJkLYgo6GNldQ2YM4FCurx7
         oJAtoahNNzY2/KWAREZU5nQA2N+7rmROyuJ6uH856W67R6AJNzkRoQJFWerBuZ8Q6V5Q
         7j4KU+bipXENqlsz7+6srNFy8IaGu1W7p9oNbQb23A3+Jt86stB3oIvILMfNaY56MvZY
         dZ5FYyuz/0EqDklUi+JbECJAaB1DPkOzJJHX58Kvk5frowYxmO2rEkRCiYdQfmOA8iXh
         OxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294340; x=1779899140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ScHhidnB094qXmqcj2I9GQS4JCvqHfks8d61PZbHe84=;
        b=hMS4KRB3jdbJk1wknyXhzF27bbs+ZaeImeTmFrSYZUeHkyXWbN8MI4kIu19bcv8KS7
         4YB458SvIB4uApKeHTBB4/GRZOobPM543qYL1y699BAP8o/IWQ7g8DYDphBDCqQLW47o
         iUv9vybOC1DVhBw4ZdShklMG9Tfw0wT5r+ltNqDvjBw3zF6LJhuTcAy0YmIihGtu8t0R
         qfhule2ExcMu98MRUfvonuYuLYHyLA7FB835E8xo6gS7YnUlsoo/WHdaTKrDwOOJvoV+
         CCMMGbzB4MYIukxcrj3x8ek6zaKYdz6Wa+V+sl6tMu93/eLz3f1IOI6qoT/YwS1v7Htw
         VXEA==
X-Gm-Message-State: AOJu0YxjWBubkr/9/+LhPH551XKFlj9gIfDillgccoIKepg8URulfZTc
	ICgM4W0WYR2WaW1AAfqQpUwifxOYvGeKbY0GgZPyRvOyrBcCpdouJvunRPTWqI0ktUndnLa8a1M
	tlL3OSSdKDegV3TKIp6GdKFo433UBa6eTr9FgEym2ZYZzFaU3ZXX3F3aw1m+JpbFYivhk
X-Gm-Gg: Acq92OF4JZIrCn9hFG87BJ9Vhcj6/lpzrPYenH4Yain4qQd3GgIJV+jNtk/XYgW5FOD
	UNnxezsCKKYk3vhigQXmdoAJlfxzjs/zJdcMkS4ayWwWhVe8eT6d/KNjjpN0wvR8RJl/IFd6xzO
	GsXTDC+0EiBJczrRomnHnTISuhpGwYItytdOpekzetefDlUyR5vcF9PnngQvqSRwO47tpTmhI8X
	iEz6yRi+hvP+Kf5nB1Cn3o9LPyVIbdi1EMnd0+GAqiiNn2rYDeK9n+v//8jOD5tVQvV0oySXnZ1
	Rak1Hjiz1+uVZw119ODzGCBSASzhRmrsGUTxp0GfNOgodVh+Kof0P4eMm+MQmNv47oAXyQNUzYi
	d6DtgwZ6mLZZ9a9MTvdYST2ZuUpu6t/bt
X-Received: by 2002:a17:90b:258b:b0:369:e4d4:7460 with SMTP id 98e67ed59e1d1-369e4d47b07mr11747234a91.21.1779294340081;
        Wed, 20 May 2026 09:25:40 -0700 (PDT)
X-Received: by 2002:a17:90b:258b:b0:369:e4d4:7460 with SMTP id 98e67ed59e1d1-369e4d47b07mr11747189a91.21.1779294339543;
        Wed, 20 May 2026 09:25:39 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3cb3ba0dsm100763a91.1.2026.05.20.09.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:25:38 -0700 (PDT)
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
Subject: [PATCH v8 12/16] drm/msm/a8xx: Add perfcntr flush sequence
Date: Wed, 20 May 2026 09:23:59 -0700
Message-ID: <20260520162454.18391-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
References: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0de084 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=W-43u8CF5Pkpiqpb4b0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 43lRmt6KXE2WfoqvHHUWZQGz7C5gdK9G
X-Proofpoint-ORIG-GUID: 43lRmt6KXE2WfoqvHHUWZQGz7C5gdK9G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OSBTYWx0ZWRfX24xBsv29x0lb
 m7H4/pNO2AiM6jyx1DK56puT3fFpnP9Kxq8S2g2xDLgQvG7Oqa3GYJkW6mKIz4uGzIAMNNkKyqJ
 gwqpng5qZNnAWbf0+e0dnhmAVxIfMbReRpOowdEj1aJWE531hil7Jdcgo3J8rtla1oNuoe0U6pQ
 xnI2RNPy8ET/SISCZWx1re5sRr1zPM85vpl2Qew05I4jCj8NpYnLi3XANcEAe89OIxkozmh4ezF
 /X2goPJxcjWDALi6UAa2NEGiKaTJJNapvKkZzx+c2cC2kB6JGaSloftIQDhwkzCKn2ykUcqsDI4
 M1nhkEUcErL5B1y+mt8WlGuUZlTOdfKtLzLPhvmn4p/1SUWXmnAdmWTGgxEB4rDw41quv/C/jMv
 Qi9fYXGOcDZO3qe1f11S4waOHviHIY9Z4dHZN/HPL/ng8Vo1kF9IuZZd6fdeB/vBi5hL13VdVlC
 FDt4fVljuT5OhkXj7bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200159
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108848-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 37E42592E34
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


