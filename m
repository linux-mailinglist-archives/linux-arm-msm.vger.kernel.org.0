Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71F80123BDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 01:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfLRAtD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 19:49:03 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43292 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbfLRAsa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 19:48:30 -0500
Received: by mail-pl1-f194.google.com with SMTP id p27so159122pli.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 16:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HDKxrm8qbiseZpINUS2THSIzKVnfxADUHOX9BkwXa5I=;
        b=A+IWB1djfknbsl81FdVJIHvTstwrlQveoEV3ZRtLIqL9M96weAyc/9CS8rLeLoAC5B
         fYlcX0PYn9ysXTaCLi6fk+98S8+ecs/drDbJW970V1yWKMPUN0ZHPrI9h7ShDvGboCEW
         V1JH6bjwiMHOPolwBAXheY8H6YHmYjYR4TtBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HDKxrm8qbiseZpINUS2THSIzKVnfxADUHOX9BkwXa5I=;
        b=N97se5aXUHC4TJ8ka8TP2qL82rNDB4WaBwg1wO9mPA/Ai9JaIWWpTpa63XKbyRiiMd
         sbO1QMFtbHerdKyHBHpgzArGGosR0caXgHaSuXdyq84Thf4ZTdVG2WVQNm21PobZ0ntq
         +AOv4sPFWoypPOdZaCMtUnDckePzbc8k/RwFgb3Np8S4Ov+6SsUuBRm3DO7v3mQ0WwzT
         9RQl1VUgzUkjtzJmgA2KhOt6BiFm1/6UGgjL+qa6ffPSYy1PFosoY2twYaeESvzptAo3
         lZx0+0Y7j1Wl/GHUgIPcCWGxgFHFk3b0QmAj7Yp9z5owYajI4+BLasKyr2uM9V45/aIJ
         7lAQ==
X-Gm-Message-State: APjAAAVu/3S+xbR42SPdYnHF9ip5yoSjZ+C2Y8l5hQNpUmT8tHfips5I
        UMtzi+bHL0W1RwSgQOx3nPyo6Q==
X-Google-Smtp-Source: APXvYqwFC+Om/wChNdc7jcBbpixvq5sZ7+7TyGGtLM++d9zcZ8koIF0v49FeOn3pO25lrUxFDV4l9g==
X-Received: by 2002:a17:902:7e49:: with SMTP id a9mr1023302pln.230.1576630108115;
        Tue, 17 Dec 2019 16:48:28 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id v72sm139885pjb.25.2019.12.17.16.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 16:48:27 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     robdclark@chromium.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, seanpaul@chromium.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 2/9] drm/bridge: ti-sn65dsi86: zero is never greater than an unsigned int
Date:   Tue, 17 Dec 2019 16:47:34 -0800
Message-Id: <20191217164702.v2.2.Id445d0057bedcb0a190009e0706e9254c2fd48eb@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191218004741.102067-1-dianders@chromium.org>
References: <20191218004741.102067-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When we iterate over ti_sn_bridge_dp_rate_lut, there's no reason to
start at index 0 which always contains the value 0.  0 is not a valid
link rate.

This change should have no real effect but is a small cleanup.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Rob Clark <robdclark@gmail.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---

Changes in v2: None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 2fb9370a76e6..7b596af265e4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -458,7 +458,7 @@ static void ti_sn_bridge_set_dp_rate(struct ti_sn_bridge *pdata)
 	/* set DP data rate */
 	dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
 							DP_CLK_FUDGE_DEN;
-	for (i = 0; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
+	for (i = 1; i < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut) - 1; i++)
 		if (ti_sn_bridge_dp_rate_lut[i] > dp_rate_mhz)
 			break;
 
-- 
2.24.1.735.g03f4e72817-goog

