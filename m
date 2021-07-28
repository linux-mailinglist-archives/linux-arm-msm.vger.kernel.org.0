Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6663D9064
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 16:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235349AbhG1OZQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 10:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236646AbhG1OZL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 10:25:11 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F8D5C0617A1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 07:24:55 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id x7so3284296ljn.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 07:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ORimO8D42kAHhnXfoY653OGm+8ilcZTSD9Rm8q3p1bo=;
        b=QJdRABVp43c7JWRg8sbdKu6k+iBY7vTqpmXGlj/FeZzkEkG0i2omtElZod1AQGXI+J
         xVcYDap+fs7EweFwsu5TGdUi+b4kz0H14GE78mjrH+cwSAyJhxf26ZxMCYO0v/D+/kPt
         p73Cs8lzaG9gsFIorWc4P2FunLeHMpnaVREsNm6j+2URPW65Id04ee0oiY8qxio2CzmZ
         taYFAte0h2oRGq3fYRMftGNkXj4bxAZYQFGpZXn5fQeL7Bu2ezzJemFEF5o+0dJrZGsz
         E+WOBQiLRdGamNCkP2YOv9JdXV9kA7AIYSc13BAOiwVt9ddt+haN4UPVrQ0WIOZ10NSb
         aB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ORimO8D42kAHhnXfoY653OGm+8ilcZTSD9Rm8q3p1bo=;
        b=JIFgtnKWXCB/+R+6fhrDyBdyqKhaxmQKMyNMRo7CIoGXqylcpwJvvM4v4V9m9vycG5
         RLiuH7h8mWnjKWeEbiUPbUPQSi+bgEvuXCTCX4PusL4csT2Sks2rGJAQ9YdHSCzc70Cc
         sZyhTY3yhXKgG9seFfXqR+Ab7/EMD1s9WqgTVSqwz3BKYSto8bmTQEZ90bBN8TAJ65zk
         ygmsEnqg2wxq9FKgFg0e9W7yTvAGPBormRLRQXjtqMK9E6GzC3uNolW/0MiZmSXmrmGR
         g9DaQcV3MBcw3mDNOOu+HuD5/r0Cxf1+ma5U7FpujME1h4J2Zn/NWsW8ZdoinVeeNg6X
         p6Yw==
X-Gm-Message-State: AOAM530TmbdzvsGjbj0rIMarzWSqlhycnmSiYQPmhvb+lvncVlIp5ARG
        gCeubpUefbGO2DHkn/BIjA1S0w==
X-Google-Smtp-Source: ABdhPJyeHeYmfbX0mRutc4wBGIzl3E+3k3LZVsC7Z0deZwgnV/53DecPXbUtBDHZbzjGmXyhXbm+uw==
X-Received: by 2002:a2e:9605:: with SMTP id v5mr97711ljh.178.1627482293728;
        Wed, 28 Jul 2021 07:24:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h4sm15610lft.184.2021.07.28.07.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 07:24:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/5] clk: qcom: use common code for qcom_cc_probe_by_index
Date:   Wed, 28 Jul 2021 17:24:44 +0300
Message-Id: <20210728142445.774158-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210728142445.774158-1-dmitry.baryshkov@linaro.org>
References: <20210728142445.774158-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rewrite qcom_cc_map and qcom_cc_probe_by_index to use (new)
qcom_cc_map_by_index, removing code duplication and opening a way to
have more common code in qcom_cc_map*.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/common.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 60d2a78d1395..ed7c516a597a 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -69,20 +69,26 @@ int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map, u8 src)
 }
 EXPORT_SYMBOL_GPL(qcom_find_src_index);
 
-struct regmap *
-qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
+static struct regmap *
+qcom_cc_map_by_index(struct platform_device *pdev, const struct qcom_cc_desc *desc, int index)
 {
 	void __iomem *base;
 	struct resource *res;
 	struct device *dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
 	base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(base))
 		return ERR_CAST(base);
 
 	return devm_regmap_init_mmio(dev, base, desc->config);
 }
+
+struct regmap *
+qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
+{
+	return qcom_cc_map_by_index(pdev, desc, 0);
+}
 EXPORT_SYMBOL_GPL(qcom_cc_map);
 
 void
@@ -313,15 +319,8 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 			   const struct qcom_cc_desc *desc)
 {
 	struct regmap *regmap;
-	struct resource *res;
-	void __iomem *base;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return -ENOMEM;
 
-	regmap = devm_regmap_init_mmio(&pdev->dev, base, desc->config);
+	regmap = qcom_cc_map_by_index(pdev, desc, index);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-- 
2.30.2

