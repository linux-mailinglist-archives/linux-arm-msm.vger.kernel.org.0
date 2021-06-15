Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F733A7866
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 09:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhFOHwG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 03:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbhFOHvx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 03:51:53 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA559C06124C
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 00:49:49 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id h1so8031423plt.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 00:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bLfug41KVgS8QwhKgdDpf17Gh2yCuqzm2B1HR6V7kSQ=;
        b=irDRlDL7X1yLJIf1BNnCEPedzyb5KPte5tkIyfJkfWNJN69SIKa94Efr0HsO37IV/U
         blB152fy1QW0f451J5TGwaxeWzUTqSNkBmj90sZQ7f72k0oXkmOPFqhu0NcmwP+EXpe8
         EA/9hYjZlNg3aP7wRG11vH5t1fNTLA+oVuyTdVTdKoAbE8NnxOFt7FpzqpZzdreEmBRi
         6h1wMKu78Phw7YXuEgdZOHCnFpHmKVc/xlcvZpQC2xVf9EzLEsUPp5jHRMTXOS25X0FR
         ys9umdHBoPunSVp/jyA8ebQ/MoSM5cW7lNw5vb+5l/HVYQ+CfFdzCBr/yRBuUGjCMXji
         Ur4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bLfug41KVgS8QwhKgdDpf17Gh2yCuqzm2B1HR6V7kSQ=;
        b=TtwQhtGoEsPAPDEpGNN7yIHs4XF+Z88/f1zrRusD4dY1AV/QutTzZSlZNjtaBKAo36
         wYFu0fde88ykbdFdwFzO33stQJEtUjrM8ELwYYILO4fK7LnrWcQYUe7LXQ4uxbeqv8/6
         qgzJxemWZXpxIJYs4gKNrRDMR114pIlXXbkc3rXKnVQeuYa+gSl5RCxKvSEAW5/PNTuQ
         VtBRHKjAWuCjps6thOJOePjlmIqtQcceg6e620/DpbXuyJ2AFwARIaIdeV0SuFJ31cnk
         E7x2uFYrba+qSCsskVShWoVa7ho/lrejNXxWrRk8wMvffekeSBgZbdwCpTV+aPlpTRXY
         Xhyw==
X-Gm-Message-State: AOAM5312Kp6lS2vm18+vHWwiaq0eS58OMkjiMfocJjdTonyNNptdVmd7
        WD9DVr9hWmWRxZ26DQJH5aeivjlPqQfJDg==
X-Google-Smtp-Source: ABdhPJw+k0l+t8wDSvmtX9WX1CS+pgbRdSl4Z0t2W3TIHUWvl+hjzatDZSYOZZikTbO1rLP/DOH5PQ==
X-Received: by 2002:a17:90b:3ec3:: with SMTP id rm3mr24186956pjb.105.1623743389143;
        Tue, 15 Jun 2021 00:49:49 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.197.114])
        by smtp.gmail.com with ESMTPSA id c25sm14273097pfo.130.2021.06.15.00.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 00:49:48 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH v2 07/10] pinctrl: qcom/pinctrl-spmi-gpio: Add compatible for pmic-gpio on SA8155p-adp
Date:   Tue, 15 Jun 2021 13:15:40 +0530
Message-Id: <20210615074543.26700-8-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SA8155p-adp PMIC (PMM8155AU) exposes 10 GPIOs.

Add support for the same in the pinctrl driver.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 00870da0c94e..f886c683e2bd 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1127,6 +1127,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
 	/* pm8150l has 12 GPIOs with holes on 7 */
 	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
-- 
2.31.1

