Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4623FF0A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 18:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345929AbhIBQBe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 12:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbhIBQBe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 12:01:34 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7DAFC061575;
        Thu,  2 Sep 2021 09:00:35 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id f129so2447626pgc.1;
        Thu, 02 Sep 2021 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fk9qOIpqNtU9mgu+Mf4bLSy/z5UFG7XV8I5EL88asX4=;
        b=LfetnEEzuuv1qb0fAS/ttShZ8N+iLIfmiaAvg0iByOqil4Eglps4NdIUsbuJYWHc6+
         r3nPDtzkMYi2sXbCSa7bm69tT5eg1CTUkkYi4qrEtmJ3UnHdCxI3AwFfDtgSW+m267Py
         BSgxMtUBWixV+cqF1xu1NfFxhNYPFrbJujQdoWdhoN0oruKGzaUes320a1GvPq1kEbNb
         2PKzLo3z470yxoFtsruvSXyYgfYlQFR1UDvywszuIoRKbCu/GAkghVh/RGYcHym4XKVO
         CXoHsSDXkGtA8Shtt62oSnZSROQGNOxh2ewV5Guk1ZcRBYhUEUMHgSyg52KpY38olKT1
         /98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fk9qOIpqNtU9mgu+Mf4bLSy/z5UFG7XV8I5EL88asX4=;
        b=jsllO8I2CzCGtWRsp1ZwQVwBctfP7bYklSpcimzI6KVMAW/LhiyBrFYZE/6luO0jbl
         ftjtK09G8rc68XDnyEEVsZGulvI/Sr7p7/gfM8pxtXUPqWf9AT+8mbo6XeNlDGeFbvmH
         02c4wQBNSmSd64IFQGajazUZsjd/d5Hw/q+GQy5WQprUER9m5YTRjpu4livMF7dOxaTa
         ujwVEiZynbMcy+8+aqWY3IM+DXvfzaFHZElFA1rzrAZCCZnkXQJ7hDzTo1QVkSDiSzvQ
         rouFp+FTXi8rAQ39BhZ1RGXFTldXbyaLgmi1c/ZUcu2tNBaOAj6iHeshrNNTQX+s7U0p
         jhhA==
X-Gm-Message-State: AOAM531FDQLAwMGm6liqqrFvgEROit5f47dIsWwcUb3R+dL7/LrSm3sI
        gEp59QxikxQGkTJt2iq8mnU=
X-Google-Smtp-Source: ABdhPJwdcf0AY5VrBw8nqRBAXD7oZ7oS0Nq63NYpoqJ/4WbclGVKR/NdySwp0vV0i/uql9AyHvpanw==
X-Received: by 2002:a63:62c7:: with SMTP id w190mr3837011pgb.105.1630598435401;
        Thu, 02 Sep 2021 09:00:35 -0700 (PDT)
Received: from skynet-linux.local ([106.203.214.216])
        by smtp.googlemail.com with ESMTPSA id a15sm3528540pgn.25.2021.09.02.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:00:34 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     sireeshkodali1@gmail.com
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, airlied@linux.ie,
        robdclark@gmail.com, linux-arm-msm@vger.kernel.org,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rajeev Nandan <rajeevny@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm/dsi: Add phy configuration for MSM8953
Date:   Thu,  2 Sep 2021 21:29:50 +0530
Message-Id: <20210902155951.6672-2-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210902155951.6672-1-sireeshkodali1@gmail.com>
References: <20210902155951.6672-1-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add phy configuration for 14nm dsi phy found on MSM8953 SoC. Only
difference from existing configurations are io_start addresses.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
---
 .../bindings/display/msm/dsi-phy-14nm.yaml    |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 21 +++++++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
index 72a00cce0147..7527fb299caa 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - const: qcom,dsi-phy-14nm
       - const: qcom,dsi-phy-14nm-660
+      - const: qcom,dsi-phy-14nm-8953
 
   reg:
     items:
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 8c65ef6968ca..9842e04b5858 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -627,6 +627,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_14nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-14nm-660",
 	  .data = &dsi_phy_14nm_660_cfgs },
+	{ .compatible = "qcom,dsi-phy-14nm-8953",
+	  .data = &dsi_phy_14nm_8953_cfgs },
 #endif
 #ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
 	{ .compatible = "qcom,dsi-phy-10nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index b91303ada74f..4c8257581bfc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -48,6 +48,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index d13552b2213b..9a6b1f0cbbaf 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1065,3 +1065,24 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	.io_start = { 0xc994400, 0xc996000 },
 	.num_dsi_phy = 2,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
+	.has_phy_lane = true,
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vcca", 17000, 32},
+		},
+	},
+	.ops = {
+		.enable = dsi_14nm_phy_enable,
+		.disable = dsi_14nm_phy_disable,
+		.pll_init = dsi_pll_14nm_init,
+		.save_pll_state = dsi_14nm_pll_save_state,
+		.restore_pll_state = dsi_14nm_pll_restore_state,
+	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
+	.io_start = { 0x1a94400, 0x1a96400 },
+	.num_dsi_phy = 2,
+};
-- 
2.33.0

