Return-Path: <linux-arm-msm+bounces-31911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F2397AF7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 13:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F126728233A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 11:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E182E183CDE;
	Tue, 17 Sep 2024 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJRMoUdP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1768F77;
	Tue, 17 Sep 2024 11:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726571674; cv=none; b=Xx6bX08TENBY65qt6g9mn82zzJM58cN4UtOpa8PVO8TkN8OiS8expasnpetqMTe6ORfk8NDh+bzsrjzP0hOjf1z86xOJeRKYRXf9yRC6HN1ItDBeObKDOBv9D2ahGVDVUNNfAZxqvD+pG1MCkxt4qmaOSHaBj+RIaUa2bbxzbW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726571674; c=relaxed/simple;
	bh=uVBrI6wVx1n6T/pyX+S9UNsE7LkxG9VdyK6yWV2qSzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aNxgRsydac/CYEKO6jGKTgd7JGoh+U05tA7mRZJMhAUe3bDLy8Sy2I4RGvPOot2rkk+9vtymY8aBdLls3gXo3iyfywTSDB1by3Ug7KRGXkWenXm3l7CnV+zuQLbwt7B5zBnKnOla2HCvVlMemrNbYlnFDRw5L+u4BjHpFp8SV3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJRMoUdP; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8d51a7d6f5so621823266b.2;
        Tue, 17 Sep 2024 04:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726571670; x=1727176470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T53Fc1+tXbQoklFjHHb5K5Wy1HQMuvtm+3p3+subdyE=;
        b=fJRMoUdPkBfIlFHxaeR+xz0CyakVa+Kx3uC5WDmiFCANZl1thdx8y4KZW5sripGlp8
         7m8uyaM8ZQVMHD5IdAUAmZBOmzQ+pP+klbz0XDy4C3n2YwgFHSeJE3uZuketCA7pLl0R
         SsnKQfUjZbIilWuMyUneX3GdmEpux2N2m6V8RWakLeXptQ+mvf7IHn57UCnxb9oeiE5b
         RAU8aFeWXUyMZ6EprsQhvuJunQtrdqW2G3ty4sDAE4+CG33s94gZwjZ2UDd+Mttvfamh
         jKw95kqbF/E6zO9LyEg6Cbp+7Lv68STdUgtzHpcUUY0iq2hA6aUD/2CTy+H8Pe3QmvCw
         xFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726571670; x=1727176470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T53Fc1+tXbQoklFjHHb5K5Wy1HQMuvtm+3p3+subdyE=;
        b=YsfgwMzWynHOfn0beWXBbQpm07jjOYPRhKKM6QRLSIijGMxy5to6qp4hXAQLCEwrvC
         W93TSVezcr66x1Wgbk9zHfx4IoTcmouBemSJAbolxkA8QIp0oYESET5lr70EYrbxMJwt
         wEbpmZHza7o8GRZ3BDgfhXBTSnJOB3tEY0ANM7TpjsEbYfswEB/enLQzExqTFjpgRjbQ
         j0GhiefxwRQVCEicsU+TFfrUWmteC3xBspkEPPjCnGXHs1sDYi6jnqhY1ghLTmBa/arq
         LL9HLBOZZhGnTht6p2Zd+wNKU7X81HTiZ+NjZptX9Qs0pYU4Xc1eSsnK91UZm+3CRz1e
         dZOA==
X-Forwarded-Encrypted: i=1; AJvYcCUZb6KS4OTsQUwepTlEfcVazM2vpIvzh8NFcyH9wC5j0GW+j/unuBH9nlRSsjUcn9ZWh/JuV/tEcGk=@vger.kernel.org, AJvYcCWpcnPw05BZXEhqj+bQtzam0E4JAiX+jwjaO8BvH9IWtgRwTso9bIPN3exAVhuM6/6+IkoUi5NcdVMOdmKM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxli2b8jHbxngb/lU2rltADHETk3A3in6nIqTTIWEerUi3uIFo
	EXvOhY2Wk27lyR91yStHhQHQpK26wR1mvTO4As8ZnVUbXusomSpV
X-Google-Smtp-Source: AGHT+IEIzW4PRkk3JHcFfsn6c2qt4ToVwRDageTMuR+bxRM68CQPkrwM5fnvueWJBRzLCGtNcUPC7w==
X-Received: by 2002:a17:907:6d14:b0:a8e:a578:2b63 with SMTP id a640c23a62f3a-a902966303amr2110761066b.55.1726571670103;
        Tue, 17 Sep 2024 04:14:30 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it. [82.51.105.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 04:14:29 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:19 +0200
Subject: [PATCH v4 09/11] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-9-95d48012e0ac@gmail.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=3106;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=uVBrI6wVx1n6T/pyX+S9UNsE7LkxG9VdyK6yWV2qSzc=;
 b=HOGcngbU7MQRl1pDL2NaJQtKGukFCPXEBThmDSzTkTooxD8JHEvoeKS5p6DcySSylehxuAqma
 EIpixhT2AdpBdiGMphbXXaHq0ehQx9biio4gYgmg2FzIRNuYs0WN9T6
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Some userspace changes are necessary so add a flag for userspace to
advertise support for preemption when creating the submitqueue.

When this flag is not set preemption will not be allowed in the middle
of the submitted IBs therefore mantaining compatibility with older
userspace.

The flag is rejected if preemption is not supported on the target, this
allows userspace to know whether preemption is supported.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
 drivers/gpu/drm/msm/msm_submitqueue.c |  3 +++
 include/uapi/drm/msm_drm.h            |  5 ++++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 736f475d696f..edbcb6d229ba 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -430,8 +430,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_SET_MARKER, 1);
 	OUT_RING(ring, 0x101); /* IFPC disable */
 
-	OUT_PKT7(ring, CP_SET_MARKER, 1);
-	OUT_RING(ring, 0x00d); /* IB1LIST start */
+	if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
+		OUT_PKT7(ring, CP_SET_MARKER, 1);
+		OUT_RING(ring, 0x00d); /* IB1LIST start */
+	}
 
 	/* Submit the commands */
 	for (i = 0; i < submit->nr_cmds; i++) {
@@ -462,8 +464,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 			update_shadow_rptr(gpu, ring);
 	}
 
-	OUT_PKT7(ring, CP_SET_MARKER, 1);
-	OUT_RING(ring, 0x00e); /* IB1LIST end */
+	if (submit->queue->flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT) {
+		OUT_PKT7(ring, CP_SET_MARKER, 1);
+		OUT_RING(ring, 0x00e); /* IB1LIST end */
+	}
 
 	get_stats_counter(ring, REG_A7XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_end));
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 0e803125a325..9b3ffca3f3b4 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -170,6 +170,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!priv->gpu)
 		return -ENODEV;
 
+	if (flags & MSM_SUBMITQUEUE_ALLOW_PREEMPT && priv->gpu->nr_rings == 1)
+		return -EINVAL;
+
 	ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
 	if (ret)
 		return ret;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3fca72f73861..f37858db34e6 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -345,7 +345,10 @@ struct drm_msm_gem_madvise {
  * backwards compatibility as a "default" submitqueue
  */
 
-#define MSM_SUBMITQUEUE_FLAGS (0)
+#define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
+#define MSM_SUBMITQUEUE_FLAGS		    ( \
+		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
+		0)
 
 /*
  * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,

-- 
2.46.0


