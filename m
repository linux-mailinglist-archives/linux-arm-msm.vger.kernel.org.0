Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46E2F4C1B37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 19:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244045AbiBWS4t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 13:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236096AbiBWS4s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 13:56:48 -0500
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id B54663F313
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 10:56:19 -0800 (PST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1645642579; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=bJ3PTMa5ITK1zBs3UQ1rqQGE3Uh9+XtlEAte3v0fLh0=; b=uUtSijnMhHNqWdMz7QhLOY1fYMWBVO3tlccPaUVu19LoWEFJ0djC8AWmk7LB4fmrEJLvUnUu
 YrRl0DXImEGBh7AKFjlIDTLeeMhzfvXSyUlwqLbSCOe09/s07I/Saz4gHiTv8Yq6qbOGiP3a
 UPvZVJf+9+BDIaSEjFVExOmCmEI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 62168352f59adaaa8ea27741 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Feb 2022 18:56:18
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 640D0C43617; Wed, 23 Feb 2022 18:56:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
Received: from hu-tdas-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 92A13C4338F;
        Wed, 23 Feb 2022 18:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 92A13C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [v2 1/2] clk: qcom: gdsc: Add support to update GDSC transition delay
Date:   Thu, 24 Feb 2022 00:26:05 +0530
Message-Id: <20220223185606.3941-1-tdas@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GDSCs have multiple transition delays which are used for the GDSC FSM
states. Older targets/designs required these values to be updated from
gdsc code to certain default values for the FSM state to work as
expected. But on the newer targets/designs the values updated from the
GDSC driver can hamper the FSM state to not work as expected.

On SC7180 we observe black screens because the gdsc is being
enabled/disabled very rapidly and the GDSC FSM state does not work as
expected. This is due to the fact that the GDSC reset value is being
updated from SW.

Thus add support to update the transition delay from the clock
controller gdscs as required.

Fixes: 45dd0e55317cc ("clk: qcom: Add support for GDSCs)
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
[v2]
   * Add 3 transition delays and update the default values in case of
     non-zero value.
   * Update the delays from mdss gdsc in the corresponding display clock
     controllers.

 drivers/clk/qcom/gdsc.c | 26 +++++++++++++++++++++-----
 drivers/clk/qcom/gdsc.h |  8 +++++++-
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 7e1dd8ccfa38..44520efc6c72 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2015, 2017-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2015, 2017-2018, 2022, The Linux Foundation. All rights reserved.
  */

 #include <linux/bitops.h>
@@ -35,9 +35,14 @@
 #define CFG_GDSCR_OFFSET		0x4

 /* Wait 2^n CXO cycles between all states. Here, n=2 (4 cycles). */
-#define EN_REST_WAIT_VAL	(0x2 << 20)
-#define EN_FEW_WAIT_VAL		(0x8 << 16)
-#define CLK_DIS_WAIT_VAL	(0x2 << 12)
+#define EN_REST_WAIT_VAL	0x2
+#define EN_FEW_WAIT_VAL		0x8
+#define CLK_DIS_WAIT_VAL	0x2
+
+/* Transition delay shifts */
+#define EN_REST_WAIT_SHIFT	20
+#define EN_FEW_WAIT_SHIFT	16
+#define CLK_DIS_WAIT_SHIFT	12

 #define RETAIN_MEM		BIT(14)
 #define RETAIN_PERIPH		BIT(13)
@@ -380,7 +385,18 @@ static int gdsc_init(struct gdsc *sc)
 	 */
 	mask = HW_CONTROL_MASK | SW_OVERRIDE_MASK |
 	       EN_REST_WAIT_MASK | EN_FEW_WAIT_MASK | CLK_DIS_WAIT_MASK;
-	val = EN_REST_WAIT_VAL | EN_FEW_WAIT_VAL | CLK_DIS_WAIT_VAL;
+
+	if (!sc->en_rest_wait_val)
+		sc->en_rest_wait_val = EN_REST_WAIT_VAL;
+	if (!sc->en_few_wait_val)
+		sc->en_few_wait_val = EN_FEW_WAIT_VAL;
+	if (!sc->clk_dis_wait_val)
+		sc->clk_dis_wait_val = CLK_DIS_WAIT_VAL;
+
+	val = sc->en_rest_wait_val << EN_REST_WAIT_SHIFT |
+		sc->en_few_wait_val << EN_FEW_WAIT_SHIFT |
+		sc->clk_dis_wait_val << CLK_DIS_WAIT_SHIFT;
+
 	ret = regmap_update_bits(sc->regmap, sc->gdscr, mask, val);
 	if (ret)
 		return ret;
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index d7cc4c21a9d4..ad313d7210bd 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2015, 2017-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2015, 2017-2018, 2022, The Linux Foundation. All rights reserved.
  */

 #ifndef __QCOM_GDSC_H__
@@ -22,6 +22,9 @@ struct reset_controller_dev;
  * @cxcs: offsets of branch registers to toggle mem/periph bits in
  * @cxc_count: number of @cxcs
  * @pwrsts: Possible powerdomain power states
+ * @en_rest_wait_val: transition delay value for receiving enr ack signal
+ * @en_few_wait_val: transition delay value for receiving enf ack signal
+ * @clk_dis_wait_val: transition delay value for halting clock
  * @resets: ids of resets associated with this gdsc
  * @reset_count: number of @resets
  * @rcdev: reset controller
@@ -36,6 +39,9 @@ struct gdsc {
 	unsigned int			clamp_io_ctrl;
 	unsigned int			*cxcs;
 	unsigned int			cxc_count;
+	unsigned int			en_rest_wait_val;
+	unsigned int			en_few_wait_val;
+	unsigned int			clk_dis_wait_val;
 	const u8			pwrsts;
 /* Powerdomain allowable state bitfields */
 #define PWRSTS_OFF		BIT(0)
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

