Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 874376716CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbjARJAU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjARI6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:58:48 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38CA55A4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:03 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id ss4so73993437ejb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffQ9QQ9cEmbatl2Z6drUHQqKYZ2qTHMnm6bqB742ivs=;
        b=F3zx+o8HIciBkmGlZ+KOd0AIVFAcURL/lkf64wkVSAwBgPm3cGlgJuWYDZEsGvLfwp
         +QGc9hsDxeCVjOCjyOnA9rkbu6uOwNyDpR0rbhT0JvKt9uAMSwbIDKctKCinSov1wv45
         1/D51glaQZp2RT7nlyZpdvV+IMtdRc6FpGTFoynyDdyAjumO4sLqHHjtdTaWs6TQ1Ugv
         yp80S+jU/l5mPKBX5nJbeuhrafJCw73QYYpDbnkpHosQ2VYdPdB/OqZYoR+JKbMasVHT
         LoMOD1MgGrZnG/0YPZFjSQhDeNXOfAljeuKez4cCNXJSDBW7jfMTnuxubSz791yQMiEp
         sbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffQ9QQ9cEmbatl2Z6drUHQqKYZ2qTHMnm6bqB742ivs=;
        b=Jl8pvlV5B0QPABdgsDGCW0y5z7AsgUmx5z1O39UVfeXqEGLyM4AuFu63CqNyHTtRbx
         mF1rHiRlahZiJqQAJSqJehwLunYMw5mTpYV5gSTvxeTm9DBIXJOq1qiqwxyt1e5Ra4A2
         dD21Ew1/dsxxIiHTe6Y57ME1ij/nJClxNs14Nd7znwkcU57i39OJbKylqH/o/qfzj3OG
         sEytJ+jdKyJN3Lc7znlPMjvj5clHbBfdkscBiMjHSr+LVhDe/QRLa0oCBJBd4bKFkow2
         RhcFcT1iuPNWR0gtKfpATcOq0i/aDj8RbqLyKEpBGC4nlWP01O7/fJA8w7j6PW3H9dVj
         Ly2w==
X-Gm-Message-State: AFqh2koXXCjcNRgtIBi9q59ehyDsX6WXT36nX7QDyiJtctkv7P3yKhRH
        Evt1psq1pAUFO+v1SdclK9bzExZWKRw/FgAS
X-Google-Smtp-Source: AMrXdXtiaZSjxKJh/ME5gKEx7BWuOcQQ8+DqDHHvx22LGspB9fRkBIkiA8kRle0Io+wJBIym3/d0hQ==
X-Received: by 2002:a17:906:230a:b0:86f:5375:9f63 with SMTP id l10-20020a170906230a00b0086f53759f63mr5192973eja.39.1674029822451;
        Wed, 18 Jan 2023 00:17:02 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:17:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 02/13] drm/bridge: lt9611: fix HPD reenablement
Date:   Wed, 18 Jan 2023 10:16:47 +0200
Message-Id: <20230118081658.2198520-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
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

The driver will reset the bridge in the atomic_pre_enable(). However
this will also drop the HPD interrupt state. Instead of resetting the
bridge, properly wake it up. This fixes the HPD interrupt delivery after
the disable/enable cycle.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 2714184cc53f..58f39b279217 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -856,12 +856,18 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	static const struct reg_sequence reg_cfg[] = {
+		{ 0x8102, 0x12 },
+		{ 0x8123, 0x40 },
+		{ 0x8130, 0xea },
+		{ 0x8011, 0xfa },
+	};
 
 	if (!lt9611->sleep)
 		return;
 
-	lt9611_reset(lt9611);
-	regmap_write(lt9611->regmap, 0x80ee, 0x01);
+	regmap_multi_reg_write(lt9611->regmap,
+			       reg_cfg, ARRAY_SIZE(reg_cfg));
 
 	lt9611->sleep = false;
 }
-- 
2.39.0

