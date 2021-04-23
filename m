Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA575369794
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 18:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243237AbhDWRAZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 13:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243089AbhDWRAV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 13:00:21 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06458C06138F
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:59:45 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id em21-20020a17090b0155b029014e204a81e6so4758575pjb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xP5DIs1FkSE0BDkM2KIzYkHfQ0hdD3i5eW0X+nUNW+Y=;
        b=Nui0pXvr5mJQMbnlzuYsHB8sZuXeWkPY3IJOWfaIzTzDi/nK7GX+qeRokQsNKy2fYL
         j1y6mX12y+CQx8BOw57VkZYhCBu6XhRlhhbJYAlTfbuYaUlcixbob351UBwviRX9wNcv
         xKZ6ARbbjmm25KQR9dd0/UTv4z2clW3SG0Ocs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xP5DIs1FkSE0BDkM2KIzYkHfQ0hdD3i5eW0X+nUNW+Y=;
        b=iquxHRhGodTlAAtgkcE9STw/LAkkgPRmGSXQgHqGrTe2tl15DjCWGJJccAb2mVOy6r
         D816qrDVBwIZEbVU/72YWH0jGj8wkUpoOq5h5R5l+DHs/ZwOvidjY5760H2cB5uBRo4j
         e8YS9OrO0VWHl2hveS8Ws/OtQxPyrmDQH/uk7vT1mFXZ7ewltXeYvfdLb7swzd/qjSnV
         2Ha8hMwJGI0SRiaTCYoF715/eJbsAMnKHsUo5xQDoa2F9qXhG0/h12KYtMm6ATZG959f
         9hd5THFVFJ2sicduNI1qHfAfl4MBtFTmyyh81SVIygX9VUQAXaORIt41YclVP8o2i2e4
         7hnw==
X-Gm-Message-State: AOAM533QXocLSRb00pjjkIudriRHDKRB0/EyYDiFK61OzA6rMxWVKFMe
        59u+QTkEXY58O9Jcl5Oppe9DBQ==
X-Google-Smtp-Source: ABdhPJxb8n3U3zZOiWMrXechOGFa6o/j6TcVWcBF+GRLB7Z3nK12l4CAlGd+Lw7zqpaW3ocWIOL1DQ==
X-Received: by 2002:a17:90a:a395:: with SMTP id x21mr5425317pjp.95.1619197184632;
        Fri, 23 Apr 2021 09:59:44 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6d86:663d:71f8:6a11])
        by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:59:44 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/20] drm/bridge: ti-sn65dsi86: Use devm to do our runtime_disable
Date:   Fri, 23 Apr 2021 09:58:50 -0700
Message-Id: <20210423095743.v5.4.I1e627eb5f316c0cf6595b120e6e262f5bf890300@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's no devm_runtime_enable(), but it's easy to use
devm_add_action_or_reset() and means we don't need to worry about the
disable in our remove() routine or in error paths.

No functional changes intended by this change.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes in v5:
- Reordered to debugfs change to avoid transient issue

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 57574132e200..44d8395505f0 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1213,6 +1213,11 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
 	pdata->ln_polrs = ln_polrs;
 }
 
+static void ti_sn65dsi86_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
+}
+
 static int ti_sn65dsi86_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
@@ -1272,12 +1277,13 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return ret;
 
 	pm_runtime_enable(pdata->dev);
+	ret = devm_add_action_or_reset(pdata->dev, ti_sn65dsi86_runtime_disable, pdata->dev);
+	if (ret)
+		return ret;
 
 	ret = ti_sn_setup_gpio_controller(pdata);
-	if (ret) {
-		pm_runtime_disable(pdata->dev);
+	if (ret)
 		return ret;
-	}
 
 	i2c_set_clientdata(client, pdata);
 
@@ -1314,8 +1320,6 @@ static int ti_sn65dsi86_remove(struct i2c_client *client)
 
 	drm_bridge_remove(&pdata->bridge);
 
-	pm_runtime_disable(pdata->dev);
-
 	of_node_put(pdata->host_node);
 
 	return 0;
-- 
2.31.1.498.g6c1eba8ee3d-goog

