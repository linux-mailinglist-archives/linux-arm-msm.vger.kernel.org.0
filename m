Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94F8B466C95
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 23:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377571AbhLBWcQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 17:32:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377470AbhLBWbw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 17:31:52 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0231FC06139A
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 14:27:59 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 133so1116925pgc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 14:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uzJHB9t+Bicwdag3X6iL63lm7ZGof5i0wMOcRCsHtBw=;
        b=Jp4M9oOalLXfQ+WZP1KaLKmIr0YSHEDZeX6iW17YG+Abu34OQddIQDLeamTZDTLz4M
         gSoYA8n3mtIKKKkuTv+RRZLsBaRBJFHmknEz5zLGTMICRKY32ZABfecGxWCnJCMZPExC
         x16pSFVRaO9riiVI+U1615vxcNwIjnWVsVNzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uzJHB9t+Bicwdag3X6iL63lm7ZGof5i0wMOcRCsHtBw=;
        b=MbItnQBC5KRImeIUEJ/Cnlc8cjmYCCh5EiZRFuSld/a5l5RV1VdHM0hZe57Fu7hkt1
         +FwFroyazVl/uHp5yJBnlIQ3gosEWQA40b88nY7kDS3lJg0DsiqwrU/27qPo0V79tbNB
         IY+iyF29/hs6R6eqkkJxk1A7Qh2XO+pesG4erJkzFGxXe0fxfLyAkRgFBvggS4BjfhB9
         JclYHbljm/T33vcHyWH5GvufB/iBtJDofCknifxHUROEN+qterp/bq5QVJM2qvbnzNtd
         FShHkY8tPvBwU+EO5EWILqG9g3jfxFPdA9t+DeXIUxjhLV5UZVVAAUMm0fqVbBvBJ3tE
         XtqQ==
X-Gm-Message-State: AOAM531xgK73LyX0PcbK8zmsnZGEldtW3UNC3+gxUyzfAUVDEVM6nnXA
        KoM1lQpktxRsXaQrSXItXuLDxA==
X-Google-Smtp-Source: ABdhPJwUHqMQso+81948bEPyRXAF9fKOn9gpZgEA6F7sXd4yu/e2aqztsPuRfkDwbTU+JhGvHCw7bQ==
X-Received: by 2002:a63:5f0e:: with SMTP id t14mr1577700pgb.107.1638484078545;
        Thu, 02 Dec 2021 14:27:58 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
        by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:27:58 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Tomas Winkler <tomas.winkler@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v4 27/34] mei: Migrate to aggregate driver
Date:   Thu,  2 Dec 2021 14:27:25 -0800
Message-Id: <20211202222732.2453851-28-swboyd@chromium.org>
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

Cc: Tomas Winkler <tomas.winkler@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/misc/mei/hdcp/mei_hdcp.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
index ec2a4fce8581..79dcc02277d2 100644
--- a/drivers/misc/mei/hdcp/mei_hdcp.c
+++ b/drivers/misc/mei/hdcp/mei_hdcp.c
@@ -732,8 +732,9 @@ static const struct i915_hdcp_component_ops mei_hdcp_ops = {
 	.close_hdcp_session = mei_hdcp_close_session,
 };
 
-static int mei_component_master_bind(struct device *dev)
+static int mei_component_master_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	struct i915_hdcp_comp_master *comp_master =
 						mei_cldev_get_drvdata(cldev);
@@ -749,8 +750,9 @@ static int mei_component_master_bind(struct device *dev)
 	return 0;
 }
 
-static void mei_component_master_unbind(struct device *dev)
+static void mei_component_master_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct mei_cl_device *cldev = to_mei_cl_device(dev);
 	struct i915_hdcp_comp_master *comp_master =
 						mei_cldev_get_drvdata(cldev);
@@ -759,9 +761,13 @@ static void mei_component_master_unbind(struct device *dev)
 	component_unbind_all(dev, comp_master);
 }
 
-static const struct component_master_ops mei_component_master_ops = {
-	.bind = mei_component_master_bind,
-	.unbind = mei_component_master_unbind,
+static struct aggregate_driver mei_aggregate_driver = {
+	.probe = mei_component_master_bind,
+	.remove = mei_component_master_unbind,
+	.driver = {
+		.name = "mei_agg",
+		.owner = THIS_MODULE,
+	},
 };
 
 /**
@@ -826,9 +832,7 @@ static int mei_hdcp_probe(struct mei_cl_device *cldev,
 	}
 
 	mei_cldev_set_drvdata(cldev, comp_master);
-	ret = component_master_add_with_match(&cldev->dev,
-					      &mei_component_master_ops,
-					      master_match);
+	ret = component_aggregate_register(&cldev->dev, &mei_aggregate_driver, master_match);
 	if (ret < 0) {
 		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
 		goto err_exit;
@@ -850,7 +854,7 @@ static void mei_hdcp_remove(struct mei_cl_device *cldev)
 						mei_cldev_get_drvdata(cldev);
 	int ret;
 
-	component_master_del(&cldev->dev, &mei_component_master_ops);
+	component_aggregate_unregister(&cldev->dev, &mei_aggregate_driver);
 	kfree(comp_master);
 	mei_cldev_set_drvdata(cldev, NULL);
 
-- 
https://chromeos.dev

