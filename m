Return-Path: <linux-arm-msm+bounces-98370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJOcDGR0umkeWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:46:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4E2B958F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5A4930A3F01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4134B3A7850;
	Wed, 18 Mar 2026 09:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="qW/She3I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0057F2877CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826870; cv=none; b=Zz5v0+znsnJGMc32JuEiQjHARyaBn+i9jY7c4aHyo/YgIz1SOW7YU/Oc/RUYeh//SQNVVkbeTbHttEcUGcM3jK4G2VOUS1PWvLbvHo9ECIsJgektutJUnkk7Sl2fR69yH/4fNsdJaVD53sFs46zbr7tetsOWtyuoLHAWfVOuyTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826870; c=relaxed/simple;
	bh=WidLuYQsUGglTqAsrPHs/5HEHfQTG4ZBQG5lgnow91o=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nJimCWhJ+i2Ekfbnu9Lj1xxoJoR+6MCo0xUalz70r60kFw2cVok8FRgT7H404vEDoeFKu8le0NBJK0AN36qKbLDyJSYWvo9NO6yUUTzIHPZekM1RwyY1At3MAMZVz+epSQnTi5njEsMypAcEtX/GoEaq0rVb/zrHsNtyVFSD0mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=qW/She3I; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773826859; x=1774086059;
	bh=O8NvNXddRHC58zg8IZi+YXxbSeJrGgRudFwpnQQCLOI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=qW/She3IcHNH9eyby4cVencADqZlqCCAecmUBWR7bGPfXEa+hxFyeA1tc7gKb2mfV
	 geKtdAj3FkZjv0aUjxFXoQ1qKhSucsvYkIM7+D6vnSqyckR7S1rqfK/IObGWVN9Cmk
	 OlrgH2IbSQnox200PTBnf5Id5+UvHqj76UQmvn44U9W3i2DocmzrGMVkmC0B4Rhtdb
	 FTvTvkGMHWHpcpvPAMYEwbjgvfG4lDTQnaRdgGelCECL9c7S3fWaAHe5Tv1i8jQ5uD
	 NR97KNKNUwXWWEpCrSY3dtV0t0Jltg1ZDR2VneJ4yaIo/5znDrKa0E1BzgCYFFKV0J
	 p8XxSDpNLtddQ==
Date: Wed, 18 Mar 2026 09:40:55 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/3] drm/msm: add RGB101010 pixel format and fix 10-bit DSC timing
Message-ID: <20260318-dsi-rgb101010-support-v1-0-6021eb79e796@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: d5e723548ab3334420aaaa0fc3e529ba89d8c0c5
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98370-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 9DD4E2B958F
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
Alexander Koskovich (3):
      drm/mipi-dsi: add RGB101010 pixel format
      drm/msm/dsi: Add support for RGB101010 pixel format
      drm/msm/dpu: fix video mode DSC INTF timing width for non 8 bit panel=
s

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 12 +++++++-----
 drivers/gpu/drm/msm/dsi/dsi_host.c                   |  2 ++
 drivers/gpu/drm/msm/registers/display/dsi.xml        |  4 +++-
 include/drm/drm_mipi_dsi.h                           |  4 ++++
 4 files changed, 16 insertions(+), 6 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260318-dsi-rgb101010-support-4956b1cd8657

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



