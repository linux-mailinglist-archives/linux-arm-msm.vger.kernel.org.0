Return-Path: <linux-arm-msm+bounces-55948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A10A9FAF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 22:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 756CA1A844F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 20:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C16204866;
	Mon, 28 Apr 2025 20:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElpealgV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7131FBE8A;
	Mon, 28 Apr 2025 20:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873795; cv=none; b=rSyng8qparHbjIHZJOlem8eprBzAKMBSNuIMr6Q8uDgKEYwdygQLMZUEhdDzg/AtBMOWarGDYoiCwW6hCSNbiF9gxIz/cz+oGx7+SUDiUi1oxNuBPhAx01d9cJSFOn6vPgW7qhl5CivWwIB11BTw76G7EJKX4oTzJ19u6N8Ho3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873795; c=relaxed/simple;
	bh=388Q4Y2vXw/88ABph+aL+8fVavpaQXXIqL0c5ylbmAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J75nRSdZcpUoSSQfEkZkU5ERx0l8W5ilFiKYPSLcGkVYHYk149eaNNboJEaCo2A2tOs7SCx6uR8Q2q6S6VLTqXilhXNyiL/sCOhW4VX/AiP7dEVxVtJnQtwrPxx/+YX9tUk7VTD3ZBdqCi2PIT+z/aNBazWaVmJI3tJ97G7uIdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElpealgV; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736b350a22cso4667898b3a.1;
        Mon, 28 Apr 2025 13:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873793; x=1746478593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Pxupw0mnheBn4UC0J0PHtfsiWVwGvSizaV6fVHNumo=;
        b=ElpealgVZRKHpimu0QwMu+QBR1hRINFIXOMRVl/Ksnl9a4FRFI/f4lqgp9AodOlzE/
         a93mf3BKERj2a8i0KwIxaVKMe766vxr2tla65uLsTSRwZ36XhScr6SFrpLtkE+bQYTt4
         mn0Qh+59qs7CEC8v07Rgr/cQKEW8ZS8mLB1V80wH1++soC5HwOL29l24wYRRspPy+csN
         2/Axqo0z+F6kotSSNUnrzlnzbYY9ZbPkyr4Or3l2P4QzCevuf1SuNOv9t9YbRtI8k/xs
         zI6fgc8tD+1TqTnJktINhb4hJ1wOqsRygg7sko8MVyZ098SK2g/Mp9Ks4dCIl0pj6fX0
         IQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873793; x=1746478593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Pxupw0mnheBn4UC0J0PHtfsiWVwGvSizaV6fVHNumo=;
        b=NVX/ExDkKjAIg7eDvAgeUFwEg9ps0EwmyOxKBZ+T2Ngbr26vT358Jui3nPNulc4lm7
         FdDbl6atE2LWm9d3WInvQM6I8Huh43y1eVhXa5a5v0RBg+FzrCDfQBWA/j50hNLzk4pA
         rsqqRetgFFnl0GYVnHANDRBtygtIOlDk/nkVJhXbFv2L+0v4TJHhzJv9r4NKJ3d+EYus
         08FXn1aPrH3YbjA5o0PZvowpe7erzQfribW6im5RHYiUyYnXRKwMHm2HZ5Etth93sLLh
         Kwch6gvL0uL7jKhvko/c7v3wYCfnyxDThQ/OhAABAJgotXwl3zq9IAmJRe1mFs0l0lBN
         HfkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiQMFdVVWoBi1vDhyxXAq2d+IIzbXqTBzpYhoUONakTBDhmdzSLMZYKOW4ZclzbXDe/SVLWDOkQZa+CHCV@vger.kernel.org, AJvYcCVNZaY+PNfDDaYv1TfMgsg2FMn/hye6IaFj1wYYrs2hJsK/oi3QyHTzwS8vzwjojzhUtTYhEpcqrYrCqLNd@vger.kernel.org
X-Gm-Message-State: AOJu0YxkfOPYT2jhIfePTOMtwbtRvTTRXnIEp1JkdEHcFQ+6hHhFqlEv
	7zUpnZ6kuVH7TPkzHTTucWwO3ldWL2PZ/jJSRZX3iLyS5zirHAa6
X-Gm-Gg: ASbGnctrfLkLhfLjATunZHM04oevg3eaWIAS2J2sc8Syc5q8AMohggYvXGSkX0jOBQk
	Yg+v4su1JTkb15GMb2TRF+vOSfYcITPypwL8TDh4NLL2r88niXMIBBc/wVPmvn1pDnUAo/LaC5H
	8InzjWfqNWXBG6jD5l5PEv7vwkWBiGov3HTMzYLL5jKorp3OhGtJ6NM/rc+4UVbtsbesFQ0wl4C
	zbsC3BEWVMZQ0dtHYI7gsCRe2jTkd64JpikUTBoNMvkRTtfQs6LIK3RDWcJt8pA8tONOQUdogMU
	DJd3C4bThmHANU9Hd7d8dIjFrV305+uHv/FDUMbxvqxqvbR/7fP/qlG4roMrDnaHXDsoSE6e82Y
	FGIMOin5eN7A9lFU=
X-Google-Smtp-Source: AGHT+IHTsxWBtqpKlJz4e4YZ5NKKGKK3nF22VsYgt9iMF0elFGllIaKViVWh8VuNPuxqXdiwwn0rhQ==
X-Received: by 2002:a05:6a00:18a9:b0:736:65c9:9187 with SMTP id d2e1a72fcca58-74028fd9f4amr642109b3a.9.1745873792946;
        Mon, 28 Apr 2025 13:56:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a655sm8733426b3a.101.2025.04.28.13.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:56:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 01/33] drm/gpuvm: Don't require obj lock in destructor path
Date: Mon, 28 Apr 2025 13:54:08 -0700
Message-ID: <20250428205619.227835-2-robdclark@gmail.com>
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
2.49.0


