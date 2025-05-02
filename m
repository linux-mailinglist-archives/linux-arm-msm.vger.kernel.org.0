Return-Path: <linux-arm-msm+bounces-56560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 633B2AA7853
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBC69176103
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D94E264A69;
	Fri,  2 May 2025 17:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6iTHPuI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1222609D1;
	Fri,  2 May 2025 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205741; cv=none; b=tkt8qjez9YwWD84lsytnee/G6Gmd17KC0orxpsB1WMtAQHeJp7sv6Ep86MYuhnziIxT1ZjNRLjjFqlrpm+28X4VDnJ7ZCCTbQHIrdkhXfLUlO8yxRxX8cJ2D2dnYMC94NOj1CsmmEpbETUMUuJTeIIjh+Fie8N4NmS2V9K4OEeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205741; c=relaxed/simple;
	bh=8mHxAEEshshm2WXb24eyNu7aEGQQwoRIaYvCXAMpA/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQv4TolCOLmQhjE3SATi9AeSUwWLM+QjpJyb6oaOU+WOo+eooxSRjVffhjMaXhIzKVr8kpmlolbpdbUN3p3c0JQQbxRubr/Q1ALIJ06dUHhK37oh4GIbAU4HhqOXHHeCoOfkrFchbKJ+kbKdD4Ug68DybTGdAovA+QfIVeNpiCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6iTHPuI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22c33ac23edso28019255ad.0;
        Fri, 02 May 2025 10:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205740; x=1746810540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiBf+M9AevSRFbcDBRImMhNuMe0eP7btRUGjQl2g/hw=;
        b=h6iTHPuIaGVEszXkscFjdoW3EUgpdlOHYZ9C8xkIC9VuyHJ8SVLDBt+N/Xuc+7YB3T
         3+qfLMgvKDVH8DnrVwEuGkvwyYpJaCvCBpD2QIYXQZWiSHCQZdWbA0VmzljADZXYe9Za
         ppYo3rWe9BckLGJBGXJarrtWTH5OkyXqF1kPfOnH47YzZShWlo22pm1dFvu/583So26+
         mUjc1IqgEAxUogpq01FKpQqNt5O4JvoKKSubfELcVLHVT4UJAnky2HA+8WHOR4oQb7+e
         TQAl2IMPWw6EPGAQvEU/xmDb/khh39Qn/NfNDn1sDdMpvOOpnVetqROQK+Dw14+WgPkw
         LkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205740; x=1746810540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiBf+M9AevSRFbcDBRImMhNuMe0eP7btRUGjQl2g/hw=;
        b=dKmk7yMjeGutF6hlFVJ6oK/t39PJQmtpr3yVfzKdUagdSASAoKy8D6/su/S7FM7l5M
         hz2q93ZCnK+KhxAWG1jdGvbFOwIBrwMKHgv7O796D0hm3AFc0LhpTM7misNiZuJ5Dzpe
         ATFs7JPLG06jfK6cu1UTExDtDqFzDJv/V6PErJjwjfUVG3ixhyP4QQbJsE/HZWRZ59Uk
         kOZuxmq06YR9ubkW696SF5piIE9jCIwWnhibc/iEZhudn8o6xUzQCOvjsqpIAaxwRtvc
         hnv5fJJ6eVS2Y/UgwNswcwnVCK01WZPNVbNM0ZhlHJq018M4badI2jvXhEq4BOMcoZu8
         HN7A==
X-Forwarded-Encrypted: i=1; AJvYcCUEdrBTs1AhNcXF9Amy/ZjpWDgZX/sUxCeRjuIbbGZqu94kyYSvgKuj/ETkO/dxQ/E7ObQW3DA4e8qgPriH@vger.kernel.org, AJvYcCVyhn/225goV29uBX3QsST17SCO7Fo0BrGdRw3g+80H1a2b4n6vwNhpKts/Oj2bmmdtJzLSiYya84+mzbKs@vger.kernel.org
X-Gm-Message-State: AOJu0YxkhZmMvNmukg5QO2ibOP3gjUeGUuvklqufwySvUsAblp97emo1
	wgo64Gjzbt75XPsrEsdP91HGsbTdg4aHvsbwT+PfAXfGx0K8/nwi
X-Gm-Gg: ASbGncuTqVq+AO5e6ZjF7ZMS+oJXtTpkY2H9gPTaW3sXsrIKWs21ZPyaKgz5voHXESS
	JZfyXmfN2fW9ssBTFjY3egf1aw5roJUMZxvFT5s97B8zyVt3w9EwwZ9s0fpSsOMNtFqoegTBaiW
	3ipoHzu3VIEHzkPh+UER/MzGQjJdgLRbPmMtmj2cAbkTOq2I94N204s5o+fOiQ/RV0DwaGXxGj7
	RLvolxg8naXfMdWg3Kqk+Cn9FD4WZMGkhNCeuP8i97p/8y1xBKyOXV9JTYBQvJiCswxT8vuLejL
	tkRrKw9adhAslWBvHK2aIL8I+glyhsyL/mINcV84DjqWYTF+IDy8BogVMphbHfl4FVTEDC8il/4
	knEMEPsIgjBeIQHSqAk0iX3V1iQ==
X-Google-Smtp-Source: AGHT+IExsdglzZdSO+tWXuekRlcytOW4+n8JJyCS+4xt+lY90QebJwhnuMOcACjo90XWHTmvQbmCtQ==
X-Received: by 2002:a17:902:d486:b0:21f:507b:9ad7 with SMTP id d9443c01a7336-22e10340b69mr52050795ad.25.1746205739689;
        Fri, 02 May 2025 10:08:59 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15229105sm10062055ad.189.2025.05.02.10.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:08:59 -0700 (PDT)
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
Subject: [PATCH v4 20/33] drm/msm: Mark VM as unusable on GPU hangs
Date: Fri,  2 May 2025 09:56:47 -0700
Message-ID: <20250502165831.44850-21-robdclark@gmail.com>
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


