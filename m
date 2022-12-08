Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E546471F5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 15:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiLHOj5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 09:39:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiLHOju (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 09:39:50 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5FB30F67
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Dec 2022 06:39:48 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id p36so2317532lfa.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Dec 2022 06:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iuZU6ZomwdEh8W1Uuo9g2ASEzurguKGrErnitMPuxT0=;
        b=jTjD+wZ2A9vQjLvPH/ypfuEhl366Qq5tb/UlCf0nxmEJta29gwULXM+aLZSYrLhlv/
         WcMSKOcVlFV3Pa4ULMNpPBWb4wakbR8XxPD0m5LVdY8r+Vgw2aS04ftQsAk1Ks4Vbj7g
         kKqvUs78MhRRZRaTALkEFGOXviLN7hasLgUvC7X7FzZo2OIIHbrnishm8fViDGbvGziJ
         NNnORdQGiUvFtHLF2PNQo19aWbmbakNmZOKdXZXO3exTGfaq/yB7fWF3kjI2vPi8iDnS
         bfwjyclRZzAP0aRsCzu7i27jSRZ+C3YaF9tfmzhp3+xmwCjV1i35a7XPIEW+34cSLc8Y
         FxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuZU6ZomwdEh8W1Uuo9g2ASEzurguKGrErnitMPuxT0=;
        b=K/Pj/gms4FS5KmNfD57Zg79dyNa+bwCJivO6y0Wvk5B5aqoKmqER8w4ZzGFso0QfTN
         rNMSN+zfWh5o1NndBJrDTYxiT8B6NcLdSraYAIdb9YH0oBAT+3hJjFOzghYXDm00fwy9
         ZdIgx8r31AC9D2Blkx4hYF2CQNCAO3dWBHBjmg7vRiB4Rw4QOTiEtt5c/X1NXz8r8tir
         8O5myOYLz4YqdBS3lTg0ATEmQwnf0C1B5LOd5FHSKVT0hmv6h8AUXbCG6MikiMjh8z2G
         Y7IjXWzzKf2Z5kJ1XncPkyMGgGat++gL4mOMJAHTnXxfYcnLVzfQC+q6KZ8RG9IClUOq
         gw4w==
X-Gm-Message-State: ANoB5pn1HEQB2jLSR9vx+AatcT4wljTJk0M/CJrNmzDzF/dz9ExOVjtC
        ReyIhjpWVGJRa4oYg1LC388mTw==
X-Google-Smtp-Source: AA0mqf5knspU5+D9Xmqc9+5ROCb+ILBKnaQ+35+buAO8KwKj8K96ojC0qTIp2OpOXM7XBIG3QnLAFA==
X-Received: by 2002:a05:6512:3ba6:b0:4a2:2bd7:d4fd with SMTP id g38-20020a0565123ba600b004a22bd7d4fdmr29457686lfv.613.1670510386749;
        Thu, 08 Dec 2022 06:39:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q9-20020ac25fc9000000b004b40f5e7336sm3354213lfg.199.2022.12.08.06.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 06:39:46 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: clk-spmi-pmic-div: convert to use parent_data
Date:   Thu,  8 Dec 2022 17:39:45 +0300
Message-Id: <20221208143945.50279-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The clk-spmi-pmic-div driver gets the parent name from the first (and
the only) clock parent. So, use parent data, index 0 to setup the clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-spmi-pmic-div.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
index f2cf55cee2fd..aa015c51ab4f 100644
--- a/drivers/clk/qcom/clk-spmi-pmic-div.c
+++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
@@ -175,6 +175,10 @@ static const struct clk_ops clk_spmi_pmic_div_ops = {
 	.round_rate = clk_spmi_pmic_div_round_rate,
 };
 
+static const struct clk_parent_data clk_spmi_pmic_parent_data = {
+	.index = 0,
+};
+
 struct spmi_pmic_div_clk_cc {
 	int		nclks;
 	struct clkdiv	clks[];
@@ -204,7 +208,6 @@ static int spmi_pmic_clkdiv_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	struct device *dev = &pdev->dev;
 	struct device_node *of_node = dev->of_node;
-	const char *parent_name;
 	int nclks, i, ret, cxo_hz;
 	char name[20];
 	u32 start;
@@ -246,14 +249,8 @@ static int spmi_pmic_clkdiv_probe(struct platform_device *pdev)
 	cxo_hz = clk_get_rate(cxo);
 	clk_put(cxo);
 
-	parent_name = of_clk_get_parent_name(of_node, 0);
-	if (!parent_name) {
-		dev_err(dev, "missing parent clock\n");
-		return -ENODEV;
-	}
-
 	init.name = name;
-	init.parent_names = &parent_name;
+	init.parent_data = &clk_spmi_pmic_parent_data;
 	init.num_parents = 1;
 	init.ops = &clk_spmi_pmic_div_ops;
 
-- 
2.30.2

