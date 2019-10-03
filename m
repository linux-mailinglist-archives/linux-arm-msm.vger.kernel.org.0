Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE92DC986A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 08:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfJCGpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 02:45:16 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47756 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfJCGpQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 02:45:16 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 036B36118D; Thu,  3 Oct 2019 06:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570085115;
        bh=ddn1c+BnNBD6lRBn/L5g+wqfrNnO9jM0DJsrX1V0GnU=;
        h=From:To:Cc:Subject:Date:From;
        b=g2i2g5HL8MaZado17xz/mvM3+t5XrHjkW69tRgMSO74pwrrpp3q5N839/zMYmVu5H
         Fjnt7HL7QdexEs3ur6hU0kgocVkLey2Wjc+9QIERB0ViYBZvfV0eGJIY5fO6SeT2C/
         d4PSuZC//cXdYng/ofrXhDDibqdtEsaJIh+S/seI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 41D646074F;
        Thu,  3 Oct 2019 06:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570085113;
        bh=ddn1c+BnNBD6lRBn/L5g+wqfrNnO9jM0DJsrX1V0GnU=;
        h=From:To:Cc:Subject:Date:From;
        b=XOq5jo14T6wz1Tod0HWMs3uwRvFAnfAy/rPvdEX935sKpm+IHTmeCCedo6AAm/za0
         LYbofXHYIlOFAj84aWnlajSlHE82QPO/RnSK9clUXK6/re1YtqBP5sKRPn8roRKPcb
         FWGaiuApxfgU/ZQXn6yMM4kFbN8bjMVauZmPWfeY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 41D646074F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: msm8998: Disable coresight by default
Date:   Thu,  3 Oct 2019 12:14:49 +0530
Message-Id: <20191003064449.2201-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Boot failure has been reported on MSM8998 based laptop when
coresight is enabled. This is most likely due to lack of
firmware support for coresight on production device when
compared to debug device like MTP where this issue is not
observed. So disable coresight by default for MSM8998 and
enable it only for MSM8998 MTP.

Reported-and-tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Fixes: 783abfa2249a ("arm64: dts: qcom: msm8998: Add Coresight support")
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 68 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi     | 51 +++++++++++------
 2 files changed, 102 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 108667ce4f31..8d15572d18e6 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -27,6 +27,66 @@
 	status = "okay";
 };
 
+&etf {
+	status = "okay";
+};
+
+&etm1 {
+	status = "okay";
+};
+
+&etm2 {
+	status = "okay";
+};
+
+&etm3 {
+	status = "okay";
+};
+
+&etm4 {
+	status = "okay";
+};
+
+&etm5 {
+	status = "okay";
+};
+
+&etm6 {
+	status = "okay";
+};
+
+&etm7 {
+	status = "okay";
+};
+
+&etm8 {
+	status = "okay";
+};
+
+&etr {
+	status = "okay";
+};
+
+&funnel1 {
+	status = "okay";
+};
+
+&funnel2 {
+	status = "okay";
+};
+
+&funnel3 {
+	status = "okay";
+};
+
+&funnel4 {
+	status = "okay";
+};
+
+&funnel5 {
+	status = "okay";
+};
+
 &pm8005_lsid1 {
 	pm8005-regulators {
 		compatible = "qcom,pm8005-regulators";
@@ -51,6 +111,10 @@
 	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
 };
 
+&replicator1 {
+	status = "okay";
+};
+
 &rpm_requests {
 	pm8998-regulators {
 		compatible = "qcom,rpm-pm8998-regulators";
@@ -249,6 +313,10 @@
 	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
 };
 
+&stm {
+	status = "okay";
+};
+
 &ufshc {
 	vcc-supply = <&vreg_l20a_2p95>;
 	vccq-supply = <&vreg_l26a_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index c6f81431983e..ffb64fc239ee 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -998,11 +998,12 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		stm@6002000 {
+		stm: stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x06002000 0x1000>,
 			      <0x16280000 0x180000>;
 			reg-names = "stm-base", "stm-data-base";
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1016,9 +1017,10 @@
 			};
 		};
 
-		funnel@6041000 {
+		funnel1: funnel@6041000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x06041000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1045,9 +1047,10 @@
 			};
 		};
 
-		funnel@6042000 {
+		funnel2: funnel@6042000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x06042000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1075,9 +1078,10 @@
 			};
 		};
 
-		funnel@6045000 {
+		funnel3: funnel@6045000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x06045000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1113,9 +1117,10 @@
 			};
 		};
 
-		replicator@6046000 {
+		replicator1: replicator@6046000 {
 			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
 			reg = <0x06046000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1137,9 +1142,10 @@
 			};
 		};
 
-		etf@6047000 {
+		etf: etf@6047000 {
 			compatible = "arm,coresight-tmc", "arm,primecell";
 			reg = <0x06047000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1163,9 +1169,10 @@
 			};
 		};
 
-		etr@6048000 {
+		etr: etr@6048000 {
 			compatible = "arm,coresight-tmc", "arm,primecell";
 			reg = <0x06048000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1181,9 +1188,10 @@
 			};
 		};
 
-		etm@7840000 {
+		etm1: etm@7840000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x07840000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1200,9 +1208,10 @@
 			};
 		};
 
-		etm@7940000 {
+		etm2: etm@7940000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x07940000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1219,9 +1228,10 @@
 			};
 		};
 
-		etm@7a40000 {
+		etm3: etm@7a40000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x07a40000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1238,9 +1248,10 @@
 			};
 		};
 
-		etm@7b40000 {
+		etm4: etm@7b40000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x07b40000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1257,9 +1268,10 @@
 			};
 		};
 
-		funnel@7b60000 { /* APSS Funnel */
+		funnel4: funnel@7b60000 { /* APSS Funnel */
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x07b60000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1343,9 +1355,10 @@
 			};
 		};
 
-		funnel@7b70000 {
+		funnel5: funnel@7b70000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x07b70000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1369,9 +1382,10 @@
 			};
 		};
 
-		etm@7c40000 {
+		etm5: etm@7c40000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x07c40000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1385,9 +1399,10 @@
 			};
 		};
 
-		etm@7d40000 {
+		etm6: etm@7d40000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x07d40000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1401,9 +1416,10 @@
 			};
 		};
 
-		etm@7e40000 {
+		etm7: etm@7e40000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x07e40000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1417,9 +1433,10 @@
 			};
 		};
 
-		etm@7f40000 {
+		etm8: etm@7f40000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
 			reg = <0x07f40000 0x1000>;
+			status = "disabled";
 
 			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

