Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57BFB43A8C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 02:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235647AbhJZADv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 20:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235695AbhJZAD0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 20:03:26 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8354DC061220
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:01:03 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 75so12302049pga.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Xg9zrUyKFMa3ddbem3zPmmRQ2IkXwWBatRdclbFjwA=;
        b=X+qIwuMITz6qKYQulA551uMYxR8jlZgi8Db5cvWB3HBwUrd3DvVFN2hlELtd3puyiy
         Ww1WqQqWkyJNVSY8STnESySzdjIyVTwTccUSZMhpSSkbO117dO+9sqLyJaNkB+NtjZsn
         QMPPk6RaLEZ10FxQZ2hMHJxkO7EZWoksXQ/5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Xg9zrUyKFMa3ddbem3zPmmRQ2IkXwWBatRdclbFjwA=;
        b=Aw8674RiR+REXsRI/z0WGWUvJtPZozx0QgzkkIQp7CNSlA6YyXoLUlwE1C0HfE/H6T
         n5JPhoz/SaOh3sMGQ+aUszhke+mRDja9GrJ9AQ84VrWAjzsd1C6enwbpH9EZeOzXU/ad
         3/k8oHSsosOczGzR+XV7i08lGcNYylpzZtwqnd2yQNsgoYlfjZf4znb4BlPvk7hZQpzh
         VtJt87NLwez89dCu2iWpOG9GSFaTss2chQ/XukyeC3qT2nUF5NnnEC3yojG3ZQDyPBI+
         Ufl8MADYsPIquR/rHwPLNWfYwEvlGHiGGxnkNthgbeENEke0+osf+fTyKdNy3orI9fVD
         fAdA==
X-Gm-Message-State: AOAM530HlDtVuklvnVvN8XqmTBZgAvqawqjGJXWjyAQrhOPKbBoDD+tX
        JX9ngEeec822Yggn5gH+Fg8IlA==
X-Google-Smtp-Source: ABdhPJzbX7RPHuR4HDgzeUFNvnhN67eizAx7LkYEUmVqp2zteJi/RHEY1pIzsIFJ6ZJOOv9SAGyaDQ==
X-Received: by 2002:a63:35cd:: with SMTP id c196mr13974325pga.284.1635206462978;
        Mon, 25 Oct 2021 17:01:02 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
        by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 17:01:02 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 19/34] drm/meson: Migrate to aggregate driver
Date:   Mon, 25 Oct 2021 17:00:29 -0700
Message-Id: <20211026000044.885195-20-swboyd@chromium.org>
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

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/meson/meson_drv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index bc0d60df04ae..109fb9d057e3 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -357,13 +357,16 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	return ret;
 }
 
-static int meson_drv_bind(struct device *dev)
+static int meson_drv_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
+
 	return meson_drv_bind_master(dev, true);
 }
 
-static void meson_drv_unbind(struct device *dev)
+static void meson_drv_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct meson_drm *priv = dev_get_drvdata(dev);
 	struct drm_device *drm = priv->drm;
 
@@ -387,9 +390,13 @@ static void meson_drv_unbind(struct device *dev)
 	}
 }
 
-static const struct component_master_ops meson_drv_master_ops = {
-	.bind	= meson_drv_bind,
-	.unbind	= meson_drv_unbind,
+static struct aggregate_driver meson_aggregate_drv = {
+	.probe	= meson_drv_bind,
+	.remove	= meson_drv_unbind,
+	.driver = {
+		.name = "meson_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int __maybe_unused meson_drv_pm_suspend(struct device *dev)
@@ -503,9 +510,7 @@ static int meson_drv_probe(struct platform_device *pdev)
 	if (count) {
 		dev_info(&pdev->dev, "Queued %d outputs on vpu\n", count);
 
-		return component_master_add_with_match(&pdev->dev,
-						       &meson_drv_master_ops,
-						       match);
+		return component_aggregate_register(&pdev->dev, &meson_aggregate_drv, match);
 	}
 
 	/* If no output endpoints were available, simply bail out */
-- 
https://chromeos.dev

