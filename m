Return-Path: <linux-arm-msm+bounces-105027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIA5EdrS8GnDYwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:31:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD16487E2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 17:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25B54301FA5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE7F32AADE;
	Tue, 28 Apr 2026 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AOKI61nm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248BE313E29
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390286; cv=none; b=LT3mAUAEHBxMioA7ynzBZ0R9kLPhtwGXEUIRIZMW3Yzw2cAgxvl+se3H/jDYoFgKLUNyrfsQbRBwMWSeMkmp/oP3xbSdJ+NDlP4SRMRvj50OHJtkWrXa4sivCXwV02i47AaD82zZWqJwBksI1L2qkHERaxK7lpxCeDQ+vjXlVps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390286; c=relaxed/simple;
	bh=yL/BsvDRd38fz43ec/fuPnaAzJeSeSU0uTrb9reLZ0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cy8SkiXnbnEuNh2W3n4dY2Io0jXKo0QlJNGnjcCA9VKFhpV5adtwN7IOZNVS8oIneXdm+Pakf4Fb1hhE9IJ96Wy0+tVV2M6Ip49QDKWBllCkT7QYsTVzQAJBzdd1/ZN8PyVw2/TCw7kgdCdUjWUvcaaxGskVOCDGs+lgfnfyw+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AOKI61nm; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 29C7E4E42B54;
	Tue, 28 Apr 2026 15:31:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8B40601D0;
	Tue, 28 Apr 2026 15:31:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6752F1072861C;
	Tue, 28 Apr 2026 17:31:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777390280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=OEF9VP5XUoD9pYJWbQoWCnjrQfSnlUkjr7ryReb47jg=;
	b=AOKI61nma48mkjqVr9Gb0ISnASEq8351KRUjUxWqAmufoigi8v8gQNPeUG8f6NrpREttuy
	FDlGkif5jmdraMwjeo5PB+wBrSrAsmy8r4Fc9tWTM/AiNLU6EpcWu7WyryalA9oIWDWt5j
	QqQwYL9Vd0e63jTQDaButn0NS4xNLxk4OAfhfrewW7IeETq9w78lYqk06W2flRsFU7Lfn3
	gGTpOiupKUomuK8ijPXEo+RXSSJkdrTK8EF7Onj0e9xr9PohJjrsv8fLuuaeeAVzVDr7p5
	pVIgV1WqujC0gJ9/mpnZ6BAXCGwFdRyXvciqoaJN+ajkcii4HobOrQqxrwdzjQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v3 00/11] drm/bridge: handle refcounting for bridge-only
 callers of drm_of_find_panel_or_bridge()
Date: Tue, 28 Apr 2026 17:30:49 +0200
Message-Id: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-0-a537b5567add@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKnS8GkC/42O0Q6CIBiFX8VxHQ2Q0rrqPVpzCL9KU3CAruZ89
 9Bqqzsvz87Z950JeXAaPDonE3Iwaq+tiSHdJUg2wtSAtYoZMcKOhFOCletw6bSKjWhbK3ENoR8
 C7oWBtrCu+JScHQgt0xyEUCjSegeVfqym6+2d/VDeQYYFvywa7YN1z/XKSJfd15puto4UEyykI
 lSq7CRodSmtDa02e2k7tHhH9kNm+XYyi2SeEpJxLqjk2T95nucX8lgv3EwBAAA=
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
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 8DD16487E2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105027-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This series converts all the bridge-only callers of the deprecated
drm_of_find_panel_or_bridge() API to a new, simpler API that handles bridge
refcounting.

== Series description

 * Patch 1 (new in v2) makes drm_bridge_get/put() ignore ERR_PTR pointers,
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
       1. … bridge-connector: attach encoder to the connector
    B.   Device tree description

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
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
      drm/bridge: drm_bridge_get/put(): ignore ERR_PTR
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
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 15 ++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c     | 28 +++++++--------
 drivers/gpu/drm/bridge/lontium-lt8713sx.c    | 10 +++---
 drivers/gpu/drm/bridge/lontium-lt9611.c      |  9 +++--
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c   |  9 +++--
 drivers/gpu/drm/drm_bridge.c                 | 53 ++++++++++++++++++++++++----
 drivers/gpu/drm/drm_of.c                     | 26 +++++++-------
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c |  9 +++--
 drivers/gpu/drm/msm/hdmi/hdmi.c              | 11 ++++--
 drivers/gpu/drm/xlnx/zynqmp_dp.c             | 19 +++++-----
 include/drm/drm_bridge.h                     |  8 +++++
 12 files changed, 128 insertions(+), 70 deletions(-)
---
base-commit: 6dbe0c5375e4f88c8d7c90790e0ea29d565b5d0a
change-id: 20260410-drm-bridge-alloc-getput-panel_or_bridge-42501b38eaad

Best regards,
--  
Luca Ceresoli <luca.ceresoli@bootlin.com>


