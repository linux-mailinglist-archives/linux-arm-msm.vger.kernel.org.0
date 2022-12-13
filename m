Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE3E064B557
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 13:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235395AbiLMMlK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 07:41:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234404AbiLMMke (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 07:40:34 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C911FF91
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 04:38:46 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id o12so3233125pjo.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 04:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YePhAvYUlwABIizeZpsWNnCslmbzuPktDGT0aWh+WCg=;
        b=wv/khjKASLevaKX2RJcymDxwDpHNeoxY2XZUcYsF+4DMkZIR6kzHyWjRoTxhxczneR
         EWMsMfMZk0zWvLbKdv5PZ83Oggfy4nd5VWWR2ghyKqIFxUjhaQxkjUvRzGqdX28Q3gI/
         xb2m92RWtb4jDUJhiNilm04L+BlZAq/J2HMUAC478z3BrOudaD2+kwoT4GRYRATr4CVC
         60QBlrGkS6GxVrTWd67MXhMoSdQKn6/nWkx5JZYrQSJxUYWVGhWHRe5Oc9cmmtimh57M
         nSZYflCcfncJN0nwJPtrBolVCYn2fFHBhj6Qx36xFEhDPIg5ifJ6Qthqr4U1Axqj9lWh
         yufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YePhAvYUlwABIizeZpsWNnCslmbzuPktDGT0aWh+WCg=;
        b=BUaVfxw7P0cO2m22LQfZlYdEILnI0n1nOImL8P4q9AHzUO9Oz1ef2mCwyKAWDzfLuf
         hTakumZFYPN7tjX9NMqezsU0XC0mCDgVquqCcy2AwPwntIyBPiBzErW8tXccaQ0E59/I
         U1KJ6LrhgjRhkAmk6x7/iwYa9jLWxE/5lPqsTntURvl86yCRZ3ew97A/VPrjMSAAGl2l
         PnUq0Gb1gF+oJAl1awjneebQk3O6byioc8mllCQSNGW/ZWPSK5+EGR7Ozq5m5gOA9iw6
         9dpKrlMhEfrveWcTXJgEdsbeLMB3KzNja7yJLR2cjOeAeBG3iqHXgNyjXn7RvSjpfcwU
         sccQ==
X-Gm-Message-State: ANoB5plHDO157ktidKN97te2JFC0W3hSIYAOEUvjnWOTxrtYdhZnKS3C
        zh5Mvoy3/br7/iEuz0wEWGKrHae+q7zMc7njDPk=
X-Google-Smtp-Source: AA0mqf5ctH7OVIr6FRXBMGMVuOAk4vPXByo6XYnptIEjYhaWhbE+73UZSQO4nWc8K9j2AJExHlw9kA==
X-Received: by 2002:a17:902:e851:b0:189:a6b4:91ed with SMTP id t17-20020a170902e85100b00189a6b491edmr28013735plg.17.1670935125702;
        Tue, 13 Dec 2022 04:38:45 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c60:4bad:5c3:ab51:3d81:6264])
        by smtp.gmail.com with ESMTPSA id m12-20020a170902c44c00b001889e58d520sm8297011plm.184.2022.12.13.04.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 04:38:45 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski@linaro.org,
        konrad.dybcio@linaro.org, andersson@kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm6115: Add USB SS qmp phy node
Date:   Tue, 13 Dec 2022 18:08:23 +0530
Message-Id: <20221213123823.455731-4-bhupesh.sharma@linaro.org>
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

Add USB superspeed qmp phy node to dtsi.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 38 ++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index e4ce135264f3d..9c5c024919f92 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -579,6 +579,40 @@ usb_hsphy: phy@1613000 {
 			status = "disabled";
 		};
 
+		usb_qmpphy: phy@1615000 {
+			compatible = "qcom,sm6115-qmp-usb3-phy";
+			reg = <0x01615000 0x200>;
+			#clock-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			clocks = <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+				 <&gcc GCC_AHB2PHY_USB_CLK>;
+			clock-names = "com_aux",
+				      "ref",
+				      "cfg_ahb";
+			resets = <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>;
+			reset-names = "phy", "phy_phy";
+			status = "disabled";
+
+			usb_ssphy: phy@1615200 {
+				reg = <0x01615200 0x200>,
+				      <0x01615400 0x200>,
+				      <0x01615c00 0x400>,
+				      <0x01615600 0x200>,
+				      <0x01615800 0x200>,
+				      <0x01615a00 0x100>;
+				#phy-cells = <0>;
+				#clock-cells = <1>;
+				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "usb3_phy_pipe_clk_src";
+			};
+		};
+
+
 		qfprom@1b40000 {
 			compatible = "qcom,sm6115-qfprom", "qcom,qfprom";
 			reg = <0x01b40000 0x7000>;
@@ -1023,8 +1057,8 @@ usb_dwc3: usb@4e00000 {
 				compatible = "snps,dwc3";
 				reg = <0x04e00000 0xcd00>;
 				interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb_hsphy>;
-				phy-names = "usb2-phy";
+				phys = <&usb_hsphy>, <&usb_ssphy>;
+				phy-names = "usb2-phy", "usb3-phy";
 				iommus = <&apps_smmu 0x120 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
-- 
2.38.1

