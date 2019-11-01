Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94325EBE37
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2019 07:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbfKAG7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Nov 2019 02:59:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:32832 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfKAG7Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Nov 2019 02:59:24 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3F34160D4C; Fri,  1 Nov 2019 06:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572591563;
        bh=SfMS6ugI/rbxN40RZqNQuk+KKQDvTM9lmtZxl8kl5+A=;
        h=From:To:Cc:Subject:Date:From;
        b=fouVRXN9i+GIe+yNFqu7GLWeB+vNlPCkh/VxSs9kWtfnPAsDvQqVoOGWIc3l+3u+e
         rGoT2OJ/honfGmZurv24PifUyNVwHXvn196gZRXo0IxZ4tWmBpY0TWSm+SHPrLwrL7
         MSheDSY9otv9EnbhUwX5fdmpH+ZGf36Iur8Ezd0g=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0403360BF4;
        Fri,  1 Nov 2019 06:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572591559;
        bh=SfMS6ugI/rbxN40RZqNQuk+KKQDvTM9lmtZxl8kl5+A=;
        h=From:To:Cc:Subject:Date:From;
        b=NCChyQLcN0/uqr0XwNlkbiPhqcQXduvY1sPUW1EqChXbIn11T7O9GQajpBD48TxdF
         KiWtIX0jh8NTe892E9BLe+hpL47tzsca7iAZEIWZ0jGg0LfMQKc1dR9Gu+8yPUu3bM
         B+xNMdHU8L3O6+N72dKiV63pVb1ndFBcQSu4ycRU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0403360BF4
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        rnayak@codeaurora.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V1] mfd: qcom-spmi-pmic: Add support for pm6150 and pm6150l
Date:   Fri,  1 Nov 2019 12:29:03 +0530
Message-Id: <1572591543-15501-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatibles and PMIC ids for pm6150 and pm6150l PMICs
found on SC7180 based platforms.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 2 ++
 drivers/mfd/qcom-spmi-pmic.c                             | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
index 1437062..b5fc64e 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
@@ -32,6 +32,8 @@ Required properties:
                    "qcom,pm8998",
                    "qcom,pmi8998",
                    "qcom,pm8005",
+		   "qcom,pm6150",
+		   "qcom,pm6150l",
                    or generalized "qcom,spmi-pmic".
 - reg:             Specifies the SPMI USID slave address for this device.
                    For more information see:
diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
index e8fe705..d916aa8 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -34,6 +34,8 @@
 #define PM8998_SUBTYPE		0x14
 #define PMI8998_SUBTYPE		0x15
 #define PM8005_SUBTYPE		0x18
+#define PM6150L_SUBTYPE		0x27
+#define PM6150_SUBTYPE		0x28
 
 static const struct of_device_id pmic_spmi_id_table[] = {
 	{ .compatible = "qcom,spmi-pmic", .data = (void *)COMMON_SUBTYPE },
@@ -53,6 +55,8 @@
 	{ .compatible = "qcom,pm8998",    .data = (void *)PM8998_SUBTYPE },
 	{ .compatible = "qcom,pmi8998",   .data = (void *)PMI8998_SUBTYPE },
 	{ .compatible = "qcom,pm8005",    .data = (void *)PM8005_SUBTYPE },
+	{ .compatible = "qcom,pm6150l",   .data = (void *)PM6150L_SUBTYPE },
+	{ .compatible = "qcom,pm6150",    .data = (void *)PM6150_SUBTYPE },
 	{ }
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

