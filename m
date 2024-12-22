Return-Path: <linux-arm-msm+bounces-43085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 599279FA80E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 21:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CC03188667A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 20:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322CB1A4AAA;
	Sun, 22 Dec 2024 20:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eiV9BzbM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9013219F49E
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 20:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898467; cv=none; b=Q4QfBGDh674UKpUMiFq57K2vA42KoOyWGsap8XIxn0X4v7e3q6U4DL1VlRNlWiZAOuPy3QNO3GZfJEJl7Nqc/6pZUR9Y1tAU+keGNEN6KNXnU1tLt1zZueC/CgtuZaY6nRRR+YD6o6Zci0JlQZ0Cbf7b3210WjgUESSbezrlAIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898467; c=relaxed/simple;
	bh=QaeFA19YS2jfxVx09K9jWa8V49SVXU29ySDEDp6kdTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ej0SzzKW1s3onDzo1ImCjoT+bAPRVr8EEtVxcqRcPZD+zv0OQ3nWErJ9WElAHqwQ+uBdWTRS9ERAW0TENfxTUhAZt6+w0LbZxe50XYvkW03jDtGepIDqcxYn4JrTGfe9TMO4bFIoHf1QievLmzrJWs1DMM/L5p1oO9coA4Pqugo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eiV9BzbM; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54024ecc33dso4357524e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 12:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734898463; x=1735503263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNnNt1jvOPv1nK8CzBlUaOPEaWgU6dkT1XhtNjPmq5w=;
        b=eiV9BzbMmJVhIqXXXBYrtimvhgn4vfZb4JE8jeuwX8yk+e0iPBQj9fQOLIJ28wrNvT
         y47CSMJcPPgSHqI8W3EbCvTUF8LDFBblCN0lrULChxn1jovwwdPKTWXwrkeNWc4p5Nsu
         DmPd0OTsZOKaAo3fVTzdZGThg9qwATf2DuU28klt7gC9eMK4EXFky3u5oz/lZzd6dcQr
         9eC/t0w/oKZAyQuR5lgU4FF/n+VYWmDItc7mc7mwmWXqMkydCDU18PV4XtUsf2PIsIzO
         H/dolwUXGUeU4ZIOWf8t8+dcUc1eLuCyDYt4pdxrgUabLRY6LkEjjMo3JsACHxbYvkLw
         X5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734898463; x=1735503263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNnNt1jvOPv1nK8CzBlUaOPEaWgU6dkT1XhtNjPmq5w=;
        b=tLf1ReXkNgNttr5Guz59IrwARnwO99Ab/0PgUcQYME1vihRyxpnZ69SdUX5THq67iy
         6ACAAlxej6uerBq6P+JLmVBJHmUTONh16lRBvrL8uk0ySpwLIgI+AIeJ5s/OXq93Ul0H
         ZuP1Cm5eExwyRLDFBeTkvP7iuc2wVErnDh/okfxlJs0qI3r5nHEPBNwKxxPqghMa7RM+
         hpxIml+Vsf9R+0D3j/Qc7oH3cRl9WDzNVJoQTaeePbDBz3iem6HI8G32w/4ylDhr+prP
         3YvIyT47r2fwO2oiwnzSrIsNm1sf/1wu6MJtsY+jpK54QaXN5D/aPzvG4B2qIuHLFhOx
         DIRg==
X-Forwarded-Encrypted: i=1; AJvYcCXyI70+ILc7Z1//pxd1iF2meIOJ4UxG+dXly+qQ+cxBL57rx1/Oy/m90qamvzeLHve/Bv78g+2rG8DEPdav@vger.kernel.org
X-Gm-Message-State: AOJu0YzdBL9sDLzw3SqMkyToNerIxOcVMhc/gmzzuOpNhDkEvRs4C3R/
	nBR1744WD+m6Op/s8E3rgtW5txBrkfRTro731/tfaPz1NeuJkoEur9VGKOFkMuc=
