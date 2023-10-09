Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7FE7BE650
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 18:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377627AbjJIQZb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 12:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377216AbjJIQZ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 12:25:28 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5749C
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 09:25:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpt4E-0004ih-7n; Mon, 09 Oct 2023 18:25:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpt4D-000SWX-RC; Mon, 09 Oct 2023 18:25:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpt4D-00CPkV-HQ; Mon, 09 Oct 2023 18:25:13 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] pinctrl: qcom/msm: Convert to platform remove callback returning void
Date:   Mon,  9 Oct 2023 18:25:09 +0200
Message-Id: <20231009162510.335208-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009162510.335208-1-u.kleine-koenig@pengutronix.de>
References: <20231009162510.335208-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=28621; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=80xesOc7Uma3j5D4meKutmp7Kjd12SnpTkYkLA7Qn14=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlJClixBqc2odAK5WGBBhpaGEHlXx+VZ8JDSUQz gBVoYi+yqyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSQpYgAKCRCPgPtYfRL+ TrdKB/4gSu96F9Wnj5oBa3xoc6DP2UgcynqwBJESWIhKnzEMdcpjGtZccyBvCcv+16rrPF10zg1 +fKCnwrB1M4jnPGaAO+rZUh1U0Ws3qxXSTJaX2RVts+uhfqyGNwJKCKlbCDfH6zdpw0ZUDGLE4G /Al65oBGH5PfsDnqz9HoeNpM56c+W7AgZqqTFOpupp8JReOapH3Z8/QbcE5HXXZ7/Z8BTIVYLd6 s6SK/KUQVwSx7Ximk79CbCgmsvH/8xdiL58X2sHZ1mX5X4cPhZcY2wKknUTnLvjxupBJ82Ee5HH /Y3hrnmgfZfvKJ8vRF54mLouVeSxn8XKMTaWxaX7iY7Y/E3n
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

To convert all those qcom pinctrl drivers, make msm_pinctrl_remove()
return void (instead of zero) and use .remove_new in all drivers.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pinctrl/qcom/pinctrl-apq8064.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-apq8084.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq4019.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5018.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq5332.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq6018.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8064.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8074.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq9574.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9607.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9615.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c      | 4 +---
 drivers/pinctrl/qcom/pinctrl-msm.h      | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8226.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8909.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8916.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8953.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8960.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8976.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8994.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8996.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8998.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8x74.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcm2290.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcs404.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-qdu1000.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7180.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c  | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdm660.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdm670.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdx55.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdx65.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdx75.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6125.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6350.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6375.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm7150.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8150.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8350.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8450.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8550.c   | 2 +-
 49 files changed, 49 insertions(+), 51 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-apq8064.c b/drivers/pinctrl/qcom/pinctrl-apq8064.c
index 20c3b9025044..a18df4162299 100644
--- a/drivers/pinctrl/qcom/pinctrl-apq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-apq8064.c
@@ -629,7 +629,7 @@ static struct platform_driver apq8064_pinctrl_driver = {
 		.of_match_table = apq8064_pinctrl_of_match,
 	},
 	.probe = apq8064_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init apq8064_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-apq8084.c b/drivers/pinctrl/qcom/pinctrl-apq8084.c
index 3fc0a40762b6..afada80e52a2 100644
--- a/drivers/pinctrl/qcom/pinctrl-apq8084.c
+++ b/drivers/pinctrl/qcom/pinctrl-apq8084.c
@@ -1207,7 +1207,7 @@ static struct platform_driver apq8084_pinctrl_driver = {
 		.of_match_table = apq8084_pinctrl_of_match,
 	},
 	.probe = apq8084_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init apq8084_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
index 1f7944dd829d..cb13576ad6cf 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
@@ -710,7 +710,7 @@ static struct platform_driver ipq4019_pinctrl_driver = {
 		.of_match_table = ipq4019_pinctrl_of_match,
 	},
 	.probe = ipq4019_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init ipq4019_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
index e2951f81c3ee..68f65b57003e 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
@@ -754,7 +754,7 @@ static struct platform_driver ipq5018_pinctrl_driver = {
 		.of_match_table = ipq5018_pinctrl_of_match,
 	},
 	.probe = ipq5018_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init ipq5018_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5332.c b/drivers/pinctrl/qcom/pinctrl-ipq5332.c
