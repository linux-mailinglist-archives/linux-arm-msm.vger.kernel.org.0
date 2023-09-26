Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7C37AE81E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 10:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbjIZIcr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Sep 2023 04:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjIZIcq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Sep 2023 04:32:46 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5AE1B4
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Sep 2023 01:32:39 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ql3Ue-0002jg-Sg; Tue, 26 Sep 2023 10:32:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ql3Ue-00940U-D6; Tue, 26 Sep 2023 10:32:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ql3Ue-004uz3-3o; Tue, 26 Sep 2023 10:32:32 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] soc: qcom: llcc: Handle a second device without data corruption
Date:   Tue, 26 Sep 2023 10:32:29 +0200
Message-Id: <20230926083229.2073890-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=tXBulIXjHrMCPddmJAgFk92xEg3kufxa3zIZWGHtS0k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlEpccKbxECdNnOkWvzKRZCgSsRLTMjBm3EzFDe HA3QCreM/2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRKXHAAKCRCPgPtYfRL+ TtmpCACsomkYYASmrDsl+/e6g6dL/ztB4todetkooo3HfJTqy1WSahPoMTo+YeOUDJDX1uh/am1 W5yLZw0uIogz7mUN9Yq7AuBx4WQyYGE1EDakUoaE6PmRpwZmCkwPbZ1rFI8RI8zEV8leAhbbFG/ wkvmV5lH1TeAm9sYiNHOlfuCoawW42R5GXQXnYqeU26+AiUF9RkipOZYIKc2TxFaJwnFI5xAEnx LmLcp8rh+tEMRkOQqZOLyL5GlyLlmlHCwvJ0a3Guoiqr5C5qgxcbBEPE17itpGHCM1/rTSS/C6x 6bdwnhtiK32W1qCCXEn3/zKsvSZtGvkaX10q1Y8gzqhCeaVC
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

Usually there is only one llcc device. But if there were a second, even
a failed probe call would modify the global drv_data pointer. So check
if drv_data is valid before overwriting it.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

the check added here is racy. To fix that race a lock would be needed to
protect drv_data. Alternatively (and cleaner) drv_data could be stored
using platform_set_drvdata(pdev, ...), but that cannot be done trivially
because there is a global function (llcc_slice_getd) that needs drv_data
but has no access to the platform device.

I don't know what is sensible here, so I just added this 90% fix. If you
want a more sophisticated solution, please create one yourself and just
consider my patch a problem report.

Best regards
Uwe

 drivers/soc/qcom/llcc-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index feb21637ac20..e3f262a50e4a 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -1120,6 +1120,9 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 	u32 version;
 	struct regmap *regmap;
 
+	if (!IS_ERR(drv_data))
+		return -EBUSY;
+
 	drv_data = devm_kzalloc(dev, sizeof(*drv_data), GFP_KERNEL);
 	if (!drv_data) {
 		ret = -ENOMEM;
-- 
2.40.1

