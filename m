Return-Path: <linux-arm-msm+bounces-63382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E309AF1371
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 13:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2E5D1767DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8665125F98B;
	Wed,  2 Jul 2025 11:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kXaSjN/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A9B1C6B4;
	Wed,  2 Jul 2025 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751454980; cv=none; b=V2VRm4bEQ8zUNj53xMx1ERxLU80UEzwJCivO8AbhrOuPObMFXUz4EvpcnfW6Sp2cLZIfLNQglSFLAhHzK6M3du379+UexqbxPDf1XED2NhhKFk0qSIc7l0aKZzIe9UHaivR6v8FbkkrlzUhzrX8v1J4P10j2R3hbtgiJqR0pa+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751454980; c=relaxed/simple;
	bh=a9LE6Y+vuyYOJr2W2j2JX2kgLXmLCf01k+fEeLX/O4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I2ztDU0WQpanXUrCwNkHIvGxx0z4APhWA/495IwaaTC8ZLF0G+TVszTSPufwOM39kaSJndCqZk3g/89Gsf8p6XExY4maGmgnVihTtUPd9e65lnfyKG1fvH0zNqfICp+iWSuW4L3nsPNp5lwHbBoR/kE4i+ZUNlbzP2wHgXDGXsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kXaSjN/V; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vB
	oJGHy0ISIe9dsE3K0UfQijWN6qYHy8h2nd32aYn0c=; b=kXaSjN/VSLR+fLQh5x
	V2uqZSj7SAbIMImSPvPT+DZuz8vNVqIBDBrMAjk/mjtY4Z6hBUCoKfCXi5D0wJJ5
	5NDs7ZdNZlUGjifdUV094PvRR2s8Z6DpR3FqpRIpaCQ87HKE/vKQpNp8qAMmymq2
	dvDTRAMKRToNO9p81kIf+JS+E=
Received: from ProDesk.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCHTGOvFGVoldg0Aw--.49301S2;
	Wed, 02 Jul 2025 19:15:00 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: mripard@kernel.org,
	neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org,
	dianders@chromium.org,
	jani.nikula@intel.com,
	lyude@redhat.com,
	jonathanh@nvidia.com,
	p.zabel@pengutronix.de,
	simona@ffwll.ch,
	victor.liu@nxp.com,
	rfoss@kernel.org,
	chunkuang.hu@kernel.org,
	cristian.ciocaltea@collabora.com,
	Laurent.pinchart@ideasonboard.com,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH v2 0/2] Pass down connector to drm bridge detect hook
Date: Wed,  2 Jul 2025 19:14:42 +0800
Message-ID: <20250702111453.102539-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgCHTGOvFGVoldg0Aw--.49301S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw48KrWfKF1UWr4UWr15urg_yoW5KF4fpF
	W2qFyavry0yF4aka1xAF18AF90y3Z7XFWrKry2v3sI93WFvF1UArsxAayrXryDGFyxJr12
	ywn7GrWxGF12yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zigTmxUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkA9+XmhlDvqMnwAAsV


In some application scenarios, we hope to get the corresponding
connector when the bridge's detect hook is invoked.

For example, we may want to call drm_dp_read_sink_count_cap(which needs
a drm_connector) at the dp deteck hook, intel_dp and nouveau_dp do this
at it's connector's detetc_ctx/detect hook.

But for a bridge driver, it's detect hook is initiated by the connector,
there is no connector passed down.

In most cases, we can get the connector by
drm_atomic_get_connector_for_encoder
if the encoder attached to the bridge is enabled, however there will
still be some scenarios where the detect hook of the bridge is called
but the corresponding encoder has not been enabled yet. For instance,
this occurs when the device is hot plug in for the first time.

Since the call to bridge's detect is initiated by the connector, passing
down the corresponding connector directly will make things simpler.

Before preparing this patch, we have had some discussions on the details
here[0].

PATCH1 adjust the dp/hdmi_audio_* callback parameters order, make it
maintain the same parameter order as get_modes and edid_read.
PATCH2 add connector to detect hook.

[0]https://patchwork.freedesktop.org/patch/640712/?series=143573&rev=5

Changes in v2:
- Adjust the dp/hdmi_audio_* callback parameters order.

Andy Yan (2):
  drm/bridge: Make dp/hdmi_audio_* callback keep the same paramter order
    with get_modes
  drm/bridge: Pass down connector to drm bridge detect hook

 drivers/gpu/drm/bridge/adv7511/adv7511.h      | 16 +++----
 .../gpu/drm/bridge/adv7511/adv7511_audio.c    | 12 +++---
 drivers/gpu/drm/bridge/adv7511/adv7511_cec.c  |  4 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |  3 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |  2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  3 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c      |  2 +-
 drivers/gpu/drm/bridge/display-connector.c    | 11 +++--
 drivers/gpu/drm/bridge/ite-it6263.c           |  3 +-
 drivers/gpu/drm/bridge/ite-it6505.c           |  2 +-
 drivers/gpu/drm/bridge/ite-it66121.c          |  3 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c      |  6 +--
 drivers/gpu/drm/bridge/lontium-lt9611.c       | 15 +++----
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c    |  3 +-
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  3 +-
 drivers/gpu/drm/bridge/sii902x.c              |  3 +-
 drivers/gpu/drm/bridge/simple-bridge.c        |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c  | 14 +++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  3 +-
 drivers/gpu/drm/bridge/tc358767.c             |  5 ++-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  3 +-
 drivers/gpu/drm/bridge/ti-tfp410.c            |  2 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c         |  8 +++-
 .../gpu/drm/display/drm_bridge_connector.c    | 20 ++++-----
 drivers/gpu/drm/drm_bridge.c                  |  5 ++-
 drivers/gpu/drm/mediatek/mtk_dp.c             |  3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  3 +-
 drivers/gpu/drm/msm/dp/dp_audio.c             |  8 ++--
 drivers/gpu/drm/msm/dp/dp_audio.h             |  8 ++--
 drivers/gpu/drm/msm/dp/dp_drm.c               |  3 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h               | 10 ++---
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c         |  8 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c           |  4 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c              |  3 +-
 include/drm/drm_bridge.h                      | 42 ++++++++++---------
 37 files changed, 139 insertions(+), 110 deletions(-)

-- 
2.43.0

base-commit: 56e5375b23f342dfa3179395aacc1b47395fddf7
branch: drm-misc-next


