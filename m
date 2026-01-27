Return-Path: <linux-arm-msm+bounces-90709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iO6tJlCYeGkWrQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:49:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FB393268
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 526CF307DEEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE77C343D86;
	Tue, 27 Jan 2026 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZmuuAy4X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409ED3446B1;
	Tue, 27 Jan 2026 10:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510666; cv=none; b=iGu4HQTMmIO8L/KluqFi/Gj4BX0lxy34h3hX0dj3a7WE86B4RRZfEfc5PUwXiKTgliUNfEkuqnEQcn2S657nJIIfOOfbWaQp8OzR5a7jrku9mG8uZf7Bvv8k0IPhTRZ3KCYNDCuG7FFQXpYZMPrGT2/kyckeuAiS/ohMu27vMdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510666; c=relaxed/simple;
	bh=vrKMHfK+jZccgVy53jFWZbkRm0Iff0NWCOMHyQbgupU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hCcX7x8BuO90+re4Ze6uGZdSB7X9nxNG+7qan4DN/xFP73q6R1IFFr+kWVOk51TWDj7aIoS+2dLBpAUqWlnusw/8qgVtj4SbBxR0oICKbgXlEZTyI9Wtf3OIESeRS2mNrW3tXr5Dbji2vTMDHVwBjwSXggiM9VHVrcyOtWhrvtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZmuuAy4X; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769510657;
	bh=vrKMHfK+jZccgVy53jFWZbkRm0Iff0NWCOMHyQbgupU=;
	h=From:To:Cc:Subject:Date:From;
	b=ZmuuAy4XR4xaY64h4v0IoNHx3qlVSJHc6IQ2HmPWCtZ5uokj9ZEtgbZeXr3HSTIGU
	 wvumhyLr5qTbPe2EQptpgA6/07ZQNScRK56xJT1QYkgOZ2BX5pNb03zFPKkVKQP8yU
	 j5Owl5XlBW2W3a8UmIWoko3YsRQQ9+1hGK6NJhRX+9ulZ4pCcNo0mkYCSZV2JxqjZP
	 BiB7EmQ3LfMune35mElYW349RfnXJ36qDciWzPzS5zQ2ZJi3VVbchoxUXya6tgtZqX
	 X9QeJJ/9Sx+2fdsMlJjAvkODK7FBFhcy3Eqe4MwYvOwaNXC2PEKwTiRIQu1DNbzTIc
	 12EjiAcHvjEFA==
Received: from vignesh-thinkpad.. (unknown [171.76.81.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 99DE217E00AC;
	Tue, 27 Jan 2026 11:44:13 +0100 (CET)
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
Subject: [PATCH v1 0/7] drm/ci: add new jobs, uprev IGT and mesa
Date: Tue, 27 Jan 2026 16:13:55 +0530
Message-ID: <20260127104406.200505-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,ffwll.ch,oss.qualcomm.com,kernel.org,lists.infradead.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90709-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.raman@collabora.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: E9FB393268
X-Rspamd-Action: no action

This series introduces new job to drm-ci for testing the following
devices:
- rk3588-rock-5b

Other updates include:
- Uprev IGT and updating test expectations accordingly.
- Adapting to recent changes in Mesa CI, such as:
   - LAVA overlay-based firmware handling
   - Container/job rule separation
   - Removal of the python-artifacts job
   - Use of the Alpine container for LAVA jobs
   - Various other CI improvements
- Move bare-metal jobs for apq8016 and apq8096 to LAVA, as these devices
  are migrated to Collabora LAVA farm.
- Updating the runner tag for i915: cml (switching from hatch to puff)
  to improve device availability.
- Adjusting parallelism in jobs (sm8350-hdk, amly) to better utilize
  test resources.
- Fix issues with rebase with external fixes branch.

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1591806
MR: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/213

mediatek:mt8183 fails and it is reported upstream - https://lore.kernel.org/linux-mediatek/CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com/#r
Few intel jobs fails, this will be investigated and a seperate patch to update xfails will be sent.

Link to v1: https://lore.kernel.org/dri-devel/20251114030056.1139570-1-vignesh.raman@collabora.com/

Vignesh Raman (7):
  drm/ci: uprev mesa
  drm/ci: move qualcomm baremetal jobs to lava
  drm/ci: reduce sm8350-hdk parallel jobs from 4 to 2
  drm/ci: i915: cml: update runner tag
  drm/ci: add rk3588-rock-5b
  drm/ci: uprev IGT
  drm/ci: disable rebase when pulling *-external-fixes

 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/ci/arm64.config               |   6 +
 drivers/gpu/drm/ci/build.sh                   |  13 +-
 drivers/gpu/drm/ci/build.yml                  |  22 +--
 drivers/gpu/drm/ci/container.yml              |  28 +++-
 drivers/gpu/drm/ci/gitlab-ci.yml              |  98 ++++++++++---
 drivers/gpu/drm/ci/igt_runner.sh              |   6 +-
 drivers/gpu/drm/ci/image-tags.yml             |  22 +--
 drivers/gpu/drm/ci/lava-submit.sh             | 101 +++++++-------
 drivers/gpu/drm/ci/static-checks.yml          |   1 +
 drivers/gpu/drm/ci/test.yml                   | 119 ++++++++--------
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  16 ++-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   7 +
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  32 +----
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |  65 +++++++++
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |  24 +---
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  29 +---
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   7 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  35 +----
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  | 131 ++++++++++++++++++
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  37 +----
 drivers/gpu/drm/ci/xfails/i915-jsl-skips.txt  |  50 +++++++
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   4 +
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   5 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |   6 +
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  16 +--
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  13 +-
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 119 ++++++++++++++++
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   7 +-
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   1 +
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   4 +
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |   2 +
 .../msm-sc7180-trogdor-kingoftown-fails.txt   |   1 +
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   1 +
 .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |   1 +
 .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
 .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
 .../drm/ci/xfails/panthor-rk3588-fails.txt    |   5 +
 .../drm/ci/xfails/panthor-rk3588-skips.txt    |  20 +++
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  14 +-
 .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  21 +++
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  12 +-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  35 +++++
 .../drm/ci/xfails/rockchip-rk3588-fails.txt   |  10 ++
 .../drm/ci/xfails/rockchip-rk3588-skips.txt   |  14 ++
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  50 -------
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   2 +
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |   3 +
 49 files changed, 835 insertions(+), 384 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panthor-rk3588-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/panthor-rk3588-skips.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3588-fails.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3588-skips.txt

-- 
2.47.3


