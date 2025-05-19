Return-Path: <linux-arm-msm+bounces-58534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2540BABC6A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F94C189615F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F94F28AB0B;
	Mon, 19 May 2025 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N78csABb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ACA28AB03;
	Mon, 19 May 2025 17:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677509; cv=none; b=baOkCugIKzeVTUWGAf63fnvpVzfxwpZJCd4XQ1ExwCU0UFWRvLZz7vAu7vbC7inAMdbzt1Id1mseVTIh5M3D7BNStdxBSANMWgUjLiHk2e7ZRk2RFRNQyuDl6bjeJWOMdH+RwLfgSb/iTtz75X4A3jmY0Duvl7qZlULY/8O/rlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677509; c=relaxed/simple;
	bh=vcGnDUc0jlkB8HrBi9RCWsHF6aWOVhZxx+sQm1b4eUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sRvzF52I5utCxNWq4uNTrP2yq4+R54Rz5wAGfcvRIE/g9nHQGvlkDclblZqIYyc8WQtbZ3o6rRdplmO7n5uNvYE15wxgpyg1ltpsTHtwLi45YCSdaxL4eoymrQCSpJPyGybXbtMqCVMFyF4NKBl1ubRroHNeOMblOvsjh8QfAOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N78csABb; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2321c38a948so19542655ad.2;
        Mon, 19 May 2025 10:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677507; x=1748282307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkF3rncj/rkQO6FWsPGasU3HuIPXC7SuBq50xwp/TTg=;
        b=N78csABb6ecgr4t97ZsNFwyoHjhsdGPx2x5vOQN7+156sDTG9VrT4+Xnp8olCteaT7
         hffkC96SJuGH3Mtr2HyJn06UOZgZSUdx7J55mqclhfFmFzNEm4pXZm0m4tufdMnw611m
         Fzo9WFMHewAu91X5E4Ujt4VqZIuGaRaJBVIe0ZdWUS/nKoW5hu76Ka0nN8xE7IqXYIWa
         YGYvfQ/gM0mfW9Ex7+HuPzEox0SNFll1JDo/RSMTHA3jZqo/myLvYkBbytsCGcn7b+DO
         aTh4KO1CZXCoWbnC0psmqo8+JWDzPaapkPjfFmoLoM7YbwyV746VUMfzXTIWnwjfHPe5
         ydCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677507; x=1748282307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkF3rncj/rkQO6FWsPGasU3HuIPXC7SuBq50xwp/TTg=;
        b=asGyA5r1mescNnJQ+nvutwk0S1sdaipHBN22rrd2IKe6pqc7ny8xHNju20Zhhm+YK4
         B2gGixmYQCPqtZuizgRLcC2cGwhdmqtfHyBNeM8M3OO+7zOa6A3foQ1MyERF26a6LL2M
         PxbXrzVY6uCd1+tQj68zGjcpY8G3HlfKNMHc7sOwq3Vpxr+0VG2mwX0HIU87jvzNn0cR
         qpGhwNgHX6dvSxjkQScFb57M458Jpvma+DKB3tZoBl9JpDQn8Ln/c/a7wXv7emo9XOKr
         kC2lkAh3h1CKcPL6VrJ7Mont/FR7HI2XzCUPVakvwxfXwjZYN390Fm/6haDv6wSxoofd
         OPZg==
X-Forwarded-Encrypted: i=1; AJvYcCWum13448pdT+VVFg2efjg0LTD+ANyJoDhc0yRcpXhPN/tE6q8XciKgXKn5JW00kluBkeMQoZJJPXvJtOZC@vger.kernel.org, AJvYcCXLU7L2ldLkEJ3W8/yGlDQIhSGSlj2l7nnyTGtiu4qtUdRll6yjPzEn8EnjPCuQer57sfkd47NwIOByw4Ep@vger.kernel.org
X-Gm-Message-State: AOJu0YzDTR3e3bMLnCNf38yTeKn0S2Fge9XLGAMV57CRuqQAs60ZMn/M
	9YKKjkvYZvR+8lWmOuwtyIhLiwv8jsHl+gYhElSz47SuHfcklK4cW3Oh
X-Gm-Gg: ASbGncs1ZQoi6lPXHq8YzL+z4v7+JY1GBrV4D7/kwuSZyD+efsAom4M7UANt2XPuGCJ
	CzloSccwXlR3nZfGg4w/P3RyGXGbxQC9BU9AOgYer9TWfW/ywAAQJGVCIDhqyneSq/QnwlZnOM6
	eTg4mzOBIBKmbh/yovoi8h3oSw2uB+hnmIJdAfvTSmB8dTrdyOORoecNWOf9qImEGHCRTp6v6rX
	rdwJzlM3waqp8B3p2YTJfGvZe4YUdmkkgZ5jKpw8NPKFrBg5GOxU0jKh3PEM3DIoAkvCi/QZ5Ss
	vwFVFXVriXxLwQxemmwxzkD92p8nTRCxsjkn9JlsyIvOZ9RhUfO9YXDU1ES//vqGOJHqWd2MRkt
	uhCJ2/RGpqzj+OrPR1dpolNacaQ==
X-Google-Smtp-Source: AGHT+IEpah7ZiizvtAX0mFUqc0dXE4qmNDG9i9hxm1u0++6a0TW5fE3lhDJFlLqIxbd53kB+MIFJnw==
X-Received: by 2002:a17:902:ecd2:b0:231:d143:745c with SMTP id d9443c01a7336-231de35f0f8mr162321705ad.13.1747677506687;
        Mon, 19 May 2025 10:58:26 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb0f5sm62714445ad.192.2025.05.19.10.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 23/40] drm/msm: Mark VM as unusable on GPU hangs
Date: Mon, 19 May 2025 10:57:20 -0700
Message-ID: <20250519175755.13037-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

If userspace has opted-in to VM_BIND, then GPU hangs and VM_BIND errors
will mark the VM as unusable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index da8f92911b7b..67f845213810 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -76,6 +76,23 @@ struct msm_gem_vm {
 
 	/** @managed: is this a kernel managed VM? */
 	bool managed;
+
+	/**
+	 * @unusable: True if the VM has turned unusable because something
+	 * bad happened during an asynchronous request.
+	 *
+	 * We don't try to recover from such failures, because this implies
+	 * informing userspace about the specific operation that failed, and
+	 * hoping the userspace driver can replay things from there. This all
+	 * sounds very complicated for little gain.
+	 *
+	 * Instead, we should just flag the VM as unusable, and fail any
+	 * further request targeting this VM.
+	 *
+	 * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOST
+	 * situation, where the logical device needs to be re-created.
+	 */
+	bool unusable;
 };
 #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
 
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 7a9bd20363dd..f282d691087f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -676,6 +676,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0314e15d04c2..6503ce655b10 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -386,8 +386,20 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->vm)
-		to_msm_vm(submit->vm)->faults++;
+	if (submit->vm) {
+		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
+
+		vm->faults++;
+
+		/*
+		 * If userspace has opted-in to VM_BIND (and therefore userspace
+		 * management of the VM), faults mark the VM as unusuable.  This
+		 * matches vulkan expectations (vulkan is the main target for
+		 * VM_BIND)
+		 */
+		if (!vm->managed)
+			vm->unusable = true;
+	}
 
 	get_comm_cmdline(submit, &comm, &cmd);
 
-- 
2.49.0


