Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06D452C4E41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 06:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387760AbgKZFYp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 00:24:45 -0500
Received: from z5.mailgun.us ([104.130.96.5]:50223 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387757AbgKZFYp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 00:24:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606368283; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=OWzjBshBlQE5El5REVx1mM2joW+HZBD1QkehXTSsUh4=; b=w56y5MkNUDqWNQLN3VxO3QkaWZRwUygna9XkHflPpbSHpqmXd523OEkZ7myQk2rZkNWQMNB4
 7By/z2HlKnXLods96EeQhwrOOtmqk5syr0Djc6iGFGQlPx2VlpgVOHGNbOUx7bBjRoAlU7yJ
 YVorWYuahG8FYu8UkQcoeZz4g50=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fbf3c15a5a29b56a1975c3d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Nov 2020 05:24:37
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4CC88C43462; Thu, 26 Nov 2020 05:24:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 29DFFC43460;
        Thu, 26 Nov 2020 05:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 29DFFC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        coresight@lists.linaro.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2] arm64: dts: qcom: sm8150: Add Coresight support
Date:   Thu, 26 Nov 2020 10:54:22 +0530
Message-Id: <20201126052422.24869-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add coresight components found on Qualcomm Technologies,
Inc. SM8150 SoC.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---

Changes in v2:
 * Rebase on top of qcom for-next branch
 * Add reviewed-by tag collected from previous version

---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 591 +++++++++++++++++++++++++++
 1 file changed, 591 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 8dac11c6012e..5270bda7418f 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -798,6 +798,597 @@ glink-edge {
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
+						remote-endpoint = <&swao_replicator_out>;
+					};
+				};
+			};
+		};
+
+		funnel@6043000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0 0x06043000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					funnel2_out: endpoint {
+						remote-endpoint = <&merge_funnel_in2>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+					funnel2_in2: endpoint {
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
+						remote-endpoint = <&etf_in>;
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
+
+				port@2 {
+					reg = <2>;
+					merge_funnel_in2: endpoint {
+						remote-endpoint = <&funnel2_out>;
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
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					replicator_out0: endpoint {
+						remote-endpoint = <&etr_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					replicator_out1: endpoint {
+						remote-endpoint = <&replicator1_in>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					replicator_in0: endpoint {
+						remote-endpoint = <&etf_out>;
+					};
+				};
+			};
+		};
+
+		etf@6047000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0 0x06047000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					etf_out: endpoint {
+						remote-endpoint = <&replicator_in0>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					etf_in: endpoint {
+						remote-endpoint = <&merge_funnel_out>;
+					};
+				};
+			};
+		};
+
+		etr@6048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0 0x06048000 0 0x1000>;
+			iommus = <&apps_smmu 0x05e0 0x0>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr_in: endpoint {
+						remote-endpoint = <&replicator_out0>;
+					};
+				};
+			};
+		};
+
+		replicator@604a000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0 0x0604a000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+					replicator1_out: endpoint {
+						remote-endpoint = <&swao_funnel_in>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+					replicator1_in: endpoint {
+						remote-endpoint = <&replicator_out1>;
+					};
+				};
+			};
+		};
+
+		funnel@6b08000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0 0x06b08000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					swao_funnel_out: endpoint {
+						remote-endpoint = <&swao_etf_in>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@6 {
+					reg = <6>;
+					swao_funnel_in: endpoint {
+						remote-endpoint = <&replicator1_out>;
+					};
+				};
+			};
+		};
+
+		etf@6b09000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0 0x06b09000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					swao_etf_out: endpoint {
+						remote-endpoint = <&swao_replicator_in>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					swao_etf_in: endpoint {
+						remote-endpoint = <&swao_funnel_out>;
+					};
+				};
+			};
+		};
+
+		replicator@6b0a000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0 0x06b0a000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			qcom,replicator-loses-context;
+
+			out-ports {
+				port {
+					swao_replicator_out: endpoint {
+						remote-endpoint = <&funnel1_in4>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					swao_replicator_in: endpoint {
+						remote-endpoint = <&swao_etf_out>;
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
+						remote-endpoint = <&funnel2_in2>;
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
 		remoteproc_cdsp: remoteproc@8300000 {
 			compatible = "qcom,sm8150-cdsp-pas";
 			reg = <0x0 0x08300000 0x0 0x4040>;

base-commit: 04cb77f047655cfc1f53aa8e17f7df361ada2846
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

