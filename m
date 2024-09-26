Return-Path: <linux-arm-msm+bounces-32617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C637987A92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 23:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EA641C22189
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 21:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBE8188901;
	Thu, 26 Sep 2024 21:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxL2bZ3J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31AF188719;
	Thu, 26 Sep 2024 21:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385433; cv=none; b=PRSqmHDXCkiOZjkgWjRtoybm8wAlY6EizmucubgI7WyuIhSC3sZ1th65bB4CF+VKZTo1m+bmJRZLiRNGexVV6yUuk57CShBvjWf56lq415rwch/x0XwBzX0PgF8iOfC3z+KNEzNMHx02rrTf37TXqNPquNwJlto1HA6D6kR8e4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385433; c=relaxed/simple;
	bh=hkIxVGWeKmryC2eLYVINRVq4p3WNWoRnKE3ce5L9CRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OH4fEtUJ4ONQCJLliihOhTI/wfdwfTOLlOj9Bb79iM1K6MkPNRmPUR7zGBpAYmIzHMoZFkNssTR3WqLo/LHIvIhrWeFFyk/l9MmogCuOKz2DarLQsRMMEk5U/WCJCOYKzWk0hzRh6/x4lB0VHPYOAnetZ5wwSxG3KRvXQCjMDic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxL2bZ3J; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d2daa2262so155685166b.1;
        Thu, 26 Sep 2024 14:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727385430; x=1727990230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lXuDq8mG8Oox8ReUlOYfBHI57TTAdm6VM/42FD3opk=;
        b=jxL2bZ3JNs5eJdY/IIk7MxGTpjwv8gyq07k9MemniJf7gTHD2Dq9d+ea2FvCCatqCt
         k/7xz1s1XJ0InlUayqA5rq7SOmhRR6IfhGz6ofCosvQlf6rFiVc5r8h34ASB3jlqt/8x
         RdQ9UokBnuAPRn7Fqb355hvI6Gbi/WMGeauqoX2Uxls1406FHQC3FCXNVUzeoCvydQb8
         1x+XOO5meZcZ8AhK9FeR9JZS2t2x8IfV+foPE3feXOMU3gpyi663NrQmTZoyvYn1Lyx/
         Q8uShqWI5YcY9GbDmMKCRvebKpe5ahZ7jWHBy5s0RgbG03s5vMApWx/Gd8K8gFDIdhsQ
         34OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727385430; x=1727990230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lXuDq8mG8Oox8ReUlOYfBHI57TTAdm6VM/42FD3opk=;
        b=P7tqRWnKhrNouoyT8AOHjo3fpHWfUdXl7JGZD07vjRxdydZse/9GnOe7z5wadBrtrE
         epHAvNRmjurdpYYJjb2qvgsJqMEF/HFewUz0AEbmZtwS8lvasiQ3g7jjFx9FIts8Ij/7
         1EQPnjowFamtht4eyVn+PVVlgfSNmdB+K9ehYXLO5Mfo+itqjfmXTCWJBOzGEfFegTee
         p9v0STM/OsizUckUi/StV+Swtk8u55oUSZEFmTgO7049LhYWxDKhOmTRLV4QShh58PQf
         77wlf/9879ZjqkJ6i/ZF4NUKe0aLSe2UuQ1eMVm17bDwWvlCCKBFyymSgfYL9AK/6K+/
         TOpg==
X-Forwarded-Encrypted: i=1; AJvYcCWOePIr+M7smy1/mRY01OFKX7L4/7f83gl035xhV4w4s0tbXH/3vfXx/XIJmT0QBa/zOsbgnh9+phM=@vger.kernel.org, AJvYcCWgtZjcu7HQI6ZNHP9clAxhLOBa9X/WFQCiW5hvSoGoIOHd6uAUfIlP1xoVR9wkH7G1SwRYFVpczGLlGtzo@vger.kernel.org
X-Gm-Message-State: AOJu0YzY5EjTn8vTmpxcmsX7X7Uba6KgZna6WE/gIlICwVLwRBzowVbt
	Syk4yFwadVRcHpbtkwcKyQsw7KvJIxlCtKbykcHrbB1dneglNocb
X-Google-Smtp-Source: AGHT+IGjJbOWMYKP7mYVRJtTrU1XFi1WXRzBVHSBRJDsooDihCCCttVD7tq8UPSbhKKkLAriL8jQSQ==
X-Received: by 2002:a17:907:eac:b0:a86:7199:af37 with SMTP id a640c23a62f3a-a93c4aca8d9mr71916066b.58.1727385429899;
        Thu, 26 Sep 2024 14:17:09 -0700 (PDT)
Received: from [192.168.1.17] (a-lu6-5.tin.it. [212.216.221.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297b7d6sm38862166b.162.2024.09.26.14.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 14:17:09 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 26 Sep 2024 23:16:51 +0200
Subject: [PATCH v6 09/11] drm/msm/a6xx: Add a flag to allow preemption to
 submitqueue_create
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-preemption-a750-t-v6-9-7b6e1ef3648f@gmail.com>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727385413; l=3416;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=hkIxVGWeKmryC2eLYVINRVq4p3WNWoRnKE3ce5L9CRg=;
 b=joO2Uyu/IC5UuSDPVyPxyL9NnP9PG0j8OvPshB+ahC5/NmzXVUmJlUTzutOxsnT9SvfpJJXSb
 Mit/nW0drInAfmpiug9tfsdDa00rRaISPIReHOL0R1/ZR0DIaK37crA
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Some userspace changes are necessary so add a flag for userspace to
advertise support for preemption when creating the submitqueue.

When this flag is not set preemption will not be allowed in the middle
of the submitted IBs therefore mantaining compatibility with older
userspace.

The flag is rejected if preemption is not supported on the target, this
allows userspace to know whether preemption is supported.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
 drivers/gpu/drm/msm/msm_submitqueue.c |  3 +++
 include/uapi/drm/msm_drm.h            |  5 ++++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 736f475d696f1133c9e55d16aa80e73fd46cb835..edbcb6d229ba614be910ee70e75731538116e4a4 100644
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
index 0e803125a325aa67639406ef413aaeb6a9f08cee..9b3ffca3f3b471f509918edd4a2fdb0f80dfeb06 100644
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
index 3fca72f738614a3e229e1017fe4f2ab61cd98bdf..f37858db34e602ce8b92dceccb60d4b6bdcda877 100644
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
2.46.1


