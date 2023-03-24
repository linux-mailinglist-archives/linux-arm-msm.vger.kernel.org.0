Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A57DA6C75BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjCXCZ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbjCXCZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:58 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D71A2A993
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:57 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x17so409126lfu.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wl63CU9Rl6YfDCPsB9roZSx3tsMqNAaCLrj8Bjbyllc=;
        b=E+gJtjcdRphBtb74O3PCE/m9qL/S6tCLqj9b5DeRrx2xjShztpCaNAfFq/lkcZJlUf
         Kn5fAqhY0jNhDgqqkFwM5Dk5PO/kh0X6ywLxcgeB5rlOcEwj7+DlO3Z59zZ5Quv9Qb4N
         tOXnKsapWokd1m3a/m8GXVMfB/nQSdVcy42yb2Tkk2F3iIN5wRtzEVDCnEwhCRfDhApk
         LuHCgr3cNtGi+aP7yM0+3719OC6cNGuSYVSarfFy/vBdg+v7LUp4PgQMASR7DAS07eaV
         aASmdRy2k5ywSgS3/LOhnNDSHFJFKlupXKojLSzIAma4XnzB+PE+3lJkSnI3oqxGaCaq
         dM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wl63CU9Rl6YfDCPsB9roZSx3tsMqNAaCLrj8Bjbyllc=;
        b=mKoGeO211IQQhHxNd7otH8BFO0ujpnME+aA/jHX58OcplqpwabTUiDCbLubkrwqbAy
         pge2YOK1os56qLw9ASNikOM1YR52WlmbzdKavdGSRFW3++iEPy8IorZSkzG4XgwxHE2z
         wlq+uJWg27KSPB/9e90h5VsKIfpOjlPMDA7wgxwqAfNXv0ETTnajRfY7v4mpp0c5s2tK
         C4PQ1rCiPd/3UBRZp4dhc0fuQjJB1LB6y+xid8jwQaKi6QwGLdZN3AhTxrD3CY0Z8oDP
         BpWvw1tI2ef/DpIW7zSbolVmISNFcKi83cpBxuNGXLu1vYTBd1vAfCn+ki+xyq4DrOVh
         gygg==
X-Gm-Message-State: AO0yUKV5K6MNDGMlQJrgekaEczrwfTtrM9doEbLzr5cyok9LVr+o6VEG
        P4p/rI/11dD+0x105q513VlkvA==
X-Google-Smtp-Source: AK7set+iRoOHRtxAn6Hz3EebpMzY/EAh9L4KFIWhbeaIFMthYPVwGVWs26wA3rv2nr9JjAL3Nzu0dw==
X-Received: by 2002:a05:6512:1316:b0:4ea:f63b:3b36 with SMTP id x22-20020a056512131600b004eaf63b3b36mr2197067lfu.10.1679624755695;
        Thu, 23 Mar 2023 19:25:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 39/41] ARM: dts: qcom-sdx55: switch USB QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:25:12 +0300
Message-Id: <20230324022514.1800382-40-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the USB QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 9148a840b8a0..d69e3e8b280e 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -228,7 +228,7 @@ usb_hsphy: phy@ff4000 {
 
 		usb_qmpphy: phy@ff6000 {
 			compatible = "qcom,sdx55-qmp-usb3-uni-phy";
-			reg = <0x00ff6000 0x1c0>;
+			reg = <0x00ff6000 0x1000>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -236,23 +236,19 @@ usb_qmpphy: phy@ff6000 {
 
 			clocks = <&gcc GCC_USB3_PHY_AUX_CLK>,
 				 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
-				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref";
+				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+				 <&gcc GCC_USB3_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "pipe";
+			clock-output-names = "usb3_uni_phy_pipe_clk_src";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
 
 			resets = <&gcc GCC_USB3PHY_PHY_BCR>,
 				 <&gcc GCC_USB3_PHY_BCR>;
 			reset-names = "phy", "common";
-
-			usb_ssphy: phy@ff6200 {
-				reg = <0x00ff6200 0x170>,
-				      <0x00ff6400 0x200>,
-				      <0x00ff6800 0x800>;
-				#phy-cells = <0>;
-				#clock-cells = <0>;
-				clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
-				clock-names = "pipe0";
-				clock-output-names = "usb3_uni_phy_pipe_clk_src";
-			};
 		};
 
 		mc_virt: interconnect@1100000 {
@@ -608,7 +604,7 @@ usb_dwc3: dwc3@a600000 {
 				iommus = <&apps_smmu 0x1a0 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-				phys = <&usb_hsphy>, <&usb_ssphy>;
+				phys = <&usb_hsphy>, <&usb_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
-- 
2.30.2

