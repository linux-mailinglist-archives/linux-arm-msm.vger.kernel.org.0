Return-Path: <linux-arm-msm+bounces-65643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3236EB0A13A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BC5AA8779A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 10:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6865B2BE023;
	Fri, 18 Jul 2025 10:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ezy2Ir4m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32FE2BE035;
	Fri, 18 Jul 2025 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752836074; cv=none; b=RpxkJ3uLsU65ehzOo6MiD/DmC0BQR+qdCtO62/CryCYyG6n80WUnFoyitbsNMSHv9LkoPIUNhe5O5tIzBPCMAlZMGygZfZMgmUUFoV4889uHG+Sy784+Tmwg7XJ+8P0l3F1RTKDckoWuM0Y0vRNEZ0Zw/9JT/fRV9Cf6q4SeRog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752836074; c=relaxed/simple;
	bh=Z6GfERAElKNobybjRoMM6xIF2MgHhdSXvneEAumOYFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGvzycaaxPATP7y2InUU+G4OoPDgHJUWQc/cA1bHvw2cWzfHMa9Gy6X1uMvd3gLNyPfB3QIUwIqnwp8qQb66kU5CP/4gudWQ0TLLjOpbJz5T2SxmEAkaaQvrFiHpR2X09ojlPzh74SFDMz7T7CNBE34+ZTT+4o6IwxdMMQiLD9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ezy2Ir4m; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752836071;
	bh=Z6GfERAElKNobybjRoMM6xIF2MgHhdSXvneEAumOYFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ezy2Ir4mhmWynVnrh/T5iW0rCP7xd/cTS6jjVoIJaYiIdGKy5IO/PbvFoEpkvK5k2
	 PBRe2Rhn0gt/B5VTxKJVc4PZdqgkX4vd189vi/g0GEZn+2bG/CDeL39i1F2XwOzWfz
	 hXp/V4lMaKTnkcjw1QuRerxRFmWYFChiRUmV0aWKStpSk1kk46DDVYhjLpW7MYyBhd
	 76vlSN8m9yvVqD+sc4NvhDwwrk0pXEnb1Z2/sKQZbJ8CyG+RDGwHXJTDMpAd8teQpT
	 EYxI9qri9HtMj+W2vkkpbn5fNCfFo9VbmxdDYEVPnnh5fK1pCEtJlIMkyaO3YNrB+F
	 FGoaHonDYgCMQ==
Received: from debian.. (unknown [171.76.80.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 989CE17E156D;
	Fri, 18 Jul 2025 12:54:27 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/7] drm/ci: i915: cml: update runner tag
Date: Fri, 18 Jul 2025 16:23:55 +0530
Message-ID: <20250718105407.32878-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250718105407.32878-1-vignesh.raman@collabora.com>
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asus-C436FA-Flip-hatch has fewer devices available in the LAVA lab and
drm-ci uses only 2 DUTs, causing tests to time out. Update drm-ci to
use puff instead of hatch so the tests can run on 5 DUTs.

Also increase parallel count for amly jobs to 3.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index d1ef2d91e7d8..a6539908a665 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -279,7 +279,7 @@ i915:glk:
 i915:amly:
   extends:
     - .i915
-  parallel: 2
+  parallel: 3
   variables:
     DEVICE_TYPE: asus-C433TA-AJ0005-rammus
     GPU_VERSION: amly
@@ -306,11 +306,11 @@ i915:whl:
 i915:cml:
   extends:
     - .i915
-  parallel: 2
+  parallel: 5
   variables:
-    DEVICE_TYPE: asus-C436FA-Flip-hatch
+    DEVICE_TYPE: acer-chromebox-cxi4-puff
     GPU_VERSION: cml
-    RUNNER_TAG: mesa-ci-x86-64-lava-asus-C436FA-Flip-hatch
+    RUNNER_TAG: mesa-ci-x86-64-lava-acer-chromebox-cxi4-puff
 
 i915:tgl:
   extends:
-- 
2.47.2


