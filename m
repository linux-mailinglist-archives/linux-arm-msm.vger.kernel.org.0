Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3155172E06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 02:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730155AbgB1BOY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 20:14:24 -0500
Received: from mga03.intel.com ([134.134.136.65]:17550 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729984AbgB1BOX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 20:14:23 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Feb 2020 17:14:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; 
   d="scan'208";a="385350063"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Feb 2020 17:14:20 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j7UEN-0001kq-No; Fri, 28 Feb 2020 09:14:19 +0800
Date:   Fri, 28 Feb 2020 01:40:04 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Cc:     kbuild-all@lists.01.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] clk: qcom: apss_pll_offsets[] can be static
Message-ID: <20200227174004.GA29216@f6f0d943a460>
References: <1582797318-26288-3-git-send-email-sivaprak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582797318-26288-3-git-send-email-sivaprak@codeaurora.org>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Fixes: bfce07143090 ("clk: qcom: Add ipq6018 apss clock controller")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 apss-ipq6018.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-ipq6018.c
index 04b8962dbc8e0..663f0949ab109 100644
--- a/drivers/clk/qcom/apss-ipq6018.c
+++ b/drivers/clk/qcom/apss-ipq6018.c
@@ -36,7 +36,7 @@ enum {
 	P_APSS_PLL
 };
 
-const u8 apss_pll_offsets[] = {
+static const u8 apss_pll_offsets[] = {
 	[PLL_OFF_L_VAL] = 0x08,
 	[PLL_OFF_ALPHA_VAL] = 0x10,
 	[PLL_OFF_USER_CTL] = 0x18,
