Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 751634732CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 18:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236830AbhLMRTx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 12:19:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236018AbhLMRTx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 12:19:53 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF4AC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 09:19:53 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so12100092wmd.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 09:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=uaj/eu9mxTDJeXwct1gACUmB6rL8PuyqUHpHR94Vh0I=;
        b=duH2Z3BFLZ+dIqNoUaKGsKPYsH5m42KOJ8MmpY9k9GwlOTwxhXgHEancoD+NoFcCQ+
         IX6MwxTIJtjXvcXdfpBw4FYqRJ/rIesgtz4/j1qYSgvYotOaoWzmvplggCTA88hQnBGF
         Eyrxa+Da798NEW4X7KALP+eqMqp/0h11q75M+IyeeIKB8HF7QH6cVPljD0DvWH1uVkKH
         YIKv/NUGZ838RVmTcSJK8kL2pHpt/WKGzbJ7SIOcR550GFU7M4N6rWPPAyIYGlPqun9R
         Sr6zpNXz7Vr+LhWa/a3cWlrSCiI6X0feBlt73xiYgx6v0k4vHma3gqbi0IaBJCDVrVbQ
         ZV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uaj/eu9mxTDJeXwct1gACUmB6rL8PuyqUHpHR94Vh0I=;
        b=p4gBTFYKYA/+oGRn4RmSJLuaEgyget8hxxSiPUePRFutFoZPIiWGiahh6BnO+qMN+2
         hQEOzJMlN7r5CZo7vL7sK5x/abVSIfUkm16R3FN0GCwdJrHtmL28KyMbs1GACUMvydQf
         ZUZSFHmdZKNwxKqsVbUIdnZP7T9mARmkmQO5PSQgeEAyEg48CE6xbnE9TNDQj2IDenb1
         yB5+woUeykRS+VttYgNjWp+OFkO2duxCQIEX/kHtFB2VKTQ4LtRrema3LXrkNSOx5rhd
         oIz9ElBVBnT6CTFGRzGHZmtG0rX5QUZLlUiudd2yRuWnLQOpAEkf3egEGQcvLgsTgBrQ
         IJBg==
X-Gm-Message-State: AOAM531cR5Mjdu2uJEQuMTHE4xPDFah/d6/oqZIZNnaNQ5ktG/YZcfI4
        4ZuvO7Dthkgnh/DLniNkOAoEPw==
X-Google-Smtp-Source: ABdhPJwIHfgdwQJWMfncY3RVPmuzABdzzwQ/eq9/hLxhb+Vv/8Ge0q56XIfwtgJ069OV3wnl9fKShA==
X-Received: by 2002:a05:600c:2e46:: with SMTP id q6mr111115wmf.6.1639415991431;
        Mon, 13 Dec 2021 09:19:51 -0800 (PST)
Received: from localhost.localdomain ([88.160.176.23])
        by smtp.gmail.com with ESMTPSA id u10sm8483283wrs.99.2021.12.13.09.19.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Dec 2021 09:19:50 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, shawn.guo@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 1/2] drm/msm/dsi: Add phy configuration for QCM2290
Date:   Mon, 13 Dec 2021 18:31:59 +0100
Message-Id: <1639416720-6732-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The QCM2290 SoC a the 14nm (V2.0) single DSI phy.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 9842e04..c42e8f5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -627,6 +627,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_14nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-14nm-660",
 	  .data = &dsi_phy_14nm_660_cfgs },
+	{ .compatible = "qcom,dsi-phy-14nm-2290",
+	  .data = &dsi_phy_14nm_2290_cfgs },
 	{ .compatible = "qcom,dsi-phy-14nm-8953",
 	  .data = &dsi_phy_14nm_8953_cfgs },
 #endif
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 4c82575..68e0777 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -48,6 +48,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 7414966..20eadce 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1084,3 +1084,24 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
 	.io_start = { 0x1a94400, 0x1a96400 },
 	.num_dsi_phy = 2,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs = {
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
+	.io_start = { 0x5e94400 },
+	.num_dsi_phy = 1,
+};
-- 
2.7.4

