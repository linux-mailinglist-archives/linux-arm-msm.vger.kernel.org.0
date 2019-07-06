Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 134EB612F0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2019 22:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfGFUbU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Jul 2019 16:31:20 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39306 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbfGFUbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Jul 2019 16:31:19 -0400
Received: by mail-qt1-f195.google.com with SMTP id l9so6189575qtu.6;
        Sat, 06 Jul 2019 13:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QTdDNTekunAUgyaGQ3/RJxJLYyFWDwZXUg6Q2Wj8Aqc=;
        b=cRFQgRmvTZBqx1Do7XLHfkgnGFACGebj//05Gx/ZyVFgynRoeEbYGqAszY5FPBuP/i
         wdOyGTGwCQIzBH90QM1qW4L/buGk+4a5jwHdX/o29RyvZ+XHd4UhD4P+p/oegjBLKVql
         5T3zkhPosT6nnmgtycmM3KtapPYe2MzQRpkzJSPqdvz2RhznuXC7t17Vpw7ZTkMN0oaM
         LatQtCQY3pTeaVLGZOMmQKBF7/keE9OxfskkpYQ/M7Kl8ZYla4e5JQGWyis5tYzLL1YY
         ukpm76IK6dyRKxUlfzereOjE7B5LpcI1rOOW/7jb510TVSs9YwTVoYP8HYnPhwNtrHUo
         95cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QTdDNTekunAUgyaGQ3/RJxJLYyFWDwZXUg6Q2Wj8Aqc=;
        b=eARbi/dfsWoihSktlSyXTxxcBfvKd0SC6sVtqGvK5FLM0O4HjJxAoVYaZ0K10dytd0
         83lzFS65q0U3kvkcNdoUw7M1IGTiDN8YkAtF4A6Sq+b6k8vmDLi29mcs659hNN6NZp7J
         JNDfJbuZj0IB4mAcriMjo8/4mCtdpaLTl02yKe/H3Jyzo63K+3+P44Mrv86etchCxjxd
         yW8ehoBospIKqJWmd0yIz8c7Dng8Pit3xBfedu+0WYgKMp5b1PAb9bgDFepGUnlzo9ov
         lavqRJOuS78DFSTCrbFmBztRSKz8qzz7ZkYniKv1wrw9UeMLjPaVkxFODB+9ai7oBt6f
         MgIw==
X-Gm-Message-State: APjAAAWcrOmQygWhWGqsAK6MZi6WF7qjwA+K7+Qcnb6Bq63M0xIieHUq
        toVU3sks4w4o0a9T+jeTO3w=
X-Google-Smtp-Source: APXvYqxLv1LQbz6LycfXjpzAR167HsHiq08tHengu2WXsBxNFIWXpbY+Fe7YNPGA7DHT97SWJu2JBQ==
X-Received: by 2002:ac8:70cd:: with SMTP id g13mr7513436qtp.325.1562445078775;
        Sat, 06 Jul 2019 13:31:18 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:fe2e:a8ba:927f:edd9])
        by smtp.gmail.com with ESMTPSA id x20sm4770818qtr.72.2019.07.06.13.31.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 06 Jul 2019 13:31:17 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: ti-sn65dsi86: use dev name for debugfs
Date:   Sat,  6 Jul 2019 13:31:02 -0700
Message-Id: <20190706203105.7810-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This should be more future-proof if we ever encounter a device with two
of these bridges.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c8fb45e7b06d..9f4ff88d4a10 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -204,7 +204,7 @@ DEFINE_SHOW_ATTRIBUTE(status);
 
 static void ti_sn_debugfs_init(struct ti_sn_bridge *pdata)
 {
-	pdata->debugfs = debugfs_create_dir("ti_sn65dsi86", NULL);
+	pdata->debugfs = debugfs_create_dir(dev_name(pdata->dev), NULL);
 
 	debugfs_create_file("status", 0600, pdata->debugfs, pdata,
 			&status_fops);
-- 
2.20.1

