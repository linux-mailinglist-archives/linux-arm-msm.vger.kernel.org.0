Return-Path: <linux-arm-msm+bounces-98732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA2PN+bku2njpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:58:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E412CAC1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A5993025110
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DF737E317;
	Thu, 19 Mar 2026 11:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="YJug8NNn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039193C199D
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921478; cv=none; b=IjmVtPuBxW+fBCCzj+Zu2I3ftiTHMNTwVCJw5RrCI+TUPmBJzM62bzZKpQ75DWGZmAR094G2ufrlxHOlzWePDDZA+IxH2MQ210eEtpvAS9i368/Tj1xW2+ii0scfLpPEScESIr0YhdvCaWusUFylZp3GPUrYvzA8L1vziifO3C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921478; c=relaxed/simple;
	bh=ryakE13+AFMRWTGA92j3MCniO/v5nDsCCMEy2rw5S+g=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XGTI8VWQtrSQLinY8hnRgUry3/CNNJJTHy2ie9JSidTmkhjZETgvJBUfQ8BaJ/PDpAIod+r8KwUBHRWVcyFqPKCD8g9sCDclpNKIC3NQ4sXngpFY2IamZvmTnN54UsR7gabKnZ3BpIsK7zwAcSEJrdQa/ZqFJfFSc1hjj1cQpVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=YJug8NNn; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773921466; x=1774180666;
	bh=sEVl3HuB7ehM4vExON+7mh6z/VnbwN4gR3kLK+MIxl0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YJug8NNn1MFIYmrO+WS5olRPbVwpVsh9T02JEgnlcqqHIRy1DivoOkIZ4ny1ITNx+
	 6fVsLiLIiLkY5gt7K43CKGm5GzBZXHkKQZ6AYfHhMN4XZX2ZjtoeF8Mve6nolpcSru
	 1aaNsOJWCRBNGJ2eEf3OMu7O8Y9VKwOntQX9/OPOzwz3qWwWMAzIs6D76tSysomKTd
	 B1+YtA4M2rbZ+x5NXpor1SUmtz5otoRnLGNNzKk5cLeS3gy+uA19bTfkG3cZBMPXuh
	 QdBpvEBT7skqjvtanBlZCloGu+5vcP0BpBVpIpnVy6DeGXxxrsDPcv284fGDvKPp3+
	 0hUEHedL7nVTg==
Date: Thu, 19 Mar 2026 11:57:42 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v3 0/4] drm/msm: add RGB101010 pixel format and fix 10-bit DSC timing
Message-ID: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: eb0a5f7f6133b232632ff827dfcf3168d202003c
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98732-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 93E412CAC1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for the RGB101010 (30bpp) pixel format and
fixes a DSC timing bug exposed by non 8 bit panels.

Tested on the BOE BF068MWM-TD0 panel (10 bit DSC) on the Nothing
Phone (3a).

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
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
Alexander Koskovich (4):
      drm/msm/dsi: rename MSM8998 DSI version from V2_2_0 to V2_0_0
      drm/msm/dsi: add DSI version >=3D comparison helper
      drm/msm/dsi: Add support for RGB101010 pixel format
      drm/msm/dpu: fix video mode DSC INTF timing width calculation

 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    |  9 ++++-----
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                   |  4 ++--
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                   |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                  | 21 +++++++++++++++++=
++--
 drivers/gpu/drm/msm/registers/display/dsi.xml       |  5 ++++-
 5 files changed, 30 insertions(+), 11 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260318-dsi-rgb101010-support-4956b1cd8657

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



