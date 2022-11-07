Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66BEA61F6D2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 15:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232696AbiKGO40 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 09:56:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232617AbiKGOz5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 09:55:57 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101EC1E3D9
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 06:55:44 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id t25so30784341ejb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuX6KaudmQsn2rPeSIOs44P/XRafMRrl0nWAlEjY1QQ=;
        b=qUvi/WW4l6eZKvg6CoVOWpUhUryY17EtC9VmpANw26S+Gm3H03up6n+Dtmb+2czWmL
         A/1ImnD1qaTHLWGKEeSPCO66q1VdqCxDo0dV+iyXccODR8R52SEP/WULvylEtOpgMTs6
         ywzHaNO5Wh4f0QrpAHajiDzH0IvLUn4Y1JkLU4HQtuejvRBMDqlcfrHXvEQltzqaCtLm
         6M4f4YKLizDNyq66JIANfzWwmkGoGJKTst9AgJolQoH2boph/EVWvvKR/2K4n92pMZx/
         l/jjvipyCE+vSVhzVTI5uUrfvfKunQvZNSnMXROWd+LiFNyZEeyLnQJfE+W22saAq9QF
         zOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuX6KaudmQsn2rPeSIOs44P/XRafMRrl0nWAlEjY1QQ=;
        b=pgS+puBZzVNLrjk5lMZxDX7NDyCc/nSRKEoDODTsAbxaVxAK+VCxjgJP3kMWzjOnWG
         jfJna5toxDhx8fcn3C3hKTWK3oXQJdP9KgGegZhpC+oF9jPa0/FaY5QB0q0Oj+IPc39X
         KG0+oC5R5SPQ0TE3QnrGTSdS+d4HEgnePlcNwQR8a8zKl/yAQXmrWjCvY4VDEQAWSNfe
         UQiaKH3r2ZfDJz+8uptxx4cmmc0vSYoskIh3vnXgwX5s2qnUg4YJf1DgAr4SLY+tXza6
         LfNhcF0QftnROSMXYVTeyIl2ZjdvFXBUUVgE8PqGbvSfyb+k7fTbV8hDqQfLmgibka35
         Py7w==
X-Gm-Message-State: ACrzQf3g8Bn63rNPSBNHwLb7D2ZEBa+GIZLIwFXXLCrD1n+aiFuZHn+E
        8LZFPy2X4t6e476nSqZ8kCfC2i7P3UBi532O
X-Google-Smtp-Source: AMsMyM4D4uwJQulwIbw6S5UCCU8M81PoQNr3dWDmRFTJw9rQ/h918nc8+RIVddulAPMpX0KSDrXhCQ==
X-Received: by 2002:a17:907:2da3:b0:7ad:ffba:a8e4 with SMTP id gt35-20020a1709072da300b007adffbaa8e4mr27651762ejc.684.1667832942315;
        Mon, 07 Nov 2022 06:55:42 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id d1-20020a1709067f0100b0078907275a44sm3503049ejr.42.2022.11.07.06.55.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Nov 2022 06:55:41 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] arm64: dts: qcom: msm8992-*: Fix up comments
Date:   Mon,  7 Nov 2022 15:55:18 +0100
Message-Id: <20221107145522.6706-9-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221107145522.6706-1-konrad.dybcio@linaro.org>
References: <20221107145522.6706-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make sure all multiline C-style commends begin with just '/*' with
the comment text starting on a new line.

Also, trim off downstream regulator properties from comments to prevent
them from accidentally landing into mainline one day..

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../dts/qcom/msm8992-lg-bullhead-rev-10.dts   |  3 +-
 .../dts/qcom/msm8992-lg-bullhead-rev-101.dts  |  3 +-
 .../boot/dts/qcom/msm8992-lg-bullhead.dtsi    | 41 ++++++++++---------
 arch/arm64/boot/dts/qcom/msm8992.dtsi         |  3 +-
 4 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts
index 7e6bce4af441..4159fc35571a 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dts
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) Jean Thomas <virgule@jeanthomas.me>
+/*
+ * Copyright (c) Jean Thomas <virgule@jeanthomas.me>
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dts
index e6a5ebd30e2f..ad9702dd171b 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-101.dts
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) Jean Thomas <virgule@jeanthomas.me>
+/*
+ * Copyright (c) Jean Thomas <virgule@jeanthomas.me>
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
index aef92f3c49da..87c90e93667f 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015, LGE Inc. All rights reserved.
+/*
+ * Copyright (c) 2015, LGE Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
  */
@@ -236,9 +237,11 @@ pm8994_l25: l25 {
 		};
 
 		pm8994_l26: l26 {
-			/* TODO: value from downstream
-			regulator-min-microvolt = <987500>;
-			fails to apply */
+			/*
+			 * TODO: value from downstream
+			 * regulator-min-microvolt = <987500>;
+			 * fails to apply
+			 */
 		};
 
 		pm8994_l27: l27 {
@@ -252,19 +255,19 @@ pm8994_l28: l28 {
 		};
 
 		pm8994_l29: l29 {
-			/* TODO: Unsupported voltage range.
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			qcom,init-voltage = <2800000>;
-			*/
+			/*
+			 * TODO: Unsupported voltage range.
+			 * regulator-min-microvolt = <2800000>;
+			 * regulator-max-microvolt = <2800000>;
+			 */
 		};
 
 		pm8994_l30: l30 {
-			/* TODO: get this verified
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			qcom,init-voltage = <1800000>;
-			*/
+			/*
+			 * TODO: get this verified
+			 * regulator-min-microvolt = <1800000>;
+			 * regulator-max-microvolt = <1800000>;
+			 */
 		};
 
 		pm8994_l31: l31 {
@@ -273,11 +276,11 @@ pm8994_l31: l31 {
 		};
 
 		pm8994_l32: l32 {
-			/* TODO: get this verified
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			qcom,init-voltage = <1800000>;
-			*/
+			/*
+			 * TODO: get this verified
+			 * regulator-min-microvolt = <1800000>;
+			 * regulator-max-microvolt = <1800000>;
+			 */
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 750643763a76..10adb4986ef1 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
  */
 
 #include "msm8994.dtsi"
-- 
2.38.1

