Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADF46C35EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 16:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbjCUPlC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 11:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbjCUPlB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 11:41:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76139DBE0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 08:40:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pee6O-0003FY-NF; Tue, 21 Mar 2023 16:40:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pee6O-005iqH-3D; Tue, 21 Mar 2023 16:40:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pee6N-006nea-B2; Tue, 21 Mar 2023 16:40:43 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 1/3] rpmsg: qcom_smd: Make qcom_smd_unregister_edge() return void
Date:   Tue, 21 Mar 2023 16:40:37 +0100
Message-Id: <20230321154039.355098-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230321154039.355098-1-u.kleine-koenig@pengutronix.de>
References: <20230321154039.355098-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2308; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5XdQzZ0R90F8m3PN1OM+KsPXM1lJB+4lb0RFEzu1plo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGc/yaS3zmOMxxC1JTQiL/wIhkNo3HjSGJY+3a 0Oz/sSufcaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBnP8gAKCRCPgPtYfRL+ TvHFB/4gCLQyyqmKiO0a/fzwN6Zeah5tVdOVeLjQMT2KQhjyahcWuWRt3IRrkKjDlkpFg5qVIWz DvU22vcZ/+kMnkWE27rnos7L4CZvYlrZdpN9yUc+/exCifx1TiBEaMUV+rZ6G3CAcaxSOjBKG/r SQvbjVNzrAnb6AxHNJS8qS4MiKxfeJYG/BtPcLkyEcrffqAzBSW3kQDZgKIireIermpYrwS+Jd1 kC3Ig4NpkpBbL316sSe6KOPWj6reCyEhtOnGLt/KFvP1xDuKhW2XernBxYbRs+6WUqU82daVCEo JMTe8yiOAPSw3XJX0OYu7xwu6PPv8ThnFKeVz0vApDsCY9PI
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This function returned zero unconditionally. Convert it to return no
value instead. This makes it more obvious what happens in the callers.

One caller is converted to return zero explicitly. The only other caller
(smd_subdev_stop() in drivers/remoteproc/qcom_common.c) already ignored
the return value before.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rpmsg/qcom_smd.c       | 8 ++++----
 include/linux/rpmsg/qcom_smd.h | 5 ++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 1044cf03c542..38352f5792f4 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1533,7 +1533,7 @@ static int qcom_smd_remove_device(struct device *dev, void *data)
  * qcom_smd_unregister_edge() - release an edge and its children
  * @edge:      edge reference acquired from qcom_smd_register_edge
  */
-int qcom_smd_unregister_edge(struct qcom_smd_edge *edge)
+void qcom_smd_unregister_edge(struct qcom_smd_edge *edge)
 {
 	int ret;
 
@@ -1547,8 +1547,6 @@ int qcom_smd_unregister_edge(struct qcom_smd_edge *edge)
 
 	mbox_free_channel(edge->mbox_chan);
 	device_unregister(&edge->dev);
-
-	return 0;
 }
 EXPORT_SYMBOL(qcom_smd_unregister_edge);
 
@@ -1572,7 +1570,9 @@ static int qcom_smd_remove_edge(struct device *dev, void *data)
 {
 	struct qcom_smd_edge *edge = to_smd_edge(dev);
 
-	return qcom_smd_unregister_edge(edge);
+	qcom_smd_unregister_edge(edge);
+
+	return 0;
 }
 
 /*
diff --git a/include/linux/rpmsg/qcom_smd.h b/include/linux/rpmsg/qcom_smd.h
index 2e92d7407a85..3379bf4e1cb1 100644
--- a/include/linux/rpmsg/qcom_smd.h
+++ b/include/linux/rpmsg/qcom_smd.h
@@ -11,7 +11,7 @@ struct qcom_smd_edge;
 
 struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
 					     struct device_node *node);
-int qcom_smd_unregister_edge(struct qcom_smd_edge *edge);
+void qcom_smd_unregister_edge(struct qcom_smd_edge *edge);
 
 #else
 
@@ -22,9 +22,8 @@ qcom_smd_register_edge(struct device *parent,
 	return NULL;
 }
 
-static inline int qcom_smd_unregister_edge(struct qcom_smd_edge *edge)
+static inline void qcom_smd_unregister_edge(struct qcom_smd_edge *edge)
 {
-	return 0;
 }
 
 #endif
-- 
2.39.2

