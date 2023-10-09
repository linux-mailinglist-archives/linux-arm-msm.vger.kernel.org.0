Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDAD7BEC1D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 22:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378034AbjJIU5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 16:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378097AbjJIU5g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 16:57:36 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32725A3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 13:57:34 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50435ad51bbso5977361e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696885052; x=1697489852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cxLmiRyrS5kt0J5ZzxaEvq9+FAU6cjTlCuQBf1xxyA=;
        b=fbgfeB3JolgQkJuQ/AoQ1AZY72hdTk79+zw0gdv2o2sgRPyCpR5ml+X91zGwjqKTU6
         QJIxy2GFJynGBoqErubIwOptE9SmRGekKgEf/mamsd5hFZan7HkV/caRGBLiomvJ30eb
         TjomayEiPdYY3M7YKkCaWUWUNAJ/jBuxYDGWAjxQhdG2OdXTxl69N9GluZHFS7UzOKCh
         HUxcy8xnsCgBGskLn3mxK0FAYdWKjONLaT2Dc4eeLCJtR2277nFPKCJhTjHU4E8YB/e3
         /HPQ1waHf5SplzI0ZINzjpy55jblpjbZAWP5NqKR61Yea8Dm1iDB+5XGVRI6hlUNOQj4
         aHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696885052; x=1697489852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cxLmiRyrS5kt0J5ZzxaEvq9+FAU6cjTlCuQBf1xxyA=;
        b=pANj6qbRYtRMnFZuJDQCagJ7EfdRlJE+PKvXggp2g32jkiAX7hWQSR3LuvCeH2Dy8w
         4jtYqpCHtlMzOEXnPKllGSWsp7YYHmV7ADgrHumCSXf1+B+7Z3xZgp/fnoglUG0VTnuv
         b3Xq83k4Ffg+LPEZ4cTRDj/8QQe8jCJ0nIjYCv7KWmMONI6T6aWBk2L/oMMnn4vfNcqx
         VREghwH5HIhNth1sMXq9IZDbCeF71R4GiY25Nkk2mrBaeMNkkpJydl5oR3woBXeo4N04
         q4bC03TC6AlXlS9144upR27R98zlsFQeLrmJpKyKngBn9tZwIWa2GiFJK8VK50Chb1GS
         ydKg==
X-Gm-Message-State: AOJu0Yx4xyij5SA89AbiMd6qL24U4FjtvBFNFiWZ9jiMOmuNwBdZvqpX
        jEkznDDSIjdTMBFhBBkGETA5DW+izxmwMkppd70=
X-Google-Smtp-Source: AGHT+IFJ0l95lvmXQn6PFCYDow3HNy1sWNmEoh9lJjjaVhxV6tR3ePILoLD2bJjoLJgZj8uok8/bAA==
X-Received: by 2002:a05:6512:3095:b0:503:2a53:7480 with SMTP id z21-20020a056512309500b005032a537480mr16398675lfd.49.1696885052428;
        Mon, 09 Oct 2023 13:57:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f5-20020ac251a5000000b0050300e013f3sm1540844lfk.254.2023.10.09.13.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 13:57:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 4/5] drm/msm/dsi: remove msm_dsi::encoder
Date:   Mon,  9 Oct 2023 23:57:26 +0300
Message-Id: <20231009205727.2781802-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no need anymore to stop the drm_encoder instance in struct
msm_dsi. Remove corresponding field.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         | 4 +---
 drivers/gpu/drm/msm/dsi/dsi.h         | 6 ++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 8 +++-----
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index c6d53cccb9ae..33c3437b09de 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -235,9 +235,7 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		return 0;
 	}
 
-	msm_dsi->encoder = encoder;
-
-	bridge = msm_dsi_manager_bridge_init(msm_dsi);
+	bridge = msm_dsi_manager_bridge_init(msm_dsi, encoder);
 	if (IS_ERR(bridge)) {
 		ret = PTR_ERR(bridge);
 		DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 525c7ba22227..d3380326d449 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -41,14 +41,12 @@ struct msm_dsi {
 	struct device *phy_dev;
 	bool phy_enabled;
 
-	/* the encoder we are hooked to (outside of dsi block) */
-	struct drm_encoder *encoder;
-
 	int id;
 };
 
 /* dsi manager */
-struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi);
+struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi,
+					       struct drm_encoder *encoder);
 int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 8eb73287dffb..101e79a6e281 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -431,11 +431,11 @@ static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
 };
 
 /* initialize bridge */
-struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
+struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi,
+					       struct drm_encoder *encoder)
 {
 	struct drm_bridge *bridge;
 	struct dsi_bridge *dsi_bridge;
-	struct drm_encoder *encoder;
 	int ret;
 
 	dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
@@ -445,8 +445,6 @@ struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
 
 	dsi_bridge->id = msm_dsi->id;
 
-	encoder = msm_dsi->encoder;
-
 	bridge = &dsi_bridge->base;
 	bridge->funcs = &dsi_mgr_bridge_funcs;
 
@@ -474,7 +472,7 @@ int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
 	if (IS_ERR(ext_bridge))
 		return PTR_ERR(ext_bridge);
 
-	encoder = msm_dsi->encoder;
+	encoder = int_bridge->encoder;
 
 	/*
 	 * Try first to create the bridge without it creating its own
-- 
2.39.2

