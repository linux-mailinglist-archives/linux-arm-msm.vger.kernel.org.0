Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E58C299212
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 17:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1774104AbgJZQOV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 12:14:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:58660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1774171AbgJZQOU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 12:14:20 -0400
Received: from localhost.localdomain (unknown [192.30.34.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D5F462085B;
        Mon, 26 Oct 2020 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603728859;
        bh=bUpCBioorowGbrQ/fVCAdi1u2Xy+hKlP2gtMWRIPUWg=;
        h=From:To:Cc:Subject:Date:From;
        b=dJ6Zob691AmODEKOGoDqDZeFgi9koU3ieIucOk5+l7f5r8bqVOhGneRhKdkYuD+Z8
         D4G07KviSW9kFoFObqYKUaXsc0TnPgZ8NM/tnkFaXQtMRY9XHfAR/+07ODe2q1CwnX
         rEeZZCNUG5BFAlIQUxzQDLjrgwv2O+AAhwqqSSko=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mike Turquette <mturquette@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@codeaurora.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] clk: define to_clk_regmap() as inline function
Date:   Mon, 26 Oct 2020 17:13:57 +0100
Message-Id: <20201026161411.3708639-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Nesting container_of() causes warnings with W=2, which is
annoying if it happens in headers and fills the build log
like:

In file included from drivers/clk/qcom/clk-alpha-pll.c:6:
drivers/clk/qcom/clk-alpha-pll.c: In function 'clk_alpha_pll_hwfsm_enable':
include/linux/kernel.h:852:8: warning: declaration of '__mptr' shadows a previous local [-Wshadow]
  852 |  void *__mptr = (void *)(ptr);     \
      |        ^~~~~~
drivers/clk/qcom/clk-alpha-pll.c:155:31: note: in expansion of macro 'container_of'
  155 | #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
      |                               ^~~~~~~~~~~~
drivers/clk/qcom/clk-regmap.h:27:28: note: in expansion of macro 'container_of'
   27 | #define to_clk_regmap(_hw) container_of(_hw, struct clk_regmap, hw)
      |                            ^~~~~~~~~~~~
drivers/clk/qcom/clk-alpha-pll.c:155:44: note: in expansion of macro 'to_clk_regmap'
  155 | #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
      |                                            ^~~~~~~~~~~~~
drivers/clk/qcom/clk-alpha-pll.c:254:30: note: in expansion of macro 'to_clk_alpha_pll'
  254 |  struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
      |                              ^~~~~~~~~~~~~~~~
include/linux/kernel.h:852:8: note: shadowed declaration is here
  852 |  void *__mptr = (void *)(ptr);     \
      |        ^~~~~~

Redefine two copies of the to_clk_regmap() macro as inline functions
to avoid a lot of these.

Fixes: ea11dda9e091 ("clk: meson: add regmap clocks")
Fixes: 085d7a455444 ("clk: qcom: Add a regmap type clock struct")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/meson/clk-regmap.h | 5 ++++-
 drivers/clk/qcom/clk-regmap.h  | 6 +++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
index c4a39604cffd..e365312da54e 100644
--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -26,7 +26,10 @@ struct clk_regmap {
 	void		*data;
 };
 
-#define to_clk_regmap(_hw) container_of(_hw, struct clk_regmap, hw)
+static inline struct clk_regmap *to_clk_regmap(struct clk_hw *hw)
+{
+	return container_of(hw, struct clk_regmap, hw);
+}
 
 /**
  * struct clk_regmap_gate_data - regmap backed gate specific data
diff --git a/drivers/clk/qcom/clk-regmap.h b/drivers/clk/qcom/clk-regmap.h
index 6cfc1bccb255..14ec659a3a77 100644
--- a/drivers/clk/qcom/clk-regmap.h
+++ b/drivers/clk/qcom/clk-regmap.h
@@ -24,7 +24,11 @@ struct clk_regmap {
 	unsigned int enable_mask;
 	bool enable_is_inverted;
 };
-#define to_clk_regmap(_hw) container_of(_hw, struct clk_regmap, hw)
+
+static inline struct clk_regmap *to_clk_regmap(struct clk_hw *hw)
+{
+	return container_of(hw, struct clk_regmap, hw);
+}
 
 int clk_is_enabled_regmap(struct clk_hw *hw);
 int clk_enable_regmap(struct clk_hw *hw);
-- 
2.27.0

