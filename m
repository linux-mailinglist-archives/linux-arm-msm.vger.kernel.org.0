Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4E7514EF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 17:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378206AbiD2PQr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 11:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378223AbiD2PQq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 11:16:46 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1022D4C53
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:13:26 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id p4so9504614edx.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u+4ICOXn1NGB+W/pvp37gYyyl9Rne1IW3j+B3PtGKuY=;
        b=tyXrIVQyP8BKE4Qeo30lYqIVIon4mWE2t5kV9pOrtLwaLoyHTez53dyMViCYWmHu7p
         x5a/+09Bp9WOjwDAVYZxss1lYvo6UC067Qq2x8L78yj3EXiSsCYgWYTImj6ryBEs8JTG
         0l9ey8acmSLT06FYVMfN8A9QO2gALRdUyT59vnF3VvB4JDdK9VFis9JiUm9YebGZCTp9
         5hGocKavutrSk+tOJiFP0CR7Cmlo3RvTdeZNREtG2p/5AHYG8/fW+WeozKwn8yWgvDrq
         /GF6RsUNoVg5pzTUaqlXLhHiAFDxlHdsvGeb+qyFN8gR3To5tSlcrihDE0yNR8N+9lMU
         4COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u+4ICOXn1NGB+W/pvp37gYyyl9Rne1IW3j+B3PtGKuY=;
        b=igS+ZjnztLewhZVHcFbwSEqIA1m9LBKwVvHEzy2Rk8yNPaURVDs5f4w9qRN9Jl/0oL
         j9KxMOjNlYekw0FGYJ3K96AJ7VkxETL73WIg6MOH0Wu4cbV19fpDnVRSN2mFDoOh1Mog
         0qbLbJwe8zwueEs7jY6WKS6SpmZR3bBii++7ge7Kwa7+xTIiQokAz2OIwt20qOfsJCNy
         D9hVUrpmlmE93GFOqdUaMWAIUj7nXti7S1mYIQ78zEeDJuY1MX16h7CwSsMw6iRL7dBR
         b4cctDUXc1REDG/40G6CA9XSKCfccDCbyCyaztGVtuFFNfXL1ppm3Vf9wfbgEuNpGuwP
         pBOA==
X-Gm-Message-State: AOAM533CufGu8BQqQIFA913R4t+4EwguXYVLEnZH3lxwuzIrJCq7Jdkj
        F1BDNpgcfGw8Y4KKGDLDksChJ7rr3kkjjg==
X-Google-Smtp-Source: ABdhPJw+elzBB9/MX2cnP6ewv0SbsAy9X4Mfsmi57vSFBLkyX4Fcklh/lfFAF3/6ySJ1aZFzru8d7g==
X-Received: by 2002:a05:6402:42d4:b0:416:5cac:a9a0 with SMTP id i20-20020a05640242d400b004165caca9a0mr41834497edc.86.1651245205335;
        Fri, 29 Apr 2022 08:13:25 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id zp15-20020a17090684ef00b006f3ef214e4esm712677ejb.180.2022.04.29.08.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 08:13:24 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v1 9/9] arm64: dts: qcom: sm8350: Add DISPCC node
Date:   Fri, 29 Apr 2022 17:12:47 +0200
Message-Id: <20220429151247.388837-9-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429151247.388837-1-robert.foss@linaro.org>
References: <20220429151247.388837-1-robert.foss@linaro.org>
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

Add the dispcc clock-controller DT node for sm8350.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c49735d1b458..252fdef927cb 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3,7 +3,9 @@
  * Copyright (c) 2020, Linaro Limited
  */
 
+#include <dt-bindings/interconnect/qcom,sm8350.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dispcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -2533,6 +2535,29 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sm8350-dispcc";
+			reg = <0 0x0af00000 0 0x10000>;
+			mmcx-supply = <&mmcx_reg>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			clock-names = "bi_tcxo",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "dp_phy_pll_link_clk",
+				      "dp_phy_pll_vco_div_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		adsp: remoteproc@17300000 {
 			compatible = "qcom,sm8350-adsp-pas";
 			reg = <0 0x17300000 0 0x100>;
-- 
2.32.0

