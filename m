Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 772FFB9D45
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 12:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407270AbfIUKEs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 06:04:48 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50821 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407333AbfIUKEs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 06:04:48 -0400
Received: by mail-wm1-f65.google.com with SMTP id 5so4929101wmg.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 03:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XFvYO/QeVSK7xJEhN7BDjaA/PqF/h3aDS+4+gIYeg2s=;
        b=DIEAaixRbNEzw7U1WcaD3iFxJO76nAtOdHLofhG7o8d7Vvoiz8cOUaJPcVUCkOi2cA
         kHv8IiAxsHd3bQ9aVzt/pz+ExvuTfhxRM2NeV5LBluyuFm41KiKKs68o+ru0F/EI/Tde
         dlUhKJuK+5Xnipr7PVwF8aTtJbM8HcB1M0cb2V5p7W7OiZyspstcitVmft+7zaMiQJlm
         Y4GVxl0IjOAadUl6r1SYuRki9Nl2tYEy1MoM5IH4yVZqzFtpw3pvZeCsdSzgiGfHrb8I
         t81JokygWmqXjKAMbu2vd1K4wuMaBGkmT7bGYdDY3hpHMAuKtiw/V35Q+pcBzbU+D6N4
         58Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XFvYO/QeVSK7xJEhN7BDjaA/PqF/h3aDS+4+gIYeg2s=;
        b=sTlyjz3nsDRi9+exO2Hv29Dbbj3q5a4Nw7vEcgu/h8UX2BiIPFahRvwFWuQBabVLrt
         mzNF0sj8vZVYci/O6f2m0mZ90zLd28pmxMWCnMk/eiUO6s6tZ7SQAbryW3DxXZg0K3ao
         k6Of+haCNcd4DUeIzkokt95QDJT9nm042gY0dlOCsfrRoYIjk6e39Z6BU83zmbhmkhgT
         y7IFUzsoQEb3bTSn2lFfjGL2zsZcsIqBJ2nxXo4r+uf/8TzRg8QuSWRz/jrB4smvQLVF
         Tbxfzpm7MTC9MilT8G938A8K6V5UfcuX0EvUDo0dTBvfNR8YaRActz5fxBp3FgfVOyrO
         a5Ug==
X-Gm-Message-State: APjAAAV7BcNRa0x1pI/Ywk0bKmzxWMs33Xt44N6Y7GYON17rmMfyo6/Q
        5rITrsTP1bGmrM0z2eeN2YZlXuKqh9g=
X-Google-Smtp-Source: APXvYqwMJovp3jiOl0eSPqwlE/xSLDsA5D0arohOs70uT8p01Cg6m96qjZqxI5uMJrSx6jrVSvSDZg==
X-Received: by 2002:a7b:c7c9:: with SMTP id z9mr6076363wmk.61.1569060286286;
        Sat, 21 Sep 2019 03:04:46 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id g1sm3963575wrv.68.2019.09.21.03.04.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 03:04:45 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 3/5] drm/msm/dsi: Add configuration for 28nm PLL on family B
Date:   Sat, 21 Sep 2019 12:04:37 +0200
Message-Id: <20190921100439.64402-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921100439.64402-1-kholk11@gmail.com>
References: <20190921100439.64402-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

The 28nm PLL has a different iospace on MSM/APQ family B SoCs:
add a new configuration and use it when the DT reports the
"qcom,dsi-phy-28nm-hpm-fam-b" compatible.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 .../devicetree/bindings/display/msm/dsi.txt    |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c          |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c     | 18 ++++++++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index af95586c898f..d3ba9ee22f38 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -83,6 +83,7 @@ DSI PHY:
 Required properties:
 - compatible: Could be the following
   * "qcom,dsi-phy-28nm-hpm"
+  * "qcom,dsi-phy-28nm-hpm-fam-b"
   * "qcom,dsi-phy-28nm-lp"
   * "qcom,dsi-phy-20nm"
   * "qcom,dsi-phy-28nm-8960"
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4097eca1b3ef..507c0146a305 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -481,6 +481,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 #ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
 	{ .compatible = "qcom,dsi-phy-28nm-hpm",
 	  .data = &dsi_phy_28nm_hpm_cfgs },
+	{ .compatible = "qcom,dsi-phy-28nm-hpm-fam-b",
+	  .data = &dsi_phy_28nm_hpm_famb_cfgs },
 	{ .compatible = "qcom,dsi-phy-28nm-lp",
 	  .data = &dsi_phy_28nm_lp_cfgs },
 #endif
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index c4069ce6afe6..24b294ed3059 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -40,6 +40,7 @@ struct msm_dsi_phy_cfg {
 };
 
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index b3f678f6c2aa..3b9300545e16 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -142,6 +142,24 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs = {
 	.num_dsi_phy = 2,
 };
 
+const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs = {
+	.type = MSM_DSI_PHY_28NM_HPM,
+	.src_pll_truthtable = { {true, true}, {false, true} },
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vddio", 100000, 100},
+		},
+	},
+	.ops = {
+		.enable = dsi_28nm_phy_enable,
+		.disable = dsi_28nm_phy_disable,
+		.init = msm_dsi_phy_init_common,
+	},
+	.io_start = { 0x1a94400, 0x1a94800 },
+	.num_dsi_phy = 2,
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	.type = MSM_DSI_PHY_28NM_LP,
 	.src_pll_truthtable = { {true, true}, {true, true} },
-- 
2.21.0

