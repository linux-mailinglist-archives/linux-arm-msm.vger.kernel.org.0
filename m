Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8228667655C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jan 2023 10:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjAUJMp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Jan 2023 04:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjAUJMo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Jan 2023 04:12:44 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0247D90
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jan 2023 01:12:41 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id y25so11270042lfa.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jan 2023 01:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GBtYSiVvhBNHewvkuAc5qLod/01+QUevVh6nEyjvpIU=;
        b=RFwD1lib11WLeCHS0otSIaRUQzzrEhC/aWJVE0bMuJ1v/LwsdrTz+bCuDAKamI1V0T
         T3xqoR2mZs169p9V8hjIh1jCPb8k93sAYvs3CHFNxO6XZR1NkabjXr6QEPiAYPWaQ0Iu
         GZSW84dx6y1drL3hyRA/pUx8w7vJsOoXU5slqAXJyyvcP+gQSRdpR5oHNm6t8PnJTQEB
         S8i53CjtYrU+hyqCABPlgBdtK2V2uhMclegNQhuxdMW9IakZqhkmu/uX5MJH7SX6c/3i
         5Q7hNpq496RQddGlAJ2feI+7/66uKCVCzLa5VYlRpX7puxum7dGGRRNp0jm50CGlybnl
         dBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBtYSiVvhBNHewvkuAc5qLod/01+QUevVh6nEyjvpIU=;
        b=ajJ55371IwqG3ntxzsx7ywsZnj8Dnasj/722U+KQkHFdAhvXVvJZFVnyx43iENH/FJ
         G54E1bzBoagjJwE4DUPhjtu32KLDyvGuVHJ8Vt7S/UMKGl2V1yw7ljTSPXkGkKjVZT3f
         vCgqJRfzoBfgP9FXIr4bIGnRgUdYHGKhUMGw/JyEzW1y/eVcD6qrUrOtqU5SsugTvEjU
         MPIGhw1P+jYu/0m9I28rv4GY/4KEFil3EZUs7jbyVlRJjp9pakwJ31CRzkUF2VRHKzTx
         i6x+q47N7O3QCQqRoWx5+EI+eljJDE7pe7UcnruwIqYsSw5/vGVsFxgGgC2L+637ETak
         IdCg==
X-Gm-Message-State: AFqh2koPmV8nFOB1DOMLJa2V8t1gyD931kYu+f+1yD3i4wsU0/zqSvXs
        n/KEwp5vQH+9AjbYP5tjnU0QHGK8RCWh29QFgWY=
X-Google-Smtp-Source: AMrXdXt8M8l2L8FsPNkMs4LQ14gqjNqg9DKX1AmORtQDhktAqhAj9whrDSGBi3GFVoSjvsXrKgrqIA==
X-Received: by 2002:a05:6512:3b0d:b0:4d5:ae35:b221 with SMTP id f13-20020a0565123b0d00b004d5ae35b221mr1319214lfv.34.1674292359591;
        Sat, 21 Jan 2023 01:12:39 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s17-20020a056512215100b0049876c1bb24sm6255207lfr.225.2023.01.21.01.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 01:12:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] ARM: dts: qcom: apq8064: add second DSI host and PHY
Date:   Sat, 21 Jan 2023 11:12:37 +0200
Message-Id: <20230121091237.2734272-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Add second DSI host and PHY available on the APQ8064 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Switched dsi1 to dsi1 clocks by default
- Indentation and ordering fixes (noted by Konrad)

---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 78 ++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index b7e5b45e1c04..92aa2b081901 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -865,8 +865,8 @@ mmcc: clock-controller@4000000 {
 				 <&gcc PLL8_VOTE>,
 				 <&dsi0_phy 1>,
 				 <&dsi0_phy 0>,
-				 <0>,
-				 <0>,
+				 <&dsi1_phy 1>,
+				 <&dsi1_phy 0>,
 				 <&hdmi_phy>;
 			clock-names = "pxo",
 				      "pll3",
@@ -1342,6 +1342,80 @@ dsi0_phy: phy@4700200 {
 			status = "disabled";
 		};
 
+		dsi1: dsi@5800000 {
+			compatible = "qcom,mdss-dsi-ctrl";
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x05800000 0x200>;
+			reg-names = "dsi_ctrl";
+
+			clocks = <&mmcc DSI2_M_AHB_CLK>,
+				 <&mmcc DSI2_S_AHB_CLK>,
+				 <&mmcc AMP_AHB_CLK>,
+				 <&mmcc DSI2_CLK>,
+				 <&mmcc DSI2_BYTE_CLK>,
+				 <&mmcc DSI2_PIXEL_CLK>,
+				 <&mmcc DSI2_ESC_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "core_mmss",
+				      "src",
+				      "byte",
+				      "pixel",
+				      "core";
+
+			assigned-clocks = <&mmcc DSI2_BYTE_SRC>,
+					  <&mmcc DSI2_ESC_SRC>,
+					  <&mmcc DSI2_SRC>,
+					  <&mmcc DSI2_PIXEL_SRC>;
+			assigned-clock-parents = <&dsi1_phy 0>,
+						 <&dsi1_phy 0>,
+						 <&dsi1_phy 1>,
+						 <&dsi1_phy 1>;
+
+			syscon-sfpb = <&mmss_sfpb>;
+			phys = <&dsi1_phy>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi1_in: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi1_out: endpoint {
+					};
+				};
+			};
+		};
+
+
+		dsi1_phy: dsi-phy@5800200 {
+			compatible = "qcom,dsi-phy-28nm-8960";
+			reg = <0x05800200 0x100>,
+			      <0x05800300 0x200>,
+			      <0x05800500 0x5c>;
+			reg-names = "dsi_pll",
+				    "dsi_phy",
+				    "dsi_phy_regulator";
+			clock-names = "iface",
+				      "ref";
+			clocks = <&mmcc DSI2_M_AHB_CLK>,
+				 <&pxo_board>;
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
 
 		mdp_port0: iommu@7500000 {
 			compatible = "qcom,apq8064-iommu";
-- 
2.39.0

