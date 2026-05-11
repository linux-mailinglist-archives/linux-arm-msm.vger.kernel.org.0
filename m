Return-Path: <linux-arm-msm+bounces-106976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPO8LrIPAmplngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:19:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4268B5134A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 19:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1342B30D9B72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD73441029;
	Mon, 11 May 2026 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="16EJVQdW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4A7426EA3;
	Mon, 11 May 2026 16:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517634; cv=none; b=cf/MgASeKwqhAzRYbCWgI1IuGZ0FliCC/x+uLXPNvOzJ0zsnwTYrIDEWV16oz0m3GSvMsUTTvg6U07/WRmCmgT+DVhJKkL9IjwyUuMD9tRj4lOWnE++cQdD5ZNXUViExrxP0NuqtHGxGGjkTuZXDJIAcqnmbCMGB+J0gqqkuxao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517634; c=relaxed/simple;
	bh=kkGzqafxHrPS9qBT3sChoR4Y+MV0C5CZficLuo4exKI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X7AYaBzpK+6xATuDvJgTY/zM+Rc49PNrDXvLqYhed5xycVSVdhk3QZXnmS87QjtRDz0JHciPc2/hG6OKT3Sinbbm6dDwJpZzRAfEMNjLTo2mBJ1ohBM+jawNfxFr64y1VBXcmF1LabD8CO73kcTXC0/EYBER0MtvKfY5vpXs+5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=16EJVQdW; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3CE2E4E42BF3;
	Mon, 11 May 2026 16:40:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0383060646;
	Mon, 11 May 2026 16:40:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF8DB11AF9F70;
	Mon, 11 May 2026 18:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778517628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=58INz79bQ8VewatGOMRDf2JQ9ssQ32yAiWDpAQl1j6k=;
	b=16EJVQdWMK0IfMwBbRlS3dRFXi/xxt3XgVDZD5LlEpMvrSs6tmj94PMl2L1pxD5BYdCblo
	H9A8otN/olkHXdXEoqhwyQXHNQzJC2/D96akWuMjwjaa0thQTuMW5zzrjxBON5ZBN2p10d
	XwBfcVzUafyB8EMB0RM/7ppcXSLE73yC6T/gM1LfTnleyhwKppR3n1S6qEzdbVCRymQLEs
	m7cPpFUhZhoJviDzd/OAJgRSVgziV2HvCxsFvNlUpbh/646jJpEkwK9oeWO4lG/vzC3Cfv
	0cCfRk7MTWC9gPG9kjdScxCRp4u6Di/t0cGGP7DR/vululNBvPjlJpIVJ1uCdQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v6 00/11] drm/bridge: handle refcounting for bridge-only
 callers of drm_of_find_panel_or_bridge()
Date: Mon, 11 May 2026 18:40:04 +0200
Message-Id: <20260511-drm-bridge-alloc-getput-panel_or_bridge-v6-0-f61c9e498b3f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGUGAmoC/53Qy07DMBAF0F+pvMZo/IpTVvwHQtX4kdYojSM7j
 UBV/h27gKjIJmJ5NaNzR3Ml2afgM3naXUnyc8ghDiU0DztiTzgcPQ2uZMKBNyAZUJfO1KTgygT
 7Plp69NN4meiIg+8PMR2+h5IrYEa0HtGRoo3Jd+H91vTy+pXzxbx5O1W+bpxCnmL6uJ0ys7r30
 yo2t86MAkXrgFmn98i6ZxPj1Ifh0cYzqb0zv5N5u13mRZYCQEuJzEq9lsU/ZVFvVkIbpRqNzq1
 l+SsrkNtlWWSjdGuFQ+wYrGV1L+vtsqrf0NzsmTDKmj/fWJblE/4ALP9aAgAA
X-Change-ID: 20260410-drm-bridge-alloc-getput-panel_or_bridge-42501b38eaad
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 4268B5134A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106976-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid,bootlin.com:url,bootlin.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,msgid.link:url]
X-Rspamd-Action: no action

This series converts all the bridge-only callers of the deprecated
drm_of_find_panel_or_bridge() API to a new, simpler API that handles bridge
refcounting.

All patches acked/reviewed except patches 3 and 4.

== Series description

 * Patch 1 (new in v2) makes drm_bridge_put() ignore ERR_PTR pointers,
   not only NULL pointers
 * Patch 2 introduces of_drm_get_bridge_by_endpoint() as a replacement for
   bridge-only calls to drm_of_find_panel_or_bridge(); the new function
   refcounts the bridge and is simpler
 * The following patches convert all bridge-only users to the new API
 * The last patch forbids new bridge-only calls to
   drm_of_find_panel_or_bridge()

== Grand plan

