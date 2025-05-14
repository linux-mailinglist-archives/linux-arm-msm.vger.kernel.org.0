Return-Path: <linux-arm-msm+bounces-57891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF23AB723F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F2E27A2EC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BC628689E;
	Wed, 14 May 2025 17:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zudmz6GJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9259285419;
	Wed, 14 May 2025 17:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747242210; cv=none; b=Yv2YN+15yGsBcdvAl7u0SebrBGLB5hdbS4NVTVTNreE8jHNFrzZUIDTq/LJL6GTSZUmtaPn8HAvlWveh7XGhC0B/FDyjugbtQgaJu+6iqerjv9xjwocL7f4dl18m/Xu9jFh+SS3ha9X5vjcEjbetlVUruzDIYLBguqzxxBBJ5eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747242210; c=relaxed/simple;
	bh=hA0n3sJHSqtfCC0QQbm5Ra4aQsTlaYfz6FOXn+eApww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zj1s2RKwJCjiiUk1WSC6x9yvE3caELNUzHgOv9Ppa2Fq6fxAhL18bJMJq9ozJp3kwbsGonRALeTHtfQ+oQGiEy32V0KnOlBjrK2N81de09tfHy9a4Zi4iKmLTb+pJG3rrslqDrQBwSumad9c5ReMdYNCVFv7bl+ilVxQWAW27D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zudmz6GJ; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7423fb98c5aso161935b3a.0;
        Wed, 14 May 2025 10:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747242208; x=1747847008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
        b=Zudmz6GJrfWwrLuZZiH1DY4DKVSec2rvUIGIO+/k8QA2Cbvw7HGw9KQTubZhBl22nv
         9whgRc9I/Ex3wyNfA4mizddQsN4uYs3PZSzX2F7znYHVEFrZP6ZTK1jumdhYwwfnNNyT
         UoNi+hruuRCBvbxkopWx66Tj7lWO5Iflda0NXveJ6ira3aNySyXovmkVEMBHkBSqZ5WP
         8LwTwK/boa8+e1JRcNpjvxrw8IA02GnumS1OGb8UEkG1CJexRyRLRiKBNZMSWlE9zjYT
         U0MADU0nn/4LdTt0CnmHsKYgboH/RZ+tHmIOIWs4PzQav0QE6X/pYSguWORysPFRWIGB
         t7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747242208; x=1747847008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
        b=KMrEbykQ2uAxt9247AzYh/avNaZICmr1nvZiu03ie67rmkV1T7eQISbCaKSYRe9qO4
         hi+EOPouMqhfixxQ30lLcm3VfbIJwGjI3NyKqafE3ydmazdrjm438kEGoVfh8i1fMyGp
         0Fv2X4OcXv0aseS/u7ZwNtNZIbu4JUWYg3/4fK7QnZHpNrO2IJj+3uWYwN7dAD7qORB9
         kBEDCm+7qMlD3JFw6oa4yuQveLuwTIjtZbC3Vp/Hk4ObMjyTZ7/aeBnYLgQwksZGQo1k
         DLEsxPcODhQ4zb3S5JntysV9nOheUt9qXNk6RvIE7MsVAYwFonM4CZa5fSmSIlF+kkJ1
         wyWg==
X-Forwarded-Encrypted: i=1; AJvYcCWbJ6fNc0NJbtVusytsgk+YWsyMUlwmu3+LmzfyQc7zqGWSWSbXd9O5G+ngDRhXKRTH/eBf6ElQGkkBQp8U@vger.kernel.org, AJvYcCXFLLsdb2V3U6Y5QY3AGs7qO2vUR2+G34OqZpq+BYiudzU9TvyRfT4X69mka0Qq44GB1xxr1zHGH48Ukj6P@vger.kernel.org
X-Gm-Message-State: AOJu0YwZIXSJ6cSXlI+0ah8DNM6cJsKy+yfMwfLOGs6YnPMtGAN7MwYC
	UHuprKcs+LPTRewidhe2PYaU3ipiqLxIXUx7bZU2lzmJWA0cj3iR