X-Gm-Gg: ASbGnct50GMHX+8nUpbfHFGfKLLzyuY57/fOb2kRz/RXqnQv4nJKC2CFP/5eFh/isfa
	YDUT2Z7lo9WclyIzJZjLyD0hu5BUrYv9jur1o2NXZvMDbzqWHeFGAoJGNaEJp3MRlTVOb61jl7M
	HFOY2ClgYxg6xGCJCt+oQDTFKAupS2EczrpN/ePts0mwX1ObunJJf14Q/h6q/OBSOzuwwFALuYl
	LKBzNXCmsBjsApHxvDeQCF87vHJZrK8qD7zSAj6ouh5P6hoMgfaVr0Uvaa+7hcL
X-Google-Smtp-Source: AGHT+IGk2U9e99w2p8Z7e9I8d8y0d4yqXgn7TeX6L4bswmtnThIoUdMwRsekI9w+dQ9bq3YuyK+Nfw==
X-Received: by 2002:a05:6512:12d1:b0:540:1b41:c765 with SMTP id 2adb3069b0e04-54229598b36mr3284542e87.56.1734898462691;
        Sun, 22 Dec 2024 12:14:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 12:14:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 22:14:09 +0200
Subject: [PATCH v5 06/11] drm/msm/dp: move/inline panel related functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-fd-dp-audio-fixup-v5-6-370f09492cf6@linaro.org>
References: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
In-Reply-To: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22430;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QaeFA19YS2jfxVx09K9jWa8V49SVXU29ySDEDp6kdTU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaHMOBkUA6lXZS+FBF9H+A2LnfiRi7ku2MRg6r
 8ghFEvCDjiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2hzDgAKCRCLPIo+Aiko
 1XRZB/4zvtWd3jL3pjj9cjk/sdI2dyF49oaQRmzGE1s/addk5zfESxs/QXfVIc8NzBlX1gq9mfl
 TcP/jKBDxdEszH8jr815WVeyswTGb+RjZKF77EiptE/S0pxO6fYNlXzunnsZnbwhfDTEufW4s/g
 1HMmUPPMGc8uiVWw9ScWdr9siiJ3b284yAGwquzHQptuMmUl/bIb1ihu0bdPSBynx+/Hao4FH33
 4Bfmk+eqCBr3QQsSrq/a55cq9H1PeZAtyIq/spdMD4z79aJAA4pj56xuNDBwgdlMu4mZ7qYk6CF
 le/u2wyUqhEkiOzwZYVAhOTr8UdF7p9UQWFIBQaURI8PNfbu
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move panel-related functions to dp_panel.c, following up the cleanup
done by the rest of the submodules.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 195 ---------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  11 --
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |   6 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 209 ++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_panel.h   |   5 +
 5 files changed, 206 insertions(+), 220 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 10dfbe94b627855b5a0e3cd4a3d77498d8d43ab8..e9db5585c1325fe5e067526f567e39387d5a4f47 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -23,8 +23,6 @@
 #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
 #define DP_INTERRUPT_STATUS_MASK_SHIFT	2
 
-#define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
-
 #define DP_INTERRUPT_STATUS1 \
 	(DP_INTR_AUX_XFER_DONE| \
 	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
@@ -590,199 +588,6 @@ u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog)
 	return msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_READY);
 }
 
