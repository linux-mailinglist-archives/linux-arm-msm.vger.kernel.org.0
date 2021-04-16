Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768C4362B64
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235144AbhDPWlg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235081AbhDPWlc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:32 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B8CC061761
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:06 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id w10so20145364pgh.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ymf7bx9leANTZpwnVQiZwmb6scbgdaMgrPOZD8Is/h4=;
        b=jc6u9p8ciGL2bCqxuj4ZDGRafg8l47hR2Cs2zA5qqs87Co5cL2GIT6wd1jW3ZFwgMQ
         fALkWO05ogZ8dPwsvZTobEUsF0bYwmWTGWnFCJjI6KZOg+KEQVV0n/eQoXZLNeNes1Oc
         OGxst+KbPqkPj54qMo8EqB5YA5IOBUJjERAHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ymf7bx9leANTZpwnVQiZwmb6scbgdaMgrPOZD8Is/h4=;
        b=uD0FmYXk8vYYtkis7HtTcPY2KAIYdwVqoQQrpEMthTNaQjI08IQyOAtRrHQWo7z/Cv
         KvBgBEilWEz/IZhXdzxXTDpsZ+RiL5vmCdtNpIB6M0sbib94hWyAbvyrhANcAH1rofhq
         NI4EVbtabe/w0zRIXICE177csYliW8LbJ82bEjRMhdpD/Jqubo4pb5AGIvIoCpio9MJg
         bcQuKrJKV/aedch7Wo5rAndXNleEf0EX+AS9Ex8Htzo9nmgAZeEDQDbjs1m7TcCSLg7Z
         E9PPl4w8Tp6QrY2JfAzeZQ40uaAirBypCRb+uIfCWDK3shcJ/qvM0r4KejG4+G2UKWdu
         Modw==
X-Gm-Message-State: AOAM5313ahJ8KlgO9b6iNyRa8fIZha0H7913xHaMM1dIn1da57jgYUAB
        J90rkt4y5HYrGXnfNVVQRxlV9A==
X-Google-Smtp-Source: ABdhPJx1npPfUlgCJtqDACAIBggvwNfmcoJ69MZjwE/kobRR/im0peXQHe7607NtYRxqMjQGTcmx3A==
X-Received: by 2002:a63:164a:: with SMTP id 10mr1164348pgw.186.1618612866448;
        Fri, 16 Apr 2021 15:41:06 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:41:06 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/27] drm/bridge: ti-sn65dsi86: Cleanup managing of drvdata
Date:   Fri, 16 Apr 2021 15:39:35 -0700
Message-Id: <20210416153909.v4.12.If5d4d4e22e97bebcd493b76765c1759527705620@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let's:
- Set the drvdata as soon as it's allocated. This just sets up a
  pointer so there's no downside here.
- Remove the useless call to i2c_set_clientdata() which is literally
  the same thing as dev_set_drvdata().

No functional changes intended.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 2cbf619fbd27..a200e88fd006 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1238,6 +1238,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	pdata = devm_kzalloc(dev, sizeof(struct ti_sn65dsi86), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
+	dev_set_drvdata(dev, pdata);
+	pdata->dev = dev;
 
 	pdata->regmap = devm_regmap_init_i2c(client,
 					     &ti_sn65dsi86_regmap_config);
@@ -1246,16 +1248,12 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return PTR_ERR(pdata->regmap);
 	}
 
-	pdata->dev = dev;
-
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
 	if (ret) {
 		DRM_ERROR("could not find any panel node\n");
 		return ret;
 	}
 
-	dev_set_drvdata(dev, pdata);
-
 	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(pdata->enable_gpio)) {
 		DRM_ERROR("failed to get enable gpio from DT\n");
@@ -1287,8 +1285,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	i2c_set_clientdata(client, pdata);
-
 	pdata->aux.name = "ti-sn65dsi86-aux";
 	pdata->aux.dev = dev;
 	pdata->aux.transfer = ti_sn_aux_transfer;
-- 
2.31.1.368.gbe11c130af-goog

