Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1E6362B3E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234981AbhDPWlY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234749AbhDPWlX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:23 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2BABC061756
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:40:56 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id c3so462828pfo.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XvcTL0RsbG+N8ibrkzli2K1A+rE+ZrcYjKP9wz2z40I=;
        b=AufOpWxiDS8cPPrP7xzjOHsIoN36eKpOCxEXl12PAo2J/qdSsF4bqxhnWAoHrmPdgi
         jdSwBdRJc9Q5vDcJV0vvreL74oFh6+Anm/o8pvPb8DW+i5Aelp9ZDP1HNTZ0Rp2OrdyZ
         XPBg766uOfY2dHhRsLvb38FAjAcOn8oh7WNLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XvcTL0RsbG+N8ibrkzli2K1A+rE+ZrcYjKP9wz2z40I=;
        b=LZ/6kPdVQPkMst297EDQuDQOteBB0tMgB8IVc0vHTjdweNYURXhDFghQOWNa+0tBJu
         roDHBumk8PHkTZu2CK9f3d2rFJi41L2jNd1UChIbRJmR/O7IGs7SM5pvYOyYMjCuLBQc
         BXc4DqMRNzY5IhYdD7H++87Ky0oYZ6Fo1pPXbJaM3qaokniTQFP0Rh4HY6bh+d+/INsZ
         3eIH0sgMqfZfWnaVNskca07frw5ogdUwSkMmOPNv7APK+wwWMg4yR8VLN55e+a/XTosB
         UfRoL6+d0mhWbIDmDnJ6GT9tlT9RLN1XkoVgoR6AlE+CiwMROG3TU7ofo7ATjIqHAaf0
         prUA==
X-Gm-Message-State: AOAM5317R/TbMBCJdGQsltRPsqx2zmfiBmM+hJJ6+775filNvFxh/5rt
        XqiBDchXh0oGbOfmNi259X2urA==
X-Google-Smtp-Source: ABdhPJzNUiYzRYYbvZn//8wjS/CeqlBImBF5oNQlkkD5V/lJHOiw3ppDJgVHdWGhvCqC6g4Hpy9jag==
X-Received: by 2002:aa7:9791:0:b029:25c:38de:aa6b with SMTP id o17-20020aa797910000b029025c38deaa6bmr522788pfp.19.1618612856582;
        Fri, 16 Apr 2021 15:40:56 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:40:56 -0700 (PDT)
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
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/27] drm/bridge: ti-sn65dsi86: Remove incorrectly tagged kerneldoc comment
Date:   Fri, 16 Apr 2021 15:39:26 -0700
Message-Id: <20210416153909.v4.3.I167766eeaf4c4646a3934c4dd5332decbab6bd68@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A random comment inside a function had "/**" in front of it. That
doesn't make sense. Remove.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 96fe8f2c0ea9..76f43af6735d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -788,7 +788,7 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	/* set dsi clk frequency value */
 	ti_sn_bridge_set_dsi_rate(pdata);
 
-	/**
+	/*
 	 * The SN65DSI86 only supports ASSR Display Authentication method and
 	 * this method is enabled by default. An eDP panel must support this
 	 * authentication method. We need to enable this method in the eDP panel
-- 
2.31.1.368.gbe11c130af-goog

