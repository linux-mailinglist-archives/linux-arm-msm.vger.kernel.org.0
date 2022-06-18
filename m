Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9518D5506B0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 22:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiFRUj2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Jun 2022 16:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiFRUj2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Jun 2022 16:39:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8129511C02
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jun 2022 13:39:26 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o2fE4-0008Sj-5c; Sat, 18 Jun 2022 22:39:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o2fDz-001JoX-Vy; Sat, 18 Jun 2022 22:39:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o2fE0-00HEz7-Dz; Sat, 18 Jun 2022 22:39:20 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] soc: qcom: apr: Drop redundant check in .remove()
Date:   Sat, 18 Jun 2022 22:39:13 +0200
Message-Id: <20220618203913.35785-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; h=from:subject; bh=JsHrQ2pT4Wamglko83KASyY4hUYZhe2HpMoy8MvutcU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBirjfsvtCmv8rhVrCKjsE+dQilL4OvvMZ/ePxoEGiU Y3fLdXSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYq437AAKCRDB/BR4rcrsCRtqB/ 9gXfiF6UlrRMeEWzBqaW8ClFQqOytjKbObM733hGur6PZD7onjqgCWI6zSTCYTDjZJfxHQmisqI4cH 0G5e138XtVyfUtZjwAGENNYrgRl0SdfyQgoCYfVeutAOErBhTzGbTQNBra6kzm5Ss6hZd8NRCId+7u Y3HxplsUXBmbl72LgmYvvBm2rqQ5398ZzUiUT2JxS6/NLBqo7XhJRzoCKVesTNJUyLWv/GZOpY0Izz fPr7ccUu31q2laIOPxi1EZhjhoaAes1tUjuYziZaepXQM53oQepypqC7lG1LlN1jToBSedDeVjVz+N ktsyuj+TjxhustNe9YpMIMfxt3UYTC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The remove callback is only called by the driver core if there is a
driver to unbind, so there is no need to check dev->driver to be
non-NULL.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/soc/qcom/apr.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 3caabd873322..b4046f393575 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -377,17 +377,14 @@ static int apr_device_probe(struct device *dev)
 static void apr_device_remove(struct device *dev)
 {
 	struct apr_device *adev = to_apr_device(dev);
-	struct apr_driver *adrv;
+	struct apr_driver *adrv = to_apr_driver(dev->driver);
 	struct packet_router *apr = dev_get_drvdata(adev->dev.parent);
 
-	if (dev->driver) {
-		adrv = to_apr_driver(dev->driver);
-		if (adrv->remove)
-			adrv->remove(adev);
-		spin_lock(&apr->svcs_lock);
-		idr_remove(&apr->svcs_idr, adev->svc.id);
-		spin_unlock(&apr->svcs_lock);
-	}
+	if (adrv->remove)
+		adrv->remove(adev);
+	spin_lock(&apr->svcs_lock);
+	idr_remove(&apr->svcs_idr, adev->svc.id);
+	spin_unlock(&apr->svcs_lock);
 }
 
 static int apr_uevent(struct device *dev, struct kobj_uevent_env *env)

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

