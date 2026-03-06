Return-Path: <linux-arm-msm+bounces-95874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJx6KNYBq2msZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:33:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5721B224F3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD8CC300B9F3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F278C304BDF;
	Fri,  6 Mar 2026 16:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZMlZTBr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA4536BCF1
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814804; cv=none; b=D63E5U0qNaWaKCTPda35+WSUQ85kP1saWD9gCunuVTH/vzA8y8E34sn/NFpVBKoTVYnkcMV8bo7/pNSLul7SKK95OwINW1CYyfYbgDOZqnaWTiFe+9LbGEeXYGjaNfoCSLqcocvLmZTI21uwHco2V7N7KIM6dS62zZf7AyHsIRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814804; c=relaxed/simple;
	bh=t1t4YoDlUzSJoUjo8KmiYuwsghR6uCHf26BrU8o4d9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bYeH9h8+ldDpL8ebG9rEKS63AIokTBc6J5Bn9cItnlamAxj7yzxUnN4StKuCMPJWK7tf6cPAHlIs69MOsesiSH+1WxOaGN1M1nKtEA3CKj3xNfWXXl5WjOi2ZgTDpMT0rCPHAgl2X8DN6WTit9JoViqWuq+lgYXdLYPx1EzlJkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZMlZTBr; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-829756f3ee9so2903798b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814803; x=1773419603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fniX8oUV8n9EE4oHisFRFMjU1mIvUBscUL0mED7CFfk=;
        b=jZMlZTBrJjifjPoCwLqEgbU9eIGNSrAlkHu3PB+9+4XkB3qQQAnuY0CX3onzORv3EV
         7mDybG1r6xq7PDONBCvLYtuKr090F3P8+07vHv5p290TQtJ5h3yWSRqkVe5Eg1JFo0/C
         OAHTyMVUyjhiv5ZhQKmAc073hYFR1QIQZo9E2jrTYCSBw5K/wKeS6vcEZ9LtYOSnL6M0
         pj9njcoowtPL28GUYBI7le7sJgFFEfEnPTY1tHmq7yn9GwKP6R/xMDi8BYNidrIjHxMC
         B91GQIQrYf/biXQUZ262j84TCfTdKreg03LvdgOhXLwR5FYolilzdaivgxzlSZDucB8V
         lRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814803; x=1773419603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fniX8oUV8n9EE4oHisFRFMjU1mIvUBscUL0mED7CFfk=;
        b=Xq7ZRAZNx9ChZTclo3TmHmoi/WwcViE7vE26xdzvTFIXAFUrTBvt+6VFvCiiIgwYPy
         hh7qMBrFQMxdcXIXdcZLQlRXmRCuKJMg9xA08hh+v/c18a3lv/yJjQj14DvJuICUD2W3
         TYmZBdopkoPM/ngYp5rDPvm+0NKaofdNd/CwwSbNj93zMr+6mmeuvVIqWGG3tHY2KUWK
         ncSXyhG2wEC+34T3oadzeWgnYJs4Bp4CdSJe+msLZ1wySgLxGrc/GSHOyTiDGrbfF/Ea
         xmlzL7Vw11uGCOJ53mjNfrgCHdXGe3BJjGNRs5Vv9e+0Ulb3MwN7/dQBO8sdZX9luQF9
         nSgg==
X-Forwarded-Encrypted: i=1; AJvYcCWKETKAMq8DbE5mviO0vKW0rv6L7AcNDr4CJmNLTpL8k8ax9zEl/cHoI1QANO2s0rFVFpmWDez6iDLGz6Gk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2gjhmOSyyuHaXdudyuwPVb5a82mI3y9XpoiSjNBFC5Hn9hMpH
	JMxfcULbZ6E+yAF45VBlmdPfpOFkGG/oND3mPzcTWbW9iLDd8WaMsFoW
