Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46634660E3C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jan 2023 12:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjAGLPs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Jan 2023 06:15:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjAGLPr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Jan 2023 06:15:47 -0500
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F46B6DB85;
        Sat,  7 Jan 2023 03:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1673089957;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=mafRHG2VP9Xxo6ln3JizdI6zKAzu/MlSF5JNxUM/n2Q=;
    b=DzOtVQWZy/SHiO6Iy/3ma8tGqx8J5mgNyZd3H8qOn4KKCJcbRbN/MScGSH5edUpHjm
    wmE9hTr9IDReOXPCUr78yB2vOBw2QCPgcnp5Y73DnHK6xeVJm6+2DJVwhenW1SLbjZg8
    Xtu4FwAu4qb84Ou+qqGurHfEZzjFik88D7Y09mDWqgtT82KP6swOVta5x0zN/DUCYIH6
    /9dol4ryCG26T2ZsE6H3jgpECuabegBQPjFIU1Snk6+ydazRYSZQun77baf7uq3Z1AGo
    wAPFY9WYNq2y9/7kJvj84CtibBHKAfAe+Sh/Vdhx9XPJK+MUO4JRbRmCh0BXgyV/qERQ
    /6hw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIRvweFKMuQ=="
X-RZG-CLASS-ID: mo01
Received: from droid..
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id Yce349z07BCbtJE
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sat, 7 Jan 2023 12:12:37 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/2] arm64: dts: qcom: msm8916: Add DMA for all I2C controllers
Date:   Sat,  7 Jan 2023 12:09:58 +0100
Message-Id: <20230107110958.5762-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230107110958.5762-1-stephan@gerhold.net>
References: <20230107110958.5762-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

i2c-qup allows using DMA to speed up larger transfers. In msm8916.dtsi
the DMA channels are already assigned to the SPI controllers but
missing for I2C. Add them there as well.

This also fixes confusing errors in dmesg for each I2C controller:
  i2c_qup 78b6000.i2c: tx channel not available

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 98da982548a1..daece6b9e932 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1559,6 +1559,8 @@ blsp_i2c1: i2c@78b5000 {
 			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp_dma 4>, <&blsp_dma 5>;
+			dma-names = "tx", "rx";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c1_default>;
 			pinctrl-1 = <&i2c1_sleep>;
@@ -1591,6 +1593,8 @@ blsp_i2c2: i2c@78b6000 {
 			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp_dma 6>, <&blsp_dma 7>;
+			dma-names = "tx", "rx";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c2_default>;
 			pinctrl-1 = <&i2c2_sleep>;
@@ -1623,6 +1627,8 @@ blsp_i2c3: i2c@78b7000 {
 			clocks = <&gcc GCC_BLSP1_QUP3_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp_dma 8>, <&blsp_dma 9>;
+			dma-names = "tx", "rx";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c3_default>;
 			pinctrl-1 = <&i2c3_sleep>;
@@ -1655,6 +1661,8 @@ blsp_i2c4: i2c@78b8000 {
 			clocks = <&gcc GCC_BLSP1_QUP4_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp_dma 10>, <&blsp_dma 11>;
+			dma-names = "tx", "rx";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c4_default>;
 			pinctrl-1 = <&i2c4_sleep>;
@@ -1687,6 +1695,8 @@ blsp_i2c5: i2c@78b9000 {
 			clocks = <&gcc GCC_BLSP1_QUP5_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp_dma 12>, <&blsp_dma 13>;
+			dma-names = "tx", "rx";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c5_default>;
 			pinctrl-1 = <&i2c5_sleep>;
@@ -1719,6 +1729,8 @@ blsp_i2c6: i2c@78ba000 {
 			clocks = <&gcc GCC_BLSP1_QUP6_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			dmas = <&blsp_dma 14>, <&blsp_dma 15>;
+			dma-names = "tx", "rx";
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c6_default>;
 			pinctrl-1 = <&i2c6_sleep>;
-- 
2.39.0

