Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F362E32DE10
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 00:53:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233406AbhCDXxM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 18:53:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbhCDXxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 18:53:12 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4371DC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 15:53:12 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id a23so66911pga.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 15:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qnp/ZHTkSIkVYskvkrF513Ugb3dk9usGZrQyQUnFAEk=;
        b=Wgqw+87O9xoe5W14UsxraXU6NYwlrhsNsCGv+E1NklZkP4eYldm/NAWr8Ok9Xq3BER
         g8Y0zPvu/kMnEk1MY1x8XpDbNkzjleZeMkkwOlP1w9Rbj7/69N/r3SVOQC0Js0I6kCab
         CdiUXNPRZyk9gt0IpUp1JGWYqRVH1u09T5IjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qnp/ZHTkSIkVYskvkrF513Ugb3dk9usGZrQyQUnFAEk=;
        b=FQbKipnmnKD36LKbeo46ifeS6hjZ2SAFTep4Rdcn99EYsmvMaTJfjlLdhgbRTTo39r
         jMn+uqS14VvSQWdFgq4430tW40hvfBUG4Hw3he3szc6qnvrLrrKsTe00GwMqDrUVYWYr
         WgmoHcUZGkAz9lUFMtQyWVcUM+0YVs8R82sVPxhl7LsUWQZU2cKzySC3Fm8UgoJ3zgML
         QgN8lA6gUhfKckRILO/BgGR949mvp3NMhWhMORwx3iNXlDiVn1Dm6yO0D8zylHU9GI/k
         X3XHOl+bbqnWGU3smSUXAyN2ttfV5eo3f/b4RFcvitdnksAaHPxBpYRpnuMhouligMSL
         nVlw==
X-Gm-Message-State: AOAM530zGlyiBgBacPmEjg9um3T0Ln2bBZ4fArQohpdqi/vSFLm0QuiZ
        FQtbBllWyusQYOMeRWA1kN+Dew==
X-Google-Smtp-Source: ABdhPJy4x/gHMFUZGwtp7tcOp3lrs2YSyiDqqo8LnNYjXNY5rgKoSevRVezwQxVGQyGEYR1olzYgTQ==
X-Received: by 2002:aa7:9577:0:b029:1ee:ea22:5eeb with SMTP id x23-20020aa795770000b02901eeea225eebmr6177361pfq.33.1614901991316;
        Thu, 04 Mar 2021 15:53:11 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:c4da:3a70:94aa:f337])
        by smtp.gmail.com with ESMTPSA id r4sm319449pjl.15.2021.03.04.15.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 15:53:10 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        robdclark@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify refclk handling
Date:   Thu,  4 Mar 2021 15:51:59 -0800
Message-Id: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
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

NOTE: this makes things look a tad bit asymmetric now since we check
for NULL before clk_prepare_enable() but not for
clk_disable_unprepare(). This seemed OK to me. We already have to
check for NULL in the enable case anyway so why not avoid the extra
call?

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f27306c51e4d..942019842ff4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1261,14 +1261,9 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
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
2.30.1.766.gb4fecdf3b7-goog