-/* panel related catalog functions */
-int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 total,
-				u32 sync_start, u32 width_blanking, u32 msm_dp_active)
-{
-	u32 reg;
-
-	msm_dp_write_link(msm_dp_catalog, REG_DP_TOTAL_HOR_VER, total);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
-
-	reg = msm_dp_read_p0(msm_dp_catalog, MMSS_DP_INTF_CONFIG);
-
-	if (msm_dp_catalog->wide_bus_en)
-		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
-	else
-		reg &= ~DP_INTF_CONFIG_DATABUS_WIDEN;
-
-
-	DRM_DEBUG_DP("wide_bus_en=%d reg=%#x\n", msm_dp_catalog->wide_bus_en, reg);
-
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_CONFIG, reg);
-	return 0;
-}
-
-static void msm_dp_catalog_panel_send_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp)
-{
-	u32 header[2];
-	u32 val;
-	int i;
-
-	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_1, header[1]);
-
-	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
-		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
-		       (vsc_sdp->db[i + 3] << 24));
-		msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_2 + i, val);
-	}
-}
-
-static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 hw_revision;
-
-	hw_revision = msm_dp_catalog->hw_revision;
-
-	if (hw_revision < DP_HW_VERSION_1_2 &&
-	    hw_revision >= DP_HW_VERSION_1_0) {
-		msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x01);
-		msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x00);
-	}
-}
-
-void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 cfg, cfg2, misc;
-
-	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
-
-	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
-
-	cfg |= GEN0_SDP_EN;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
-
-	cfg2 |= GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
-
-	msm_dp_catalog_panel_send_vsc_sdp(msm_dp_catalog, vsc_sdp);
-
-	/* indicates presence of VSC (BIT(6) of MISC1) */
-	misc |= DP_MISC1_VSC_SDP;
-
-	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=1\n");
-
-	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
-
-	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
-}
-
-void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 cfg, cfg2, misc;
-
-	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
-
-	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
-
-	cfg &= ~GEN0_SDP_EN;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
-
-	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
-
-	/* switch back to MSA */
-	misc &= ~DP_MISC1_VSC_SDP;
-
-	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=0\n");
-
-	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
-
-	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
-}
-
-void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
-				struct drm_display_mode *drm_mode)
-{
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-	u32 hsync_period, vsync_period;
-	u32 display_v_start, display_v_end;
-	u32 hsync_start_x, hsync_end_x;
-	u32 v_sync_width;
-	u32 hsync_ctl;
-	u32 display_hctl;
-
-	/* TPG config parameters*/
-	hsync_period = drm_mode->htotal;
-	vsync_period = drm_mode->vtotal;
-
-	display_v_start = ((drm_mode->vtotal - drm_mode->vsync_start) *
-					hsync_period);
-	display_v_end = ((vsync_period - (drm_mode->vsync_start -
-					drm_mode->vdisplay))
-					* hsync_period) - 1;
-
-	display_v_start += drm_mode->htotal - drm_mode->hsync_start;
-	display_v_end -= (drm_mode->hsync_start - drm_mode->hdisplay);
-
-	hsync_start_x = drm_mode->htotal - drm_mode->hsync_start;
-	hsync_end_x = hsync_period - (drm_mode->hsync_start -
-					drm_mode->hdisplay) - 1;
-
-	v_sync_width = drm_mode->vsync_end - drm_mode->vsync_start;
-
-	hsync_ctl = (hsync_period << 16) |
-			(drm_mode->hsync_end - drm_mode->hsync_start);
-	display_hctl = (hsync_end_x << 16) | hsync_start_x;
-
-
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
-			hsync_period);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
-			hsync_period);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_HCTL, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_INTF_DISPLAY_V_START_F1, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_POLARITY_CTL, 0);
-
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TPG_MAIN_CONTROL,
-				DP_TPG_CHECKERED_RECT_PATTERN);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TPG_VIDEO_CONFIG,
-				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
-				DP_TPG_VIDEO_CONFIG_RGB);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_BIST_ENABLE,
-				DP_BIST_ENABLE_DPBIST_EN);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TIMING_ENGINE_EN,
-				DP_TIMING_ENGINE_EN_EN);
-	drm_dbg_dp(catalog->drm_dev, "%s: enabled tpg\n", __func__);
-}
-
-void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
-{
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_BIST_ENABLE, 0x0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
-}
-
-void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog)
-{
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_DSC_DTO, 0x0);
-}
-
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index d120a4872d444a4f8eb1e638d0e293033bf1334c..60f08fe888cb110e3fc3dfb1d763a57bd5bf47f6 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -148,17 +148,6 @@ void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
 				u32 pattern);
 u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog);
 
-/* DP Panel APIs */
-int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 total,
-				u32 sync_start, u32 width_blanking, u32 msm_dp_active);
-void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp);
-void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
-				struct drm_display_mode *drm_mode);
-void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
-
-void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog);
-
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index b9c461fee96f8fae9259ce03a32e1155b42d17bb..9c8619f96772cb80d2ac7ea1169279db6b9da836 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2011,7 +2011,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		pixel_rate_orig,
 		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
 
-	msm_dp_catalog_panel_clear_dsc_dto(ctrl->catalog);
+	msm_dp_panel_clear_dsc_dto(ctrl->panel);
 
 	msm_dp_ctrl_setup_tr_unit(ctrl);
 
@@ -2037,7 +2037,7 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
+	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
 
 	/* set dongle to D3 (power off) mode */
 	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
