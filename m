Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E9A21586B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2020 15:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729381AbgGFNeW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jul 2020 09:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729376AbgGFNeV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jul 2020 09:34:21 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA29C08C5DF
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2020 06:34:21 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id o8so39368661wmh.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2020 06:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JwlPz1VQoWtw/PPAMkJDslP79wmZUbGedUK151UzPVM=;
        b=NVlmUCpq/lKEqVs2LNex5jpihdjoioJToXMlmV7xJlur5bBqqxQQ0ZA/CPEMp/YFYN
         zo06ci+Iy0l18umuNeYhgFhN14h8r6U7kxH24seP3QCInrax1OBWeKQ1SE9H70pcJnMY
         Y+3zvLqxSlGJHUh9Rzg3ntB0br++CashYLBwH4dCl6PYtf69SG4bkCjzXWpVyre6jT7Z
         bs9jKtCs/nALiRvYyYsz/k1abSGU0I7VVN+9TLc1NZl+ZuCNQZNWPap0lcFqJXgO9nJp
         JQTT4IqiZ5ED2DtL16qAF0f01uKhcxkAIoUDFBjNrhu/dSUyHaMzolCNKJUKIkCUvEqy
         +HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JwlPz1VQoWtw/PPAMkJDslP79wmZUbGedUK151UzPVM=;
        b=F+Gwacgc+ZcwFKvlWkkVEqg5e5ylwqn9GGQhUI2DQ9DLrG+v6tLN583abUDcUH3VH9
         RQytUwolTIk5GnrGTELsdLNj2rBNQzNxTcqlTYmItUU4o4IoAT/5xsOTB6NegdhX/BN8
         2BwxWg6smeGi/gKIbk1E+7bAtnNvcyWSW1GSvAmJ5Dj5vLIuVxmyopgI4l1Vb0DUM3P5
         IvKpsWIYV1413xsPwueKaBzR2LB4OXbi2vaLHpIbtnt9eHYThW8hU4liZ7rjs+ZPsMHd
         gEI6lOIxdTS9nQvyUW88/Sv+bW8lQrDeomuS0ZnNeaVankEuEN8XQP9OBU61QP1sNwvW
         4LaA==
X-Gm-Message-State: AOAM531rayo+vx6jOX5FZgOK/rpjmo9DjwWWonUaEPkUsvCaz1lW05Gx
        U4KqrEZspJRisnL+wKp0/0Isag==
X-Google-Smtp-Source: ABdhPJwWAM9YUcyOeIqwvk9EC4yw+4vx9TJztDtgcS6azkPjILD4VT5pv7bUKjKcnm3I1NN1jBI33A==
X-Received: by 2002:a1c:e914:: with SMTP id q20mr47372571wmc.145.1594042459982;
        Mon, 06 Jul 2020 06:34:19 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:34:19 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 29/32] usb: dwc3: dwc3-qcom: Do not define 'struct acpi_device_id' when !CONFIG_ACPI
Date:   Mon,  6 Jul 2020 14:33:38 +0100
Message-Id: <20200706133341.476881-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since ACPI_PTR() is used to NULLify the value when !CONFIG_ACPI,
struct dwc3_qcom_acpi_match becomes defined by unused.

Also need to place the platform data obtained via the matching process
inside the #ifdef, else that becomes unused too.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/dwc3/dwc3-qcom.c:761:36: warning: ‘dwc3_qcom_acpi_match’ defined but not used [-Wunused-const-variable=]
 761 | static const struct acpi_device_id dwc3_qcom_acpi_match[] = {
 | ^~~~~~~~~~~~~~~~~~~~

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 1dfd024cd06b1..e1e78e9824b16 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -540,16 +540,6 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
-	.qscratch_base_offset = SDM845_QSCRATCH_BASE_OFFSET,
-	.qscratch_base_size = SDM845_QSCRATCH_SIZE,
-	.dwc3_core_base_size = SDM845_DWC3_CORE_SIZE,
-	.hs_phy_irq_index = 1,
-	.dp_hs_phy_irq_index = 4,
-	.dm_hs_phy_irq_index = 3,
-	.ss_phy_irq_index = 2
-};
-
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct device_node	*np = pdev->dev.of_node;
@@ -758,11 +748,23 @@ static const struct of_device_id dwc3_qcom_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);
 
+#ifdef CONFIG_ACPI
+static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
+	.qscratch_base_offset = SDM845_QSCRATCH_BASE_OFFSET,
+	.qscratch_base_size = SDM845_QSCRATCH_SIZE,
+	.dwc3_core_base_size = SDM845_DWC3_CORE_SIZE,
+	.hs_phy_irq_index = 1,
+	.dp_hs_phy_irq_index = 4,
+	.dm_hs_phy_irq_index = 3,
+	.ss_phy_irq_index = 2
+};
+
 static const struct acpi_device_id dwc3_qcom_acpi_match[] = {
 	{ "QCOM2430", (unsigned long)&sdm845_acpi_pdata },
 	{ },
 };
 MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
+#endif
 
 static struct platform_driver dwc3_qcom_driver = {
 	.probe		= dwc3_qcom_probe,
-- 
2.25.1

