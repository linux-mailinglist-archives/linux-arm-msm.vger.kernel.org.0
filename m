Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAFB787A32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 23:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243649AbjHXVU0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 17:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243659AbjHXVUG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 17:20:06 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A78CF1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:04 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4ff9b389677so358225e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 14:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692912002; x=1693516802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzqcgcbIaMIUDZvRabJyNQlsi4CTBBIG6IN9KvgLsyc=;
        b=IkuwL7Imj55rPyJryvvOmTH1mgmJVPRT7xFcGHVIe6NzbWJey/PLLYUPsAhEL6uxqL
         3KC8VR8wMmskYnrczrOUapq7LRgaYkB8zbKrF2NjPITBUxJQaXN5dyUCpdaDOmfJsDyQ
         Un5OeYMvrISU6va2Ma37gwiAMevnjMudylFvcW0SRbGOlRXRudRYgQWLHgEFs8auNSmf
         FUS5JzPcSA+rV8bqMg4iDKMKFEF34BzhcpjSwl6hSFwKhaYwbRzga/7eVpupQJ/cDXQD
         8A54KIhZJF5TsftoDZJeGaDy1jgnd4GE59wkDlUtSgBsnE2yW0VnNz/GvyBgaDpMcoGh
         xVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692912002; x=1693516802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzqcgcbIaMIUDZvRabJyNQlsi4CTBBIG6IN9KvgLsyc=;
        b=PW/DUuk2ap8PWmtDl8AYtak+Oj0Qpq/35uDNXPrfLXvhFY7k1oS29cXWgNhplctt/4
         xrP+vUjFndKNtzbowrmB5/YiWuHYcLUfZMgUO82JFaVSp9eSgInE6Sn5W0SC52tl/pX1
         NJ2i3O1EDlKa3LtcOfFzitnJj8Nk6F/2/V806hy/aYBBJjF63g3GKLIZAxdMVwulrXwp
         kboxRTnwK0jiwN/ik7DhZQIXvFWCVO/nw7JXBqws5dDp0+M+flpDXRy7in1VF9Z0QGQb
         Ymf2DVir6ssJ+RQbgncLJkmDaaRdEvSvWc7s7Hqu5S5cTMh6PQJyN/cmc09hoXn9OnxV
         0Pzw==
X-Gm-Message-State: AOJu0Yx6dO/GAsjdoO2O+5LV4Hls0L+a3Exd+VWwAQUv6uAdcAAc7vuU
        hRJtXNL87N0Y/sf7R2qzKc6qcg==
X-Google-Smtp-Source: AGHT+IEmjUKELz71WH4BlPXR56Ns/EHmC7/jDyURzub2YR2qF9eQ/e2vAtdg4j6YqRWw1s5iFK69fw==
X-Received: by 2002:a19:5044:0:b0:500:91ac:c0b5 with SMTP id z4-20020a195044000000b0050091acc0b5mr5641682lfj.30.1692912002417;
        Thu, 24 Aug 2023 14:20:02 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j29-20020a056512029d00b004fe4ab686b4sm17690lfp.167.2023.08.24.14.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 14:20:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 10/16] arm64: dts: qcom: msm8998: switch USB QMP PHY to new style of bindings
Date:   Fri, 25 Aug 2023 00:19:46 +0300
Message-Id: <20230824211952.1397699-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
References: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the USB QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 35 +++++++++++----------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 30d8730fa4de..a0c797710239 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2138,7 +2138,7 @@ usb3_dwc3: usb@a800000 {
 				interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&qusb2phy>, <&usb1_ssphy>;
+				phys = <&qusb2phy>, <&usb3phy>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,has-lpm-erratum;
 				snps,hird-threshold = /bits/ 8 <0x10>;
@@ -2147,33 +2147,26 @@ usb3_dwc3: usb@a800000 {
 
 		usb3phy: phy@c010000 {
 			compatible = "qcom,msm8998-qmp-usb3-phy";
-			reg = <0x0c010000 0x18c>;
-			status = "disabled";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges;
+			reg = <0x0c010000 0x1000>;
 
 			clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
+				 <&gcc GCC_USB3_CLKREF_CLK>,
 				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				 <&gcc GCC_USB3_CLKREF_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+			clock-output-names = "usb3_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB3_PHY_BCR>,
 				 <&gcc GCC_USB3PHY_PHY_BCR>;
-			reset-names = "phy", "common";
+			reset-names = "phy",
+				      "phy_phy";
 
-			usb1_ssphy: phy@c010200 {
-				reg = <0xc010200 0x128>,
-				      <0xc010400 0x200>,
-				      <0xc010c00 0x20c>,
-				      <0xc010600 0x128>,
-				      <0xc010800 0x200>;
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_phy_pipe_clk_src";
-			};
+			status = "disabled";
 		};
 
 		qusb2phy: phy@c012000 {
-- 
2.39.2

