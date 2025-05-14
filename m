Return-Path: <linux-arm-msm+bounces-57907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C19AB73B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5CD84C69A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D14288C0C;
	Wed, 14 May 2025 17:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TopFdMQ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD1228314C;
	Wed, 14 May 2025 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245370; cv=none; b=LTQxsZi/hz4Krb/NgxwX63XQv0hA4iksR8YMbP0jvi6UkV7awbME9z//jsifg11kKGBp4vRKYSt0PUAEu2D6eVFOHT6iS1KQbx/eIef+GyufOvAWcRsNV278IkzZ47x0WeiM77fhDijr73jlNOWXB5F81B7tyaUKfnv3TLpBzBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245370; c=relaxed/simple;
	bh=hA0n3sJHSqtfCC0QQbm5Ra4aQsTlaYfz6FOXn+eApww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZO4qzWqrQmemOWPsj19gNRKHSCqpRZwUXKIpoftrasOc4LK0rvjLAR9wtlZZwModBQSI8btgoQne1P6Gguq6PtflmsdNObzMLWVE+xfXsI5pgMHf7fNqLlggCqyaiMoLmZO6Yx4fFvVufxHQk/msbwCPFCk5aQ8HBPHQyubHXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TopFdMQ6; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7410c18bb00so205470b3a.3;
        Wed, 14 May 2025 10:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245368; x=1747850168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
        b=TopFdMQ6dNf7z3w2/+ghX+fcvGMBPhJFF2ryNG32wsJHEcYthM4C5/cwVAR+fJo8wo
         K2GxF4mk4aCiNcOf4pwsu2WpIjwgj99BLXVitq+VNy5NYvCD2gLprdnAizIxUTFn53ZA
         I6iMy1ONHqtu2MBffUD9cH6z7i9+KMuyREf2tGdd+o1gJvLy0j6vGIJmWdHAQDXzeMib
         UipcHhln0D51qKBS24w7ABVnrMYNdpxOjNqA+WT3cuW724vwqHrGNiMZov8wVAPDNc4m
         IzClP1eGk82ack4vudFizW+JOygicA0AtbFQPRM8hVQOYs4+PNC0EsFSoVzSreOOjAew
         Xozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245368; x=1747850168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9wao8L9QpDXqghTRoSkoUr2w+hVzfvrL1RxfpMOf90=;
        b=G0PD2Tth66vgsxgehcY7PocdbjxHjS2aHLLPy0SqePDQ+NVKqc9fCZoVdcJrwV9LBk
         gWZ4rdoE6TzG/p8RpCRQV8O/9/ttSZuR5Gi8J7vivx5nQis0A3tmX4cpqGvfeZzgjr68
         R3ayT2xsbDJxUQ8WQNagM923foPFnlHuogix+iBGdXbME3B3onrcoiy6hvNOgaSHmvZS
         let+C+DvN4FVsH/7kzxWx7i0euswPdsO/pTWKWBUmukT/NXxxyXbQfMvOnahRHo9KxMu
         dCl0qrzS2t5cx1M82RoWvFLoGWmB20EWFKhcFtaKfmj87Qj35dZsjXmoY768G/F0A+Rk
         FA8w==
X-Forwarded-Encrypted: i=1; AJvYcCV5IvdGfqcpO5cGtH80s2+2yXy7tHvD76Bsr9lMhqasAhAu1tQ/qM4e/2m8H8H2d07DGHzE6ZnXjgpf/FxB@vger.kernel.org, AJvYcCXRg4eluIeDg8S17UiyOxgOgUcaXudCJLgwMkjrA0hT7hPjqFXY1E2QJO2JAyczGqR9TriNWtLq8XJZsf93@vger.kernel.org
X-Gm-Message-State: AOJu0YyZf5jdc68C5dunvh5ApgEzhJEgBD/56Cr+x0ZMX0ELBGn4yyti
	aQrEWDHyrFxIBZrRIwY2THY3XUYS0GUJ/uYWcvg0aJuuR1cdY6Me
X-Gm-Gg: ASbGncsARO11j9NTFmj2aQJzjYty3AlDnm+E85UnbXd40GSVgsIG1aOHtdrowatTl0E
	4yItr3/zpovi+gkl9Ptk9T0bOZgiZPUezVaOfgLJfc2jLgSG8p9wm6CV7707aZaHbz3qNKPZCZB
	glnIk7BUD/5xNFtRUj6O/BpSTRFPjYvEK84lrtg20qQGdwxwHWgPf/L9ZBX0S3DvrJbCWBOPSZG
	IhZ0Js+AxwazzyXeTbN67ycT1vrFXLOJmmaTZqDg2wPo2j5+CeJv0yC9Hl1kFIAdJjyqO403sS3
	E4ADwTLd38W22/WUd86vtHjERd+d7qKNfYv227lbDABIhl5YJkIMYJ3CC3ZrV9WUIkyF7buNSz6
	BaMIMtiuNtZ6v+i3rKkRixk1Nqw==
X-Google-Smtp-Source: AGHT+IE7n0jebqOlgwRPE2LUvYLUPAwTqXWpIJ7ipoSw5YEY/SB87+s03wgUzFLD+0FVJpu56LFyoQ==
X-Received: by 2002:a05:6a00:3311:b0:740:9e87:9625 with SMTP id d2e1a72fcca58-742892415ecmr6676004b3a.4.1747245367546;
        Wed, 14 May 2025 10:56:07 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a8972asm9672212b3a.157.2025.05.14.10.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:56:06 -0700 (PDT)
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
Date: Wed, 14 May 2025 10:53:21 -0700
Message-ID: <20250514175527.42488-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
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


