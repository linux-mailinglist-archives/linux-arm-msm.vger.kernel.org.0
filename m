Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E11A364B54F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 13:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234310AbiLMMlG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 07:41:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235068AbiLMMkU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 07:40:20 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 350171FCD2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 04:38:38 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d15so5858644pls.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 04:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKPVsv2TqsP8zux8ohBTaLzqLXnKFjC2mxPTp1lrDzo=;
        b=pRkn7CERucvFWodZldKONF9Sc3CWZ5+E2aWS2cNNcv38w0mNCRE0sMmaG2VaE/Kwvf
         viS3cXILhSRSGiOMd9Sxi9s+40tXTMfqfK3ZI+GeJ2rgsmxNmJvmcOS5gGc8t8xzUTeF
         p7q5bOYgnA0rv93Yalk1qWGktpGkJxSo2R/9Gtg14Njk7pqo3d3HHnxeQitdNfPLXBMn
         vsb+41wvux/AFaQm5vFVuX68M0pdEP12N9FkRzbpGw0UuZOMlIZNGUdgb2kWhjuvWzHD
         ZRhJvCpMmPykClY3mctXRQWyAJPvTyR7oDvR7iA09AzG97XIlFLuB+gXhP3/hqoLnl4y
         Fjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKPVsv2TqsP8zux8ohBTaLzqLXnKFjC2mxPTp1lrDzo=;
        b=1LyLygwfE1FVQHQnyBOKBeJW6Mb+Vn3J2rDHO9tO+qbYclbmaCkCFBG+XWOD1EzI2I
         sRbpi7QyLnmTTUs7+8nlsTw9heKrKaCuR895Jh3/uu0IU4BzBAWlv3SDqqK7Fan4IsDt
         ddaXF6vWZEdK9sXZQ7wGx3+R/FoMeczcih2YeFVsv5UAm2IsXxlxck4Y66cYz2CT+wp7
         79dq/23Kr3hS8amueMVNJfbyi+j3xVkYuQ+oEwrmbEHAyBzFS1jYekKHYW3XclvwM71t
         wgIiOOxB/5c6ZTkaeym7nlceqaWj5Yzj0qyD1ZE62cfrddezvdA7gZhxip/8PAhhNTlx
         UtdA==
X-Gm-Message-State: ANoB5pmvjOei3Ge8mpJFDzNJdc2cSIWS3LZquigNJ/9f5Difz39YRwzz
        6MdC3n8YFAyt3ubttyVHxIyd5ws+b+K5tse6L+o=
X-Google-Smtp-Source: AA0mqf4EcKeBgZ7Qh6fEUbVbfs34/Rm5aKLLEN7nKMXzJCBYSbAcmgBi/Jzjnz6BZ+LNCt4GOegkkA==
X-Received: by 2002:a17:902:d412:b0:18f:37ec:9675 with SMTP id b18-20020a170902d41200b0018f37ec9675mr9524687ple.21.1670935117264;
        Tue, 13 Dec 2022 04:38:37 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c60:4bad:5c3:ab51:3d81:6264])
        by smtp.gmail.com with ESMTPSA id m12-20020a170902c44c00b001889e58d520sm8297011plm.184.2022.12.13.04.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 04:38:36 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org,
        konrad.dybcio@linaro.org, andersson@kernel.org
Subject: [PATCH 1/3] arm64: dts: qcom: sm6115: Cleanup USB node names
Date:   Tue, 13 Dec 2022 18:08:21 +0530
Message-Id: <20221213123823.455731-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213123823.455731-1-bhupesh.sharma@linaro.org>
References: <20221213123823.455731-1-bhupesh.sharma@linaro.org>
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

There is only one USB controller present on SM6115 / SM4250
Qualcomm SoC, so drop the numbering used with USB nodes
in the dtsi and the related sm4250-oneplus-billie2.dts.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sm6115.dtsi                | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
index a3f1c7c41fd73..fa57f4bf58256 100644
--- a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
+++ b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
@@ -225,11 +225,11 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
-&usb_1 {
+&usb {
 	status = "okay";
 };
 
-&usb_1_hsphy {
+&usb_hsphy {
 	vdd-supply = <&vreg_l4a>;
 	vdda-pll-supply = <&vreg_l12a>;
 	vdda-phy-dpdm-supply = <&vreg_l15a>;
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 572bf04adf906..b5f7480c2e713 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -565,7 +565,7 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
-		usb_1_hsphy: phy@1613000 {
+		usb_hsphy: phy@1613000 {
 			compatible = "qcom,sm6115-qusb2-phy";
 			reg = <0x01613000 0x180>;
 			#phy-cells = <0>;
@@ -991,7 +991,7 @@ spi5: spi@4a94000 {
 			};
 		};
 
-		usb_1: usb@4ef8800 {
+		usb: usb@4ef8800 {
 			compatible = "qcom,sm6115-dwc3", "qcom,dwc3";
 			reg = <0x04ef8800 0x400>;
 			#address-cells = <1>;
@@ -1019,11 +1019,11 @@ usb_1: usb@4ef8800 {
 			qcom,select-utmi-as-pipe-clk;
 			status = "disabled";
 
-			usb_1_dwc3: usb@4e00000 {
+			usb_dwc3: usb@4e00000 {
 				compatible = "snps,dwc3";
 				reg = <0x04e00000 0xcd00>;
 				interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb_1_hsphy>;
+				phys = <&usb_hsphy>;
 				phy-names = "usb2-phy";
 				iommus = <&apps_smmu 0x120 0x0>;
 				snps,dis_u2_susphy_quirk;
-- 
2.38.1

