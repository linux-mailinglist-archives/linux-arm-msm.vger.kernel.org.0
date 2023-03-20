Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 861C26C1A98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 16:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbjCTP6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 11:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232026AbjCTP5u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 11:57:50 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60933D905
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:49:07 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t15so10813765wrz.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 08:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679327337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOGGFNiRJEuMjhJtfyo06CFlZ9jQ7DwjlMMoJqx1/zY=;
        b=SnqRqAXL6AK6aJJVnSr6uVSgZnneUYWZaDafiDfpI+ZuS6dbhMUsh1mxxXDhKRO5d+
         vbKLnJyqlREz6EbbiyHVP4Hhsv4/x5l8fLTIyx2r6ninqqRWMK7sdBqagvA9pXCX8j8N
         +fUlHZvXyjVmJ1fANuowmw4ZVKFQSX5DOZ/ODX1EXJSFcZyQWn0dubXhxxWuiTcpuV1z
         IvYCxKjuFdqpqruvrtIm601irUzw4Y2A1T1efpAoRAeKFFbRDY7v8Jv+j1z2t7KfLYJS
         AXhiI7IBTw5PaBtcOBwL9xfWbGA+Ny04GB/H6xNZ7ZVGcoOedqvBmywNgVM9dZXXdwOl
         buMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679327337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOGGFNiRJEuMjhJtfyo06CFlZ9jQ7DwjlMMoJqx1/zY=;
        b=FIa4N3ZZGSQPBoBM+RaFbf2YFYnLTjfa0YzEgY1v1+osNBI6JBkzcknYs37loZINIB
         B8D6fFNs5zsaGediT2R2dU9DPgyGOPcSmb5pCscY277L8Plk6dbhfYoOP+MSY6AgPbeF
         Ebqz8gm9f6kxYlXzI6k9oHHKzHVVVtCppyewTx4vcs24MBWHNAriWjB3d/9ImJXCQfUl
         Pe0BBQbKv88Za1OhS8NSdJvwiPyErXPEAhn2nGIaU9P5qEPnQqT8ioBohvcguXbYGsX/
         tiKP+Q1/SxI/T2D/UqGrx7fusnbxIbPIxII3aJdW/0nANPtDyv4P7zIYiiuQqfWnIsB4
         o5ng==
X-Gm-Message-State: AO0yUKUEwR8MMNdinkZtqWxGZ5HfU3WClH/Umcx21NeSDpFirZsyFeHG
        8QGe4/6mHUylIFW8YTKmEUtmPQ==
X-Google-Smtp-Source: AK7set/8wu6gTQyH8qNsDqPt4F0vVoW7STePOGp+0cBDL/CDwLG1WYBxUyxOPNd0025L/PLwyYJYhQ==
X-Received: by 2002:a5d:4381:0:b0:2ce:a8e2:f89e with SMTP id i1-20020a5d4381000000b002cea8e2f89emr12788838wrq.46.1679327337601;
        Mon, 20 Mar 2023 08:48:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d7d9:4f38:38b4:82b4])
        by smtp.gmail.com with ESMTPSA id o6-20020adfeac6000000b002c71a32394dsm9202578wrn.64.2023.03.20.08.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:48:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 07/15] arm64: dts: qcom: sa8775p: add support for the on-board PMICs
Date:   Mon, 20 Mar 2023 16:48:33 +0100
Message-Id: <20230320154841.327908-8-brgl@bgdev.pl>
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

Add a new .dtsi file for sa8775p PMICs and add the four PMICs interfaced
to the SoC via SPMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)
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
-- 
2.37.2

