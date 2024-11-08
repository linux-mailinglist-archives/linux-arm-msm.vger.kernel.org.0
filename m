Return-Path: <linux-arm-msm+bounces-37303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 871869C1320
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 01:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4708F2841D1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 00:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2410913B29F;
	Fri,  8 Nov 2024 00:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DLkGL1ev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9788F58
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 00:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731025324; cv=none; b=WBhFPCi/I1kYkz+Vd+cJeqR1awXkFwm9TOP+x7q00j7tNBSYT7b5eKgbk8mdpNmvY0p/JKn0su3HJfZgZF7ZlGwJMwjlre0R+333JEEiJBKHjZoez3OwO/PQfjzqgSKFADOVMj0bsQIowethxVTKEOIAyS9MgYy9qvW1BjCMnHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731025324; c=relaxed/simple;
	bh=MTfEFFP/YbgFD6Q1EMt0bPgAfYwHBAnPO/xY6iNsytQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l9VKJd32mBNUUDYHsmDzUouejSuF0N0VNZtTtlWAYINWdy5IxTKyweAdOAURa19JPryOdQYc7Ta93s3Rx0xPb+MKPuUEGRdoM6Dw49drVmB3EuwRQHhdLAPZ/6fWlyfzMQsFPKBkDt+Tgtr8FtpYjUoEvIGbda9lsJ+nsiXu270=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DLkGL1ev; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso14823341fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 16:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731025320; x=1731630120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8qsphOlaMsjWxfORx1tUu8YpeUoId1f0O0ePNQg24g=;
        b=DLkGL1evASg4N9rAJ3jx445qWnvUoMKT9tQMD5XOjsKdMgebm8W1/jajcnOkVunprV
         2Lkx5HU/Ut/ws3F+HZU4UpkFUmQXdKWJkUyha3KDsYCOh3Ka0cagnpW7Q8XOxgFXg36f
         T5i8R3Qk1SIq0dY/Rzkl0PrCNno7IyTaU7AzqZarhuKo75Q3cwfQqCZD7k47wICuPyqK
         NDgmTXszyJPh1LyUw5uzBOev0D09NYpex6sJWm/6xK2WlnNbM6iXUKC36KTr1vT5JYYW
         nyNkGIXUvTfTSezsxvN+Sr3XfGv5TiE0tJ/WCkyo3oMWE83lcmu/NfxCgED+XNMNQE+2
         dDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731025320; x=1731630120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8qsphOlaMsjWxfORx1tUu8YpeUoId1f0O0ePNQg24g=;
        b=aJhX1GHAgST6zSmGStRUUBiN49jzF4YsIUgbyuJAHRley1D4fPyBEWpq1DGt/2gdf8
         eDJ+CPsjuJHPLgyjMcW//YjQNCTc7iH/hoVwONQHZGKgqp0d8XeCi3559Y7P3Cg+6ZYo
         tFTq5OFDeJVlt/AxJ2yyuEuMntvSDuz6CmFmiCRKSsoJ46I9FlGnXzGNoINa/0vAajzj
         20/okjSkTzksUnn6ukgDFgLwMDRP9i/Py8ODmw2Vjjdxj35P3wjCMPgSAIs3hC1O61J3
         U34nQ1uukk5qBoAiI+8QedxD3Nm7f5rbB6GGvqBugSvufpkYIg+pkLE2+pqC3akh2EjM
         6Z4A==
X-Forwarded-Encrypted: i=1; AJvYcCWw+H/fA7x7hnJ20S6WF7h0CdlIC/uhP9DLfqkKrnYI+qgQk9dIf6zLowQ5mifhX4dR5O4zHGaaeqRJyosq@vger.kernel.org
X-Gm-Message-State: AOJu0YwGxewgbhex4CJuKUcpIS6m9Nl48OZe3TRMxVC9/hPfNodWmAa7
	DsyL84KGJkITsHsO65z5rDWeNmt6fguSwWDaYzRtdZhohajhoszSMkaECDP1ov0=
X-Google-Smtp-Source: AGHT+IE2ZHLUW6CFb8zxAhkF36hEM0nhY5Tlzuq5IxAL6DZal3zbi0ENVi1e7e5DtnBiKMZxEdOm3Q==
X-Received: by 2002:a2e:b8c2:0:b0:2fb:3d86:d915 with SMTP id 38308e7fff4ca-2ff201517bamr4645761fa.11.1731025319822;
        Thu, 07 Nov 2024 16:21:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff17900a63sm4195191fa.47.2024.11.07.16.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 16:21:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Nov 2024 02:21:39 +0200
