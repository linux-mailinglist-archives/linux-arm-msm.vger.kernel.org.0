Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 624EC74F2C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbjGKOwH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbjGKOwG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:52:06 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8989510C7
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:52:04 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b6b98ac328so89270841fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689087122; x=1691679122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZ5/YeWN2vH9hoiK+P3gfGMmpSC0FP7W9NmgzJ5mais=;
        b=yr7f3jV+k9S6hICYgTybG2grsXar0/ghmE+6ibMy7VvWpt0I7fTSiKFPP30HVJVzEp
         GWffay68vYAYpOlsH+hj5UNWzW4swDPSmg9wQ/vzmyXInqZCvRX7r/JmGAcfJfP9RAYa
         FH+SykhODC3AlyqV060rf69ymX2uV7SaFfpiuvJaKuyHo8jLLwhD6/XnTYGfrc2cTosJ
         jWi8yGfZmxv1MlzS+y7DHAox7LavCYM1SAsqVvuHf7R5q8Phw02EMfjV+gvp9gBz2bO2
         52mASvetUG8O0Oixg/XdUmO+lJlE1FUK8BxLb0var9qjIT9wiUN9smvfea41auxqvJHF
         IAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689087122; x=1691679122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZ5/YeWN2vH9hoiK+P3gfGMmpSC0FP7W9NmgzJ5mais=;
        b=OtCkbntlF2SC8H02UK+2223zd0oMpsUvXtYWYOQHdiPXOY+J1eHrSTE5QycYPcykD/
         7+ZqUT7EnKY5zfKon1qGmRegDJyfHwUS0pGUg/iX7iSzmZ4JF27lvtxi0ySUHQOTOeS1
         xNzZRMNMX3IFeSyMBd5f2D4D0ZLUwWqvsbXfJdJ9ZE1WoiNMUd1abnp0hmSxiMo5R1Si
         kJLszbAjanjYtHbRVC8A5/4ud2+MJepI8d/g2CwWt0bgGW7TtlHWZAvuRi8tOLS6YBVe
         A7mrXX8fIArDVsQWb0YvDTCIvSXrHjtiIePTGdXrZo+uyZ5CAP5MJ+kTaaK9yff63gWh
         7e2A==
X-Gm-Message-State: ABy/qLbP6damBJVbur3VzlLulK17saXtEc8/bklAfgIsb5elQSDyn/1a
        gJcwxsXgy6exKUJ+kymkAhl1iw==
X-Google-Smtp-Source: APBJJlGeEPrDv2hHQXiM96uVSNcPNAXzQ4roA03VkgGmnapJFG9SQrvgr4gXd5wKG5vjmAymqfwAyw==
X-Received: by 2002:a2e:9015:0:b0:2b6:de41:b72f with SMTP id h21-20020a2e9015000000b002b6de41b72fmr14342668ljg.4.1689087122656;
        Tue, 11 Jul 2023 07:52:02 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a10-20020a2eb16a000000b002b6ee363337sm492454ljm.120.2023.07.11.07.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:52:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v4 11/11] arm64: dts: qcom: sm8450: switch UFS QMP PHY to new style of bindings
Date:   Tue, 11 Jul 2023 17:51:53 +0300
Message-Id: <20230711145153.4167820-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230711145153.4167820-1-dmitry.baryshkov@linaro.org>
References: <20230711145153.4167820-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 1668d97ce459..e130e66e8a53 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -751,9 +751,9 @@ gcc: clock-controller@100000 {
 				 <&pcie0_lane>,
 				 <&pcie1_lane>,
 				 <0>,
-				 <&ufs_mem_phy_lanes 0>,
-				 <&ufs_mem_phy_lanes 1>,
-				 <&ufs_mem_phy_lanes 2>,
+				 <&ufs_mem_phy 0>,
+				 <&ufs_mem_phy 1>,
+				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 			clock-names = "bi_tcxo",
 				      "sleep_clk",
@@ -4122,7 +4122,7 @@ ufs_mem_hc: ufshc@1d84000 {
 				     "jedec,ufs-2.0";
 			reg = <0 0x01d84000 0 0x3000>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -4171,10 +4171,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8450-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c4>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref", "ref_aux", "qref";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
@@ -4182,17 +4180,11 @@ ufs_mem_phy: phy@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x188>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x188>,
-				      <0 0x01d87a00 0 0x200>;
-				#clock-cells = <1>;
-				#phy-cells = <0>;
-			};
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		ice: crypto@1d88000 {
-- 
2.39.2

