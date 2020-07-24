Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF76022CA51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 18:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgGXQIk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 12:08:40 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:62326 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727959AbgGXQIk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 12:08:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595606919; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Z7VcFhGfQeC2uFAHORg1EVlpA7tEAa/KJ7mZGO2/rp0=; b=PUcLZIwfOJYIJTBX1l/vcoSEIVC14VlGyBp9ANnEu+4XqiyZ9ImqfX9drx10IKzrnS3ZUyaS
 mq1MmafOw1netwULAUpkKVNDkHoxVa/ZGaYPBrni/RZSBkQTTRhY6Rr5ToqR93s+QDIFoskZ
 PhHbW1C5ELXORdvP8tPKc48aXj0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f1b078449176bd38251886a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Jul 2020 16:08:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 77416C433CB; Fri, 24 Jul 2020 16:08:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 17BC3C433A1;
        Fri, 24 Jul 2020 16:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 17BC3C433A1
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
Subject: [PATCH v5 1/4] clk: qcom: gdsc: Add support to enable retention of GSDCR
Date:   Fri, 24 Jul 2020 21:37:55 +0530
Message-Id: <1595606878-2664-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595606878-2664-1-git-send-email-tdas@codeaurora.org>
References: <1595606878-2664-1-git-send-email-tdas@codeaurora.org>
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