index 625f8014051f..882175118970 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq5332.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq5332.c
@@ -834,7 +834,7 @@ static struct platform_driver ipq5332_pinctrl_driver = {
 		.of_match_table = ipq5332_pinctrl_of_match,
 	},
 	.probe = ipq5332_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init ipq5332_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq6018.c b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
index 0ad08647dbcd..ac330d8712b5 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq6018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
@@ -1080,7 +1080,7 @@ static struct platform_driver ipq6018_pinctrl_driver = {
 		.of_match_table = ipq6018_pinctrl_of_match,
 	},
 	.probe = ipq6018_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init ipq6018_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8064.c b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
index e2bb94e86aef..e10e1bc4c911 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
@@ -631,7 +631,7 @@ static struct platform_driver ipq8064_pinctrl_driver = {
 		.of_match_table = ipq8064_pinctrl_of_match,
 	},
 	.probe = ipq8064_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init ipq8064_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8074.c b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
index 337f3a1c92c1..fee32c1d1d3e 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8074.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
@@ -1041,7 +1041,7 @@ static struct platform_driver ipq8074_pinctrl_driver = {
 		.of_match_table = ipq8074_pinctrl_of_match,
 	},
 	.probe = ipq8074_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init ipq8074_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq9574.c b/drivers/pinctrl/qcom/pinctrl-ipq9574.c
index e2491617b236..20ab59cb621b 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq9574.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq9574.c
@@ -799,7 +799,7 @@ static struct platform_driver ipq9574_pinctrl_driver = {
 		.of_match_table = ipq9574_pinctrl_of_match,
 	},
 	.probe = ipq9574_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init ipq9574_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-mdm9607.c b/drivers/pinctrl/qcom/pinctrl-mdm9607.c
index e7cd3ef1cf3e..415d24e16267 100644
--- a/drivers/pinctrl/qcom/pinctrl-mdm9607.c
+++ b/drivers/pinctrl/qcom/pinctrl-mdm9607.c
@@ -1059,7 +1059,7 @@ static struct platform_driver mdm9607_pinctrl_driver = {
 		.of_match_table = mdm9607_pinctrl_of_match,
 	},
 	.probe = mdm9607_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init mdm9607_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-mdm9615.c b/drivers/pinctrl/qcom/pinctrl-mdm9615.c
index 0a2ae383d3d5..3f2eafea0b24 100644
--- a/drivers/pinctrl/qcom/pinctrl-mdm9615.c
+++ b/drivers/pinctrl/qcom/pinctrl-mdm9615.c
@@ -446,7 +446,7 @@ static struct platform_driver mdm9615_pinctrl_driver = {
 		.of_match_table = mdm9615_pinctrl_of_match,
 	},
 	.probe = mdm9615_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init mdm9615_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 115b83e2d8e6..395040346d0f 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1547,15 +1547,13 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 }
 EXPORT_SYMBOL(msm_pinctrl_probe);
 
-int msm_pinctrl_remove(struct platform_device *pdev)
+void msm_pinctrl_remove(struct platform_device *pdev)
 {
 	struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&pctrl->chip);
 
 	unregister_restart_handler(&pctrl->restart_nb);
-
-	return 0;
 }
 EXPORT_SYMBOL(msm_pinctrl_remove);
 
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 1d2f2e904da1..4968d08a384d 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -166,6 +166,6 @@ extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
 
 int msm_pinctrl_probe(struct platform_device *pdev,
 		      const struct msm_pinctrl_soc_data *soc_data);
-int msm_pinctrl_remove(struct platform_device *pdev);
+void msm_pinctrl_remove(struct platform_device *pdev);
 
 #endif
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8226.c b/drivers/pinctrl/qcom/pinctrl-msm8226.c
index 994619840a70..90b4004e7faf 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8226.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8226.c
@@ -638,7 +638,7 @@ static struct platform_driver msm8226_pinctrl_driver = {
 		.of_match_table = msm8226_pinctrl_of_match,
 	},
 	.probe = msm8226_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init msm8226_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8660.c b/drivers/pinctrl/qcom/pinctrl-msm8660.c
