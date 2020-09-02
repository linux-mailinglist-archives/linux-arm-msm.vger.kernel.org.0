Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D531425AF54
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 17:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgIBPgd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 11:36:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:41464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727776AbgIBPEF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 11:04:05 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8370220FC3;
        Wed,  2 Sep 2020 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599059045;
        bh=LN9CdnpYig01xRkC8IS2l0nFAprnIaPmxff2deSsbdM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l4ySjj6OWiLULGbFujoNttxjHcvTS2LNjJ813tKQEwBBwwM/JP6aKrbDFnPg0hkFh
         SpLHJW1E2JjNxHSu4W4Nej/7Xfx8k/dlx8N6T4j0+HeiLFB+ShEsCXvy0UYilPoIER
         hYd9EHZ7Bq02kC+guJsYtkNpKh/BenrYY9Amn0vk=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 02/10] clk: fixed: Add missing kerneldoc
Date:   Wed,  2 Sep 2020 17:03:40 +0200
Message-Id: <20200902150348.14465-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902150348.14465-1-krzk@kernel.org>
References: <20200902150348.14465-1-krzk@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing kerneldoc to fix compile warnings like:

  drivers/clk/clk-fixed-factor.c:211: warning: Function parameter or member 'node' not described in 'of_fixed_factor_clk_setup'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/clk-fixed-factor.c | 1 +
 drivers/clk/clk-fixed-rate.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 8b343e59dc61..910e6e74ae90 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -206,6 +206,7 @@ static struct clk_hw *_of_fixed_factor_clk_setup(struct device_node *node)
 
 /**
  * of_fixed_factor_clk_setup() - Setup function for simple fixed factor clock
+ * @node:	device node for the clock
  */
 void __init of_fixed_factor_clk_setup(struct device_node *node)
 {
diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index 77499a27c8fb..45501637705c 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -168,6 +168,7 @@ static struct clk_hw *_of_fixed_clk_setup(struct device_node *node)
 
 /**
  * of_fixed_clk_setup() - Setup function for simple fixed rate clock
+ * @node:	device node for the clock
  */
 void __init of_fixed_clk_setup(struct device_node *node)
 {
-- 
2.17.1

