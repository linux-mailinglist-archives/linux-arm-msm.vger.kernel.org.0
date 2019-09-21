Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDC82B9D37
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 11:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405436AbfIUJv1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 05:51:27 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35750 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405440AbfIUJv1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 05:51:27 -0400
Received: by mail-wm1-f66.google.com with SMTP id y21so4477813wmi.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 02:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jmzhv0DcxS1wnuv+FFRJ18wJXKFJBKQZi54zSp+QSrg=;
        b=X0AvqD7ZnPweyNvQ6wpbX1Lq7xU03M/laYRS1MFQLLKsjdgjSwzZueWQhGGuzX+v0J
         p18ji2hVF3xR2gcT55WTk6wG4iCtg3bMIkR+xO4SUnGPGOsgFYlt+3KbGHSxRFMub79I
         MaYGm7qasqD9juKB5mKtndOJJhnEJI8kFmfuOp2nzsrOZik3d4C1gYfuyZALPo5Lhelw
         m1Ef9MiD7BM63fnRIeIIvFopqtIhFXsjKfAkqmxZWPvk1XsN7PKV+PkoJWFWXXumcWFQ
         FjzBYgZZE6u7vc6TVm9qrBqWvp/J9jgPvn47Zl/kmKVqVctuOGFRBx709E7anf5yXUIO
         LGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jmzhv0DcxS1wnuv+FFRJ18wJXKFJBKQZi54zSp+QSrg=;
        b=WTuMF/WZsNes8CkysjGzyXKLsWK+2ZoVthNr4ilG2OPxOn7F9jUc20Op/SGaA9vc4G
         R9HL1vE1OPmJQAhWSgwrmvY1kMejwkpfwLC6RtxKaG/7tH8FpOATfP3idBNRD1lQatgp
         xV6jo0tmLQgDV/IH+qyIQStWBEKyw46Fz6dXMNnR1EmDLGaTIsqk0wMl0kVd9xMhVJV8
         OglhbgXnJ4eH928QQdmbl5peHRxFUMK1zukSo++hMSupaioXXMsxK94q392zLRb9pRri
         5tIJc32kvuf4JBw2oNsl+gInrBm4xd09gcglNVc5YbCeiN0rSjJGTKv5gOfrpHVoycy8
         5viQ==
X-Gm-Message-State: APjAAAUCshtIVfDv5wl49aEwbn43ZT6S/PS2tEfBc3YN7JThLmMde1jY
        0sfR2W+nh0ltgB8ZWYjZxwVCC0yvnlQ=
X-Google-Smtp-Source: APXvYqwMlwVK4IsiorAV7SdzI22+V4K1q5V4eK+ddVZdS+dHTr3dv96xQcp6NMed4wUlRkO6afGikQ==
X-Received: by 2002:a1c:7f4f:: with SMTP id a76mr6638131wmd.117.1569059484400;
        Sat, 21 Sep 2019 02:51:24 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id c8sm4947094wrr.49.2019.09.21.02.51.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 02:51:23 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org,
        lee.jones@linaro.org, agross@kernel.org
Subject: [PATCH 4/5] mfd: qcom-spmi-pmic: Add support for PM/PMI8950
Date:   Sat, 21 Sep 2019 11:50:42 +0200
Message-Id: <20190921095043.62593-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921095043.62593-1-kholk11@gmail.com>
References: <20190921095043.62593-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

Add the subtype and compatible strings for PM8950 and PMI8950,
found in various SoCs, including MSM8953, MSM8956, MSM8976 and
APQ variants.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 2 ++
 drivers/mfd/qcom-spmi-pmic.c                             | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
index 143706222a51..fffc8fde3302 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
@@ -29,6 +29,8 @@ Required properties:
                    "qcom,pm8916",
                    "qcom,pm8004",
                    "qcom,pm8909",
+                   "qcom,pm8950",
+                   "qcom,pmi8950",
                    "qcom,pm8998",
                    "qcom,pmi8998",
                    "qcom,pm8005",
diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
index e8fe705073fa..1df1a2711328 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -31,6 +31,8 @@
 #define PM8916_SUBTYPE		0x0b
 #define PM8004_SUBTYPE		0x0c
 #define PM8909_SUBTYPE		0x0d
+#define PM8950_SUBTYPE		0x10
+#define PMI8950_SUBTYPE		0x11
 #define PM8998_SUBTYPE		0x14
 #define PMI8998_SUBTYPE		0x15
 #define PM8005_SUBTYPE		0x18
@@ -50,6 +52,8 @@ static const struct of_device_id pmic_spmi_id_table[] = {
 	{ .compatible = "qcom,pm8916",    .data = (void *)PM8916_SUBTYPE },
 	{ .compatible = "qcom,pm8004",    .data = (void *)PM8004_SUBTYPE },
 	{ .compatible = "qcom,pm8909",    .data = (void *)PM8909_SUBTYPE },
+	{ .compatible = "qcom,pm8950",    .data = (void *)PM8950_SUBTYPE },
+	{ .compatible = "qcom,pmi8950",   .data = (void *)PMI8950_SUBTYPE },
 	{ .compatible = "qcom,pm8998",    .data = (void *)PM8998_SUBTYPE },
 	{ .compatible = "qcom,pmi8998",   .data = (void *)PMI8998_SUBTYPE },
 	{ .compatible = "qcom,pm8005",    .data = (void *)PM8005_SUBTYPE },
-- 
2.21.0

