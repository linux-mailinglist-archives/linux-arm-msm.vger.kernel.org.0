Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 349BE517797
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 21:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233698AbiEBTzI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 15:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbiEBTzH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 15:55:07 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C72626F
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 12:51:36 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id h29so19788590lfj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 12:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ENI/MbH3Fn43yNutcQpijgaoP2IusN4pnMD5qb0Zyo=;
        b=dH534EbosmYHMygqOOpzVxmV/zxTM8ei4M3mB6vZ1kDQ5GwOtytLcnW6Ra+51Fg52W
         e9fe7ivItBRDIPSg1+BRL/VYGHi2syfmA2i0cokcJ6cQhCsXFAXBKPBJJTkrGTr6YNU9
         85+8BFCWKVcWPt6puvK43gdTYO2m3aMyTNnXIDXprMO40RcT26I161OuQUbWMMDPXC82
         5ycXJM1xXxnq2LgN29GIhRdOwzf79nKRbQbKdHMx6UHn0lae0sG6zvyx8zpbOAoD9/MF
         mzKKd9VEtJn0KPWWmAc05HNEnIbwJnikH1S2B40QxrZV3M1NouXV2+rznLWTmv7AFcdm
         RRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8ENI/MbH3Fn43yNutcQpijgaoP2IusN4pnMD5qb0Zyo=;
        b=NIVUzC3eHKEHGVvlcdn37FtRDy3nC/5QMIl2BMORYMaPAIAooiqT328CkC1QGSfbfw
         QjAESxeT+f1z2QJ6eVSJO62un8ymQe2fDM8bn2VHcQzh4h2+7RYbv994ozvimQy9CfAp
         pYMvJUyElGgAxr3gN0GekzVTk84giOih4ZwpYeZQ9HzMlVxtfDb4CDS76JAt7UUGyyGU
         0EqQH9FmiWwOdU5XYzc/OHaj4wZYHVxh8qgbjfikx5LY1rlN+xv5YGhy8PqnHEl7SDOR
         J2mdrMygRaAZW3Y/eZlW/zlMWvrWHQpBQCuOKXjFzrcdYNd01IWmUS8N1MNr395Cka1e
         /MlA==
X-Gm-Message-State: AOAM532GlqJOk4dr9R7AEI3DjZO+VuM/BnGVOILjxPfNYxFV/VdA7T5q
        or8NkQWBJqgZdQeKIwQsa6z4Eg==
X-Google-Smtp-Source: ABdhPJxZTJdvJkGWiOai9s3Z7QYNCm1G8JtMrioollOunDpuPUrUJ6+iNksV+Omv8AgUZ64G6tHTxg==
X-Received: by 2002:a05:6512:33c8:b0:473:9d8f:a01b with SMTP id d8-20020a05651233c800b004739d8fa01bmr4213589lfg.619.1651521094536;
        Mon, 02 May 2022 12:51:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22-20020ac25496000000b0047255d211f3sm777667lfk.290.2022.05.02.12.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 12:51:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v2] arm64: dts: qcom: sm8450: add uart20 node
Date:   Mon,  2 May 2022 22:51:33 +0300
Message-Id: <20220502195133.275209-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree node for uart20, which is typically used for Bluetooth attachment.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
 - Fixed the order of dts nodes
 - removed extra mux level from the pinctrl definition.
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 7f52c3cfdfb7..9c69856307c8 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -976,6 +976,19 @@ i2c20: i2c@894000 {
 				status = "disabled";
 			};
 
+			uart20: serial@894000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00894000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart20_default>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			spi20: spi@894000 {
 				compatible = "qcom,geni-spi";
 				reg = <0 0x00894000 0 0x4000>;
@@ -2738,6 +2751,12 @@ qup_uart7_tx: qup-uart7-tx {
 				drive-strength = <2>;
 				bias-disable;
 			};
+
+			qup_uart20_default: qup-uart20-default {
+				pins = "gpio76", "gpio77", "gpio78", "gpio79";
+				function = "qup20";
+			};
+
 		};
 
 		apps_smmu: iommu@15000000 {
-- 
2.35.1

