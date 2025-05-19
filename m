Return-Path: <linux-arm-msm+bounces-58518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A991ABC63F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 19:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3B55188DD35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 17:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93EE28A1D6;
	Mon, 19 May 2025 17:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJfIRbB8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420B828934B;
	Mon, 19 May 2025 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677270; cv=none; b=JPT3aDE61HX2mfmGjF83jXWWU62MncIipmqNuPKiD1V6ioj8x22vQ/fy/bMTHNwQTNTBupSaQlugWM+NiDNaCLUuyGqNM3NRQwt5UFvP6sq/bAz7ex3KLfCHw9V5s02o8cYS3fBuNXQ+L02MpqTNc0JdJ3i7iQ8dIPc32KZePUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677270; c=relaxed/simple;
	bh=hA0n3sJHSqtfCC0QQbm5Ra4aQsTlaYfz6FOXn+eApww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fXfS/1gYlySJjFUGyhizZMz5Ssw30X996bzT4pajQlmvVBcnYnoGCZnGq6uoHFhfkL36HH1OC9iuyg91J+lFkRywy+9rowZBw6eOM+qaQPM6KMgmEoi8skkQOtM4pu9+mV5NgG0z9qUkuM6UbsQ//Xw+OCPcG7sXeFj4vOd8uus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJfIRbB8; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-231e8553248so26634405ad.1;
        Mon, 19 May 2025 10:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677268; x=1748282068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
        b=aJfIRbB8xHocHZmMthwvFr7t/55fri60bt427IcYnkUGRBewlZYeP3o3gxLNY/Kz6F
         FLQTKYecbahXSbe3Lr9EczbdzglQ6x5XGFAn9XP+fc88KGwTCQxo+g0sy79iulL+ENZn
         WSiADkBWSz9p0x238fp0r5OITQtEhqYz4z06Hlku5lewlz6Zz9lNGg9nXLAnYhPQvTT5
         jHxLDI4orUROUW0OtEb+A30vsWFb4kW8FgI1QK6avSiuNQSxgQAL7DL2DnzlqyUa9bdz
         Dz28MI2jTgl9Vz5TOvVscrfVN+241jSWXjqd9kMG9sYCMzQ5N41cuaONxXi2UYAfKqzE
         i6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677268; x=1748282068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
        b=ck4wcxfbTUFtjKLCxCloSrNJDS9GBXUtbmt5Toiaih/V/ESvI1AZz7gFaJCPBHzFCm
         ycEguzu+g3VnrbRKQPRfxVAEWT0jeyuvLgfuhoe43fA1KV9VKNlgN073Tq2bNt6jLWkY
         3iwAuUgMyfhVygpwFiSDQA2AfnAcfpaPBpFPdN2716qX4fKikwmquyxzIO43yGwLA9zi
         Q/krlhe+4VSR1C5CYfF+euQnDVGC6GJVRVupOAJuVMD8/p0ku1nVOvLSWHU9lXHGXyq/
         eWxLI1ONBJ/5UiirnDtRb+MAHCYT/3feeZV9U7O0Vj1ixd+DKHh+UmuIQ34Cwj6LFy3d
         QZdA==
X-Forwarded-Encrypted: i=1; AJvYcCUjee02xc1KAO5fIdt3D1URmHWPZ6KouSQpNYkyPsfUjp0Rvkq6HWAbCJq1Xgwlkj5+3rg6pTxuJG6+sv7P@vger.kernel.org, AJvYcCWGwJV4ILvAV7MmLq8i8gDJlQvf086PyuEvh99qnJqdAxN4fB+g3enEvMZ4kV5QyvDRRtLBIsiub12HqvLB@vger.kernel.org
X-Gm-Message-State: AOJu0YyUv7QrEU3bQJ/lKE0xJaPFvCQoYj9AA8nnCpOwS+PZ4duMBydN
	1Hihjb2YRYQh2vIFP4xgYg0mZPiJDp9ez3fwdeNCcDPw6wz07i77htEy
X-Gm-Gg: ASbGncvPMUobWQOJpSLh+D9DbxD/5gP8kY9o0xjtKfLwoM9RTO1zoZMTHMEwQslBYv6
	3cjUPXUzdGHeYbUTukPKH8sU9mVYsd2616k/BsQCFhwmSrKEC0P8YxfU17nLyCOf+MIBLvwqJ+I
	/SHFIsEgzWT04RG9uDMzqMsw7YXrUAZ8DFg37t4jWyrVe8yBtAYTT23kx+t47tWKXPzo81zQ/Ir
	eweolGFcGOI2Zt+i2SSMQpNydLa1bJHO1/ZUO/tQTSfAhePn0aVZd/KHxASs0yqwsB8qzlIdfCn
	UzalhZLft0UvaeVoXAtSJNDdf+DRD+9QzN7KwFa+zFMXw/YDg12DW1Mi8cyhChCEik7okChgYDC
	FDpLuwtQ8JL/QNj80oxwF6jDKaw==
X-Google-Smtp-Source: AGHT+IHetx6JhjKJiiXTN6lkyo+n0uqidqeO6FYdb9monpI6GoV1ZNjHZwQtDbvkDnweEzmVsK67rQ==
X-Received: by 2002:a17:903:11c6:b0:21f:7880:8472 with SMTP id d9443c01a7336-231de370156mr200750455ad.35.1747677268469;
        Mon, 19 May 2025 10:54:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e971cdsm62879295ad.134.2025.05.19.10.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:54:27 -0700 (PDT)
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
Subject: [PATCH v5 07/40] drm/msm: Improve msm_context comments
Date: Mon, 19 May 2025 10:51:30 -0700
Message-ID: <20250519175348.11924-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
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


