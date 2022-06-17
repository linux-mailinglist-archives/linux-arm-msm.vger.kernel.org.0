Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE3B54F590
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 12:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381878AbiFQKhM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 06:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381832AbiFQKg6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 06:36:58 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA326B003
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 03:36:55 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id m25so4271655lji.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 03:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K4qaTb66gTbZJWmfOsRm5JPLXRPUuGXdUkz0yonXfvM=;
        b=mI/dafrtFJcpC4E7BEP+LSW7tz+zSKId9sS9JikzpRHZanwP5fhlgJxaOvwLMfvhV2
         phBUA9FCh6rW0xyd1mboHWPW9NB6usE6rOyYJHs+luEpeNDC9C9JVaRZ08VJiOdRycxy
         qhzxpVRRg4bbnc5T+gte2TjZKbvC8fBe8WXzPwL8BvJAiVsTf223S1aDDSNDfvwxqMaz
         crl9A5OcuwH6n9e2vZa08aSkGd7Q4ZTahURZPssTnfRcdsEL8UAGo9+LrXY/Zhb5kVBq
         RBOSJZ89nfh20DL9g/7feQ86YGGtwl7swzZhbzQYr8UI1dOhACxa2Lp7vQ25jFvBErLH
         5SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K4qaTb66gTbZJWmfOsRm5JPLXRPUuGXdUkz0yonXfvM=;
        b=PUvBQSs6KroC1XZaDJbIYkz2a3asbS+b2S4IcFEHCvGcISendYO/u3o1rij2YJki8b
         TfWYnBp2q1q9LIUTXl0blN6phfbDLFQHlUrclBWE9U01U37BzQW3hW0ja+X0w79fRfRH
         P6yzyr4wlyXhwTa3EjCh0mHwFR2pwPT/NcabKTAqxGzIpv4Ua721FWF+cZwq2S2R0CyP
         emwFIJttE9oijn4AEyIgZrp7EkU90tnzmEzx3auvcIKzE6FMzPnX9r0g+RgaLJEowHad
         JcmqiBICvfMKZo6mqNxImsZX0NHCG28VMzSEHd6di3yxqgx5Bq3GOQ8o3WCEr/fWN4Ba
         /rOA==
X-Gm-Message-State: AJIora9g062OxVL7SLRB/KVcBLtJFVbkmgNXxVmm1niXi5/ESeBC2x7z
        5Om5eOChwGfn+P/hm01wdsk25w==
X-Google-Smtp-Source: AGRyM1uojpulIKQGH2iKjaTXZyyy4FI9fy9dyVoCR0/RMEN7Qc4N1lzJE41+w2pEQ2tzs8kXfnle/Q==
X-Received: by 2002:a05:651c:204c:b0:259:9146:e839 with SMTP id t12-20020a05651c204c00b002599146e839mr4704555ljo.138.1655462214103;
        Fri, 17 Jun 2022 03:36:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 7-20020ac25f47000000b00477b624c0a8sm590011lfz.180.2022.06.17.03.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 03:36:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] arm64: dts: qcom: msm8996: add second DSI interface
Date:   Fri, 17 Jun 2022 13:36:52 +0300
Message-Id: <20220617103652.606250-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device nodes for the DSI1, second DSI interface found on
MSM8996/APQ8096 platforms. For example on db820c it is routed to the
secondary HS expansion connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 73 +++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index f94f10947f26..dffb87a5ee74 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -831,6 +831,13 @@ mdp5_intf1_out: endpoint {
 							remote-endpoint = <&dsi0_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+						mdp5_intf2_out: endpoint {
+							remote-endpoint = <&dsi1_in>;
+						};
+					};
 				};
 			};
 
@@ -900,6 +907,72 @@ dsi0_phy: dsi-phy@994400 {
 				status = "disabled";
 			};
 
+			dsi1: dsi@996000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0x00996000 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MDSS_BYTE1_CLK>,
+					 <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_AXI_CLK>,
+					 <&mmcc MMSS_MISC_AHB_CLK>,
+					 <&mmcc MDSS_PCLK1_CLK>,
+					 <&mmcc MDSS_ESC1_CLK>;
+				clock-names = "mdp_core",
+					      "byte",
+					      "iface",
+					      "bus",
+					      "core_mmss",
+					      "pixel",
+					      "core";
+
+				phys = <&dsi1_phy>;
+				phy-names = "dsi";
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
+			dsi1_phy: dsi-phy@996400 {
+				compatible = "qcom,dsi-phy-14nm";
+				reg = <0x00996400 0x100>,
+				      <0x00996500 0x300>,
+				      <0x00996800 0x188>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_BB_CLK1>;
+				clock-names = "iface", "ref";
+				status = "disabled";
+			};
+
 			hdmi: hdmi-tx@9a0000 {
 				compatible = "qcom,hdmi-tx-8996";
 				reg =	<0x009a0000 0x50c>,
-- 
2.35.1

