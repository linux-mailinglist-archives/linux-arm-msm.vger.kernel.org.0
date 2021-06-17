Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919C33AAB19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 07:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhFQFhB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 01:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhFQFhB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 01:37:01 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019E2C061768
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:34:54 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id p13so4127111pfw.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X2Jgtg46fvD0VIIhEX+lIqgmEij/wG71wKNSQ3al/aA=;
        b=Ip7TwC6rRWlDR9SuxOZpNs/qeBiPgadNvjKxhRfcESXkNzEHAA7A2KOVX2uSYX+Kd/
         HTAbnTwxs4GZNn6L3S9KJPUVD5CpemInFh//I2wrlYL/jlf4YK429yn7DHYgMUnYVLr0
         hPgixvfbSUYX7NEN6Ar+RDJ8b0RZNbUk00ler14z63/IAPvH4HHBSMN8MxGmKNvoaFcl
         xcv8jPvDXJzGyRfduRJwgM5EY3ykQNvIUv898sJEm6vdPnVM7OVMKpkUPl7BjGaxQXwW
         cZ51bBSl52DR3ahEFB10Qeh8rDn4JHMo7y3EhFHP49eUop889WNVEcCtg7A33Sh16iLn
         SktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X2Jgtg46fvD0VIIhEX+lIqgmEij/wG71wKNSQ3al/aA=;
        b=Yi9fJETQUWH2lGfahqJXSBsYO7E4UFBBKF1fYoPwCzKoQvVeJQRmCE4408kOBSUwfP
         fgz1xEi/PI2wzB2lfDzIpNNa2L6iW0KO7nV0yD0AGFNX/QPdZgVAPWy+evatqNe+wRB2
         I8p+ei91z5zxRg0OT0oF0iCya5kV6xEpktpyvJ7fY+U0CoQRv0IsAlmSG+GAlgWJ5nEv
         W8p+Vz9TziwTKtdoDRuHfdRxk9jw+ebr3FQLgBCG/KJS8SCok68bMsCEtc5hkEf6Xslg
         4gxRP1W281/NfAv2mlaoaDUdgPaX/qjchKecmSPG0jucLoV1XK+I5Y6ZLtyx9RWWJBwy
         EyNQ==
X-Gm-Message-State: AOAM533sqvROs8dbtRhQSLBGwAe3GTQnKWvIqqGc9+WQf5tGg3xlCq0L
        rB4aUBI0FN08xhs9WN44PQrJGoTfCqJcUg==
X-Google-Smtp-Source: ABdhPJwXxHI+EA4FyBkcl0IPGZqiN90udih7ZsjFkb9Ol0jjGSZrJ6fGpbpWJE+xnD8jIgD8O8LYzw==
X-Received: by 2002:a63:1021:: with SMTP id f33mr3412981pgl.236.1623908093358;
        Wed, 16 Jun 2021 22:34:53 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id m126sm4056405pfb.15.2021.06.16.22.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:34:53 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 3/4] pinctrl: qcom/pinctrl-spmi-gpio: Arrange compatibles alphabetically
Date:   Thu, 17 Jun 2021 11:04:31 +0530
Message-Id: <20210617053432.350486-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
References: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Arrange the compatibles inside qcom pinctrl-spmi gpio driver
alphabetically.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 32 ++++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 00870da0c94e..89f6147efe58 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1104,23 +1104,14 @@ static int pmic_gpio_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id pmic_gpio_of_match[] = {
-	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
-	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
-	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
-	/* pm8950 has 8 GPIOs with holes on 3 */
-	{ .compatible = "qcom,pm8950-gpio", .data = (void *) 8 },
-	{ .compatible = "qcom,pmi8950-gpio", .data = (void *) 2 },
-	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
-	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
-	{ .compatible = "qcom,pm8998-gpio", .data = (void *) 26 },
-	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
-	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
-	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
-	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
 	/* pm660 has 13 GPIOs with holes on 1, 5, 6, 7, 8 and 10 */
 	{ .compatible = "qcom,pm660-gpio", .data = (void *) 13 },
 	/* pm660l has 12 GPIOs with holes on 1, 2, 10, 11 and 12 */
 	{ .compatible = "qcom,pm660l-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8008-gpio", .data = (void *) 2 },
 	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
 	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
 	/* pm8150b has 12 GPIOs with holes on 3, r and 7 */
@@ -1130,12 +1121,21 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
+	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
+	/* pm8950 has 8 GPIOs with holes on 3 */
+	{ .compatible = "qcom,pm8950-gpio", .data = (void *) 8 },
+	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
+	{ .compatible = "qcom,pm8998-gpio", .data = (void *) 26 },
+	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
+	{ .compatible = "qcom,pmi8950-gpio", .data = (void *) 2 },
+	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
 	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmr735b-gpio", .data = (void *) 4 },
-	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
-	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
-	{ .compatible = "qcom,pm8008-gpio", .data = (void *) 2 },
+	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
+	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
 	/* pmx55 has 11 GPIOs with holes on 3, 7, 10, 11 */
 	{ .compatible = "qcom,pmx55-gpio", .data = (void *) 11 },
 	{ },
-- 
2.31.1

