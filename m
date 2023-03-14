Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336C06B9E95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 19:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbjCNScB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 14:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbjCNSbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 14:31:32 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD05B5D885
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 11:31:07 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id m18-20020a05600c3b1200b003ed2a3d635eso3099269wms.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 11:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678818666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JifIy6SXQvMSqoW8+4+hT3YBFsgtzfOOQGnYahfHW4g=;
        b=W1i3UnlgeTIvRzO2pcQbq1x1SNcmRThsyh1/fsnHrWYmRnPJKGWqlSBW6hqMXUf3DP
         W44R1ZjxFAmOPsvhf/DKrTs052n6Wcv+d0XqQluFxXs1IoPNhLNGtrXagDpZXnzdFTrR
         YbfLQF9Jlfq01zm6+yTzZNt/7mvrXdDWxwJ/ghcSdOmIhLpTK9WHzulsbhOylhWLEYt4
         zvrHZrcAU1A2ewhzLz9oXUVpNXYd7VWa7ukHG6fnquudpU1/bNQUZJAmszqK06BMdely
         9rP5aPjTNIjYPQQlnCNL2uZph0lbFocF4ZeivU16DBJmgrAJlBkmUv8t6qL1p6wZqbbf
         mdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678818666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JifIy6SXQvMSqoW8+4+hT3YBFsgtzfOOQGnYahfHW4g=;
        b=KCfNCjWqhcP0XqhxcZ8W8hqiTlSgsHk/muw2rOe6JQa+VXgXyaB0G/8rAbgUIMuFQh
         Q5vl9mOKgk7phBGSZeIAAo7SS+ckv9Bm9JQ/ai0WTT2NAkniIXdHhV2duDyhJcV0Yktw
         /QhPb5haSzND0865Iw7URd1El9d9b3cOGcIYRBJzRwEFGbaXuRCuuOLgYNgR8zulCEOb
         bMDpRvOBEKKrEzuMAHOSk3Ux5PZeME6Vq1v+9c8FlymIl1VKyfm7xXyZP2oukIbcDXHC
         85Xsx6j2YQwpA7ACXjwE+B/HLdRvjVEDY4M4nwyjEGXayyihn/XaeHAo/2rswOhHOM3O
         oErw==
X-Gm-Message-State: AO0yUKXmAKlEUC5+8zu3SXzcuJ6u0VHPJF/14R3njfldH2Ma3FKzTiI3
        hRa4hT2QDk6RIsWfhn/iKgll2g==
X-Google-Smtp-Source: AK7set+mQKBixNZRuNoiBQ+bXlzTj5JfkNGQJFoVquGVQE9PPzQyxrii4fvTla/n1ikzsD4R20ys/Q==
X-Received: by 2002:a05:600c:4452:b0:3e1:374:8b66 with SMTP id v18-20020a05600c445200b003e103748b66mr15026640wmn.40.1678818666079;
        Tue, 14 Mar 2023 11:31:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fd14:bd52:b53b:d94c])
        by smtp.gmail.com with ESMTPSA id k28-20020a05600c1c9c00b003e209b45f6bsm4083938wms.29.2023.03.14.11.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:31:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 13/14] pinctrl: qcom: spmi-gpio: add support for pmm8654au-gpio
Date:   Tue, 14 Mar 2023 19:30:42 +0100
Message-Id: <20230314183043.619997-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314183043.619997-1-brgl@bgdev.pl>
References: <20230314183043.619997-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add support for the GPIO controller present on the pmm8654au PMIC.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index ea3485344f06..0d94175b34f8 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1238,6 +1238,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pmk8550-gpio", .data = (void *) 6 },
 	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pmm8654au-gpio", .data = (void *) 12 },
 	/* pmp8074 has 12 GPIOs with holes on 1 and 12 */
 	{ .compatible = "qcom,pmp8074-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },
-- 
2.37.2