This is part of the work to support hotplug of DRM bridges. The grand plan
was discussed in [0].

Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges struct drm_bridge,
      based on devm_drm_bridge_alloc()
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. ➜ add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
       2. ✔ drm_bridge_get_prev_bridge() (v6.18)
       3. ✔ drm_bridge_get_next_bridge() (v6.19)
       4. ✔ drm_for_each_bridge_in_chain() (v6.19)
       5. ✔ drm_bridge_connector_init (v6.19)
       6. ✔ protect encoder bridge chain with a mutex (v7.2)
       7. ➜ of_drm_find_bridge
          a. ✔ add of_drm_get_bridge() (v7.0),
               convert basic direct users (v7.0-v7.1)
          b. ✔ convert direct of_drm_get_bridge() users, part 2 (v7.0)
          c. ✔ convert direct of_drm_get_bridge() users, part 3 (v7.0)
          d. ✔ convert direct of_drm_get_bridge() users, part 4 (v7.1-v7.2)
          e. ➜ convert bridge-only drm_of_find_panel_or_bridge() users
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. … handle gracefully atomic updates during bridge removal
    A. ✔ Add drm_bridge_enter/exit() to protect device resources (v7.0)
    B. … protect private_obj removal from list
    C. ✔ Add drm_bridge_clear_and_put() (v7.1)
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. ✔ Migrate i.MX LCDIF driver to bridge-connector (v7.2)
 6. … DRM bridge hotplug
    A. … Bridge hotplug management in the DRM core
       1. ✔ bridge-connector: attach encoder to the connector (v7.2)
    B.   Device tree description

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v6:
- Patch 2: fix warning in the no-OF case 
- Patch 3: fix too-late next_bridge assignment
- Link to v5: https://patch.msgid.link/20260507-drm-bridge-alloc-getput-panel_or_bridge-v5-0-472b913b5cb7@bootlin.com

Changes in v5:
- Patch 1: change drm_bridge_put() only
- Patches 3,10: simplify error management code flow
- Link to v4: https://patch.msgid.link/20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com

Changes in v4:
- Fixed patches 3 and 10
- Minor fixes to patches 1 and 2
- Removed bouncing addresses yongqin.liu@linaro.org and
  xinliang.liu@linaro.org from Cc
- Link to v3: https://patch.msgid.link/20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-0-a537b5567add@bootlin.com

Changes in v3:
- patch 3, 8, 10: fixed ERR_PTR deref in the -ENODEV case, and removed
  Dmitry's R-by from those patches as they are changed
- Added review trailers to the other patches
- Link to v2: https://patch.msgid.link/20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com

Changes in v2:
- Added patch to ignore ERR_PTR values in drm_bridge_get/put()
- Changed API to return the bridge (or a ERR_PTR) in the return value,
  not as a double-pointer output parameter
- Adapted all patches to the new API, dropped Dmitry's review tags as the
  patches are all modified
- Removed bouncing addresses from Cc list
- Link to v1: https://patch.msgid.link/20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com

---
Luca Ceresoli (11):
      drm/bridge: drm_bridge_put(): ignore ERR_PTR
      drm/bridge: add of_drm_get_bridge_by_endpoint()
      drm/msm/hdmi: switch to of_drm_get_bridge_by_endpoint()
      drm/hisilicon/kirin: switch to of_drm_get_bridge_by_endpoint()
      drm/bridge: chrontel-ch7033: switch to of_drm_get_bridge_by_endpoint()
      drm/bridge: lontium-lt9611uxc: switch to of_drm_get_bridge_by_endpoint()
      drm/bridge: lt9611: switch to of_drm_get_bridge_by_endpoint()
      drm/bridge: adv7511: switch to of_drm_get_bridge_by_endpoint()
      drm/bridge: lt8713sx: switch to of_drm_get_bridge_by_endpoint()
      drm: zynqmp_dp: switch to of_drm_get_bridge_by_endpoint()
      drm: of: forbid bridge-only calls to drm_of_find_panel_or_bridge()

 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  1 -
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 15 +++---
 drivers/gpu/drm/bridge/chrontel-ch7033.c     | 28 ++++++-----
 drivers/gpu/drm/bridge/lontium-lt8713sx.c    | 10 ++--
 drivers/gpu/drm/bridge/lontium-lt9611.c      |  9 ++--
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c   |  9 ++--
 drivers/gpu/drm/drm_bridge.c                 | 45 +++++++++++++++++-
 drivers/gpu/drm/drm_of.c                     | 26 +++++------
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c |  9 ++--
 drivers/gpu/drm/msm/hdmi/hdmi.c              | 70 +++++++++++++++++++---------
 drivers/gpu/drm/xlnx/zynqmp_dp.c             | 19 ++++----
 include/drm/drm_bridge.h                     |  7 +++
 12 files changed, 162 insertions(+), 86 deletions(-)
---
base-commit: 7af78cfbe2b47cd9ecb61480fb74d64b584d8a94
change-id: 20260410-drm-bridge-alloc-getput-panel_or_bridge-42501b38eaad

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


