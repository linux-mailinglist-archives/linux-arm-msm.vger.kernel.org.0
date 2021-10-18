Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4A874316B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 13:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhJRLDS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 07:03:18 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:13359 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhJRLDS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 07:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634554864;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=z+0q+rdyl/RroMnXzBXNx9TVnAjlQ0XFpbJOEfK9Qqs=;
    b=HV3Daar3ySsOYRHtgvBHVIBUwSFoBrvsfx3a6wbVeWAlA9tF4sIQXmTRRIUb4LUQjb
    Evy851PzIYRlbaRS8splWpamIdfLGkbESy3Ci/uemZ8TF59gDKbbHekG4jNeULqSBLXv
    lys/baA8OUIvvLNTgI4UyUFySNa0uxs0idVTHTp+slXIS4vqZgCh9lVHR2xqvgs6X1MX
    egu9k3HBVVlXzNbm48vnHd0bpec8LAQpoBU+M1ElojqDhoKLwJG7ctmzCJiSV8JBfoL/
    LuXN/bbZFYLWrwF8ZkQZZFexj4pjOosVWXUx4Ltwd57FGuUWRu5gaJPzKgARC4nWv2KH
    UYGA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1OfxR"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id 301038x9IB13VdM
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 18 Oct 2021 13:01:03 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/2] arm64: dts: qcom: Fix node name of rpm-msg-ram device nodes
Date:   Mon, 18 Oct 2021 13:00:08 +0200
Message-Id: <20211018110009.30837-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

According to the new DT schema for qcom,rpm-msg-ram the node name
should be sram@. memory@ is reserved for definition of physical RAM
(usable by Linux).

This fixes the following dtbs_check error on various device trees:
memory@60000: 'device_type' is a required property
        From schema: dtschema/schemas/memory.yaml

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi  | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 2830cc45b837..0dcc614b2c61 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -445,7 +445,7 @@ tsens_calsel: calsel@ec {
 			};
 		};
 
-		rpm_msg_ram: memory@60000 {
+		rpm_msg_ram: sram@60000 {
 			compatible = "qcom,rpm-msg-ram";
 			reg = <0x00060000 0x8000>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 986fe60dec5f..5a9a5ed0565f 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -715,7 +715,7 @@ gcc: clock-controller@fc400000 {
 			reg = <0xfc400000 0x2000>;
 		};
 
-		rpm_msg_ram: memory@fc428000 {
+		rpm_msg_ram: sram@fc428000 {
 			compatible = "qcom,rpm-msg-ram";
 			reg = <0xfc428000 0x4000>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 465cd19a4951..b0f2434e2302 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -638,7 +638,7 @@ pciephy_2: lane@37000 {
 			};
 		};
 
-		rpm_msg_ram: memory@68000 {
+		rpm_msg_ram: sram@68000 {
 			compatible = "qcom,rpm-msg-ram";
 			reg = <0x00068000 0x6000>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 887ba7c4f28d..27c7358bbca4 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -865,7 +865,7 @@ gcc: clock-controller@100000 {
 			clocks = <&xo>, <&sleep_clk>;
 		};
 
-		rpm_msg_ram: memory@778000 {
+		rpm_msg_ram: sram@778000 {
 			compatible = "qcom,rpm-msg-ram";
 			reg = <0x00778000 0x7000>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 8abede380b6b..6db753b49326 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -318,7 +318,7 @@ turingcc: clock-controller@800000 {
 			status = "disabled";
 		};
 
-		rpm_msg_ram: memory@60000 {
+		rpm_msg_ram: sram@60000 {
 			compatible = "qcom,rpm-msg-ram";
 			reg = <0x00060000 0x6000>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 4b6630539d0d..e02015cc56f4 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -541,7 +541,7 @@ gcc: clock-controller@100000 {
 					<&sleep_clk>;
 		};
 
-		rpm_msg_ram: memory@778000 {
+		rpm_msg_ram: sram@778000 {
 			compatible = "qcom,rpm-msg-ram";
 			reg = <0x00778000 0x7000>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 6b03beb82bcd..51286ddbdb10 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -380,7 +380,7 @@ hsusb_phy1: phy@1613000 {
 			status = "disabled";
 		};
 
-		rpm_msg_ram: memory@45f0000 {
+		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram";
 			reg = <0x045f0000 0x7000>;
 		};
-- 
2.33.0

