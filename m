Return-Path: <linux-arm-msm+bounces-55967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8AAA9FB59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 23:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC09A1A86F44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 21:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17CD2185AC;
	Mon, 28 Apr 2025 20:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCWNUzRB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F08B21773F;
	Mon, 28 Apr 2025 20:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873854; cv=none; b=SVcLpFwbPEpfiwe+ruEjmInb6vtjSZtmz1R0RHTU2NXbRUBNAkbjozJDzlb8g0RQbVxOTjaApIGazVY6k8cbiXKs531PSzztxa0LcyUwkrdSfSGFoR4w+49zYvhVzET/roJy4P3aB1dCKd/WZ9ewcQfO0UbMimKUJJK2yMVFNhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873854; c=relaxed/simple;
	bh=8mHxAEEshshm2WXb24eyNu7aEGQQwoRIaYvCXAMpA/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rx1gCLnDkXEOY6ZgE9vPV6xoUUtdXZlZdN5UgxWOOcaTP7HyRb9qTY9oFkXxpSd5t3STsHnb1Gw/6FKpnrRK2PwVSpzx561jUUCGPrKzX0uDB+EXhGY/iUGsM2pcPSiQO1KzIER4l+qPYu3QGsKpZfM8mCWBSOyq3YhJ7AZoKwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCWNUzRB; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af51596da56so4500096a12.0;
        Mon, 28 Apr 2025 13:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873852; x=1746478652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiBf+M9AevSRFbcDBRImMhNuMe0eP7btRUGjQl2g/hw=;
        b=VCWNUzRBWAn5KJIdVWRr/Bx2A9YXBe5wuxMJb9bmyIdoDYGNcrdHfDE8rcbHDKjrvU
         M6FPO64dlcHxUis9f6/AP2YzwzgSzHL8Gv82Jb2DMTc5LJJPQrBlJa7XYN9fr128jGL+
         xCe/fG0a41ls+VXtKsIpt/agMhhrr7F6Z6RsCA6xF8EJFp9TWuMyeh/M1mG2oJ0sHDlb
         ZYmvF3ibpeOwQ3qE4p+9ANSWYxt8gOdvgytd4vGAejhd6RLYTHMEDwHzySbAiXJlPw9K
         O7nC0wWbLHqPAsD/ObA9F7+VC4zAlCAHH3cwMjewypVb7Z9hfPqD5rR6/9MwadQH4pJk
         4D3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873852; x=1746478652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiBf+M9AevSRFbcDBRImMhNuMe0eP7btRUGjQl2g/hw=;
        b=EX5p/MyUR8ohNFm2Os0D7LksqNu72XvjBgkrSCjbbH0CkmREVMfdaY4MEhwn9Y5qqM
         G4ik+bfEAkDzl5ULIXiZpMp/tLZsTfXmD59vMf/ko5TeAM3euRjfPomJuor40giZTI/B
         lZh0azU83aUG6MFohsWJVszDUoZdjf+noada+NrdHF2zDDeb+heoShPSsSvXR9HunoIJ
         BJOObHh5VJqlgJgqP1NIVEaHktp3WwUdsC+uqobzcS7+BlG3/4KiM7aT2iOy5rQgaadC
         oC7iM13LR7aCdH+a/f5T6caRrkZVy2Mv0CwXG108UTv4kz+nbAY6daiSefXsnVyx/TJt
         POgw==
X-Forwarded-Encrypted: i=1; AJvYcCVa6LG24ymZWz0M7zc65nINkhg82Omjm28lGFKe3moFdUixhTTFw44sYM9O20fi92i+blxYeFEb2Nk4GSDG@vger.kernel.org, AJvYcCWstkLxwWK2Hi9+Gb9n/KFSL859tXis7gh6KyvkH3emPtQhN7wlOvbtl/ZFjEQ90i0KRsxnX4J0ARLTAiPQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yza8mQVpzPb+e1+1L5hevw/QqQxpaICf0d2WfXhqPCUKlB1hkcT
	SxYo6jKY0Wuio26s1cG1tNLxo/9Ld56hAh6w9euXTPYHm48jM7Vc
X-Gm-Gg: ASbGncsjcqEYQ/NWCDxmHomkWMv/Uymi0bREdT1EvtEVEfwwRkZuTxi9HGlLD0DjAOM
	0ZHl9BWAL6fi/OXTdhlIw0fonNbreczegVfIo+21q/SVRwmZ3afab9EwxkjXd/kGJoNONM83wqN
	OPvNV60U0K6x1bmTLrdgoyCkf3JCWY5QfIYiWf9rwqT0/n1haTnoEH+xCdHlNzJlSRG0xxxZ22H
	0sthHBB2HXiDp77t82VJsKgH+SxugSXh7X4DzLTvFLe9nRRdx/pfeBsOHX16oRjLjBcWqju5jE/
	6A6olNhY9jRzjcYm3bPdVW64bOCPp4vX7nOt51Yxvyag/YO79D1BwoqIHDKn4xkMmzf8w7xh/P4
	ZYbAxZowrsYbrvG6Pq4PzWXQm4w==
X-Google-Smtp-Source: AGHT+IFXdzKrihExIBvfqNHYg+m/uQ//CudivqgcbuhjkyCtbbngu/oafymvsQox+HO003yzXlg4tg==
X-Received: by 2002:a17:90b:3911:b0:2ee:b875:6d30 with SMTP id 98e67ed59e1d1-30a21551d3emr1804846a91.9.1745873852186;
        Mon, 28 Apr 2025 13:57:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1246d2sm9520720a91.36.2025.04.28.13.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:31 -0700 (PDT)
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
Subject: [PATCH v3 20/33] drm/msm: Mark VM as unusable on GPU hangs
Date: Mon, 28 Apr 2025 13:54:27 -0700
Message-ID: <20250428205619.227835-21-robdclark@gmail.com>
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
index b7c7f6460aa3..375d89f23cd1 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -666,6 +666,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
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


