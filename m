Return-Path: <linux-arm-msm+bounces-28665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9395C9539FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24208B24C96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EE4145341;
	Thu, 15 Aug 2024 18:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KonHAPUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F7613C90B;
	Thu, 15 Aug 2024 18:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723746468; cv=none; b=paM5f4kv77SFgHAVXrNtDLaQyY2we/4MRh7x9BfcDke55+tNSNK0B4ybTNTALVKsCFNj/B3wAGvxW5dU0otuxTIxLL68cUraiMG24RPqjF47q2nRP9QwbfWd6exr1S0jagR5yn/kD3UQ55qnD8MMg7aQSh3oTqi6E4vjU4/mKY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723746468; c=relaxed/simple;
	bh=GF/BCimeWie0a1inww3pyOMeudVhMYIVzh+LjcDJs6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZS6JvQBl3tYNhIGQOGa7lUpWq9PXbnyXhmQM5I0m36zzGt7yr3muowAb6zFMpaHarrJ3N89X+tDi67dZ9BdPZ1vWkbLepcukOpbPMkhnt8q35pc67iEF9ba+1d4shXoJcpwW82YusD3inG3LJhcIPNCjoi/VvhysrCUgsxRdPtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KonHAPUy; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7aa4bf4d1eso173696266b.0;
        Thu, 15 Aug 2024 11:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723746465; x=1724351265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYNQ3Kd9tk4rueRVocGNtRpvnUgsUyrxTXFbooCVABo=;
        b=KonHAPUylwDWtfxSLXSeovXrvfwN6YgqNOS0ZEUs2DABK9QJ0SXqKDIDv7FdWrvlCB
         Nrt+Neb8NsAd6ZusoLO9I+Rdhwd9AC5aWPUwy9wXxvBTPx4kECESpQke7fvUNgIITFHz
         7KU42oOWBRDcFm0AHNf1olJR5uZQybSYp9O2QvH65+BoaQfwCcpU2q8KHopnQ/63Ahli
         oTOW7VfboqxOecgw53iK9ArRCAcJdgQk6WMwirCSZuz491wc2Cylac5RaHj/WUUhha4x
         j2tTYqrtJshWyMcf9BI47LdE2If3bHtuDh+T4wgJgetVafJx82MHRewqo07riIe+CCIq
         g5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723746465; x=1724351265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYNQ3Kd9tk4rueRVocGNtRpvnUgsUyrxTXFbooCVABo=;
        b=s563pqtQ2wwx3N7sDWMB+AoHUxz8vuSGoBVvQvdk9xiv2doZMnnxIVUt0vmvOnL0m0
         KVg7BssxIpnwmgjHKyYoW83mItvOnr6Nn/YvGffCvWamzw8C3D1T8MZT3Lag5PMa+uXb
         3X08hUr5Q1Llt1R2H69EMpjmrRIDHAnsDf3wrI+H8ZOLBVzgyDgO+FIKeeqUtzvJNsJi
         BBzxzuuguBnSMkFaVqBsSQbiubmjbKmH9KuHU4dN6vLvDDF605rqdaTR/i/0EFc417oN
         LHND+O+H7ur7Jut91vKgbMHGewdO63dQmaUykfu0+oDSA+KzKQnma1sps6URsd0k0+IW
         mItg==
X-Forwarded-Encrypted: i=1; AJvYcCV2afyeTMSEdBtsb1MxkPn/k52mAeWg5DhD1nrhlv2ZVQw7cgYNnBegj+hqJg0hhrAotBBQ9kIo8KTduyb6WJ3BX5h5BP7XO/UrNg7l
X-Gm-Message-State: AOJu0YxlmeijuBs+ONtGV6LzfZU5/lDlLUeL46Pizk0pnILsoSTLbe1W
	2pvA+Bh/rnofvwf6xsBXIXjJPFD9XgS3IaVLEnOd6eFQYMKHaZ04
X-Google-Smtp-Source: AGHT+IG7eGtE09/Qx++WFHjUPm+osUtSJegCIrquQ4d7QvqeC3N59wMKxmmm6RyPv1HQ4dTZwDJezg==
X-Received: by 2002:a17:907:7b8c:b0:a75:2495:a6a3 with SMTP id a640c23a62f3a-a8392a411d4mr27182466b.67.1723746465046;
        Thu, 15 Aug 2024 11:27:45 -0700 (PDT)
Received: from [192.168.1.13] (host-79-35-172-29.retail.telecomitalia.it. [79.35.172.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383947187sm133814366b.166.2024.08.15.11.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 11:27:44 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 15 Aug 2024 20:26:16 +0200
Subject: [PATCH 6/7] drm/msm/A6XX: Add a flag to allow preemption to
 submitqueue_create
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-preemption-a750-t-v1-6-7bda26c34037@gmail.com>
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
In-Reply-To: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723746454; l=2101;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=GF/BCimeWie0a1inww3pyOMeudVhMYIVzh+LjcDJs6s=;
 b=7HXl9WtNfMMnNqPPtxHK4bSQyelfqNTETs83haTMurX8wKTu4RJi0olnliHSZG+aSrcc1BFA4
 Fb6DGs0HiwfDpe+qhFQtvcM0V7GXvWxo8k4YHDpUSlNkevPyRyU2K7P
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

Some userspace changes are necessary so add a flag for userspace to
advertise support for preemption.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++++++----
 include/uapi/drm/msm_drm.h            |  5 ++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1a90db5759b8..86357016db8d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -453,8 +453,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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
@@ -485,8 +487,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
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


