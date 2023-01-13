Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED31966A741
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jan 2023 00:56:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbjAMX4i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 18:56:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjAMX4f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 18:56:35 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A526F2DF0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 15:56:34 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id 7so16025556pga.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 15:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5+evsYAc3b1lQ5lkyPBOLTAudAqBRHFoDkoyn9gzcWU=;
        b=bglNrXXzl+zfB88DcX28XESqwrqWNa2PfHlGEAegGmswKUvIEGuclPlzAGHJAX4jCa
         JS45SdnMg4dw/bRTbacQImuLolP2g4t6Xy/VSB3Vr6FXhf/nsHLl/zrsvI+YI1cS/bWg
         79LDXePloaL1xmygJa8gaMTVJUaxRy4BV/MC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+evsYAc3b1lQ5lkyPBOLTAudAqBRHFoDkoyn9gzcWU=;
        b=q4GrE6rMAkWLDfG8sFuvkdcqK3IZsxSMtXpMk9XQcf2eAGWyHTNMrPPbqebQosZ7/g
         BgfQc982kZDHH+kcLu2uNG9eOE6Jghu4yymeR5FPlL7qlFnsfWBlVGzrtrymqQuPmmYj
         t4pJo+4pB9q+RhcF5ePTP3G8MiBhLdgFbY3kX0DBLU0J4BEeXk7aCJdfZaXYqWVcBjzY
         r4HtBYNi2+8sKY6iDUJlEJQgtqo2NYDZ/Gsg22GuB/VflF/9hlkQnS4ARdoqiGSskmJB
         +jC1YYOyv8fVdh8qSlflZL9SVEzmn3jp+JDBCRhDU9GAQFaU6eSSA7gBROR0pWREf2sH
         AkMw==
X-Gm-Message-State: AFqh2kogdgJXWQjoSWvPbE8llIqcJMvjKTPbwhWuEY45xSunEihahtHl
        IC2yZAznFlLoC4wuWWuZd2IhVQ==
X-Google-Smtp-Source: AMrXdXsl5dwvIc5BLm75HVq3ofqQwGV0J7iamu0uFTfbZwquAyj1MTYTinzmzaIutoOWtOvYzd3dTg==
X-Received: by 2002:a62:2746:0:b0:58b:af27:dcda with SMTP id n67-20020a622746000000b0058baf27dcdamr5847832pfn.14.1673654194182;
        Fri, 13 Jan 2023 15:56:34 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:b4ad:3c49:1195:a01e])
        by smtp.gmail.com with ESMTPSA id f10-20020aa79d8a000000b005823b7da05asm10002737pfq.122.2023.01.13.15.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 15:56:33 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Robert Foss <robert.foss@linaro.org>,
        Sean Paul <sean@poorly.run>, Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        David Airlie <airlied@gmail.com>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [RFT PATCH 1/2] drm/bridge: tc358762: Set pre_enable_prev_first
Date:   Fri, 13 Jan 2023 15:56:03 -0800
Message-Id: <20230113155547.RFT.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set the "pre_enable_prev_first" as provided by commit 4fb912e5e190
("drm/bridge: Introduce pre_enable_prev_first to alter bridge init
order"). This should allow us to revert commit ec7981e6c614
("drm/msm/dsi: don't powerup at modeset time for parade-ps8640") and
commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
time").

Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/tc358762.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 0b6a28436885..77f7f7f54757 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -229,6 +229,7 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	ctx->bridge.funcs = &tc358762_bridge_funcs;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_DPI;
 	ctx->bridge.of_node = dev->of_node;
+	ctx->bridge.pre_enable_prev_first = true;
 
 	drm_bridge_add(&ctx->bridge);
 
-- 
2.39.0.314.g84b9a713c41-goog

