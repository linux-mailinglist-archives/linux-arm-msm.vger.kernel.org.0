Return-Path: <linux-arm-msm+bounces-50607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 730DCA5607D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABAE717704A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 05:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF537198E91;
	Fri,  7 Mar 2025 05:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfMbo0kd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871E018DB09;
	Fri,  7 Mar 2025 05:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741326960; cv=none; b=bq0U2H5KzBPCB1ro+mcxyVxIpZAa8LXUUvtGPhL7XQgtVNDBwI4S+fQoF9+jwYTDxSq8VE8GnsXb9wu6WbBQIrO55rue9672aKVoYG6Qp6k+vHpkApTEF21lv//y/h4f/YILXEWD+JalSRaxHAyqdL7yicr10PkK6t94o+bMwj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741326960; c=relaxed/simple;
	bh=Vg0Hiu6DbcVv9W2tmXX02bwit9obI/fnahHZu0wzzIQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cv9xH+PVNsVpRcM4advFm/qnOdSOGdeOPg/tg2scNcZKLiHPkVCq+216exyThHabHEuyvG1RFtrTNYr+tqsYgRa01f/5nLzhh9fJkvb85MhkL8EiOancBjGwbJjRKalTxIFJak+zCRpjETyqlRBQjXn8m/yd4vxmwRvEcMXvRwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfMbo0kd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8714C4CED1;
	Fri,  7 Mar 2025 05:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741326959;
	bh=Vg0Hiu6DbcVv9W2tmXX02bwit9obI/fnahHZu0wzzIQ=;
	h=From:Subject:Date:To:Cc:From;
	b=QfMbo0kdh3/NueEADcRfkfnCWdAf1o/ivN0hQvzUoKcFlfNnm0pDkx2eK8+Yvtbav
	 Gv6rMIXFKx45Xg4Gd5n/IQsKEIkvZEGNIvr4gPtn8dOfFZCyjbHPPqGmWMKnfZ9kAt
	 43ZyiJGHTfKTkaCUv5l1BWq7+nlQjEac2Vprtr6OzRzaZPcTtTaZRE9mdA72R2unYG
	 e+bk4lnuu/8msIWXHpFGFtFlRlMDD38a8kXtzsjXLlRGaHVKML59dT98HrVlN9lrqd
	 ZifY0PPYv4Q5sDklcKJVeRWoLygg+2QwmNXW62cfYpIPvbZEmaAjK8/D38GSgCMAlW
	 cnTdGyl5jCDVw==
From: Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH v5 0/2] drm/bridge: reuse DRM HDMI Audio helpers for
 DisplayPort bridges
Date: Fri, 07 Mar 2025 07:55:51 +0200
Message-Id: <20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGeKymcC/3XOQW7CMBCF4asgr+tqPHbSmFXvgVjYGZuM1MbIK
 REI5e442TQQsXwjfb/mLoaQOQxiv7uLHEYeOPVlVB870XauPwXJVLZAwAoQakln2dEvS3chTlJ
 VZCP54L2NophzDpGvS+9wLLvj4S/l25If1Xx9VxqVBNk4p4xrWiBD3z/cu5w+Uz6JOTXimttXj
 oWrmnwdfESMccP1iqsN14UbtAARtPEGNtz8cw3qlZv5efzSllzEpm2f+DRND5VqBkxoAQAA
X-Change-ID: 20250206-dp-hdmi-audio-15d9fdbebb9f
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3055;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Vg0Hiu6DbcVv9W2tmXX02bwit9obI/fnahHZu0wzzIQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnyopr5KVlXt0JP31KEmd2371Jw/0vQBmvcI0ag
 1v6uuFiaeqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8qKawAKCRCLPIo+Aiko
 1SlhB/wP+QdH/pAwZYyUeHuoc3+8xbN74dkgJw3gvcuYXMQedq7CU/bA0YIa0dtSqyTikjWRIJc
 4gRgEy7J0VQwNvfN6fq4XSREkdw/agYoWeJy9rgbXv5hmEfgPIGlWAW9Vq/qUC2AOIqkcibhdI7
 ja8uTAInZCRyz6VhjopFfXMGERxUuZ7yFLxqQIHP3kXvIpRI9z2uK32M6V6HnIS55OKD3G8Ugtj
 ofk14N2licxSG/s4eoBsEtwLcLKVPZ+rPMhvIkYyn9Z75aXEhyMoYPnqJ3FZQ623elPuQEntW0l
 8nkY3670i3rXl+Lz1pAAbH61NFjuS6SebqDGFyhHeHFvzR7H
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

A lot of DisplayPort bridges use HDMI Codec in order to provide audio
support. Present DRM HDMI Audio support has been written with the HDMI
and in particular DRM HDMI Connector framework support, however those
audio helpers can be easily reused for DisplayPort drivers too.

Patches by Hermes Wu that targeted implementing HDMI Audio support in
the iTE IT6506 driver pointed out the necessity of allowing one to use
generic audio helpers for DisplayPort drivers, as otherwise each driver
has to manually (and correctly) implement the get_eld() and plugged_cb
support.

Implement necessary integration in drm_bridge_connector and provide an
example implementation in the msm/dp driver.

The plan is to land core parts via the drm-misc-next tree and MSM DP
patch via the msm-next tree.

NOTE: The first patch now depends on the drm-misc-next _and_ msm-next
trees, as MSM HDMI driver was switched to DRM_BRIDGE_OP_HDMI. The
easiest option is to wait for msm-next to be merged to drm-misc-next
(through drm-next).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Rebased on top of linux-next, also handling HDMI audio piece of the
  MSM HDMI driver.
- Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org

Changes in v4:
- Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
  HDMI driver.
- Drop outdated comment regarding subconnector from the commit message.
- Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org

Changes in v3:
- Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
  (Laurent, Maxime)
- Dropped the subconnector patch (again)
- Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org

Changes in v2:
- Added drm_connector_attach_dp_subconnector_property() patches
- Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org

---
Dmitry Baryshkov (2):
      drm/bridge: split HDMI Audio from DRM_BRIDGE_OP_HDMI
      drm/msm/dp: reuse generic HDMI codec implementation

 drivers/gpu/drm/bridge/lontium-lt9611.c        |   2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |   1 +
 drivers/gpu/drm/display/drm_bridge_connector.c |  59 +++++++----
 drivers/gpu/drm/msm/Kconfig                    |   1 +
 drivers/gpu/drm/msm/dp/dp_audio.c              | 131 +++----------------------
 drivers/gpu/drm/msm/dp/dp_audio.h              |  27 ++---
 drivers/gpu/drm/msm/dp/dp_display.c            |  28 +-----
 drivers/gpu/drm/msm/dp/dp_display.h            |   6 --
 drivers/gpu/drm/msm/dp/dp_drm.c                |   8 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         |   1 +
 include/drm/drm_bridge.h                       |  23 ++++-
 11 files changed, 92 insertions(+), 195 deletions(-)
---
base-commit: 565351ae7e0cee80e9b5ed84452a5b13644ffc4d
change-id: 20250206-dp-hdmi-audio-15d9fdbebb9f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


