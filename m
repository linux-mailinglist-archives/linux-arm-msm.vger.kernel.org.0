Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B36E16A1AE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Feb 2023 12:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjBXLBC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 06:01:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjBXLAI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 06:00:08 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3571FD9
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 02:59:44 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id x34so12655596pjj.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 02:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0M8kYEAz7MzsWNWHJToSlMHPi/nWVr288+AKYIv+MWQ=;
        b=SL27Mr2ERpEciqBGkdCVkt8X3uoEG0B+m/CpRXwDKRLeVSi8sk3S2P5KtaSPjVoC+0
         o+KprIlCXQT94+pAZnB6e9GBGvNpvrdGWLXqcfxnnkLazHHcy0x++Vx7DGjajdxMs3t0
         fjt7MwkjsgmMa5XFOG0ioZzxPwtWQDwtk1Uh6YBYx9/kK7AZkBwx1/+ymDfzPKJzUuxT
         WlgXFYeB1Q5OXEWGpkEGwWc3TXWH2xJ7TrV8n0g7bzlFVgCtHsBu38/6/fO0xWStygvI
         qM1ewxil2Ns92lWC2IwWuYL/ZjF2+jBLxUgbJRWD4pOMSc13tyhFPcEg/VNrGtPaVmsP
         Ok5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0M8kYEAz7MzsWNWHJToSlMHPi/nWVr288+AKYIv+MWQ=;
        b=Q8uYJ/GfoRmoaUmPNexssBGd4tJutJ6R/8OWWXsU7rGEWZr1yekEfAB59tW0ECav/H
         WLq/uL+rTkdhsyykUeW7dLoN8AJgMLGfkAmpULXjDma5CSa8U4R3PIQw9Md6KBpzEBqH
         qBH0u6XeAEN406yHkrgZT3s3lu8gbanJ+VbA1pzTMSfTJKlpy6LbiWwGPoD90tGE8kxm
         DW93GMT94v/Wlx8AbnD/cY0Wjrpw+nMH+v1I7wwYrmr2rj3arHrAXVO8Of9+PZLjj67b
         I6uB2+9Qiwj51wkWUtRBxxt21BfAp6FSOYM8L4N2tM7kNVhd+T4EbWLoPDWKHzqNHz/s
         P0Hg==
X-Gm-Message-State: AO0yUKVej4IJ7buaUu1BnMHUfW67yS4VwlWDf7Vz5YQDun7apuKzkw+/
        TFAqh35Vvy984T0DliP9gZ0c
X-Google-Smtp-Source: AK7set8Wj3Cy0TsPu96DQreGVAx4H+6J+lMBG0tY6SEfeX2bTCwaDqD2bvaNTFiSdVOXF0boee/TiA==
X-Received: by 2002:a17:90b:3a87:b0:230:c723:f37d with SMTP id om7-20020a17090b3a8700b00230c723f37dmr18680685pjb.40.1677236384121;
        Fri, 24 Feb 2023 02:59:44 -0800 (PST)
Received: from localhost.localdomain ([117.217.187.3])
        by smtp.gmail.com with ESMTPSA id gd5-20020a17090b0fc500b00233cde36909sm1263853pjb.21.2023.02.24.02.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 02:59:43 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
        kw@linux.com, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org
Cc:     konrad.dybcio@linaro.org, bhelgaas@google.com, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 06/13] ARM: dts: qcom: sdx55: Rename pcie0_{phy/lane} to pcie_{phy/lane}
Date:   Fri, 24 Feb 2023 16:28:59 +0530
Message-Id: <20230224105906.16540-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230224105906.16540-1-manivannan.sadhasivam@linaro.org>
References: <20230224105906.16540-1-manivannan.sadhasivam@linaro.org>
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
index ac8b4626ae9a..b7ee0237608f 100644
--- a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
@@ -242,7 +242,7 @@ &ipa {
 	memory-region = <&ipa_fw_mem>;
 };
 
-&pcie0_phy {
+&pcie_phy {
 	status = "okay";
 
 	vdda-phy-supply = <&vreg_l1e_bb_1p2>;
diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index e84ca795cae6..a1f4a7b0904a 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -334,7 +334,7 @@ pcie_ep: pcie-ep@1c00000 {
 			resets = <&gcc GCC_PCIE_BCR>;
 			reset-names = "core";
 			power-domains = <&gcc PCIE_GDSC>;
-			phys = <&pcie0_lane>;
+			phys = <&pcie_lane>;
 			phy-names = "pciephy";
 			max-link-speed = <3>;
 			num-lanes = <2>;
@@ -342,7 +342,7 @@ pcie_ep: pcie-ep@1c00000 {
 			status = "disabled";
 		};
 
-		pcie0_phy: phy@1c07000 {
+		pcie_phy: phy@1c07000 {
 			compatible = "qcom,sdx55-qmp-pcie-phy";
 			reg = <0x01c07000 0x1c4>;
 			#address-cells = <1>;
@@ -362,7 +362,7 @@ pcie0_phy: phy@1c07000 {
 
 			status = "disabled";
 
-			pcie0_lane: lanes@1c06000 {
+			pcie_lane: lanes@1c06000 {
 				reg = <0x01c06000 0x104>, /* tx0 */
 				      <0x01c06200 0x328>, /* rx0 */
 				      <0x01c07200 0x1e8>, /* pcs */
-- 
2.25.1

