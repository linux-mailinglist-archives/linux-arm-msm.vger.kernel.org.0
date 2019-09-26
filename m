Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB283BF06F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 12:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfIZKx0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 06:53:26 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37541 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbfIZKxZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 06:53:25 -0400
Received: by mail-wm1-f65.google.com with SMTP id f22so2078239wmc.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2019 03:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XFvYO/QeVSK7xJEhN7BDjaA/PqF/h3aDS+4+gIYeg2s=;
        b=fPTOr2cxjZeU5ZYyG2FBmfsYKLYXWrQSqF4vQp35kaJESz98iUZGMoJ1dvmMkQOQr2
         KPsxrXbNJs/Ur5gapboE5QXxP3EKdOkhqEKPDr6Wskjno0QhD2j4TYQsdnenMjK1JOyk
         CD74r5MpdMQbIRAd32SoDa8W4coVd6xm8ebjFzua7PbQoSWLarpqNbCnRvGb5QktAndF
         MpDcR3QkciYbFzH1IU11EFblmzZdVhm3ieNRY/NSV/2KQyUW2UC/IexuIVYaQi0lB+yi
         vS48lYcN40N9JvxCjpftD+Vo8f3Xo0U/I0rb443+vxwoM1La/XYO4oZqb9nCm/C8Xbfh
         NstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XFvYO/QeVSK7xJEhN7BDjaA/PqF/h3aDS+4+gIYeg2s=;
        b=klFavWZh1fGqFfpymR/LBqvO9GEENUwW8ldPcElkFmWTPKEZPKjlfpJFkQkT/ctKIX
         yJV+EzfI1rCzwIBGEKXdbYXGq2nM4mga9otWwnFaKQ3c5JP4SmoNzxOrQPuYFjrpZk+9
         /6s7xhzcn7L3PLUBJ+sX0PHI8Dg6qEUZjfatWMu4ALN3F3X9dmwcaV7xUs3dSHw0EHhy
         7mDd2uK9Tek/sDnPDV+d/wxTpGa/A5EASDOdCLhTiUPdYvSwFRBsNTc/54QyWWixSOV8
         SyFkHt17m0L10qLSFTA+XJPC0xBt9Z5OH4JXARGDbuw+mapmmxdkADrmk1b3HIgTwmwq
         cAIw==
X-Gm-Message-State: APjAAAU9z3DZ4GwDz+jij5MJ3NgxL4uotguZQ7PHrQ0kQn+7rmPwUsDm
        nqC8j7PRtg4NALSMxdqb8RAIjZY3hOU=
X-Google-Smtp-Source: APXvYqxxecMIjSJwWtKFYSllKwbN+U+DWL86UX2aYpK8pajJqV85kYsnZIyEiPREH2SsKUnyc4C+xQ==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr2351546wml.97.1569495203299;
        Thu, 26 Sep 2019 03:53:23 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id d9sm3468412wrc.44.2019.09.26.03.53.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 03:53:22 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/msm/dsi: Add configuration for 28nm PLL on family B
Date:   Thu, 26 Sep 2019 12:52:54 +0200
Message-Id: <20190926105256.61412-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926105256.61412-1-kholk11@gmail.com>
References: <20190926105256.61412-1-kholk11@gmail.com>
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

