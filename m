Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA2A3B7226
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 14:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233746AbhF2MhM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 08:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233748AbhF2MhK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 08:37:10 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF2AC061768
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 05:34:43 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id o3so5724945plg.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TPXbvy+pe/ZgHSulNWzsbEUPTKXE98FkKXq40hDTOqc=;
        b=DE2nlgn+bAMUYSSarERaZjcWV66GUdM9doax3dnhOP/205vxKOYbZryR9HtJqBrC02
         0sKeVK4A0qwBOMHclYMykGVGqq4hf5tpm3C6ONf2KH2YSEwCbEbSBumdEUQF3PXgzqKv
         Xn61oXSjf2MKQ9dS6J8MSARx5PooquK1buRtvPz8m+lUMA2mJ9MCmC94O5NEKFRXOip2
         XOzx5shvWVKNv+AZx908nUgK4xEepXbOpPgwHDoPnxDlYvaXhq+8VRQt34ItA81XkWmc
         1uW0nnDNZUSDx66XvaaBXfLT0ghzZvsUexaLE2MUYNh7JL17u/rUCjh4VOt4S38CljwT
         k3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TPXbvy+pe/ZgHSulNWzsbEUPTKXE98FkKXq40hDTOqc=;
        b=D4sEbnW0aPf0HXUVEPhjzME02GzLMejqbYuxzdISgS7jxfytz7SNGUqT/qmxhlRYKm
         gVCS8XlfC0lggTxZWt6URaoJvNDv5Mlfy0e0T1fBnf8TwIi4rYVAvVke280zEDvjHTXO
         N7moqcnwGWFJScs4hMZoIWOLeSylF3+d3jxL+WPWN5bYP/c0l4eyzFP62JZ+xlRd814i
         FymEYP6r0/4+qeHy84+fEgB9mqcxx2m67d5eO7DXKz+P3OYSwSClAcMO41Jl7jVkfQEo
         gQWhisglY+XQ0FTG/XBobLZvMrMPc0jApJ5PiLGckjMkkH4xlvVZU0eF/6mSFcfAXMrU
         ytJg==
X-Gm-Message-State: AOAM530ZuxjKjDk0kvQ6ccCzn1QGAfKv7RgwPxL3bEze3bs/Bh7jeT8q
        k8whynY1z70l8uHjkKsK5WM1BSe2tk/AmQ==
X-Google-Smtp-Source: ABdhPJwa5WEHjIL2CTD9yFqh+pZBrkIp9jeEb63VTLnGsWP9iq00SYGAaoZJTme80vdC7dnIvee/1A==
X-Received: by 2002:a17:902:ea84:b029:126:a26f:2cf8 with SMTP id x4-20020a170902ea84b0290126a26f2cf8mr27612818plb.72.1624970082556;
        Tue, 29 Jun 2021 05:34:42 -0700 (PDT)
Received: from localhost.name ([182.69.252.226])
        by smtp.gmail.com with ESMTPSA id 143sm16176692pfx.46.2021.06.29.05.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 05:34:41 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 3/4] pinctrl: qcom/pinctrl-spmi-gpio: Arrange compatibles alphabetically
Date:   Tue, 29 Jun 2021 18:04:06 +0530
Message-Id: <20210629123407.82561-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629123407.82561-1-bhupesh.sharma@linaro.org>
References: <20210629123407.82561-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Arrange the compatibles inside qcom pinctrl-spmi gpio driver
alphabetically.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 34 ++++++++++++------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index a89d24a040af..5246ea09c295 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1104,23 +1104,15 @@ static int pmic_gpio_remove(struct platform_device *pdev)
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
+	{ .compatible = "qcom,pm7325-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8008-gpio", .data = (void *) 2 },
 	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
 	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
 	/* pm8150b has 12 GPIOs with holes on 3, r and 7 */
@@ -1130,13 +1122,21 @@ static const struct of_device_id pmic_gpio_of_match[] = {
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
-	{ .compatible = "qcom,pm7325-gpio", .data = (void *) 10 },
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

