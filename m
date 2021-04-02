Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F855353116
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Apr 2021 00:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbhDBW3a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 18:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235421AbhDBW3a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 18:29:30 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E13AC061788
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 15:29:28 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id h25so4342157pgm.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 15:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E5nLkVryU7c5AZ4g5Lt9PfA8bKCz/RpFTxCm4PjfuZs=;
        b=gO+bEfipw3YrhMa3YXA8RgyPNuMRx6vX+IJGebJwUyxM4c2+fNY/VbWXvKQfAaOjUR
         oUM6rQTx1YQLssV5Yi6d7k2M9/RGE9jYV3GFcPGPjtCYDgscCw1iQHXhFZ8H6VYpqyR1
         VmAnuKqTR+IF1lNxxEqVovVLqVNr4dbFEFRAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E5nLkVryU7c5AZ4g5Lt9PfA8bKCz/RpFTxCm4PjfuZs=;
        b=HmBnsbfOygxNpXFAVLMjkNJj/e7quQCS26WO6wSvbmaC4WyuAfy8z5VinRHQO4NPrl
         BorwDhHGAbGoG3hbYdceymuiNJkcfeREkD6E5+rav7F9nqTDTy3SokWWWSoNXzPLjBvS
         uMSz8arV7BMp1l1SxzLEHgerw5jaYHkjhurwdI+fNvD2ZISvT+WEg8Cxh6y7Rxaui4Zt
         ZzyM0aDyqAI4NDD9Rd9JCvqcroaZ8s6etvQ7XKz8ZHFYgPi1/Z7/+vgdqOsmgS5oK2ME
         rAYwN9tzQFkDbPXMsTX9BkGfD33kzC00GGGzo0vNm+2IvjDBO/8e3MzyGWY/0fFDFV/9
         96RQ==
X-Gm-Message-State: AOAM530ZuyBqDGw3aFpbO471m3IHML/p7fSk1Yn3HuEVmy+Gy5l4HMes
        /wbhtHdPPmWumvePr1GdUUK6pQ==
X-Google-Smtp-Source: ABdhPJx5v38XJsBmc6qzOsS46/IrA38fKgvgpOkEPRe3xCg5rY9n+CELmCVv9HXlR7JiwYgavF0iZA==
X-Received: by 2002:aa7:969d:0:b029:1f5:b02c:eed3 with SMTP id f29-20020aa7969d0000b02901f5b02ceed3mr13547896pfk.75.1617402567727;
        Fri, 02 Apr 2021 15:29:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
        by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 15:29:27 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        robdclark@chromium.org, Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/12] drm/bridge: Fix the stop condition of drm_bridge_chain_pre_enable()
Date:   Fri,  2 Apr 2021 15:28:35 -0700
Message-Id: <20210402152701.v3.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210402222846.2461042-1-dianders@chromium.org>
References: <20210402222846.2461042-1-dianders@chromium.org>
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
2.31.0.208.g409f899ff0-goog

