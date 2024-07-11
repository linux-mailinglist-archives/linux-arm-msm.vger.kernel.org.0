Return-Path: <linux-arm-msm+bounces-25942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2AA92E411
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 12:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 063A9B22979
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9079B158D9F;
	Thu, 11 Jul 2024 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTmTiJ83"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF3B158A3D;
	Thu, 11 Jul 2024 10:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720692167; cv=none; b=BcgWi8onNPH25Y50fpD0yQRhynP4FBTO7oTqEEY0qxxel2+r6AgAUZa3/VDQokFF/vQV9QnJ6Hk6XJ/AVfXWOMdvCJKx0DKClw8ksUVw+tXNhdQOFy2BLwC30FN3sl+hiCmRViaPrT8AOovhTubH2tqRChSQG0y7JaOzhRvz2fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720692167; c=relaxed/simple;
	bh=Lbv243OKC/lUjNVX/1IwcADh4+B5XWH0QeAMRJ7NKV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWxWSC9dzFHWvSwyZAgroxSK3XGjBbzJNE8GXumrdAV/xwteeEawP0ulRoBWQNoHito6P82jUgnVMKVQBh8O0s1JtTEAHsv+VYe3tzKf6HJUIbVKdzNZqFL/WGezzfbCbetz+z7wXD7dNuteWeT+fIA1igvtkS3k2aIhhlHlWaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTmTiJ83; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-585e774fd3dso951141a12.0;
        Thu, 11 Jul 2024 03:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720692164; x=1721296964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3zOMJNB2462M9JwLFhtX90y2MUg8+oUIQDY6w49lDI=;
        b=VTmTiJ839MXRw/n8S4gP7LvcEenepUETqT0lczbWd8Mr0impCHqAbEfzPf1+kiP0S2
         OzuqCpBUwmk7jpnzmjtmFgpqpuPNnEDRpqGVmv3spf+SLHTcFujnUErnfIF2NfPsoaiA
         WSzXJxO77R0Kr49ttPzGp/V7Fic9WD7fD/qEy5t9htCBX8t+2024HAcu2vmYv57vLLZ2
         o1OWLguK0O6u7Km62mIHYIFeyskeNJZeJrmFt5eGbxAoZr0i5SCOMhfuTSOux3GdAD6o
         qvJFhMAuZJRNe8ZH/UJlAGWv3UZrAfkFXy1z3HQUvQjeZzc0knOlnp3hlixvhTgMezx0
         RDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720692164; x=1721296964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3zOMJNB2462M9JwLFhtX90y2MUg8+oUIQDY6w49lDI=;
        b=DGc7L1gUqMI+gBWtaWvd9FoRne4NBMrEkXsMD512EqB39EPy1vAsKG6cyspjJml60E
         AH00eK8SnykHQym8Muikpo++mA8IfHgylldBb/AOMxwDJ5spoz6DhLs6OTZm3Gxb50hp
         G1R79a1WFFL+xs33op6pFs5B4LEnTtsUam1k20vvsapSeyzT51jr7u7BENAcLCpsmM+Y
         ztitEUkJZzFEnz+DT1GqV8dDhD5GDD7TJRp90DB9p+RyxD8u00WvWqqF7FGWnmeY5Pbu
         1XPFnSClS+/ToazJ6l7CBy2FzJWU3jG+SbPLFMeLahwMo9u8PFivR6LGtUcV0cTK87y3
         7qgA==
X-Forwarded-Encrypted: i=1; AJvYcCWyjEc1XY3KcLtb1GKPYJJNmlXnMQVSKNAme7UWIwPZvkBOfh04LVgTYoq7Ig7rQ3xAYK1eV8T77dEdpYoIyixDiesexJ5EcCIU6gsXbA5ZEywuNqdiuZYbiP59jnmlJHsTvaAnWes4cuyWFw==
X-Gm-Message-State: AOJu0Yyy2wv8YhNBIh+epaDYKC3sZUa7NKGeZTf6oWAwEeZDSGtbD1hC
	lhQ4iL/k65ucYtPxEX9TcKNUpVRnV2sopWek9v4uhEwULb8JWJ+C
X-Google-Smtp-Source: AGHT+IEHdoFbH3D6J1HEJpm2T6NckmbaqK1lGl274VU1X6oXcU5CJOiQYUz/agNN9vGf3rQ+KMjNdw==
X-Received: by 2002:a17:906:24db:b0:a72:6055:788d with SMTP id a640c23a62f3a-a780b6ffcd2mr586906266b.42.1720692164055;
        Thu, 11 Jul 2024 03:02:44 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp. [219.100.37.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc876sm239207666b.5.2024.07.11.03.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 03:02:43 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drm/msm/a5xx: disable preemption in submits by default
Date: Thu, 11 Jul 2024 10:00:18 +0000
Message-ID: <20240711100038.268803-2-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711100038.268803-1-vladimir.lypak@gmail.com>
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fine grain preemption (switching from/to points within submits)
requires extra handling in command stream of those submits, especially
when rendering with tiling (using GMEM). However this handling is
missing at this point in mesa (and always was). For this reason we get
random GPU faults and hangs if more than one priority level is used
because local preemption is enabled prior to executing command stream
from submit.
With that said it was ahead of time to enable local preemption by
default considering the fact that even on downstream kernel it is only
enabled if requested via UAPI.

Fixes: a7a4c19c36de ("drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c0b5373e90d7..6c80d3003966 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -150,9 +150,13 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
 	OUT_RING(ring, 1);
 
-	/* Enable local preemption for finegrain preemption */
+	/*
+	 * Disable local preemption by default because it requires
+	 * user-space to be aware of it and provide additional handling
+	 * to restore rendering state or do various flushes on switch.
+	 */
 	OUT_PKT7(ring, CP_PREEMPT_ENABLE_LOCAL, 1);
-	OUT_RING(ring, 0x1);
+	OUT_RING(ring, 0x0);
 
 	/* Allow CP_CONTEXT_SWITCH_YIELD packets in the IB2 */
 	OUT_PKT7(ring, CP_YIELD_ENABLE, 1);
-- 
2.45.2


