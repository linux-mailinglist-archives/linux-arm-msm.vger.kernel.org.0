Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBED44F600
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Nov 2021 02:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236162AbhKNBbH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 20:31:07 -0500
Received: from relay07.th.seeweb.it ([5.144.164.168]:49741 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236130AbhKNBbE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 20:31:04 -0500
Received: from localhost.localdomain (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 3ED6D3EE3F;
        Sun, 14 Nov 2021 02:28:09 +0100 (CET)
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
Subject: [PATCH 07/16] arm64: dts: qcom: *8350* Consolidate PON/RESIN usage
Date:   Sun, 14 Nov 2021 02:27:46 +0100
Message-Id: <20211114012755.112226-7-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114012755.112226-1-konrad.dybcio@somainline.org>
References: <20211114012755.112226-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Disable PON/RESIN keys by default and keep the RESIN keycode set-per-board, as
these settings are not common between devices (one cannot even assume all
devices have buttons nowadays..).

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/pmk8350.dtsi   | 7 ++++---
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts | 9 +++++++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
index 769f9726806f..0f94c46a1444 100644
--- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
@@ -19,16 +19,17 @@ pmk8350_pon: pon@1300 {
 			compatible = "qcom,pm8998-pon";
 			reg = <0x1300>;
 
-			pwrkey {
+			pon_pwrkey: pwrkey {
 				compatible = "qcom,pmk8350-pwrkey";
 				interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
 				linux,code = <KEY_POWER>;
+				status = "disabled";
 			};
 
-			resin {
+			pon_resin: resin {
 				compatible = "qcom,pmk8350-resin";
 				interrupts = <0x0 0x13 0x6 IRQ_TYPE_EDGE_BOTH>;
-				linux,code = <KEY_VOLUMEDOWN>;
+				status = "disabled";
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
index 122c282a62df..52cf3045602f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
@@ -289,6 +289,15 @@ &pmk8350_rtc {
 	status = "okay";
 };
 
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.33.1

