Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B769F6C1AB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 16:59:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbjCTP7L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 11:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232983AbjCTP6S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 11:58:18 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819F311654
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:49:26 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id l12so10810187wrm.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679327344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JifIy6SXQvMSqoW8+4+hT3YBFsgtzfOOQGnYahfHW4g=;
        b=q61Md8IvJXQikmFB0pYYtxgmDqCGyiiP94Vufuo9bl96lJUqWNOCYqENi9xncctpci
         5OAkxdJCe/sqBQuaGjfTb6s/iXmZTO97GGKBPlG66oguwBP4AHKtDHNfNOg2ZctkW4wp
         /qAPUICABdole7almsISyZBOVudOPkXxXVSo9hdDDpeDGq/dRoUuVH7ij9LX0O9FF7LC
         jIBAJ3NYOtWNyz6PSlQChXBHOj1tNIlC6d8ljCbRsrwfwal21YINv0wj/zZpVaL7ZXA5
         8s3wQDzrrMCxgPjhg2QYDvCfoOljhc/BEmW4HVJCBks9BO9DPYPgB4TxW2yKW7xGf/ru
         6PXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679327344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JifIy6SXQvMSqoW8+4+hT3YBFsgtzfOOQGnYahfHW4g=;
        b=V4bYOGCOXs9Ojuc9x8Z5Wyfk4Jl9jIhnKenVn2YVisXh6/+VXmDUJokOFvKQhWk1ea
         IXHuTF0Kj0Bb35NCicjXDrOihHU4qjVmhWw0B02Glk1SYw1ZO18CPOlyltIGCFJsfeil
         TUsSJaf26hufQUYIEth5jR9rihUWwEy3nlLBA19zuvCgq8HJ2w4yREB4/tZyIUZ7c87b
         y4WTJEJ7yRwDEtEw6JqQnP/2FWuA6ZmRmQP13EYDpTxI2LZVGvt3ORUtrygAnkgJL6Mn
         Y/E4M4KRS+aBiUeGEhUMlRUQXhsRzuNc0QzPzE1o9e0pH4+GG09ork6b4LOkMJBlc8el
         m8/A==
X-Gm-Message-State: AO0yUKU7I8HP9XCgv0o0IP/J6g425IkmTXHX3yWKvL/cCXmq2MFbfRG0
        QkvhjyYlFxAZ5e0FjNYUszh0Cg==
X-Google-Smtp-Source: AK7set/iBJFELyZp11oxeT37u5rLByKe0WwlwqpWZ5lsSXJO0XwarPzFjMGpuNY93TomXXh01sb4MA==
X-Received: by 2002:a5d:618c:0:b0:2d7:3d7c:19cb with SMTP id j12-20020a5d618c000000b002d73d7c19cbmr45082wru.4.1679327344729;
        Mon, 20 Mar 2023 08:49:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d7d9:4f38:38b4:82b4])
        by smtp.gmail.com with ESMTPSA id o6-20020adfeac6000000b002c71a32394dsm9202578wrn.64.2023.03.20.08.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:49:04 -0700 (PDT)
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
Subject: [PATCH v2 14/15] pinctrl: qcom: spmi-gpio: add support for pmm8654au-gpio
Date:   Mon, 20 Mar 2023 16:48:40 +0100
Message-Id: <20230320154841.327908-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230320154841.327908-1-brgl@bgdev.pl>
References: <20230320154841.327908-1-brgl@bgdev.pl>
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

