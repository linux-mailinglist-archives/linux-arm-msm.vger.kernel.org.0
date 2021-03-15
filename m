Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF0233C5D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 19:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbhCOShO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 14:37:14 -0400
Received: from z11.mailgun.us ([104.130.96.11]:10249 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231906AbhCOSgy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 14:36:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615833414; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=YMXNstI74NOBT86lKLM6je3pqP/rcZpBSy0m7mXKDy0=; b=ghKtpminl7LbGqAfxNIuvqSZFIoy0qlikP37KBR7Vx+P5nOglk3eHiTA1JEAT6R6ZQeMNSIm
 +kX9foNaJb1by7Qs9tzvHRN9WYUo6uw9G+raLa5Pb+Ag+wl4KIIvePJ/seMdI4DENaZ8Oar1
 ZPezOGFYuhv2WnJXgQwa01Px3Kg=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 604fa9395d70193f88183463 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Mar 2021 18:36:41
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE83AC433CA; Mon, 15 Mar 2021 18:36:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 288A5C433C6;
        Mon, 15 Mar 2021 18:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 288A5C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>
Subject: [PATCHv2 4/4] arm64: dts: qcom: sc7280: Add Coresight support
Date:   Tue, 16 Mar 2021 00:05:49 +0530
Message-Id: <de07324628f88900b72357f4ef7f0c7db7e3409d.1615832893.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1615832893.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1615832893.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add coresight components found on SC7280 SoC.

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 489 +++++++++++++++++++++++++++
 1 file changed, 489 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index ae3d2b31364a..2cc478553935 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -316,6 +316,495 @@ uart5: serial@994000 {
 			};
 		};
 
+		stm@6002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0 0x06002000 0 0x1000>,
+			      <0 0x16280000 0 0x180000>;
+			reg-names = "stm-base", "stm-stimulus-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					stm_out: endpoint {
+						remote-endpoint = <&funnel0_in7>;
+					};
+				};
+			};
+		};
+
+		funnel@6041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0 0x06041000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					funnel0_out: endpoint {
+						remote-endpoint = <&merge_funnel_in0>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@7 {
+					reg = <7>;
+					funnel0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
+					};
+				};
+			};
+		};
+
+		funnel@6042000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0 0x06042000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					funnel1_out: endpoint {
+						remote-endpoint = <&merge_funnel_in1>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@4 {
+					reg = <4>;
+					funnel1_in4: endpoint {
+						remote-endpoint = <&apss_merge_funnel_out>;
+					};
+				};
+			};
+		};
+
+		funnel@6045000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0 0x06045000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					merge_funnel_out: endpoint {
+						remote-endpoint = <&swao_funnel_in>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					merge_funnel_in0: endpoint {
+						remote-endpoint = <&funnel0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					merge_funnel_in1: endpoint {
+						remote-endpoint = <&funnel1_out>;
+					};
+				};
+			};
+		};
+
+		replicator@6046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0 0x06046000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					replicator_out: endpoint {
+						remote-endpoint = <&etr_in>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					replicator_in: endpoint {
+						remote-endpoint = <&swao_replicator_out>;
+					};
+				};
+			};
+		};
+
+		etr@6048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0 0x06048000 0 0x1000>;
+			iommus = <&apps_smmu 0x04c0 0>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr_in: endpoint {
+						remote-endpoint = <&replicator_out>;
+					};
+				};
+			};
+		};
+
+		funnel@6b04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0 0x06b04000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					swao_funnel_out: endpoint {
+						remote-endpoint = <&etf_in>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@7 {
+					reg = <7>;
+					swao_funnel_in: endpoint {
+						remote-endpoint = <&merge_funnel_out>;
+					};
+				};
+			};
+		};
+
+		etf@6b05000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0 0x06b05000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					etf_out: endpoint {
+						remote-endpoint = <&swao_replicator_in>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					etf_in: endpoint {
+						remote-endpoint = <&swao_funnel_out>;
+					};
+				};
+			};
+		};
+
+		replicator@6b06000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0 0x06b06000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			qcom,replicator-loses-context;
+
+			out-ports {
+				port {
+					swao_replicator_out: endpoint {
+						remote-endpoint = <&replicator_in>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					swao_replicator_in: endpoint {
+						remote-endpoint = <&etf_out>;
+					};
+				};
+			};
+		};
+
+		etm@7040000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07040000 0 0x1000>;
+
+			cpu = <&CPU0>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm0_out: endpoint {
+						remote-endpoint = <&apss_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		etm@7140000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07140000 0 0x1000>;
+
+			cpu = <&CPU1>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm1_out: endpoint {
+						remote-endpoint = <&apss_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		etm@7240000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07240000 0 0x1000>;
+
+			cpu = <&CPU2>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm2_out: endpoint {
+						remote-endpoint = <&apss_funnel_in2>;
+					};
+				};
+			};
+		};
+
+		etm@7340000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07340000 0 0x1000>;
+
+			cpu = <&CPU3>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm3_out: endpoint {
+						remote-endpoint = <&apss_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		etm@7440000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07440000 0 0x1000>;
+
+			cpu = <&CPU4>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm4_out: endpoint {
+						remote-endpoint = <&apss_funnel_in4>;
+					};
+				};
+			};
+		};
+
+		etm@7540000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07540000 0 0x1000>;
+
+			cpu = <&CPU5>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm5_out: endpoint {
+						remote-endpoint = <&apss_funnel_in5>;
+					};
+				};
+			};
+		};
+
+		etm@7640000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07640000 0 0x1000>;
+
+			cpu = <&CPU6>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm6_out: endpoint {
+						remote-endpoint = <&apss_funnel_in6>;
+					};
+				};
+			};
+		};
+
+		etm@7740000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07740000 0 0x1000>;
+
+			cpu = <&CPU7>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm7_out: endpoint {
+						remote-endpoint = <&apss_funnel_in7>;
+					};
+				};
+			};
+		};
+
+		funnel@7800000 { /* APSS Funnel */
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0 0x07800000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					apss_funnel_out: endpoint {
+						remote-endpoint = <&apss_merge_funnel_in>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					apss_funnel_in0: endpoint {
+						remote-endpoint = <&etm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					apss_funnel_in1: endpoint {
+						remote-endpoint = <&etm1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					apss_funnel_in2: endpoint {
+						remote-endpoint = <&etm2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					apss_funnel_in3: endpoint {
+						remote-endpoint = <&etm3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					apss_funnel_in4: endpoint {
+						remote-endpoint = <&etm4_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					apss_funnel_in5: endpoint {
+						remote-endpoint = <&etm5_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+					apss_funnel_in6: endpoint {
+						remote-endpoint = <&etm6_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+					apss_funnel_in7: endpoint {
+						remote-endpoint = <&etm7_out>;
+					};
+				};
+			};
+		};
+
+		funnel@7810000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0 0x07810000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					apss_merge_funnel_out: endpoint {
+						remote-endpoint = <&funnel1_in4>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					apss_merge_funnel_in: endpoint {
+						remote-endpoint = <&apss_funnel_out>;
+					};
+				};
+			};
+		};
+
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc7280-llcc";
 			reg = <0 0x09200000 0 0xd0000>, <0 0x09600000 0 0x50000>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

