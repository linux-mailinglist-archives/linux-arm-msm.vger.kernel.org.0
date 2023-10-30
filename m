Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 392AD7DB858
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Oct 2023 11:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232683AbjJ3KhF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Oct 2023 06:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbjJ3KhA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Oct 2023 06:37:00 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0C2F9
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 03:36:54 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c6b30aca06so21010991fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 03:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698662212; x=1699267012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DA6PVD1pNqlF4BUixIYFQIvuTNht/64ah3v95olbiNw=;
        b=VQrERk8yGTj2EYxeGBJKwUK1AY/XHR55M9Ci6YSO7EhBJPwRxmoDxVk1V6RVf9tA/h
         5OhzPkPJqCQRI0ERFfUF+uUt32SpXx1RmgrDHWaScmr+jd7lu+YYrH/VgRcyQiv6gCHI
         tuY5eWBBzUXyU0+P4tIDoyChleIwq9J73V0H1XO7EmpQKkkN53PPhFYKOdqs97AKLgMA
         5x4wjeUtXMqGF1kji5tbA2s8N34n+MMDO+XH9bVLvNFXPm60Kt8T5ZAW8s8TahNNzgIm
         BGKXWNauQS0YuvBl6e7wEnKlpbjuox1odFVICmVL4XU24utsqpRibSmpzzY1aCX/5dd/
         qJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698662212; x=1699267012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DA6PVD1pNqlF4BUixIYFQIvuTNht/64ah3v95olbiNw=;
        b=vNlffA64PvuZ0B1jSyAMHq1vDM0CLK6DJ1ARxhrZasjcdkCoVIleqVL61/PELhfAIz
         RpsAdmiMrQi+TVXa5wK9IGjDciZzaM8XLh0gaGdOOLtHc0cJkZGove6YHKobPfVav7pO
         P+LZff2W8rLbfRUYNqJ5QOTeiV65Z7Gr9l+Yoc1ahqttZ3LnoTIKdS8/qGrtYqkAjXq/
         xBWYKtH7Qxkd2Bxomkt1ziaj39dSa8i8PbrTVUypE0i77s9tKqoN2q/hF3hkE2/fW+V2
         xvv/OgNtDsDdXThT2T4MWQolS9mJW2XBYspxoHnalmrv/s8X8HC1Xg4WX3D7ESCrpQ0S
         2B9g==
X-Gm-Message-State: AOJu0YzlWnExb47suiMNhgd2oX8Urdq0mrRGciRC8yvEtgbkeITMLQol
        64LHNr96FfO1vC/AJnkXy4/dig==
X-Google-Smtp-Source: AGHT+IF5rt60Krlu4XkRUEi0s9/CrfpATLDmDfv9/0Mtg2XZ+mRpHAfn82dZyCp8UC9qcW9Jh7dTgQ==
X-Received: by 2002:a2e:9184:0:b0:2c5:1ad3:7798 with SMTP id f4-20020a2e9184000000b002c51ad37798mr7355852ljg.52.1698662212627;
        Mon, 30 Oct 2023 03:36:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r5-20020a05600c458500b004060f0a0fd5sm8783209wmo.13.2023.10.30.03.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 03:36:52 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 30 Oct 2023 11:36:30 +0100
Subject: [PATCH v2 8/8] drm/msm: dsi: add support for DSI 2.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231030-topic-sm8650-upstream-mdss-v2-8-43f1887c82b8@linaro.org>
References: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2167;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mOPAs9fZnFHnWKWTDzyDhJJvT1b82KyCyg4RUEyUBOc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP4c5PQd/l9lmI/IHAedI22CO88us5G1Wn2T2zHiT
 u5TkJDeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT+HOQAKCRB33NvayMhJ0UeID/
 9C5ihJ8N2WmdSPfB9UUSO2RACNYSosGJIIQpZ72sH+3Auc1eatlQdp1J18OmS0v1EUfueyLFztzgYc
 PYvL85QlipzQGnRsAmC18sFZA29GDdawbLS8Qv3069TT2yqcYyAKOTGv901sGOufbaByEYJIUCe0aE
 jnt+z+pjQraQO28jQWdHASBrEUkbIvGMDw+9x7AsoEWNx9LfNDRDuwaCCHRuMzM4FVtPeBUVUiOEk/
 6D0B5+T7JUOmGXHVuSHcvTso/IUtWBn286L2SAT/LAAiwDY293STD/+6pCfxuUgpVEROWO/egsgUHe
 ANamWpRbaqB+QoGhpw3lhdsFwign4mUbsvGi5Pt6USLP8iMA8tczyAlB0RYGUqabEDohRViQidlz6W
 7LGXucKOq3Y1TpwXqVTOUyLbElyMRQ50IvXW2QjeF3pzp6tnXgp6CMdKMG4iaMSwXOAvNmF0qk0yfW
 mbXbzqiJPYLWYSNjF48l38FDvSAjKkfwR9fuSw4de5EzpyCfhbWeArpxbBUir6roVqxn7Pi2dgoCQA
 496W0TlQLXpPBmfX+PAe6FCipIcCkP5FXt14chJO8fW5paxLIFl6Q1zlduX7geIIaS+w1rdv9DZayd
 r6flv/2ILTbe2krxEigZWGNKZAEIYCtTclv+m3DXPzYtq+p5gs604uw3arSQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DSI Controller version 2.8.0 support for the SM8650 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 1f98ff74ceb0..10ba7d153d1c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -190,6 +190,21 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 	},
 };
 
+static const struct regulator_bulk_data sm8650_dsi_regulators[] = {
+	{ .supply = "vdda", .init_load_uA = 16600 },	/* 1.2 V */
+};
+
+static const struct msm_dsi_config sm8650_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = sm8650_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
+	.io_start = {
+		{ 0xae94000, 0xae96000 },
+	},
+};
+
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 	{ .supply = "refgen" },
@@ -281,6 +296,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_7_0,
 		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
+		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 43f0dd74edb6..4c9b4b37681b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -28,6 +28,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
 #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
 #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
+#define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 

-- 
2.34.1