@@ -2092,7 +2092,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
+	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
 
 	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 92415bf8aa16655a6cf4f7d6f8a5896275edf001..2b6a41ec8f6589c9629160f989a3a54f2d0c68d5 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -4,6 +4,7 @@
  */
 
 #include "dp_panel.h"
+#include "dp_reg.h"
 #include "dp_utils.h"
 
 #include <drm/drm_connector.h>
@@ -11,6 +12,8 @@
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
+#define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
+
 #define DP_MAX_NUM_DP_LANES	4
 #define DP_LINK_RATE_HBR2	540000 /* kbytes */
 
@@ -242,9 +245,87 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
 	}
 }
 
+static void msm_dp_panel_tpg_enable(struct msm_dp_panel *msm_dp_panel,
+				    struct drm_display_mode *drm_mode)
+{
+	struct msm_dp_panel_private *panel =
+		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+	struct msm_dp_catalog *catalog = panel->catalog;
+	u32 hsync_period, vsync_period;
+	u32 display_v_start, display_v_end;
+	u32 hsync_start_x, hsync_end_x;
+	u32 v_sync_width;
+	u32 hsync_ctl;
+	u32 display_hctl;
+
+	/* TPG config parameters*/
+	hsync_period = drm_mode->htotal;
+	vsync_period = drm_mode->vtotal;
+
+	display_v_start = ((drm_mode->vtotal - drm_mode->vsync_start) *
+					hsync_period);
+	display_v_end = ((vsync_period - (drm_mode->vsync_start -
+					drm_mode->vdisplay))
+					* hsync_period) - 1;
+
+	display_v_start += drm_mode->htotal - drm_mode->hsync_start;
+	display_v_end -= (drm_mode->hsync_start - drm_mode->hdisplay);
+
+	hsync_start_x = drm_mode->htotal - drm_mode->hsync_start;
+	hsync_end_x = hsync_period - (drm_mode->hsync_start -
+					drm_mode->hdisplay) - 1;
+
+	v_sync_width = drm_mode->vsync_end - drm_mode->vsync_start;
+
+	hsync_ctl = (hsync_period << 16) |
+			(drm_mode->hsync_end - drm_mode->hsync_start);
+	display_hctl = (hsync_end_x << 16) | hsync_start_x;
+
+
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
+			hsync_period);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
+			hsync_period);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_HCTL, 0);
+	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
+	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_POLARITY_CTL, 0);
+
+	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL,
+				DP_TPG_CHECKERED_RECT_PATTERN);
+	msm_dp_write_p0(catalog, MMSS_DP_TPG_VIDEO_CONFIG,
+				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
+				DP_TPG_VIDEO_CONFIG_RGB);
+	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE,
+				DP_BIST_ENABLE_DPBIST_EN);
+	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN,
+				DP_TIMING_ENGINE_EN_EN);
+	drm_dbg_dp(panel->drm_dev, "%s: enabled tpg\n", __func__);
+}
+
+static void msm_dp_panel_tpg_disable(struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_panel_private *panel =
+		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+	struct msm_dp_catalog *catalog = panel->catalog;
+
+	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
+	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE, 0x0);
+	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
+}
+
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
 {
-	struct msm_dp_catalog *catalog;
 	struct msm_dp_panel_private *panel;
 
 	if (!msm_dp_panel) {
@@ -253,7 +334,6 @@ void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
 	}
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	catalog = panel->catalog;
 
 	if (!panel->panel_on) {
 		drm_dbg_dp(panel->drm_dev,
@@ -262,18 +342,113 @@ void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
 	}
 
 	if (!enable) {
-		msm_dp_catalog_panel_tpg_disable(catalog);
+		msm_dp_panel_tpg_disable(msm_dp_panel);
 		return;
 	}
 
-	drm_dbg_dp(panel->drm_dev, "calling catalog tpg_enable\n");
-	msm_dp_catalog_panel_tpg_enable(catalog, &panel->msm_dp_panel.msm_dp_mode.drm_mode);
+	drm_dbg_dp(panel->drm_dev, "calling panel's tpg_enable\n");
+	msm_dp_panel_tpg_enable(msm_dp_panel, &panel->msm_dp_panel.msm_dp_mode.drm_mode);
+}
+
+void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_panel_private *panel =
+		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+	struct msm_dp_catalog *catalog = panel->catalog;
+
+	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
+}
+
+static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct dp_sdp *vsc_sdp)
+{
+	struct msm_dp_catalog *msm_dp_catalog = panel->catalog;
+	u32 header[2];
+	u32 val;
+	int i;
+
+	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
+
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_0, header[0]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_1, header[1]);
+
+	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
+		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
+		       (vsc_sdp->db[i + 3] << 24));
+		msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_2 + i, val);
+	}
+}
+
+static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
+{
+	u32 hw_revision = panel->catalog->hw_revision;
+
+	if (hw_revision >= DP_HW_VERSION_1_0 &&
+	    hw_revision < DP_HW_VERSION_1_2) {
+		msm_dp_write_link(panel->catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
+		msm_dp_write_link(panel->catalog, MMSS_DP_SDP_CFG3, 0x0);
+	}
+}
+
+void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sdp *vsc_sdp)
+{
+	struct msm_dp_panel_private *panel =
+		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+	struct msm_dp_catalog *msm_dp_catalog = panel->catalog;
+	u32 cfg, cfg2, misc;
+
+	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
+	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
+	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
+
+	cfg |= GEN0_SDP_EN;
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
+
+	cfg2 |= GENERIC0_SDPSIZE_VALID;
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
+
+	msm_dp_panel_send_vsc_sdp(panel, vsc_sdp);
+
+	/* indicates presence of VSC (BIT(6) of MISC1) */
+	misc |= DP_MISC1_VSC_SDP;
+
+	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=1\n");
+
+	pr_debug("misc settings = 0x%x\n", misc);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
+
+	msm_dp_panel_update_sdp(panel);
+}
+
+void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_panel_private *panel =
+		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+	struct msm_dp_catalog *msm_dp_catalog = panel->catalog;
+	u32 cfg, cfg2, misc;
+
+	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
+	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
+	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
+
+	cfg &= ~GEN0_SDP_EN;
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
+
+	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
+
+	/* switch back to MSA */
+	misc &= ~DP_MISC1_VSC_SDP;
+
+	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=0\n");
+
+	pr_debug("misc settings = 0x%x\n", misc);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
+
+	msm_dp_panel_update_sdp(panel);
 }
 
 static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 {
-	struct msm_dp_catalog *catalog;
-	struct msm_dp_panel_private *panel;
 	struct msm_dp_display_mode *msm_dp_mode;
 	struct drm_dp_vsc_sdp vsc_sdp_data;
 	struct dp_sdp vsc_sdp;
@@ -284,8 +459,6 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 		return -EINVAL;
 	}
 
