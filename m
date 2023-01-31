Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4D368394B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 23:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbjAaWW5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 17:22:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbjAaWWz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 17:22:55 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE13A5AB5B
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 14:22:19 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id jh15so7530695plb.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 14:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nDJfgGY2Uq4pkbdaiIQ1ONvu1Aumpm8UVU5btqep3hU=;
        b=C//XxpbCdZukvZqKglW8c6wuEVing1SDTbUUogS/ymch/qoW0vbXqPjsij+7C39bKM
         cz2v/jqa/PU4i47Iz53rPk2Vw3mNsCvZevPClswFn03twuQH9OPEeoCTzI0WxPUHRVN+
         yilQTQAnqMoG4QmPIPzwSaV9MSqokzOW+hEIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDJfgGY2Uq4pkbdaiIQ1ONvu1Aumpm8UVU5btqep3hU=;
        b=lax3QtE8GpKyxfIluS9tljKfG0m1mq1x7jEoeinsHTssDjtOrhbrljhqRY/waNriel
         noLRZqt9/4kr2qe+Pjgv97cZYDifLOpcIi+hXM+yKRvZzkQ4IJwlexKkQUodeFAh9xyW
         TFKT+7Y+dN9G/OZTulqYKxLlKDvSm3/8XWxxmJej6Ql4Fq0zjtddhQ7SEr32E9Clg6Ru
         gojGQX8pWDsQp3BblK4sNVxS9mg0mcwmCNd5kNpekSpuog8IDNdn+NHPB/ZijTBTqlgJ
         yno+iLShypKASo0ERjYbEz/l3rQQlD2/PMoxEfG7SoatEshhPJJwcg5/5XqzhQrqHb83
         cgrg==
X-Gm-Message-State: AO0yUKUK+GK8N55tAjsGcu11/lfeWdaJxHh/v3bZl7cJ1uHFruUSTcbl
        pJ4DQ4/tV+b83bNBLpIGP96xew==
X-Google-Smtp-Source: AK7set9E0fDgYOMAjwM1gzKlM6zWrGLc2FbOBfwbJBwFkBrg9zJem7/LBAqKEjhYlOZ3sKIlqEM0TA==
X-Received: by 2002:a17:903:138c:b0:192:d625:ecc4 with SMTP id jx12-20020a170903138c00b00192d625ecc4mr495493plb.18.1675203738010;
        Tue, 31 Jan 2023 14:22:18 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:138e:73d3:502:64f])
        by smtp.gmail.com with ESMTPSA id d18-20020a170903231200b0019339f3368asm10377471plh.3.2023.01.31.14.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 14:22:17 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Sean Paul <sean@poorly.run>, Jonas Karlman <jonas@kwiboo.se>,
        Vinod Koul <vkoul@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 1/3] drm/bridge: tc358762: Set pre_enable_prev_first
Date:   Tue, 31 Jan 2023 14:18:24 -0800
Message-Id: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

(no changes since v1)

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
2.39.1.456.gfc5497dd1b-goog

