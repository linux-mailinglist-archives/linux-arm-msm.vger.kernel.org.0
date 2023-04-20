Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1F8C6E8B72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 09:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234103AbjDTH2w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 03:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234057AbjDTH2v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 03:28:51 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2B635AA
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:28:22 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id u3so4100871ejj.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681975693; x=1684567693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gylQokwHrbKYZEvA2K7+6XwCFe14DDzlgchEo04KvA=;
        b=PutHU7bS6zImLQPyXAcvT5qTwrDitmhfAm5VM1+biikonfodBkAl+VjkfwYnfuDbnr
         8DABuf5pRWz4qsEN5FJr/iEZW/KlsYhRmn7Apoj12ZPet64lIiCBhz8KDwA3PLzGuTwf
         ZOtuwuGepUi9L22adCrN1IVo8Q4r5vfmiIb7RqpHG5yzZkc5LfDuqnwFpN8CeTOLP2pI
         UdAzq7jL2e73KouKLIjISvE2g5W3gNBMKpN3LCCqnDuZ6np0h/opk1L2+gzWfegQJOvt
         Ak3rVuqinaeEcG3E8tT6KeMnXd7bz2hZpwYPAr9bf6beTjSDMfsNTLEmYq65ikpAimQ1
         xeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681975693; x=1684567693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gylQokwHrbKYZEvA2K7+6XwCFe14DDzlgchEo04KvA=;
        b=JVRsdDG7j1YwOBv+cSNxpGSSPzQojAIriThiHbYUiguX3I6D5R3TvmKvXesVnWybyP
         08uA0v9Ze4NfJLfWFmgDcNNmZF0oNkys+S+orEHgvASnXxgLG6kKh3n/QdX5RPc8aEoz
         m/5Sqd+1JgO2OML5oRQzYs/ebyPYAm7K4alIp/MgA3PD3vzEsi+nlwGtMhJkFn5G2U2W
         zh71Jk3Zwggyq36nbV3RZth4QA4jXEoER7CTH6k9yTRTUAlw803vvwAh3Fcu2B5WcSZC
         we516ChsDcMaTUGcKX8HAjuyY2KPY57ygLYtCQMTBPtDhfb/6ArJhq+H4+O8u+wF9rMR
         6P5g==
X-Gm-Message-State: AAQBX9co1HXWdgsheDn/vznjb6VwxIbXvPna1DGcJ5M1D6G860KADuax
        HomxsVwfjZ6aXP/ZQnaPBavVfA==
X-Google-Smtp-Source: AKy350Z2Pe07K6VAQBdXbOWfVpcV85qsOc3+ruWuxMJ8aAHh/6Nhgchll3UoLIwNDYYAPVPdf4QCtg==
X-Received: by 2002:a17:906:1055:b0:94f:6218:191e with SMTP id j21-20020a170906105500b0094f6218191emr517129ejj.20.1681975693177;
        Thu, 20 Apr 2023 00:28:13 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id oz5-20020a170906cd0500b0094f58a85bc5sm390396ejb.180.2023.04.20.00.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 00:28:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: ipq4019: fix broken NAND controller properties override
Date:   Thu, 20 Apr 2023 09:28:11 +0200
Message-Id: <20230420072811.36947-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After renaming NAND controller node name from "qpic-nand" to
"nand-controller", the board DTS/DTSI also have to be updated:

  Warning (unit_address_vs_reg): /soc/qpic-nand@79b0000: node has a unit name, but no reg or ranges property

Cc: <stable@vger.kernel.org>
Fixes: 9e1e00f18afc ("ARM: dts: qcom: Fix node name for NAND controller node")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts |  8 ++++----
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi   | 10 +++++-----
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi   | 12 ++++++------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts
index 79b0c6318e52..0993f840d1fc 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c1.dts
@@ -11,9 +11,9 @@ soc {
 		dma-controller@7984000 {
 			status = "okay";
 		};
-
-		qpic-nand@79b0000 {
-			status = "okay";
-		};
 	};
 };
+
+&nand {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
index a63b3778636d..468ebc40d2ad 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
@@ -102,10 +102,10 @@ pci@40000000 {
 			status = "okay";
 			perst-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
 		};
-
-		qpic-nand@79b0000 {
-			pinctrl-0 = <&nand_pins>;
-			pinctrl-names = "default";
-		};
 	};
 };
+
+&nand {
+	pinctrl-0 = <&nand_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi
index 0107f552f520..7ef635997efa 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1.dtsi
@@ -65,11 +65,11 @@ i2c@78b7000 { /* BLSP1 QUP2 */
 		dma-controller@7984000 {
 			status = "okay";
 		};
-
-		qpic-nand@79b0000 {
-			pinctrl-0 = <&nand_pins>;
-			pinctrl-names = "default";
-			status = "okay";
-		};
 	};
 };
+
+&nand {
+	pinctrl-0 = <&nand_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.34.1

