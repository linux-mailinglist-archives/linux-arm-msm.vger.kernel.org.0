Return-Path: <linux-arm-msm+bounces-2452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDAA7FD691
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 13:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E128B218F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 12:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558571DA2A;
	Wed, 29 Nov 2023 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ri4WVuOt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD82A2101;
	Wed, 29 Nov 2023 04:19:27 -0800 (PST)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D7655660732A;
	Wed, 29 Nov 2023 12:19:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701260366;
	bh=drt9Nf1tdYoCGDZuOe/qO8JK0dZNg1Oz/Fl7Gto/UZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ri4WVuOtDg/bxRqtZJK8ogTvFXmvqnAP/JkoBlpF7lpuxfbIcwi9JLLzT7/HsFcPi
	 vSiObrgMAuKWp18v1JfnlkIRp1SFiIeH0RfeR3Oqn6A7XPLfMYcgCancb59Sl48mO7
	 3iUWHc2aTCo6SkG7TLpoZA+HeK3Sdeycrbahud1QkfmNVJCOf+hStJjI3JCOW5O5vB
	 L/AmHhz7RjKzXRXHLwd1TExZG7Wsv28bU6a6AJgLxWjgLfz00z1evdPtI+zcUl/RER
	 SmbMTcWhhWSo1Ju8VFc7PDloT3RjUltMAr7NuO9ws4UzWbahB/37Udy7UVh+A0EEAn
	 2ycI9vcIHP+3g==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: david.heidelberg@collabora.com,
	sergi.blanch.torne@collabora.com,
	guilherme.gallo@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robdclark@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 08/10] drm: ci: uprev IGT
Date: Wed, 29 Nov 2023 17:48:39 +0530
Message-Id: <20231129121841.253223-9-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129121841.253223-1-vignesh.raman@collabora.com>
References: <20231129121841.253223-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

virtio-gpu kernel driver reports 16 for count_crtcs
which exceeds IGT_MAX_PIPES set to 8 in igt-gpu-tools.
This results in below memory corruption,

 malloc(): corrupted top size
 Received signal SIGABRT.
 Stack trace:
  #0 [fatal_sig_handler+0x17b]
  #1 [__sigaction+0x40]
  #2 [pthread_key_delete+0x14c]
  #3 [gsignal+0x12]
  #4 [abort+0xd3]
  #5 [__fsetlocking+0x290]
  #6 [timer_settime+0x37a]
  #7 [__default_morecore+0x1f1b]
  #8 [__libc_calloc+0x161]
  #9 [drmModeGetPlaneResources+0x44]
  #10 [igt_display_require+0x194]
  #11 [__igt_unique____real_main1356+0x93c]
  #12 [main+0x3f]
  #13 [__libc_init_first+0x8a]
  #14 [__libc_start_main+0x85]
  #15 [_start+0x21]
 
This is fixed in igt-gpu-tools by increasing IGT_MAX_PIPES to 16.  
https://patchwork.freedesktop.org/series/126327/
 
Uprev IGT to include the patches which fixes this issue.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v6:
  - Added a new patch in the series to uprev IGT to fix memory corruption

---
 drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index aeb9bab1b069..dac92cc2777c 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: d1db7333d9c5fbbb05e50b0804123950d9dc1c46
+  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.15.0
-- 
2.40.1


