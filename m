Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7F35EDF8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234622AbiI1PAr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234620AbiI1PAW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:00:22 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8C538A2F
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:00:09 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a8so20752167lff.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=UcpWFZqwzt2iPUQPqE8ypJYgI9SteXXhQqUr61/Zf2k=;
        b=EPkX704LXYnO0oJVGzo2xpWyJXpQv40SbmJzXrqu7NMm/12Ah3IOPA0ulzrEpVGVwX
         oAPej9VOH2FrD6vAJ6PSrY2L0Osfzh2W+WMd05QzzQVhg+UCPsWDpE2HrBGtDGc2gqSL
         MnV88GSpFKRd0DvmUa+A0rC9YI0u+dNw/jzzG8iRGNFN39O2FX031ZjL1u/mh6p5fjc+
         /2733TO5jIcVAwhONGk9CrsFKi5eYzkUxh/vUDIemrQAh8dl/I6sxI/7lB83vqNqAVZ3
         Ni5t9sJyamhi11v3r1MQrnw2spEe15Rqwf8kCAHuuwfkiMzWtvFamcQjawaE1Ru/3Sgu
         pIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=UcpWFZqwzt2iPUQPqE8ypJYgI9SteXXhQqUr61/Zf2k=;
        b=G8sNsxWiHRTLm6dgAjLJIJ6JNpTNDn359i6PtAaqPDHeg51ZBO6ej0mvd1Eg00g9Pc
         13q3aI+JTrrYSZvd6Hh0/ksozIt0fSujZORjVqT1KWv1I8OkJjBp34VHzM7LU8rKpn1M
         oGXVq8KMm4QBQG0r0zekVDjfW25krNMzW7HHP/z8f9aCOUOKGP53OELKkNusiFeJvQd2
         dh2e9JobepjHPoPmsIfKlzwMckBhsNvDXaF7pYSTwoIPV8U8bWsZ7/LXU7+XpvrEbNx3
         CX4O8lw6YfRoro4R/EfUDgqnbkAWNWktxtuYzh3gjKiTy0e6QAkVz3migqIW/wiUfkFz
         PXGA==
X-Gm-Message-State: ACrzQf2FDsImZYwmoCHR5QcTBYdYirtf917x2eFWD9mP+nxNkY1I+kzv
        +6gx9KsDWH1tF68YUHbrHtqBDA==
X-Google-Smtp-Source: AMsMyM7fP3m0ynNAHGGn5XPBEmJRAZ/tM1Qz4XFFKB2zBUc+VqbSxoNYUHlg1ky96pszg6F33zIzAA==
X-Received: by 2002:a05:6512:2250:b0:49b:817a:c318 with SMTP id i16-20020a056512225000b0049b817ac318mr14495322lfu.535.1664377206802;
        Wed, 28 Sep 2022 08:00:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id be36-20020a056512252400b00492c017de43sm494996lfb.127.2022.09.28.08.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:00:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 09/11] ARM: dts: qcom: msm8974: add second DSI host and PHY
Date:   Wed, 28 Sep 2022 17:59:56 +0300
Message-Id: <20220928145958.376288-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
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

Add second DSI host and PHY available on the msm8974 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 78 +++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 7a9be0acf3f5..810a163ca14f 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1541,6 +1541,13 @@ mdp5_intf1_out: endpoint {
 							remote-endpoint = <&dsi0_in>;
 						};
 					};
+
+					port@1 {
+						reg = <1>;
+						mdp5_intf2_out: endpoint {
+							remote-endpoint = <&dsi1_in>;
+						};
+					};
 				};
 			};
 
@@ -1614,6 +1621,77 @@ dsi0_phy: dsi-phy@fd922a00 {
 
 				status = "disabled";
 			};
+
+			dsi1: dsi@fd922e00 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0xfd922e00 0x1f8>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				assigned-clocks = <&mmcc BYTE1_CLK_SRC>, <&mmcc PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
+				clocks = <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_AXI_CLK>,
+					 <&mmcc MDSS_BYTE1_CLK>,
+					 <&mmcc MDSS_PCLK1_CLK>,
+					 <&mmcc MDSS_ESC1_CLK>,
+					 <&mmcc MMSS_MISC_AHB_CLK>;
+				clock-names = "mdp_core",
+					      "iface",
+					      "bus",
+					      "byte",
+					      "pixel",
+					      "core",
+					      "core_mmss";
+
+				phys = <&dsi1_phy>;
+				phy-names = "dsi-phy";
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi1_in: endpoint {
+							remote-endpoint = <&mdp5_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi1_phy: dsi-phy@fd923000 {
+				compatible = "qcom,dsi-phy-28nm-hpm";
+				reg = <0xfd923000 0xd4>,
+				      <0xfd923100 0x280>,
+				      <0xfd923380 0x30>;
+				reg-names = "dsi_pll",
+					    "dsi_phy",
+					    "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
 		};
 
 		gpu: adreno@fdb00000 {
-- 
2.35.1

