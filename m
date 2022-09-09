Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6BD5B3388
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 11:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbiIIJVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 05:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232165AbiIIJVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 05:21:04 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171D0FA693
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 02:20:54 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id u18so1652782lfo.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 02:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qaIdW5O82kxfv9Y1sMxSlPwy2QYyGigvAsH9y7GzQoA=;
        b=Pe3F5Tr2dNQAdLyzJ1lLZktvkaHOHP0Jf8F52iT+MUTkPp1C8mfc2+Khy3GIac1FOB
         uqiUeVjkOHU7C3I9RwqEArSUJWq5mNXnOYhtuIfczzGqZae881jH7xWJD39w7jFCwZY3
         VjRhIJs3B1Bc5BXYmgyKjQh/oFEJ9f8XqyEZgSPNQzxhIzOVLUgCvSX/hlOi3QdUaJ/p
         R9VGxkL5c9iHP2Ng97Wga/KIAblOlldkWykuZMsxpNdX7ngpKwjjJH6n6YyjSwlZQGnv
         XHmCZoXV4hSXDPpAAOvDbWwJ4AXkE2ZLjHdUtj4ti64HdrMwbaCBYZnKs8SIn5BLiLrx
         4rwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qaIdW5O82kxfv9Y1sMxSlPwy2QYyGigvAsH9y7GzQoA=;
        b=YjZ4XUDvQjUi9ItxnG+nQbeWZForjGBHklz7iNts2sq1FSZ/Fz4GkgMuhEQuG6I/nW
         tfMB6Hq8sV9kpkStCpRSTn8CYi+ZtJBe5PWco96Lk+TUUqp2aka2CdhqpADOC6nEW/xg
         73wdEVU/Dk5D+BMXuh2KU6LgK3+uWgsEQb+BYP/2eIBNef/zqgbj0RXlpUc6/IJQR0ek
         dd13OGHlqiUX7ylMOz7vIDe+P2UVO9bDIzKaLG1k4igrmM1o9aFpb61uBjO8jV9rL19o
         CSpCy08ZLi3uO3FLG5Q7uYsS3QPCpO7G7DWUTHowW81XLhBWPw3wJxbx6I3etHPzFCpc
         sFXw==
X-Gm-Message-State: ACgBeo1GQaudDassDaHFqckE6DCDL+hzDdaF74iWFNACw3z8mcGr8j6G
        zML8ZhCnJcZZVU9BwhPXOOM3eQ==
X-Google-Smtp-Source: AA6agR44fDvYIbtoSOS3Rc2m+6bRAMcMfqh0zcGzhgGVy9VEv5JpTdbOa281M6k2+ZgGXHNw0eybTw==
X-Received: by 2002:a05:6512:1052:b0:498:f8d8:f74 with SMTP id c18-20020a056512105200b00498f8d80f74mr653860lfb.683.1662715254298;
        Fri, 09 Sep 2022 02:20:54 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b00498fe38ea0fsm2170lfr.174.2022.09.09.02.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:20:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 11/15] arm64: dts: qcom: ipq6018: switch TCSR mutex to MMIO
Date:   Fri,  9 Sep 2022 11:20:31 +0200
Message-Id: <20220909092035.223915-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
References: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
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

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom/ipq6018-cp01-c1.dtb: hwlock: 'reg' is a required property
  qcom/ipq6018-cp01-c1.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 6b35f03c4862..a7c7ca980a71 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -129,12 +129,6 @@ scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x80>;
-		#hwlock-cells = <1>;
-	};
-
 	pmuv8: pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
@@ -252,9 +246,10 @@ gcc: gcc@1800000 {
 			#reset-cells = <1>;
 		};
 
-		tcsr_mutex_regs: syscon@1905000 {
-			compatible = "syscon";
-			reg = <0x0 0x01905000 0x0 0x8000>;
+		tcsr_mutex: hwlock@1905000 {
+			compatible = "qcom,ipq6018-tcsr-mutex", "qcom,tcsr-mutex";
+			reg = <0x0 0x01905000 0x0 0x1000>;
+			#hwlock-cells = <1>;
 		};
 
 		tcsr: syscon@1937000 {
-- 
2.34.1

