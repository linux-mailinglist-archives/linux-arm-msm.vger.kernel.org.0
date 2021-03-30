Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5250C34DED0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 04:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhC3CyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 22:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbhC3CyF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 22:54:05 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5122C061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:54:04 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id w10so6349045pgh.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v0a82Fvj95xpPBe4qqrq7QwDbwlHgP+SSdPbPFDe0q8=;
        b=CVcj4Vw20yH89xN07Z6BhprfbML7ZL5HUvCtvJwTUB3wWjw/+M0p1pBa875Ap1fZJx
         4kAqftRj9MPjSe8yPMhTJmaW5VZDybBxwSyhywGaMBO9hvyfusHZglZF9EPF+I8Vy6uH
         mX5aECtiRVrVMN7I6lTJ1fj9R9af5yBJaMo60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v0a82Fvj95xpPBe4qqrq7QwDbwlHgP+SSdPbPFDe0q8=;
        b=IkQlv/MjX+wQDACof8op21F9ECwm9VAlh43IxeM1Mr9TrRrGzNJW8xqvfIJ9jIU+dJ
         nooy0mvoK8ndMVYyngqST4AG4YXBqpJuEl+CnyNi/2Bn7MkEJtxPzdxePdwvFwzJCoM7
         cGGHNYGslq3hKXvmReZbr+FOorx8ch9NXjIZirYtJw6dZYui3lXWx31FVS5FaMsLSfU+
         sVhwdxDs0vuXu+3ToFVl7J6idSA5KU0WVukd7UmG/OwV1sjSMHHHiu44etzmjkheNElP
         t3spmC1s/tqp2BLV/eINJm+7HCwd8esia3ud9eBb0QEW9C3wjeb1KG1sVi2CBVvp2ONZ
         Purg==
X-Gm-Message-State: AOAM532mY+nnxXvYEEGAMD8cowB1YtGV+qfK9534yEBJdR3VAm56WCyO
        6KBu7zgNdg2MhTXw74WN25+X5Q==
X-Google-Smtp-Source: ABdhPJzYHHI11ASL6+sqBEqRntEX4mX3gGBjkpvTlBS2HCIxzcLVie16h9UEbsEDFRdBJqvUhgWQ7w==
X-Received: by 2002:a65:4986:: with SMTP id r6mr1027046pgs.392.1617072844237;
        Mon, 29 Mar 2021 19:54:04 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f599:1ca7:742d:6b50])
        by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 19:54:03 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        robdclark@chromium.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/14] drm/bridge: ti-sn65dsi86: Simplify refclk handling
Date:   Mon, 29 Mar 2021 19:53:33 -0700
Message-Id: <20210329195255.v2.2.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330025345.3980086-1-dianders@chromium.org>
References: <20210330025345.3980086-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The clock framework makes it simple to deal with an optional clock.
You can call clk_get_optional() and if the clock isn't specified it'll
just return NULL without complaint. It's valid to pass NULL to
enable/disable/prepare/unprepare. Let's make use of this to simplify
things a tiny bit.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Changes in v2:
- Removed 2nd paragraph in commit message.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 88df4dd0f39d..96fe8f2c0ea9 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1275,14 +1275,9 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	pdata->refclk = devm_clk_get(pdata->dev, "refclk");
-	if (IS_ERR(pdata->refclk)) {
-		ret = PTR_ERR(pdata->refclk);
-		if (ret == -EPROBE_DEFER)
-			return ret;
-		DRM_DEBUG_KMS("refclk not found\n");
-		pdata->refclk = NULL;
-	}
+	pdata->refclk = devm_clk_get_optional(pdata->dev, "refclk");
+	if (IS_ERR(pdata->refclk))
+		return PTR_ERR(pdata->refclk);
 
 	ret = ti_sn_bridge_parse_dsi_host(pdata);
 	if (ret)
-- 
2.31.0.291.g576ba9dcdaf-goog

