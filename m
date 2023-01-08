Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D16CB6616E6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 17:57:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233401AbjAHQ5E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 11:57:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbjAHQ5C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 11:57:02 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28491178
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 08:57:01 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id v25so9496862lfe.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 08:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZbpMMJayX1Y27MwQ3eHOLuGX6M4NgpDUpVAQPdHpwg=;
        b=JwRMK+/DJJm+4Kr83NfHDU4UDfp/HcTiQIs3kBx+7G+CvWdP6us0FNw9fTPb9ReDIg
         8awMwlvRZZ1AGLUjxDZMKl/VJpG68NJcOqaLfSJR0kWiEkmLKPbdQv7lyO/DyXFp94+0
         CSoJ5oEW8tDY2oyL5Jo1rVsk0l37Uv6jcD9REB4+JEAhQFDBPqfHUpt2QJ1dqJypO3tC
         t7Cx4ZTHugFWdfQVaXUx7dMhL9crxFuhtTYXmY1qI855oKspqREyUv3WcMT+WKa+ZEAW
         TWoKubgWS36r+6wgvqc5kxkkwtw/UOXcsDdRHmUVUpQDZj1BgKXU7LUV+B72V5gRq3Ql
         EUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZbpMMJayX1Y27MwQ3eHOLuGX6M4NgpDUpVAQPdHpwg=;
        b=xGq9TbKW9vhAExLLr5y6aG/3mziGdUHUzIKANZEA+E3leoaMcXgvtbfUWrA4DaaFVV
         XTLzyI4nlH2Pg+Jy4Tifk52qxCxmLlej8rgUTzXsg6SPEMJHUX4fCS9tQOkWiBbRGOR2
         cHQ6uXfY+dzpy9WVYO08iysJG5mnP3+tgNNMvwN8ZFIzwFIsjv/WVNv97+7UztIen5bU
         KPkpyV8ZcmsJKY0At80jUtTGw5P+QmISR3UDsItozbKO+XD3rZj75vkd4759k2ycWroI
         3jinxiC55gBQR0IVObTnTCZU0I7zSyU2/wg6V7f6/Wivt8hraeTLFiH4lha+aI76voIe
         sXbA==
X-Gm-Message-State: AFqh2kpVcnPO9H1+Sp5b1RYImwiuZjBC2n5AV0mA5HQMRiwhQsHyYZKt
        bqU0sQf5rucwsR9mcYviOCOq+w==
X-Google-Smtp-Source: AMrXdXs0EGrOEFr2U+1r7ljGQqrNVBcmIDEWIzTZTSYAS/56AUf8+K6vD6iRgRYzkUiMxRMVaZd8YQ==
X-Received: by 2002:a05:6512:3c89:b0:4b6:fddc:1fcd with SMTP id h9-20020a0565123c8900b004b6fddc1fcdmr22972112lfv.23.1673197020000;
        Sun, 08 Jan 2023 08:57:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 08:56:59 -0800 (PST)
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
Subject: [PATCH v2 03/13] drm/bridge: lt9611: fix polarity programming
Date:   Sun,  8 Jan 2023 18:56:46 +0200
Message-Id: <20230108165656.136871-4-dmitry.baryshkov@linaro.org>
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

Fix programming of hsync and vsync polarities

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 58f39b279217..deb503ca956a 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -207,7 +207,6 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 
 		/* stage 2 */
 		{ 0x834a, 0x40 },
-		{ 0x831d, 0x10 },
 
 		/* MK limit */
 		{ 0x832d, 0x38 },
@@ -222,11 +221,19 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 		{ 0x8325, 0x00 },
 		{ 0x832a, 0x01 },
 		{ 0x834a, 0x10 },
-		{ 0x831d, 0x10 },
-		{ 0x8326, 0x37 },
 	};
+	u8 pol = 0x10;
 
-	regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		pol |= 0x2;
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		pol |= 0x1;
+	regmap_write(lt9611->regmap, 0x831d, pol);
+
+	if (mode->hdisplay == 3840)
+		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
+	else
+		regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
 
 	switch (mode->hdisplay) {
 	case 640:
@@ -236,7 +243,7 @@ static void lt9611_pcr_setup(struct lt9611 *lt9611, const struct drm_display_mod
 		regmap_write(lt9611->regmap, 0x8326, 0x37);
 		break;
 	case 3840:
-		regmap_multi_reg_write(lt9611->regmap, reg_cfg2, ARRAY_SIZE(reg_cfg2));
+		regmap_write(lt9611->regmap, 0x8326, 0x37);
 		break;
 	}
 
-- 
2.39.0

