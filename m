Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77ACD38648
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 10:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbfFGI3I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 04:29:08 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36604 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727866AbfFGI3G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 04:29:06 -0400
Received: by mail-wr1-f66.google.com with SMTP id n4so1244892wrs.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2019 01:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=slZHnEyI/3MoxuWJDHsmJjpXD82N/IlcEekyL2S9VGE=;
        b=h368Vx+bZLWr0EL6gvHppBTRSD6ciSTtbA08qgE1t4taX1ccezuX+R++aXgYdUyb8y
         xqoTAMMnzsmDvOSRVcoiqE2DFyL7TAalaemw43t6ANajvZ6wL8XrTBPrSPCTaI37JOuC
         C+5L9vX/X5BqHwAWrn/zEo5FE4WFb8KPgNsOOUzOOniHj63Dv+LyXOscl8dFK8OY1u1o
         E/HW76TPKlwVq8tS/VJKvSGDMVvLLxyzlkHBehpsvVoeNsfJs8g8ByEL/eJhJVNJIndQ
         NPfMFhvNB2TjUGWQBnh8Zme9lqz8vUpZd67SuV+J3hkfi1YClwo9647sqAdkVGU2KAHa
         w/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=slZHnEyI/3MoxuWJDHsmJjpXD82N/IlcEekyL2S9VGE=;
        b=LN6Kct7BoFhnVJzPaS6pG0n681KBWrOsneonsP37w56Gjp/f1NPOCppl8qgsG7ZliV
         rp4Vr3DWzqeJNXda9E72DMRlYi9b+Za8ba7aMf7P1Q5RIRE2czPbm/zi1EKOwjW2lcnt
         wPR3NUqYYQX3CZQ5OGsBD7l7+kaBqORV/WI54/RndtJcsEa05gtCI+66yULtG01L12wj
         9DkCf8gbQzy8xhX2/lqugffypXbnAJGDD50Nbzuko0czwOpob/v2ObTtVFSCoYZqrbXB
         Ot2l1/ACl3nVSw1OTh9jC2hn2lVpXld5Rq3DYEM06JcuhV/7fBTgFnb3RobtwFm0G/x+
         cgtA==
X-Gm-Message-State: APjAAAU+0OPwGw25EwdON2CYGg9tL5ReQPNPzEvKK8khX+lUoRIhX/8z
        b7ISdg0Fd5nAa6X447zOauYzYw==
X-Google-Smtp-Source: APXvYqxA6VZBIpKaCLm8h8+cRTckg6NGyIemaL7IeDtLMQhELQn4vSQSFHuHPVMnZWXnr8oeR8248g==
X-Received: by 2002:a5d:5702:: with SMTP id a2mr370680wrv.89.1559896145359;
        Fri, 07 Jun 2019 01:29:05 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a3sm1092946wmb.35.2019.06.07.01.29.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 01:29:04 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 3/8] pinctrl: msm: Add ability for drivers to supply a reserved GPIO list
Date:   Fri,  7 Jun 2019 09:28:56 +0100
Message-Id: <20190607082901.6491-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607082901.6491-1-lee.jones@linaro.org>
References: <20190607082901.6491-1-lee.jones@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When booting MSM based platforms with Device Tree or some ACPI
implementations, it is possible to provide a list of reserved pins
via the 'gpio-reserved-ranges' and 'gpios' properties respectively.
However some ACPI tables are not populated with this information,
thus it has to come from a knowledgable device driver instead.

Here we provide the MSM common driver with additional support to
parse this informtion and correctly populate the widely used
'valid_mask'.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 18 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index ee8119879c4c..3ac740b36508 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -607,8 +607,23 @@ static int msm_gpio_init_valid_mask(struct gpio_chip *chip)
 	int ret;
 	unsigned int len, i;
 	unsigned int max_gpios = pctrl->soc->ngpios;
+	const int *reserved = pctrl->soc->reserved_gpios;
 	u16 *tmp;
 
+	/* Driver provided reserved list overrides DT and ACPI */
+	if (reserved) {
+		bitmap_fill(chip->valid_mask, max_gpios);
+		for (i = 0; reserved[i] >= 0; i++) {
+			if (i >= max_gpios || reserved[i] >= max_gpios) {
+				dev_err(pctrl->dev, "invalid list of reserved GPIOs\n");
+				return -EINVAL;
+			}
+			clear_bit(reserved[i], chip->valid_mask);
+		}
+
+		return 0;
+	}
+
 	/* The number of GPIOs in the ACPI tables */
 	len = ret = device_property_read_u16_array(pctrl->dev, "gpios", NULL,
 						   0);
@@ -964,6 +979,9 @@ static void msm_gpio_irq_handler(struct irq_desc *desc)
 
 static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
 {
+	if (pctrl->soc->reserved_gpios)
+		return true;
+
 	return device_property_read_u16_array(pctrl->dev, "gpios", NULL, 0) > 0;
 }
 
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index c12048e54a6f..23b93ae92269 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -121,6 +121,7 @@ struct msm_pinctrl_soc_data {
 	bool pull_no_keeper;
 	const char *const *tiles;
 	unsigned int ntiles;
+	const int *reserved_gpios;
 };
 
 extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
-- 
2.17.1

