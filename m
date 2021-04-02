Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79AE35311D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Apr 2021 00:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235946AbhDBW3i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 18:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235721AbhDBW3f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 18:29:35 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E804C0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 15:29:32 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so5150005pjb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 15:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5wJ6M1bGIwRFPnVY3IaI+9jJdO1aYMpIT1iEsleX6Es=;
        b=ePUgktHW5kXZRuCKf0O/J58zQqgVweIOh+yyjfO9NbSrepDLjup46dgomfaobMeofj
         zFcaxBHZQokhH7cWG0hD+zIm2epwgUJawcrSxBtwmoKoFI/t49+gZKnr4jTfOAz8NCsH
         RDzKBedY9tSMoPzPTOad+bNjiXb7I/S3x7g2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5wJ6M1bGIwRFPnVY3IaI+9jJdO1aYMpIT1iEsleX6Es=;
        b=F5eCJYYaaz6UgvWAQrM7SldpotJZ8Gemm2BNrZnZZKzhBbDXRBlXxNyFxoKC66qSAM
         FzQnSr9C1+BE2RXSdmha85TSuR/hOhYGaJTH2J82LvKAslGbqGM/9emWIOtHLUNEEdLc
         RQs451i99BM2NHQJnCrjAKYB8rkDv8vUbVuU3Wo93aIrhlGJXsMMX99fvWCanXrDeela
         f7ct8IB4/2t/SVx1Ot71XhmiES/PJfxbB6NXr526QoflIPlXD0z442WcrmefnumXJOlt
         LoawjRIdNKgJ+XCGGWPYIFn1tczz32ZY/jGzna/ePkzc42Un7dwgu7JukUlWrnF6HJrc
         y2pA==
X-Gm-Message-State: AOAM531Sikb879/wJ1P7J2Ut7qrgBUw98filHPlzx64o+szAlHGSVEsB
        rsL/wekcWZoJHyGBZ6On7fIbNg==
X-Google-Smtp-Source: ABdhPJxsjTz8h7xHUz2mmZKKY+Ac8x0Kwl9t3r7hiHvG5cMx0anZAHyd8M6rX41TxpSme+MUXcqqaA==
X-Received: by 2002:a17:902:8e83:b029:e8:c8bd:f65b with SMTP id bg3-20020a1709028e83b02900e8c8bdf65bmr3192394plb.4.1617402572240;
        Fri, 02 Apr 2021 15:29:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
        by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 15:29:31 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robdclark@chromium.org, Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/12] drm/bridge: ti-sn65dsi86: Move drm_panel_unprepare() to post_disable()
Date:   Fri,  2 Apr 2021 15:28:39 -0700
Message-Id: <20210402152701.v3.5.Ia75c9ffe2a2582393a8532d244da86f18b4c9b21@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210402222846.2461042-1-dianders@chromium.org>
References: <20210402222846.2461042-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We prepared the panel in pre_enable() so we should unprepare it in
post_disable() to match.

This becomes important once we start using pre_enable() and
post_disable() to make sure things are powered on (and then off again)
when reading the EDID.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c006678c9921..e30460002c48 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -452,8 +452,6 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0);
 	/* disable DP PLL */
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
-
-	drm_panel_unprepare(pdata->panel);
 }
 
 static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn_bridge *pdata)
@@ -869,6 +867,8 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
 
+	drm_panel_unprepare(pdata->panel);
+
 	clk_disable_unprepare(pdata->refclk);
 
 	pm_runtime_put_sync(pdata->dev);
-- 
2.31.0.208.g409f899ff0-goog

