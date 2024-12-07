Return-Path: <linux-arm-msm+bounces-40858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 064149E80A6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E68518843F3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EA81531D2;
	Sat,  7 Dec 2024 16:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWrfADzg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A3214EC73;
	Sat,  7 Dec 2024 16:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588241; cv=none; b=H2McLpVMWi0n9CNCnW2h1nV+4FFIGipNbUhM8SjS7PuDMqig6rOYWwWAXtboNPmHMB4eXF6J9s+vDnwVfck1uQwCkt/6LLM4/we9vy7g1S5h2q1zSRq53ba9lVZZ35Q47ELUc8hwRhWffIhRfv13qEM9lKJI2BSe7Z3RlJhVnJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588241; c=relaxed/simple;
	bh=LrMtcrJsWe3nUe1gFanbwSIOVvkq5q5NxXhzofQlBzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HCvgpS9Ofz+WW9BxUxYE4M7drgGc2zAFEg7bwYmC6DyqSNmsJlWkyfTn/XkbvnlmBmjwf+UAGKgOISN4QBJoIx+k1Dg3wfo92C3pSe6TZvrbktmKbl7Zr3QNHLLcCTzUYZ1gEHuEY75g5jFynIuQHiAFYFlCquonixRVnh902Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWrfADzg; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7250c199602so3292581b3a.1;
        Sat, 07 Dec 2024 08:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588238; x=1734193038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uFEdHLp4VUZbVW3eaLyXZ1CLYX+lqZJRxIQr83XVZ4=;
        b=TWrfADzgQ38TrMa8qGg4yaS5kemlzFy60A9Jd1UJcUcym8DRRziCntOAjYx6YCa5hc
         6fqFtEdGi0z0H0FlbRjVHX58LDr3aJSkCkXTzlCYno85SQxzikVnbStfZToqoZcO0+GI
         kV5W7eTEqhgE/Z4ODVkkIirhMsf8RJPM/ckbdSlG1oDiKiJYNKO5Vxkuv9CIWAiCEBIc
         zmgqngc10TLlBKZU/QNxKr/+boDefnMM5YxDmfn/BRPVhfwQ6Y00NN82MHSa7C/gnGOr
         PtFYW75v6rLBb1OWE/32X+RFAGHjnriw3lBjX4fGggKs2wqLEWwDWRWVImSVKvF0tS8O
         LBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588238; x=1734193038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uFEdHLp4VUZbVW3eaLyXZ1CLYX+lqZJRxIQr83XVZ4=;
        b=tmuoIjQDyDWL+dCUfW+6TudMEcWpJnnd5q17sTFvU/vSBH+EE3VRp7NiAehzKRIhDM
         hLFD0BA5Fv6YnoR79G5u16+dg23R67saLk+Z3x98BgnKbJrdn4vDaO5OmTTB2izNf1+K
         N4oVnIUuJaLWJPaPXz7bvepnkEbboJyUImVPqht/j40CRdFqXpAOj0e+CLuBoNYje+BB
         QLhkbVXFbCHTiGubN0rWpMWV0GnRGzkYogRbihIvsk+2pq3QPo6tVw+P1s62lgoyLU3X
         mbFb/j9j1Wl4Zp8znJDIlcLPyTChDVLY6TloByUnVBo3eJgOpXRg3h3JLHl4z1aRX4n4
         BhrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsiwC23+Kn+dyLZ4C0AKfXQYuGzFLUiqUfksf+45+A6vAqNvOpRtq4sblGxtY9Eqi29vpHWpQZyL5ixR+g@vger.kernel.org, AJvYcCW6elNAe7kt8xpz8CrpE4zaxd9IS3OkmpC/ubaHQFEM/qZ3TFTpLXsGOMs5UQKaJE+1nc0hIvnJdQBOZk6T@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+jH9c2GPTYVmviltz6cvagKMQ3oWymNN0oueu2hVajN1lI7gZ
	9OaG82vCXcDmElI3syD/IJh7XRbi8oiwB2JU+GTawNNGN/b3uQFD
X-Gm-Gg: ASbGncsKMrLBLqyu1XR3t+QLEkB8/C/25zc2DvZaM0Mkv1XS5oZ29mUBv+SaOjHHSCW
	HD6ryaUgDJEvJpE/79y433zbCBnPE2WlC/VNRDF93bAhXKitM9nWAA/d8DcQ7ZKqgIhD8WX4VFf
	Pvw1WvPD/27Mn7SSMq+Jd8zqZRPGFRYJ3Oxx3gdBddraBZ6C0STHccNltuXmT38UMDGidp1eyxu
	x3QUFMlhhp3pQuXdgq+KFbkN49DWQ6/zqABvNgnv9rlNCXGCWAVwu3eSZs50R+M43bl1XLmT2Nc
	TSI96iWm
X-Google-Smtp-Source: AGHT+IFzlQQnmd+Nye1RouxY4f7B/5e6cN53cpBTcztHP8nFGwlNi+lJxK+QOrngvG79eePW7ncK3g==
X-Received: by 2002:a05:6a20:734c:b0:1e1:9fef:e976 with SMTP id adf61e73a8af0-1e19fefeb02mr485499637.23.1733588238404;
        Sat, 07 Dec 2024 08:17:18 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e2f2d5f0sm68691b3a.40.2024.12.07.08.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:17:17 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 02/24] drm/gpuvm: Don't require obj lock in destructor path
Date: Sat,  7 Dec 2024 08:15:02 -0800
Message-ID: <20241207161651.410556-3-robdclark@gmail.com>
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

See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
msm_gem_free_object()") for justification.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..1e89a98caad4 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	if (kref_read(&obj->refcount) > 0)
+		drm_gem_gpuva_assert_lock_held(obj);
+
 	list_del(&vm_bo->list.entry.gem);
 
 	if (ops && ops->vm_bo_free)
@@ -1871,7 +1873,8 @@ drm_gpuva_unlink(struct drm_gpuva *va)
 	if (unlikely(!obj))
 		return;
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	if (kref_read(&obj->refcount) > 0)
+		drm_gem_gpuva_assert_lock_held(obj);
 	list_del_init(&va->gem.entry);
 
 	va->vm_bo = NULL;
-- 
2.47.1


