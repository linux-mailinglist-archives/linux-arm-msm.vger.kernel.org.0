Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D25FE6CA4BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 14:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbjC0Mxp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 08:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbjC0Mxa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 08:53:30 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8215A19A7
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:53:27 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so5193400wms.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679921606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EER6tqhI6vUHVYjj6AGxC6PvPaE4KpffK80o6d6UVhA=;
        b=1Ly8lNpAV9k1UhP7Su28XfdkCDmVuHTha78ZXjqHRst1E6offaBB+HPOczENpuglyV
         bn5sbgYf/3YJzcodYOmF/G/d+aqm4+cQL9sY2Oh3AMaTfm5FUd4oBcMVD5XN6hHwrp5l
         uVaHAwFKM7IhUD4I80QGJM5G8qe/YicqF5HgzxX8vvqhdYrXre81UPwz7OEIFVDon5YX
         7+wdHq4bPV0bo4DARk2cqOIPvsfp+FqxbKI/VS3qreU4ygZAtrbCGaQZbA+Tb77hcmI8
         e/2mY/qwbgh3ESzt/gKzsEhZzAwexZ6/CB4xLtVbUxkfoVduLeRXUR4XLRs/i+B7fgKf
         q3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EER6tqhI6vUHVYjj6AGxC6PvPaE4KpffK80o6d6UVhA=;
        b=Ft+O1jlWQy6b6/Bbi83+n4jsHo/QzaxKM3fTf0RJ3i8HhV6IDEQHRFC4/ewSGUKUTw
         NyojU3tBvhMx8BKqlJkuzmnWAeUikJto1iDD6pvb7+hsDQJ2DOdHNiTBb37PgwhqlpvR
         pv304SiJguG+oJmwXpUCeCZreyCqWBokVP3zfwhBWZAWQJVrSeSJoUx7OiniLR/sc/z+
         AD0axN7rMXayKtQEvMNXPMwy2J0En5YdeQIE+d6dT2SlDrIDwLkYRXGgNpa/RD37/Auy
         ObytWeOBqSDrVdjCu4HrFCUc6wBTwOd3pATYpw9Tefk/Hm6oTA82tbxwFdHvS8xnXE1l
         CZXQ==
X-Gm-Message-State: AO0yUKXkMZWGuYCP50jjvwx4rYpEO03tu0eeu0JNn/khn2Sd9a8fSAjY
        DpTU6PtfCg+J3nOGRbJsMmYEOw==
X-Google-Smtp-Source: AK7set/gDtCdlw+0ffazR+UtWVA1Dk219aeNa6+48pTJWrxYDJh//ywnZJHClJhoSiDgrTJhu7ubmQ==
X-Received: by 2002:a7b:cd10:0:b0:3ee:672d:caa4 with SMTP id f16-20020a7bcd10000000b003ee672dcaa4mr9085581wmj.17.1679921606041;
        Mon, 27 Mar 2023 05:53:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:313d:a304:2790:a949])
        by smtp.gmail.com with ESMTPSA id q25-20020a1ce919000000b003ee58e8c971sm13572220wmc.14.2023.03.27.05.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:53:25 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 07/18] arm64: dts: qcom: sa8775p: add support for the on-board PMICs
Date:   Mon, 27 Mar 2023 14:53:05 +0200
Message-Id: <20230327125316.210812-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327125316.210812-1-brgl@bgdev.pl>
References: <20230327125316.210812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a new .dtsi file for sa8775p PMICs and add the four PMICs interfaced
to the SoC via SPMI. Enable the PMICs for sa8775p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 37 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
new file mode 100644
index 000000000000..afe220b374c2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmm8654au_0: pmic@0 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	pmm8654au_1: pmic@2 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	pmm8654au_2: pmic@4 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	pmm8654au_3: pmic@6 {
+		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
+		reg = <0x6 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 1020dfd21da2..b7ee4cc676b5 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "sa8775p.dtsi"
+#include "sa8775p-pmics.dtsi"
 
 / {
 	model = "Qualcomm SA8775P Ride";
-- 
2.37.2

