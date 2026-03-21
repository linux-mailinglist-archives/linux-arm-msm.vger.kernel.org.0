Return-Path: <linux-arm-msm+bounces-98992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMdAHz5OvmnJMAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:52:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAE12E408A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBCAE301D96A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 07:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDE23254A0;
	Sat, 21 Mar 2026 07:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="aDiEAxed"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A7623BCF7;
	Sat, 21 Mar 2026 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774079546; cv=none; b=KywYJpQKFdeIynX7RrqZItjnSlRywNPnxs2B97jXrzBq7sjBuASV0GpT6bWnC4KicKngnlQ1DMaJWgzimo/Ow+oYbXk7r8gu8CqZbViVkO5TfVrdT2ujW+feYrqkxWeODJaBsMCpR5ZadC+XTyOYAX9A5iZzK8Rm35QqpicfA4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774079546; c=relaxed/simple;
	bh=KHRnhv/4pYbVMID+XHMW0SjwRafeNdH1kmN7TXrJuHQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WJ3BSVF9nytibakH97smEM9LEokAXwSIIgaeRb13GjdaQRyAH1CpWTNpdtD8xxvxGaCTF4AB37+TDlTSaVIncyCN5p7la385Bzq5PvSLxs698gw41PtNDeHdloEWCEyXwRUwGW/+xIlV58eiFaLd6fBO/0uPxuurz1ulWIWx5sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=aDiEAxed; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774079535; x=1774338735;
	bh=zZyEXAraRdvofZfKlb3Jd6OD64XHIstFRuCQeWzCywU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aDiEAxedt6XzKqwmdQzA2BVOWLJ0FkYKpC9MNaDnFmGufKGztl9FF144V1NHzLcLA
	 HtZifqwvXTkK+xNCGkRTwofOnQr6A+naT3S5EaO6K8SuDVCNwkLiFzr8oUoH1ld6j1
	 YqtsK61L+DMWf/dvSwiWZ6Pvi4IWT7vgrKbbert77OfxTnXMZr3DIWYDFLlP8zeydW
	 GfxRkN6luN9/EX7NgW5rKGo4cQXwwytBrEvN4EpBksHbQ6xWQkp/t7gAnrhTMeE7QK
	 zXf2Hss/d5ZFLzYqpTF9j+encWKpfc09SKZrK+nuY9BXV5fFBc+yvWyITEWwCGGkTh
	 ffkNb5MuV5UEQ==
Date: Sat, 21 Mar 2026 07:52:10 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 0/5] drm/msm: add RGB101010 pixel format and fix 10-bit DSC timing
Message-ID: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 74dfc497e28fabf4fbad012aead299e8d8c69ccd
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
	TAGGED_FROM(0.00)[bounces-98992-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: ECAE12E408A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for the RGB101010 (30bpp) pixel format used by som=
e
newer panels.

Tested on the BOE BF068MWM-TD0 panel (10 bit DSC) on the Nothing Phone (3a)=
.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
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
      drm/meson: handle RGB101010 in format switches
      drm/msm/dsi: rename MSM8998 DSI version from V2_2_0 to V2_0_0
      drm/msm/dsi: add DSI version >=3D comparison helper
      drm/msm/dsi: Add support for RGB101010 pixel format

 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  4 ++--
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 22 ++++++++++++++++++++--
 drivers/gpu/drm/msm/registers/display/dsi.xml |  5 ++++-
 include/drm/drm_mipi_dsi.h                    |  4 ++++
 6 files changed, 33 insertions(+), 6 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260318-dsi-rgb101010-support-4956b1cd8657

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



