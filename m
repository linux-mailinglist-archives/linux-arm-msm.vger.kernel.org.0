Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 429F8519E53
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 13:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349010AbiEDLs0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 07:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349001AbiEDLsU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 07:48:20 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE372C120;
        Wed,  4 May 2022 04:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651664684; x=1683200684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=vIyQqpA0yx8OAjlt5c/KqcZV8wfFwxsagPB8ZOZExZo=;
  b=qZJlRosGZa6qbsC2/4WDQChSyGtNNYfrpvc7jieljkyBEJyjP3xh2zIV
   t0N7rR1QYpaT9VDS7itrfwF5mKs8icxSSJZ2cxR24oOM1s1kVndC43DBy
   RItbpoqlC2nVKap2OxhAMzv7HYXHz8ToTlJ6kWFFM1VKe74I35a11Ze4W
   0=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2022 04:44:44 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 04:44:44 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 04:44:44 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 04:44:39 -0700
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <robh+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rohkumar@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <dianders@chromium.org>, <swboyd@chromium.org>,
        <judyhsiao@chromium.org>
CC:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        "Venkata Prasad Potturu" <quic_potturu@quicinc.com>
Subject: [PATCH v11 03/12] arm64: dts: qcom: sc7280: Enable digital codecs and soundwire for CRD 3.0/3.1
Date:   Wed, 4 May 2022 17:14:00 +0530
Message-ID: <1651664649-25290-4-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1651664649-25290-1-git-send-email-quic_srivasam@quicinc.com>
References: <1651664649-25290-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable rx, tx and va macro codecs and soundwire nodes for
CRD rev5+ (aka CRD 3.0/3.1) boards.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi        | 22 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
index dc61bad..81a24e4 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
@@ -81,6 +81,18 @@ ap_ts_pen_1v8: &i2c13 {
 	};
 };
 
+&lpass_rx_macro {
+	status = "okay";
+};
+
+&lpass_tx_macro {
+	status = "okay";
+};
+
+&lpass_va_macro {
+	status = "okay";
+};
+
 /* For nvme */
 &pcie1 {
 	status = "okay";
@@ -101,6 +113,14 @@ ap_ts_pen_1v8: &i2c13 {
 	status = "okay";
 };
 
+&swr0 {
+	status = "okay";
+};
+
+&swr1 {
+	status = "okay";
+};
+
 /* PINCTRL - BOARD-SPECIFIC */
 
 /*
diff --git a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
index b833ba1..11d37cb 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
@@ -293,6 +293,10 @@
 	modem-init;
 };
 
+&lpass_va_macro {
+	vdd-micb-supply = <&vreg_bob>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -326,6 +330,24 @@
 	no-sdio;
 };
 
+&swr0 {
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010d00";
+		reg = <0 4>;
+		#sound-dai-cells = <1>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr1 {
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010d00";
+		reg = <0 3>;
+		#sound-dai-cells = <1>;
+		qcom,tx-port-mapping = <1 2 3 4>;
+	};
+};
+
 uart_dbg: &uart5 {
 	compatible = "qcom,geni-debug-uart";
 	status = "okay";
-- 
2.7.4

