Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50FE7AD4F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 11:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjIYJ40 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 05:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbjIYJ4D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 05:56:03 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DA7115
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 02:55:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qkiJY-0007xN-JT; Mon, 25 Sep 2023 11:55:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qkiJX-008pzf-Kw; Mon, 25 Sep 2023 11:55:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qkiJX-004dlW-Bn; Mon, 25 Sep 2023 11:55:39 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 18/40] soc/qcom: icc-bwmon: Convert to platform remove callback returning void
Date:   Mon, 25 Sep 2023 11:55:09 +0200
Message-Id: <20230925095532.1984344-19-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1699; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=p7Y6ZSGoHFVnYoY5YFtM37zF1FolMcixHTRwjNtIzHc=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlTBiJBJ/CGhc2LyEs3Dbh3sqbj1ycpf6/TTtmMXBZ/ZO zDU9At2MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCR6nccDH0KXNc8/1d9mMLY uVsvoCCz3STo0xFbTYdvSsfWMQrtaWfw2Ln//jReX/aAWXrirD3v77Y4ujcz+5rk5xj6uL+ZvVT 8ObNMzoboSxcimGTVSnk+hKUd5vESLVvUuYLtUsACefP2nOWnNWZeWL/7zB2Dq4btnouOf8+7yb 95T9wtxpcc7J03DlYJ5c0weHh7j6u3GNvWvD1ttRsri4J/sPw9p+i4o6r58jIG+VNNGjrSJ8qWb GnVNJpyTbbvbHr09F+cV1Pq7UU/NIXPfpvReitJaE3vj39/moufnUz5tu3fjR7+1JaVqZI2xz18 RZxd9vxL3j8lkddyg0nk8nkHZSdx3NLTcj16rP/jpc8dAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/soc/qcom/icc-bwmon.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index adf2d523f103..656706259353 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -793,13 +793,11 @@ static int bwmon_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int bwmon_remove(struct platform_device *pdev)
+static void bwmon_remove(struct platform_device *pdev)
 {
 	struct icc_bwmon *bwmon = platform_get_drvdata(pdev);
 
 	bwmon_disable(bwmon);
-
-	return 0;
 }
 
 static const struct icc_bwmon_data msm8998_bwmon_data = {
@@ -862,7 +860,7 @@ MODULE_DEVICE_TABLE(of, bwmon_of_match);
 
 static struct platform_driver bwmon_driver = {
 	.probe = bwmon_probe,
-	.remove = bwmon_remove,
+	.remove_new = bwmon_remove,
 	.driver = {
 		.name = "qcom-bwmon",
 		.of_match_table = bwmon_of_match,
-- 
2.40.1

