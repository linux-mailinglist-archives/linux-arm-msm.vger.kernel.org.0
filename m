Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 836B22E784B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 12:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgL3L5p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 06:57:45 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:40521 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbgL3L5n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 06:57:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1609329444; h=References: In-Reply-To: Message-Id: Date:
 Subject: To: From: Sender;
 bh=UyxQBKUz5DlXeDQwCAchodqRNud0wMMG6SlPnp0zmhQ=; b=r3uaptxkFJMKps/aaK+pb383+h+H4HOl3HmCYu6juuKB+3l8SEt31lt/aTABuaXqbST5yznW
 /ZZ6Ta4iXWzeAKFC5dbkN/xfQ9HuITtkBT5gvQqJariHHSFsQ+B38HzFJCMVAX/LETGF9AMG
 8R16e5B+dLapegJQ0kn1GXTJVcU=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fec6b077524035eedf78f56 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Dec 2020 11:56:55
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BC29BC433CA; Wed, 30 Dec 2020 11:56:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A730C43461;
        Wed, 30 Dec 2020 11:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8A730C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     swboyd@chromium.org, lee.jones@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org,
        mark.rutland@arm.com, linux-arm-msm-owner@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V5 2/2] mfd: qcom-spmi-pmic: Add support for pm6150 and pm6150l
Date:   Wed, 30 Dec 2020 17:26:23 +0530
Message-Id: <1609329384-15534-3-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609329384-15534-1-git-send-email-kgunda@codeaurora.org>
References: <1609329384-15534-1-git-send-email-kgunda@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatibles and PMIC ids for pm6150 and pm6150l PMICs
found on SC7180 based platforms.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 2 ++
 drivers/mfd/qcom-spmi-pmic.c                              | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index b753bdb..151953a 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -59,6 +59,8 @@ patternProperties:
               - qcom,pm8005
               - qcom,pm660l
               - qcom,pm660
+              - qcom,pm6150l
+              - qcom,pm6150
 
           - enum:
               - qcom,spmi-pmic
diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
index a35d5cf..78e9084 100644
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
+	{ .compatible = "qcom,pm6150l",    .data = (void *)PM6150L_SUBTYPE },
+	{ .compatible = "qcom,pm6150",     .data = (void *)PM6150_SUBTYPE },
 	{ }
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

