Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BB5679376
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 09:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233241AbjAXIt6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 03:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbjAXIt6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 03:49:58 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B14448D
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 00:49:57 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id l8so10838798wms.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 00:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QDmPV9MKbrKVZjpkJYWkZeeKBhfjxvdtvqS2P5s7ObE=;
        b=rl0qe45pN/OTzj/sKzZddQ0/0n+T5Pbpf0AMdDqQOnfUfiRiRcJc0v8AN4c8afy8QI
         43p5KzofR7NLhuaPWOecSdT6BCleJ5brthZVa9etq+J1S6CMgwvvyCXQDyx3N6qRfjYN
         JleZbNdb50MfVH9adYGmmgszHkV6h1Mfb+L+f9/Rfpm6I+mwQmbOLCnZIpEIGEHMjONG
         97iLp2RwukFD5zmiaG341wNDQnzm2ZkxQfN8O/tXjs0cS9XAxXgqBXFod2twL+3W4+ML
         NYCGyp2rhnqH2XnrkoQnaqQ0hHvWwb71gHVyEJSLb5IXo0M/d+L0/+/7RrPeG1ECCYfO
         BRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDmPV9MKbrKVZjpkJYWkZeeKBhfjxvdtvqS2P5s7ObE=;
        b=nit2Kw4SdB+lTzy8E96DoNxGQknTLzETnPKl1NPoiZAcAf3qGnDAzU3dTol1eP8a2e
         VNTNsYN0BD4yFoxCH3brA7vbB6orSVQsbC/CqHwEATeHbDGfjrsnyIJzh9SrC7bFx8NK
         W/BU5lmFJyiCFPfbVfZ4POqv6mLvNEDm8pW1EGvWiOjM4rD3DsSXpeNV8CTAvzL3SxGZ
         2Xr5h0DAGLn9V6hr7X+jp+KyyWD3hmJlKsr3+l/tiJUxOvBc5mTI3LTIYrSI+aAjfRly
         N+MbnTmXlhGOki2EEEaugAK9mezc3M3aUaNt1XGW+uWIjf6g1kV8+xp1QeTAFRLyCtUz
         KDSA==
X-Gm-Message-State: AFqh2kof9FX+b1Ztric312IUG3LooMZUXBwf8Sj1UyMfZLwbrkpoHXFz
        cOLZqTGtAU/ovH8qWbm4SyL1+HMMCayGdo3B
X-Google-Smtp-Source: AMrXdXt1nw8Xsu7Wno9Z5tG5WShVxccvrPwFdIbfFL28x7iIuEeNUb/yxERc9RMC5PcrpMbjmxaOOg==
X-Received: by 2002:a05:600c:181c:b0:3da:f9e9:3a1a with SMTP id n28-20020a05600c181c00b003daf9e93a1amr27266612wmp.20.1674550195794;
        Tue, 24 Jan 2023 00:49:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p18-20020a05600c431200b003dab40f9eafsm1340036wme.35.2023.01.24.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 00:49:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/4] arm64: dts: qcom: use generic node name for Bluetooth
Date:   Tue, 24 Jan 2023 09:49:48 +0100
Message-Id: <20230124084951.38195-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Node names should be generic (as Devicetree spec mandates), so use
"bluetooth" for BT node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

---

Changes since v2:
1. Add tag

Changes since v1:
1. Fix also msm8996-xiaomi-common
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts             | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 5b47b8de69da..2acfed28e3cb 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -229,7 +229,7 @@ &blsp1_uart2 {
 	status = "okay";
 	label = "QCA_UART";
 
-	bluetooth: qca6174a {
+	bluetooth: bluetooth {
 		compatible = "qcom,qca6174-bt";
 
 		enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index c7a22c7976b7..6437551c61d4 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -424,7 +424,7 @@ &uart3 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-1 = <&qup_uart3_sleep>;
 
-	bluetooth: wcn3990-bt {
+	bluetooth: bluetooth {
 		compatible = "qcom,wcn3990-bt";
 		vddio-supply = <&vreg_l10a_1p8>;
 		vddxo-supply = <&vreg_l1c_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 4ed6f9fb1a3c..9e26b07512bc 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -862,7 +862,7 @@ &uart6 {
 
 	pinctrl-0 = <&qup_uart6_4pin>;
 
-	bluetooth: wcn3990-bt {
+	bluetooth: bluetooth {
 		compatible = "qcom,wcn3990-bt";
 		vddio-supply = <&src_pp1800_s4a>;
 		vddxo-supply = <&pp1800_l7a_wcn3990>;
-- 
2.34.1

