Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08B094261E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 03:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239415AbhJHB1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 21:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236675AbhJHB1e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 21:27:34 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817B3C06176A
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 18:25:39 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id j21so14484668lfe.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 18:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fSoTwIybzpP2ja1UE0gJTnY+M6QRSJ7ijJBeYL79794=;
        b=oDA2++ocrLRqzpjQmU/xREOSMUf+3SK/Uz4PJIawPvLPy+KzpchgT6en08Uu7Mprh5
         DGB1FPYYs1XiI8nmVRQJw7rIvS4rLymDnBQpEVl5FG2c3w4aWRer8j60QTHQxZfwoA0M
         MuC5M/pGdo0LYwV7SZzp9SmX+P1mc0+IcrhTuYAM+wPV2eeMiQHdM7IKBUiNa4kiW0Ii
         gqkw3YKeq1w+S2s2ucL4ELl+3iZFZYK24AoBTMUpUmgr+YBzktzRPEVnaLFKaTIuogFX
         CYM46PrI/FRXguKrfClvXqOOuVItxUbgWggDrhxvH4tZTz4xlm8UUk1TOEdpRwz9BDbO
         Ab/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fSoTwIybzpP2ja1UE0gJTnY+M6QRSJ7ijJBeYL79794=;
        b=VknG+omCkjnVAZx2dUkuazkKP0xdT+FpK4ok4RBCGJPzhduXUbqVfvtyObWsDBD6UO
         JJsfRAMwyj8X1bBY1NbM2rRDlk+Jvx+4u/RNOYq35qoiXZaxSFzFOFvZJ9HUZZABF4uw
         iSaR9NSzVrjFDfOqkZ0AfJHmXTkn2IcDD+TVgA9oA0aFT9wIvrXsDj7JHsTXjLvhpcWa
         sG0+jdlSd+OfgmDLoixDvA2UNzw3H/+KBcInQNc9ithVblcDS6On8pQIUu+QZMa5V6Ge
         9rwQbtTGbv/s+E2yALePZDFCBdzcWaKjwKVlxL8yOV26WlEReFvp1MQPKoPa/uuxX4Zd
         rKpQ==
X-Gm-Message-State: AOAM532vCF0TMcZUbMiraUIOKqWjBKaIOeddE+44ZkvrmkCyZ4WA+2Pc
        N2ZrSXtU2LZK9mdlvoeztswyig==
X-Google-Smtp-Source: ABdhPJzZrJsjQpfqJ/ECRzhkphQuMbdvpP1IR9HEfpXHjuOvHZl3KTkB5QCWG/731l7h7z5uFsFhkw==
X-Received: by 2002:ac2:51cb:: with SMTP id u11mr7291691lfm.139.1633656337950;
        Thu, 07 Oct 2021 18:25:37 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 15/25] pinctrl: qcom: spmi-mpp: hardcode IRQ counts
Date:   Fri,  8 Oct 2021 04:25:14 +0300
Message-Id: <20211008012524.481877-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
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

This patch also removes the generic qcom,spmi-mpp OF match since we
don't know the number of pins. All of the existing upstream bindings
already include the more-specific binding.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 2da9b5f68f3f..a9f994863126 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -812,11 +812,7 @@ static int pmic_mpp_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	npins = platform_irq_count(pdev);
-	if (!npins)
-		return -EINVAL;
-	if (npins < 0)
-		return npins;
+	npins = (uintptr_t) device_get_match_data(&pdev->dev);
 
 	BUG_ON(npins > ARRAY_SIZE(pmic_mpp_groups));
 
@@ -912,16 +908,15 @@ static int pmic_mpp_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id pmic_mpp_of_match[] = {
-	{ .compatible = "qcom,pm8019-mpp" },	/* 6 MPP's */
-	{ .compatible = "qcom,pm8841-mpp" },	/* 4 MPP's */
-	{ .compatible = "qcom,pm8916-mpp" },	/* 4 MPP's */
-	{ .compatible = "qcom,pm8941-mpp" },	/* 8 MPP's */
-	{ .compatible = "qcom,pm8950-mpp" },	/* 4 MPP's */
-	{ .compatible = "qcom,pmi8950-mpp" },	/* 4 MPP's */
-	{ .compatible = "qcom,pm8994-mpp" },	/* 8 MPP's */
-	{ .compatible = "qcom,pma8084-mpp" },	/* 8 MPP's */
-	{ .compatible = "qcom,pmi8994-mpp" },	/* 4 MPP's */
-	{ .compatible = "qcom,spmi-mpp" },	/* Generic */
+	{ .compatible = "qcom,pm8019-mpp", .data = (void *) 6 },
+	{ .compatible = "qcom,pm8841-mpp", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8916-mpp", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8941-mpp", .data = (void *) 8 },
+	{ .compatible = "qcom,pm8950-mpp", .data = (void *) 4 },
+	{ .compatible = "qcom,pmi8950-mpp", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8994-mpp", .data = (void *) 8 },
+	{ .compatible = "qcom,pma8084-mpp", .data = (void *) 8 },
+	{ .compatible = "qcom,pmi8994-mpp", .data = (void *) 4 },
 	{ },
 };
 
-- 
2.30.2

