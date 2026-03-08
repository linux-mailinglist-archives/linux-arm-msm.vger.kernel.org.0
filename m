Return-Path: <linux-arm-msm+bounces-96018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLiDHh8grWlcygEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 08:07:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1765F22EDD9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 08:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5A5B93006B48
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 07:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B5E332633;
	Sun,  8 Mar 2026 07:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpAKOAcL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247272D73A0
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 07:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772953629; cv=none; b=eMmkj3AnlMn7znTHxvxB82oZBysiEqypN0ltmQfyKSaTEf9XZoW0GeLBKS1KgIcTd5LvAHzZPeYpr2vVdkjiYG4aNIxiVNrasJ/Lqbf7NzvJwrQ92EkBik7GF16+jkxjyIbnrCq/aPafczTwyyJ5xtA+wZVkgLr6EntKDSX/jzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772953629; c=relaxed/simple;
	bh=d/aIafMJCdEMM7WRjiEliPE5eNxA6uu0vaLDPne0sb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GWlalyFFuwh/87x/1cWyRjD5Y/DqBqmsICpwGLVq9zjL2HkThch9siEVYKq+9FpZ/sYw/DP1fUmyBTbnutQQDXRKclRmvGDXsx3bRxNXKdtykUYB/cpDe3dt+yFcx0IQSTci6TXvr79OWx3uCcGQNzXYh2nEzhsUU6eVUtzElbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpAKOAcL; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c738b98bfd9so1512125a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 23:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772953626; x=1773558426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFLfW5Q1Ig6hjSxU05JacS616Nm8ZTLRMtzhmvCENQY=;
        b=MpAKOAcLwPs7zoIJaMS3By/tsr3nM0z7Bmz1sBpEMRFj67A+tzZ+uAPJSNQXofdYJG
         ZM8QzIuQEMSDXmRxGUspYrRkxXLsy4CI9wvVoQZTlyiLz3APffcXZChRFCtT7l8R+t4P
         553SsG/Md2pdo7FSEn3fIVAFbSuMaVtiMcralNnrXMJr9/nUO3/C2zh+Yb9WolLw6Xzn
         pMksLShQlr+vn7g7EKTVZSPIc8I0PSvcXWvvDvY9EfL7TENlpj0XsSZpbPfoSb3GF4Bj
         JXEw1kBsML0JqWMnXkMbZhtoYe2U1G6NfTWbcF+WXTPp7xxNKv0JSYU1Ic8LGwkGFZiO
         m4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772953626; x=1773558426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFLfW5Q1Ig6hjSxU05JacS616Nm8ZTLRMtzhmvCENQY=;
        b=fJ22o879GTIkMe4OU5OaMVLCVkvQsiXHGAfHez/hhlRICUguo5tWPQ/nUQaKrcm8hO
         hNzMODMkHUMv3pec4fVmGpNtwpyofBir4O6zs1/MFdGWu7HnBnM/elk6cOuVTlRf3q9z
         fUkfwkuJ1RTIUTf9VUhjpcUgyowgBxNiYfxgY40gP1OduNAagcnRBaeQnnKzfPd5NWsn
         51VQvlgaasxuAq3HaOBPKrMz6rXZ7nYEQI+EMLdUIL+E+JqIC9mIqKR8TFckeq7NgC0f
         RubuvB4DTU3cH1pf+lJUqlgfnbevYWTYI1Cm/JAffO6INFuC0q7lMirzbIt6/z06YCCi
         tWLA==
X-Forwarded-Encrypted: i=1; AJvYcCVWS9U9ES1de1C4CSDr7t5tdDJuRJKEI0w2Fvf7z2vIDsbM9lHwYpXIMY6jRVj2GVsAnAFPX8KF7iW+5Mz4@vger.kernel.org
X-Gm-Message-State: AOJu0YwawoQiKvAjtFkB2uNZsNyG35yauqUtl3Y88pKBen0i2uXdy6y/
	P249E7miXNthrRvKpcoPeYI9tyDR/BQz9VHZbt0l2Xpfj0ULHsnRs17E
X-Gm-Gg: ATEYQzyruNjlqlGKdfq6YnKQvWkdElOGCLW/Op2MSoqN0Q03vhgZ2r8f9DOSUnzmP8S
	d/KOk7TPD5T+xugk0jB5I+vD8lzXn6XDEwCognJltWM4Q9eHD8uxBl8kF+CV5GEmealCyUBlYmm
	mugQ/AmJ3r+F07blUIp7otBg0k5A36k/n0Ans+xdZU55Nb5zih0CmdC9oUDuWoc7LyqD7rGk1Ts
	qxH1A/gbao/b75+b5SOEk5yYDNWOOhCP7iArc9hvXzkJTfkqrtSQrRk5utime9cTJZ6NCPag5c3
	T4FCatXJFlmT6jFqXsowHT3K1YeO9SOPKMV3rYH1F12kv04INdygKyv2GG4+GUSVwNPs/Z85Jpi
	PVcYiTgaXADXjTOVZXrgm6Btw5WQMBFg6Ue+LYPEHEReVSJg6CncRV9Kyw6qJOJZ7XEh/yqThQe
	o48wlZWtMJ8AK2Wyjeh7367F0H7ho6
X-Received: by 2002:a05:6a21:6f16:b0:38d:ee4a:e82f with SMTP id adf61e73a8af0-398590d62b0mr6919892637.63.1772953626562;
        Sat, 07 Mar 2026 23:07:06 -0800 (PST)
Received: from nuvole ([109.166.36.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0a7156sm6048604a12.2.2026.03.07.23.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 23:07:06 -0800 (PST)
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/msm/dsi: fix pclk calculation for bonded dsi
Date: Sun,  8 Mar 2026 15:06:27 +0800
Message-ID: <20260308070628.482527-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1765F22EDD9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96018-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
v2: add a parameter desciption to the function doc (kernel test robot)
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 32 +++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e8e83ee61e..06f094fc32 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -569,6 +569,7 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
  * dsi_adjust_pclk_for_compression() - Adjust the pclk rate for compression case
  * @mode: The selected mode for the DSI output
  * @dsc: DRM DSC configuration for this DSI output
+ * @is_bonded_dsi: True if two DSI controllers are bonded
  *
  * Adjust the pclk rate by calculating a new hdisplay proportional to
  * the compression ratio such that:
@@ -584,13 +585,30 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
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
@@ -603,12 +621,12 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
 	pclk_rate = mode->clock * 1000u;
 
 	if (dsc)
-		pclk_rate = dsi_adjust_pclk_for_compression(mode, dsc);
+		pclk_rate = dsi_adjust_pclk_for_compression(mode, dsc, is_bonded_dsi);
 
 	/*
 	 * For bonded DSI mode, the current DRM mode has the complete width of the
 	 * panel. Since, the complete panel is driven by two DSI controllers,
-	 * the clock rates have to be split between the two dsi controllers.
+	 * the clock rates have to be split between the two DSI controllers.
 	 * Adjust the byte and pixel clock rates for each dsi host accordingly.
 	 */
 	if (is_bonded_dsi)
-- 
2.53.0


