Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8591C65AEE6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 10:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbjABJrl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 04:47:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231567AbjABJrI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 04:47:08 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFEB6CC1
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 01:47:02 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bp15so40901533lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 01:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ChnUQYzUlOXsitA4B/KYV/HzdtqGmDw26pxGLPhaSE=;
        b=sp+i6SdLamsydRJ/bUanUdRmOtL4IJyx5L0f1rH/WH+MVEWO6poJ+Xe7t0RjpI2tgm
         jeqmvfrBxocZGESpaOBefTa+OeYpgwFRL7P/VQtb1BDzHTwFovdZM9tmbSd8bZ97MixS
         OvRLgsSnJdFk5J+PA4JD52ohXRoECS6gz5c/o1zsA17awfokaojpl6WJWSn7zapPxnNN
         6CtYqjLQOIUMfv3STteLBXzKNsRg3oPIhU+D86oiMKuKczzDXYdeMFBjfswSnlDhZv5A
         08qSlUrAfSqfVIpGgIKkDsG9CnO/qs4kxyyjn22b6ug9BkNYndfwT1L2/wC2aDzNLW1h
         G1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ChnUQYzUlOXsitA4B/KYV/HzdtqGmDw26pxGLPhaSE=;
        b=Fh8QosTSD8fD7dbnFpAofUb8hzsoI+mYINQJjiyF+QVQQL9+mPsV1wDLebHtW+P1WV
         fxAN4rl7J/HCC6u0ag7ZUJbH2FaNBWMdJic/H2mqbrPy7Gi/CgZioN/MUlGrMJcMfc2W
         0icZ1C8pdvO8PVmcRd0o/SGF5Fozp/YwbFuvd2iv8g0ZyizoL2NdN1I2cH8aKxpXOk2Z
         VORGK+CHSnIyykXyjGzN19TYFtCwZnyf5msyV7wD3LAxhSFgp2N1CU8iwYDUx35lAXwW
         BX6O2faDYvFrO+nU8QocKR+C8FzNIMmyZR0TxTMKaVtCkNnjm7cjxz+3yRGZ9aSesmsS
         WpoQ==
X-Gm-Message-State: AFqh2kq3vJJNTDvn8H1TguG/SCd9M8wa7b3329oyjYdwV71aXwfoWzwG
        YdHa+jmu+Yca7mwsV+m2BgoPnx6ONQGI3h0a
X-Google-Smtp-Source: AMrXdXtPny9DY+8JYuYanf9tAYQiGv1uolYnYfxtmC01fJ2MI39VRURYbx3UW1/+qsVmj44on+hArg==
X-Received: by 2002:a05:6512:2344:b0:4cb:90d:41b1 with SMTP id p4-20020a056512234400b004cb090d41b1mr7563426lfu.56.1672652822238;
        Mon, 02 Jan 2023 01:47:02 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id x11-20020a0565123f8b00b004b5adb59ed5sm4382143lfa.297.2023.01.02.01.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 01:47:01 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/17] arm64: dts: qcom: sc7280: Pad addresses to 8 hex digits
Date:   Mon,  2 Jan 2023 10:46:38 +0100
Message-Id: <20230102094642.74254-14-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102094642.74254-1-konrad.dybcio@linaro.org>
References: <20230102094642.74254-1-konrad.dybcio@linaro.org>
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

