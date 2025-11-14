Return-Path: <linux-arm-msm+bounces-81744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EC1C5B0D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E12674E5B5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0FA247281;
	Fri, 14 Nov 2025 03:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fO2DfZ3a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CEA224891;
	Fri, 14 Nov 2025 03:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763089292; cv=none; b=ZhjXkRg96+GiUoHUT1ur9bizCE9IJGz57zcVmJMd2kp2nemUiyUs78X/s+5pTMu0QOqAU09TyrPkKXRIp0giTskVO5TXH7zRlkDaUQXkhaVi/Za5H5Y5oXy0XTh+0axzLolqENE03F1/c4Esp7UUR7STNfHp6cOU+iGBk1XQed0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763089292; c=relaxed/simple;
	bh=ZCItdMAKSBYnoQbmuGe/KriN1j9Lnyjo9QM9qRu8/Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=geOoa7hAbBerg+sNU2PLD07X+bQ4OjWinV3CSBSmYAhvDrRx8ySd0+SKWAUlde2Apvf8fSz4+ZAgBmlJComD/zspYNRwXZgwc7NctrfHJ/Qqk8vSDwiyFOSe2wQ95xIzdTLIL7dM1cV/lU6o5X8Xs1h8e75rzjSGpZYg/oQd0Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fO2DfZ3a; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763089287;
	bh=ZCItdMAKSBYnoQbmuGe/KriN1j9Lnyjo9QM9qRu8/Tg=;
	h=From:To:Cc:Subject:Date:From;
	b=fO2DfZ3anN63JQRdUKZKbXQvW89bTHJGrjDtoZc0l4DnjlGkv0Wel/oKZnNbkOGEK
	 JsjyJIThA99jtvIioB6Akn9r16cA9NwP3uql0Zzl5YFepprArIuVgyBrPH57/ZzVEZ
	 Xo2KJomytJnq/4crzXj54OJvgRzrFxUIJJifeS5xYi14vZqcQvdYyrYw/roBii9C2Z
	 dOxbRjpXHrj0eEKmp4qxpQdqs8mcpsyOFIrO3JBkArcbxMVJhQrmRzX/iozkr/xfmq
	 GnXqIDj5NmI4i/9geKHZoBulQrJVlTnHVwoOFfbG9iEJzmzmlyPoRPu6WjGq9FoeRK
	 YaAWv52iBCWyA==
Received: from debian (unknown [171.76.81.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4776517E0202;
	Fri, 14 Nov 2025 04:01:21 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	lumag@kernel.org,
	robdclark@gmail.com,
	robin.clark@oss.qualcomm.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] drm/ci: uprev IGT and enable apq8016, apq8096
Date: Fri, 14 Nov 2025 08:30:49 +0530
Message-ID: <20251114030056.1139570-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series includes,
- Adapting to recent changes in Mesa CI, such as:
   - LAVA overlay-based firmware handling
   - Container/job rule separation
   - Removal of the python-artifacts job
   - Use lava-job-submitter for submitting jobs to LAVA
   - Various other CI improvements
- Move bare-metal jobs for apq8016 and apq8096 to LAVA, as these devices
  are migrated to Collabora LAVA farm.

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1546424
MR: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/200

There will be a follow up series to update expectation files for the
other jobs.

Vignesh Raman (2):
  drm/ci: uprev mesa
  drm/ci: Move qualcomm baremetal jobs to lava

 drivers/gpu/drm/ci/arm64.config               |   1 +
 drivers/gpu/drm/ci/build.yml                  |  22 ++--
 drivers/gpu/drm/ci/container.yml              |  28 +++--
 drivers/gpu/drm/ci/gitlab-ci.yml              |  95 ++++++++++++----
 drivers/gpu/drm/ci/igt_runner.sh              |   4 +-
 drivers/gpu/drm/ci/image-tags.yml             |  22 ++--
 drivers/gpu/drm/ci/lava-submit.sh             | 101 ++++++++----------
 drivers/gpu/drm/ci/static-checks.yml          |   1 +
 drivers/gpu/drm/ci/test.yml                   |  80 ++++++--------
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   4 +
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |   2 +
 11 files changed, 213 insertions(+), 147 deletions(-)

-- 
2.51.0


