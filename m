Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92E652FFCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2019 18:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbfE3QAw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 May 2019 12:00:52 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35366 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbfE3QAv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 May 2019 12:00:51 -0400
Received: by mail-pf1-f195.google.com with SMTP id d126so4256422pfd.2;
        Thu, 30 May 2019 09:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bYX12SEdJ0+DHu8wxAtEZ8Fdfnu9OWYVoolYKJBBX5M=;
        b=CxyJXw9GaV/yEztJ4aVVjjKXAOrymLn4J69zfT3A1qWRFzbYwW29CWT7CYjoyRvqau
         ikWpqpXttJDArpReLOOGIVH5+PE2r+5v9lo7MkDefbOh0gIYJ+d9pAN1UgZ/6WEfpbAO
         U4A1gizRnrw00eVfJre0b+Xd5qRFLDSLM+T9obvc6e9OhrCV07y1niqgmsBmvQuS5yE7
         w2KCBzFbWQ/rNzTl5oEY5pvgVdtnd5nLusdUgxSGPqDriOYtVWfVjR++mWRFFaFxwYuP
         vSDt5Eb7W80gjt5+3cWAB8UQGW/rYpFXPMdV3rhr7sKCgCSfMdePhkVcpMMex4B0Wkaa
         dexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bYX12SEdJ0+DHu8wxAtEZ8Fdfnu9OWYVoolYKJBBX5M=;
        b=ca6gKR0XkQ/kow2KR1Sb2it1lUYaOeVe/CS1L+io4q7GSRH4KBCpifOaCNyva14zQ4
         pSpliUj9ABOGkEi0oKNT44FckqwPFMDDrIruk/4tJukf9Q/HWP2WRh3nU/fqMKLHU3SM
         C6qM1bon+lNo0VAEbLIVjCxkuwbQfemrToVoPSeh8KS6N+W/N1mpXnyybRDkiy8NLNH8
         uOYSb3WxvdJd7wNsuRGB4Iko1iczxQwpLDBU+gU3FHLsF5ulk8464iaFteg3ASl6tgFg
         sRtYjXBk4tuXE1aHt2HJQ9Z+0OiwV3OYdxilciRLDAFoNfzvTklWtPerkE7AiBFI2B2a
         Qqdw==
X-Gm-Message-State: APjAAAWB1XHPdsvxL7vcexJXwMJ1/fHHa3KMzbijWAS77A9gZNVuYEdY
        WlP2O9ihWc0aKDpSFZacfaY=
X-Google-Smtp-Source: APXvYqysOKCOhCojeHwYxBOMCe4rHwNECRGRzxfWNp0uuC7W40HVOZjFuuMxStftmA8yZiZ7ntzKbw==
X-Received: by 2002:a63:3d0b:: with SMTP id k11mr4443677pga.349.1559232051303;
        Thu, 30 May 2019 09:00:51 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id r4sm2908452pjd.25.2019.05.30.09.00.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 09:00:50 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, sibis@codeaurora.org,
        chandanu@codeaurora.org, abhinavk@codeaurora.org,
        bjorn.andersson@linaro.org, marc.w.gonzalez@free.fr,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 3/4] drm/msm/dsi: Add old timings quirk for 10nm phy
Date:   Thu, 30 May 2019 09:00:49 -0700
Message-Id: <20190530160049.2875-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
References: <20190530155909.2718-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The v3.0.0 10nm phy has two different implementations between MSM8998 and
SDM845, which require different timings calculations.  Unfortunately, the
hardware designers did not choose to revise the version to account for this
delta so implement a quirk instead.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  4 ++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 12 +++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 7161beb23b03..3c51df1aa2ee 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -21,6 +21,9 @@
 #define dsi_phy_read(offset) msm_readl((offset))
 #define dsi_phy_write(offset, data) msm_writel((data), (offset))
 
+/* v3.0.0 10nm implementation that requires the old timings settings */
+#define V3_0_0_10NM_OLD_TIMINGS_QUIRK	BIT(0)
+
 struct msm_dsi_phy_ops {
 	int (*init) (struct msm_dsi_phy *phy);
 	int (*enable)(struct msm_dsi_phy *phy, int src_pll_id,
@@ -41,6 +44,7 @@ struct msm_dsi_phy_cfg {
 	bool src_pll_truthtable[DSI_MAX][DSI_MAX];
 	const resource_size_t io_start[DSI_MAX];
 	const int num_dsi_phy;
+	const int quirks;
 };
 
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index b1e7dbc69fa6..eb28937f4b34 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -42,6 +42,9 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 	u8 tx_dctrl[] = { 0x00, 0x00, 0x00, 0x04, 0x01 };
 	void __iomem *lane_base = phy->lane_base;
 
+	if (phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)
+		tx_dctrl[3] = 0x02;
+
 	/* Strength ctrl settings */
 	for (i = 0; i < 5; i++) {
 		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_LPTX_STR_CTRL(i),
@@ -74,9 +77,11 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
 			      tx_dctrl[i]);
 	}
 
-	/* Toggle BIT 0 to release freeze I/0 */
-	dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x05);
-	dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x04);
+	if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
+		/* Toggle BIT 0 to release freeze I/0 */
+		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x05);
+		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x04);
+	}
 }
 
 static int dsi_10nm_phy_enable(struct msm_dsi_phy *phy, int src_pll_id,
@@ -238,4 +243,5 @@ const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs = {
 	},
 	.io_start = { 0xc994400, 0xc996400 },
 	.num_dsi_phy = 2,
+	.quirks = V3_0_0_10NM_OLD_TIMINGS_QUIRK,
 };
-- 
2.17.1

