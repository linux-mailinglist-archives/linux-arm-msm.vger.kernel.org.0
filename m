Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 697FA421A94
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 01:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236945AbhJDXYZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 19:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235451AbhJDXYX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 19:24:23 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA5FC061749
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 16:22:31 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g41so78151480lfv.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 16:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B1tfgMXD/HCZM2/dbxQ/czHnewIDG6QY34tUjSKvwfk=;
        b=bZNltq/oZbd2YVOmD/JOyx7+mRWiGRGSHOcZqLxUZ/OJ/a4X0CocMwnce8EI+bA0mr
         cYHYy3AcbjPmfqwtUgaug7V/ju9Jlk/9B8HiCZ0OGbeszUFlcZhCIoXa3mqrcVScykYK
         YaAx/nFHhpH8BtNYwHnxEWO+caFmC17qYD3j6jYWpUHPg3/s70fxTFRt6kjbZkhE7sMP
         iIcWH8IvN64mKUHMHBvLr0lKrpbKfTRuvXcH01R4SxlwYf8QTb3ZvO+pOdIKnJqC8k3U
         0n2j4H5iI8LeXUw5XmMco55GxsF8PIYfV0KVCAq7lHwU7HP9yzS9eAV0MQeZlO+TLGtC
         lfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B1tfgMXD/HCZM2/dbxQ/czHnewIDG6QY34tUjSKvwfk=;
        b=tUSjzKmOjZmwZ659+2d+cuYO0wlPJuwWp6VY9cTe2Lti6ApLx9BRdB3/gajQkZBCF6
         dbfYS8bE8CmYL5eGmXeyu8orJZFfiS4/G+Nl2NCquasiItenhcpWNkA7VV/gOHtjJHeZ
         xLo0Ljaq59G6mIlQ9S9VarDlu0ClKkUjj4ntkKkmr3SoCpSfUUrin+WC2Qkcf3keMPf5
         rqsYjeN60HiAIBLw/gB3DXIzGXEHoF4zWJ8eYMomjw5UUhMNqo4DacOLeGhdrRzsCRju
         0tBwpSQq+RyPc8fLWmhLbFSIg+DkdJs7nPyOdPhrE8W25yoyE8YUdBwztQo5LJMfX9Yk
         XR3A==
X-Gm-Message-State: AOAM53237JdjuezYHAdpE0KNZ/jZm4CWnLVDkqfHJwpzCqLE9OqB5Xy1
        CSTc6ADl/Cvk+SWhNTMYuiCX6w==
X-Google-Smtp-Source: ABdhPJxxt4mXCwbIDPVV3zHHXX7p0UanlrXhf5LfoW0gVYJ6xPyx+YnOKRNwY+xifSobFiZQ+JuY+Q==
X-Received: by 2002:ac2:4896:: with SMTP id x22mr17609034lfc.257.1633389749636;
        Mon, 04 Oct 2021 16:22:29 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h23sm1786219lja.131.2021.10.04.16.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 16:22:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/6] pinctrl: qcom: ssbi-mpp: hardcode IRQ counts
Date:   Tue,  5 Oct 2021 02:22:22 +0300
Message-Id: <20211004232225.2260665-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004232225.2260665-1-dmitry.baryshkov@linaro.org>
References: <20211004232225.2260665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The probing of this driver calls platform_irq_count, which will
setup all of the IRQs that are configured in device tree. In
preparation for converting this driver to be a hierarchical IRQ
chip, hardcode the IRQ count based on the hardware type so that all
the IRQs are not configured immediately and are configured on an
as-needed basis later in the boot process.

This change will also allow for the removal of the interrupts property
later in this patch series once the hierarchical IRQ chip support is in.

This patch also removes the generic qcom,ssbi-mpp OF match since we
don't know the number of pins. All of the existing upstream bindings
already include the more-specific binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
index 92e7f2602847..a90cada1d657 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -733,13 +733,12 @@ static int pm8xxx_pin_populate(struct pm8xxx_mpp *pctrl,
 }
 
 static const struct of_device_id pm8xxx_mpp_of_match[] = {
-	{ .compatible = "qcom,pm8018-mpp" },
-	{ .compatible = "qcom,pm8038-mpp" },
-	{ .compatible = "qcom,pm8058-mpp" },
-	{ .compatible = "qcom,pm8917-mpp" },
-	{ .compatible = "qcom,pm8821-mpp" },
-	{ .compatible = "qcom,pm8921-mpp" },
-	{ .compatible = "qcom,ssbi-mpp" },
+	{ .compatible = "qcom,pm8018-mpp", .data = (void *) 6 },
+	{ .compatible = "qcom,pm8038-mpp", .data = (void *) 6 },
+	{ .compatible = "qcom,pm8058-mpp", .data = (void *) 12 },
+	{ .compatible = "qcom,pm8821-mpp", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8917-mpp", .data = (void *) 10 },
+	{ .compatible = "qcom,pm8921-mpp", .data = (void *) 12 },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, pm8xxx_mpp_of_match);
@@ -750,19 +749,14 @@ static int pm8xxx_mpp_probe(struct platform_device *pdev)
 	struct pinctrl_pin_desc *pins;
 	struct pm8xxx_mpp *pctrl;
 	int ret;
-	int i, npins;
+	int i;
 
 	pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
 	if (!pctrl)
 		return -ENOMEM;
 
 	pctrl->dev = &pdev->dev;
-	npins = platform_irq_count(pdev);
-	if (!npins)
-		return -EINVAL;
-	if (npins < 0)
-		return npins;
-	pctrl->npins = npins;
+	pctrl->npins = (uintptr_t) device_get_match_data(&pdev->dev);
 
 	pctrl->regmap = dev_get_regmap(pdev->dev.parent, NULL);
 	if (!pctrl->regmap) {
-- 
2.30.2

