Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C87D25E8C39
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 14:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbiIXMTJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 08:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbiIXMTG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 08:19:06 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF959D1E95
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:19:04 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id b24so2729751ljk.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cF05yDaRT5/jiUw2Qee8ED5ZHeJzCzuJb8hAnhlWOHs=;
        b=FGMDVNmTTCwzuEQjUbzFokaGuVVrEbe4XLVOqB9alqagctg7M38iNl0oL2Ti5KCchv
         6HElc8Z4/fdQ7vJhOxoTYWOxKTAqX4fFmYefb8Ln9Dk8rKvLUhAofvsh/BT/lOcBOXlv
         GBk9dfAEzifNpD77lgecOZuTZmDB4dz7wRxvR2vTiiZWEb3psvpsxY9tRx2DqVv+LZyz
         aABSt52FVB0xXGFANFwPxzMBp2mriJ9AKVhfwayY1h7aiHACSRIlh/1VIX2uD7cYolyw
         X+U2pkbRRSFxWrLEHtCmDbhMf3Ib/c5WdochVWTWeWm8s+jMQ+ZA1Ts4mDE+58tqhhit
         jGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cF05yDaRT5/jiUw2Qee8ED5ZHeJzCzuJb8hAnhlWOHs=;
        b=cHx1jNb3MiuAkbRVhrtxkFk3Sp89SKIIslN0QcEDL6lEFwAnuQ3bjF5nuOEUVJ8OM7
         tljbp/A9PSZjZCKVzdqBK3NcuMigRox33MvvVSBqgipbpH+3PwyIzVqzO3/Lob7yq0Ns
         Bo62jHJ3Kvl4KgntdWIW1HO44+1Pd99odO3aRpEGtWmDA8pVT16rgou2JU97Kvc8Bzsb
         MCwRgPN0lc1CBqwK5JT4Xq8gDrEhsVdQL5sbHVRTAmWbmB+KzmOZB9EUY5xZYuaNjlS/
         7cyNQabdSKun7kEwONNzp42zrL4nvnAnX/BkirVTx11AglK826udFjb3zBJlpJhUud3t
         U03g==
X-Gm-Message-State: ACrzQf2dQmLF/Th/9G20TUURfXWgys3lmAFa3V4rjxfmJTdAVuOYBGg9
        jbQmnt2cG7oVdCyZ4MvU1FsUwQ==
X-Google-Smtp-Source: AMsMyM7wuGdhR667gNoEFZoGT2hzAMfPUNRUSpEarxRy811LKEsZt70ebnjb7JfmVC4EKOwStJ+Lvg==
X-Received: by 2002:a05:651c:514:b0:26c:5815:551d with SMTP id o20-20020a05651c051400b0026c5815551dmr4279508ljp.28.1664021943200;
        Sat, 24 Sep 2022 05:19:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v12-20020a19740c000000b00497a2815d8dsm1870113lfe.195.2022.09.24.05.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 05:19:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 2/2] drm/msm/dsi: Add phy configuration for QCM2290
Date:   Sat, 24 Sep 2022 15:19:00 +0300
Message-Id: <20220924121900.222711-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
References: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Loic Poulain <loic.poulain@linaro.org>

The QCM2290 SoC a the 14nm (V2.0) single DSI phy. The platform is not
fully compatible with the standard 14nm PHY, so it requires a separate
compatible and config entry.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
[DB: rebased and updated commit msg]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 17 +++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 7fc0975cb869..ee6051367679 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -549,6 +549,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 #ifdef CONFIG_DRM_MSM_DSI_14NM_PHY
 	{ .compatible = "qcom,dsi-phy-14nm",
 	  .data = &dsi_phy_14nm_cfgs },
+	{ .compatible = "qcom,dsi-phy-14nm-2290",
+	  .data = &dsi_phy_14nm_2290_cfgs },
 	{ .compatible = "qcom,dsi-phy-14nm-660",
 	  .data = &dsi_phy_14nm_660_cfgs },
 	{ .compatible = "qcom,dsi-phy-14nm-8953",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 60a99c6525b2..1096afedd616 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -50,6 +50,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 0f8f4ca46429..9f488adea7f5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1081,3 +1081,20 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
 	.io_start = { 0x1a94400, 0x1a96400 },
 	.num_dsi_phy = 2,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_14nm_17mA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_14nm_17mA_regulators),
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
2.35.1

