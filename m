Return-Path: <linux-arm-msm+bounces-98609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG2xCst0u2mckQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:00:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 370562C5C75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 05:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 50B383010912
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CCC35AC05;
	Thu, 19 Mar 2026 04:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="qzcGejuj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A59359A73
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773892805; cv=none; b=D7CW42TFdcookGMJW2vDr+4r9o8qa22zIKtDOEDg/6FTThdZ9rdaDSRy5ryeE/I6yZzM83OAXD0/IG+tCEMH+sow949Mjh+GM7tumHZs8CgZScwLeJo4JHncLOHg40O3w6RMIep7bRTZBnhh3AXmIKWAQ3AK5USqvtAU6eGdyMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773892805; c=relaxed/simple;
	bh=cx4/7Y/qpufikt36DbkZJy+40o6fyKhxh3OtvRXmpaU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S1sJ0cjcMMkF9ndGnn19UhqcW0YuSmT/0hSDOCh2BhHswcZIyWHk/HG3ZsGqGJu9YrdML33WlqFdgxUdxOKXSH9pbE89CeQ+4NBmBcZBv+M4F8T+iT2FFwP5ndKHfUkTQ1oJdKVc8hjv3XuuYkLFcl2TTTx4Pw8xuxZGS3oU7fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=qzcGejuj; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773892801; x=1774152001;
	bh=qrz4dzTAVjEcyUcrosogifsPOSLN65jJ+X0IWxKIan8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=qzcGejujJWayzGYv4JOp002Whxrgvg8ubcVDjnBGwLFdWxrUZrev+5RA5HZfOST8k
	 O38tVJjjPJDRncK1jVWHNMfto536mi0RtwmwbWyXPPx7nx32lZDvHYOZLZVuNP1uxg
	 Cq+M/+WiNe1ChZMkxtxcXKYpJix28szaEsIRjjtT0t6xAZJ2btXM2CCnBSxZIRIy4r
	 VeMebWYVtXRMk6X4zfGIPJLssxxUE/1hYBBhWj8ovJHZ7qNfLmQXE/nV9MpNOcVMVn
	 7OJuEx9zLReZDLpa1t9FfOUdnLUVZ/EmUWdbh9UUx0P23Ju8VKs66oxz+46YYNrSq6
	 /1MuGbX5bGHcQ==
Date: Thu, 19 Mar 2026 03:59:55 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/msm: add RGB101010 pixel format and fix 10-bit DSC timing
Message-ID: <20260318-dsi-rgb101010-support-v2-0-698b7612eaeb@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 359fec2ca25f556ad8c79c68c43fed389c950c06
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98609-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 370562C5C75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for the RGB101010 (30bpp) pixel format and
fixes a DSC timing bug exposed by non 8 bit panels.

Tested on the BOE BF068MWM-TD0 panel (10 bit DSC) on the Nothing
Phone (3a).

Note, I'd appreciate a comment on the INTF timing change from someone
at QCOM who knows the DPU hardware a bit better, this appears to be
what downstream is doing regardless of bpp, but let me know if there's
a better solution here.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v2:
- Only allow RGB101010 if MSM_DSI_6G_VER >=3D V2.1.0
- Link to v1: https://lore.kernel.org/r/20260318-dsi-rgb101010-support-v1-0=
-6021eb79e796@pm.me

---
Alexander Koskovich (3):
      drm/mipi-dsi: add RGB101010 pixel format
      drm/msm/dsi: Add support for RGB101010 pixel format
      drm/msm/dpu: fix video mode DSC INTF timing width for non 8 bit panel=
s

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 12 +++++++-----
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                    |  8 ++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                    |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                   |  9 +++++++++
 drivers/gpu/drm/msm/registers/display/dsi.xml        |  5 ++++-
 include/drm/drm_mipi_dsi.h                           |  4 ++++
 6 files changed, 33 insertions(+), 6 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260318-dsi-rgb101010-support-4956b1cd8657

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



