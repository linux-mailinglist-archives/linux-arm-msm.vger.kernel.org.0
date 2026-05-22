Return-Path: <linux-arm-msm+bounces-109385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GNbKKKXEGpTaAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:51:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7295B88F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84141306788E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359DD377ED2;
	Fri, 22 May 2026 17:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4+/v4X/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7MF2uBu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4744137206F
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471302; cv=none; b=ci8nTcuhVhoZhcTMlp4JdhFqLCrlo3F1oQRaUUzqsjQF/htsY0+opPJdGMY+X5W5HKQkl4/wZyDtb6Jy6Vp6Q/fq/4LPBGxp49oRlzLpqSxM+tyolQSv6mWaMzn246LSL9kJpfp+Gur9t2gX01jfH1i0uIETxDzS+NBwZ4GPWDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471302; c=relaxed/simple;
	bh=J21gY2Oa0Lq/I3m/376HfnUTl1mHOuBcWrkSSc/IPj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tvego9I+1gpaKVRw6ooeS6sGHBv9G2OEhBZlcG6ZQWhQtsX933C3+YuMoyOVggWlUroxu75kXD9s6sp5+e3ZCL73YCDhi6F3f/XWZFSjRzWeduxDiwcFUIurExx3x7BgCoRfyiIy/7GKurLD4tH34Hh2RLO2WRV2jivLzVk8AaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4+/v4X/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7MF2uBu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MGncoZ3947400
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ScHhidnB094
	qXmqcj2I9GQS4JCvqHfks8d61PZbHe84=; b=m4+/v4X/o4BW7Ls1MeaOXECwwcV
	i6E2CAavaSQVwn6N8aS7PORfO/GELoeUzsLV6dI+MQgfeI1Yg/fI5P+NyaH0/T13
	IfUpkd/Od4Xe98YE2x0ZbW2ph8RBwiC5j+R6ddDnlAtUEUsFxMz83o8ougFi/Qpt
	FfO+VLNHiVSUj1Dy51oo3MKHqiOodvATeL9UtiDyL0epGW62pybCASUh+NIyVmvC
	9SXqwFa6ePyTKZJB/H46KDf2b7yJCYBMnReVH93RgoSo5ctGr0OmuHOYbOf6M3du
	CXvKfV1fCuQ7b1bPcaSuIMZLFN4OQWPVmrJR1WH6XsQRmfOvQDvuJnmXAkg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2nhs8u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c82bd90afbbso3944508a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779471299; x=1780076099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScHhidnB094qXmqcj2I9GQS4JCvqHfks8d61PZbHe84=;
        b=T7MF2uBubZaEXZxYTBxjM82QfehEADxoLiPh/k53fOo3cK6+2P0j+JvOthtwQEQvHX
         q13ifvVndDjVS1OMQzRiaqtqHmM9gbGd0mnx0JG1C9fF8k8iY2bZNtH4pQsWHSfsrDTx
         S5YyGWQyZ30lKGb5nJ6LeSjYNG3PVAU9DfrWvDwoSXhMmO+zSedWx2Oas/JzeeChcJZb
         NJDLbIbSNirNTqAZl7aP3EzvCJaRdm77rTd+seAMNer+xYtV19U45JHlPimszl5e3wXD
         w7Cm44Y02Nki753vA1eqQVEIfFVmaSVwCGuNxRTw0YwsurxMtvYXX+FYyyeiVxhEF8ss
         EfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471299; x=1780076099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ScHhidnB094qXmqcj2I9GQS4JCvqHfks8d61PZbHe84=;
        b=JOMd/qRQ956lJQiEsUUKvURDt2t03/WWJ9Cz/7tVNM2gB8thg7q3HN55xFqZY8AbXj
         3RKmo1WPh0ljJG9k4F82ELYSxL7Ke9jksKU+eA1JVhjdXwQSVsOx51+aYFa28K0i001R
         zbosPoI+K+SCffIBoDEtNkkbgRgCAqvj29MO46IuwTF7pi5Gfc19s/JIB9pJQbYH6MlH
         iu5g/3rsxNwWSVZo+WgGWH42zhnqohNP/wKqwh3saWC6blVfgRFxZlTs1aQFfSYTqKhY
         FBLEr5SnxKoEWAFhH6XWSOKnp8MD94HVlokBf0R58KQtcV0iRrkz+qWpBSFcwDkwZOOh
         +3hA==
