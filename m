Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E37AEADB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 11:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbfJaKoP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 06:44:15 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39367 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbfJaKoP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 06:44:15 -0400
Received: by mail-wr1-f66.google.com with SMTP id a11so5662250wra.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 03:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2V3G3eqO0b2zEeTGJ2/qICJ5g4Ftbp7opa3Bf/EES5w=;
        b=cQBA1tLQt7c0V6n710Dum1PpYILvFekB8wiJGk2TTMzOLwrFR/i1T/WhlO6OB0Xh1W
         vXxA9iHIvpU2BPMAsmc45ecurrtOB2Mey6rlgs9Q39myDqntyist+AG0g/8UkRoKYZ/7
         s21oJJcF/xbtdYyFeWYU7DAn6mtiLffG+V5bG7Yt3J9TrZdOBEAWEgYTstC0XrMYARUd
         VgXxmxH6GKbDLP48TFm0Uv8meCqWbnO4vBjOwhuJLYRpW624YC5a/4AxrkUYKq9Iu0XR
         Db5ibgagVOLskTsgtKgtZH1H2i894D6BXpObadIaVzZpbrecz7D0Zt0tTsyPC9HrmyzN
         B2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2V3G3eqO0b2zEeTGJ2/qICJ5g4Ftbp7opa3Bf/EES5w=;
        b=e7PO9Go/+GZYog3WqyeJzFlX7HU33nv3CMaSnJJM/M/t/dYUzFYJo96dHzusvG3sjm
         rUBC2JvhvRBYk3HF2/CdgHAirnHWM5HlAjri8VTEazzZRflvNzgIIDFjE9+8dRsfKCHe
         t1+x/3Rrs2Je2MC6/MGfgkdZ0AnyAS1dy7svq0VsSG6eiHFgu+yX5f0ez2QwR/5ieO5Q
         IrZnY9aU/c+h82I9cPewVz3W72VY/qRA/jQKgvZ7lsD7pqzO/BzdeP6jTguRpX30955S
         hOn9JaYG0b72h+nYHlmvYoR4+GFHiPpoQ20+Agl05LxVUUFvdfVhefkZtVuVd/Jsp63a
         Dw9w==
X-Gm-Message-State: APjAAAU41xrKvwfvKxq9AW8nrmNoIdcfIm8GXSukEw5i7t0xms4ffSQe
        4kQHxp56daXON6TlDETsnG7uOW/LOLM=
X-Google-Smtp-Source: APXvYqwRHYSziJoiQR+nup4mTG0Zlw2/c3rwnMJrjI4CVn73leuABFCBOWBC85SvizBg56y8Gzeh/A==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr4132519wrw.129.1572518652788;
        Thu, 31 Oct 2019 03:44:12 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 03:44:12 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 4/7] drm/msm/dsi: Add configuration for 28nm PLL on family B
Date:   Thu, 31 Oct 2019 11:43:59 +0100
Message-Id: <20191031104402.31813-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031104402.31813-1-kholk11@gmail.com>
References: <20191031104402.31813-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The 28nm PLL has a different iospace on MSM/APQ family B SoCs:
add a new configuration and use it when the DT reports the
"qcom,dsi-phy-28nm-hpm-fam-b" compatible.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index aa22c3ae5230..b0cfa67d2a57 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -483,6 +483,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
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
index b3f678f6c2aa..66506ea86dd6 100644
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
+	.io_start = { 0x1a94400, 0x1a96400 },
+	.num_dsi_phy = 2,
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
 	.type = MSM_DSI_PHY_28NM_LP,
 	.src_pll_truthtable = { {true, true}, {true, true} },
-- 
2.21.0