Subject: [PATCH 08/14] drm/msm/dp: move/inline panel related functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-fd-dp-audio-fixup-v1-8-40c8eeb60cf5@linaro.org>
References: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
In-Reply-To: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13699;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MTfEFFP/YbgFD6Q1EMt0bPgAfYwHBAnPO/xY6iNsytQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnLVmP5BnpPW8F4Q8abGp0tLLh0/E1WTuuBwoEd
 W3AftzNYKiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy1ZjwAKCRCLPIo+Aiko
 1Q9+B/4jhzy6SRxT38CQUPjduKqxDMj7G1y0hmqoOp+U7ixcCQM30bqXXOyJ52Pu+zWitG9DwqC
 VK6OSsgnVwmq/tAu/VHkWKKL0peJwI4OSeWhnR2YGcup4W3QaFZ4TG1GmrPXFE3J2UZU6O86tFa
 XBQeCreYJvhNysRhV+88koinZXVcd6BZq1lwyf1RL69pnDArpGzH/ZOXuvOKyzt+kC84Agf4iRM
 ydy6r8GMO8t/UUfQ13PUt1oTgbWXYvukmH0X02Am+V3jYPCfRMBrMdYzHwxEM36ve0MK0R6A7tX
 Eso9nGBT9eHrXlZXFc1lfpbFLy6do6EHnWaDOIpYtsCRYR32
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move panel-related functions to dp_panel.c, following up the cleanup
done by the rest of the submodules.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 114 ------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |   6 --
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 114 ++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_panel.h   |   3 +
 5 files changed, 113 insertions(+), 128 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 7c65eba867733cf532831f54639f23aa5605c35a..9c12484589dc38951a3f1cb4bb33eb9aa5822d87 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -21,8 +21,6 @@
 #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
 #define DP_INTERRUPT_STATUS_MASK_SHIFT	2
 
-#define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
-
 #define DP_INTERRUPT_STATUS1 \
 	(DP_INTR_AUX_XFER_DONE| \
 	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
@@ -220,118 +218,6 @@ int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
 	return intr;
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
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
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
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index ad3c6bfbd8bb449d7bee92b55b74ddddd1ce4ed0..8b63f53e960092666f08b95f556aefe210f4a1e0 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -148,12 +148,6 @@ int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_config_psr_interrupt(struct msm_dp_catalog *msm_dp_catalog);
 u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog);
 
-/* DP Panel APIs */
-int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 total,
-				u32 sync_start, u32 width_blanking, u32 msm_dp_active);
-void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp);
-void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog);
-
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 6ca2e055717b55c9eb064887948cf095fbfc1c40..cde667bf8eeec95035b2feb3661686c99acf5b7d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2395,7 +2395,7 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
+	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
 
 	/* set dongle to D3 (power off) mode */
 	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
@@ -2449,7 +2449,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
+	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 7a5656d8702e4f9c6f8e13d00788a5bdbbe3729f..7903606fc9c249b4ec21949fe51240df90492103 100644
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
 
@@ -242,10 +245,97 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
 	}
 }
 
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
+	u32 hw_revision;
+
+	hw_revision = msm_dp_catalog_hw_revision(panel->catalog);
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
+}
+
 static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 {
-	struct msm_dp_catalog *catalog;
-	struct msm_dp_panel_private *panel;
 	struct msm_dp_display_mode *msm_dp_mode;
 	struct drm_dp_vsc_sdp vsc_sdp_data;
 	struct dp_sdp vsc_sdp;
@@ -256,8 +346,6 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 		return -EINVAL;
 	}
 
-	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	catalog = panel->catalog;
 	msm_dp_mode = &msm_dp_panel->msm_dp_mode;
 
 	memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
@@ -284,7 +372,7 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 		return len;
 	}
 
-	msm_dp_catalog_panel_enable_vsc_sdp(catalog, &vsc_sdp);
+	msm_dp_panel_enable_vsc_sdp(msm_dp_panel, &vsc_sdp);
 
 	return 0;
 }
@@ -299,6 +387,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
 	u32 sync_start;
 	u32 msm_dp_active;
 	u32 total;
+	u32 reg;
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	catalog = panel->catalog;
@@ -344,7 +433,20 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
 
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
index 317e2a13d7e917acd78edd2f1c99c4be3de902bd..332ac79594e71157e2b087dc5268c50a87993d83 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -63,6 +63,9 @@ int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
 		struct drm_connector *connector);
 void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
 
+void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sdp *vsc_sdp);
+void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel);
+
 /**
  * is_link_rate_valid() - validates the link rate
  * @lane_rate: link rate requested by the sink

-- 
2.39.5


