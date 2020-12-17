Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745362DD091
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 12:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbgLQLkX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 06:40:23 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:40722 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727786AbgLQLkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 06:40:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608205189; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=CgHSq++NLr2TaQFTh+d2Zw8b6UtAJXov/TwK1S6TAiA=; b=iM8dgKKS/McaVwYevZTi1lonDRMugSbLimQ//86YZBUUT/XxyPt4Eca9HqICEL3+xqU/6wHT
 mDL53r3TxykNsUO1GDoVVHBwDuR0SUsoKKgf6Qhqso50BMRd6ujx8bcUWav2p6iTV9mqEk4a
 ziWaLSj4UlE7bbjyVJOyIOcwvco=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fdb4369bfd08afb0d52d5e0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 11:39:21
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EE176C43462; Thu, 17 Dec 2020 11:39:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 18601C43463;
        Thu, 17 Dec 2020 11:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 18601C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     swboyd@chromium.org, robh@kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V3 2/2] mfd: qcom-spmi-pmic: Add support for pm6150 and pm6150l
Date:   Thu, 17 Dec 2020 17:08:43 +0530
Message-Id: <1608205123-23119-3-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608205123-23119-1-git-send-email-kgunda@codeaurora.org>
References: <1608205123-23119-1-git-send-email-kgunda@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatibles and PMIC ids for pm6150 and pm6150l PMICs
found on SC7180 based platforms.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 2 ++
 drivers/mfd/qcom-spmi-pmic.c                              | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 0b3e440..92cf7e9 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -58,6 +58,8 @@ patternProperties:
               - qcom,pm8005
 	      - qcom,pm660l
 	      - qcom,pm660
+	      - qcom,pm6150l
+	      - qcom,pm6150
 
           - enum:
               - qcom,spmi-pmic
diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
index a35d5cf..6d8b688 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -38,6 +38,8 @@
 #define PM8005_SUBTYPE		0x18
 #define PM660L_SUBTYPE		0x1A
 #define PM660_SUBTYPE		0x1B
+#define PM6150L_SUBTYPE		0x1F
+#define PM6150_SUBTYPE		0x28
 
 static const struct of_device_id pmic_spmi_id_table[] = {
 	{ .compatible = "qcom,spmi-pmic", .data = (void *)COMMON_SUBTYPE },
@@ -61,6 +63,8 @@ static const struct of_device_id pmic_spmi_id_table[] = {
 	{ .compatible = "qcom,pm8005",    .data = (void *)PM8005_SUBTYPE },
 	{ .compatible = "qcom,pm660l",    .data = (void *)PM660L_SUBTYPE },
 	{ .compatible = "qcom,pm660",     .data = (void *)PM660_SUBTYPE },
+	{ .compatible = "qcom,pm6150l",   .data = (void *)PM6150L_SUBTYPE },
+	{ .compatible = "qcom,pm6150",    .data = (void *)PM6150_SUBTYPE },
 	{ }
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

