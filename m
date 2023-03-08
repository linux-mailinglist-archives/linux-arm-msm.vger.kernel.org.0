Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 301C26B0128
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 09:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjCHIZo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 03:25:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbjCHIZD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 03:25:03 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1592A28D25
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 00:24:59 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso1518189pjb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 00:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678263899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aUzZ/pcEn/1nxh8BRkcTuBhIuZDyh9nbRz2zlNTCXA=;
        b=I0eH0eUJGUgPuYFk7U7Bwogfp49PNB4wxzP4/mHaym3hSuIZcIwHy1NKuDY1Hlxty3
         p6A/4DNM0lPqRgjwftjltU5HehRa5tuM+Yy85BejL1P60O0Pr19MgHLtPEIYHST7eYir
         10Bt5uV3DCB/pfN368Ck7m1UHBHhiXh2GZpsEpmltUWTkWFHEWqkdsyid4nvjPd18XLi
         ysl1KB7fo+72U02c5GEa/AR32i+GbMmeyRWeMSBODYXD4i5liAb2AE/q4+NtCtELcv7e
         A4hkbK0oy3JCITDtGkR9DTGAOc3IzD7Hvp2QyebVBCbJIEfzDTAivvjOXtd5LpsFjj8n
         /XbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678263899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0aUzZ/pcEn/1nxh8BRkcTuBhIuZDyh9nbRz2zlNTCXA=;
        b=TZhMbMWJYoPeNeodh0cz3tga2uh26ia8PfHL9B1Mb9FeVO8ZmsSreXEBymxu9b/Gxw
         dacsbByQzkjJFFATRkJWDDft7Zxwhdx1B+CqH7Ij38JEzWvKcMb76RMkRhEJZsaGR1t0
         AWBkv1arDe8aqBqvEBPRaa4FdFbjmQyjsDhFF/hQAHMtRFyUmPp/RT+TE/JAc2fvyHbZ
         O5Gx0TWSqH/KC0iJHhm0529vxl96YfZ2oac81gW+SD042Xygvw7zrY97k+7tF8k3ZIVi
         JWD73igkLQ9VLC2GY34PfSheZw4xdxMGaDnRKH21OKV+dQUrfX37iSMWo6zCo07uu5pd
         DNBA==
X-Gm-Message-State: AO0yUKWZRFY/3gMqPcLPTGoP9uCcJA33UZ/FziyAqqNrhB5cHGISVOu8
        BJz7XgXXyYtHloxr22EOuMe0
X-Google-Smtp-Source: AK7set8lcYYKxc+Rti7A/p6xxydtFMxw0aHkmXzEtIGShnv1dZ2PUgK6U7iaO/8SC5Zyh7OYcopneA==
X-Received: by 2002:a17:902:c10a:b0:19e:7b09:bd4d with SMTP id 10-20020a170902c10a00b0019e7b09bd4dmr15605723pli.47.1678263898769;
        Wed, 08 Mar 2023 00:24:58 -0800 (PST)
Received: from localhost.localdomain ([59.97.52.140])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902ea0a00b0019aaab3f9d7sm9448086plg.113.2023.03.08.00.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 00:24:58 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
        kw@linux.com, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org
Cc:     konrad.dybcio@linaro.org, bhelgaas@google.com, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 06/13] ARM: dts: qcom: sdx55: Rename pcie0_{phy/lane} to pcie_{phy/lane}
Date:   Wed,  8 Mar 2023 13:54:17 +0530
Message-Id: <20230308082424.140224-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308082424.140224-1-manivannan.sadhasivam@linaro.org>
References: <20230308082424.140224-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is only one PCIe PHY in this SoC, so there is no need to add an
index to the suffix. This also matches the naming convention of the PCIe
controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts | 2 +-
 arch/arm/boot/dts/qcom-sdx55.dtsi                | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
index ad74ecc2a196..81f33eba39e5 100644
--- a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
@@ -242,7 +242,7 @@ &ipa {
 	status = "okay";
 };
 
-&pcie0_phy {
+&pcie_phy {
 	status = "okay";
 
 	vdda-phy-supply = <&vreg_l1e_bb_1p2>;
diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 7fa542249f1a..bd4edceaa1f4 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -335,7 +335,7 @@ pcie_ep: pcie-ep@1c00000 {
 			resets = <&gcc GCC_PCIE_BCR>;
 			reset-names = "core";
 			power-domains = <&gcc PCIE_GDSC>;
-			phys = <&pcie0_lane>;
+			phys = <&pcie_lane>;
 			phy-names = "pciephy";
 			max-link-speed = <3>;
 			num-lanes = <2>;
@@ -343,7 +343,7 @@ pcie_ep: pcie-ep@1c00000 {
 			status = "disabled";
 		};
 
-		pcie0_phy: phy@1c07000 {
+		pcie_phy: phy@1c07000 {
 			compatible = "qcom,sdx55-qmp-pcie-phy";
 			reg = <0x01c07000 0x1c4>;
 			#address-cells = <1>;
@@ -363,7 +363,7 @@ pcie0_phy: phy@1c07000 {
 
 			status = "disabled";
 
-			pcie0_lane: lanes@1c06000 {
+			pcie_lane: lanes@1c06000 {
 				reg = <0x01c06000 0x104>, /* tx0 */
 				      <0x01c06200 0x328>, /* rx0 */
 				      <0x01c07200 0x1e8>, /* pcs */
-- 
2.25.1

