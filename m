Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC29356575D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 15:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234936AbiGDNc6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 09:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234909AbiGDNcZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 09:32:25 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D22412ABA;
        Mon,  4 Jul 2022 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YgCW3baluvqJpS4+BCK3zS2WrqehMu19YfN22Vu+IM4=; b=oG8nH1ojNKyY3ZRlGJSsIfCuqI
        42gzxtUydBsZZb1uV4BTpbtSi/5lDc1huTAd1GM9KquqV30F86SAc/Yx6ihUyLSZf6plwl2DoI2Fg
        bDk7I0W0h7nkMb1I27UQuDu1nITt0d3ZEMAyqt87KLUz1Vu/bTmlTb5ySOyYxcSW23S+UICxhsaAQ
        rbWJ+WI023mPeim17KyFdWBd57PxwEoUPxcjUJBLmni2azfBw5Hw2nl/xFJANU+4Z3u2cYccJx+3I
        SDkbf499OZNoK2sgNR0/YT9yEGZY+HPvdXIjk8YkTrf4c92qXoMmJRuNLWPy1+hltqx4gTRNJvYqi
        4xD5x3Vw==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o8M9g-0074oF-ND; Mon, 04 Jul 2022 15:30:24 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 3/6] clk: qcom: reset: Allow specifying custom reset delay
Date:   Mon,  4 Jul 2022 15:29:57 +0200
Message-Id: <20220704133000.2768380-4-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220704133000.2768380-1-stephan.gerhold@kernkonzept.com>
References: <20220704133000.2768380-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The amount of time required between asserting and deasserting the reset
signal can vary depending on the involved hardware component. Sometimes
1 us might not be enough and a larger delay is necessary to conform to
the specifications.

Usually this is worked around in the consuming drivers, by replacing
reset_control_reset() with a sequence of reset_control_assert(), waiting
for a custom delay, followed by reset_control_deassert().

However, in some cases the driver making use of the reset is generic and
can be used with different reset controllers. In this case the reset
time requirement is better handled directly by the reset controller
driver.

Make this possible by adding an "udelay" field to the qcom_reset_map
that allows setting a different reset delay (in microseconds).

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
See the next patch for a real example with the USB PHY on MSM8909.
---
 drivers/clk/qcom/reset.c | 4 +++-
 drivers/clk/qcom/reset.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/reset.c b/drivers/clk/qcom/reset.c
index 819d194be8f7..2a16adb572d2 100644
--- a/drivers/clk/qcom/reset.c
+++ b/drivers/clk/qcom/reset.c
@@ -13,8 +13,10 @@
 
 static int qcom_reset(struct reset_controller_dev *rcdev, unsigned long id)
 {
+	struct qcom_reset_controller *rst = to_qcom_reset_controller(rcdev);
+
 	rcdev->ops->assert(rcdev, id);
-	udelay(1);
+	udelay(rst->reset_map[id].udelay ?: 1); /* use 1 us as default */
 	rcdev->ops->deassert(rcdev, id);
 	return 0;
 }
diff --git a/drivers/clk/qcom/reset.h b/drivers/clk/qcom/reset.h
index 2a08b5e282c7..b8c113582072 100644
--- a/drivers/clk/qcom/reset.h
+++ b/drivers/clk/qcom/reset.h
@@ -11,6 +11,7 @@
 struct qcom_reset_map {
 	unsigned int reg;
 	u8 bit;
+	u8 udelay;
 };
 
 struct regmap;
-- 
2.30.2

