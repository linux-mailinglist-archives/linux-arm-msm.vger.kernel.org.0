Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6BC4AF88A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238345AbiBIRac (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238347AbiBIRaa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:30:30 -0500
X-Greylist: delayed 302 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Feb 2022 09:30:33 PST
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id B140BC05CB87
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:30:33 -0800 (PST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1644427833; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=GlWTbW6rvo3Hk0ZxypwcsZKNboIvUjLB/c6zRebM7KY=; b=Ek8kImPVbckQlS6yHw38S5Kc7nspoNBQGlalx6nThZJ3BxqSiMCMD5Df+YvQGYPi90CWco6X
 8lc95GldLFS51Us/QHqyVEXrSpCUpWpEN1Dee7kQ0na87dRPObUBvOdZZzfyXUMf9QWwJsCe
 tdpuCP8BslbH3KTWf5Jv4cvBgLE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6203f90919d16b66a9b9ac5d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Feb 2022 17:25:29
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB785C4360C; Wed,  9 Feb 2022 17:25:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
Received: from hu-tdas-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 74804C4360D;
        Wed,  9 Feb 2022 17:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 74804C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [v1 1/2] clk: qcom: gdsc: Use the default transition delay for GDSCs
Date:   Wed,  9 Feb 2022 22:55:12 +0530
Message-Id: <20220209172513.17873-1-tdas@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Do not update the transition delay and use the default reset values.

Fixes: 45dd0e55317cc ("clk: qcom: Add support for GDSCs)
Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gdsc.c | 6 +++++-
 drivers/clk/qcom/gdsc.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 7e1dd8ccfa38..e7b213450640 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -380,7 +380,11 @@ static int gdsc_init(struct gdsc *sc)
 	 */
 	mask = HW_CONTROL_MASK | SW_OVERRIDE_MASK |
 	       EN_REST_WAIT_MASK | EN_FEW_WAIT_MASK | CLK_DIS_WAIT_MASK;
-	val = EN_REST_WAIT_VAL | EN_FEW_WAIT_VAL | CLK_DIS_WAIT_VAL;
+
+	regmap_read(sc->regmap, sc->gdscr, &val);
+
+	if (!(sc->flags & DEFAULT_TRANSITION_DELAY))
+		val |= EN_REST_WAIT_VAL | EN_FEW_WAIT_VAL | CLK_DIS_WAIT_VAL;
 	ret = regmap_update_bits(sc->regmap, sc->gdscr, mask, val);
 	if (ret)
 		return ret;
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index d7cc4c21a9d4..1bd3ecdd0b0a 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -53,6 +53,7 @@ struct gdsc {
 #define ALWAYS_ON	BIT(6)
 #define RETAIN_FF_ENABLE	BIT(7)
 #define NO_RET_PERIPH	BIT(8)
+#define DEFAULT_TRANSITION_DELAY	BIT(9)
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

