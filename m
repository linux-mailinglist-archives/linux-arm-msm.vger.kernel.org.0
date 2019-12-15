Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57C8211FAF6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2019 21:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfLOUFD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Dec 2019 15:05:03 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40680 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbfLOUFD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Dec 2019 15:05:03 -0500
Received: by mail-pg1-f196.google.com with SMTP id k25so2426547pgt.7;
        Sun, 15 Dec 2019 12:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xIgln2CTeNUTcohT4yCRcrSFMvesnt3sC8dwNxQQtUM=;
        b=o2wysAteIijZ8tWGZKG3kD7OLB1HVQ98F+1acPL7apqrId+6bkSJZp4bfeQPcLTcCD
         W5zJdE9b8FfrrxIQq6rg5wWqgxa1Slp9K5vgMHjhOYD3g/FiPj97CRVs4giFDnmA5GRG
         nBEw8JDPILEc6VehgT3fCDIidNQYVDmkTwwKIVhcVWY7GfxqNhk7VtPAsAqJDk5GjSU7
         nHvQB+momWt3yrCoLOHZ1qraHWRt5BDUr3d6ZW5R2GvkYBczxl6ZuBY5Yat4RqDPCm+3
         VbSoSGG2PgXYDLxJj38VD3pwr/8x8Wx1sjMpswhQCx3Dhr0L6y3Y0xiyXOOTOC+fYNSu
         91dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xIgln2CTeNUTcohT4yCRcrSFMvesnt3sC8dwNxQQtUM=;
        b=HWp+512Fgjulh3mWvohdB2i1ce+bQvJ1gRDf0Ez+YZt1JJZxoPLFY2j6VSi6PporSK
         qrBNJZzjBLhOZVfUdURydsnVxWrzGXR4f6KClea8pvj/1YB8m+fJv32pBox7YZEiJdT7
         suahpivOIeOpfJAY1BwF1QoYMNShCqx79kSfSfWqPlZsnCRI6IwX0DINUx7sq6SsU7P7
         MwECH9zsVhUdI27RCF8yy2ZxwPr7l1n4LwpsyDhGWd3fVAD/HwTRoF0rFb6XWwKB4rcl
         JB5sYB/niIXsUkGosVG2YnAE5DwkXwVtRFWIYj25dJvKm5sgUJNxNkfWD+J321E9AYfh
         996g==
X-Gm-Message-State: APjAAAWZ+0Z7eMWvWnmZNncADf8fLbSqvJX2IsEz7XNzICJ5HXRnbKyK
        DYllA7yGiwL1taFslDsWSyhflwVv
X-Google-Smtp-Source: APXvYqwhMYzq9LVfNRlgXR0Z/3qbGzkkpOo79arI9v4XBwf4PSol4vSxiffMt0IkLYIKZtwLVmBK6g==
X-Received: by 2002:a63:4f64:: with SMTP id p36mr14378616pgl.271.1576440302589;
        Sun, 15 Dec 2019 12:05:02 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id c8sm18881075pfj.106.2019.12.15.12.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 12:05:01 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@chromium.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <seanpaul@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] fixup! drm/bridge: ti-sn65dsi86: Train at faster rates if slower ones fail
Date:   Sun, 15 Dec 2019 12:04:59 -0800
Message-Id: <20191215200459.1018893-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191213154448.8.I251add713bc5c97225200894ab110ea9183434fd@changeid>
References: <20191213154448.8.I251add713bc5c97225200894ab110ea9183434fd@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Fixes:

In file included from ../drivers/gpu/drm/bridge/ti-sn65dsi86.c:25:
../drivers/gpu/drm/bridge/ti-sn65dsi86.c: In function ‘ti_sn_bridge_enable’:
../include/drm/drm_print.h:339:2: warning: ‘last_err_str’ may be used uninitialized in this function [-Wmaybe-uninitialized]
  339 |  drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
      |  ^~~~~~~~~~~~~~
../drivers/gpu/drm/bridge/ti-sn65dsi86.c:650:14: note: ‘last_err_str’ was declared here
  650 |  const char *last_err_str;
      |              ^~~~~~~~~~~~
In file included from ../drivers/gpu/drm/bridge/ti-sn65dsi86.c:25:
../include/drm/drm_print.h:339:2: warning: ‘ret’ may be used uninitialized in this function [-Wmaybe-uninitialized]
  339 |  drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
      |  ^~~~~~~~~~~~~~
../drivers/gpu/drm/bridge/ti-sn65dsi86.c:654:6: note: ‘ret’ was declared here
  654 |  int ret;
      |      ^~~
  Building modules, stage 2.
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index cb774ee536cd..976f98991b3d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -618,11 +618,11 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
 static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
-	const char *last_err_str;
+	const char *last_err_str = "No supported DP rate";
 	int dp_rate_idx;
 	int max_dp_rate_idx;
 	unsigned int val;
-	int ret;
+	int ret = -EINVAL;
 
 	/*
 	 * Run with the maximum number of lanes that the DP sink supports.
-- 
2.23.0