index 999a5f867eb5..dba6d531b4a1 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8660.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8660.c
@@ -981,7 +981,7 @@ static struct platform_driver msm8660_pinctrl_driver = {
 		.of_match_table = msm8660_pinctrl_of_match,
 	},
 	.probe = msm8660_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init msm8660_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8909.c b/drivers/pinctrl/qcom/pinctrl-msm8909.c
index 756856d20d6b..14b17ba9f906 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8909.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8909.c
@@ -929,7 +929,7 @@ static struct platform_driver msm8909_pinctrl_driver = {
 		.of_match_table = msm8909_pinctrl_of_match,
 	},
 	.probe = msm8909_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init msm8909_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8916.c b/drivers/pinctrl/qcom/pinctrl-msm8916.c
index cea5c54f92fe..184dcf842273 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8916.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8916.c
@@ -969,7 +969,7 @@ static struct platform_driver msm8916_pinctrl_driver = {
 		.of_match_table = msm8916_pinctrl_of_match,
 	},
 	.probe = msm8916_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init msm8916_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8953.c b/drivers/pinctrl/qcom/pinctrl-msm8953.c
index 998351bdfee1..c2253821ae8d 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8953.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8953.c
@@ -1816,7 +1816,7 @@ static struct platform_driver msm8953_pinctrl_driver = {
 		.of_match_table = msm8953_pinctrl_of_match,
 	},
 	.probe = msm8953_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init msm8953_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8960.c b/drivers/pinctrl/qcom/pinctrl-msm8960.c
index ebe230b3b437..6b9148d226e9 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8960.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8960.c
@@ -1246,7 +1246,7 @@ static struct platform_driver msm8960_pinctrl_driver = {
 		.of_match_table = msm8960_pinctrl_of_match,
 	},
 	.probe = msm8960_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init msm8960_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8976.c b/drivers/pinctrl/qcom/pinctrl-msm8976.c
index c30d80e4e98c..9a951888e8a1 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8976.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8976.c
@@ -1096,7 +1096,7 @@ static struct platform_driver msm8976_pinctrl_driver = {
 		.of_match_table = msm8976_pinctrl_of_match,
 	},
 	.probe = msm8976_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init msm8976_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8994.c b/drivers/pinctrl/qcom/pinctrl-msm8994.c
index b1a6759ab4a5..1ed1dd32d6c7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8994.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8994.c
@@ -1343,7 +1343,7 @@ static struct platform_driver msm8994_pinctrl_driver = {
 		.of_match_table = msm8994_pinctrl_of_match,
 	},
 	.probe = msm8994_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init msm8994_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8996.c b/drivers/pinctrl/qcom/pinctrl-msm8996.c
index 46cc0b49dbab..5f0e7f78fd51 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8996.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8996.c
@@ -1906,7 +1906,7 @@ static struct platform_driver msm8996_pinctrl_driver = {
 		.of_match_table = msm8996_pinctrl_of_match,
 	},
 	.probe = msm8996_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init msm8996_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8998.c b/drivers/pinctrl/qcom/pinctrl-msm8998.c
index b7cbf32b3125..4aaf45e54f3a 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8998.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8998.c
@@ -1535,7 +1535,7 @@ static struct platform_driver msm8998_pinctrl_driver = {
 		.of_match_table = msm8998_pinctrl_of_match,
 	},
 	.probe = msm8998_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init msm8998_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8x74.c b/drivers/pinctrl/qcom/pinctrl-msm8x74.c
index d5fe62992849..58b4f6f31ae6 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8x74.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8x74.c
@@ -1071,7 +1071,7 @@ static struct platform_driver msm8x74_pinctrl_driver = {
 		.of_match_table = msm8x74_pinctrl_of_match,
 	},
 	.probe = msm8x74_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init msm8x74_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qcm2290.c b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
index ba699eac9ee8..f5c1c427b44e 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcm2290.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
@@ -1113,7 +1113,7 @@ static struct platform_driver qcm2290_pinctrl_driver = {
 		.of_match_table = qcm2290_pinctrl_of_match,
 	},
 	.probe = qcm2290_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init qcm2290_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs404.c b/drivers/pinctrl/qcom/pinctrl-qcs404.c
