Return-Path: <linux-arm-msm+bounces-99639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEDiHmt+wmnqdAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:07:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E7B307E24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 249BD31900BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CCC3E314E;
	Tue, 24 Mar 2026 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="EQc3mgI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8853EE1F3;
	Tue, 24 Mar 2026 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352892; cv=none; b=DfmaqkH44hCL26IQ0WqC7t4bFUzg4P2Hxq0nfyN/xdLjxoeYUHQqsT252IH1NFT2b22ZSELBaxxjrcQXb5k4W5H2FbRF+5qwP/DpY+FeBgn7SsZchXaJSLe7Usp7DksWckQ4sYIm2Lwg9Zbl+iUQj+ZDfx7dC5REcKBAirTH8E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352892; c=relaxed/simple;
	bh=zn0R/WYR7EufH5MIoLPpPtyD4L66GtGgG5qo6ivG5os=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cThI3Tkvv7w/L+slyC0lkOYJp5EUoG2qQNR4Bs0UCT7QeG8ISGtSK5iKeeBcnJehza6Z4zwMHEIVTi903c6WfMn4qJQI5oOeMiBRoqbxdDTgRzKM/7tFxGDfOSxzZyG0W13pGPOzdimOwG8EZfhr/WspxnAWfdMUgPuw42dVcGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=EQc3mgI2; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774352886; x=1774612086;
	bh=Bd8puGPsyAqrkv3KsDLsSC/8GgPDmqGf8nZTwBgCbY8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=EQc3mgI203+O6uIdKN1cbKBrJYYKtopOnFWgus+/77ru5URIvTFagSqZyHFir824s
	 aE/ASlIDrv+C5NA2iIpVKVD8hSMJeGXMc4S7Oh63GOtdELyQRcyrLzf6+O1hzDWg+6
	 TgdhAVimU3kpsmmMNZWFUiUUfDnCHZVIpCtFJ/PNaTgzc9VUOxSjLCUD82ciSw/jXL
	 nW4ds3oUIlflSMLUvmx1lC+n+HghZvUSfsHdRocVFMmZCUA6+nLVKzOsYIs/N9qYrG
	 cmVVQkJfdPSug0HAqBvF0es085DZddnU1Hr/JZxVsiyTtdCu5OxwFtJI2FFfrze+H9
	 YNg72gCqc8p3w==
Date: Tue, 24 Mar 2026 11:47:56 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 0/5] drm/msm: add RGB101010 pixel format
Message-ID: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6b2dc60d395a13138b40b2adb8565c23b7c2566b
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99639-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,googlemail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 12E7B307E24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for the RGB101010 (30bpp) pixel format used by som=
e
newer panels.

Tested on the BOE BF068MWM-TD0 panel (10 bit DSC) on the Nothing Phone (3a)=
.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v5:
- Add comment & warning about RGB101010 support in compression_en && !wide_=
bus_en case
- Move RGB101010 check further down so it has access to msm_dsi_host_is_wid=
e_bus_enabled()
- Use default case for meson_dw_mipi_dsi pixel format switchs
- Link to v4: https://lore.kernel.org/r/20260321-dsi-rgb101010-support-v4-0=
-eb28ecebbfe8@pm.me

Changes in v4:
- Dropped dpu_encoder_phys_vid patch
  - Needs further discussion and rest of these changes can be independent o=
f that
- Pick back up dropped drm_mipi_dsi.h patch (oops)
- Fix meson driver warning from adding RGB101010 to drm_mipi_dsi.h
- msm_dsi_host_version_ge -> msm_dsi_host_version_geq
- Fix msm_dsi_host_version_geq to handle major > major
- Link to v3: https://lore.kernel.org/r/20260319-dsi-rgb101010-support-v3-0=
-85b99df2d090@pm.me

Changes in v3:
- Fix typo for MSM8998 DSI version name (V2_2 -> V_2_0)
- Add msm_dsi_host_version_is_gt per Konrad and use for RGB101010 check
- Fix up comment & commit message for video mode DSC INTF timing width chan=
ge per Neil/Konrad
- Link to v2: https://lore.kernel.org/r/20260318-dsi-rgb101010-support-v2-0=
-698b7612eaeb@pm.me

Changes in v2:
- Only allow RGB101010 if MSM_DSI_6G_VER >=3D V2.1.0
- Link to v1: https://lore.kernel.org/r/20260318-dsi-rgb101010-support-v1-0=
-6021eb79e796@pm.me

---
Alexander Koskovich (5):
      drm/mipi-dsi: add RGB101010 pixel format
      drm/meson: use default case for unsupported DSI pixel formats
      drm/msm/dsi: rename MSM8998 DSI version from V2_2_0 to V2_0_0
      drm/msm/dsi: add DSI version >=3D comparison helper
      drm/msm/dsi: Add support for RGB101010 pixel format

 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     |  6 ++---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  4 ++--
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 34 +++++++++++++++++++++++=
++--
 drivers/gpu/drm/msm/registers/display/dsi.xml |  5 +++-
 include/drm/drm_mipi_dsi.h                    |  4 ++++
 6 files changed, 45 insertions(+), 10 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260318-dsi-rgb101010-support-4956b1cd8657

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



