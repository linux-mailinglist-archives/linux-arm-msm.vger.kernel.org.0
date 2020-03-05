Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 511C017A0AC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 08:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgCEHtd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 02:49:33 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:11206 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725900AbgCEHtd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 02:49:33 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Mar 2020 13:19:30 +0530
Received: from c-rkambl-linux1.qualcomm.com ([10.242.50.190])
  by ironmsg01-blr.qualcomm.com with ESMTP; 05 Mar 2020 13:19:14 +0530
Received: by c-rkambl-linux1.qualcomm.com (Postfix, from userid 2344811)
        id 620F639C1; Thu,  5 Mar 2020 13:19:13 +0530 (IST)
From:   Rajeshwari <rkambl@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sanm@codeaurora.org,
        sivaa@codeaurora.org, Rajeshwari <rkambl@codeaurora.org>
Subject: [PATCH 1/1] arm64: dts: qcom: sc7180: Added critical trip point Thermal-zones node
Date:   Thu,  5 Mar 2020 13:19:07 +0530
Message-Id: <1583394547-12779-2-git-send-email-rkambl@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583394547-12779-1-git-send-email-rkambl@codeaurora.org>
References: <1583394547-12779-1-git-send-email-rkambl@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To enable kernel critical shutdown feature added critical trip point to
all non CPU sensors to perform shutdown in orderly manner.

Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 78 ++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 253274d..ca876ed 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2366,6 +2366,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				aoss0_crit: aoss0_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
 			};
 		};
 
@@ -2421,6 +2427,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				gpuss0_crit: gpuss0_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
 			};
 		};
 
@@ -2436,6 +2448,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				gpuss1_crit: gpuss1_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
 			};
 		};
 
@@ -2451,6 +2469,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				aoss1_crit: aoss1_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
 			};
 		};
 
@@ -2466,6 +2490,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				cwlan_crit: cwlan_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
 			};
 		};
 
@@ -2481,6 +2511,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				audio_crit: audio_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
 			};
 		};
 
@@ -2496,6 +2532,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				ddr_crit: ddr_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
 			};
 		};
 
@@ -2511,6 +2553,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				q6_hvx_crit: q6_hvx_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
 			};
 		};
 
@@ -2526,6 +2574,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				camera_crit: camera_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
 			};
 		};
 
@@ -2541,6 +2595,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				mdm_crit: mdm_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
 			};
 		};
 
@@ -2556,6 +2616,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				mdm_dsp_crit: mdm_dsp_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
 			};
 		};
 
@@ -2571,6 +2637,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				npu_crit: npu_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
 			};
 		};
 
@@ -2586,6 +2658,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				video_crit: video_crit {
+					temperature = <110000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
 			};
 		};
 	};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

