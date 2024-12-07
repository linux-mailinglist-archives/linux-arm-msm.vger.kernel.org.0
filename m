Return-Path: <linux-arm-msm+bounces-40871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8CC9E80E5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C16641658D4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4982219AD86;
	Sat,  7 Dec 2024 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkHQ5624"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F26155756;
	Sat,  7 Dec 2024 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588287; cv=none; b=Igvq3u9gzFE4irTfY9yXnmwknEzfRqND5VP+SVBOiYRoti+E7FSYZcqxFelNlyLWZA9meTiZzIUVAHxxSoIsIu4krRKzSc+KxJb9IepXp73R35UQz+XknevDUR/5YTM4ZV9WWan84lgzifLwIHRYAvYCseS6E2T/AE+9au/d+m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588287; c=relaxed/simple;
	bh=4rKkRajRcWjn73bweLkaKucSxW3mkpCSI+200+BbdaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obuVmVnaHT/PNSTmR1gPpo5sb3WiBoaGHXvbBr4260ULYLlNpn5HM3kPtGqGldUvj+Pq8Yoob55XeixGDtGyZmAcNtPRyg958AqAJFwyWjc9QErh0k5A5KkL2mdJxVDbNCG3OFBT5JZsRXt03rn90TfP/kKK8PxtE1iBdZ55HwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkHQ5624; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so322723a91.3;
        Sat, 07 Dec 2024 08:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588285; x=1734193085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXke5IvCE9wZOiP+FCq6Xvomp2+4wRzsSagcwog/vHw=;
        b=YkHQ5624B9n3oH7t/PCP90jRShAyxMaERB8dHB8O2BKis2ZjgrjTSI/QgdaW3K5Qf3
         c1eGQlWzhbkxaxbHxQa/yyIxbbI1FdySMVEh6+8eMLUlLeH3En6Oflps+MU2WWZdj6hJ
         1jLoXbnOrtvhc087tLLtllkEFCup9LAdD71iaFWxULYtGikjismou/R0fy6wZm1E1Ldk
         hb+u5Ge31R6Wy18KxpijD3yAtupBAt/8NaPGw0ai5S4+QKaMUKSUtAhg1+9eh8+u8N3I
         8uB467c4wPT8b2iQ3IwpVwfLF2tWqV1RIenKufcOK9eboIiJkTLkMe/xogYgzySy8SL3
         xevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588285; x=1734193085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXke5IvCE9wZOiP+FCq6Xvomp2+4wRzsSagcwog/vHw=;
        b=TiwlKb5AiUa8ifhdXkyRqhy0OGK70Y5Q5SaiMv4ZUvbN5aaf5x1ja6AtKY2/ut5mkC
         wvsZ1qW81vs9KJrfdTFvUwuBdVL7theZDAi33AJDO2WHI+5mLo1QKf1n6qVAXIH2B0oK
         WQ14p8Zg5EcTI39VH7lNwEksSA8dX+a7le1xD02QIx9NjRe8u8uH5rmi1iYepDtOS1tC
         /vLwfdwsj86fKE7IMbqzMEGI7boerf9ia8WwQvyG+Bv8qyx/oDxYwvklWdGnE+fKBlTa
         p2PCT8XkRsXm08IxhjwQOgWPALTlnW0l3SE6pDB0qs+trkw3m97YlQNk7eVcLPuCNS1Q
         16oA==
X-Forwarded-Encrypted: i=1; AJvYcCUXQDciCNR+QX8BOA861RbwUGdhvaa9mvXogU+hk/RUsH6VlOSygZ1Rb2216EgiOIww+1HGThnPxT79QHFM@vger.kernel.org, AJvYcCWIEcQtonl0wQW2gRolojU7No4fND0U72F/NpEbAj8fT3Wcve8/tfZIIezrFeE42/uTocgp4t3jY3J3hkSL@vger.kernel.org
X-Gm-Message-State: AOJu0YyK4AFleRIKQOYJhT5P9+MwXE6ddMKykis4N/WplYay1M+AFyQa
	Y0VTFyntk3Ig+lp/mCM8ujxMprLMSf8e20+KY7egqTB7OFmDINq+
X-Gm-Gg: ASbGncvWjFsFtC9VY1Zk8qLi2KLFlsXU6qfu5+lM+5SqbUYD/Oawg5wk4sQ1Uv8p219
	9OTikACUSDF25R/+MwRQ3M+G3F2pNCX9xGEJ4UwDMk6rzLHQxf/Cv5MHuhjLWAdaMg72+TLmHNV
	Gam9p7HxkrW+SWnZwAL22/UA5RkCbYUwvTS4aKLCeVLgwvQuu89afP6a3fBkkWc54o6n31PkJVo
	TcQqbuAg5cV7aJ4g9dxZzqxqMcXPF0Oh3r0ctpytga9rpA30LicGO6qhTabgbw+Rk0lif/wU2fr
	dmBL/36B
X-Google-Smtp-Source: AGHT+IHSa++PBWaXO+f4dEH83U9tiDUIyMo+WVP1SNHlXxU8XN/RM6foAtjSKMWkqB9vnXfqmdxvmg==
X-Received: by 2002:a17:90a:c106:b0:2ee:f076:20f1 with SMTP id 98e67ed59e1d1-2ef69199e7dmr10174908a91.0.1733588284796;
        Sat, 07 Dec 2024 08:18:04 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef7dd1f583sm1967668a91.14.2024.12.07.08.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:18:04 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 15/24] drm/msm: Mark VM as unusable on faults
Date: Sat,  7 Dec 2024 08:15:15 -0800
Message-ID: <20241207161651.410556-16-robdclark@gmail.com>
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

If userspace has opted-in to VM_BIND, then GPU faults and VM_BIND errors
will mark the VM as unusable.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
 drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index acb976722580..7cb720137548 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -82,6 +82,23 @@ struct msm_gem_vm {
 
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
index 5e37e1dad5bb..79bbe552f23e 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -668,6 +668,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (to_msm_vm(ctx->vm)->unusable)
+		return UERR(EPIPE, dev, "context is unusable");
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 5def12abac6c..72e5ad69a08c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -377,8 +377,20 @@ static void recover_worker(struct kthread_work *work)
 
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
2.47.1


