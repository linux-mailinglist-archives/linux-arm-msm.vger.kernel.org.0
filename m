Return-Path: <linux-arm-msm+bounces-112621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4A33B81QKmrAnAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:08:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B1866EE5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:08:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Teqyt6jL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112621-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112621-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D16F301A42C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 06:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0A83403E4;
	Thu, 11 Jun 2026 06:08:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ECB1A0BD0;
	Thu, 11 Jun 2026 06:08:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781158090; cv=none; b=eRvjp7FnGNoXz+7DqB17GAJ0KtQJaaQ7W6lrbPm86kE+RC0Ui39SFLqE5vGVso/+yW4u62jJ2teGTbx0XjxD4OAPX5th18StXb3O1nZw6ZpUAWAVXPOp4KV749GnvasvTiGW11ELUcoW1SGPWYovoFQylSD50eWyDnirkQO9k5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781158090; c=relaxed/simple;
	bh=81muFtNZlIN5I+ReHetL0p5x3A+MyYaxxxEAsQdgsiE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QnMvx/1v6BoTiucI3c3GhrxfOqUDtx+IHQGPOLmEtIucDq/Pv2CqENp7GBej57EpbdA3tn2Q+e8JwbLrtB+kmsNrvGGVLnkO81BhiQI0CPvKarRJDtl8aFopvzE1UfUZdXiYgh4vSM8y09njAscEUMKpqGAUDCue5JymaKEUCrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Teqyt6jL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DF03C2BCB0;
	Thu, 11 Jun 2026 06:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781158089;
	bh=81muFtNZlIN5I+ReHetL0p5x3A+MyYaxxxEAsQdgsiE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Teqyt6jL6hijIep64ZxmyiUlIwfknzaHLfZDm8o1qRRsMOKvkKktH/8LEo837k7KR
	 m6eAh2FJXBtYjN+/Cn51/WVuB1H5UiCwlip6GfY7Njrobw9ocOcUeOU0nplf3vhrGt
	 CBjHapY3N8bM5hQkgRVGcoPXKUTeXMFNSGodV8qFdm7/WwOZf6V4atkbC88OD34o0w
	 VTKeMOoG8ukZnilDp8a8d8oj2+Rt/bmMcqd0bJ6zh8y60pJ+5RjNc5QCsiAV37rljc
	 wmuEkb/eNu4srVzL6FQP4O58/jw6Xf9eabsOVm/a6OfNn5tKxrR+7+GKA9MyI/5X3N
	 IuQuOrKJAHCGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931C5CD8CB9;
	Thu, 11 Jun 2026 06:08:09 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Subject: [PATCH 0/2] drm/msm/mdp4: fix intermittent blue screen on Galaxy
 S4
Date: Thu, 11 Jun 2026 08:07:45 +0200
Message-Id: <20260611-mainline-fix-mdp4-blue-screen-sending-v1-v1-0-22925600e4f2@alex-min.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALFQKmoC/yXNwQ6CMBCE4Vche3aTFqQkvorxUNoR18BKWiAmh
 He36vE7zD87ZSRBpku1U8ImWV5aYE8VhYfXASyxmGpTO+Os4cmLjqLgu7x5ivOZ+3EF55AA5Qy
 NogNvlo1ruth5F5q2pZKbE8rkd3W9/Z3X/omwfPt0HB/C2qJDjAAAAA==
X-Change-ID: 20260610-mainline-fix-mdp4-blue-screen-sending-v1-0637d7a6c355
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781158087; l=1297;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=81muFtNZlIN5I+ReHetL0p5x3A+MyYaxxxEAsQdgsiE=;
 b=0xbJVqU4awXIOs3QAV1exSkY/TNPZmxrn4rSiwfmmxX3PgynjiiF2s3u7oOvRNUQsQoI3dQBY
 GNcWij60CaXBzgqdahAot4Dc5UraLukFX185Itt9H67s6HDMhZDVZEp
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:contact@alex-min.fr,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-112621-lists,linux-arm-msm=lfdr.de,contact.alex-min.fr];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[contact@alex-min.fr];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84B1866EE5A

This series fixes an intermittent blue screen seen on the Samsung
Galaxy S4 with the MDP4 display controller. The issue happens on roughly
half of boots.

The first patch keeps the AXI/bus clock enabled while a CRTC is active,
so scanout does not lose bus access while the display pipeline is still
running.

The second patch handles the case where firmware left the display
pipeline enabled before Linux takes over. In that case, the required
display clocks are kept enabled until the first DRM modeset, where the
driver takes ownership of the pipeline.

Tested on a Samsung Galaxy S4 GT-I9505, codename jflte.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
Alexandre MINETTE (2):
      drm/msm/mdp4: keep the bus clock enabled while a CRTC is active
      drm/msm/mdp4: keep inherited display clocks enabled until modeset

 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |   3 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  | 108 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  |   8 +++
 3 files changed, 118 insertions(+), 1 deletion(-)
---
base-commit: acb7500801e98639f6d8c2d796ed9f64cba83d3a
change-id: 20260610-mainline-fix-mdp4-blue-screen-sending-v1-0637d7a6c355

Best regards,
--  
Alexandre MINETTE <contact@alex-min.fr>



