Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010C73AAB1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 07:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhFQFhJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 01:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhFQFhG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 01:37:06 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FACC0617A8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:34:57 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id m15-20020a17090a5a4fb029016f385ffad0so338957pji.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mlXK69v2pPrOsRLDV4z5stHJFaT50+6OHMAHmJSQD6I=;
        b=rrWQRz1BJVYbRPYMwQ5hwKXNONO6Ld5gpLPy9Ua2PeauTkcKcX4cvqJOGkEXgxu4wu
         aP8MbfSFaC5dzv+sAdcc9nNslsvyEvXLHzbYBf/5ylHgO72VuzCnS1FhAs73WlaQcZbe
         UGbZT0Le8FTKq2SBkbQ9f/cOc36KrLav29kOt9visUvjZtrkv3ErMYh6traHIq+RuvDp
         7P+wwvXmpzfmHj8i4Z5ReK7af0uGBoU8ND4Vvm+mVrPcnrrfCQODrCedqMq2FNytaRYl
         5KwFVw2Mr4vNzADxuEuUIQ6MlpiwZnK51aSn9nuO3sIL/RbuhkOu5XL4G3W6LJEk8bNY
         XzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mlXK69v2pPrOsRLDV4z5stHJFaT50+6OHMAHmJSQD6I=;
        b=QOKp+aY/JVE/Ou5RjsVHh9RhgoPBkXI3tdTa7Z/zrYEtvLoZwDR2nZCmRM9Gkb9u3p
         RaJJYeefsbd9JIACc3rwG3wH4K1jF1+pGbehdLlnaHprimuQkWlvAE74HogxqYWsC88V
         KAWKn6M9PeXThwzM6huYzu1p4QO5sMTFFANLCet0BMWYEl10BypAooLkSuoiWo/PY+nn
         7XWHvo/kkmTS68J9dMz5gikmtU82RkELLOLS0E98itNRnrgeJp8U5TpoP9jvxKY0BnBv
         IhUuwfPMCfCAa70zUzpgBTb3hL5nwjkugqFE5LIftYb4SCReRdn+uo042CHjyPmSp7e2
         35bw==
X-Gm-Message-State: AOAM532Zmx6/WtlCQQP/Dcx5nSqeIZPvMCiSM7s4s8WT1pSnf/0omsbT
        wjQyuEmUJphRR49pEDsRRku7CLppA9ls7A==
X-Google-Smtp-Source: ABdhPJw0nmxdi9o8bhp15PUKfbIimW3pxzpfJBcHnzId9n4+7gj4Xkv3huob0sEHZj1mho0h7rErsA==
X-Received: by 2002:a17:90b:45d5:: with SMTP id jt21mr2305526pjb.75.1623908097236;
        Wed, 16 Jun 2021 22:34:57 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id m126sm4056405pfb.15.2021.06.16.22.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:34:56 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 4/4] pinctrl: qcom/pinctrl-spmi-gpio: Add compatible for pmic-gpio on SA8155p-adp
Date:   Thu, 17 Jun 2021 11:04:32 +0530
Message-Id: <20210617053432.350486-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
References: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SA8155p-adp PMIC (PMM8155AU) exposes 10 GPIOs.

Add support for the same in the pinctrl driver.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 89f6147efe58..cc50cfc576fd 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1132,6 +1132,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
 	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmr735b-gpio", .data = (void *) 4 },
 	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
-- 
2.31.1