X-Gm-Gg: ATEYQzxHtmAXG5MsgZFs9zxkd4IAqWsS7ain+g2HZGHDZRCmoTWKVtZzmZla1Nx2iS3
	xAE5d7opJQESxO5vRqBz/+bk53CSC+OShFOcWeFXuOc5gxEsDI/ZNqKuVeXbgJn+r+4uDu92oL3
	4Hw6aQdqn2L9J94tBeZSOnQZaS3O7sOAeIJpr+OQOXCXKDr9k4HeJuaRfITcB9FYzL39llIx8zW
	5lDQERMRlyfNVHDGhnmsY8DovFaWt6E1sD3L/dz9PAnnNZsB4wVAjjKi0HomQKV3/atEZFcVBzA
	RLEzmpfhI3Ug+WborTegwZ8yWRJ8IcF/bCQIIV3fztaok94Q2tlypJMTzrCDDqezhibpe8+N3IH
	7hhBL3tsPP6oau1JZVyyF1OlYS8kbX8nkGp/Y/YJjAt2Cp1C2FzVIeq8oml9k1SyiUEbQR3rVxH
	5sTWTbL6SD8RvVm23zeQ==
X-Received: by 2002:a05:6a00:1408:b0:824:93e4:2de1 with SMTP id d2e1a72fcca58-829a2eaed31mr2478705b3a.30.1772814802771;
        Fri, 06 Mar 2026 08:33:22 -0800 (PST)
Received: from nuvole ([109.166.36.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4676187sm2786788b3a.27.2026.03.06.08.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:33:22 -0800 (PST)
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
Subject: [PATCH] drm/msm/dsi: fix pclk rate calculation for bonded dsi
Date: Sat,  7 Mar 2026 00:32:38 +0800
Message-ID: <20260306163255.215456-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5721B224F3F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95874-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.981];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Recently, we round up new_hdisplay once at most, for bonded dsi, we
may need twice, since they are independent links, we should round up
each half separately. This also aligns with the hdisplay we program
later in dsi_timing_setup()

Example:
	full_hdisplay = 1904, dsc_bpp = 8, bpc = 8
	new_full_hdisplay = DIV_ROUND_UP(1904 * 8, 8 * 3) = 635

if we use half display
	new_half_hdisplay = DIV_ROUND_UP(952 * 8, 8 * 3) = 318
	new_full_display = 636

Fixes: 7c9e4a554d4a ("drm/msm/dsi: Reduce pclk rate for compression")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e8e83ee61..db6da9937 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -584,13 +584,30 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
  *  FIXME: Reconsider this if/when CMD mode handling is rewritten to use
  *  transfer time and data overhead as a starting point of the calculations.
  */
-static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
-		const struct drm_dsc_config *dsc)
+static unsigned long
+dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
+				const struct drm_dsc_config *dsc,
+				bool is_bonded_dsi)
 {
-	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
-			dsc->bits_per_component * 3);
+	int hdisplay, new_hdisplay, new_htotal;
 
-	int new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
+	/*
+	 * For bonded DSI, split hdisplay across two links and round up each
+	 * half separately, passing the full hdisplay would only round up once.
+	 * This also aligns with the hdisplay we program later in
+	 * dsi_timing_setup()
+	 */
+	hdisplay = mode->hdisplay;
+	if (is_bonded_dsi)
+		hdisplay /= 2;
+
+	new_hdisplay = DIV_ROUND_UP(hdisplay * drm_dsc_get_bpp_int(dsc),
+				    dsc->bits_per_component * 3);
+
+	if (is_bonded_dsi)
+		new_hdisplay *= 2;
+
+	new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
 
 	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);
 }
@@ -603,7 +620,7 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
 	pclk_rate = mode->clock * 1000u;
 
 	if (dsc)
-		pclk_rate = dsi_adjust_pclk_for_compression(mode, dsc);
+		pclk_rate = dsi_adjust_pclk_for_compression(mode, dsc, is_bonded_dsi);
 
 	/*
 	 * For bonded DSI mode, the current DRM mode has the complete width of the
-- 
2.53.0


