Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A47637318D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 22:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhEDUl2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 16:41:28 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:44178 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229542AbhEDUl2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 16:41:28 -0400
Received: from localhost.localdomain (84-115-212-105.cable.dynamic.surfer.at [84.115.212.105])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id AB7DBC5BAA;
        Tue,  4 May 2021 20:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1620160830; bh=PR/taFycHZ/lZaX7btvVptzGdADHVliwvjATthdK7Fs=;
        h=From:To:Cc:Subject:Date;
        b=GO+8he/jd7tDdefP5raokotABSxFYWaBPmSdswHXqcnlkWp+2MHHYAMVii/PZ5p5m
         Dq/Iq/yHNtMeDHrhW7HgjPnie7V+wwFJOu0eUkp2qptavfvmBv1EnUmRz4rqFqPGlm
         4ER2E4M+gz0vT4aZh/rbhfvIaq14EXrJlwAiRdFs=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH] soc: qcom: socinfo: import PMIC IDs from pmic-spmi
Date:   Tue,  4 May 2021 22:37:53 +0200
Message-Id: <20210504203752.95555-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver in drivers/mfd/qcom-spmi-pmic.c has a more complete and more
up-to-date list of PMICs with the respective IDs. Use those names for
socinfo.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
I'm sending this as RFC because I'm not sure what names are correct for
the IDs that I've replaced (13, 16, 17, 20, 21, 24).
For PM8941, PM8841, PM8226 and PMA8084 I'm quite sure that the IDs are
correct, but I don't have devices with the other PMICs. Please advise
what to do.

 drivers/soc/qcom/socinfo.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 63f14a2a4ef2..a802f330dbd4 100644
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
+	[13] = "PM8909",
 	[14] = "PM8028",
 	[15] = "PM8901",
-	[16] = "PM8027",
-	[17] = "ISL9519",
+	[16] = "PM8950",
+	[17] = "PMI8950",
 	[18] = "PM8921",
 	[19] = "PM8018",
-	[20] = "PM8015",
-	[21] = "PM8014",
+	[20] = "PM8998",
+	[21] = "PMI8998",
 	[22] = "PM8821",
 	[23] = "PM8038",
-	[24] = "PM8922",
+	[24] = "PM8005",
 	[25] = "PM8917",
+	[26] = "PM660L",
+	[27] = "PM660",
 	[30] = "PM8150",
 	[31] = "PM8150L",
 	[32] = "PM8150B",
-- 
2.31.1

