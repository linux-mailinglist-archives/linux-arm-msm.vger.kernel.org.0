Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE9394FA9B6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Apr 2022 18:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242759AbiDIQsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Apr 2022 12:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242762AbiDIQsL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Apr 2022 12:48:11 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554D599696
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Apr 2022 09:46:04 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id s28so1242344wrb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Apr 2022 09:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jDJXVqRnHQKPHD8kA15Bj0py2ulSvTzcYuA88kraYds=;
        b=SRCLo+zVnn4lNeTUSMwWiwKYsmlNghVcSe9a8/I2gDD9334DgfYz9mxwwYMmxJ3usN
         DfGEFnQpbf9YNu5cMRVPqQr9BeC7jTs1SYy02X8jEdN5GLl2m+JCPqMzWJJ2F31HIvQ+
         xj1KTrgihf78UFaS+ZWdI90c6xNjj0l401bJLvcmCQIOsl9t47McaPM3BukHfbYjARE9
         fnR3ER/QT3J0tqzMs4VZ3oeEEHSO6MF/ncnJT7znO0bDqbAa36/oxB/20GiGi8YwQQc4
         HL/F1TtnL2Zpue0Wf3BqrSmK43wivF9DwbdVupLmazkAWIPp6CQPNzejACedX0edBj4H
         TMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jDJXVqRnHQKPHD8kA15Bj0py2ulSvTzcYuA88kraYds=;
        b=myNfjQ8tQMhk5jTy+uRpEuw5VoFqvJXEvmMDDCvtdejsDNThQ5+pbz+mkSFjGfHcWn
         fMvHV4eSRlMDvCQ/ENraKOmT8FhtPcL0uzId2nHRCe1dMcgDkxMjFtz6oFMr0rPvPbdL
         EvC6S3AUi6nCSAkI3ja607s7fz+VYhsabZETs2XNd7OOXuSq8qAoFhv95Wru7WgAfNvh
         QZqRmnrLp3JbocnULyovs7/Op/NmpOYa18dxLKB/Ty+rAVfyrIdfzuL1JbhZaN32C6TB
         t8KiWZCMsxyFjk5XXGEfx30AJ2JVQbIxfgQcPJZy99vY1WzWld87Z0gq4pGXlyK6IXdA
         a9wQ==
X-Gm-Message-State: AOAM533DdQqon5kZv22M5krIKFEw0JRFMhQs4+Ww8w8bA1HX8V2lXptI
        /1qLJYKpuIrMLpBrUehGnjvFjA==
X-Google-Smtp-Source: ABdhPJxIOrJpxcCprwDwc94ksJ6j0Y/EBAJV819QAUcCo9i5ixOzW1fV0Ov2zlN+GEwoJTN5b8HFiQ==
X-Received: by 2002:a5d:5482:0:b0:206:b5c:ef4d with SMTP id h2-20020a5d5482000000b002060b5cef4dmr18509764wrv.152.1649522762865;
        Sat, 09 Apr 2022 09:46:02 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j3-20020adfd203000000b0020616cddfd5sm13901357wrh.7.2022.04.09.09.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 09:46:02 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 4/4] arm64: dts: qcom: sm8250: camss: Add CCI definitions
Date:   Sat,  9 Apr 2022 17:45:56 +0100
Message-Id: <20220409164556.2832782-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409164556.2832782-1-bryan.odonoghue@linaro.org>
References: <20220409164556.2832782-1-bryan.odonoghue@linaro.org>
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

sm8250 has two CCI busses with two I2C busses apiece.

Co-developed-by: Julian Grahsl <jgrahsl@snap.com>
Signed-off-by: Julian Grahsl <jgrahsl@snap.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 82 ++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 91ed079edbf7..98e96527702b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3150,6 +3150,88 @@ videocc: clock-controller@abf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac4f000 {
+			compatible = "qcom,sm8250-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <0 0x0ac4f000 0 0x1000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac50000 {
+			compatible = "qcom,sm8250-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <0 0x0ac50000 0 0x1000>;
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK_SRC>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci",
+				      "cci_src";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&cci2_default &cci3_default>;
+			pinctrl-1 = <&cci2_sleep &cci3_sleep>;
+
+			status = "disabled";
+
+			cci_i2c2: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c3: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
 			status = "disabled";
-- 
2.35.1