X-Gm-Message-State: AOJu0YxVmkKZPzkoXxKnxUTXkPx/3TGQX42c8bllARF18AstNfLbfzuY
	comD2dJzRixBjOE5QHjc1Igl4m9tndlPv4Vhc0LmMrbQoOFqkswGzlxCT3QYDV4zqULTBkVeFGB
	jLcXHE1fXkRz6epnV97MrPD0WQQJj9thk5PbfaDzkOPC0KWNsdvxc3WgzgHOAES6SdDrFuIGD+r
	cD
X-Gm-Gg: Acq92OFu2i9jOCb+S/xTlZna4M1DvoGWmTK4LMTwCrhLQbnto2Z5EXUInfECkuPHC/b
	DhwiwuyQk2aWI6NHbAVOJyuUQVqVRVP4nr1fwaLPdmRTEJipvro5JGuHfR+DCItoLRta9ymgYyS
	h43AfZGZc5rZnQC9WzEq9LWtvedvR4q+Dv80b8dSjNr8WwgMlum5WhROSPpthKZZhKFG2Q1hwq8
	xMKMAXqHooarKgr8SXfouTNIkAhNsu4HnW+m4EGnSvQYU0GLPF4ho63nxqHaRObUr9XI+oEDR9O
	M47mdUjSzU9WhkYq+HHbCmGf3u2GGu00jn+aPLx7ThMU/rgPI+jqlLIqR/pR2FmP2BarTZ63NuD
	JglpUlTzA7lBMOrofCScy9Dz0ET8OKLzo
X-Received: by 2002:a05:6a00:4b4f:b0:829:8cfb:df45 with SMTP id d2e1a72fcca58-8415f323ebdmr4617823b3a.15.1779471298537;
        Fri, 22 May 2026 10:34:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b4f:b0:829:8cfb:df45 with SMTP id d2e1a72fcca58-8415f323ebdmr4617789b3a.15.1779471298050;
        Fri, 22 May 2026 10:34:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ff3e00sm2981361b3a.54.2026.05.22.10.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:34:57 -0700 (PDT)
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
Subject: [PATCH v9 12/16] drm/msm/a8xx: Add perfcntr flush sequence
Date: Fri, 22 May 2026 10:32:58 -0700
Message-ID: <20260522173349.55491-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
References: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a1093c3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=W-43u8CF5Pkpiqpb4b0A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: GqiWG0PgVEowycsD3Xp2dR8bniShAMnN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NSBTYWx0ZWRfX1xy3d2hL8CWf
 RXHdYqWAhhUhhDO6abPFeJrrN57BSPSZ2epqu6hI5x/MA++v+B3gNvFHqb5SKW2Y++mBD47FpKH
 JbdS3++5uZ5ednD/F96mgzJvqZE1abqSuKRsl3E3FQWgUrcyZ1/ioAhvARE9P6vDIq3DQbWOJHF
 svp6IsXSfaNC1v6YuvsRwGaUB/Cay2b4gcTIaxkjy+CGPMNmB4tKgkkYJJYFgY1khMbwHQMoPst
 /wuoKl+76Uclyb3E7Y4KmbX4E4FiGhtDka+QU2UKYl8lGOjRwaLdTXfMcZvfKXkJlZwZ7LMYoKH
 3rhozKc7e6RcOAHYvGKWmvjtVOXCiEOmtUwjgBskp9+yS2Vwa3oMY+5Q1HQv4esg0y2fhbEbGPF
 vWP0xiiX2bqtF/qx8S5QlPLOt0B9Aj/Sbyr8RW54mJW84noFfms8+dK/dW7ZqYcV/6uxNK9Tk+z
 TFV1wXbkzDHFjdzZDtg==
X-Proofpoint-ORIG-GUID: GqiWG0PgVEowycsD3Xp2dR8bniShAMnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220175
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109385-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9D7295B88F3
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


