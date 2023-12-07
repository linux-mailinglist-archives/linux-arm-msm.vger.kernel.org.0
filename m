Return-Path: <linux-arm-msm+bounces-3632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DDB80841D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 10:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E37721C21C6A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 09:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A6832C7C;
	Thu,  7 Dec 2023 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NAdK9Prt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 166E71AD;
	Thu,  7 Dec 2023 01:18:45 -0800 (PST)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 39B07660738E;
	Thu,  7 Dec 2023 09:18:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701940724;
	bh=FCRCNovtJ9PtQwtKLRu/evUUkfAvUVXGZUmkbsxA9Cg=;
	h=From:To:Cc:Subject:Date:From;
	b=NAdK9PrteQ631PcNJB48XuZXbHRETXzxv1TmcD/HUvePpB9GjvOuwtbwZ5EHFw3QV
	 GD2L6X5Z+vUx/7jXjlib5a3066CcUYUZBGW4xzSWtx+/1r7cPuiqMC4e4vjPpPdISj
	 njh/krIKbgqLpIFUIIQK5ZXZwfv7e4yFZKTHVJHx8nAN6LjfkPXTbw93ce8hANr3EB
	 d8axi5ubMVeWKmTTssMVPbNsT8qQatOlBRVa4S3oqfCfbO2E2yHTw8mPYm0LQ6L5pM
	 aa3SdK3e4dtq4nBIplVe/GtwCG2a47uLq3Hguc4bvpDBWcS036VtHKzLJHOnfiRpH7
	 bH4GpvZozQ8yQ==
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
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v7 00/10] drm: ci: fixes
Date: Thu,  7 Dec 2023 14:48:21 +0530
Message-Id: <20231207091831.660054-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series contains improvements, enabling new ci jobs which
enables testing for Mediatek MT8173, Qualcomm APQ 8016 and VirtIO GPU,
fixing issues with the ci jobs and updating the expectation files.

v2:
  - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
  - Reworded the commit message for enabling jobs
  - Added a new patch in the series to use scripts/config to enable/disable configs

v3:
  - New patch in the series to add device tree overlay in arch/arm64/boot/dts/qcom
  - drm-ci scripts to use device tree overlay from arch/arm64/boot/dts/qcom and compile base device tree with overlay support
  - New patch in the series to enable CONFIG_REGULATOR_DA9211 in defconfig
  - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig

v4:
  - Drop 'enable CONFIG_REGULATOR_DA9211 in defconfig' patch as it is sent upstream as a seperate patch
  - Use apq8016-sbc-usb-host.dtb which allows the USB controllers to work in host mode.
    This patch depends on https://lore.kernel.org/lkml/20230911161518.650726-1-vignesh.raman@collabora.com/

v5:
  - Added a new patch in the series to set IGT_FORCE_DRIVER to 'mediatek' for mt8173
  - Added a new patch in the series to make artifacts available for virtio jobs
  - Added a new patch in the series to add pipeline url to fails and flakes files
  - Generate fails and flakes file with the updated xfails script - https://www.spinics.net/lists/kernel/msg4959630.html
  - Drop 'virtio: Update ci variables' patch as the tests which causes the malloc issue are skipped

v6:
  - Updated commit message for enable DA9211 regulator fix 
  - Use GPU_VERSION instead of CI_JOB_NAME to check if it is mt8173 while setting IGT_FORCE_DRIVER
  - Added a new patch in the series to uprev IGT to fix memory corruption
  - Added a new patch in the series to update drm ci documentation
  - Generate fails file with drm-misc-next

v7:
  - Fix checkpatch style problems in commit message
  - Rework mt8173 IGT_FORCE_DRIVER fix and reword the commit message

Vignesh Raman (10):
  drm: ci: igt_runner: Remove todo
  drm: ci: Force db410c to host mode
  drm: ci: arm64.config: Enable DA9211 regulator
  drm: ci: Enable new jobs
  drm: ci: Use scripts/config to enable/disable configs
  drm: ci: mt8173: Do not set IGT_FORCE_DRIVER to panfrost
  drm: ci: virtio: Make artifacts available
  drm: ci: uprev IGT
  drm/doc: ci: Add IGT version details for flaky tests
  drm: ci: Update xfails

 Documentation/gpu/automated_testing.rst       |  7 +--
 drivers/gpu/drm/ci/arm64.config               |  1 +
 drivers/gpu/drm/ci/build.sh                   | 16 +++----
 drivers/gpu/drm/ci/gitlab-ci.yml              |  2 +-
 drivers/gpu/drm/ci/igt_runner.sh              | 10 +++-
 drivers/gpu/drm/ci/test.yml                   | 13 ++----
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 13 ++++--
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  5 ++
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   | 46 +++++++++++++++++++
 9 files changed, 86 insertions(+), 27 deletions(-)

-- 
2.40.1


