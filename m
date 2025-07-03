Return-Path: <linux-arm-msm+bounces-63530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC1CAF74AE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:51:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1665566092
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 12:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8AF12E62BF;
	Thu,  3 Jul 2025 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pmle+Jf+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6674029C33E;
	Thu,  3 Jul 2025 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751547115; cv=none; b=StH1wl57SyYeoUKwR52mKv+HvVYH0vIhbPzrqrpC3pfoeoucQzlKoUPZeXHQJWucHXnG3FWOp6RF9Ok98y/vHjRo1EG4E2RdTfs+0bfdI5t0dQMWsk7s66INKSJiF2R/fz/1RN2QWShHnlI6jjXTJaCaJMeFw2AOwY1pd6Ijd8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751547115; c=relaxed/simple;
	bh=8cVsj7c6niP+JfkiPXl5ehru+xDsq0rqhBXJfP1pB7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IzkPXwRckCYNselsE+J86N+RbPXF/SWGk9cWx46G26C4LKh781Ruu7GAyloynChM8xSBPKcCURDOXSNY2Il06xTWlY+WlmemfQuWBTiGc6wf8guRm0lYpTLWI1GxbntADZRVTt0mifYHN/lPTPqjCas0Dg59I0ZfWkLUBl0ks+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pmle+Jf+; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3M
	Ga7aUIUrsqSH5jzhVO2fccWDlbAAU4JB3lQ6tDZMI=; b=pmle+Jf+7uIoBLtNKD
	xi1b+D8KcNunRsFTEJia3+2C6/zC0gicTdnwnl4yVUZjVDwsHptAhPc9f3D0hRbx
	0s5RkxMaXBtwEYpvEYHNefuKt6VEqNljQ5iDvtEHNM7zHv9/vVDgXMIKXmD6BhgU
	aIjZ429cMAPxWuk06/+TY8Q3Y=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXBAyWfGZoVnrrCA--.37969S2;
	Thu, 03 Jul 2025 20:50:34 +0800 (CST)
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
Subject: [PATCH v3 0/2] Pass down connector to drm bridge detect hook
Date: Thu,  3 Jul 2025 20:49:51 +0800
Message-ID: <20250703125027.311109-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXBAyWfGZoVnrrCA--.37969S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw48KrWfKF1UWr4UWr15urg_yoW5Kw4UpF
	W2gFyavryxAF4aka1xAF18AF90y3Z7XFWrKry2v3sI93WFvF1UArsxAayrXryDGFyxJr12
	ywn7GrWxGF12yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRSkshUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBx-XmhmehVGHAAAsW


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

Changes in v3:
- Remove redundant SoB

Changes in v2:
- Make dp/hdmi_audio_* callback keep the same par get_modes

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


