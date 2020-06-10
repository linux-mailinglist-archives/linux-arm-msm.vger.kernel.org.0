Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A86B21F5A05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 19:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728246AbgFJRSg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 13:18:36 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10036 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728023AbgFJRSg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 13:18:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591809515; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Z7VcFhGfQeC2uFAHORg1EVlpA7tEAa/KJ7mZGO2/rp0=; b=PsBlMBN6T0VtU/OrPoajz6AmlLsvUBvzBc9R1Hi+Rw+MVGXgiLiP0JlwahMruu3tfwCjFsES
 8a4PoKKM9PYZ2T0bgkVlologynQjNBNK1h4n129f2mwsto88yRPAL65cH0d0vf6VSuT4AsZ5
 mCiLVey/aFAQeQDJiA3JbbcW/l8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5ee115e4f3deea03f3af5d13 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Jun 2020 17:18:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C969AC433C6; Wed, 10 Jun 2020 17:18:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 47B27C433A0;
        Wed, 10 Jun 2020 17:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 47B27C433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 1/4] clk: qcom: gdsc: Add support to enable retention of GSDCR
Date:   Wed, 10 Jun 2020 22:48:04 +0530
Message-Id: <1591809487-5588-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591809487-5588-1-git-send-email-tdas@codeaurora.org>
References: <1591809487-5588-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the RETAIN_FF_ENABLE feature which enables the
usage of retention registers. These registers maintain their
state after disabling and re-enabling a GDSC.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/gdsc.c | 12 ++++++++++++
 drivers/clk/qcom/gdsc.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 04944f1..2502430 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -29,6 +29,7 @@
 /* CFG_GDSCR */
 #define GDSC_POWER_UP_COMPLETE		BIT(16)
 #define GDSC_POWER_DOWN_COMPLETE	BIT(15)
+#define GDSC_RETAIN_FF_ENABLE		BIT(11)
 #define CFG_GDSCR_OFFSET		0x4
 
 /* Wait 2^n CXO cycles between all states. Here, n=2 (4 cycles). */
@@ -216,6 +217,14 @@ static inline void gdsc_assert_reset_aon(struct gdsc *sc)
 	regmap_update_bits(sc->regmap, sc->clamp_io_ctrl,
 			   GMEM_RESET_MASK, 0);
 }
+
+static void gdsc_retain_ff_on(struct gdsc *sc)
+{
+	u32 mask = GDSC_RETAIN_FF_ENABLE;
+
+	regmap_update_bits(sc->regmap, sc->gdscr, mask, mask);
+}
+
 static int gdsc_enable(struct generic_pm_domain *domain)
 {
 	struct gdsc *sc = domain_to_gdsc(domain);
@@ -268,6 +277,9 @@ static int gdsc_enable(struct generic_pm_domain *domain)
 		udelay(1);
 	}
 
+	if (sc->flags & RETAIN_FF_ENABLE)
+		gdsc_retain_ff_on(sc);
+
 	return 0;
 }
 
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index c36fc26..a5076fe 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -50,6 +50,7 @@ struct gdsc {
 #define AON_RESET	BIT(4)
 #define POLL_CFG_GDSCR	BIT(5)
 #define ALWAYS_ON	BIT(6)
+#define RETAIN_FF_ENABLE	BIT(7)
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

