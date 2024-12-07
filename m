Return-Path: <linux-arm-msm+bounces-40861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E95C19E80C0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A50C52832BD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141D0156F4A;
	Sat,  7 Dec 2024 16:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTBpqHM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FA7156227;
	Sat,  7 Dec 2024 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588246; cv=none; b=RraXLxxXRp4t+xR6lTMwWg35O9pi/8YF6xCpztXY4bqG4zKDqBStfQN2G0PuoKggJJIuurYoiiwmUiOKMfuBLTi6vD1Sjib2I3EehVi0CjkaR8LcIXXEpoN1m7kZ3M69Y/31ZbFlCgWBKF4ehPrXoCM8of+BIQqz6cAhQ5aecS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588246; c=relaxed/simple;
	bh=lUgh65DYtiHlDm4/9bBPwUy1OhkwTJzvsuUxcUrmAHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=segGCYoXiW6CRXPUaEmz5y5dmqKOQSQp5d/bY8yyeLQvdUlEKSfXKWvIkDddmFhSY5jKo+eFt072THwzA3XZj2nnJ014wKpoGnZKxLB3IjBzRJBaPJplx1Y2FNrVMy4h44n747wEdu9hQ1Yn5/xw7luqwJr8Xvc0BTavUCxoxE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTBpqHM2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2162c0f6a39so4395775ad.0;
        Sat, 07 Dec 2024 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588244; x=1734193044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/byccYmBx9GqheY7o02LLjac0bcvN34+HChoq7opjUQ=;
        b=cTBpqHM25kIaei+5RwERhqGcwjAeW2E795+Dy3kuUl9unYowO33TkzvmbYPTr4st5T
         RgzKNdJiMD5kvc3GKtMRW09Lnh9wzvAt0l07Q/n02SRX2jGHcwQjAMNurdb6MoLL16hO
         00P2TGwV729g15vCOD/B6jLNP7fTPY6CpyMspoG0N0fF7trF2KWmCOWT55/O5FzSEdTi
         7Kxi12xpS27ZN4JWiR6bzvQwMhk4RP9TF4k2Vc2+GcKD2/ehc0U+D8aoIgRBoWxwhGe+
         JxivGXA5ZvLppe3My1SdOX7L4ag3NHPM1nfb8iZD3BEEhIA6Bg5LAEFJGmNcYBggw9Aw
         Bl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588244; x=1734193044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/byccYmBx9GqheY7o02LLjac0bcvN34+HChoq7opjUQ=;
        b=jMnSHiTm0utM0YBK7cQKcelHaQjKrCixnHzEz9hbtMcfYLF8FMclzL52/8IiPpfgzr
         fNE1GSSlMb76V2A3EKTZHLVQuksN9q04ScosAcZ+ywSqJggvvpd0dBi5oBtMUvXcRorG
         Q61t573sRYRysCo5a3xAIKH54THxZIPDjc6iiHaNArJ6RzLRUwOmk9Sqqoh4OriQ9VsX
         dKdwMkM75o+J9eDB3j7HLNFBrCislZ8HSub4QMdpsSCTb/1//UpEpCGGvAJhU6xDHsjm
         GDK+FbLB4z1tpAfeFeBTShhG1cB5Q63u+/J4NsBVnVsih/1qscYARnIVi7pzmlH+VXG7
         sS0g==
X-Forwarded-Encrypted: i=1; AJvYcCVRD+pdY9Ee3IL4mo/T0VnEQkasEQktBxzpRRi7aZZOwogOjdb6f8HZ6r4YUUi+xWtGUtbmHsEZSiqB/KUk@vger.kernel.org, AJvYcCW6qfHKzsumfoia3SYWgFGr0D+aAUP1egVnd+8H+U3w4W061qmrfOys4bvAa8kQRr3ZPFa60TPnNj3cySwk@vger.kernel.org
X-Gm-Message-State: AOJu0YyPKgW3A4vISTClH2/u9IfPD9b1Ya97lTX7UC3hkGPOAmimHSbf
	vQZb1rFLNJgAZlh7NKZAMZJBMW1Ra02JXTRqllkkdOO9Pn8XNZqK
X-Gm-Gg: ASbGncvI1upd7Bok0qafA591zG9dJ7A7GHb/VH9c11Z3Jsmn6iSXJk0RnKe20r+u0Px
	AvR2dZupf679fPGXqnJ6Hd7lk24+fANpe3LonsXRC5pyrJxZHIBPMTt7llIWhCD89xKzT1PjBV0
	J0eLH61Ji20Haq9h33QgXMbFbIHccLz5MUAAQ+xORZQ2+1hI8csVwaeEayUKKYKwKvAw5Ljx9WJ
	EyTUvxKl48YPlXyOPTSSKdp/Pa9458cbWHz3vkNOa6toLEkFPSYhRLEzZVFEwZvEaxWjDms2Bfs
	5A4aYUj8
X-Google-Smtp-Source: AGHT+IHf3FRKOfTROzUO93B5FqsgYxWePs7Ij4IlbmL7knPOJXeOyJEigaHOrxxp4IxYJ4ZweYxOCQ==
X-Received: by 2002:a17:902:da8f:b0:215:8847:4377 with SMTP id d9443c01a7336-216112fb5e7mr114122425ad.15.1733588243660;
        Sat, 07 Dec 2024 08:17:23 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21631bd2c2dsm9974905ad.263.2024.12.07.08.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:17:23 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 05/24] drm/msm: Improve msm_context comments
Date: Sat,  7 Dec 2024 08:15:05 -0800
Message-ID: <20241207161651.410556-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
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
index 76ad75f06706..01a3b2770d71 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -340,25 +340,39 @@ struct msm_gpu_perfcntr {
 
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
@@ -376,21 +390,21 @@ struct msm_context {
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
@@ -398,7 +412,7 @@ struct msm_context {
 	uint64_t elapsed_ns;
 
 	/**
-	 * cycles:
+	 * @cycles:
 	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
@@ -406,7 +420,7 @@ struct msm_context {
 	uint64_t cycles;
 
 	/**
-	 * entities:
+	 * @entities:
 	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
@@ -419,7 +433,7 @@ struct msm_context {
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 
 	/**
-	 * ctx_mem:
+	 * @ctx_mem:
 	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
-- 
2.47.1


