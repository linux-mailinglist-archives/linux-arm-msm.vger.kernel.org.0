Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A04642474A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 21:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239680AbhJFTm1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 15:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239690AbhJFTmF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 15:42:05 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C764EC06176A
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 12:38:59 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id 187so3259042pfc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 12:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fm8Ray60W+gsuBVO8IyR/yw2T2Yz5Ywf4X0EOYohXDA=;
        b=M9bnTNDCnWZ/AbmQrReLF0e9g14dbA2hMeAudESF0IRy+EF1EO5K2SqFpOXTYT37uU
         +xiIEGGNUokqXTN+fkT+Ar/FbOVmdVa11MMVtVg+n2H9yF/wuPa634sJWEjxXsnaWnIi
         Jm3hHKiIfWl3hAvdG6otRnoM3OP1/4OE9lnUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fm8Ray60W+gsuBVO8IyR/yw2T2Yz5Ywf4X0EOYohXDA=;
        b=43wurfbYRg/kmckZCCZPJ83rVfF4fGwT8MIbwqMrZddmFIeKxXLpiAa4arORDwKBYa
         BAJ9uNuevbszjTge0Rkh/EH8aQRNpWfP+2chtlI9O7d9aPwXZ5Nn+OGYoUKqN+P2f+GU
         rd7RZ4oWG//FCQ76y7N+9dPa08gmte39KjD6t6aTptRf85kZWsRBwVwJpqKC+vk0iTBR
         5twSPKeIYgIQdX4ZjVHfjTE2J6Cuz5EnPWg4/PHXMZZ7cemsfUudCXBtF9/zZr9XCgvj
         kk8xF1UDYSEV7C7Nghpk8OE8NDMYNe8pXKcHcHCLcjpsj5gJO4Ptzh89f4nLMS36s6R2
         uYYg==
X-Gm-Message-State: AOAM533qRzh4kiEGoWOyBMDRK+XWMJ78mezrhlRi5pLblGbuCMXCR18t
        cAngXNWy4LTZgJKK16RYLgW5Lw==
X-Google-Smtp-Source: ABdhPJzpbRB1T9FQhbPMp3f4W/5RvgPd0ymjpSO4hqV8uhllwkUtr714mEwXdatDXZpTyqxVsLio9A==
X-Received: by 2002:a63:7456:: with SMTP id e22mr458679pgn.324.1633549139432;
        Wed, 06 Oct 2021 12:38:59 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
        by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:38:59 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 31/34] ASoC: codecs: wcd938x: Migrate to aggregate driver
Date:   Wed,  6 Oct 2021 12:38:16 -0700
Message-Id: <20211006193819.2654854-32-swboyd@chromium.org>
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

Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/codecs/wcd938x.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index f0daf8defcf1..6033de7f57ef 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -4316,8 +4316,9 @@ static struct snd_soc_dai_driver wcd938x_dais[] = {
 	},
 };
 
-static int wcd938x_bind(struct device *dev)
+static int wcd938x_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct wcd938x_priv *wcd938x = dev_get_drvdata(dev);
 	int ret;
 
@@ -4400,8 +4401,9 @@ static int wcd938x_bind(struct device *dev)
 
 }
 
-static void wcd938x_unbind(struct device *dev)
+static void wcd938x_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct wcd938x_priv *wcd938x = dev_get_drvdata(dev);
 
 	device_link_remove(dev, wcd938x->txdev);
@@ -4411,9 +4413,13 @@ static void wcd938x_unbind(struct device *dev)
 	component_unbind_all(dev, wcd938x);
 }
 
-static const struct component_master_ops wcd938x_comp_ops = {
-	.bind   = wcd938x_bind,
-	.unbind = wcd938x_unbind,
+static struct aggregate_driver wcd938x_aggregate_driver = {
+	.probe	= wcd938x_bind,
+	.remove	= wcd938x_unbind,
+	.driver	= {
+		.name = "wcd938x_snd",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int wcd938x_compare_of(struct device *dev, void *data)
@@ -4482,7 +4488,7 @@ static int wcd938x_probe(struct platform_device *pdev)
 
 	wcd938x_reset(wcd938x);
 
-	ret = component_master_add_with_match(dev, &wcd938x_comp_ops, match);
+	ret = component_aggregate_register(dev, &wcd938x_aggregate_driver, match);
 	if (ret)
 		return ret;
 
@@ -4498,7 +4504,7 @@ static int wcd938x_probe(struct platform_device *pdev)
 
 static int wcd938x_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &wcd938x_comp_ops);
+	component_aggregate_unregister(&pdev->dev, &wcd938x_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

