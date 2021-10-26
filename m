Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEC843A8B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 02:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235675AbhJZADk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 20:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235607AbhJZADT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 20:03:19 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D439C061745
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:00:56 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id v193so5810442pfc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g366T6z/wDv+u0z2UhkHLqZZ67YI06zaB4um2FhnwRI=;
        b=fOGRb7hy+LMZtHHk04IL6d3JHNETEkyug49qntjxYY2W33QNVLzwSx7s16XVmbxSWX
         lDywpIME1qWUKVX9UtbbAI40HncKqkeCN/syijBj5ijnBXIFkcGRs7H5SNncnXMojQ0X
         jWyXcfjYDcIVxXhg/PFaJPFIN/FjImL4Bj1tU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g366T6z/wDv+u0z2UhkHLqZZ67YI06zaB4um2FhnwRI=;
        b=11tSZA7qZ5KttLdi0g0cK5JiVe8PXn7lotWuwnXqZ3uI/vFkKd2vtqxYC7QLr6rtyf
         UO5HnIzbdmwQrtV+v+idRQ77wbbm9pWAkRbkI11h9I35Kmt+2b6jF73EFZq0W1SDsC3l
         Uvn5b/x/8W/8v1co1lshaOaBtuffHOW0YO2VqkCwNxadgYR41OCXmx8J8e4v31SWkzRa
         Bxr+aNssQpLHSKOS+QKu1ODQ96Aey8dky32zHJgWQ8oAxUkK0ckAaB8PfQ8vWpNntWzS
         yNZBLWjl2esgbQHduQtGHpdtxUumXJxK40ocCTWPHThpxJ4PCWALLtW9gPmP9+wkV5lS
         hpwg==
X-Gm-Message-State: AOAM532ZnGua16ESjbwN0itoZUbPFvp/sCGftAhZxnCuoImLDdNe6dQu
        Vj6B1S1rdEaDzySFvlVnBQsqVw==
X-Google-Smtp-Source: ABdhPJxejPpQsL0wvdqDwK7cZfwU9XzCp5OAD6jYhlDDiEhHfYa66EBIHe3tAHZDJxd76AzHhhLdmQ==
X-Received: by 2002:a05:6a00:1693:b0:44c:64a3:d318 with SMTP id k19-20020a056a00169300b0044c64a3d318mr22320562pfc.81.1635206456176;
        Mon, 25 Oct 2021 17:00:56 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
        by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 17:00:55 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Russell King <linux@armlinux.org.uk>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 11/34] drm/armada: Migrate to aggregate driver
Date:   Mon, 25 Oct 2021 17:00:21 -0700
Message-Id: <20211026000044.885195-12-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026000044.885195-1-swboyd@chromium.org>
References: <20211026000044.885195-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/armada/armada_drv.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 8e3e98f13db4..b3559363ea43 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -60,8 +60,9 @@ static const struct drm_mode_config_funcs armada_drm_mode_config_funcs = {
 	.atomic_commit		= drm_atomic_helper_commit,
 };
 
-static int armada_drm_bind(struct device *dev)
+static int armada_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct armada_private *priv;
 	struct resource *mem = NULL;
 	int ret, n;
@@ -159,8 +160,9 @@ static int armada_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void armada_drm_unbind(struct device *dev)
+static void armada_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct armada_private *priv = drm_to_armada_dev(drm);
 
@@ -202,9 +204,13 @@ static void armada_add_endpoints(struct device *dev,
 	}
 }
 
-static const struct component_master_ops armada_master_ops = {
-	.bind = armada_drm_bind,
-	.unbind = armada_drm_unbind,
+static struct aggregate_driver armada_aggregate_driver = {
+	.probe = armada_drm_bind,
+	.remove = armada_drm_unbind,
+	.driver = {
+		.name = "armada_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int armada_drm_probe(struct platform_device *pdev)
@@ -213,7 +219,7 @@ static int armada_drm_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	ret = drm_of_component_probe(dev, compare_dev_name, &armada_master_ops);
+	ret = drm_of_aggregate_probe(dev, compare_dev_name, &armada_aggregate_driver);
 	if (ret != -EINVAL)
 		return ret;
 
@@ -240,13 +246,12 @@ static int armada_drm_probe(struct platform_device *pdev)
 		}
 	}
 
-	return component_master_add_with_match(&pdev->dev, &armada_master_ops,
-					       match);
+	return component_aggregate_register(&pdev->dev, &armada_aggregate_driver, match);
 }
 
 static int armada_drm_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &armada_master_ops);
+	component_aggregate_unregister(&pdev->dev, &armada_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

