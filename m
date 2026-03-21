Return-Path: <linux-arm-msm+bounces-98993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH9IBGROvmnJMAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:53:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8957E2E40FD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 08:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15B5C3048132
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 07:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306C83254A0;
	Sat, 21 Mar 2026 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="eknKBfQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782E923BCF7
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 07:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774079557; cv=none; b=P6/3gOEzTvKfYnAyIR2jQFjMMwUMpSa2YBtjOd4TVPc0m8I+A0mFUFLAi8Eq3Db3M2TIErO+WMHYhElArvKygUrws1egt3gjl46Y4c0I/fiK7YEDfYDgPwJrKe4UYNRwO5CDb1hnGknv3o0X3H94djUj0Bb0LSDS31Gk+8ehLEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774079557; c=relaxed/simple;
	bh=dD/BPKC5aT9eeNrRI4lDwbK6ytFidptagGuSLLMES4o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BmKXt7g0nVPdU+Qmhzgw3X2yrLoPGGZfdnmM0G3oKdwsHGPXzDBJP/fLffxEOaKW4D4sQpq2JLZT6C4mY106txWMMgkAYe4P7MWmyH12VyHjMVaCyIz2Z+dYIit0pB+gepi5SwRnqBlCH6JcBjr2yxKeZaCm9ioct8cFrYKjok0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=eknKBfQV; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774079547; x=1774338747;
	bh=dD/BPKC5aT9eeNrRI4lDwbK6ytFidptagGuSLLMES4o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eknKBfQVua+/Zdc28IunDljWoOvc5nliyhT01KEmw4mQkJCHjuibI0mVWrtFPKj5U
	 /OIFurwyox9ea50rPTjtymtK54ZAXDwp5CUQo13qR4+Rg8AA89rEegNDclGvAX89Uh
	 qwfAOUMsPW9GJJvsBvd1scxBgZv/YvsTLSDu4uVvVRf6QqTi7IwFcHUylP74aSwnRN
	 KHsF/iU6SALN5MbMAudKOg/KDW7aaObvYiEGZQI7UJfg6HDcW0spnyLKy/7RKoTe1O
	 /jhWDUE7ufguxkDwXv3uk2lQ/dhpIdI3KabkPaWXk/oZcdA9EZHU9puwoWt3BBxWzE
	 YTrzGp/BRdFaA==
Date: Sat, 21 Mar 2026 07:52:19 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 1/5] drm/mipi-dsi: add RGB101010 pixel format
Message-ID: <20260321-dsi-rgb101010-support-v4-1-eb28ecebbfe8@pm.me>
In-Reply-To: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 776e05140780a2062676c01f53cd0cd9a48b1f1e
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98993-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 8957E2E40FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add MIPI_DSI_FMT_RGB101010 for 30 bit (10,10,10 RGB) pixel format,
corresponding to the packed 30 bit pixel stream defined in MIPI DSI
v1.3 Section 8.8.17.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 include/drm/drm_mipi_dsi.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3aba7b380c8d..a822e9e876af 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -140,6 +140,7 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(str=
uct device_node *node);
 #define MIPI_DSI_HS_PKT_END_ALIGNED=09BIT(12)
=20
 enum mipi_dsi_pixel_format {
+=09MIPI_DSI_FMT_RGB101010,
 =09MIPI_DSI_FMT_RGB888,
 =09MIPI_DSI_FMT_RGB666,
 =09MIPI_DSI_FMT_RGB666_PACKED,
@@ -235,6 +236,9 @@ extern const struct bus_type mipi_dsi_bus_type;
 static inline int mipi_dsi_pixel_format_to_bpp(enum mipi_dsi_pixel_format =
fmt)
 {
 =09switch (fmt) {
+=09case MIPI_DSI_FMT_RGB101010:
+=09=09return 30;
+
 =09case MIPI_DSI_FMT_RGB888:
 =09case MIPI_DSI_FMT_RGB666:
 =09=09return 24;

--=20
2.53.0



