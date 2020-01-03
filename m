Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA35012F706
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 12:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbgACLOg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 06:14:36 -0500
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:37778 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727220AbgACLOg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 06:14:36 -0500
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 860973F4C5;
        Fri,  3 Jan 2020 12:14:33 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=flawful.org header.i=@flawful.org header.b=NT27eyjW;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1vrB6au3qAVr; Fri,  3 Jan 2020 12:14:31 +0100 (CET)
Received: from flawful.org (ua-84-217-220-205.bbcust.telenor.se [84.217.220.205])
        (Authenticated sender: mb274189)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 0BA8A3F385;
        Fri,  3 Jan 2020 12:14:30 +0100 (CET)
Received: by flawful.org (Postfix, from userid 1001)
        id ECC201496; Fri,  3 Jan 2020 12:14:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flawful.org; s=mail;
        t=1578050070; bh=6KjCPaq3Lj//YPOv4YVpEjW6cBeoz6aqpIpOgGoP/2c=;
        h=From:To:Cc:Subject:Date:From;
        b=NT27eyjWDdhC4HdfCrDW4Z6n9ddc9m3qp9Iw/rH1K1N3J/X4/Bq23h+heRP7yYZfI
         2XnbEXmVwFA6KaQS0NEva2Fm7qd734RMzBhZYHJfzyx08+G9nB8lc0gooh7qfOjAQN
         KxV9d9oONoBZZYbLG5/V3628TFl0NoI4AC5dYt+Y=
From:   Niklas Cassel <nks@flawful.org>
To:     sboyd@kernel.org, bjorn.andersson@linaro.org
Cc:     mturquette@baylibre.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v4] clk: qcom: apcs-msm8916: use clk_parent_data to specify the parent
Date:   Fri,  3 Jan 2020 12:14:29 +0100
Message-Id: <20200103111429.1347-1-nks@flawful.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Niklas Cassel <niklas.cassel@linaro.org>

Allow accessing the parent clock names required for the driver operation
by using the device tree 'clock-names' property, while falling back to
the previous method of using names in the global name space.

This permits extending the driver to other platforms without having to
modify its source code.

Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
Changes since v3:
-Don't set dev->of_node explicitly, since the clock framework will now
automatically use the parent node pointer when needed.

Requires the following patch to the clock framework to land first:
https://patchwork.kernel.org/patch/11313639/

 drivers/clk/qcom/apcs-msm8916.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index 46061b3d230e..cf69a97d0439 100644
--- a/drivers/clk/qcom/apcs-msm8916.c
+++ b/drivers/clk/qcom/apcs-msm8916.c
@@ -19,9 +19,9 @@
 
 static const u32 gpll0_a53cc_map[] = { 4, 5 };
 
-static const char * const gpll0_a53cc[] = {
-	"gpll0_vote",
-	"a53pll",
+static const struct clk_parent_data pdata[] = {
+	{ .fw_name = "aux", .name = "gpll0_vote", },
+	{ .fw_name = "pll", .name = "a53pll", },
 };
 
 /*
@@ -62,8 +62,8 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	init.name = "a53mux";
-	init.parent_names = gpll0_a53cc;
-	init.num_parents = ARRAY_SIZE(gpll0_a53cc);
+	init.parent_data = pdata;
+	init.num_parents = ARRAY_SIZE(pdata);
 	init.ops = &clk_regmap_mux_div_ops;
 	init.flags = CLK_SET_RATE_PARENT;
 
-- 
2.24.1

