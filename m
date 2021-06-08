Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A123A0515
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 22:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234951AbhFHUXr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 16:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234969AbhFHUXq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 16:23:46 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EEEC061787;
        Tue,  8 Jun 2021 13:21:53 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 0E8783EE56;
        Tue,  8 Jun 2021 22:21:51 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] arm64: dts: qcom: msm8996-*: Disable HDMI by default
Date:   Tue,  8 Jun 2021 22:21:41 +0200
Message-Id: <20210608202143.247427-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608202143.247427-1-konrad.dybcio@somainline.org>
References: <20210608202143.247427-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Most phones ship without HDMI and leaving it enabled wrecks
havoc. Disable it in msm8996.dtsi and re-enable it on the boards
that did not disable it previously.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v3:
- Add this patch

 arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi    | 8 ++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi        | 4 ++++
 3 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
index 8c7a27e972b7..a57c60070cdc 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
+++ b/arch/arm64/boot/dts/qcom/apq8096-ifc6640.dts
@@ -92,6 +92,14 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_phy {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi
index 1e1514e9158c..ac43a91f1104 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi
@@ -20,3 +20,11 @@ serial@75b0000 {
 		};
 	};
 };
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_phy {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 859fe18aa8c7..b5ec2a756561 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -664,6 +664,8 @@ hdmi: hdmi-tx@9a0000 {
 				phy-names = "hdmi_phy";
 				#sound-dai-cells = <1>;
 
+				status = "disabled";
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -697,6 +699,8 @@ hdmi_phy: hdmi-phy@9a0600 {
 					 <&gcc GCC_HDMI_CLKREF_CLK>;
 				clock-names = "iface",
 					      "ref";
+
+				status = "disabled";
 			};
 		};
 
-- 
2.31.1

