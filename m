Return-Path: <linux-arm-msm+bounces-58512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3413BABC63D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 19:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0EDD7A8BE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 17:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77514288C95;
	Mon, 19 May 2025 17:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAFoTIL/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FD61E32C3;
	Mon, 19 May 2025 17:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677259; cv=none; b=RTnZ5F3zw6hf400HGhCDd8fJCA+O+vEDVTxOMQSsiHPbgcJwI+uRJ49Z5eoR0wVtZEhq4sBHx1GVgl9cefaTm72gC1dM4D5MkNV3oINsw9/PCdoP5YKUqtUOF9GOu4bYS8H7a448NcH9Y+TZXVoVKxRMnPXn1dCqgZrL0FdvyLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677259; c=relaxed/simple;
	bh=NiJgFDXLG5/9s0HxeZ4PHgjeCa/kx8dZzw0U3HxZuno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lpDm2fh/+hNEUA+OWvVeJwOBRMnuT58M1YDBhxWz2Hrg36DU6t1CXxF+P2146pQkaNr3KAX2rDQe1tKyrBQdaY5eZdi0jq7tFXUg/7FZZQ35+b+g272PUOqiO9H0FtdXtqvevMWmc2+vJaOASWN29QIOxz0f/RtvRCoDNJzbzcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAFoTIL/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23278ce78efso708915ad.2;
        Mon, 19 May 2025 10:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677257; x=1748282057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQloOIJetvzox92MWHE37UU9O29zUE3Qi3B+AAxswms=;
        b=XAFoTIL/Hd1bUxihHfjfVZLxca0EdJfoM8M38fe0/fT6vQeHryiCmPnRAjoIuMFqVg
         ILrNWfZDlAfcJKt4SUrd+VpvC6NQp/DZUHgOZQYE/1nzXz1A0KeAJg+NF4+52Sde7Ohh
         v+J6aERjdjprNE+35X7uUNaJHoYiZaLf0E3EdVPJAwuLtLW83Ewt1acR/HHILY+WtH+i
         5EbT4fuqHBSQQ7LfATIgCuC6NfbGSXmmm3DRHdWLbgSsWO/zhsZgl2UmAUvBYRhfQmtE
         kqVb7OdYFSDQftzTyhJtoewnPyeVprYVJ5LwnzjomR0VUGwID9Mp/nxQS0CVLnPbGtTr
         bx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677257; x=1748282057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQloOIJetvzox92MWHE37UU9O29zUE3Qi3B+AAxswms=;
        b=cGCiOI8GqckrI7ZnvQ8cb7xhYVp4M5+1cb56ExTwfrrUbFqLR9hHgvod5wmM0yAQTd
         4Yh7Adb9zIBvcbll+1He73e77l2E58AQdMqO6520GBd5FW4KERhlEMdt7x3kiNu15Tsk
         gnNVwlt620jPcsyjHIrIQHxNo6HT2g40cPM3FiqtqvgAIgQTr2r9csazfwmC9oAueq+d
         9JJEP0yNlmUlCDqdRthT3ruDYzO6LewmS/JuTM3pVZ6vMUJPeyNIf8A64hFnvbXZ2I2a
         1QIdBOpUx00D5RvusmKPSSHQYtWcc9piY7Af+nxQiDGNfkBB4UNgU+dQIf+Nu8hM2fD8
         IZ5g==
X-Forwarded-Encrypted: i=1; AJvYcCUEzJt31vBdD3VP3GOxMAWcMMdrQpaiqCR86rdNMqkCBMgo2TaNIUyJbIwWyJ8BBxUkkKxFMccMLIz1ukvP@vger.kernel.org, AJvYcCUGy+45rMem/gfVEjsXGs9HTFy6p3nbKC77LwQzbgq5ueSsifhTEIapMjaiqfO4AgKUI5jKwl+NKWHKT7Hu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7EcnJZsp9fsAVPFKRFluY4eBEhGdWRX4OjOMRUmohYLVIMYxo
	NIQPps5jGrI/tcAHZwiD2W5bLuhT+spbayhMnt4JT2CAQLimqtOzXTKQNy0HDA==
X-Gm-Gg: ASbGncvEShFydPFiB2vdnN+4BcDYWzksi08tqeeOD8JrGHROjiHqmKocXjFeK12CCAW
	vrnMFzeIHLMq3SQjNLvsHKDiIfh2/szs2rjWCSepEB2uhB2vgA5flMJgtzOPTyhKraY9hkJtD45
	r8/ExspgLyBZGl2JtKwPr3BVQ/MBR4DFQNcBiCKWecIfizKIMHzvBwHCblEr5jr4VGRu0dS5gmQ
	IAuHLtHAO+A5WY3m7w3pQHblEvqwwb0zBlJ0TRyV2W7zHIpAJJidXrnYcEJcE8TwnW/aSNj3wxl
	A/E5EeY82/OhSM4gt3eFyNkER+JKuhF858rWRHK8063ZA6hPTbEBoIg62GrOQtO4lgB7fOLKXPL
	Z8J7e8Eawf7EkhwP7cciyeXxmnw==
X-Google-Smtp-Source: AGHT+IGSuMLkx96sFMh7b0MMRKst8qe0vdboixG/NWsaJn7w9DWV2XIZ2dB4fo5OCm/Of6Nu2djl0w==
X-Received: by 2002:a17:902:e78b:b0:223:fbc7:25f4 with SMTP id d9443c01a7336-231d44e641fmr203394735ad.14.1747677257237;
        Mon, 19 May 2025 10:54:17 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9fc8sm62898755ad.27.2025.05.19.10.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:54:16 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 01/40] drm/gpuvm: Don't require obj lock in destructor path
Date: Mon, 19 May 2025 10:51:24 -0700
Message-ID: <20250519175348.11924-2-robdclark@gmail.com>
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

See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
msm_gem_free_object()") for justification.

Cc: Danilo Krummrich <dakr@kernel.org>
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