Some addresses were 7-hex-digits long, or less. Fix that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
No changes

 arch/arm64/boot/dts/qcom/sc7280.dtsi | 46 ++++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 0adf13399e64..cbf571baca9b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2171,9 +2171,9 @@ ipa: ipa@1e40000 {
 
 			iommus = <&apps_smmu 0x480 0x0>,
 				 <&apps_smmu 0x482 0x0>;
-			reg = <0 0x1e40000 0 0x8000>,
-			      <0 0x1e50000 0 0x4ad0>,
-			      <0 0x1e04000 0 0x23000>;
+			reg = <0 0x01e40000 0 0x8000>,
+			      <0 0x01e50000 0 0x4ad0>,
+			      <0 0x01e04000 0 0x23000>;
 			reg-names = "ipa-reg",
 				    "ipa-shared",
 				    "gsi";
@@ -2455,7 +2455,7 @@ lpass_cpu: audio@3987000 {
 
 		lpass_hm: clock-controller@3c00000 {
 			compatible = "qcom,sc7280-lpasshm";
-			reg = <0 0x3c00000 0 0x28>;
+			reg = <0 0x03c00000 0 0x28>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "bi_tcxo";
 			#clock-cells = <1>;
@@ -3489,7 +3489,7 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 		pmu@9091000 {
 			compatible = "qcom,sc7280-llcc-bwmon";
-			reg = <0 0x9091000 0 0x1000>;
+			reg = <0 0x09091000 0 0x1000>;
 
 			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 
@@ -3571,7 +3571,7 @@ dc_noc: interconnect@90e0000 {
 		};
 
 		gem_noc: interconnect@9100000 {
-			reg = <0 0x9100000 0 0xe2200>;
+			reg = <0 0x09100000 0 0xe2200>;
 			compatible = "qcom,sc7280-gem-noc";
 			#interconnect-cells = <2>;
 			qcom,bcm-voters = <&apps_bcm_voter>;
@@ -3586,8 +3586,8 @@ system-cache-controller@9200000 {
 
 		eud: eud@88e0000 {
 			compatible = "qcom,sc7280-eud","qcom,eud";
-			reg = <0 0x88e0000 0 0x2000>,
-			      <0 0x88e2000 0 0x1000>;
+			reg = <0 0x088e0000 0 0x2000>,
+			      <0 0x088e2000 0 0x1000>;
 			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
 			ports {
 				port@0 {
@@ -3750,7 +3750,7 @@ opp-460000048 {
 
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sc7280-videocc";
-			reg = <0 0xaaf0000 0 0x10000>;
+			reg = <0 0x0aaf0000 0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				<&rpmhcc RPMH_CXO_CLK_A>;
 			clock-names = "bi_tcxo", "bi_tcxo_ao";
@@ -3773,7 +3773,7 @@ camcc: clock-controller@ad00000 {
 
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sc7280-dispcc";
-			reg = <0 0xaf00000 0 0x20000>;
+			reg = <0 0x0af00000 0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&mdss_dsi_phy 0>,
@@ -4001,10 +4001,10 @@ mdss_edp: edp@aea0000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&edp_hot_plug_det>;
 
-				reg = <0 0xaea0000 0 0x200>,
-				      <0 0xaea0200 0 0x200>,
-				      <0 0xaea0400 0 0xc00>,
-				      <0 0xaea1000 0 0x400>;
+				reg = <0 0x0aea0000 0 0x200>,
+				      <0 0x0aea0200 0 0x200>,
+				      <0 0x0aea0400 0 0xc00>,
+				      <0 0x0aea1000 0 0x400>;
 
 				interrupt-parent = <&mdss>;
 				interrupts = <14>;
@@ -4076,10 +4076,10 @@ opp-810000000 {
 			mdss_edp_phy: phy@aec2a00 {
 				compatible = "qcom,sc7280-edp-phy";
 
-				reg = <0 0xaec2a00 0 0x19c>,
-				      <0 0xaec2200 0 0xa0>,
-				      <0 0xaec2600 0 0xa0>,
-				      <0 0xaec2000 0 0x1c0>;
+				reg = <0 0x0aec2a00 0 0x19c>,
+				      <0 0x0aec2200 0 0xa0>,
+				      <0 0x0aec2600 0 0xa0>,
+				      <0 0x0aec2000 0 0x1c0>;
 
 				clocks = <&rpmhcc RPMH_CXO_CLK>,
 					 <&gcc GCC_EDP_CLKREF_EN>;
@@ -4095,11 +4095,11 @@ mdss_edp_phy: phy@aec2a00 {
 			mdss_dp: displayport-controller@ae90000 {
 				compatible = "qcom,sc7280-dp";
 
-				reg = <0 0xae90000 0 0x200>,
-				      <0 0xae90200 0 0x200>,
-				      <0 0xae90400 0 0xc00>,
-				      <0 0xae91000 0 0x400>,
-				      <0 0xae91400 0 0x400>;
+				reg = <0 0x0ae90000 0 0x200>,
+				      <0 0x0ae90200 0 0x200>,
+				      <0 0x0ae90400 0 0xc00>,
+				      <0 0x0ae91000 0 0x400>,
+				      <0 0x0ae91400 0 0x400>;
 
 				interrupt-parent = <&mdss>;
 				interrupts = <12>;
-- 
2.39.0

