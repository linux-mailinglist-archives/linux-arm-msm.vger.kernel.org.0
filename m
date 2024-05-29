Return-Path: <linux-arm-msm+bounces-20883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A038D2AFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA5781C23A0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA7615B11E;
	Wed, 29 May 2024 02:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RxwB3g7j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4073915B109;
	Wed, 29 May 2024 02:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716950510; cv=none; b=XCHxqtQ710NmcrTVsZgcrXPtQxdxnMAGtf68WjGYqM/OMDMWo99T7Op+D/RQJz4z5t3uV1fVnDe+e3wUMevs3dGwmovbPfMqGXUNrxlhaxqxIyEQX6l7f2Al2qGgs2Kx9ESu0ZMUtcU/CjDA2hSHPg37quZIYYTDXbI8LG2rwWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716950510; c=relaxed/simple;
	bh=drcScXGLE4jwIM52dvLFwFXHUKgIPNbmDTogc7vKjCA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HIukDicVaBy0VOL/JEOa5BXqRlu81GoETpB2kIvLjw6W6GA+U9wkUupuGVEe5rDzJQVigQWcssESekKDd/F8p5EDOFM9DhFJOKVagkDeTSTF7XRYbQLdE285aiWDhxaEGqUErRAkPdx7+RA6Rk/rzayG6x4LzOncV4FWkpLUruo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RxwB3g7j; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716950507;
	bh=drcScXGLE4jwIM52dvLFwFXHUKgIPNbmDTogc7vKjCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RxwB3g7j+qpq95PlwokEpAR5Gg7K0AE8kIQNE6i+siYW9c2rkIuXKBk8xHtQIj48n
	 VEZpLAdFVqKFTH4FGLsE4HQNdASujkA7axAdNoSMECG4sDtzvMxhNCMadqMPjy+hhR
	 M9m6jID7BjnyrxPMOrWNp+Wr0q7vstBNV27dWhWp08qFM6hZBvqbY9lCh0kxz/IG/e
	 djTMM9yOUbGOo1CbH2mQUGdcrdqKMR+Fsxih2A23n5wa9CuEvR53jA2zAzRhD/BjBh
	 by6rLc1/Q9drl5VnxUboeu8vDxCgkDQ1pip5SgTsPWL6hCQKivRb69cJtfpNFKxm17
	 DmEZqliQ5CLCA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3ECBD3782160;
	Wed, 29 May 2024 02:41:43 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robdclark@gmail.com,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	dmitry.baryshkov@linaro.org,
	mcanal@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] drm/ci: add farm variable
Date: Wed, 29 May 2024 08:10:45 +0530
Message-Id: <20240529024049.356327-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240529024049.356327-1-vignesh.raman@collabora.com>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mesa uses structured logs for logging and debug purpose,
https://mesa.pages.freedesktop.org/-/mesa/-/jobs/59165650/artifacts/results/job_detail.json

Since drm-ci uses the mesa scripts, add the farm variable
and update the device type for missing jobs.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v3:
  - New commit to add farm variable and update device type variable.

---
 drivers/gpu/drm/ci/test.yml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 8bc63912fddb..2615f67f6aa3 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -24,6 +24,7 @@
   variables:
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
     DEBIAN_ARCH: "armhf"
+    FARM: collabora
   dependencies:
     - testing:arm32
   needs:
@@ -39,6 +40,7 @@
   variables:
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
     DEBIAN_ARCH: "arm64"
+    FARM: collabora
   dependencies:
     - testing:arm64
   needs:
@@ -54,6 +56,7 @@
   variables:
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
     DEBIAN_ARCH: "amd64"
+    FARM: collabora
   dependencies:
     - testing:x86_64
   needs:
@@ -74,6 +77,7 @@
     S3_ARTIFACT_NAME: "arm64/kernel-files"
     BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/Image.gz
     BM_CMDLINE: "ip=dhcp console=ttyMSM0,115200n8 $BM_KERNEL_EXTRA_ARGS root=/dev/nfs rw nfsrootdebug nfsroot=,tcp,nfsvers=4.2 init=/init $BM_KERNELARGS"
+    FARM: google
   needs:
     - debian/arm64_test
     - job: testing:arm64
@@ -116,8 +120,9 @@ msm:apq8016:
     - .baremetal-igt-arm64
   stage: msm
   variables:
+    DEVICE_TYPE: apq8016-sbc-usb-host
     DRIVER_NAME: msm
-    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8016-sbc-usb-host.dtb
+    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/${DEVICE_TYPE}.dtb
     GPU_VERSION: apq8016
     # disabling unused clocks congests with the MDSS runtime PM trying to
     # disable those clocks and causes boot to fail.
@@ -132,9 +137,10 @@ msm:apq8096:
     - .baremetal-igt-arm64
   stage: msm
   variables:
+    DEVICE_TYPE: apq8096-db820c
     DRIVER_NAME: msm
     BM_KERNEL_EXTRA_ARGS: maxcpus=2
-    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/apq8096-db820c.dtb
+    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/${DEVICE_TYPE}.dtb
     GPU_VERSION: apq8096
     RUNNER_TAG: google-freedreno-db820c
   script:
@@ -146,6 +152,7 @@ msm:sdm845:
   stage: msm
   parallel: 6
   variables:
+    DEVICE_TYPE: sdm845-cheza-r3
     DRIVER_NAME: msm
     BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
     GPU_VERSION: sdm845
-- 
2.40.1


