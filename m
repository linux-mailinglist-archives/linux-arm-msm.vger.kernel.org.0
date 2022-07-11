Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E0556D803
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 10:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbiGKIb1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 04:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbiGKIbA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 04:31:00 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DB31F2D8
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 01:30:52 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id v7so2127894pfb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Xc6Xh3o4q11+QtmcpjwpXfbGTOkena0cZoEMXbSHLw=;
        b=Fze5rPjfeIGk/niSbM0yaVUZm+dGq3XQi7PJ1fBajKrvWL0BS/GBXD/G7GtUxI2FIZ
         nQZab7PbfmcxbZHzdcMIbVQXH8SYDoRZwHmlTrelQDo/EJdaOMPkEFM9bDg2CN7ehBxk
         83g9ppMQcxmy/wRrT6xCUFWU5eVVopGO2DvB/306nrjH+yTaXClI3R5tjjTyo8n6Z6uX
         AOhlQDzU02BEsSU03ddEah/SFtKNf2NDevUzoZJp5IAvsQ7+Xpr5GRj6tDlbTVwZr78A
         dwrJ9VxgeYYecsJXHe//yOEpun52w8bewpa+DZnPOV1+kG2EFO/BR0e9BFNyNK089cDi
         uN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Xc6Xh3o4q11+QtmcpjwpXfbGTOkena0cZoEMXbSHLw=;
        b=JF5qKaBhYUiL1n2HPXN1d8KIJiXdN4boPc2JHFY6HYU/gzcKaJjvtnBJgGN8fD044b
         7eiyBWi6+ht7ujibyaN821+42QJ8dC8x7i5LOgDzNL8yTeMvIbrxhyyDARbOEVn6pMYx
         KhgnSu9DcS0VWiFUgculV7BSzibukO4V0ZERJY2gHBcjXz5lKP8dnUxTvio84IjvtziG
         x52aGyWLaomfk7GVEdkBvgkflYj9WmRfeAWEDV2EQ7y2ZCW75vr4wZSn1Q7mqNLzwiDr
         zbwxoXbSX393AMHcc6bC2cGsCNy4Rhkbv3HV4TnbRvrQD9Z0QypIrbCzd7Aa3VVMXdgm
         RPQg==
X-Gm-Message-State: AJIora/F49Gus0euKgxnFocA1mrzbP2jS5ptqBY1Va3pGxkH0A09ZVxp
        6J9zeWSn9pwTRv4AC1P/H06Sm7Slbt5s3A==
X-Google-Smtp-Source: AGRyM1vK5m4AuFpwElO7081SMHDCqMErC3BDjHKiTOEKoDA2tpoeF1r0TmZ2VXVXz/9MzRvCaRtGfA==
X-Received: by 2002:a63:194c:0:b0:408:a9d1:400c with SMTP id 12-20020a63194c000000b00408a9d1400cmr15232455pgz.559.1657528251757;
        Mon, 11 Jul 2022 01:30:51 -0700 (PDT)
Received: from localhost.localdomain ([182.77.21.191])
        by smtp.gmail.com with ESMTPSA id w14-20020a1709027b8e00b0016a4db13435sm4067118pll.191.2022.07.11.01.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 01:30:51 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org,
        nicolas.dechesne@linaro.org, mworsfold@impinj.com,
        daniel.thompson@linaro.org, andrey.konovalov@linaro.org,
        Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2] arm64: dts: qcom: qcs404: Fix incorrect USB2 PHYs assignment
Date:   Mon, 11 Jul 2022 14:00:38 +0530
Message-Id: <20220711083038.1518529-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
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

Currently the DT for QCS404 SoC has setup for 2 USB2 PHYs with one each
assigned to USB3 controller and USB2 controller. This assignment is
incorrect which only works by luck: as when each USB HCI comes up it
configures the *other* controllers PHY which is enough to make them
happy. If, for any reason, we were to disable one of the controllers then
both would stop working.

This was a difficult inconsistency to be caught which was found while
trying to enable USB support in u-boot. So with all the required drivers
ported to u-boot, I couldn't get the same USB storage device enumerated
in u-boot which was being enumerated fine by the kernel.

The root cause of the problem came out to be that I wasn't enabling USB2
PHY: "usb2_phy_prim" in u-boot. Then I realised that via simply disabling
the same USB2 PHY currently assigned to USB2 host controller in the
kernel disabled enumeration for USB3 host controller as well.

So fix this inconsistency by correctly assigning USB2 PHYs.

Fixes: 9375e7d719b3 ("arm64: dts: qcom: qcs404: Add USB devices and PHYs")
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v2:
- Update commit message description.

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 513bf7343b2c..50edc11a5bb5 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -557,7 +557,7 @@ usb3_dwc3: usb@7580000 {
 				compatible = "snps,dwc3";
 				reg = <0x07580000 0xcd00>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb2_phy_sec>, <&usb3_phy>;
+				phys = <&usb2_phy_prim>, <&usb3_phy>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,has-lpm-erratum;
 				snps,hird-threshold = /bits/ 8 <0x10>;
@@ -586,7 +586,7 @@ usb@78c0000 {
 				compatible = "snps,dwc3";
 				reg = <0x078c0000 0xcc00>;
 				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb2_phy_prim>;
+				phys = <&usb2_phy_sec>;
 				phy-names = "usb2-phy";
 				snps,has-lpm-erratum;
 				snps,hird-threshold = /bits/ 8 <0x10>;
-- 
2.25.1

