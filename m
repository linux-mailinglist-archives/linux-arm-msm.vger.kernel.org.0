Return-Path: <linux-arm-msm+bounces-33121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85394990470
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 15:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38A2E1F2221F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 13:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297592101B2;
	Fri,  4 Oct 2024 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k3Qc+wmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB2121018D;
	Fri,  4 Oct 2024 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048718; cv=none; b=tXId/wdcgr0CX5zrYj8zFB+Tcq2B+KqQLyNlgNGzVkyemQFdPGFUo9VEWAlAKUdSFnw2R6WVmY7knQCtT61x4lcaMRFPh/i8dzDN+yVSIgz44k0fNTkcVdg2buqZviCkIqHzEy6KmpVfYiCNIkQdSN7m5AzkXHF5bWQW6f84coU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048718; c=relaxed/simple;
	bh=pKHZFH/Ej/Nl+ncg+maedJ93EJf/kvj5/4vnolIpDs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDcS9Jk/Q0NtS9jPPIJlg+/r/n0CN6Vtl88XXnohYAnXVkcmUQYNriqEkWOvDY5VRr5Gr+65uJWo2J8Nv+ILnImrPPZXABeKm/jv24PfO6xO+mV5KN3UvdglUUqsp0LcLTE0bY1w49A63PiiawsBV3sNkYd8w0XgYzS1dwMaDvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=k3Qc+wmI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728048713;
	bh=pKHZFH/Ej/Nl+ncg+maedJ93EJf/kvj5/4vnolIpDs8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k3Qc+wmIDgc4YYRGogDWRKGwnlQkqUoJ3MWCAwK4nqYbyJagchEGLF4a0ExqB4hqR
	 BQaVDKGGA3ycANjq8Wo2FMTNpAtQHW4YZlIJfYv+eFxH48Y4v1/qi9R5pE0LIAWAjI
	 FYdJ+XDhjbh4QN3W7t3XuHpVctDgH8oBDsE4t1zq8LKF4wSqs63xLcCiqeYd/PtPKq
	 Tu1Hi3EhiCsiEJRA/0pFIL9PfPywMPe4510+3lp+5UbbgIVFdX2YpYLMLluxXs6yTy
	 tRKzT5hHWIEZ9wYdZr1XZojZHMe8S9PCWaxy+obB30NLw8kY9L1xYpDSygQjNqL0RJ
	 s+PGKoEYw11Xg==
Received: from localhost.localdomain (unknown [171.76.80.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F65517E35ED;
	Fri,  4 Oct 2024 15:31:50 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	deborah.brouwer@collabora.com,
	dmitry.baryshkov@linaro.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] drm/ci: refactor software-driver stage jobs
Date: Fri,  4 Oct 2024 19:01:18 +0530
Message-ID: <20241004133126.2436930-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004133126.2436930-1-vignesh.raman@collabora.com>
References: <20241004133126.2436930-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move common job configuration for software-driver
stage jobs to seperate job.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 59 +++++++++++++++----------------------
 1 file changed, 24 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 09d8447840e9..81472451ccd1 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -88,6 +88,26 @@
   tags:
     - $RUNNER_TAG
 
+.software-driver:
+  stage: software-driver
+  extends:
+    - .test-gl
+    - .test-rules
+  timeout: "1h30m"
+  tags:
+    - kvm
+  script:
+    - ln -sf $CI_PROJECT_DIR/install /install
+    - mv install/bzImage /lava-files/bzImage
+    - mkdir -p /lib/modules
+    - mkdir -p $CI_PROJECT_DIR/results
+    - ln -sf $CI_PROJECT_DIR/results /results
+    - install/crosvm-runner.sh install/igt_runner.sh
+  needs:
+    - debian/x86_64_test-gl
+    - testing:x86_64
+    - igt:x86_64
+
 .msm-sc7180:
   extends:
     - .lava-igt:arm64
@@ -414,47 +434,16 @@ panfrost:g12b:
     - .panfrost-gpu
 
 virtio_gpu:none:
-  stage: software-driver
-  timeout: "1h30m"
+  extends:
+    - .software-driver
   variables:
     CROSVM_GALLIUM_DRIVER: llvmpipe
     DRIVER_NAME: virtio_gpu
     GPU_VERSION: none
-  extends:
-    - .test-gl
-    - .test-rules
-  tags:
-    - kvm
-  script:
-    - ln -sf $CI_PROJECT_DIR/install /install
-    - mv install/bzImage /lava-files/bzImage
-    - mkdir -p $CI_PROJECT_DIR/results
-    - ln -sf $CI_PROJECT_DIR/results /results
-    - install/crosvm-runner.sh install/igt_runner.sh
-  needs:
-    - debian/x86_64_test-gl
-    - testing:x86_64
-    - igt:x86_64
 
 vkms:none:
-  stage: software-driver
-  timeout: "1h30m"
+  extends:
+    - .software-driver
   variables:
     DRIVER_NAME: vkms
     GPU_VERSION: none
-  extends:
-    - .test-gl
-    - .test-rules
-  tags:
-    - kvm
-  script:
-    - ln -sf $CI_PROJECT_DIR/install /install
-    - mv install/bzImage /lava-files/bzImage
-    - mkdir -p /lib/modules
-    - mkdir -p $CI_PROJECT_DIR/results
-    - ln -sf $CI_PROJECT_DIR/results /results
-    - ./install/crosvm-runner.sh ./install/igt_runner.sh
-  needs:
-    - debian/x86_64_test-gl
-    - testing:x86_64
-    - igt:x86_64
-- 
2.43.0


