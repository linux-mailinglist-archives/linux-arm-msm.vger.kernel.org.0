Return-Path: <linux-arm-msm+bounces-98337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOQAOpZVumm8UQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:34:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5564F2B7013
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62E27309F6B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 07:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B962AEF5;
	Wed, 18 Mar 2026 07:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="HgiwWgX+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657AE36B054
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773819188; cv=none; b=ONZDG/8ZLmI6wATQMjgK8c86X94iilI1uyZNrsTUxIoHmW94H4jNVvs1uk1Hiu/XUmnFuicVJH+lVIAz9K2gdfG4khIKQTJWjU+uN8NqyQWFSWT+UmMrBkTyOexlwIFNjlXhlJYOpYr3HcsMo3tGjfUF3A6a2AqFP/i06rqU0Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773819188; c=relaxed/simple;
	bh=i15hRlmkZ+iccn4U8JuL8xqQbQiOeqfpeox5TGqLdCE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ixwOSky3XSaBIJjcrtNko/uq1stuHbGXNB58vEDcPfZOcXwDjCol498ssQF9CO07tWWOzsO6hnYa7wC9YZNEkop96EYgf3CKRdLEuqfgyo19kDmng87U1MG+5LRdhmOL4p9D5LhTNQzU/1ll8B1zCXZvE3smIovY+tKPVhveVUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=HgiwWgX+; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773819178; x=1774078378;
	bh=EcoT+wDPxwC0iPC3au3eq0TlK6bZ7olp9+dxuMiE/9I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=HgiwWgX+DZJ3WHv7GfAzEnXRRYn0OcPb1jfWw8Vwpa028r8ptwk2xX833+MvHQtxn
	 jQPT9J2pClyME1jwdu33u/uehCvE/s58qgXhCWcBd7hzrXTOFjEXAaH8FRgmBG7rd+
	 vvuxB7BgBEpTcNImppK+f2a6bdNAB6a+jgvKK9h0Ij4qUZGsKJcFk46+pL4cYiegr4
	 RgINOp3fKTFjC9KDRovf+6ZEKcDQttUir2hYCVuSDThIyFa0t4WsV0TjmpUrgLVpQv
	 u+fHZmgwy2nH9ajOodQSfZL4EPHoJOdCT4qvYEt5QSwfdedlS4M5UHBdcFbMqIINmW
	 e1xWFqyKAW5pQ==
Date: Wed, 18 Mar 2026 07:32:53 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/2] drm/msm/dsi: support multiple DSC slices per packet
Message-ID: <20260318-dsi-dsc-slice-per-pkt-v1-0-1bd66b7f9e0c@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: ed70d1298f966ef0eb2d50a0eee5f1f015a7e2ae
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98337-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5564F2B7013
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for sending multiple DSC slices in a single
DSI packet, which is required by some panels such as the JDI LPM026M648C.

The MSM DRM change was originally authored by Jonathan Marek [1], changed t=
o
use an 'all slices in packet' flag which derives slice_per_pkt from slice_c=
ount
instead of manually specifying the number of slices per packet.

Was also split into two patches so they can go through different trees.

[1]: https://lore.kernel.org/all/20231114174218.19765-3-jonathan@marek.ca

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (2):
      drm/mipi-dsi: add flag for sending all DSC slices in one packet
      drm/msm/dsi: support DSC configurations with slice_per_pkt > 1

 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
 include/drm/drm_mipi_dsi.h         |  2 ++
 2 files changed, 12 insertions(+), 15 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260318-dsi-dsc-slice-per-pkt-f828429fbf0a

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



