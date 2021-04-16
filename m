Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38036362B3B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234681AbhDPWlU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234183AbhDPWlU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:20 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20D4C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:40:54 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id j7so10720473pgi.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2BW/qtgH/fZIuXm5QChY3DNkhDAV6mG9NJXYRN92ILo=;
        b=V0JV3IjRkQVXMvTWXV4VArXyWvOl+obbCAEE7BmclLNkDv0zvTDjItsA6IA0YfTG4I
         LLIg8IAHBH5MoyqmQn8thSizlH+vwE8lWbrrd2HOU2ahbh8gQmi4fWqqUbdiYJLhFYux
         9Iq8rJltRcsRINa8YP4cMs/eCvtMm4iJUCpy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2BW/qtgH/fZIuXm5QChY3DNkhDAV6mG9NJXYRN92ILo=;
        b=PPpWWmMZoF1gdkznJcf7+2N/iMgWyKTJVhESpFuU1Ch0WWLoNTxkpSZGg6zhAKYbFi
         CqzAE3eyhZcXDZ+Y4EbNY+HFXP6r03NP049OPp7ktTV3D41uECq104xDj6c9IZMB1Fix
         gEKUs7fvX53D9auGsN2e6AjFWfNUXuAhhhIvP/2/kDbQ2UwDW5SnaVlvPO7M31bqD7aa
         AABzKC+Vwk96C/u4lDM8pzvUMQe/5alTLB7exAkAzABUChZqMY622+yinp9GE9SA+y97
         uiEB3VaPZZgv67bLsBD0aspQscF84s2X9XRXMOcghReei6R0SYqJwU9VOc/xUMQ2hTZz
         tWPQ==
X-Gm-Message-State: AOAM532TOUoxk2nJJWF00FswdNnndQ04yVsqtW3KqA8VBiUUkGR3fEWh
        UNu+e0S/ySmWLF5z9x4864V+gA==
X-Google-Smtp-Source: ABdhPJyztcURn7SwAVEgemU7oiPsbeXh6lFsu6yV4/BPLlPn7nE9AQel/f11hn+AxBmk4as90oAAmA==
X-Received: by 2002:a62:8784:0:b029:259:1d11:f145 with SMTP id i126-20020a6287840000b02902591d11f145mr6979594pfe.79.1618612854386;
        Fri, 16 Apr 2021 15:40:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:40:54 -0700 (PDT)
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
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/27] drm/bridge: Fix the stop condition of drm_bridge_chain_pre_enable()
Date:   Fri, 16 Apr 2021 15:39:24 -0700
Message-Id: <20210416153909.v4.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The drm_bridge_chain_pre_enable() is not the proper opposite of
drm_bridge_chain_post_disable(). It continues along the chain to
_before_ the starting bridge. Let's fix that.

Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

(no changes since v1)

 drivers/gpu/drm/drm_bridge.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 64f0effb52ac..044acd07c153 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -522,6 +522,9 @@ void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
 		if (iter->funcs->pre_enable)
 			iter->funcs->pre_enable(iter);
+
+		if (iter == bridge)
+			break;
 	}
 }
 EXPORT_SYMBOL(drm_bridge_chain_pre_enable);
-- 
2.31.1.368.gbe11c130af-goog

