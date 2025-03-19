Return-Path: <linux-arm-msm+bounces-51989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48190A6926F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48F24882871
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88ACD2147E9;
	Wed, 19 Mar 2025 14:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkHaytvH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33A11DE88D;
	Wed, 19 Mar 2025 14:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396140; cv=none; b=mthxBEqF/IaHUHYyQUd/89YDzdAaEdfTe57Fe6jXTGt+wqGe+YDa7vhomYMB3EYIotZUNR+4pNu3rv3VgG7Kmz1xK5h7hSuL3Nq8qySd4nVNT4XKdhQSACKhHqq9e1u314fiiZoVYpq26jGxV9Bsge/Bq+0Ge8BpiMkxk90RARc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396140; c=relaxed/simple;
	bh=PYjhvIGMZOmHXUrOkWbR44l0lsxY9HfY6WnLu+ZllKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lo3vfwqfAa60RP0rdReodSmTA+4xLEYKEnIevyjim/yphot3f5LdFSflcEX2ZWeyUSUYt87fs8iLpTDL83Gq6/Q+D8dpGLxC2frpdue0ui//5/rfn+Fv1dAQdMtM3jcWVH1uNqFQN6xru5/GMbxephDbs47TwK1M89bm5jcdNDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkHaytvH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2260c91576aso64656815ad.3;
        Wed, 19 Mar 2025 07:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396138; x=1743000938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nim9kjrkjGdIN6eNBZAhPnqJ/xfEPzPRp5Qv43ty7PU=;
        b=IkHaytvHBs6fxtTzxk4cBgfSJPd8Vi3i8cKq4EWm71Vi0/VY2+srjDDCxsbg3/M1Ly
         EU5fBadDe8ebb+9EEUeiFfk/dbc0cPqWt7NPEsd6YJZEqEZWIkjKH9OCar5dqHzJQBYQ
         vQdaLlqC/RTxd5+UIF5cYqzTfTMWgLmYkqy45au5AOdDwIushMPnq4eoQ9WeOu55FyT6
         B9Iw6dH80k/5Iic4Obf2Z8VIfuLdfynJfwpsYpA6XqRD4gthhipPk5CPZBA1jOg5AAuz
         uFbAuQ+CvWldmhPgggKS9aUEQROzsCFrOJem1aWatdUdmzVUxNHXRK17191jbV02qF+M
         Q2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396138; x=1743000938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nim9kjrkjGdIN6eNBZAhPnqJ/xfEPzPRp5Qv43ty7PU=;
        b=jqdpFrYW0bo9bz+27gJioIQvDHI8tTbSaIhNSbpFdXBYJVP2O050YQCbvM9bo1dQ1/
         qOzpClrFbKlNw42dusxtbJ0D2ZjZYECpP9k4HWt0W7Ac3SCXS34VOoq4L0yp15hMMyeS
         9IWnJAzpRM2Pw4e49OcCtZW/4sikztRxq0ra/c1kTqv9bMHBo96H7kRb04IbLtP7zMEm
         baAX4Ow8LeAnVvfQF3XGq6h/FaruKaiOcM071dKjVmN0RYkxmQGhNazpiFhvXIUy3Kfj
         fRYTf02TFNW0DBoiMqPJrZFcbHmOQ+rzrA+NcR1P7CT+eGmANoBVsrbihsbGcufM7fQ9
         H/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUU4+CYAX9iuANFOtyIGFb5PT78PJwi0i1AYSakq0dHD98p/oAJ2SYqS7u+solMf1gYLgPXoD2EDjRcLHTM@vger.kernel.org, AJvYcCWG09iLnpeiEjMLwBXQHqfZLccx7Uo2Y77x4O7Ucg/L9NnnT8sO37BDkFFhsCKOdGHxFrHN9dvYGUXloEwo@vger.kernel.org
X-Gm-Message-State: AOJu0YzERf6RBM5osqIM36SILXbCF9dILyZsAVuHDPqXkHNkL7oR0NrV
	ZOe7mksBWrgMYmZCeJJfjQa033tsxIe7XvmaAdJ4c6coAv4bV2UK
X-Gm-Gg: ASbGncta3MO/lG3msnUiqHbflx9tL5HcnEEZaJlvWT6L2Z4Y8dI2myS6SFRfpmQUaU1
	MAb63+AcGl+Ylgl50GcKJUao+zRjB52eiVqmulNnNkB+BjPklzzvA+y7zinjpokoEEKi6ILKaH8
	jF1AMZFHzNF39Nx9mQ6S9Y1Z6zd2vjWBgd9EdIAGjraRijb0PLI6HIxz1F0qUVuYpxaFub0pzAq
	Ey2l2ybiwkNK1p13LT4/XdMAoOhrpVmu2SXJFatCtU65rrE0R8A652u2t8p3vOxjo5+GayHZ26+
	YASMq20IqBQPQCE7N/8qRyQ/CW/R/JEAD/am1bPw+0PkQ8FiKTk9K1IthBzoXMjBHBMeDxKWnmk
	wHv50xmM79jTCZ8DBoUo=
X-Google-Smtp-Source: AGHT+IGArp2n3VmhersmP5Pj7DoCKt1FlM2hckfmyKddMEM26QCObFWqRh+c2PJFcEiciG90iToiIQ==
X-Received: by 2002:a17:903:1d2:b0:21f:85d0:828 with SMTP id d9443c01a7336-22649c8f940mr50284065ad.41.1742396138086;
        Wed, 19 Mar 2025 07:55:38 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68ab4c6sm115203605ad.77.2025.03.19.07.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v2 16/34] drm/msm: Mark VM as unusable on faults
Date: Wed, 19 Mar 2025 07:52:28 -0700
Message-ID: <20250319145425.51935-17-robdclark@gmail.com>
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
index 9731ad7993cf..9cef308a0ad1 100644
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
index 503e4dcc5a6f..4831f4e42fd9 100644
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
2.48.1


