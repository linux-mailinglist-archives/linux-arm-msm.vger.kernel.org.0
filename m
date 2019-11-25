Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADFF8108F71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 14:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbfKYN74 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 08:59:56 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33530 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbfKYN7y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 08:59:54 -0500
Received: by mail-lf1-f65.google.com with SMTP id d6so11128111lfc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2019 05:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YXy+WuvOjN2rxo0woDxe37oYVujdXQVJsXHamcAJo8s=;
        b=pSp7Ol94mVOT8XSa+yWvPEG7xUJEajtbNYMQyAaZdDVkeRekCsbedXVcnvPoSUieBn
         P/tLgljfOm7z0c6wH2TS8UMcwLqPFrPDehoM8jVdnnKgc5w77nQdjnB12JytOPc3nA6Q
         YFbGrKPyq2H15ektCpj8/4MeEJKfOsbPJ87kXqS5OA/cjTkSA/UFHxDEGF6B1DHwe81m
         GX0fEADDRQHmsdsyhIdT8PmmO9eIXM6DFb0kaYuoPvswX1QUh0EssgW2gXcK+Kqo5ObC
         +gqngfzNrQqNpk0Ff9kgQoOKZ4mkBd3aJbWNUQUDS/tDesp/kYgGJf8/WgST3sutuVof
         BqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YXy+WuvOjN2rxo0woDxe37oYVujdXQVJsXHamcAJo8s=;
        b=kEeK8jvLiJ3+GexfMEzGk8zroh/vWIkEv774NvFg596cpJMfdKDP7dnm0ffQ1KcTsR
         J1nr32v9pquK+r7Jo/GTa1vW4q0YXgg/sYv9QVEMv1y9Lkw8Ws0DXh3r4C0u/gAe08Vg
         bA0BQV5qoVH/fgSuAe4fGGiJfU8HVKxDZS8zp9Ew+HBBgCQiobukoC8bshOcSrs0TYLz
         A6wqaz1wasvzah6Wcg9eCNul7kzIDP31pO56jtN5uiJe4pN4/T7q5QkrZNcrodh66T/j
         qXsfh4NVb0rz4jx5+EF/uL89nPl941dYyIHETR2i5ylBFdUXYxUOe/uiM01Rhaa/MYtp
         Q6qw==
X-Gm-Message-State: APjAAAUdrxaEooyhu8VHmajk9P3f1bHLfBq+tPBLuvX8ujuP9CKo1St3
        vGYS+YzxM5I7P/atPi3NYKkZPQ==
X-Google-Smtp-Source: APXvYqyPjIvoOQFy64CzwfgIBIRTJ2G/GgebuJdA8M/WZlUJOpD7akE7Mk5euVGlZgzV+RlHm5XUBQ==
X-Received: by 2002:a19:7d02:: with SMTP id y2mr19657341lfc.86.1574690392148;
        Mon, 25 Nov 2019 05:59:52 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id g11sm3688529lfb.94.2019.11.25.05.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 05:59:51 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org, Niklas Cassel <niklas.cassel@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] clk: qcom: apcs-msm8916: use clk_parent_data to specify the parent
Date:   Mon, 25 Nov 2019 14:59:09 +0100
Message-Id: <20191125135910.679310-8-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125135910.679310-1-niklas.cassel@linaro.org>
References: <20191125135910.679310-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow accessing the parent clock names required for the driver
operation by using the device tree node, while falling back to
the previous method of using names in the global name space.

This permits extending the driver to other platforms without having to
modify its source code.

Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
Changes since v2:
-Use clk_parent_data when specifying clock parents.

 drivers/clk/qcom/apcs-msm8916.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
index 46061b3d230e..bb91644edc00 100644
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
@@ -51,6 +51,19 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 	struct clk_init_data init = { };
 	int ret = -ENODEV;
 
+	/*
+	 * This driver is defined by the devicetree binding
+	 * Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt,
+	 * however, this driver is registered as a platform device by
+	 * qcom-apcs-ipc-mailbox.c. Because of this, when this driver
+	 * uses dev_get_regmap() and devm_clk_get(), it has to send the parent
+	 * device as argument.
+	 * When registering with the clock framework, we cannot use this trick,
+	 * since the clock framework always looks at dev->of_node when it tries
+	 * to find parent clock names using clk_parent_data.
+	 */
+	dev->of_node = parent->of_node;
+
 	regmap = dev_get_regmap(parent, NULL);
 	if (!regmap) {
 		dev_err(dev, "failed to get regmap: %d\n", ret);
@@ -62,8 +75,8 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	init.name = "a53mux";
-	init.parent_names = gpll0_a53cc;
-	init.num_parents = ARRAY_SIZE(gpll0_a53cc);
+	init.parent_data = pdata;
+	init.num_parents = ARRAY_SIZE(pdata);
 	init.ops = &clk_regmap_mux_div_ops;
 	init.flags = CLK_SET_RATE_PARENT;
 
-- 
2.23.0

