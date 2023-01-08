Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9FBF6616EF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 17:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233542AbjAHQ5K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 11:57:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233580AbjAHQ5H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 11:57:07 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0422260C5
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 08:57:06 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id g14so6532524ljh.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 08:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NH1d+1PPDWydMKrpXiB7N/7rHowCambw1HmOt4U8TEY=;
        b=Mc3S+dGTVyt3txPpj+xX7j2IQEbdfxP887iPwB8+OpSsJetRWSzuWELPuhoc8AJHJE
         Chz4gJNUCA0DO9/rcAF1QNSr7fg3NKrSRe3VVeL1LKqqcZIWJX1Ier/rtAY68BAAqLT3
         WrnBLU1TtpZkOrE3YGD7kNHPKmhbAFzF1AAC6uWZ1Xja5Sy/1DcxlRkZaa3XKlKqC5yZ
         OeKP4sYO3w8qC7JGmQNEn332SDfM/nf9DrmEvdzbdBZOZAXLx1A4a2ljK9C1LD6exSTx
         bYTq2XNnMtbTAZZpKByQibYXU5ilPYJl0dQ66bCAbg2AyQ6olSFDF01EoiSwFajuAAG9
         +r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NH1d+1PPDWydMKrpXiB7N/7rHowCambw1HmOt4U8TEY=;
        b=quAv92eTDqSdaFv7PDpyukntVaTiUe7vaGMXABlQkrqNU1/NGD5SDSaC9L3wJqIHxz
         LrcyJoXo+/yLWBV4PXjvZKz9XPFEYwUBgkC8sqQakvddh/bXwmzYUHF6kgo1V9e99fMh
         gxHoAgk1vSr0IqXEbBXF+2KDPGVuYE4a0gOlOxkYlFSR8gI5zxnL8HnosRAwz4TmHeMD
         t32uq/9WYgiGuTjPuCdjOjCVKd97unmj8MJCimEEfrq1iBzINcRXW0bLUAuN30xxPK8l
         hWfGaIm8qx6xOs1wJ+iQC2bQWYIv4q9+ii+posQDTBby1YD8aibNs815PwKGbu7ZoiGG
         L63g==
X-Gm-Message-State: AFqh2krNPWnO6NT8usy4Xue6C0MLclfXznkkyH3Pv1Uswb1YjL1WVIfR
        JiT5xRyH46gXXBdzE1NwZ3JnUw==
X-Google-Smtp-Source: AMrXdXssQ9vFGz21nmCaS2uBYJfIJBiPV2tuSTMIYZFfwOKfLE65KNuB3AcOhiEe6S+RBjkOIi7NAw==
X-Received: by 2002:a2e:9207:0:b0:27f:ba2d:6d64 with SMTP id k7-20020a2e9207000000b0027fba2d6d64mr13436717ljg.43.1673197024406;
        Sun, 08 Jan 2023 08:57:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 08:57:03 -0800 (PST)
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
Subject: [PATCH v2 09/13] drm/bridge: lt9611: fix sync polarity for DVI output
Date:   Sun,  8 Jan 2023 18:56:52 +0200
Message-Id: <20230108165656.136871-10-dmitry.baryshkov@linaro.org>
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

Attaching DVI sink to the lt9611 requires different setup. Fix the
register write to make the DVI displays sync onto the correct sync
pulse.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 773d7a56f86f..7f9be74acf0d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -352,13 +352,16 @@ static int lt9611_video_check(struct lt9611 *lt9611)
 	return temp;
 }
 
-static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611)
+static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611, bool is_hdmi)
 {
 	regmap_write(lt9611->regmap, 0x8443, 0x46 - lt9611->vic);
 	regmap_write(lt9611->regmap, 0x8447, lt9611->vic);
 	regmap_write(lt9611->regmap, 0x843d, 0x0a); /* UD1 infoframe */
 
-	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
+	if (is_hdmi)
+		regmap_write(lt9611->regmap, 0x82d6, 0x8c);
+	else
+		regmap_write(lt9611->regmap, 0x82d6, 0x0c);
 	regmap_write(lt9611->regmap, 0x82d7, 0x04);
 }
 
@@ -719,7 +722,7 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
 	}
 
 	lt9611_mipi_input_analog(lt9611);
-	lt9611_hdmi_tx_digital(lt9611);
+	lt9611_hdmi_tx_digital(lt9611, connector->display_info.is_hdmi);
 	lt9611_hdmi_tx_phy(lt9611);
 
 	msleep(500);
-- 
2.39.0

