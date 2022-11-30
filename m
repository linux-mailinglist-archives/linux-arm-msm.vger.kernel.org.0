Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6173D63D3B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 11:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiK3Kpt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 05:45:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbiK3Kpt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 05:45:49 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AD55EFBB
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 02:45:48 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id t17so15314733pjo.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 02:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CWkLpPEq2gVXtRl771foWiTd76LStnIAXpLqiAwtIew=;
        b=UWZDWRr2GVUKW/3md70o/3LfYk0B0WBjLBQoAr5wXn086Gu9AA+rE6TAwbltQhHWWc
         VxDt+QXuvxmmmFGfu4jqxOPuhB1zm2Uf4xIS5Rdj+C4s1rKCUOiU/oj6GG9WXicDh7Wh
         6SFLfjpNVRHvInPfgAuzZJun0Cu0cAAm0FRrEv7fWtmplRH8CzD2oTHPQbu/ClOoJrLI
         xGCftMCmyO28CUbNcSTnOwAoa8SZsAPQqCZs1YD4jQpmiwQveUIvcbLmiFq+3aMwsHgO
         7jquLOQJGgzDtG22U6Sf9y2zNnexKq2F6JdhgEGjUK9aeXaEW5krPxhXNfLyywq0QI8Q
         pqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWkLpPEq2gVXtRl771foWiTd76LStnIAXpLqiAwtIew=;
        b=wsQ/hLQNWCjReXUo7I6wPRAFooZf0VKO09tGboNC/B6w2TyUtiixQ38scyNWE7VOuP
         qJsrIkALdnFg4vANNvHOGRZAPFSMS7Xz8z/KnRMm7Pruz6Gk1e0RY7aBBoCgqvAGrUO+
         jsbD/4uMGRXdaI2ikNIinabt3h9T457d/yWBWcPnG6b/G/EOmkgXJ61MdllQ8aAgIc90
         9Bc3t/3e6+ykK5kpTNkPFmaOOO+VpCbiCA5YLjJUJ28liOJb3lZ4gdpGNIt2GU8iVaK+
         v1Y5Dox4anoJUsUObDaWM9BWkGrYgVdXmt2Nd2UlJ4z19SkV2+wMQlDeEUnSR0dRyjV2
         NFgA==
X-Gm-Message-State: ANoB5pkIHxcrecK/wbWqHRKDYs4JL4i+uvoWgUI1stuP4YmC/nlG4fZC
        l36sH04GjbI+Y9zEXvc3FX2VxBwU+ii/MA==
X-Google-Smtp-Source: AA0mqf4POs9aDlAw5FsEoA4DeXwQubz3OuXbZNblhgs2jL8Df637+WYaLYCGrsKwMAuPWF4q9undWw==
X-Received: by 2002:a17:903:2112:b0:186:67b0:afab with SMTP id o18-20020a170903211200b0018667b0afabmr41776660ple.17.1669805147451;
        Wed, 30 Nov 2022 02:45:47 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c5f:27a2:d13a:7614:addb:b29d])
        by smtp.gmail.com with ESMTPSA id v30-20020aa799de000000b0056b3c863950sm1121696pfi.8.2022.11.30.02.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 02:45:46 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, konrad.dybcio@linaro.org,
        a39.skl@gmail.com, andersson@kernel.org
Subject: [PATCH] arm64: dts: qcom: sm6115: Add interconnect nodes
Date:   Wed, 30 Nov 2022 16:15:19 +0530
Message-Id: <20221130104519.2266918-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
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

Add the interconnect nodes inside SM6115 dtsi.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
- Based on linux-next/master
- Depends on the SM6115 dt-binding and driver patchset, which can be
  seen here: https://lore.kernel.org/linux-arm-msm/20221130103841.2266464-1-bhupesh.sharma@linaro.org/ 

 arch/arm64/boot/dts/qcom/sm6115.dtsi | 51 ++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index e4a2440ce544..dad5ab3edf0e 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -485,6 +485,57 @@ usb_1_hsphy: phy@1613000 {
 			status = "disabled";
 		};
 
+		snoc: interconnect@1880000 {
+			compatible = "qcom,sm6115-snoc";
+			reg = <0x01880000 0x60200>;
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
+				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
+
+			clk_virt: interconnect-clk {
+				compatible = "qcom,sm6115-clk-virt";
+				#interconnect-cells = <1>;
+				clock-names = "bus", "bus_a";
+				clocks = <&rpmcc RPM_SMD_QUP_CLK>,
+					 <&rpmcc RPM_SMD_QUP_A_CLK>;
+			};
+
+			mmnrt_virt: interconnect-mmnrt {
+				compatible = "qcom,sm6115-mmnrt-virt";
+				#interconnect-cells = <1>;
+				clock-names = "bus", "bus_a";
+				clocks = <&rpmcc RPM_SMD_MMNRT_CLK>,
+					 <&rpmcc RPM_SMD_MMNRT_A_CLK>;
+			};
+
+			mmrt_virt: interconnect-mmrt {
+				compatible = "qcom,sm6115-mmrt-virt";
+				#interconnect-cells = <1>;
+				clock-names = "bus", "bus_a";
+				clocks = <&rpmcc RPM_SMD_MMRT_CLK>,
+					 <&rpmcc RPM_SMD_MMRT_A_CLK>;
+			};
+		};
+
+		cnoc: interconnect@1900000 {
+			compatible = "qcom,sm6115-cnoc";
+			reg = <0x01900000 0x8200>;
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_CNOC_CLK>,
+				 <&rpmcc RPM_SMD_CNOC_A_CLK>;
+		};
+
+		bimc: interconnect@4480000 {
+			compatible = "qcom,sm6115-bimc";
+			reg = <0x04480000 0x80000>;
+			#interconnect-cells = <1>;
+			clock-names = "bus", "bus_a";
+			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
+				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
+		};
+
 		qfprom@1b40000 {
 			compatible = "qcom,sm6115-qfprom", "qcom,qfprom";
 			reg = <0x01b40000 0x7000>;
-- 
2.38.1