index ae7224012f8a..9a875b7dc998 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs404.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs404.c
@@ -1644,7 +1644,7 @@ static struct platform_driver qcs404_pinctrl_driver = {
 		.of_match_table = qcs404_pinctrl_of_match,
 	},
 	.probe = qcs404_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init qcs404_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c b/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
index b5808fcfb13c..4d2f6f495163 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdf2xxx.c
@@ -145,7 +145,7 @@ static struct platform_driver qdf2xxx_pinctrl_driver = {
 		.acpi_match_table = qdf2xxx_acpi_ids,
 	},
 	.probe = qdf2xxx_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init qdf2xxx_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-qdu1000.c b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
index 47bc529ef550..da4f940bc8d4 100644
--- a/drivers/pinctrl/qcom/pinctrl-qdu1000.c
+++ b/drivers/pinctrl/qcom/pinctrl-qdu1000.c
@@ -1248,7 +1248,7 @@ static struct platform_driver qdu1000_tlmm_driver = {
 		.of_match_table = qdu1000_tlmm_of_match,
 	},
 	.probe = qdu1000_tlmm_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init qdu1000_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 8fdea25d8d67..5459c0c681a2 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -1530,7 +1530,7 @@ static struct platform_driver sa8775p_pinctrl_driver = {
 		.of_match_table = sa8775p_pinctrl_of_match,
 	},
 	.probe = sa8775p_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sa8775p_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
index 6eb0c73791c0..c27aaa599b91 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
@@ -1159,7 +1159,7 @@ static struct platform_driver sc7180_pinctrl_driver = {
 		.of_match_table = sc7180_pinctrl_of_match,
 	},
 	.probe = sc7180_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sc7180_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index 0c10eeb60b55..c2db663e396e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -1505,7 +1505,7 @@ static struct platform_driver sc7280_pinctrl_driver = {
 		.of_match_table = sc7280_pinctrl_of_match,
 	},
 	.probe = sc7280_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sc7280_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8180x.c b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
index d6a79ad41a40..cfa7c8be9770 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
@@ -1720,7 +1720,7 @@ static struct platform_driver sc8180x_pinctrl_driver = {
 		.acpi_match_table = sc8180x_pinctrl_acpi_match,
 	},
 	.probe = sc8180x_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sc8180x_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
index 96f4fb5a5d29..4b1c49697698 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp.c
@@ -1926,7 +1926,7 @@ static struct platform_driver sc8280xp_pinctrl_driver = {
 		.of_match_table = sc8280xp_pinctrl_of_match,
 	},
 	.probe = sc8280xp_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sc8280xp_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660.c b/drivers/pinctrl/qcom/pinctrl-sdm660.c
index c2e0d5c034ac..b0c29a24b09b 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm660.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660.c
@@ -1428,7 +1428,7 @@ static struct platform_driver sdm660_pinctrl_driver = {
 		.of_match_table = sdm660_pinctrl_of_match,
 	},
 	.probe = sdm660_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sdm660_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670.c b/drivers/pinctrl/qcom/pinctrl-sdm670.c
index cc3cce077de4..1e694a966953 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm670.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670.c
@@ -1318,7 +1318,7 @@ static struct platform_driver sdm670_pinctrl_driver = {
 		.of_match_table = sdm670_pinctrl_of_match,
 	},
 	.probe = sdm670_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sdm670_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index cc05c415ed15..3f3265e0018d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -1351,7 +1351,7 @@ static struct platform_driver sdm845_pinctrl_driver = {
 		.acpi_match_table = ACPI_PTR(sdm845_pinctrl_acpi_match),
 	},
 	.probe = sdm845_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sdm845_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
index 8826db9d21d0..c88b8bfcacb6 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx55.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx55.c
@@ -990,7 +990,7 @@ static struct platform_driver sdx55_pinctrl_driver = {
 		.of_match_table = sdx55_pinctrl_of_match,
 	},
 	.probe = sdx55_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sdx55_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx65.c b/drivers/pinctrl/qcom/pinctrl-sdx65.c
index f6f319c997fc..bd44ec0fcab4 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx65.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx65.c
@@ -939,7 +939,7 @@ static struct platform_driver sdx65_pinctrl_driver = {
 		.of_match_table = sdx65_pinctrl_of_match,
 	},
 	.probe = sdx65_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sdx65_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx75.c b/drivers/pinctrl/qcom/pinctrl-sdx75.c
