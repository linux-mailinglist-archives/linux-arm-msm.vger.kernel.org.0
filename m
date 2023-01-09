Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E50F66241B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 12:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234847AbjAILWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 06:22:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234699AbjAILW3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 06:22:29 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10EA3183AE
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 03:22:27 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so6398499wms.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 03:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gSDnx7XwWvncd7SQtw1TJ7yLjFxBlIdm/bLYPpk1EZk=;
        b=w80RKRVtgiVEPsAp22l0W28DLBW5HopDWSqfkWy1ZKW/lYZcS+tWTzf2V6OLiwOSd6
         xkISqVVl1RnoSfG6eetGlvMRPhbp2yEBpWury5vvOV1585DCNfFZFt9GBbW89Sa2GzGX
         8GQbxPpmYEmI10S0YONWTrNZTZKSuCJ1TAYmLbHp21bQlpqOdjqj0Nx+rjiS+UHBlU0V
         cD3ZWbPvOvIiSXhj3cDbc6agKrdh/OwYjy59BQ2Eo4ZDwuGelPx/fudBtMJMbepg8w24
         jmBmEf2GXqAHd0+AWVaCWbdgLiMsTJHJ/XIcRCAuqIG1+ZWStbWfAHv3e35Sq+3PeNfV
         0u3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSDnx7XwWvncd7SQtw1TJ7yLjFxBlIdm/bLYPpk1EZk=;
        b=Tb0ZNTI3otLDx7ct3a2zEcAMcCRPk7wOg9EpoEt1babUcrPbSn8SjEZAoQK0xSw6uE
         UzpV4Q8L9eDm5u1qaqPzVuGav20Ol3TAzXrgFdgFeiKTnDZadNoXvsRVeZ2vCe38OafQ
         L74U5O3J1oWl35I6JGf3U5G5B6Zb1B3J9NEqAdPG2mGFpW21nR7NTtetNe7ISvddna9H
         7ciJb0yOne0LrMa2cNP5juTwZjncx9OU4bQ4VGtAAqYHc3RIgmi/ouBfTK0O4+CCyZJq
         CDV81T89z7g5vnZ367bQM5+jHxRX9ZVcX+aPSysFpkglZtNlPl2swxvsiGF4ttP+2dpZ
         qQfA==
X-Gm-Message-State: AFqh2krYDsh0hROILSu3+1MrlQ3U/UDGxPb27vzpprGjPvWLDZOBGAoa
        B9UUa5mcqL9ZHm8mMw+uir6s2w==
X-Google-Smtp-Source: AMrXdXv5dFCXzOuPJ7DUuslkz76cxLrSMNhrbchJ8eFnG02OjsAKbLQmdbbeIXQASLbAZmX58XfrTw==
X-Received: by 2002:a05:600c:510b:b0:3d2:392e:905f with SMTP id o11-20020a05600c510b00b003d2392e905fmr46597209wms.24.1673263345614;
        Mon, 09 Jan 2023 03:22:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n14-20020a05600c3b8e00b003b49bd61b19sm17456986wms.15.2023.01.09.03.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 03:22:25 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/4] ARM: dts: qcom: align OPP table node name with DT schema
Date:   Mon,  9 Jan 2023 12:22:18 +0100
Message-Id: <20230109112221.102473-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Bindings expect OPP tables to start with "opp-table".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Changes since v1:
1. Add tags.
2. Re-order nodes
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 14 +++++++-------
 arch/arm/boot/dts/qcom-sdx65.dtsi | 26 +++++++++++++-------------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 5408ff715fbf..a9433d1e4f54 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -62,7 +62,13 @@ cpu0: cpu@0 {
 		};
 	};
 
-	cpu_opp_table: cpu-opp-table {
+	firmware {
+		scm {
+			compatible = "qcom,scm-sdx55", "qcom,scm";
+		};
+	};
+
+	cpu_opp_table: opp-table-cpu {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -87,12 +93,6 @@ opp-1555200000 {
 		};
 	};
 
-	firmware {
-		scm {
-			compatible = "qcom,scm-sdx55", "qcom,scm";
-		};
-	};
-
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
index d3c661d7650d..619cafb6d9b3 100644
--- a/arch/arm/boot/dts/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
@@ -61,7 +61,19 @@ cpu0: cpu@0 {
 		};
 	};
 
-	cpu_opp_table: cpu-opp-table {
+	firmware {
+		scm {
+			compatible = "qcom,scm-sdx65", "qcom,scm";
+		};
+	};
+
+	mc_virt: interconnect-mc-virt {
+		compatible = "qcom,sdx65-mc-virt";
+		#interconnect-cells = <1>;
+		qcom,bcm-voters = <&apps_bcm_voter>;
+	};
+
+	cpu_opp_table: opp-table-cpu {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -86,18 +98,6 @@ opp-1497600000 {
 		};
 	};
 
-	firmware {
-		scm {
-			compatible = "qcom,scm-sdx65", "qcom,scm";
-		};
-	};
-
-	mc_virt: interconnect-mc-virt {
-		compatible = "qcom,sdx65-mc-virt";
-		#interconnect-cells = <1>;
-		qcom,bcm-voters = <&apps_bcm_voter>;
-	};
-
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.34.1

