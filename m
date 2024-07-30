Return-Path: <linux-arm-msm+bounces-27353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B5940476
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 04:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 767721F223C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 02:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8807161319;
	Tue, 30 Jul 2024 02:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EVTV9/ho"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3808215697B;
	Tue, 30 Jul 2024 02:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722305819; cv=none; b=TFhRAfCmqIWK/aKTeiULGVxE7wfJ1P1pSXGH2ch9Fss5nCi79uudJ8AENPlahUMlxu5jv0WUrjy1NbdyMrDRhlv8KQFazI+Z6M2UDcDdC0MeNgKGEQkJ+/qvdvFUdTqH1yccq8jXzs4ADuGPBQmh51ePxxwIafWuxzDXH5YSwi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722305819; c=relaxed/simple;
	bh=0h/neyURmZQw5tjqqj5mAiUIZKn/WwA8LCby8onbp8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsJiXxlrkmtumZR+iRWBAON/R/WNP1zb4lv/xl9uKy8OUv0M1/KHQk27R5a5BBCH5ywY9Kv68RvBoixjEECLjWiLNQaMnKt1n1qVN/EkGkLtv3MB7+LDpBoaI3OCf1OyScsZYDPRiV3+zGzNvzNlNU0VTa/9Aig2p4KHfpXM/bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EVTV9/ho; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722305816;
	bh=0h/neyURmZQw5tjqqj5mAiUIZKn/WwA8LCby8onbp8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EVTV9/hoar88oVa35pDAK740JstXpudV/uAcZqdTF9R2NiZrlNOxcxrHXgfAkhPLM
	 EgVqcsRIRjQnerg1GGjhyarlzaI384+6u56rI1+Dj3AwuflvhIOrcAMe7lGhrE7sLZ
	 yZ3hkiBeKMcvJblZL/I3hgc5CNO9rOmsEM6EzNjRl3cdSH9dH/gvg7in5Z2ZpMl5xP
	 VYP9X06Wn4dM6nRq61zY0w/EzXgVW/L1nehfImFb5lP+Xtl/eOk5o/N5jPJdyvfoyF
	 6X3/BAR9+6HvfG0+auDRWGxXjxQopV7hvlxpO6X+9PRzfA5ecr454+ESjUQ5yl0Nwq
	 9JVA+aHs/4k6A==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3149A3782109;
	Tue, 30 Jul 2024 02:16:52 +0000 (UTC)
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
	mcanal@igalia.com,
	melissa.srw@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/6] drm/ci: mediatek: add tests for powervr gpu driver
Date: Tue, 30 Jul 2024 07:45:39 +0530
Message-ID: <20240730021545.912271-5-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730021545.912271-1-vignesh.raman@collabora.com>
References: <20240730021545.912271-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For mediatek mt8173, the display driver is mediatek, while the
gpu driver is powervr. Currently, in drm-ci for mt8173, only the
display driver is tested. Add support in drm-ci to test powervr
driver for mt8173. Powervr driver was merged in linux kernel,
but there's no mediatek support yet. So disable the powervr:mt8173
job which uses powervr driver.

Also update the MAINTAINERS file to include xfails for powervr driver.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v6:
  - New patch in the series. Split powervr changes into a new commit.

v7:
  - No changes.

v8:
  - No changes.

v9:
  - No changes.

---
 MAINTAINERS                      |  1 +
 drivers/gpu/drm/ci/gitlab-ci.yml |  1 +
 drivers/gpu/drm/ci/test.yml      | 14 ++++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f3783f2269ff..05f72eaf5267 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10778,6 +10778,7 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
 F:	Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
 F:	Documentation/gpu/imagination/
+F:	drivers/gpu/drm/ci/xfails/powervr*
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
 
diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 9d800f629f08..ca7f873bc2d4 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -122,6 +122,7 @@ stages:
   - meson
   - msm
   - panfrost
+  - powervr
   - rockchip
   - software-driver
 
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 219eca5ef24c..86875fb96eb5 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -294,6 +294,11 @@ amdgpu:stoney:
   variables:
     DRIVER_NAME: mediatek
 
+.powervr-gpu:
+  stage: powervr
+  variables:
+    DRIVER_NAME: powervr
+
 .panfrost-gpu:
   stage: panfrost
   variables:
@@ -322,6 +327,15 @@ mediatek:mt8173:
     - .mt8173
     - .mediatek-display
 
+powervr:mt8173:
+  extends:
+    - .mt8173
+    - .powervr-gpu
+  rules:
+    # TODO: powervr driver was merged in linux kernel, but there's no mediatek support yet
+    # Remove the rule once mediatek support is added for powervr
+    - when: never
+
 mediatek:mt8183:
   extends:
     - .mt8183
-- 
2.43.0


