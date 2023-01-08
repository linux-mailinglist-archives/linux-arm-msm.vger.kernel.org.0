Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF3E36616F5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 17:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233213AbjAHQ5L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 11:57:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234019AbjAHQ5I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 11:57:08 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7BE860D0
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 08:57:06 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bf43so9535767lfb.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 08:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VF5ULjO8Nsom9+kPMKOkmOPhLqLOBqB6rEP7ZLKg/cg=;
        b=fCuyGkhONFBFCIntZiPzrNU6TIwzenYQIrN2R9WluJ7c5pJmfRL/hGq7p1CfhPwoYS
         T3gMB0GBRTcfxJNpUap29X/mSZXIx+gpsfsUVZGw/zx83UW6KHr5lffAQ3wQD2ey31Sm
         uyp+IdZRJNbIZqgEGPBdHYxsjr75Rw3u+MIbKEkJ8wLfU7MFy/HS2fi8epUfGSoHbKy5
         cZf8OLn4AUbqyTRZ6SASGaqJUx6BZJw0CAHH0k+5mJSKPaD3jlewnQweY7Pq9hvs/r+X
         9cI4NS0bWZQuSXmTPvWItQyi4khjU0NSW3nKokb4r7rkKgCXJGnnln03au5am3UEC+lN
         8oXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VF5ULjO8Nsom9+kPMKOkmOPhLqLOBqB6rEP7ZLKg/cg=;
        b=fOETpXwg/LW4bfb4Z4XA6ifKgb2nG8AbEqnz4XK5/XqwHUqlYySnLf/g3n+qEB66y/
         LsADH9SP/vLVcCtIJ/XcYVS32oE0IgELLmpKgBA60gOfmxnW/1osunjKBGl+zgEz+4sr
         e2irt1x7+qmcxkw9+pkPURI2Zh+eyIfGBPIQS0qo7ViJV/DlbRXxl5jiRyWnxyUIonQy
         gZNj49qKqZiHPP5vIAZB2SWskj0tGbkVSvNjw+JJMQbUn5AAMZ+1jKl8SNer4VxCv7JP
         PDyp6or7FoAQdWUCc193Hg3LcT80+dQTkp1SnyOEUbd2lOwSVuwy9T9hVYLPURz/a+6X
         dozA==
X-Gm-Message-State: AFqh2krEHE3AnwLWx/X33WdMGDGRvpfSo3wwPWOTSwTX3LDDXEnpMCUJ
        bbR8g0fMDrQoO3OF7pGC4DtH4w==
X-Google-Smtp-Source: AMrXdXsBGlNd7jK7tTazi2o3aynBgbzQGJUlQBLnfvsAvlKqPQVEbViC06RKS6edaTT+EN8Tr5e30w==
X-Received: by 2002:ac2:4adb:0:b0:4cc:83a5:e64e with SMTP id m27-20020ac24adb000000b004cc83a5e64emr75825lfp.60.1673197025158;
        Sun, 08 Jan 2023 08:57:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 08:57:04 -0800 (PST)
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
Subject: [PATCH v2 10/13] drm/bridge: lt9611: simplify video timings programming
Date:   Sun,  8 Jan 2023 18:56:53 +0200
Message-Id: <20230108165656.136871-11-dmitry.baryshkov@linaro.org>
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

Inline calculated values to simplify the calculation in
lt9611_mipi_video_setup().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 7f9be74acf0d..1396ab081f61 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -155,12 +155,12 @@ static void lt9611_mipi_video_setup(struct lt9611 *lt9611,
 	hactive = mode->hdisplay;
 	hsync_len = mode->hsync_end - mode->hsync_start;
 	hfront_porch = mode->hsync_start - mode->hdisplay;
-	hsync_porch = hsync_len + mode->htotal - mode->hsync_end;
+	hsync_porch = mode->htotal - mode->hsync_start;
 
 	vactive = mode->vdisplay;
 	vsync_len = mode->vsync_end - mode->vsync_start;
 	vfront_porch = mode->vsync_start - mode->vdisplay;
-	vsync_porch = vsync_len + mode->vtotal - mode->vsync_end;
+	vsync_porch = mode->vtotal - mode->vsync_start;
 
 	regmap_write(lt9611->regmap, 0x830d, (u8)(v_total / 256));
 	regmap_write(lt9611->regmap, 0x830e, (u8)(v_total % 256));
-- 
2.39.0

