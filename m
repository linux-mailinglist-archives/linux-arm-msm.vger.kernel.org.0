Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 828BA177230
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 10:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbgCCJRE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 04:17:04 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:55025 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728100AbgCCJRE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 04:17:04 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Mar 2020 14:46:58 +0530
Received: from c-rkambl-linux1.qualcomm.com ([10.242.50.190])
  by ironmsg01-blr.qualcomm.com with ESMTP; 03 Mar 2020 14:46:49 +0530
Received: by c-rkambl-linux1.qualcomm.com (Postfix, from userid 2344811)
        id E38173683; Tue,  3 Mar 2020 14:46:48 +0530 (IST)
From:   Rajeshwari <rkambl@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sanm@codeaurora.org,
        sivaa@codeaurora.org, Rajeshwari <rkambl@codeaurora.org>
Subject: [PATCH 1/1] arm64: dts: qcom: sc7180: Changed all sensor values Thermal-zones node
Date:   Tue,  3 Mar 2020 14:46:36 +0530
Message-Id: <1583226996-24747-2-git-send-email-rkambl@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583226996-24747-1-git-send-email-rkambl@codeaurora.org>
References: <1583226996-24747-1-git-send-email-rkambl@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To enable kernel critical shutdown feature all sensors threshold values
should be 110C to perform shutdown in orderly manner and changed trip
point from hot to critical.

Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 52 ++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d068584..55fd156 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1952,9 +1952,9 @@
 
 			trips {
 				aoss0_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "critical";
 				};
 			};
 		};
@@ -2007,9 +2007,9 @@
 
 			trips {
 				gpuss0_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "critical";
 				};
 			};
 		};
@@ -2022,9 +2022,9 @@
 
 			trips {
 				gpuss1_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "critical";
 				};
 			};
 		};
@@ -2037,9 +2037,9 @@
 
 			trips {
 				aoss1_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "critical";
 				};
 			};
 		};
@@ -2052,9 +2052,9 @@
 
 			trips {
 				cwlan_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "critical";
 				};
 			};
 		};
@@ -2067,9 +2067,9 @@
 
 			trips {
 				audio_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "critical";
 				};
 			};
 		};
@@ -2082,9 +2082,9 @@
 
 			trips {
 				ddr_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "critical";
 				};
 			};
 		};
@@ -2097,9 +2097,9 @@
 
 			trips {
 				q6_hvx_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "critical";
 				};
 			};
 		};
@@ -2112,9 +2112,9 @@
 
 			trips {
 				camera_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "critical";
 				};
 			};
 		};
@@ -2127,9 +2127,9 @@
 
 			trips {
 				mdm_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "critical";
 				};
 			};
 		};
@@ -2142,9 +2142,9 @@
 
 			trips {
 				mdm_dsp_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "critical";
 				};
 			};
 		};
@@ -2157,9 +2157,9 @@
 
 			trips {
 				npu_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "critical";
 				};
 			};
 		};
@@ -2172,9 +2172,9 @@
 
 			trips {
 				video_alert0: trip-point0 {
-					temperature = <90000>;
+					temperature = <110000>;
 					hysteresis = <2000>;
-					type = "hot";
+					type = "critical";
 				};
 			};
 		};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

