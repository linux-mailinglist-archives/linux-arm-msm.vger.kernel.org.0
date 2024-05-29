Return-Path: <linux-arm-msm+bounces-20885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4A28D2B0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 04:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5C771C20751
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 02:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91E715B103;
	Wed, 29 May 2024 02:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="41Y/EPEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4399015B0FD;
	Wed, 29 May 2024 02:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716950519; cv=none; b=H51Di708ySCj1HpKlzPEg/aQmzhWTdoK85S6Z2uMjFfWe2/6PNA2wt9H+W8LFWco94Drz8jiFhvCzBhL3ZVEvzREGfHXCxsVDJ2Iyo2wMqpjUG9BPx/1iWiTAWtuT9j7zH5AsrZWcuiZj131b+Bs5hlSDHYQacydpwHII9U3uAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716950519; c=relaxed/simple;
	bh=on0EOWF+GkQb1PJcpMNExjb9HNOdj76aATPkzOg3PAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sYbMbMjx3tM2PTP3KQVo/s5BlleYbiXE76I7I5mmwHb41cZjjJLvNMPwOCtw2zGyjPGklXwtAhKDhdnf7cwtHwlB69DLvdufZVxsUT/AhO4VCCkkN6ADGo4heMwnNwQwsSgryR0ubClRhXOTggI+lXTTu3Dy+82mV0spOBdR4Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=41Y/EPEA; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716950516;
	bh=on0EOWF+GkQb1PJcpMNExjb9HNOdj76aATPkzOg3PAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=41Y/EPEAiCbuxuQnH4Q92zY4teEN8tmt/m7HJ5dHcGdr5VPAKPagjuEeYHoIBgC7X
	 EMIgr2nlop2O1Cqp44+whbpYLZAXdYyuTYP4/R+fkqtRLppGSCFA6LsA/6HVw7+oUR
	 25XOVhMc6NVJBjVHS6ehxO1S6qrUaNvwJJm/RtSoREKw81KiMUDlykgjMQ4Vn8k05A
	 IYIvghzwU5DNsjnbw0yTrAKrVfwbovrYppgx8GBYQfX8LFKxKJh03JYsAt2SwZMOVP
	 iupqyKSv+ibOnL2r2ST/t4XN8u6LHbIGr9S6eiMq1UYVbmwx2UHSFz/4aHR9xgiezt
	 deQSjTukXh+Cg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D7130378215E;
	Wed, 29 May 2024 02:41:52 +0000 (UTC)
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
Subject: [PATCH v3 4/6] drm/ci: uprev IGT
Date: Wed, 29 May 2024 08:10:47 +0530
Message-Id: <20240529024049.356327-5-vignesh.raman@collabora.com>
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

test-list.txt and test-list-full.txt are not generated for
cross-builds and they are required by drm-ci for testing
arm32 targets. This is fixed in igt-gpu-tools. So uprev
IGT to include the commit which fixes this issue. Also
disable building xe driver tests for non-intel platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Split IGT uprev to seperate patch.

v3:
  - No changes.

---
 drivers/gpu/drm/ci/build-igt.sh  | 4 ++++
 drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
index b7d2a49a6db3..eddb5f782a5e 100644
--- a/drivers/gpu/drm/ci/build-igt.sh
+++ b/drivers/gpu/drm/ci/build-igt.sh
@@ -45,6 +45,10 @@ MESON_OPTIONS="-Doverlay=disabled                    \
                -Dlibunwind=enabled                   \
                -Dprefix=/igt"
 
+if [[ "$KERNEL_ARCH" = "arm64" ]] || [[ "$KERNEL_ARCH" = "arm" ]]; then
+    MESON_OPTIONS="$MESON_OPTIONS -Dxe_driver=disabled"
+fi
+
 mkdir -p /igt
 meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
 ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 8f32de63d92e..1b29c3b6406b 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
+  IGT_VERSION: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.15.0
-- 
2.40.1


