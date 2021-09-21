Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478A64131CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 12:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbhIUKlO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 06:41:14 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:22196 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbhIUKlM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 06:41:12 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 21 Sep 2021 03:39:44 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 21 Sep 2021 03:39:43 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg01-blr.qualcomm.com with ESMTP; 21 Sep 2021 16:09:21 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id 6C43D215F2; Tue, 21 Sep 2021 16:09:20 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org, mka@chromium.org,
        dianders@chromium.org, Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V9 3/8] arm64: dts: sc7280: Configure SPI-NOR FLASH for sc7280-idp
Date:   Tue, 21 Sep 2021 16:09:01 +0530
Message-Id: <1632220746-25943-4-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632220746-25943-1-git-send-email-rajpat@codeaurora.org>
References: <1632220746-25943-1-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add spi-nor flash node and pinctrl configurations for the SC7280 IDP.

Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in V9:
 - No changes

Changes in V8:
 - No changes

 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 99f9ee5..37b8444 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -211,6 +211,20 @@
 	vcc-supply = <&vreg_l1c_1p8>;
 };
 
+&qspi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <37500000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -288,6 +302,19 @@
 
 /* PINCTRL - additions to nodes defined in sc7280.dtsi */
 
+&qspi_cs0 {
+	bias-disable;
+};
+
+&qspi_clk {
+	bias-disable;
+};
+
+&qspi_data01 {
+	/* High-Z when no transfers; nice to park the lines */
+	bias-pull-up;
+};
+
 &qup_uart5_default {
 	tx {
 		pins = "gpio46";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

