Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 523B7362B73
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235176AbhDPWmA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235262AbhDPWlo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:44 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC68C061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:17 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id j21-20020a17090ae615b02901505b998b45so1854921pjy.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WRxEiBxo2TK9eYFaE6Z8QmjhtPKi2ZOYbG3MBiDbq5Q=;
        b=dMXdGHRO1j71y2Iv2+48IjAI9YY8qkW+j1r2PquWxQUiBGEQRIkzBbRh2GOWbOacTc
         MtacNteNbERfxUY2N6QuKbKfYAwXWwb9TlSzfQqVWzhYjzbrpdsxY/g5qnlaq+jX8Qtz
         BJGuMy3uVZxA6SGPfmYi3n+73r1YGoNx1Fe1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WRxEiBxo2TK9eYFaE6Z8QmjhtPKi2ZOYbG3MBiDbq5Q=;
        b=bDw5Jxx7o6s0sSnZUUHDkSJ/udigTPc7gsAq8BDK+QfxWA/DlwSboTu6NSC/LX+Aoo
         YLMx7UEcPszw5CbloqgG+3lsFyPoS/RLu4rJiZwPqtuHG52X0XC5RL+87LHn27dwf3Tm
         zfs38pK5xM5+G8vWMtwcA3lWlW7tdopywLpO7SKyJDJU+ypKeGBx2FI6IJRFLx9TLF5o
         9ifSt5VrazguQZELFEYGstt8G3L+HqlsJ1QUhQ/lY/jkpz8cmDfXntXF/t95bhzIaSX+
         M2x3kFuZGzDK71uf6M++8YA5ONHmrrjsRMqNUcfEXw3Qg7tJrZDx7G0bRxfxhPVMBqCX
         QorA==
X-Gm-Message-State: AOAM533ryJErzUZpvd6B3v/cASQxArkSbw4zwG8cw1JftLpVXJXrDsjX
        1HVjTPr/jMzs0Pg5Nc06CDrKvg==
X-Google-Smtp-Source: ABdhPJyWnRznUdTyIvfS7dug/lUV2TaYTjzVaxsnEcIWBHeIiVhb9ryAZZH4fGMUWj2xhxmdm+R7Nw==
X-Received: by 2002:a17:90b:344a:: with SMTP id lj10mr12317920pjb.101.1618612877403;
        Fri, 16 Apr 2021 15:41:17 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:41:17 -0700 (PDT)
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
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 22/27] drm/panel: panel-simple: Remove extra call: drm_connector_update_edid_property()
Date:   Fri, 16 Apr 2021 15:39:45 -0700
Message-Id: <20210416153909.v4.22.Icb581b0273d95cc33ca38676c61ae6d7d2e75357@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As of commit 5186421cbfe2 ("drm: Introduce epoch counter to
drm_connector") the drm_get_edid() function calls
drm_connector_update_edid_property() for us. There's no reason for us
to call it again.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
As Laurent pointed out [1] this is actually a pretty common
problem. His suggestion to do this more broadly is a good idea but
this series is probably a bit ambitious already so I would suggest
that be taken up separately.

[1] https://lore.kernel.org/r/YGphgcESWsozCi1y@pendragon.ideasonboard.com

(no changes since v1)

 drivers/gpu/drm/panel/panel-simple.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 90a17ca79d06..c91e8aa108f7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -512,7 +512,6 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	if (p->ddc) {
 		struct edid *edid = drm_get_edid(connector, p->ddc);
 
-		drm_connector_update_edid_property(connector, edid);
 		if (edid) {
 			num += drm_add_edid_modes(connector, edid);
 			kfree(edid);
-- 
2.31.1.368.gbe11c130af-goog

