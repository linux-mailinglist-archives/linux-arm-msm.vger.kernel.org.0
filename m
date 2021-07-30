Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E14393DBC8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 17:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234196AbhG3Pqy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 11:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233230AbhG3Pqs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 11:46:48 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D9DC0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 08:46:42 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id k1so11529711plt.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HGNj9GKkPcNlrQ3u81KWmc1E6wLr3PhoH6cMUoSxMIY=;
        b=aFkHg2l6yaOdtV8Ca6Onrbf74caIFdI1DKRYCrMMfbe0xGMSMWUNHQ4PiC2Xz+tAkK
         dFnu5/uRUjjZXlmmpBrzCG1skLJiZEb43HD8O+P7iqHf+jDgRtvaGx+ms/elJxST3cVZ
         lNHsdsBrtQMtOVLrLmb0BtNeapnEzZ8LT8nuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HGNj9GKkPcNlrQ3u81KWmc1E6wLr3PhoH6cMUoSxMIY=;
        b=hYv7DT85baesBBXMYpdFFBnK38/AaIsFY4sKBDLhTEeAHrNbAnIVyHU7g9EqiQvED3
         ESR1A0i8/vEDQgz30bwil5cSKHE/wxrseLPf1JDCn062J84I5JvGeoz5qyFaHUb1HLU6
         1AawbtpQxLYFcwHn0IF8diHyWUyqwdR3TQYPDlIScNjtx5CEXP1P86kGO8A5gyHaP05u
         k2RyXkMeFeU2WOA+k929Yt0jLsQVU/Ox7WXEC7j9PVSjumSYpleent20rURjB63gXG6s
         shp0apmbH4BbMFAySgl1V0QFJGZD/wqzQgubgS7AYrzdYdYCmHrkDxb41hrrgwoJFnrk
         rkqg==
X-Gm-Message-State: AOAM533b6Oclzh+S/6WXl90MUYDS39GtL5g14DDpg55E0Z+0Mj2kZTUY
        FaSpEtUYWFL8exBKkXEzH0v1Nw==
X-Google-Smtp-Source: ABdhPJx+3y28Ce4LyY9cSNNhWVuXUoPdutEn+sS5mEWeDERMUSHe6T3XxxsIUu92Fq4H0NEbRcTjBQ==
X-Received: by 2002:a17:90a:d595:: with SMTP id v21mr3832821pju.50.1627660002461;
        Fri, 30 Jul 2021 08:46:42 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:3424:e0ac:5a92:d061])
        by smtp.gmail.com with ESMTPSA id u188sm3175621pfc.115.2021.07.30.08.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 08:46:41 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, steev@kali.org, robert.foss@linaro.org,
        Laurent.pinchart@ideasonboard.com, bjorn.andersson@linaro.org,
        daniel@ffwll.ch, airlied@linux.ie, jernej.skrabec@gmail.com,
        maarten.lankhorst@linux.intel.com, rodrigo.vivi@intel.com,
        sam@ravnborg.org, jonas@kwiboo.se, mripard@kernel.org,
        thierry.reding@gmail.com, lyude@redhat.com,
        linus.walleij@linaro.org, rajeevny@codeaurora.org,
        linux-arm-msm@vger.kernel.org, a.hajda@samsung.com,
        tzimmermann@suse.de, narmstrong@baylibre.com,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] drm/bridge: ti-sn65dsi86: Fix power off sequence
Date:   Fri, 30 Jul 2021 08:46:01 -0700
Message-Id: <20210730084534.v2.2.If8a8ec3bf1855cf0dbb62c005a71d6698c99c125@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210730154605.2843418-1-dianders@chromium.org>
References: <20210730154605.2843418-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When testing with a panel that's apparently a little more persnickety
about the correct power sequence (specifically Samsung ATNA33XC20), we
found that the ti-sn65dsi86 was doing things just slightly wrong.

Looking closely at the ti-sn65dsi86's datasheet, the power off
sequence is supposed to be:
1. Clear VSTREAM_ENABLE bit
2. Stop DSI stream from GPU. DSI lanes must be placed in LP11 state.
3. Program the ML_TX_MODE to 0x0 (OFF)
4. Program the DP_NUM_LANES register to 0x0
5. Clear the DP_PLL_EN bit.
6. Deassert the EN pin.
7. Remove power from supply pins

Since we were doing the whole sequence in the "disable", I believe
that step #2 (stopping the DSI stream from the GPU) wasn't
happening. We also weren't setting DP_NUM_LANES to 0.

Let's fix this.

NOTE: things are a little asymmetric now. For instance, we turn the
PLL on in "enable" but now we're not turning it off until
"post_disable". It would seem to make sense to move the PLL turning on
to "pre_enable" to match. Unfortunately, I don't believe that's
allowed. It looks as if (in the non-refclk mode which probably nobody
is using) we have to wait until the MIPI clock is there before we can
enable the PLL. In any case, the way it is here won't really
hurt--it'll just leave the PLL on a little longer.

Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 9bf889302bcc..5e932070a1c3 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -766,10 +766,6 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 
 	/* disable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE, 0);
-	/* semi auto link training mode OFF */
-	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0);
-	/* disable DP PLL */
-	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
 }
 
 static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
@@ -1106,6 +1102,13 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
+	/* semi auto link training mode OFF */
+	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0);
+	/* Num lanes to 0 as per power sequencing in data sheet */
+	regmap_update_bits(pdata->regmap, SN_SSC_CONFIG_REG, DP_NUM_LANES_MASK, 0);
+	/* disable DP PLL */
+	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
+
 	if (!pdata->refclk)
 		ti_sn65dsi86_disable_comms(pdata);
 
-- 
2.32.0.554.ge1b32706d8-goog

