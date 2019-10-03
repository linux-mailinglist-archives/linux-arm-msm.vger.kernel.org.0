Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85937C9EE3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 14:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730204AbfJCMxN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 08:53:13 -0400
Received: from ns.iliad.fr ([212.27.33.1]:38228 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730203AbfJCMxN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 08:53:13 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 6158520B92;
        Thu,  3 Oct 2019 14:53:11 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 40E361FF2C;
        Thu,  3 Oct 2019 14:53:11 +0200 (CEST)
Subject: Re: [PATCH] arm64: dts: qcom: msm8998: Disable coresight by default
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        DT <devicetree@vger.kernel.org>
References: <20191003064449.2201-1-saiprakash.ranjan@codeaurora.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <aecbc7a2-05fd-f30f-81c7-81947dc31c9f@free.fr>
Date:   Thu, 3 Oct 2019 14:53:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003064449.2201-1-saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Oct  3 14:53:11 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/10/2019 08:44, Sai Prakash Ranjan wrote:

> Boot failure has been reported on MSM8998 based laptop when
> coresight is enabled. This is most likely due to lack of
> firmware support for coresight on production device when
> compared to debug device like MTP where this issue is not
> observed. So disable coresight by default for MSM8998 and
> enable it only for MSM8998 MTP.
> 
> Reported-and-tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Fixes: 783abfa2249a ("arm64: dts: qcom: msm8998: Add Coresight support")
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 68 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8998.dtsi     | 51 +++++++++++------
>  2 files changed, 102 insertions(+), 17 deletions(-)

Just wanted to toss an alternative, based on Suzuki's suggestion
(i.e. move the coresight nodes to a separate file)


 arch/arm64/boot/dts/qcom/msm8998-coresight.dtsi | 439 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi       |   1 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi           | 435 -----------------------
 3 files changed, 440 insertions(+), 435 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-coresight.dtsi b/arch/arm64/boot/dts/qcom/msm8998-coresight.dtsi
new file mode 100644
index 000000000000..eabf4e4194fd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8998-coresight.dtsi
@@ -0,0 +1,439 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2019, The Linux Foundation. All rights reserved. */
+
+&soc {
+	stm@6002000 {
+		compatible = "arm,coresight-stm", "arm,primecell";
+		reg = <0x06002000 0x1000>,
+		      <0x16280000 0x180000>;
+		reg-names = "stm-base", "stm-data-base";
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		out-ports {
+			port {
+				stm_out: endpoint {
+					remote-endpoint = <&funnel0_in7>;
+				};
+			};
+		};
+	};
+
+	funnel@6041000 {
+		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+		reg = <0x06041000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		out-ports {
+			port {
+				funnel0_out: endpoint {
+					remote-endpoint =
+					  <&merge_funnel_in0>;
+				};
+			};
+		};
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@7 {
+				reg = <7>;
+				funnel0_in7: endpoint {
+					remote-endpoint = <&stm_out>;
+				};
+			};
+		};
+	};
+
+	funnel@6042000 {
+		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+		reg = <0x06042000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		out-ports {
+			port {
+				funnel1_out: endpoint {
+					remote-endpoint =
+					  <&merge_funnel_in1>;
+				};
+			};
+		};
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@6 {
+				reg = <6>;
+				funnel1_in6: endpoint {
+					remote-endpoint =
+					  <&apss_merge_funnel_out>;
+				};
+			};
+		};
+	};
+
+	funnel@6045000 {
+		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+		reg = <0x06045000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		out-ports {
+			port {
+				merge_funnel_out: endpoint {
+					remote-endpoint =
+					  <&etf_in>;
+				};
+			};
+		};
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				merge_funnel_in0: endpoint {
+					remote-endpoint =
+					  <&funnel0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				merge_funnel_in1: endpoint {
+					remote-endpoint =
+					  <&funnel1_out>;
+				};
+			};
+		};
+	};
+
+	replicator@6046000 {
+		compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+		reg = <0x06046000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		out-ports {
+			port {
+				replicator_out: endpoint {
+					remote-endpoint = <&etr_in>;
+				};
+			};
+		};
+
+		in-ports {
+			port {
+				replicator_in: endpoint {
+					remote-endpoint = <&etf_out>;
+				};
+			};
+		};
+	};
+
+	etf@6047000 {
+		compatible = "arm,coresight-tmc", "arm,primecell";
+		reg = <0x06047000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		out-ports {
+			port {
+				etf_out: endpoint {
+					remote-endpoint =
+					  <&replicator_in>;
+				};
+			};
+		};
+
+		in-ports {
+			port {
+				etf_in: endpoint {
+					remote-endpoint =
+					  <&merge_funnel_out>;
+				};
+			};
+		};
+	};
+
+	etr@6048000 {
+		compatible = "arm,coresight-tmc", "arm,primecell";
+		reg = <0x06048000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+		arm,scatter-gather;
+
+		in-ports {
+			port {
+				etr_in: endpoint {
+					remote-endpoint =
+					  <&replicator_out>;
+				};
+			};
+		};
+	};
+
+	etm@7840000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0x07840000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		cpu = <&CPU0>;
+
+		out-ports {
+			port {
+				etm0_out: endpoint {
+					remote-endpoint =
+					  <&apss_funnel_in0>;
+				};
+			};
+		};
+	};
+
+	etm@7940000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0x07940000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		cpu = <&CPU1>;
+
+		out-ports {
+			port {
+				etm1_out: endpoint {
+					remote-endpoint =
+					  <&apss_funnel_in1>;
+				};
+			};
+		};
+	};
+
+	etm@7a40000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0x07a40000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		cpu = <&CPU2>;
+
+		out-ports {
+			port {
+				etm2_out: endpoint {
+					remote-endpoint =
+					  <&apss_funnel_in2>;
+				};
+			};
+		};
+	};
+
+	etm@7b40000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0x07b40000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		cpu = <&CPU3>;
+
+		out-ports {
+			port {
+				etm3_out: endpoint {
+					remote-endpoint =
+					  <&apss_funnel_in3>;
+				};
+			};
+		};
+	};
+
+	funnel@7b60000 { /* APSS Funnel */
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0x07b60000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		out-ports {
+			port {
+				apss_funnel_out: endpoint {
+					remote-endpoint =
+					  <&apss_merge_funnel_in>;
+				};
+			};
+		};
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				apss_funnel_in0: endpoint {
+					remote-endpoint =
+					  <&etm0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				apss_funnel_in1: endpoint {
+					remote-endpoint =
+					  <&etm1_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				apss_funnel_in2: endpoint {
+					remote-endpoint =
+					  <&etm2_out>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				apss_funnel_in3: endpoint {
+					remote-endpoint =
+					  <&etm3_out>;
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+				apss_funnel_in4: endpoint {
+					remote-endpoint =
+					  <&etm4_out>;
+				};
+			};
+
+			port@5 {
+				reg = <5>;
+				apss_funnel_in5: endpoint {
+					remote-endpoint =
+					  <&etm5_out>;
+				};
+			};
+
+			port@6 {
+				reg = <6>;
+				apss_funnel_in6: endpoint {
+					remote-endpoint =
+					  <&etm6_out>;
+				};
+			};
+
+			port@7 {
+				reg = <7>;
+				apss_funnel_in7: endpoint {
+					remote-endpoint =
+					  <&etm7_out>;
+				};
+			};
+		};
+	};
+
+	funnel@7b70000 {
+		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+		reg = <0x07b70000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		out-ports {
+			port {
+				apss_merge_funnel_out: endpoint {
+					remote-endpoint =
+					  <&funnel1_in6>;
+				};
+			};
+		};
+
+		in-ports {
+			port {
+				apss_merge_funnel_in: endpoint {
+					remote-endpoint =
+					  <&apss_funnel_out>;
+				};
+			};
+		};
+	};
+
+	etm@7c40000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0x07c40000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		cpu = <&CPU4>;
+
+		port{
+			etm4_out: endpoint {
+				remote-endpoint = <&apss_funnel_in4>;
+			};
+		};
+	};
+
+	etm@7d40000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0x07d40000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		cpu = <&CPU5>;
+
+		port{
+			etm5_out: endpoint {
+				remote-endpoint = <&apss_funnel_in5>;
+			};
+		};
+	};
+
+	etm@7e40000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0x07e40000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		cpu = <&CPU6>;
+
+		port{
+			etm6_out: endpoint {
+				remote-endpoint = <&apss_funnel_in6>;
+			};
+		};
+	};
+
+	etm@7f40000 {
+		compatible = "arm,coresight-etm4x", "arm,primecell";
+		reg = <0x07f40000 0x1000>;
+
+		clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+		clock-names = "apb_pclk", "atclk";
+
+		cpu = <&CPU7>;
+
+		port{
+			etm7_out: endpoint {
+				remote-endpoint = <&apss_funnel_in7>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 108667ce4f31..9b586b3206fc 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -5,6 +5,7 @@
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 #include "pm8005.dtsi"
+#include "msm8998-coresight.dtsi"
 
 / {
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index c6f81431983e..4b66a1c588f8 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -998,441 +998,6 @@
 			#interrupt-cells = <0x2>;
 		};
 
-		stm@6002000 {
-			compatible = "arm,coresight-stm", "arm,primecell";
-			reg = <0x06002000 0x1000>,
-			      <0x16280000 0x180000>;
-			reg-names = "stm-base", "stm-data-base";
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			out-ports {
-				port {
-					stm_out: endpoint {
-						remote-endpoint = <&funnel0_in7>;
-					};
-				};
-			};
-		};
-
-		funnel@6041000 {
-			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0x06041000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			out-ports {
-				port {
-					funnel0_out: endpoint {
-						remote-endpoint =
-						  <&merge_funnel_in0>;
-					};
-				};
-			};
-
-			in-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@7 {
-					reg = <7>;
-					funnel0_in7: endpoint {
-						remote-endpoint = <&stm_out>;
-					};
-				};
-			};
-		};
-
-		funnel@6042000 {
-			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0x06042000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			out-ports {
-				port {
-					funnel1_out: endpoint {
-						remote-endpoint =
-						  <&merge_funnel_in1>;
-					};
-				};
-			};
-
-			in-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@6 {
-					reg = <6>;
-					funnel1_in6: endpoint {
-						remote-endpoint =
-						  <&apss_merge_funnel_out>;
-					};
-				};
-			};
-		};
-
-		funnel@6045000 {
-			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0x06045000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			out-ports {
-				port {
-					merge_funnel_out: endpoint {
-						remote-endpoint =
-						  <&etf_in>;
-					};
-				};
-			};
-
-			in-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					merge_funnel_in0: endpoint {
-						remote-endpoint =
-						  <&funnel0_out>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					merge_funnel_in1: endpoint {
-						remote-endpoint =
-						  <&funnel1_out>;
-					};
-				};
-			};
-		};
-
-		replicator@6046000 {
-			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
-			reg = <0x06046000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			out-ports {
-				port {
-					replicator_out: endpoint {
-						remote-endpoint = <&etr_in>;
-					};
-				};
-			};
-
-			in-ports {
-				port {
-					replicator_in: endpoint {
-						remote-endpoint = <&etf_out>;
-					};
-				};
-			};
-		};
-
-		etf@6047000 {
-			compatible = "arm,coresight-tmc", "arm,primecell";
-			reg = <0x06047000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			out-ports {
-				port {
-					etf_out: endpoint {
-						remote-endpoint =
-						  <&replicator_in>;
-					};
-				};
-			};
-
-			in-ports {
-				port {
-					etf_in: endpoint {
-						remote-endpoint =
-						  <&merge_funnel_out>;
-					};
-				};
-			};
-		};
-
-		etr@6048000 {
-			compatible = "arm,coresight-tmc", "arm,primecell";
-			reg = <0x06048000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-			arm,scatter-gather;
-
-			in-ports {
-				port {
-					etr_in: endpoint {
-						remote-endpoint =
-						  <&replicator_out>;
-					};
-				};
-			};
-		};
-
-		etm@7840000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x07840000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			cpu = <&CPU0>;
-
-			out-ports {
-				port {
-					etm0_out: endpoint {
-						remote-endpoint =
-						  <&apss_funnel_in0>;
-					};
-				};
-			};
-		};
-
-		etm@7940000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x07940000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			cpu = <&CPU1>;
-
-			out-ports {
-				port {
-					etm1_out: endpoint {
-						remote-endpoint =
-						  <&apss_funnel_in1>;
-					};
-				};
-			};
-		};
-
-		etm@7a40000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x07a40000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			cpu = <&CPU2>;
-
-			out-ports {
-				port {
-					etm2_out: endpoint {
-						remote-endpoint =
-						  <&apss_funnel_in2>;
-					};
-				};
-			};
-		};
-
-		etm@7b40000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x07b40000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			cpu = <&CPU3>;
-
-			out-ports {
-				port {
-					etm3_out: endpoint {
-						remote-endpoint =
-						  <&apss_funnel_in3>;
-					};
-				};
-			};
-		};
-
-		funnel@7b60000 { /* APSS Funnel */
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x07b60000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			out-ports {
-				port {
-					apss_funnel_out: endpoint {
-						remote-endpoint =
-						  <&apss_merge_funnel_in>;
-					};
-				};
-			};
-
-			in-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					apss_funnel_in0: endpoint {
-						remote-endpoint =
-						  <&etm0_out>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					apss_funnel_in1: endpoint {
-						remote-endpoint =
-						  <&etm1_out>;
-					};
-				};
-
-				port@2 {
-					reg = <2>;
-					apss_funnel_in2: endpoint {
-						remote-endpoint =
-						  <&etm2_out>;
-					};
-				};
-
-				port@3 {
-					reg = <3>;
-					apss_funnel_in3: endpoint {
-						remote-endpoint =
-						  <&etm3_out>;
-					};
-				};
-
-				port@4 {
-					reg = <4>;
-					apss_funnel_in4: endpoint {
-						remote-endpoint =
-						  <&etm4_out>;
-					};
-				};
-
-				port@5 {
-					reg = <5>;
-					apss_funnel_in5: endpoint {
-						remote-endpoint =
-						  <&etm5_out>;
-					};
-				};
-
-				port@6 {
-					reg = <6>;
-					apss_funnel_in6: endpoint {
-						remote-endpoint =
-						  <&etm6_out>;
-					};
-				};
-
-				port@7 {
-					reg = <7>;
-					apss_funnel_in7: endpoint {
-						remote-endpoint =
-						  <&etm7_out>;
-					};
-				};
-			};
-		};
-
-		funnel@7b70000 {
-			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0x07b70000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			out-ports {
-				port {
-					apss_merge_funnel_out: endpoint {
-						remote-endpoint =
-						  <&funnel1_in6>;
-					};
-				};
-			};
-
-			in-ports {
-				port {
-					apss_merge_funnel_in: endpoint {
-						remote-endpoint =
-						  <&apss_funnel_out>;
-					};
-				};
-			};
-		};
-
-		etm@7c40000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x07c40000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			cpu = <&CPU4>;
-
-			port{
-				etm4_out: endpoint {
-					remote-endpoint = <&apss_funnel_in4>;
-				};
-			};
-		};
-
-		etm@7d40000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x07d40000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			cpu = <&CPU5>;
-
-			port{
-				etm5_out: endpoint {
-					remote-endpoint = <&apss_funnel_in5>;
-				};
-			};
-		};
-
-		etm@7e40000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x07e40000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			cpu = <&CPU6>;
-
-			port{
-				etm6_out: endpoint {
-					remote-endpoint = <&apss_funnel_in6>;
-				};
-			};
-		};
-
-		etm@7f40000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x07f40000 0x1000>;
-
-			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
-			clock-names = "apb_pclk", "atclk";
-
-			cpu = <&CPU7>;
-
-			port{
-				etm7_out: endpoint {
-					remote-endpoint = <&apss_funnel_in7>;
-				};
-			};
-		};
-
 		spmi_bus: spmi@800f000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg =	<0x0800f000 0x1000>,
