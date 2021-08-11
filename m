Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2BAB3E9B57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 01:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232934AbhHKXv2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 19:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232911AbhHKXv1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 19:51:27 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCE7C061765;
        Wed, 11 Aug 2021 16:51:03 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso12324278pjb.2;
        Wed, 11 Aug 2021 16:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IqetlxJQH0ljhEzbSRKQFzu7rZWHhAi/EdZURPQQ3To=;
        b=tKGMDYzvqsSm1bXhOeAsc4+dTrkzKeunk1S5y4XY4Lfq2+FDkkLNnnfdIcLClY5xG/
         lnIODU/oy3SLUh9w0jS5WL9Em9jEtJj6NpusS2Ofet5pRAmv305sU9niN60cIpK8MgRZ
         bxHsHj6UM9jGg89cyB0CciRN0wG3oFW96QIjNY+SfFwapsK7Ha5uGbV148pZnD/1GPr8
         5sVzo4rljImLP8LtYhImG0QBoj2dkO5gCV4i67emkf/4Qj9+AFT0qXTbFANtaY15cPP7
         XRSKn3QXYNh144LUZVSaqkUd2XLSBBh8oUu7OxmGSnY2T1sau6xJ9atiIra8+CximkJl
         zEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IqetlxJQH0ljhEzbSRKQFzu7rZWHhAi/EdZURPQQ3To=;
        b=G8FGWQWi6sHn4LZtaci5+nruUyAer/G+uSYznrCCBj4WYLqc1nYbvAHiuK8o+xpNRJ
         mqpEHrwmIr22oPml6PkMFHUkcmjNCNMCEng4N6eZYHgcMmMQoCnP27uNpNyKVh6tGpin
         04fB4VMlIUF5XYSk+9x+U5XkZSmQkjeRjwtT8hJ1jIi99VDZpJ/HAs690shOqt7XE6KN
         ZHH9E9VZqcKkv4KyefHBw1/scpQgsfHDLUxiXPdYW3GacBIgIQJKgIA9cMgp4erkmnt7
         x2W2dwkaqWVSDC1utv6xWdX0qPDwiWi1o9Pd/OF6IumO+Jn4q4xrQzyVcpATzqyDdgx4
         gDZw==
X-Gm-Message-State: AOAM532zd+2TPitQaX2kFFXNuhGkZiZ96Ur2WBqQxGVv0YpSCdbRjpRp
        +8fHY1fnakbywpka9Dl4bz0=
X-Google-Smtp-Source: ABdhPJzRdBfwV7Mf9hAZec+YTQSgigWYzf3lb1xKO81xK8cSWjhr82Ro+zhTkBsFk5Vr9fhwW6n2Fw==
X-Received: by 2002:a17:90a:6684:: with SMTP id m4mr13287665pjj.127.1628725863447;
        Wed, 11 Aug 2021 16:51:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id q1sm750673pfn.6.2021.08.11.16.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 16:51:02 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jagan Teki <jagan@amarulasolutions.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Avoid creating multiple connectors
Date:   Wed, 11 Aug 2021 16:52:47 -0700
Message-Id: <20210811235253.924867-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210811235253.924867-1-robdclark@gmail.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

If we created our own connector because the driver does not support the
NO_CONNECTOR flag, we don't want the downstream bridge to *also* create
a connector.  And if this driver did pass the NO_CONNECTOR flag (and we
supported that mode) this would change nothing.

Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 9bf889302bcc..5d3b30b2f547 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -736,6 +736,9 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	}
 	pdata->dsi = dsi;
 
+	/* We never want the next bridge to *also* create a connector: */
+	flags |= DRM_BRIDGE_ATTACH_NO_CONNECTOR;
+
 	/* Attach the next bridge */
 	ret = drm_bridge_attach(bridge->encoder, pdata->next_bridge,
 				&pdata->bridge, flags);
-- 
2.31.1

