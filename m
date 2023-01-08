Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870F36616E5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 17:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233171AbjAHQ5D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 11:57:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbjAHQ5C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 11:57:02 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F6725D1
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 08:57:01 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id y25so9521668lfa.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 08:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aURTF4UTNK5+9lO/Hwf/8gndFQ6qOIZny88iB+hQmBk=;
        b=FadltuIVXiXfLKLbIFGk9qMxWJZd0pgdWhDhnMGr7WCcONmtQ0mXvacTSch1FYMboU
         Kw7aYSYw3CaucKf0i0sK3OEpvgExGpbWDM5jWw9ZG93jxIhuMV3M9EniQmnOSJt6nRgj
         0sb7Wx80CAqv1SkZrhRqYC0ed4+9TimMNahppUpsuXdwPTkZaVUBXthTjrQA/1me5WD/
         wR7MQWlEQ310OKHGa7JQe9dWRt0WIp5Ygk90v6b/c87H/NYltoGbK9l5JdGedebei++u
         bTzGof767qoaQEEB5CleBxssgeqrK3ZYfG9UdmCb36jx5cHAmDxCcDLvfQMSzwffzjGr
         DpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aURTF4UTNK5+9lO/Hwf/8gndFQ6qOIZny88iB+hQmBk=;
        b=joeIlE5r8Q5F8F5kr+vrTsJVpv2DmuQEPYdd77jQHwezUZTlkkXMHv3bMDbhQow3Ww
         /I3UiCOGO49xNTpRmItAAVr55ktw+6EEbuycsxevU/EqBOlsj70KQCBK+tX8KvOgkFqV
         9vIM23tmn+2km8W2DovhSpt+tJ7M/DdKt+7vRaWx22yvoPj9Fse+0NqBTjnBiRMQ0WSP
         wxteTQZ0Wj4C+vTGZ/dzk1sl7x9gryuIMTc5XY75/AcO6KZ8yh+Z9GroKWTuqb5wvmGB
         eAu5dMimQKKmoko0V647lnMaTzbYfNavzigvAcaR3EJfFiSec/0BvSJ1i9ab70a/OuUJ
         03yg==
X-Gm-Message-State: AFqh2ko/c6YZNJREqsUwzPkIiNceUlv8aOB/a/R/yvwIx1rGm2lInMub
        YxdfbbIMD5/VoMQ5MLPqE+VP4g==
X-Google-Smtp-Source: AMrXdXu1iHxeu2ExX/A+b5b1uN5KzYXpvD2t4qxsiZYqDufquyjI+BUz/2egXzyca03hmYTvGJ3e+g==
X-Received: by 2002:a05:6512:10c3:b0:4b6:e64c:aec6 with SMTP id k3-20020a05651210c300b004b6e64caec6mr21265840lfg.63.1673197019293;
        Sun, 08 Jan 2023 08:56:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 08:56:58 -0800 (PST)
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
Subject: [PATCH v2 02/13] drm/bridge: lt9611: fix HPD reenablement
Date:   Sun,  8 Jan 2023 18:56:45 +0200
Message-Id: <20230108165656.136871-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
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

