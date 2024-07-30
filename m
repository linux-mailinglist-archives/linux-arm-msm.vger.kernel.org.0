Return-Path: <linux-arm-msm+bounces-27349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CEE94046B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 04:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2466B1C20F98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 02:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022FA2A1D5;
	Tue, 30 Jul 2024 02:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="d7+7tAMz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBBECA6B;
	Tue, 30 Jul 2024 02:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722305801; cv=none; b=fs0/zTsSy8dZpndTRPfgJTxiZWtBmyZLWPWbL3IJu/+fn2pUj0MSaOFDV4A0rPxsgbrn6qA0iB+XXqn0Ut1tbMAWjPfxXHx5DWarwFxGA/1oHE66KOOcp2pNIWkVZJ5S/N849JIhMYWWW7uwW8Jf9GieB74UkVp5omgkQaBgLak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722305801; c=relaxed/simple;
	bh=9oRikuIjBeqowAAlsBB19ZugmBxBNVEEhZNvOJNY0EM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YAp7sKItk8LAhLT0ivbjt1s79BV7wekgIgqTrGZKdaXlqacgnSGyg9Zr21d4mcedLXmu0AR5tJoSbIjK/F+iqOfV1hlD+UOojdGamEcML22qNa7PH8JLxY/rrnTYPQKIU8s6jtqqUBnGfKUHYE7nT3m9y1Hb0tvv7bVcK3+Zdcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=d7+7tAMz; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722305797;
	bh=9oRikuIjBeqowAAlsBB19ZugmBxBNVEEhZNvOJNY0EM=;
	h=From:To:Cc:Subject:Date:From;
	b=d7+7tAMzg034Q6hb+PheTRmGGdCSeSco+Y1qjunn9X4foOCRvBCjvMbviWdmRiezw
	 GwO1fSlOIHN8KFMIyx+0MpWkL1/VnrV/LHsOKPmvrNtJEug2L5c2000yTWWXHdVZgp
	 nwtHY5W7nhyInReyTCExYmisJfIDMXFKqXzj8sr1RJai258jBHUo8xl7dy6pzNxjue
	 9++jWqQBiACeZwgxBrXtkdFGMrdqTAfubOJdGIpAYRemCOqj9qOhRVDzp0pigneKd5
	 L7nBKx6Fmv9Ufrmb4Dv32oTT3Uluz/6bDP/eCC/eGI3ZTpLkv4yI1N0MU7c1+/iun7
	 LoLkBx3RjdLbQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B741F3780521;
	Tue, 30 Jul 2024 02:16:32 +0000 (UTC)
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
Subject: [PATCH v9 0/6] drm/ci: Add support for GPU and display testing
Date: Tue, 30 Jul 2024 07:45:35 +0530
Message-ID: <20240730021545.912271-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some ARM SOCs have a separate display controller and GPU, each with
different drivers. For mediatek mt8173, the GPU driver is powervr,
and the display driver is mediatek. In the case of mediatek mt8183,
the GPU driver is panfrost, and the display driver is mediatek.
With rockchip rk3288/rk3399, the GPU driver is panfrost, while the
display driver is rockchip. For amlogic meson G12B (A311D) SOC, the
GPU driver is panfrost, and the display driver is meson.

IGT tests run various tests with different xfails and can test both
GPU devices and KMS/display devices. Currently, in drm-ci for MediaTek,
Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
This leads to incomplete coverage since the display is never tested on
these platforms. This commit series adds support in drm-ci to run tests
for both GPU and display drivers for MediaTek mt8173/mt8183, Rockchip
rk3288/rk3399, and Amlogic Meson G12B (A311D) platforms.

Update the expectations file, and skip driver-specific tests and
tools_test on non-intel platforms.

Working pipeline link,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1235518

Vignesh Raman (6):
  drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
  drm/ci: skip tools_test on non-intel platforms
  drm/ci: mediatek: add tests for mediatek display driver
  drm/ci: mediatek: add tests for powervr gpu driver
  drm/ci: meson: add tests for meson display driver
  drm/ci: rockchip: add tests for rockchip display driver

 MAINTAINERS                                   |   2 +
 drivers/gpu/drm/ci/arm64.config               |   1 +
 drivers/gpu/drm/ci/gitlab-ci.yml              |   3 +-
 drivers/gpu/drm/ci/igt_runner.sh              |  10 --
 drivers/gpu/drm/ci/test.yml                   | 123 ++++++++++++++----
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   1 -
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   1 +
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   1 -
 .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   1 +
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  28 +++-
 .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  20 +++
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   5 +-
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |  19 ++-
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   5 +-
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   1 -
 .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   1 +
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |   1 -
 .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   1 +
 .../msm-sc7180-trogdor-kingoftown-fails.txt   |   1 -
 .../msm-sc7180-trogdor-kingoftown-skips.txt   |   1 +
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   1 -
 ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   1 +
 .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   1 -
 .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   1 +
 .../gpu/drm/ci/xfails/panfrost-g12b-fails.txt |   1 +
 .../gpu/drm/ci/xfails/panfrost-g12b-skips.txt |  23 ++++
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-mt8183-skips.txt   |  23 ++++
 .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3288-skips.txt   |  26 ++++
 .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3399-flakes.txt  |   6 +
 .../drm/ci/xfails/panfrost-rk3399-skips.txt   |  26 ++++
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  22 +++-
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |   6 +
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |  55 +-------
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  90 ++++++++++++-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  50 ++++++-
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   8 +-
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   1 -
 .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   1 +
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   1 -
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |   1 +
 43 files changed, 433 insertions(+), 140 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt

-- 
2.43.0


