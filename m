Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB3695B18E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 22:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbfF3UhB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 16:37:01 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42325 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfF3UhA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 16:37:00 -0400
Received: by mail-qt1-f193.google.com with SMTP id s15so12475225qtk.9;
        Sun, 30 Jun 2019 13:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8APoQ9tZU7X1UIGwGdNOM/HXlIAPWX8EBWLqslvtxlM=;
        b=d3z4n1Elaz6sMd0HfkAc3L/Jg3jRjJ3q5MVg9+j6BpET2WfEXXMsF8q8eZOGVEz4Cv
         xhQ8lgdI0SF9RuqqESt3FMcumyI8AcOVyCTG7OVXeZYfqvRoyeiaj5bIzxw6tuH+030F
         jQqUdDEaeAZi6g8sHMxNKT+F4dx840TIZMBcDr+ui4iCrOvc1Nlz2H8Z7yUEeO8psXp5
         u5wfiZ30TZvqzkqko8jUpIaK8cgrgdx+SlycR2b+td26EN8mY/ZT+vACywSbRSH+27ZU
         9bSdtPa+JtZc8nXkJWmSBZX3XCqMcJ1QXeRIV4KZtmE1WduVtA1ph1QFllGNx9yTBQmy
         5RKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8APoQ9tZU7X1UIGwGdNOM/HXlIAPWX8EBWLqslvtxlM=;
        b=qTAQKxTIVXGyzQjrwWt/hG/JOGp4cuKOUQeiNBdN6PvPap0gOmHABADvcOGPZuupsd
         P87h/gIjlIYsKsT/musQXMC8Kepjw3eXVZJ41SAXBeEcxJ1DwddYlmr9BlmWJFN1O1mS
         AaXtl1v7qJrFv8HTgqaGp+UWm8S93zC/QWdGabEBJipVO5ta6NfNyuMbsDJ8hB0as7Ie
         vHh7oj1uFki/vWykF7F1e2g6+bP4XWKrvhxKjGB9gB2I83iafjOQBM1fPFNglKyUQml0
         cTuGCgODjMV70XIFm+cWrBRpBVwWvdSW9CnMkmoXPdBE9uLNdC4cNNB2jQcdramFse5T
         3TlA==
X-Gm-Message-State: APjAAAVMtrlrEJSS+gvoxR0Yr9XrGwlC24LM0yVdMWIa31EKbjtZi4+q
        2Dt5rO9WGYxuR+owkOGWspg=
X-Google-Smtp-Source: APXvYqwxwquSsHnIcky5zw5j12bwbckaOicNC38h2rTq/yBmIuBNSXDXUcizer8wonP7Iwt/XdyKaQ==
X-Received: by 2002:ac8:25b1:: with SMTP id e46mr17548583qte.36.1561927019833;
        Sun, 30 Jun 2019 13:36:59 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id u71sm4204966qka.21.2019.06.30.13.36.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 13:36:59 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     freedreno@lists.freedesktop.org, aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/bridge: ti-sn65dsi86: use helper to lookup panel-id
Date:   Sun, 30 Jun 2019 13:36:08 -0700
Message-Id: <20190630203614.5290-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630203614.5290-1-robdclark@gmail.com>
References: <20190630203614.5290-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Use the drm_of_find_panel_id() helper to decide which endpoint to use
when looking up panel.  This way we can support devices that have
multiple possible panels, such as the aarch64 laptops.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 2719d9c0864b..56c66a43f1a6 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -790,7 +790,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
 	struct ti_sn_bridge *pdata;
-	int ret;
+	int ret, panel_id;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		DRM_ERROR("device doesn't support I2C\n");
@@ -811,7 +811,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 
 	pdata->dev = &client->dev;
 
-	ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, 0,
+	panel_id = drm_of_find_panel_id();
+	ret = drm_of_find_panel_or_bridge(pdata->dev->of_node, 1, panel_id,
 					  &pdata->panel, NULL);
 	if (ret) {
 		DRM_ERROR("could not find any panel node\n");
-- 
2.20.1

