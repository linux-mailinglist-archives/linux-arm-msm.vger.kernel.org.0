Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F5B362B65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbhDPWlh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235043AbhDPWld (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:33 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE93C06138A
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:07 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id m18so12520921plc.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DFM8liF/M0xdOJLWarwocCWEWNZPfb1MoRCxfTIdoG4=;
        b=R1ZV6OrerC1010l29PrywmSUIvHfXf06HH7yhI1yG+h5k4X7/yLM+e9GkaeGj1Qz+H
         a2A7fiV/+deWlVIRXkHUtUY7+p45jCy/DFVOTwfEG1ltxcpHdGMp+skwlySthUD0wojh
         tRpIYmITlzuwj/MMBzpORlgsB3ccG6UXCHXw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DFM8liF/M0xdOJLWarwocCWEWNZPfb1MoRCxfTIdoG4=;
        b=t5rvtZV5KcqvYfM7BXKnf3Q5ktLZ3nNQEzm1HDQinLudJU1yJRlO7H2mzymV8M4eoF
         GheApTpLazkIAJVmQXmVjcg6ssksufT5GI4W0ADq1j377MpBrcnI7SP9dL2pUIYC37yK
         n2p2NiHzacLNQ8qVRQYyO++MueKEAYp5eqcH/W+1DLkwE9UA22zBulo3Mb1L3sUrHsvk
         rIn0UIudMrRSl6T5YtZv/o2YtXXq0p/Y9FBcPI8oC7PfAJOcejgDQD3qoNsLZk96Ah5M
         9uk4rwC1x2GG2SQ2v1I95rW2KUaNq+jMVm85eyHCipQ96PC9E8+5UzU8N7mzdgW1cEsn
         E74Q==
X-Gm-Message-State: AOAM532z8eWQDHwkbOOCwHncN2j1kI3LW62aont05qlBbgA4eH4v3kFC
        t61S51GCDrN54E+gUxzOTFTeaQ==
X-Google-Smtp-Source: ABdhPJyvWWjd+DHCZICjcW8hN5oKKncQlVhyFnMlkZ6SzJVXeRjAeJrO14HIwCTmtT73LHzsKF8HAA==
X-Received: by 2002:a17:902:c94f:b029:ec:85bd:1f24 with SMTP id i15-20020a170902c94fb02900ec85bd1f24mr2964510pla.4.1618612867526;
        Fri, 16 Apr 2021 15:41:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:41:07 -0700 (PDT)
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
Subject: [PATCH v4 13/27] drm/bridge: ti-sn65dsi86: Use devm to do our runtime_disable
Date:   Fri, 16 Apr 2021 15:39:36 -0700
Message-Id: <20210416153909.v4.13.I1e627eb5f316c0cf6595b120e6e262f5bf890300@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
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
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index a200e88fd006..53f1f7b3022f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1223,6 +1223,11 @@ static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
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
@@ -1278,12 +1283,13 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return ret;
 
 	pm_runtime_enable(dev);
+	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
+	if (ret)
+		return ret;
 
 	ret = ti_sn_setup_gpio_controller(pdata);
-	if (ret) {
-		pm_runtime_disable(dev);
+	if (ret)
 		return ret;
-	}
 
 	pdata->aux.name = "ti-sn65dsi86-aux";
 	pdata->aux.dev = dev;
@@ -1316,8 +1322,6 @@ static int ti_sn65dsi86_remove(struct i2c_client *client)
 
 	drm_bridge_remove(&pdata->bridge);
 
-	pm_runtime_disable(pdata->dev);
-
 	of_node_put(pdata->host_node);
 
 	return 0;
-- 
2.31.1.368.gbe11c130af-goog

