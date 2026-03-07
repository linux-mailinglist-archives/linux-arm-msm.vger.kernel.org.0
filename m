Return-Path: <linux-arm-msm+bounces-95950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KLjGmAIrGkWjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:13:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF7F22B5EB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0CED301C3DD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FFB3491F4;
	Sat,  7 Mar 2026 11:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+TziRSE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDB428314C
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772882012; cv=none; b=X1xo1bPbObpEXFeihSQeh3vj5dXa5tMjgeh5enphm1HgDJa6JH9+phDQfOWrXQC6HB0O9sEv7dQcnm1a9rcgbV77t9SUeigHQ1WHdoYPieufOWEjMLYIReHAYeolZloK39Z/OdtHWGj8nh/A+l7fcn4o+UIubK098m7dNjvpk1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772882012; c=relaxed/simple;
	bh=RdZMesHQHKMfD03vhRx8i9Hfe9ddar8z0zHf8d3CJr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FB+LvYnWy7M4KJjr/UF1jncHQQczJV7zhD20OEsMBJl53IhSi1IYXDEujUQK5vfT5c2zmIee4LEI0aw6gI7yefcAy7eEVWmRr7TKAnAqclgEv2I5PAEenB9i+7FROTpUPGv7Q4ftQNi9MqiEmbSzmbLZ9uh8XZISHdeq37B2JiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+TziRSE; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-359a5d8b3f8so2537975a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772882010; x=1773486810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/gabd+hFXfCNsaU4VsDDssNuV3/DePYzj6ege99XJmg=;
        b=O+TziRSE3BzJ4oepyUrWjt/hv5Q4FTdXlSoz6Lg/CfB9dX115QKoWqdXiODl3AeBrG
         sR8ovQW7DpKTzQWiKWzP0w3rsqVAOxC3NejK68HYXFN4AqlmunKlPEZqRQOnRdnsxhaj
         j9X+g+EMiSf2J/nzWICMefyHLJAsZZDCWjIfZepjqvPL/nbxS3vnls0GVGP2rB43jyI5
         Ia2n1m7+TbEYcGr2BeGMJM9ELlTf0yOTTjEPXpo1oKyHspOuGMnNAv0dyg+UuWtmlyXy
         NyYJyPn7V7ET6srpVrqaSgc8G/T5bfBmyVk/ut1kQB/7tt0heG3ZBsRVu7HRvh9YeKpc
         +hYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772882010; x=1773486810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gabd+hFXfCNsaU4VsDDssNuV3/DePYzj6ege99XJmg=;
        b=eed251izhfNDs+OQeb4uq9U2QUvZVfn+7S9nuKG/jKzsOmfWsY/BruXGzgx7LTtJDb
         40BJlrz9H5RPtXufp4KqfkejDVzIuqgclZzePnGxlHqrFYcaRs0y0drlSC6hKc1oiOoQ
         texZmGUK/UwbRkaUxxKDUThlsGCWlKJSajLQDaxCHQrM9R237Zljsh1XTdOVmDQRmugj
         c13B/fpYPppP0w7vRWyOwzzKCsrXOd+nOOpMV0iEqYvp4bQQtf6KHB1lzAljV6W470wH
         NwStl4PgC+Kjc4WUsy9NHgZ+hgcDwwDalkNsqE1whP+BodZyyeqtAyKMsZ1NlSIenStM
         uTcg==
X-Forwarded-Encrypted: i=1; AJvYcCUNt7PCaw1y6JVkubwG4kAY6jYdBcYIuUC5srDJLWPyvZJeie4c5N4OGceGNOsHhKJ6uETl4TEWJhW59kmH@vger.kernel.org
X-Gm-Message-State: AOJu0YwYyEvrRI1oJ/2ezAy1T64Ez8veCUhwCPFcir3xV2MUffLg6fYM
	2YpJxD8n+D5fy7MU8c3xDQlxU6twRmajywll3xwaipe1rJkwuOXPdEIR
X-Gm-Gg: ATEYQzyJaXWQN28ktprmVH4FzOXy4taUtVv3x5asAeVVppwaFji3WopzslNK+iyJ5/y
	WZeaw+SDQ1YpBkahyQwJ+z5irbXgqk/X6VO7YsK+A0DofYiaLV2ewd3iMgYg4NP3VIg53u84YzB
	hKlrzWXOAK57ieeaiT6kB7yRU1uy0ZITZMNI6arllcXUd6BDju+dmI36kGW2zlGZPXYqXFMy8ML
	OX8TaLOo7vLZkqLeODP9uT0wKpl29HMiGTM97eRbXYqHuy9O4dvDT8Htcvlw7Zev61a1mbuzSCS
	O1PHErwCEXLFs1dEgB13L6Flpe1afQ2TZkqPiW9CDaZoqVOZhIM/R4zp3zoFT8MObFdfPZulM/G
	Nb2rpioVjVdtDIsf5vuvePQjYZhgBAG9zlmLgi4cbk6tcxmbtYMkUWvblwayBEy5MCFbeI2qgBV
	lDSYLCu6quPI2M4AJR1Q==
X-Received: by 2002:a17:902:ea11:b0:2ae:54ad:6057 with SMTP id d9443c01a7336-2ae82476956mr55642665ad.44.1772882010239;
        Sat, 07 Mar 2026 03:13:30 -0800 (PST)
Received: from nuvole ([109.166.36.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f74e7bsm47350265ad.46.2026.03.07.03.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:13:29 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/msm/dsi: fix bits_per_pclk
Date: Sat,  7 Mar 2026 19:12:48 +0800
Message-ID: <20260307111250.105772-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5DF7F22B5EB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95950-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.980];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

mipi_dsi_pixel_format_to_bpp return dst bpp not src bpp, dst bpp may
not be the uncompressed data size. use src bpc * 3 to get src bpp,
this aligns with pclk rate calculation.

Fixes: ac47870fd795 ("drm/msm/dsi: fix hdisplay calculation when programming dsi registers")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e8e83ee61e..7c16216e8b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1030,7 +1030,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 */
 		h_total -= hdisplay;
 		if (wide_bus_enabled)
-			bits_per_pclk = mipi_dsi_pixel_format_to_bpp(msm_host->format);
+			bits_per_pclk = dsc->bits_per_component * 3;
 		else
 			bits_per_pclk = 24;
 
-- 
2.53.0


