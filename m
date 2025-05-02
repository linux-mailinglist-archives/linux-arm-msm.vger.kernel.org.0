Return-Path: <linux-arm-msm+bounces-56545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E441CAA781C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 936B11BA8642
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A05E3268FE3;
	Fri,  2 May 2025 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klrAGvwU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08188268FCD;
	Fri,  2 May 2025 17:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205657; cv=none; b=IZIsSXROMD2CSavxT3TlTMxrE0+oZc48cNqo7gT3cUYFD1muSDP2xWECla84TG8TqxU5JY2SHXzd6eUCS71xxkDdlnhkl7teo3y5l4ExAiicaDLH12BVc9AcV3wbr30lMdsvS8xxTFbHKSpGEFBEcbGQvQzKAF/wQ+liyE6blHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205657; c=relaxed/simple;
	bh=hA0n3sJHSqtfCC0QQbm5Ra4aQsTlaYfz6FOXn+eApww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HNT/6H7aAC8sNlgxAzX49xepeeUZRPCb0J+jbcGexlJWMFWkOABN/N/6d1hYvcd7uHSkaKQGnKa8anopFNdeI7z3J1IF/MzHbGeCZ4hXXZ1TFTkdsbhpHhv+hNn37bWNBSR6groZHqxKp3LuX0EHDSPAyriSffxy2POZlBPLmNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klrAGvwU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22c3407a87aso35827825ad.3;
        Fri, 02 May 2025 10:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205655; x=1746810455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
        b=klrAGvwUjrRt/B199eLNExoRs2WbxWFs9+BZ9dYNjQhWUZZqrsHWQkRQYkq42E+4V2
         tP4muK77O7itNlYHjQfV91r3/1xjFEl30U424FLeN6eIcuBV/IKq982luF/1T7tQonWL
         +Nhabz7AJKIvvAzCZnmVl7i4deLGEg4pgle00W+Vzv4YOkjc8dP1whpCIF8I6pb0tQ5n
         UY8cIHnZllmTW5beuIoPbV8i84tUfU8M9WwhxA32pgSsj69rfDEo8h8miz4bmMpj+1bL
         IfhE3gfE4vyaFVxU7Q1Dkf2+VZoQAjfcmveTGrConXyYjDNK+/M2cB/GPb2jJOz407AK
         w/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205655; x=1746810455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
        b=N882cD8lCHOjlQKWZCpJV0Vkr53VwDk+M7MhFJVYJLjlAoOUp/kC+oa5y6AczD/4+U
         TEeX9t+NVM5tCXk8y3u7+cyFxasRhBEbDv2LS+CSCp1+Ii7cATr1Tf3T0QjQhJLXDH/+
         06AtPbQA0WatVcaa67rpmbtCA+hwjFLHXrDVUk1/aiBbkQjFr9WmqUGNZKgnIag+KWpP
         X4iOxOUnBimT57UpYO78lWSlEbJ0cYWs+B37sZ7+yWDgzK/N5PK28D7xXDQ7ry2DG3P6
         IJ9CYLv88hReyevXJ+AJ2B0ZiVDFYTCkPEL7l8ovr5e2P6DNLK99dFkMSOhpvIRZaY+e
         ETnA==
X-Forwarded-Encrypted: i=1; AJvYcCUMBq8czV6eA7PImeDr2H3u0Ts5eGA9jr+rUzEx2QCbeYCqntCeQ7vBx085XV+GbKpsTmmDABMvcMOuMfbm@vger.kernel.org, AJvYcCWSE58B2hAXfAU6miZMRLF9QXIiOVacCVuo6uTshDtmhJXR/Y6rMTE+U+9QDz2uHwfIXd/iaYuONL/C8ZI4@vger.kernel.org
X-Gm-Message-State: AOJu0YzEVvdPxNJkEyVmA8trnXaukbRtb/BDTnXC4UWCkhdu9sBgLra1
	EZB10ekhnQki4ftNl7OgJ/omyeK86rs6jrxsH7f4hBXPMKYKI85A
X-Gm-Gg: ASbGncs/ves9mOUIsbmw6qtd8Wq3YnJWlAvNEtyqUl/mMlaGmA+SywmuMQjP9TBfiUV
	KJMIAUhkXFo6Hti4KyujQNmSV+/mBKOzV4yUT+ZGCiesGPG5kAFgZyNopzw16tFx1WdPFxihYQq
	gULILs5jibRr4NB7g8wZblxAx/nbKPXUKEM+oFhdPkJZDLpurkbrmzS9YkLZtmM5K3DAdGV3kGT
	b8MgjMKoLgUpObctekin59f+CHxns9mhw+K9lAq4eUDduI+TgGU8NxQcrzISTmR9vf8xM176J4z
	dRikgyY+s512XxT0ZodYPjyttnVymRHYoNtne04kHp6RNNCxfqqT85strAncuUNSgAjdCcvz3UY
	EBKEbqxNEDot6/CA=
X-Google-Smtp-Source: AGHT+IHEDwjYJZYF3Fkd4w8lssKXGRFffmmotqq/5XEF7NClh0BLMgFzf8nD6r96V1pE/TdnhcUY1A==
X-Received: by 2002:a17:902:f650:b0:223:2aab:4626 with SMTP id d9443c01a7336-22e102b5f15mr53388395ad.11.1746205655219;
        Fri, 02 May 2025 10:07:35 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e93a4sm10229705ad.58.2025.05.02.10.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:07:33 -0700 (PDT)
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
Subject: [PATCH v4 05/33] drm/msm: Improve msm_context comments
Date: Fri,  2 May 2025 09:56:32 -0700
Message-ID: <20250502165831.44850-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502165831.44850-1-robdclark@gmail.com>
References: <20250502165831.44850-1-robdclark@gmail.com>
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


