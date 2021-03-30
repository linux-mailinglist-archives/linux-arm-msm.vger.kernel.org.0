Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D1634DECB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 04:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhC3CyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 22:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbhC3CyG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 22:54:06 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDA6C061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:54:06 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d8so5394697plh.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Mar 2021 19:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TcXAfPKa+Tcs9m08emwoREb3+u87BPiPwkXmewbCSKM=;
        b=PYRlolbxkd9TiHB1PoLA1tTvNQtWjiMSVuapm4tc4c/3Cw3kU22e41yyfvS7GrhTeD
         pvSMf0sZb4cNX6SBnm2+0kzt5ZlJkW6VC/BpP+KWxQ1+INxTNVYlTGtpdONMwEHHEWsw
         3G06wk9pwKuuWCSWQWggeX+7vLwVHzxXeLkGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TcXAfPKa+Tcs9m08emwoREb3+u87BPiPwkXmewbCSKM=;
        b=rW1d96zC3ILnVbnHz9Gb5em50EcfXyGlnEuW86W6kcjshUsfao/7cnYJfvJlhBAH6J
         R1WcLBIRW+bmdpRls1iFmwP4VmgbqykmQWzAvn2n1Kx/nGcXoYKkf874Im8LyVHufExN
         ipCRmT3sK/mLyTywHs3csJMcS9wSDX1ZoUtL8T4czsJID1w+u+7i9F9Wj1vn5xHm/NQj
         RqioHFvcNQ/U5vMRmleE0E7CJ61+jj95U8nCkIYimTzxf4kEC9N7Gl6ispdsHsXr+y/g
         HI5mIBnIDz/uQ+X2UW/Nah7AYP0YGnF7nxfZwK6h+48PoeDy3XvzPzEeGykIMuFuAI3p
         PTHw==
X-Gm-Message-State: AOAM5304RzN8vvt82i/ugXAkn+1gSi8tTLaNgxI6ndlXO1Qbr0U4Osh9
        l76MGMMgIiEiLb+ksq4lsJ9usQ==
X-Google-Smtp-Source: ABdhPJw7wjhR3bYBB6XuXoFKaK/PAbcUoH2xgh0Za5Qj0NYFEPc9Uc9V94+9eeGBo8/VwNei/h7VmA==
X-Received: by 2002:a17:90a:a88d:: with SMTP id h13mr2030265pjq.61.1617072845929;
        Mon, 29 Mar 2021 19:54:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f599:1ca7:742d:6b50])
        by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 19:54:05 -0700 (PDT)
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
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/14] drm/bridge: ti-sn65dsi86: Remove incorrectly tagged kerneldoc comment
Date:   Mon, 29 Mar 2021 19:53:34 -0700
Message-Id: <20210329195255.v2.3.I167766eeaf4c4646a3934c4dd5332decbab6bd68@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330025345.3980086-1-dianders@chromium.org>
References: <20210330025345.3980086-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A random comment inside a function had "/**" in front of it. That
doesn't make sense. Remove.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
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
2.31.0.291.g576ba9dcdaf-goog

