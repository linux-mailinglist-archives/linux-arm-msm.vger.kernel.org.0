Return-Path: <linux-arm-msm+bounces-56628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DF2AA7F13
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 09:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEAE93BD85D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A541A725A;
	Sat,  3 May 2025 07:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kR8en2yb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5445A199223
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 07:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256632; cv=none; b=MyKTWz7dIOl3A5hF+ecD5zPgGaQtr890KY/AwYpdOmuj6pMEgAEAyajHgp8VUb3sdOmKeAtSOTwA2FEvpIXbpZ+MODnh90I48n4x6zx0icHvn5BNDlzH99O1nNtBELSMfcllQpkttYjlN1sWDu2wBlsbo9UqMs/PTBJcCqWSJMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256632; c=relaxed/simple;
	bh=zJfl99w8gPUfrdwYMYw+1yKgLUvglxsypWiv2LeoqZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2Mr4C9u7kfhW5o8OoWalVWOUxwpQmPXDREwvFm8mk5PoEo5VL7taNogNaxsSiaDTKqrf8B6ZY6Xn+1U0yRbNybE+KHipwpzkrAO0QHkqD1wf2hJE1rvoNGAhVomzkhX8In5FU6G76tUap/VYfbxUlcpcp2ZIFel9WYWOlc8HpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kR8en2yb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5435RfpV018107
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 07:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sEr7zBFz0n6zl511rF6sE9zKKxRwyqeRpnXZOdeaNiQ=; b=kR8en2yb463z93zV
	5rKVRy9cKJ9H61s5luCEHfYYubme1UaBDZpvWvaccuC5C0SshcbsAW414TZrBcm2
	hFNwuAdtEQRSvk9S5k53U2o94TXbRNBRckJGVQz2ADL93xTomiM4Z4uUqTn3dcys
	Sr9WVuDlLF8NORP06OkDVYliGFMUhAjn5bYXJTfMpGSQ/9OIt/Qpk3eZloN1l2Ek
	3lcMviJ3UDt/lu7Bb01ubu13733KxV8fq0XljF3OLPzqTh3oMpcBqfxf+/e15TK1
	+vU+zOFqDUggNdnqvlb8WjFrZAe36I/j7h0ZOy0prsL2HwqFHg75T1WBnhP1LdUi
	zPw/ag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc587tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 07:17:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c82c6d72so482913585a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 00:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256628; x=1746861428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEr7zBFz0n6zl511rF6sE9zKKxRwyqeRpnXZOdeaNiQ=;
        b=HLmHSxJ3J5SV5W9wNsasS6+zxzlifyF77c+GgllUFO2TT5EoYBc/7jx/u+l2jFHY5j
         Mv/l7YXigNTiSQMRdaof+37wpEvbrBGxoLzmx6zrZpUJr8lmu1HmYzMzXPyjQpjK+lz4
         E9Vdy1/or8CfKjv8PlshrOeM+aQa5SMY3C2CJYRzkMSTNS4ryZ1/dIyujchFhCwStNPc
         zXz9ulVcjv0UH3NBgw5LduH3bGW5uFaWaEm8dhSFiM6Ck5UQua4dOMmoRskMFwNl4SGp
         EPfuNAQpVHft+gApfzqliy41iGK4EoQi6L/YJMolheJ17LS8VUb/E3KWl8sXpjAfmF/F
         qVyA==
X-Gm-Message-State: AOJu0Yz5IVlJ9esvjY323he1VxhCJWSAWC7zPiamllE1u07GK8QawAbT
	iQO0RfRgEA7pwBantbp6MkM8XjK87ilY/3y1eGDtDOxA0TMM+6M3Yx+pFiQOB0+kPkhdrzdngMZ
	3gsve+ehHr+QNw18evOVDe1WD6Hs60JZ6c8KzQOMs7bA/Y96Y7prTAvgm9L+Xv3Sq
X-Gm-Gg: ASbGncuhgMCDLG6etVkO7diBcgoIlVWFikDPs2HR8I8/JMmfELzEilj5dUkH/e450JR
	2MSY+11NvxArgg8vB26E8ODygo3gEBT4vrdu7OD9L+fVHLHT6egS6SQ4FtDSxXxudM2nRsMTV82
	HA574rHDEVqe0fME+PZgtyfeOJAVVSVvNgexmp9Vr4jefbq1CGD+UM7aSdS0QDYM7TgSafgeA1i
	Z7eob1l/aLY3XdidmSfYsIUkAFppGvrzxh7XFrLoUHaoF2U/Yxm1mzDyE2tvx9MwsWGYiwOiknB
	C/hqzlk/3vniJ9UEhsYTwb17fue4uF9b7WXOnJSt8t9SvD3UO2OwzSYYGqrAfCCt3tsaAUq78oO
	UyFOsSezvtcQ3T0Wd+bf1vJdS