index 3cfe8c7f04df..396f6fc779a2 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx75.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx75.c
@@ -1124,7 +1124,7 @@ static struct platform_driver sdx75_pinctrl_driver = {
 		.of_match_table = sdx75_pinctrl_of_match,
 	},
 	.probe = sdx75_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sdx75_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115.c b/drivers/pinctrl/qcom/pinctrl-sm6115.c
index 2a06025f4885..87057089b2b6 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115.c
@@ -895,7 +895,7 @@ static struct platform_driver sm6115_tlmm_driver = {
 		.of_match_table = sm6115_tlmm_of_match,
 	},
 	.probe = sm6115_tlmm_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sm6115_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6125.c b/drivers/pinctrl/qcom/pinctrl-sm6125.c
index d5e2b896954c..e07339ba72bc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6125.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6125.c
@@ -1249,7 +1249,7 @@ static struct platform_driver sm6125_tlmm_driver = {
 		.of_match_table = sm6125_tlmm_of_match,
 	},
 	.probe = sm6125_tlmm_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sm6125_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6350.c b/drivers/pinctrl/qcom/pinctrl-sm6350.c
index f3828c07b134..4aeb1ba43ee3 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6350.c
@@ -1373,7 +1373,7 @@ static struct platform_driver sm6350_tlmm_driver = {
 		.of_match_table = sm6350_tlmm_of_match,
 	},
 	.probe = sm6350_tlmm_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sm6350_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6375.c b/drivers/pinctrl/qcom/pinctrl-sm6375.c
index c82c8516932e..d86630d7125c 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6375.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6375.c
@@ -1516,7 +1516,7 @@ static struct platform_driver sm6375_tlmm_driver = {
 		.of_match_table = sm6375_tlmm_of_match,
 	},
 	.probe = sm6375_tlmm_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sm6375_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm7150.c b/drivers/pinctrl/qcom/pinctrl-sm7150.c
index 33657cf98fb9..c25357ca1963 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm7150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm7150.c
@@ -1254,7 +1254,7 @@ static struct platform_driver sm7150_tlmm_driver = {
 		.of_match_table = sm7150_tlmm_of_match,
 	},
 	.probe = sm7150_tlmm_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sm7150_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
index 01aea9c70b7a..f8f5bee74f1d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
@@ -1542,7 +1542,7 @@ static struct platform_driver sm8150_pinctrl_driver = {
 		.of_match_table = sm8150_pinctrl_of_match,
 	},
 	.probe = sm8150_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sm8150_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index e9961a49ff98..54fda77bf296 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1351,7 +1351,7 @@ static struct platform_driver sm8250_pinctrl_driver = {
 		.of_match_table = sm8250_pinctrl_of_match,
 	},
 	.probe = sm8250_pinctrl_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sm8250_pinctrl_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
index 9c69458bd910..ac7f2820f2cb 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8350.c
@@ -1642,7 +1642,7 @@ static struct platform_driver sm8350_tlmm_driver = {
 		.of_match_table = sm8350_tlmm_of_match,
 	},
 	.probe = sm8350_tlmm_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sm8350_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450.c b/drivers/pinctrl/qcom/pinctrl-sm8450.c
index d11bb1ee9e3d..617286711695 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450.c
@@ -1677,7 +1677,7 @@ static struct platform_driver sm8450_tlmm_driver = {
 		.of_match_table = sm8450_tlmm_of_match,
 	},
 	.probe = sm8450_tlmm_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sm8450_tlmm_init(void)
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550.c b/drivers/pinctrl/qcom/pinctrl-sm8550.c
index 3c847d9cb5d9..9184e0183755 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550.c
@@ -1762,7 +1762,7 @@ static struct platform_driver sm8550_tlmm_driver = {
 		.of_match_table = sm8550_tlmm_of_match,
 	},
 	.probe = sm8550_tlmm_probe,
-	.remove = msm_pinctrl_remove,
+	.remove_new = msm_pinctrl_remove,
 };
 
 static int __init sm8550_tlmm_init(void)
-- 
2.40.1

