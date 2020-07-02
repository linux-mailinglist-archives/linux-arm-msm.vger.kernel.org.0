Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3BB62122C2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 13:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgGBL5D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 07:57:03 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41569 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbgGBL5D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 07:57:03 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jqxpr-0006Wj-Fy; Thu, 02 Jul 2020 11:56:59 +0000
From:   Colin King <colin.king@canonical.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] regulator: fix null pointer check on regmap
Date:   Thu,  2 Jul 2020 12:56:59 +0100
Message-Id: <20200702115659.38208-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The null pointer check on regmap that checks for a dev_get_regmap failure
is currently returning -ENOENT if the regmap succeeded. Fix this by adding
in the missing ! operator.

Addresses-Coverity: ("Dereference after null check")
Fixes: 4fe66d5a62fb ("regulator: Add support for QCOM PMIC VBUS booster")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index 342d92373598..8ba947f3585f 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -49,7 +49,7 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	}
 
 	regmap = dev_get_regmap(dev->parent, NULL);
-	if (regmap) {
+	if (!regmap) {
 		dev_err(dev, "Failed to get regmap\n");
 		return -ENOENT;
 	}
-- 
2.27.0

