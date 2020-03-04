Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D028217904C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 13:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387776AbgCDMYa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 07:24:30 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:44453 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388048AbgCDMY3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 07:24:29 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Mar 2020 17:54:24 +0530
Received: from c-rkambl-linux1.qualcomm.com ([10.242.50.190])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Mar 2020 17:54:08 +0530
Received: by c-rkambl-linux1.qualcomm.com (Postfix, from userid 2344811)
        id 432FB3A8B; Wed,  4 Mar 2020 17:54:07 +0530 (IST)
From:   Rajeshwari <rkambl@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sanm@codeaurora.org,
        sivaa@codeaurora.org, Rajeshwari <rkambl@codeaurora.org>
Subject: [PATCH 1/1] arm64: dts: qcom: sc7180: Added critical trip point Thermal-zones node
Date:   Wed,  4 Mar 2020 17:53:55 +0530
Message-Id: <1583324635-8271-2-git-send-email-rkambl@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583324635-8271-1-git-send-email-rkambl@codeaurora.org>
References: <1583324635-8271-1-git-send-email-rkambl@codeaurora.org>
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
index b8a72cf..7e5f14f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1956,6 +1956,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				aoss0_crit: aoss0_crit {
+                                        temperature = <110000>;
+                                        hysteresis = <2000>;
+                                        type = "critical";
+                                };
 			};
 		};
 
@@ -2011,6 +2017,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				gpuss0_crit: gpuss0_crit {
+                                        temperature = <110000>;
+                                        hysteresis = <2000>;
+                                        type = "critical";
+                                };
 			};
 		};
 
@@ -2026,6 +2038,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				gpuss1_crit: gpuss1_crit {
+                                        temperature = <110000>;
+                                        hysteresis = <2000>;
+                                        type = "critical";
+                                };
 			};
 		};
 
@@ -2041,6 +2059,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				aoss1_crit: aoss1_crit {
+                                        temperature = <110000>;
+                                        hysteresis = <2000>;
+                                        type = "critical";
+                                };
 			};
 		};
 
@@ -2056,6 +2080,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				cwlan_crit: cwlan_crit {
+                                        temperature = <110000>;
+                                        hysteresis = <2000>;
+                                        type = "critical";
+                                };
 			};
 		};
 
@@ -2071,6 +2101,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				audio_crit: audio_crit {
+                                        temperature = <110000>;
+                                        hysteresis = <2000>;
+                                        type = "critical";
+                                };
 			};
 		};
 
@@ -2086,6 +2122,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				ddr_crit: ddr_crit {
+                                        temperature = <110000>;
+                                        hysteresis = <2000>;
+                                        type = "critical";
+                                };
 			};
 		};
 
@@ -2101,6 +2143,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				q6_hvx_crit: q6_hvx_crit {
+                                        temperature = <110000>;
+                                        hysteresis = <2000>;
+                                        type = "critical";
+                                };
 			};
 		};
 
@@ -2116,6 +2164,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				camera_crit: camera_crit {
+                                        temperature = <110000>;
+                                        hysteresis = <2000>;
+                                        type = "critical";
+                                };
 			};
 		};
 
@@ -2131,6 +2185,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				mdm_crit: mdm_crit {
+                                        temperature = <110000>;
+                                        hysteresis = <2000>;
+                                        type = "critical";
+                                };
 			};
 		};
 
@@ -2146,6 +2206,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				mdm_dsp_crit: mdm_dsp_crit {
+                                        temperature = <110000>;
+                                        hysteresis = <2000>;
+                                        type = "critical";
+                                };
 			};
 		};
 
@@ -2161,6 +2227,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				npu_crit: npu_crit {
+                                        temperature = <110000>;
+                                        hysteresis = <2000>;
+                                        type = "critical";
+                                };
 			};
 		};
 
@@ -2176,6 +2248,12 @@
 					hysteresis = <2000>;
 					type = "hot";
 				};
+
+				video_crit: video_crit {
+                                        temperature = <110000>;
+                                        hysteresis = <2000>;
+                                        type = "critical";
+                                };
 			};
 		};
 	};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