X-Gm-Gg: ASbGncu37fEDuPAdkI8MkY/HWRQMmYsnY4Pyo6qst9Jd/B3y8HlHffmfrPzJAoUOlNw
	aepyMoItwbXHzXknjFNkX2Jc8ECRxqjYIGxCy8fu6Sp46jbr71JCsnGacDwzoEA47GD/Hk+e4p7
	iT2/DDbifMBm4TjW9dy2NQUKaHVFeiwvybIbkl3dhx/aillv49Wou8SL1MlcCtA3j/YtHeQZuVD
	46K3voKwB+V7UuH/GTUc0EvUObFAr70K63JUpfbZNxNklRQXAzWrWJq9aYb8Sm0WtkyCRA8OB1k
	CNIH4cYo5U4NpcUMv1McFIu0oMWX+K0hD9TRUJ7NvKukGoBI07RGJdUva3g4Lgk9xoYVZhNQguS
	EM4f23vweAjtuJWk3YysUptHytw==
X-Google-Smtp-Source: AGHT+IGyGypLDfWhQ9d87DuR+AeAXFJ8JA+bXc2NjVqwTDBTjF5ZuSSNFOGM71st0gVYaB1usT12QA==
X-Received: by 2002:a05:6a21:398c:b0:1f3:3ca3:8216 with SMTP id adf61e73a8af0-215ff0abd4bmr6121172637.5.1747242208106;
        Wed, 14 May 2025 10:03:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234af2bf21sm8009353a12.42.2025.05.14.10.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:03:27 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 07/40] drm/msm: Improve msm_context comments
Date: Wed, 14 May 2025 09:59:06 -0700
Message-ID: <20250514170118.40555-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514170118.40555-1-robdclark@gmail.com>
References: <20250514170118.40555-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Just some tidying up.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 957d6fb3469d..c699ce0c557b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -348,25 +348,39 @@ struct msm_gpu_perfcntr {
 
 /**
  * struct msm_context - per-drm_file context
- *
- * @queuelock:    synchronizes access to submitqueues list
- * @submitqueues: list of &msm_gpu_submitqueue created by userspace
- * @queueid:      counter incremented each time a submitqueue is created,
- *                used to assign &msm_gpu_submitqueue.id
- * @aspace:       the per-process GPU address-space
- * @ref:          reference count
- * @seqno:        unique per process seqno
  */
 struct msm_context {
+	/** @queuelock: synchronizes access to submitqueues list */
 	rwlock_t queuelock;
+
+	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
 	struct list_head submitqueues;
+
+	/**
+	 * @queueid:
+	 *
+	 * Counter incremented each time a submitqueue is created, used to
+	 * assign &msm_gpu_submitqueue.id
+	 */
 	int queueid;
+
+	/** @aspace: the per-process GPU address-space */
 	struct msm_gem_address_space *aspace;
+
+	/** @kref: the reference count */
 	struct kref ref;
+
+	/**
+	 * @seqno:
+	 *
+	 * A unique per-process sequence number.  Used to detect context
+	 * switches, without relying on keeping a, potentially dangling,
+	 * pointer to the previous context.
+	 */
 	int seqno;
 
 	/**
-	 * sysprof:
+	 * @sysprof:
 	 *
 	 * The value of MSM_PARAM_SYSPROF set by userspace.  This is
 	 * intended to be used by system profiling tools like Mesa's
@@ -384,21 +398,21 @@ struct msm_context {
 	int sysprof;
 
 	/**
-	 * comm: Overridden task comm, see MSM_PARAM_COMM
+	 * @comm: Overridden task comm, see MSM_PARAM_COMM
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *comm;
 
 	/**
-	 * cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
+	 * @cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *cmdline;
 
 	/**
-	 * elapsed:
+	 * @elapsed:
 	 *
 	 * The total (cumulative) elapsed time GPU was busy with rendering
 	 * from this context in ns.
@@ -406,7 +420,7 @@ struct msm_context {
 	uint64_t elapsed_ns;
 
 	/**
-	 * cycles:
+	 * @cycles:
 	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
@@ -414,7 +428,7 @@ struct msm_context {
 	uint64_t cycles;
 
 	/**
-	 * entities:
+	 * @entities:
 	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
@@ -427,7 +441,7 @@ struct msm_context {
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 
 	/**
-	 * ctx_mem:
+	 * @ctx_mem:
 	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
-- 
2.49.0


