Return-Path: <linux-arm-msm+bounces-52141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A79D6A6B675
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 09:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70D1846416B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 08:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E931F09A1;
	Fri, 21 Mar 2025 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Q2q+HaQb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6321F03F0;
	Fri, 21 Mar 2025 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742547378; cv=none; b=n3Qn738e/SptasYxMLNOIXloFvcEtY5zu9OR4W6cEO4JKN/qVeEW8q1/g+6WLf2cJ1EQNODLm3YywFf2XLQEcoXN2spNSAt8PIVZ/xpxEe5MCqEShFbIuaOWTIHkI9nQiWLgYpaMLH2nACUON/UtgMvNCA0nSVr8ikd7f0MtN3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742547378; c=relaxed/simple;
	bh=NsY4euGIgxwpyzPru1ae1JJGSeLt5uv4n7wnQTC6mDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mPiNY1aUQ6c4esv+k9tYN9SxzPFscEPuzh5qkqa9pyr4WXjKMJo+EkPy1X1a2etYt505ff1odjGvcBGoG86KsMuQmlej55mCMxqiIZJ6tjyBfEQp66NL9IGjM4T0oXmKEW4NaX57wWQ6mmHdy46UoDP2PxWHPvbOU0v4K5zTIHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Q2q+HaQb; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=mZPiX
	quyeyecb4DW24Tg2cMooYApUCDgOih/gW3Z9R0=; b=Q2q+HaQb6m1V6zhg2GZ3x
	ApDdI20drvLGz5KHCSSpKrOwxl25P8rhpcPPnxSEP/op78ftR8pqOIIsIeYaj6Pa
	fha7H2gzaIpVnuxuJNLhshBzJl818rFe7wmtfPvHhXGmgMagRItzF/HgZ0QW0AgX
	yCXdpnqxIc6RaaN7ERPnRY=
Received: from ProDesk.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3lmIbKd1nvVJ9AQ--.2326S2;
	Fri, 21 Mar 2025 16:53:51 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: lumag@kernel.org
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
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 0/1] Pass down connector to drm bridge detect hook
Date: Fri, 21 Mar 2025 16:53:37 +0800
Message-ID: <20250321085345.136380-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgC3lmIbKd1nvVJ9AQ--.2326S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw48KrWfKF1UWr4UXr15twb_yoW5WF1rpF
	W2gry3Ary8ZFWakayxAF18CF98A3Z7JFWFkrW2ywna93WruF1UArsxAayYqFyDWF17Jr1a
	ywnrGrWxGF1xAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jvuWdUUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBcXXmfdIWPYKgAAsE

From: Andy Yan <andy.yan@rock-chips.com>


In some application scenarios, we hope to get the corresponding
connector when the bridge's detect hook is invoked.

For example, we may want to call drm_dp_read_sink_count_cap(which needs
a drm_connector) at the dp deteck hook, intel_dp and nouveau_dp do this
at it's connector's detetc_ctx/detect hook.

But for a bridge driver, it's detect hook is initiated by the connector,
there is no connector passed down.

In most cases, we can get the connector by drm_atomic_get_connector_for_encoder
if the encoder attached to the bridge is enabled, however there will
still be some scenarios where the detect hook of the bridge is called
but the corresponding encoder has not been enabled yet. For instance,
this occurs when the device is hot plug in for the first time.

Since the call to bridge's detect is initiated by the connector, passing
down the corresponding connector directly will make things simpler.

Before preparing this patch, we have had some discussions on the details
here[0].

[0]https://patchwork.freedesktop.org/patch/640712/?series=143573&rev=5


Andy Yan (1):
  drm/bridge: Pass down connector to drm bridge detect hook

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c          |  3 ++-
 drivers/gpu/drm/bridge/analogix/anx7625.c             |  2 +-
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c   |  3 ++-
 drivers/gpu/drm/bridge/chrontel-ch7033.c              |  2 +-
 drivers/gpu/drm/bridge/display-connector.c            | 11 ++++++++---
 drivers/gpu/drm/bridge/ite-it6263.c                   |  3 ++-
 drivers/gpu/drm/bridge/ite-it6505.c                   |  2 +-
 drivers/gpu/drm/bridge/ite-it66121.c                  |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c              |  6 +++---
 drivers/gpu/drm/bridge/lontium-lt9611.c               |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c            |  3 ++-
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  3 ++-
 drivers/gpu/drm/bridge/sii902x.c                      |  3 ++-
 drivers/gpu/drm/bridge/simple-bridge.c                |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c          |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c             |  3 ++-
 drivers/gpu/drm/bridge/tc358767.c                     |  5 +++--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c                 |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c                    |  2 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c                 |  8 +++++++-
 drivers/gpu/drm/display/drm_bridge_connector.c        |  2 +-
 drivers/gpu/drm/drm_bridge.c                          |  5 +++--
 drivers/gpu/drm/mediatek/mtk_dp.c                     |  3 ++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                   |  3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.c                       |  3 ++-
 drivers/gpu/drm/msm/hdmi/hdmi.h                       |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c                |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                   |  4 ++--
 drivers/gpu/drm/xlnx/zynqmp_dp.c                      |  3 ++-
 include/drm/drm_bridge.h                              |  6 ++++--
 30 files changed, 67 insertions(+), 38 deletions(-)

-- 
2.43.0