X-Received: by 2002:a05:620a:1aa8:b0:7c7:f7ba:270a with SMTP id af79cd13be357-7cae3b02eb6mr22422885a.47.1746256628046;
        Sat, 03 May 2025 00:17:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxuNK5ghGmRyT7NP7q1v3xNaoSOvLMEMVKgRq2QIsX8OvQ5tOrV+Q08LD59YnphsQP4UwjZQ==
X-Received: by 2002:a05:620a:1aa8:b0:7c7:f7ba:270a with SMTP id af79cd13be357-7cae3b02eb6mr22419985a.47.1746256627581;
        Sat, 03 May 2025 00:17:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:00 +0300
Subject: [PATCH v2 01/11] drm/msm: move wq handling to KMS code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-1-1292cba0f5ad@oss.qualcomm.com>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7139;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zJfl99w8gPUfrdwYMYw+1yKgLUvglxsypWiv2LeoqZ8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4boobfHTQTqHF1uisX+dGBK1t6sn6/8uFzuS26Yqazb1
 oVO4g6djMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAbjIVg6G6bMaDurPTfJIWbJ8
 luKJ5tnRJ+c5/E3/q3e4ue1eleKa4tlVHa2utw+G5n300nfrWrLAwU3uXlfnndCnHyIWTZz9YdO
 P+lM3ooO1Ok+vOWiTe2B2kKrSnzIni3TTymmqfCKh/jFbYjUuV86z/B3RKfz8hNyMsmtuhYs1a0
 XnLl90zvmxbAefSubVoFm71rxkcVrP4xg3WcMwbNk0nm9uyW6/haflz75/ecU/0z92V5ZlbPRTu
 d4p2OKRuHXZ7h8vnhXNSbzo7G5Vd31xUXPfYRmZvM28mxYYLeEXmLFtk8+0UA6Gi6cc4y+xfrDn
 Me60XVN9r/Wu9ps7M2WqnbNbWT4lWd01rPmyppY/cGUEAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: sBmGphoBjUCHtLW1bjS1j1sU8aQMiguF
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=6815c2f5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=lygNIV2IR02mpmLRnqcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: sBmGphoBjUCHtLW1bjS1j1sU8aQMiguF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfX+89kmvY1szSv
 Rg8ak9O/IswI5k1qNGdOKb7lRrXYi82uDOAnAIg3JmEisWeQGj74yMQarbbuE9Hgo4J79cJVVM0
 ORCPsNrzWUWJmkUkp/GbCIRBcySACH/Pfl6CAFW1ahFXOYOzTTjYrUZuxIQe5xPCTeaJqPPjLxx
 C95wV3rRsrFaujIBmBrzyJ1MvpBtRkzArynl5SKEMksgT5GWzqEK/1Bm1DKZ9wYs/xNOf1moxTd
 0zy5R1Ci51VRnu0rTPDHGXwxv+6PcCcpkR6b6PuKfUKkpsZcyy6ysHKlzerMAzuhH4i5WEg2s2/
 WWPpq6TKEBcm1y61e/DJswtDQifhJCfXIBPW9i1WFQV57OZBwdc3wtaxkgEw4Sw7Owp55L3kAO6
 R8yZaNi2WlUz+Wxpd3Ot1WWRuoLu/eXKAPPpKKOFEF00D/NglFZeDTSGclBzHN338Kmoqan4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030061

The global workqueue is only used for vblanks inside KMS code. Move
allocation / flushing / deallcation of it to msm_kms.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c   |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c   |  2 +-
 drivers/gpu/drm/msm/msm_drv.c               | 21 ++-------------------
 drivers/gpu/drm/msm/msm_drv.h               |  2 --
 drivers/gpu/drm/msm/msm_kms.c               | 11 +++++++++--
 drivers/gpu/drm/msm/msm_kms.h               |  8 ++++++++
 7 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f9c46180b8f7ace9122e74015244334c1f13ef2b..1aaed1cd9ec58fed3230acda4c283f0eedf3a9f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -980,7 +980,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 			return 0;
 		}
 
-		queue_delayed_work(priv->wq, &dpu_enc->delayed_off_work,
+		queue_delayed_work(priv->kms->wq, &dpu_enc->delayed_off_work,
 				   msecs_to_jiffies(dpu_enc->idle_timeout));
 
 		trace_dpu_enc_rc(DRMID(drm_enc), sw_event,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
index b8610aa806eaeb540e76a6a17283faea6f482a99..5e1e62256c382426f70d21a5312fb40dda68d695 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c
@@ -511,7 +511,7 @@ static void mdp4_crtc_vblank_irq(struct mdp_irq *irq, uint32_t irqstatus)
 
 	if (pending & PENDING_CURSOR) {
 		update_cursor(crtc);
-		drm_flip_work_commit(&mdp4_crtc->unref_cursor_work, priv->wq);
+		drm_flip_work_commit(&mdp4_crtc->unref_cursor_work, priv->kms->wq);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 0f653e62b4a008e3bafe09ee7fb4399e1fccb722..fce2365753e22850e56521e82b9d9dca29c09280 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -1196,7 +1196,7 @@ static void mdp5_crtc_vblank_irq(struct mdp_irq *irq, uint32_t irqstatus)
 	}
 
 	if (pending & PENDING_CURSOR)
-		drm_flip_work_commit(&mdp5_crtc->unref_cursor_work, priv->wq);
+		drm_flip_work_commit(&mdp5_crtc->unref_cursor_work, priv->kms->wq);
 }
 
 static void mdp5_crtc_err_irq(struct mdp_irq *irq, uint32_t irqstatus)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f316e6776f672e7a97268f716040d0cf73256c4b..78cea9d4999488648b4131a2da425fb349d1b664 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -82,13 +82,6 @@ static int msm_drm_uninit(struct device *dev)
 			drm_atomic_helper_shutdown(ddev);
 	}
 
