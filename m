Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81022422B5A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 16:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234084AbhJEOpe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 10:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235301AbhJEOpc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 10:45:32 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1149C061767
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 07:43:41 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y23so47891127lfb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fSoTwIybzpP2ja1UE0gJTnY+M6QRSJ7ijJBeYL79794=;
        b=mbX/XxCjd3yC3UgLbUzTCtzXQwsOq0wOxlNQIvuTgrhfwaZ7flZh3132RmWDtmYEG6
         MeqbOSirNEHzIO1Wegoe2t+JT81Trk+vsQESieonT3PfQNr9L5JOwul8thhqvooKN2dv
         xp/FaDfXkPXrbZPO3TojH0oQSuc6r5P98wxLCAjmKK4FqZiqkKg815Uf9zOwjobK9AlR
         cIa0I6matL/tm2hIY64/ost2wzguIL40xwU8JKXPCeSnF3HpaB9TiWboIbyJqpliPaOZ
         W47MNnCtCLaWAiv/TiC0+bVxdVVWGaThHzoQRqJGW02tWf65tT/EKcJLfD80SD3RINPZ
         ldTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fSoTwIybzpP2ja1UE0gJTnY+M6QRSJ7ijJBeYL79794=;
        b=Qks8gQc+r9GyBVc/Cj9KbPzK0vIjs9GytmaonKqFe9LRyMzP8XHhIpl2H5kROnVeUV
         bL3XgK49Uz4dBZNYsicW7mG4T9Ku+ei1Cd/ue+Oh4bzDKDwDExnaYFJ6Nf+MLZnZlftq
         fAwNdMUaOHhlFd0zS7tChzfgSgDDDvi+jPqH4SbLHuPTYGQ7GnZijkr9H1yTV/KtHyRR
         WuKpg1QirlQPN45uA1wfxt3ZFF7F8i0N8MpiFGwvK2u0rMJR6Wwm1ZObC71s1KcCimhr
         Z+5Ocv43g1j+0Whmypye7bGHkdtioafmpekux0YhnZcmko3rOIaLnIz/N4v+gsgv3WrZ
         8sew==
X-Gm-Message-State: AOAM5337fhcBL2xAIivmIT4/PmJWqnuqWG6uVOYog+btKDbJPUl3BnSs
        yFx6Cv0AwaX6bLS95ro/+FzF0A==
X-Google-Smtp-Source: ABdhPJyJpura1caLUDJDbZ+gTFzczqBoayWomDc/l7VFEXdzE1HmMIDxm+k83rQ6+XO6/CB5Jjy2Xg==
X-Received: by 2002:a05:651c:201e:: with SMTP id s30mr22127517ljo.244.1633445019098;
        Tue, 05 Oct 2021 07:43:39 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm1987173ljc.120.2021.10.05.07.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 07:43:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 5/6] pinctrl: qcom: spmi-mpp: hardcode IRQ counts
Date:   Tue,  5 Oct 2021 17:43:28 +0300
Message-Id: <20211005144329.2405315-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211005144329.2405315-1-dmitry.baryshkov@linaro.org>
References: <20211005144329.2405315-1-dmitry.baryshkov@linaro.org>
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