-	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	catalog = panel->catalog;
 	msm_dp_mode = &msm_dp_panel->msm_dp_mode;
 
 	memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
@@ -312,7 +485,7 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 		return len;
 	}
 
-	msm_dp_catalog_panel_enable_vsc_sdp(catalog, &vsc_sdp);
+	msm_dp_panel_enable_vsc_sdp(msm_dp_panel, &vsc_sdp);
 
 	return 0;
 }
@@ -327,6 +500,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
 	u32 sync_start;
 	u32 msm_dp_active;
 	u32 total;
+	u32 reg;
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	catalog = panel->catalog;
@@ -372,7 +546,20 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
 
 	msm_dp_active = data;
 
-	msm_dp_catalog_panel_timing_cfg(catalog, total, sync_start, width_blanking, msm_dp_active);
+	msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER, total);
+	msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
+	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
+	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
+
+	reg = msm_dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
+	if (catalog->wide_bus_en)
+		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
+	else
+		reg &= ~DP_INTF_CONFIG_DATABUS_WIDEN;
+
+	drm_dbg_dp(panel->drm_dev, "wide_bus_en=%d reg=%#x\n", catalog->wide_bus_en, reg);
+
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
 
 	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		msm_dp_panel_setup_vsc_sdp_yuv_420(msm_dp_panel);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 4906f4f09f2451cfed3c1007f38b4db7dfdb1d90..8dde55b3a5ab64c0c12d69cb2dd5b5c733c83432 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -57,6 +57,11 @@ int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
 void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
 
+void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
+
+void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sdp *vsc_sdp);
+void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel);
+
 /**
  * is_link_rate_valid() - validates the link rate
  * @lane_rate: link rate requested by the sink

-- 
2.39.5