-	/* We must cancel and cleanup any pending vblank enable/disable
-	 * work before msm_irq_uninstall() to avoid work re-enabling an
-	 * irq after uninstall has disabled it.
-	 */
-
-	flush_workqueue(priv->wq);
-
 	msm_gem_shrinker_cleanup(ddev);
 
 	msm_perf_debugfs_cleanup(priv);
@@ -104,8 +97,6 @@ static int msm_drm_uninit(struct device *dev)
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
 
-	destroy_workqueue(priv->wq);
-
 	return 0;
 }
 
@@ -227,12 +218,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	ddev->dev_private = priv;
 	priv->dev = ddev;
 
-	priv->wq = alloc_ordered_workqueue("msm", 0);
-	if (!priv->wq) {
-		ret = -ENOMEM;
-		goto err_put_dev;
-	}
-
 	INIT_LIST_HEAD(&priv->objects);
 	mutex_init(&priv->obj_lock);
 
@@ -253,12 +238,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (priv->kms_init) {
 		ret = drmm_mode_config_init(ddev);
 		if (ret)
-			goto err_destroy_wq;
+			goto err_put_dev;
 	}
 
 	ret = msm_init_vram(ddev);
 	if (ret)
-		goto err_destroy_wq;
+		goto err_put_dev;
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
@@ -304,8 +289,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 err_deinit_vram:
 	msm_deinit_vram(ddev);
-err_destroy_wq:
-	destroy_workqueue(priv->wq);
 err_put_dev:
 	drm_dev_put(ddev);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a65077855201746c37ee742364b61116565f3794..cc603bd4729e909e9381a3c277db262b13361de6 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -177,8 +177,6 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
-	struct workqueue_struct *wq;
-
 	unsigned int num_crtcs;
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 35d5397e73b4c5cb90b1770e8570277e782be7ec..184a4503fef0deff7234a3ce332e0bf564fbce46 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -137,7 +137,7 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
 	vbl_work->enable = enable;
 	vbl_work->priv = priv;
 
-	queue_work(priv->wq, &vbl_work->work);
+	queue_work(priv->kms->wq, &vbl_work->work);
 
 	return 0;
 }
@@ -227,6 +227,13 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	BUG_ON(!kms);
 
+	/* We must cancel and cleanup any pending vblank enable/disable
+	 * work before msm_irq_uninstall() to avoid work re-enabling an
+	 * irq after uninstall has disabled it.
+	 */
+
+	flush_workqueue(kms->wq);
+
 	/* clean up event worker threads */
 	for (i = 0; i < priv->num_crtcs; i++) {
 		if (priv->event_thread[i].worker)
@@ -261,7 +268,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		return ret;
+		goto err_msm_uninit;
 	}
 
 	/* Enable normalization of plane zpos */
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 43b58d052ee6aae0ce34d09c88e1e1c34f9c52ef..e52649bbee7dc6a80abfecf7f8d5bcfad3d8f60b 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -153,6 +153,8 @@ struct msm_kms {
 	struct mutex commit_lock[MAX_CRTCS];
 	unsigned pending_crtc_mask;
 	struct msm_pending_timer pending_timers[MAX_CRTCS];
+
+	struct workqueue_struct *wq;
 };
 
 static inline int msm_kms_init(struct msm_kms *kms,
@@ -165,6 +167,10 @@ static inline int msm_kms_init(struct msm_kms *kms,
 
 	kms->funcs = funcs;
 
+	kms->wq = alloc_ordered_workqueue("msm", 0);
+	if (!kms->wq)
+		return -ENOMEM;
+
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++) {
 		ret = msm_atomic_init_pending_timer(&kms->pending_timers[i], kms, i);
 		if (ret) {
@@ -181,6 +187,8 @@ static inline void msm_kms_destroy(struct msm_kms *kms)
 
 	for (i = 0; i < ARRAY_SIZE(kms->pending_timers); i++)
 		msm_atomic_destroy_pending_timer(&kms->pending_timers[i]);
+
+	destroy_workqueue(kms->wq);
 }
 
 #define for_each_crtc_mask(dev, crtc, crtc_mask) \

-- 
2.39.5


