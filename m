Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E1E466C9C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 23:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377576AbhLBWcR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 17:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377475AbhLBWbw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 17:31:52 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80CDC06139E
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 14:27:59 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso3681916pji.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 14:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+JAo2MaGppQnqjiILYakqrQo0dvp6TO6MPFSMqu2Msw=;
        b=JwC02+ORyfxx4rSWQ3wiTgF2uaijCbmu4Tlo5ffDni05+C8GgWgtOdvlir6pEqQ67/
         h/aGHxc974t0pS6wShnNr8fXdq97VS3rmsp3NbQz6XqUwQ9JrlF6GdD1ARgBzKNJRonS
         nSiOEDFuir9ehlzy5jn7kaOUgSyjlLf+dkazI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+JAo2MaGppQnqjiILYakqrQo0dvp6TO6MPFSMqu2Msw=;
        b=5RWAXgW0/t/5YIFZ/zDH3MjJeCBp6yxDMHEIgfbp6s4qgsK0k0rrTVu0CLG6kbURRy
         gCQhsuWtVOSgvwLHnb4TRnqhIvRDGQssfasevAJanz0+LU3N7GKtWTDr3aScqrIFW+tQ
         JHzJN3M1MwzWfpUq9oLtLikqHIiUjC5UAcYMLHO7RGMvXXho6FBBWlDLQKFrEsfNYn2n
         b76oLUnIrDIP5WS7mC1sZx4Bk9v1aCh1EjLeGZsEXYWKY4iMq0NVyQS8tP7inkEeRuT/
         iE5Kp5baIZ7i2XRPA8Xv5HPyFX/NDDxVtekDkY+8mMEr9kHmwVSptuUN57fcUX1/OY9T
         0PqQ==
X-Gm-Message-State: AOAM53215uqV7w1z8/TQ0dlV/PEROC2tHmJJT2sjzEirrOrG3pAiYjAH
        nyxzq0mIODIicgEtpUAQDJZVpw==
X-Google-Smtp-Source: ABdhPJzIvss3OFpbFAl51HKLBYnJVDs+mnPXzZw7MTof1TWzNPmxYxGUZApsvNswjQHVoAiBqk4crA==
X-Received: by 2002:a17:90b:4f42:: with SMTP id pj2mr9273117pjb.7.1638484079336;
        Thu, 02 Dec 2021 14:27:59 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
        by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:27:59 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v4 28/34] power: supply: ab8500: Migrate to aggregate driver
Date:   Thu,  2 Dec 2021 14:27:26 -0800
Message-Id: <20211202222732.2453851-29-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Acked-by: Sebastian Reichel <sre@kernel.org>
Cc: <linux-pm@vger.kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/power/supply/ab8500_charger.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/power/supply/ab8500_charger.c b/drivers/power/supply/ab8500_charger.c
index 15eadaf46f14..52d4105e28f2 100644
--- a/drivers/power/supply/ab8500_charger.c
+++ b/drivers/power/supply/ab8500_charger.c
@@ -3312,8 +3312,9 @@ static const struct power_supply_desc ab8500_usb_chg_desc = {
 	.get_property	= ab8500_charger_usb_get_property,
 };
 
-static int ab8500_charger_bind(struct device *dev)
+static int ab8500_charger_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct ab8500_charger *di = dev_get_drvdata(dev);
 	int ch_stat;
 	int ret;
@@ -3354,8 +3355,9 @@ static int ab8500_charger_bind(struct device *dev)
 	return 0;
 }
 
-static void ab8500_charger_unbind(struct device *dev)
+static void ab8500_charger_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct ab8500_charger *di = dev_get_drvdata(dev);
 	int ret;
 
@@ -3380,9 +3382,13 @@ static void ab8500_charger_unbind(struct device *dev)
 	component_unbind_all(dev, di);
 }
 
-static const struct component_master_ops ab8500_charger_comp_ops = {
-	.bind = ab8500_charger_bind,
-	.unbind = ab8500_charger_unbind,
+static struct aggregate_driver ab8500_charger_aggregate_driver = {
+	.probe = ab8500_charger_bind,
+	.remove = ab8500_charger_unbind,
+	.driver = {
+		.name = "ab8500_charger_agg",
+		.owner = THIS_MODULE,
+	},
 };
 
 static struct platform_driver *const ab8500_charger_component_drivers[] = {
@@ -3663,9 +3669,7 @@ static int ab8500_charger_probe(struct platform_device *pdev)
 	}
 
 
-	ret = component_master_add_with_match(&pdev->dev,
-					      &ab8500_charger_comp_ops,
-					      match);
+	ret = component_aggregate_register(&pdev->dev, &ab8500_charger_aggregate_driver, match);
 	if (ret) {
 		dev_err(dev, "failed to add component master\n");
 		goto free_notifier;
@@ -3688,7 +3692,7 @@ static int ab8500_charger_remove(struct platform_device *pdev)
 {
 	struct ab8500_charger *di = platform_get_drvdata(pdev);
 
-	component_master_del(&pdev->dev, &ab8500_charger_comp_ops);
+	component_aggregate_unregister(&pdev->dev, &ab8500_charger_aggregate_driver);
 
 	usb_unregister_notifier(di->usb_phy, &di->nb);
 	usb_put_phy(di->usb_phy);
-- 
https://chromeos.dev

