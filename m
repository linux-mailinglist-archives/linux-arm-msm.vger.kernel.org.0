Return-Path: <linux-arm-msm+bounces-92849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ9JAN5TkGmbYgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 11:52:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBA613BB83
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 11:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06E8B301E3E2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 10:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859ED23AB9D;
	Sat, 14 Feb 2026 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThNAItQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6365727F01B
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771066331; cv=none; b=ZZ+2TzAAEowy0xM3h7clyG0J1ENRpDc/lfQwKU9jOQ3CMblBLSPj1fW+EY5qg8ikv+ZK921J/3H0JWSoYHOof4SmnpE2FKntG/SJ/daN3c8CdsrjTZ7rRnHmV3t5NlLUaRoSQg2aDKbZf7xRAPuPsuf5u6cfzpKfb94J9qE9t28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771066331; c=relaxed/simple;
	bh=YiAWjtF5F+BeqM8dAL7EDViKESs32lSq/+jF78Kgzvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NqlzzAorkH9HOL6kTmwXt8d/7eI/F2yAba2fKfd7zmR+lTZT3jkGA4QUmrnmal8oEPKntDgOMh1pRP7q6Y6j8is53p83wMvua1KfbaoxAdJblw3prCAr0/rH8OGyAaqn9ZiHqdJwlM2zFievJ+/+ALLh0Dg+5voCbPJqsWItkVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThNAItQZ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-823081bb15fso964860b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 02:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771066330; x=1771671130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JKZRzgUme6pMax6EEp9xxfwcIn80zii3ZHbrvX9cB3c=;
        b=ThNAItQZL9vc7VmWR0IreWPKNs+EfSAwOP8IrNt8fXA7+mj56kx4nIbAHAKnRhPE6I
         SmbV2+Jet9qtAq0To+qoipiVdhr+I61x2pxp9LrsGRxlmCP01UKq+UVNgxTw322TJ4r2
         5CLemLMyXTYBsnY8hUTTCH6CRac4tNsO6JscXzADwWXt3i8HAH34WAK2PLEnrunN95jI
         hRwy+4EzTOKUWtTxQQuFFA47/Hkcvic05LVY+AdqU21JPbStbRK4yZz/MZ63r5rJA9C2
         mLsnPpFgCAc/pzcD8Z64ZUIqituq/UbWLfBnZla1TJA4aJjZ52vQv9qQCxWy6juG9vXy
         92gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771066330; x=1771671130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKZRzgUme6pMax6EEp9xxfwcIn80zii3ZHbrvX9cB3c=;
        b=O+oWYE3Msm2jp82tpqxJnAGpSPMXVBgAsYmb4FKFyCgLGwHQLyCpjjEq6bO8GOnl1J
         6e5H/W/qnExOjBwpxcNzfOcfzLBu5KuNhP3KAVS/Vbjt95rqR80YU+gxMwXEMgTv6Rwh
         0tM4rm65tH68+ANs91W2gFsGZBFBDuGH6UcY5DUa/dEbQLGMuAK+lIJoBiOf3kiSHurq
         EGEaRgsoyJIw9aXpUD8Ve1djfKzrHUgIcFI80ZnTSRgBqttN+XsTQHIUcV6arvkpyoUs
         Xd6XPC94nwXByg98tMvLt7k87K3+j2ODfzM1SZ9UPEVP02GyKVZhkl1NfaW7L+BV+09U
         rVDA==
X-Forwarded-Encrypted: i=1; AJvYcCW1IcvzLPz/LuWutGwys/9Nf6cm50rMr7iofkhafvxMRrJzb9BpyJQuSc4yihd+bRGf7BSOrDR/+zFgHQQu@vger.kernel.org
X-Gm-Message-State: AOJu0YxLVmqdrfOwuVW79HZq4byfg5cJIH4Vflr6nEQJeNFwUT8rRT4c
	swx78VVOinxdNI+cBGJItu61IdaDfWFrNgC6Y4LaqbJ4o3iYdbX3bvXAvxCKLJzQX2E=
X-Gm-Gg: AZuq6aLfRI7rktc8qhG4m/xZMcaHw72DQewbrJBETGQlBQrrVoYNsoUiTL2V/mcYI27
	l7zwHkt55cmP7ro2Rk3aYc3U9IRQa4mrtXYYsE3dwuFTuUr0FIFDGDovvAi9TlfPX7tOJMOe4ln
	TWHXm2vryLH7VY4H1oMhNjuzVdRh7SzNKKOOcqfZhDWvo8UvGUYjhH9AY2i2xI1uxkYD6reHnbe
	A5+mZDWHHC58/ffIgMx+FAkJY4CgB8Y2O0XyPwj184WLQe24YDAO1zEqOzeOpNlBi8+uQb+Hdrs
	gYl1N4U9NuFcZQdynUQ8NZszFXfYtwCxWkJyQBQN3gjyI0Jd1vGeanOVnk4kXUq53Q0zCQWwyW+
	mVOWsNnnCmHbRso9ulcs90v70Y9vkxqmjnj1nZ+js21jXgWzHgD09bwRekRlNzmhCN3FGlr+QlT
	lXM0F9NNlb0ZSpXv/r
X-Received: by 2002:a05:6a21:1798:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-3948376c311mr2406124637.12.1771066329667;
        Sat, 14 Feb 2026 02:52:09 -0800 (PST)
Received: from nuvole.lan ([2408:824c:a13:29e0::c83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6f9d34sm18436865ad.11.2026.02.14.02.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 02:52:09 -0800 (PST)
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
Subject: [PATCH] drm/msm/dsi: fix hdisplay calculation when programming dsi registers
Date: Sat, 14 Feb 2026 18:51:28 +0800
Message-ID: <20260214105145.105308-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92849-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4FBA613BB83
X-Rspamd-Action: no action

Recently, the hdisplay calculation is working for 3:1 compressed ratio
only. If we have a video panel with DSC BPP = 8, and BPC = 10, we still
use the default bits_per_pclk = 24, then we get the wrong hdisplay. We
can draw the conclusion by cross-comparing the calculation with the
calculation in dsi_adjust_pclk_for_compression().

Since CMD mode does not use this, we can remove
!(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) safely.

Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e0de545d4..e8e83ee61 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -993,7 +993,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	if (msm_host->dsc) {
 		struct drm_dsc_config *dsc = msm_host->dsc;
-		u32 bytes_per_pclk;
+		u32 bits_per_pclk;
 
 		/* update dsc params with timing params */
 		if (!dsc || !mode->hdisplay || !mode->vdisplay) {
@@ -1015,7 +1015,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 		/*
 		 * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
-		 * enabled, bus width is extended to 6 bytes.
+		 * enabled, MDP always sends out 48-bit compressed data per
+		 * pclk and on average, DSI consumes an amount of compressed
+		 * data equivalent to the uncompressed pixel depth per pclk.
 		 *
 		 * Calculate the number of pclks needed to transmit one line of
 		 * the compressed data.
@@ -1027,12 +1029,12 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		 * unused anyway.
 		 */
 		h_total -= hdisplay;
-		if (wide_bus_enabled && !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO))
-			bytes_per_pclk = 6;
+		if (wide_bus_enabled)
+			bits_per_pclk = mipi_dsi_pixel_format_to_bpp(msm_host->format);
 		else
-			bytes_per_pclk = 3;
+			bits_per_pclk = 24;
 
-		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), bytes_per_pclk);
+		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc) * 8, bits_per_pclk);
 
 		h_total += hdisplay;
 		ha_end = ha_start + hdisplay;
-- 
2.53.0


