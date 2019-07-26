Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53F747646D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 13:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbfGZL2Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 07:28:24 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43011 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbfGZL2X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 07:28:23 -0400
Received: by mail-lj1-f193.google.com with SMTP id y17so26581490ljk.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2019 04:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JRcrXtr8rQsCuSxKmOiTEHFaI3E2giu+b2+lAXm3fKY=;
        b=rmXdZNRx3HMv4Da1HMe0r5OGG9YW+88vz9KCNHfF0KRJaMPzwfuCgzrVVir9svuXdN
         uPE0v/CY1mZOEqzaatak8C0t3rgjVJUo24HtTqQ7cneYAMdRbqyPRKlV517gp78BtO+5
         PmKtGqCX9jVyzQxYPZDWnqcwLJv6z8HpjExQw182ylQWndH4KiakesMiSrSqg2VcdG4o
         08tYXWL1GMOZ8kPJGeAYYv/Ox8yFYLIP/glbVNFZcrbvF+oLyiuOxbbX3YozyyJ2mGnK
         UUaR/D3IOq24YoaHSShNyKhuW6Ol4PJ3H23k0RaelPe0Tz4IZK/boJlddC89xnVT4CdR
         m68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JRcrXtr8rQsCuSxKmOiTEHFaI3E2giu+b2+lAXm3fKY=;
        b=nmNbDe2ZjLqj7d2PZcWF9cpQ/f++9wkVMh29cwhCZIvgEbx92H16ZcIdk7bbNg7zCj
         fbaJ4wPgHSxeQ+c6oQwy1viFkqSqPsqR5U3F4bCby2gb9H2UHs080gaBVhMzAUBsjwMm
         GV7fC//Sn9h0tYtpNSlr0hGbNu9lxtN1fycKfmnrILZ/ECZpR0VHLxQb3Q2UDp5/Pxur
         1gj9Fqu8urLhhOCgmVCpg0sEPabI6OJ7S6pyjQ71FK5MO3Nl59MkIDZ3yRRBbEpD1K2K
         lUG82HLO6rufMbhW8xvenT1T3d2fhIn8Fl/hDYT73JwlWIP/VcW99+KVYbYRBY5qjKUs
         9Dew==
X-Gm-Message-State: APjAAAX4sNE3eUn2nIdtf7bpu0mXatDKNvVUewLg75TGUxRfPtcR6iR4
        luKtBby4dMU2LCtOw4OxQUlpZA==
X-Google-Smtp-Source: APXvYqz/ZV0vwhiHIgAubE5iNYjXwgV7SUQkXdLpVuwCr6QsW+0gMr3YV8iq8nE2x0aNLA8mUo28IA==
X-Received: by 2002:a2e:25a:: with SMTP id 87mr49879332ljc.183.1564140501528;
        Fri, 26 Jul 2019 04:28:21 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se. [213.112.60.36])
        by smtp.gmail.com with ESMTPSA id m25sm8267492lfc.83.2019.07.26.04.28.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 04:28:20 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        linus.walleij@linaro.org
Cc:     heiko@sntech.de, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Mark expected switch fall-through
Date:   Fri, 26 Jul 2019 13:28:16 +0200
Message-Id: <20190726112816.19723-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When fall-through warnings was enabled by default the following warnings
was starting to show up:

../drivers/pinctrl/qcom/pinctrl-spmi-gpio.c: In function ‘pmic_gpio_populate’:
../drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statement may fall
 through [-Wimplicit-fallthrough=]
   pad->have_buffer = true;
   ~~~~~~~~~~~~~~~~~^~~~~~
../drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:816:2: note: here
  case PMIC_GPIO_SUBTYPE_GPIOC_4CH:
  ^~~~
../drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statement may fall
 through [-Wimplicit-fallthrough=]
   pad->have_buffer = true;
   ~~~~~~~~~~~~~~~~~^~~~~~
../drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:821:2: note: here
  case PMIC_GPIO_SUBTYPE_GPIOC_8CH:
  ^~~~

Rework so that the compiler doesn't warn about fall-through.

Fixes: d93512ef0f0e ("Makefile: Globally enable fall-through warning")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f39da87ea185..ebf33f65c1bc 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -813,11 +813,13 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
 	switch (subtype) {
 	case PMIC_GPIO_SUBTYPE_GPIO_4CH:
 		pad->have_buffer = true;
+		/* Fall through */
 	case PMIC_GPIO_SUBTYPE_GPIOC_4CH:
 		pad->num_sources = 4;
 		break;
 	case PMIC_GPIO_SUBTYPE_GPIO_8CH:
 		pad->have_buffer = true;
+		/* Fall through */
 	case PMIC_GPIO_SUBTYPE_GPIOC_8CH:
 		pad->num_sources = 8;
 		break;
-- 
2.20.1

