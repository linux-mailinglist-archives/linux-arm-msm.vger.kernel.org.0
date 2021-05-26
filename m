Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158E2392148
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 22:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234746AbhEZUKv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 16:10:51 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:42514 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234641AbhEZUKu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 16:10:50 -0400
Received: from localhost.localdomain (84-115-212-105.cable.dynamic.surfer.at [84.115.212.105])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 38115C5AD2;
        Wed, 26 May 2021 20:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1622059757; bh=nSl88dvDu4VfladIBjzsTLEZ0I0ws1RfDtDwhDrIMB4=;
        h=From:To:Cc:Subject:Date;
        b=FzWUCw1CgQL4W/WeD6YzC49fEkwZ7nWMnKY51/lXX/pbWHue0LzLpnlQxNLaKVU4J
         2hr8LZ8YNbHahMpwXfNyjbZNYXPZ8XJn1qr4vvcHrmIseuOMOMNDazGt5qNpHv4Mf2
         Ead8Xl18N0BvQbnXI0t0s4RKEQQYJmRXemuG3+X0=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: socinfo: import PMIC IDs from pmic-spmi
Date:   Wed, 26 May 2021 22:08:43 +0200
Message-Id: <20210526200843.127916-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver in drivers/mfd/qcom-spmi-pmic.c has a more complete and more
up-to-date list of PMICs with the respective IDs. Use those names for
socinfo. Some IDs seem to have been assigned to multiple PMICs so keep
that in the name as well.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/soc/qcom/socinfo.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 63f14a2a4ef2..a7f974871ca7 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -70,21 +70,33 @@ static const char *const socinfo_image_names[] = {
 
 static const char *const pmic_models[] = {
 	[0]  = "Unknown PMIC model",
+	[1]  = "PM8941",
+	[2]  = "PM8841",
+	[3]  = "PM8019",
+	[4]  = "PM8226",
+	[5]  = "PM8110",
+	[6]  = "PMA8084",
+	[7]  = "PMI8962",
+	[8]  = "PMD9635",
 	[9]  = "PM8994",
+	[10] = "PMI8994",
 	[11] = "PM8916",
-	[13] = "PM8058",
+	[12] = "PM8004",
+	[13] = "PM8909/PM8058",
 	[14] = "PM8028",
 	[15] = "PM8901",
-	[16] = "PM8027",
-	[17] = "ISL9519",
+	[16] = "PM8950/PM8027",
+	[17] = "PMI8950/ISL9519",
 	[18] = "PM8921",
 	[19] = "PM8018",
-	[20] = "PM8015",
-	[21] = "PM8014",
+	[20] = "PM8998/PM8015",
+	[21] = "PMI8998/PM8014",
 	[22] = "PM8821",
 	[23] = "PM8038",
-	[24] = "PM8922",
+	[24] = "PM8005/PM8922",
 	[25] = "PM8917",
+	[26] = "PM660L",
+	[27] = "PM660",
 	[30] = "PM8150",
 	[31] = "PM8150L",
 	[32] = "PM8150B",
-- 
2.31.1

