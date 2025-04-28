Return-Path: <linux-arm-msm+bounces-55952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6809A9FB34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 22:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 602533BBAA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 20:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADA0211706;
	Mon, 28 Apr 2025 20:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2cSJAPP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BC91FDA9E;
	Mon, 28 Apr 2025 20:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873803; cv=none; b=Rolni90w4YDscondcb1EEMfZugcu1IEL+uAa/WMXb/1NrdgJib5c28bSkpn5Kkvt+jme8IUKNkmY4y9YKOP4GXkeoMvr8FsiBY8G+udQ9xc9pKx5nnOXoQLzumCZfTsSOsiYLDuxBT2KzaYpxWcNwAiz/Q5d8I6KRIImUb316fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873803; c=relaxed/simple;
	bh=hA0n3sJHSqtfCC0QQbm5Ra4aQsTlaYfz6FOXn+eApww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqNTLRhlCA3sZ2pClBUyRQBMyt3QLM+6ocSGTwxBXZ7t1joHnx6BuDHookYb0rgD7E/JnuYTCYDiPMLnYpA9VdSYsNVojFp6u+V5SU/6DR8wWbpJmzaiVPCNXuXBUunKft8+DMXZ8Iw4rePSdDpQAyqe9c6Ky+gzfJDYAfdcONk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2cSJAPP; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22423adf751so53957355ad.2;
        Mon, 28 Apr 2025 13:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873801; x=1746478601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
        b=U2cSJAPPOfyhjGHvn/lTXMcClMBvw/In4Wh4n+cYqAk9xaRh2sIiof5g95osqQYO33
         YPW/yOCbTUGg/PeG4zjNCYSKfaMQiTXhb2BPSkYILhBLwplLX0H+RN8WtDVsn7l2oeyW
         7dEZHCfPG8Y88Tg+IUwJChoOzJnQv+u+tN4Rvs0erAMcOZvnp82a3oL/vihaQpiezyMF
         7vU1WcVgBNFO80985JKzygppSA4ZMNdOmmrFCC0MHFR6BE3JyQOxsXjnV8uYqtRvP/0P
         5I9+3qcKXY7rkCOfPeXer5AU3Z3/nd3zDnBYUjbyDGv7rv+qAZAvGrvV2g02sLGXcmz/
         qY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873801; x=1746478601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
        b=uoVFmcTINXsMiIZqZyX+Gn8EqAhzM4P0GRqBSpgPAFqu5PbQhM+mtFTnnvlkuA8co/
         xNVkOw7d9ba5K5zhMLt4R0xxUYIuUaSE/i1+S8hyHRhWD0phZNN6DsNIkoLs2JBbVCxt
         LuaQ8Uv95mrkV0T5jjPnDvAyhIG2zVPsZe2nunFaScaolmEujO214g829jIN/SRbsquX
         XM6u2KrfLAi2r3HISidt3PXGHmB/Yg+JPEWvv3gKqOFN7qbU4ydesYkcuQcYk7k8qOd1
         bo/jdnnczTDR4ashJwonLJ+Or23UDTcUPn/Nv3na2ylSIrOsnKN6El0SrEINcXoeayBU
         4LIg==
X-Forwarded-Encrypted: i=1; AJvYcCWrxoFLHJ9cIg0q0lKpIBGHwG1VXjlWnw01d2hnWAvznVDXSZVozs6LvgVUkX3KQGWKkorMN+mtxMkVZyJA@vger.kernel.org, AJvYcCXykw9O4RILjUnndIKJ6hnOIQ5pXGgaluq/yWtlB/VCfGYrZRMUctYY3WC3C3SXKgtrPMU+gd8cUllg7Jl0@vger.kernel.org
X-Gm-Message-State: AOJu0YzVWJB92pAtuYKeMbl2XEXqEcHSlwG+/Dqfhg/2lNMM6JEIDFLL
	GYiKAX5SbYZy/g9eqHWoplZEm5xNtk2rVcjtwLPAiC1lWW+ZnIeI
X-Gm-Gg: ASbGncvkxsPcTobY+btO+v3fMMKngUjJaytuwpzeD5lkLVC90eauLIy0Ujbp6YJivLT
	16qmUOEKhtraoONlwpz9SSGBBZmLKkS9wJT3y5BCi5Yvtd9y8Y2jKNHDToSZnK3xkbNMPJD6TPN
	tqaMh5AmX8IUDba0Yqg1HLACbdIpCUmXEanDdMAH9M4UFW2QsbnI08rWOQdvJQ+/5K3mXabms50
	QbLgjrEJofvIhQrKxo8Nmgc6sybomdTMnY3RqxU1cqQvRZ3a6F7GEpmgGzDSLQWUOlQssu+gDcz
	zbvEpH4+9klYRY0n/z3A7rNt23fUuj1C2qJub7xnVkHYxfnuKB8WcWvT2pEM3kReYxKqtqEZph/
	WseYDGTHcOBrBlN8=
X-Google-Smtp-Source: AGHT+IEYlF/hNqQrFTfpBoNpweh9xryEMmimNBOhG4fWdyuCklvbsZ/dxNPV1dYaSw0ArXAE3IBjuw==
X-Received: by 2002:a17:903:98d:b0:223:653e:eb09 with SMTP id d9443c01a7336-22de6e93a1cmr7904965ad.7.1745873801387;
        Mon, 28 Apr 2025 13:56:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76fc0sm88021445ad.27.2025.04.28.13.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:56:40 -0700 (PDT)
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
Subject: [PATCH v3 05/33] drm/msm: Improve msm_context comments
Date: Mon, 28 Apr 2025 13:54:12 -0700
Message-ID: <20250428205619.227835-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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


