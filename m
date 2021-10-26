Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E07543A8C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 02:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233728AbhJZADt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 20:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235703AbhJZAD1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 20:03:27 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8F5C061225
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:01:04 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id l203so7757201pfd.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+z8spq4cdcPKhNDSMMsr6lVILQ9GCMpzmsR3lgzTaCA=;
        b=GqQ5kyBfdujj6JoSagw/WB1EChhN7ufbXzuOrahKX/bgO4kIfpT3o3DRsZ6mqKlkKZ
         jxWO5B2Ap/xeraADeerds/phTIMSR7tJCixj2Ses+fqOxvrSIRawUiv15esASpBwuEp+
         GVnnREmcybPjPdvfxa3FGMSYdZC4nPP8GatuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+z8spq4cdcPKhNDSMMsr6lVILQ9GCMpzmsR3lgzTaCA=;
        b=faEp9WbFLqMa8iNGB5skcrsHXY76fsxMVcpyED8I8x2we9/CsGf2m8ycVe82wqm5Kw
         uN+4rDvrvDBwZS5i+G3Ph+m5FIPphZiZcrNQQk4H4bxnpnwDoHib/Mrslq1mb/7/HbBO
         UDKRlM6DqO87zMWHgKQKn8cLq8ft4TwnsAUCkhU2hLP9sPG8mpeZJ+a3ZLIBC1a/xIuu
         q0+DE6yVJeuJ9eMRXPGr89Nsnm8vy2axILxiIkK+aEijRqrMLa8qR38LE5QIKLHnQeUc
         UhF3RGqPMdk2yXyxGXHjcvs7dGTNwgjzYYEPe1OVHCyTsfA1xEWVB68L13WkSHZNNIRu
         r2pw==
X-Gm-Message-State: AOAM530U9q/kjl2k2C+vSQfo/A7Z4JGDyKchhbZ4VkyMzMnDEwFJ2RZO
        jKWaMPqJrt4yMHJE1/eUVC+oLQ==
X-Google-Smtp-Source: ABdhPJxCANbMX5TTDTOV2/Y7EfbB1lRdKW/LtDxnuqDYCG6hNDa5OYYhhH3CLzY66/HjeMCgqRSfEA==
X-Received: by 2002:a62:ab14:0:b0:47b:e126:ea50 with SMTP id p20-20020a62ab14000000b0047be126ea50mr15898439pff.58.1635206463863;
        Mon, 25 Oct 2021 17:01:03 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
        by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 17:01:03 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Tomi Valkeinen <tomba@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 20/34] drm/omap: Migrate to aggregate driver
Date:   Mon, 25 Oct 2021 17:00:30 -0700
Message-Id: <20211026000044.885195-21-swboyd@chromium.org>
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

Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/omapdrm/dss/dss.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index d6a5862b4dbf..6a6ae2786d7a 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1304,8 +1304,9 @@ static const struct soc_device_attribute dss_soc_devices[] = {
 	{ /* sentinel */ }
 };
 
-static int dss_bind(struct device *dev)
+static int dss_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct dss_device *dss = dev_get_drvdata(dev);
 	struct platform_device *drm_pdev;
 	struct dss_pdata pdata;
@@ -1339,9 +1340,13 @@ static void dss_unbind(struct device *dev)
 	component_unbind_all(dev, NULL);
 }
 
-static const struct component_master_ops dss_component_ops = {
-	.bind = dss_bind,
-	.unbind = dss_unbind,
+static struct aggregate_driver dss_aggregate_driver = {
+	.probe = dss_bind,
+	.remove = dss_unbind,
+	.driver = {
+		.name = "dss_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int dss_component_compare(struct device *dev, void *data)
@@ -1504,7 +1509,7 @@ static int dss_probe(struct platform_device *pdev)
 	cmatch.match = &match;
 	device_for_each_child(&pdev->dev, &cmatch, dss_add_child_component);
 
-	r = component_master_add_with_match(&pdev->dev, &dss_component_ops, match);
+	r = component_aggregate_register(&pdev->dev, &dss_aggregate_driver, match);
 	if (r)
 		goto err_of_depopulate;
 
@@ -1543,7 +1548,7 @@ static int dss_remove(struct platform_device *pdev)
 
 	of_platform_depopulate(&pdev->dev);
 
-	component_master_del(&pdev->dev, &dss_component_ops);
+	component_aggregate_unregister(&pdev->dev, &dss_aggregate_driver);
 
 	dss_debugfs_remove_file(dss->debugfs.clk);
 	dss_debugfs_remove_file(dss->debugfs.dss);
-- 
https://chromeos.dev

