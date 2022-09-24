Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEF9C5E8A4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233514AbiIXIvg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233550AbiIXIve (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:51:34 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C41AF311F
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:51:33 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id a2so3619675lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=y804vYXnT9ULeC1CnYfjzy6Yc9O3b/jntIG9n83g1pg=;
        b=hbOexKNwYVFPWR36i6dlMhDCJMHsaKUiL7kKWpFft9Mzvp61ZQPgK/5ZdRkLGRMywg
         /U4GzquELJ6zOcLQbgFE6p8mtyJ61uciZ1NTcMFPbVC+Q5tQTeAs8HjQEtSlcAJgP9pz
         gatsKBuzGx5hsN2Melhy01pSj4rfgdc4DAK8uyD5cSs5yaztTyCL556Umd2E8JYRnuL5
         zDy4L/fBWtMcGK0d5KgRFXMqqhtbYEcCnsubziokHxQcbb7UEzFoLmqfG3A/+bQ5ixg0
         bNEk8iSe04PfpwoYCOLai9O65AWwG/VUlL4Fpp9XY3aqC7IsBLokJTd6dCT+P5J5UYT/
         jtew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=y804vYXnT9ULeC1CnYfjzy6Yc9O3b/jntIG9n83g1pg=;
        b=3yVrdjZ4S2oiLsTVE937081FpyOA3P+8w3frEuCRGOTDWIkRBgJHPna7+szES+Dvg3
         Le9msOcm6i/ivM1fw0XS1OD/vYFUwGjfXKWmSlvRARKXI6HO8o6kIztWXtrOJUBglsIS
         LntQvU5XCYodVjPMJddvvZw9lA/nHeJIxBUh/JLpXatalEzjRZ1323WYqvfTH6O/O2sb
         eN33T/XxSFG3oE5AVB253ikA0TZyQ43oceP3by2l7+XOYAdCWmucLaZTmuNfNTtYroPP
         ztzA6CJxZOVSWJ2WtNzdD4VActjDdUkesIrs4s+V3/a6Rp/Wbj0M5cuwJDolZp6/j9wa
         eHpw==
X-Gm-Message-State: ACrzQf3pColXSYBaYdgYYDVolc3I0jFls1QzC8KdJWyXdF7ijwn7s3bE
        v5rNgK+vgpSFjWNPORPIdbaPTA==
X-Google-Smtp-Source: AMsMyM6BIua/fMcQPIY9giKkgW9iHC/0YUTXF5zODgP30U6tAWOHB58Xo2k4IMbBn/hkKEDauYPcJw==
X-Received: by 2002:ac2:53a1:0:b0:49f:6086:4868 with SMTP id j1-20020ac253a1000000b0049f60864868mr4940246lfh.518.1664009491826;
        Sat, 24 Sep 2022 01:51:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 129-20020a2e0987000000b0026acfbbcb7esm1717607ljj.12.2022.09.24.01.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:51:31 -0700 (PDT)
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
Subject: [PATCH v2 2/2] drm/msm/dsi: Add phy configuration for QCM2290
Date:   Sat, 24 Sep 2022 11:51:29 +0300
Message-Id: <20220924085129.161086-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924085129.161086-1-dmitry.baryshkov@linaro.org>
References: <20220924085129.161086-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
[DB: changed compat to follow the agreed scheme, rebased and updated commit msg]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 17 +++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 7fc0975cb869..724d5fa0788a 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -553,6 +553,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_14nm_660_cfgs },
 	{ .compatible = "qcom,dsi-phy-14nm-8953",
 	  .data = &dsi_phy_14nm_8953_cfgs },
+	{ .compatible = "qcom,qcm2290-dsi-phy-14nm",
+	  .data = &dsi_phy_14nm_2290_cfgs },
 #endif
 #ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
 	{ .compatible = "qcom,dsi-phy-10nm",
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

