Return-Path: <linux-arm-msm+bounces-51979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FE6A69317
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 085DC1B63E75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E2420967E;
	Wed, 19 Mar 2025 14:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZnrevuC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60662207A35;
	Wed, 19 Mar 2025 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396100; cv=none; b=JMaslfP/W7bTPC+Ziog9PPzSovTbSaa8A/5tzNUHm7c378JJM690qIL5GurpbUIlUbm7EuYlM/A1fTDMszzHrxpOhe2dSgg5iL3hOMJakXZvmZYMowLWwfRdATNGjNCmkEyb8RczRy13IG/1ZcZrJ32QF3Sxa3GII79s1dc9pvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396100; c=relaxed/simple;
	bh=tALCuUrW8DcFG1WwaBrDxvGW6D4TSkDrgHx4uCGnYNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwS6GsAyy0hRPmUkMGzfYsmJH25HlemPgnVk0lbAqt+Ie94SmYpbKjCProv+YdB87735R/CZ55nspIfY1Hrl9j+faF4D9zod2SXKr/VbLQTp+SnnO4d8f45qhyQZYd/AuQ+U7/D/RAQiJjRXRcvBxHyGZ/xnSi0lVPDUwKLLsNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZnrevuC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22423adf751so125129285ad.2;
        Wed, 19 Mar 2025 07:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396098; x=1743000898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EO2+o/bsNNfbxQWZXTYcMl0sTaN+Gj3FBJ3RecW0vNY=;
        b=aZnrevuCfNCM4gBmUluIJCaMqtfh92aI0p3A2uqLMEaLWYokgeLR+ifysLXnwr4zJw
         w4TTZrtGXxxTPbiwJAaeM84UHjsXjty9l6bAj5A7VUfYfEUUaoYx+yQdH9jH1JOlBMJi
         kAgYrbsWkaUB0eH6TkE+3mqB3/i9q53kEIHfvyVE2CQwukRtXiqIxWOkbflxO0zSL/h9
         yRUMZddLPrGlFvTstsXkLxxdKI/lk/T63Z4BSyID49ig1wJ5xwCEjXuAihtd817o0Lvu
         LIvi+Mp4iIsNTwck4lKdklny1jD2NDgLf8b7HWD/rTZCVgfTNJSm7swUR2kDOjmprkZb
         54sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396098; x=1743000898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EO2+o/bsNNfbxQWZXTYcMl0sTaN+Gj3FBJ3RecW0vNY=;
        b=Om1vGyIzeJJ48bHw9E3AGqJQ1lgAxrGza/wGN8EQWOsnf3fztQKasjQShzP7CLb92+
         PhjaGEqaaMc4tSxwmqYRGTcU0p2mpPXIUY0xUw9laKbOY8lKEStp7EYghsX8sDnWgCys
         u7WE7yAr81eEI5YuEHw0FpjtPUdT7iNNHqSSMB5umZS1ojNkAmiz5nU1hwWnPBj1SeF0
         WuCso8rUfuJYdnwuqsjmZBAxznfGxtk5O/v3tTbiWLm66/q1dBvYEiER9cVXpyZskkNg
         3RRzeJELJJ7Vk9326VuvuDpRIUX04p0e2LOPfqgDXtGbrBMHH4F9cMNLExwAdoB6lphr
         4JhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVBvBSGi4ZEnVedZZ8DYYtGa1hTegLzFAvy5QUmBrXknKNEWYT1Aaezm2zMZZphB8tKgkmvUmr7PmtQ9b3@vger.kernel.org, AJvYcCXi8S9SRZYGdVwgQFhil2ElojuvpsLzH+MIpucOOlzFMu/c1tm5KjaNOukJMmdnsx6bAuUTrDUFQxgirVCj@vger.kernel.org
X-Gm-Message-State: AOJu0YzMdyZKIG6EFmwQUtcQxJ8NSIKGFpkR+iNxtu4eetyO01+2YmfD
	AeumzRfH+Dsj0cQCAj9iAmF7ZnInMhE/CDX+ZFz6UfhNalE0JQQ5
X-Gm-Gg: ASbGncu1v2aNnLawoXF33CGpWq0rLJsAIGSayq+1MNZSdEYs/0mvHFqNLDsZkGGgIro
	o8xZCEShQukrBiAAclZzIQCJDIwX81UeNKRynDpjgH+OTAOOj1EAGsLiIXS1brOJMNqXWbV1rJK
	IQQfFkuNGn4b4gOCTS4pVuDhgzU+1m0h7hNTsbP8WG7tQAQJxXrD+ypXvwULfMdpnNii2vJgZkQ
	w3ymMRAm0ump/LF/iCE83Ij0xVYY2bgfMplNAuM8En3GeuZkdJAmo6I7DA3WiqMHSu9/bomON4o
	EWqPtjkbLxV5FMLMmZ7+ybUnRZTR4+pDf9lP8kPWBXOUwKUg5DRFbmRjyV6jsBFpqT6ODjf3Y6e
	bOSGcPbQ8cjeeT+3TQxw=
X-Google-Smtp-Source: AGHT+IEIogLZO/OYsi4tDswh4850btgV4QdRo63x6gQecFtgoLCxLPv2jMPjlPAUKRtjjDj1a74OzQ==
X-Received: by 2002:a17:903:1ce:b0:221:78a1:27fb with SMTP id d9443c01a7336-2264981b453mr42186515ad.11.1742396097638;
        Wed, 19 Mar 2025 07:54:57 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c688d9eesm115018435ad.35.2025.03.19.07.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:54:56 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 06/34] drm/msm: Improve msm_context comments
Date: Wed, 19 Mar 2025 07:52:18 -0700
Message-ID: <20250319145425.51935-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
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
2.48.1


