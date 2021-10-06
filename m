Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F26E424741
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 21:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239702AbhJFTmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 15:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239576AbhJFTlO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 15:41:14 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C18C0617A8
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 12:38:56 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id p1so3270194pfh.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 12:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r4ZlYPrmM5Tkk7hEVqwG73Jg1s6yPoPLqqklEbvZsNs=;
        b=iXHyWXwf/CQ5p/MtluAWBR3tIx3vtEMCYA9JvztHzfCgcdYhJD+jfKkaOxbbnqi2Yf
         VHxkPyGwhvl7HE48jfOvTdnMZEX98UFxUnp8X1B2Tfh/9MuvzxAAy7A612yarm75GA1B
         Ha+8XxSgEhEircqpplGKcbpiXwKIKaS/PIEoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r4ZlYPrmM5Tkk7hEVqwG73Jg1s6yPoPLqqklEbvZsNs=;
        b=jRhmx1UDgV69nRw3IWYEf03EWezhuoflbk3O6N/QkpPJVy3V+aSHpze515UeUz3e/H
         z25R6knSYOFRjbImk42RCRlTXCARhpU0Ua3FRMn5tgep/SpelAOsZGk5ZuFQP3PrjEm6
         d1TADnVT7ypZ2kaNB12H7M+KkJk74di4XgrOl3PxtVGKxIsQHiBDpAvNY5OmzgLqfk8/
         fnUOW/hPtkPJjQVuPFleBcoQrf4fKmDWCGMV9XEtnPE0AJGPN/g0UgQ2NBDvu36PGr5b
         LQNrlNJ8I6g9KgtU1kX1rGl2TpPa0a1tA6mbxhZIkxQNokvQsUE8xIAZuPTFOeJjvqN9
         N0rw==
X-Gm-Message-State: AOAM5330YxOBXaO/dLm6glFp4MsOfzCriiHDhq/R9YoWOYkDYZ5qqDtF
        rdyDBRt2h0+P5zxgT71qlbmQXA==
X-Google-Smtp-Source: ABdhPJyBnIIUOasVuz0HHwa5HSKuINPSNBBmrSfqVEIzUYx1TcpPNSjWFeK13ykM3k0PwSWN5fB2Sg==
X-Received: by 2002:aa7:8246:0:b0:44b:4870:1b09 with SMTP id e6-20020aa78246000000b0044b48701b09mr38855725pfn.82.1633549135884;
        Wed, 06 Oct 2021 12:38:55 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
        by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:38:55 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 28/34] power: supply: ab8500: Migrate to aggregate driver
Date:   Wed,  6 Oct 2021 12:38:13 -0700
Message-Id: <20211006193819.2654854-29-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Sebastian Reichel <sre@kernel.org>
Cc: <linux-pm@vger.kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
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

