Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0ECC37257E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 07:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhEDFaA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 01:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbhEDFaA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 01:30:00 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E0EC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 22:29:06 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id b15so6305384pfl.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 22:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RjDDEQHznq8kml6OFuSumxrNRPKtAVnBXfVZoTIOBJk=;
        b=edgEPWYjMfQl/NgTn+F1VvmFuUMWGV24gxVRojOLOPXRI+FlPOHqeNJk/nxxslIspB
         TJT0B4FJFt+m1zV05deFvgTn2PptV4eK+ipoUViTipPkBLXOVw7BU0iYqlOQ5vjQ0n/G
         O8L6u8vTTQIHh5GORy2FZtAGt6Y6JQT49QaOgCKiunlUSu13Y+id5bQJVs7YmGohvrBv
         uOdFcmOIlydzqv3O7kBgZ28ZqGdMPAsmuvURkRZRXTqN6mFbEwxp3aYiJHjS2wt/nnN7
         brmHt2hnwcS4XkeFTGE8NJZ1GcpfY05IXCAIG2+3uKxHDbAqxT+I8TcLtpkQVfOp2+kn
         3cwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RjDDEQHznq8kml6OFuSumxrNRPKtAVnBXfVZoTIOBJk=;
        b=R/vNtiC1QaKgTObGoqq00XIc+vJ0UhjYJuQUOLpHUSpzpCRj8RGfSPmITcGMBYGNAO
         l6SYKnIgYx0sWI1qwBrk7om8hfGvfjcIrRr1x5jtej1E+br9MrnBw10KKIv1BtJYLEcl
         nlJYkBdCL8OqW9+IX5k3X279nbzS/5l+/sQ5V0fgeM9gc/9zLMjmqSleZ9dYlk19PDN9
         aUQtTXsq5EKtO9KZGyvvGdpKGWEBfL/PQ3F/a+566nsHSFl4pON00SJrWqLdSdVd128C
         Ey+DzdqjuwzgsJflx4eQ5fMF3LNBIKF1PY2f3h1nf17H51aBNKdpHo4h0U+Rsnt4YPCF
         Q9fg==
X-Gm-Message-State: AOAM531W74mjqLWDdVHjouxz2fTybbw/wBY0RmhJQnh+ed2UhcgZjeSg
        pRgZaDhjHRu0tgLgYNL76+6CqA==
X-Google-Smtp-Source: ABdhPJyQHi+h5z1UsGXu0JcsoQBIaP/LrwblVbl8irJnlRnS5Cqr67mEdBNahxnnd8zVmQvGXU+iLQ==
X-Received: by 2002:a17:90b:4b45:: with SMTP id mi5mr3000570pjb.197.1620106145767;
        Mon, 03 May 2021 22:29:05 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 145sm5933229pfv.196.2021.05.03.22.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 22:29:05 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 4/5] clk: qcom: a53-pll: Pass freq_tbl via match data
Date:   Tue,  4 May 2021 13:28:43 +0800
Message-Id: <20210504052844.21096-5-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504052844.21096-1-shawn.guo@linaro.org>
References: <20210504052844.21096-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The frequency table is SoC specific.  Instead of hard coding, pass it
via match data, so that the driver can work for more than just MSM8916.
This is a preparation change for adding MSM8939 A53PLL support.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/a53-pll.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index 964f5ab7d02f..bfa048dc01ec 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -15,7 +15,7 @@
 #include "clk-pll.h"
 #include "clk-regmap.h"
 
-static const struct pll_freq_tbl a53pll_freq[] = {
+static const struct pll_freq_tbl msm8916_freq[] = {
 	{  998400000, 52, 0x0, 0x1, 0 },
 	{ 1094400000, 57, 0x0, 0x1, 0 },
 	{ 1152000000, 62, 0x0, 0x1, 0 },
@@ -43,8 +43,13 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	void __iomem *base;
 	struct clk_init_data init = { };
 	const char *clk_name = NULL;
+	const struct pll_freq_tbl *freq_tbl;
 	int ret;
 
+	freq_tbl = device_get_match_data(&pdev->dev);
+	if (!freq_tbl)
+		return -ENODEV;
+
 	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
 	if (!pll)
 		return -ENOMEM;
@@ -65,7 +70,7 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	pll->mode_reg = 0x00;
 	pll->status_reg = 0x1c;
 	pll->status_bit = 16;
-	pll->freq_tbl = a53pll_freq;
+	pll->freq_tbl = freq_tbl;
 
 	of_property_read_string(pdev->dev.of_node, "clock-output-names",
 				&clk_name);
@@ -92,7 +97,7 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_a53pll_match_table[] = {
-	{ .compatible = "qcom,msm8916-a53pll" },
+	{ .compatible = "qcom,msm8916-a53pll", .data = msm8916_freq },
 	{ }
 };
 
-- 
2.17.1

