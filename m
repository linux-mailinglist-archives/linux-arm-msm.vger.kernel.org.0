Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC8383A95FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 11:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbhFPJYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 05:24:37 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59520 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbhFPJYg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 05:24:36 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 16 Jun 2021 02:22:31 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Jun 2021 02:22:29 -0700
X-QCInternal: smtphost
Received: from c-sbhanu-linux.qualcomm.com ([10.242.50.201])
  by ironmsg01-blr.qualcomm.com with ESMTP; 16 Jun 2021 14:52:27 +0530
Received: by c-sbhanu-linux.qualcomm.com (Postfix, from userid 2344807)
        id 1F1A24CFC; Wed, 16 Jun 2021 14:52:26 +0530 (IST)
From:   Shaik Sajida Bhanu <sbhanu@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, sartgarg@codeaurora.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        sibis@codeaurora.org, okukatla@codeaurora.org, djakov@kernel.org,
        cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Subject: [PATCH V2] arm64: dts: qcom: sc7180: bus votes for eMMC and SD card
Date:   Wed, 16 Jun 2021 14:52:24 +0530
Message-Id: <1623835344-29607-1-git-send-email-sbhanu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update peak bandwidth and average bandwidth vote values for eMMC and
SDCard. This patch calculates the new votes as per the comments from
https://lore.kernel.org/patchwork/patch/1399453/#1619566.

Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
---

Changes since V1:
	- Updated the commit message with proper information.
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index fb1d9ad..a5d58eb 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -727,15 +727,15 @@
 				opp-100000000 {
 					opp-hz = /bits/ 64 <100000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
-					opp-peak-kBps = <100000 100000>;
-					opp-avg-kBps = <100000 50000>;
+					opp-peak-kBps = <1800000 600000>;
+					opp-avg-kBps = <100000 0>;
 				};
 
 				opp-384000000 {
 					opp-hz = /bits/ 64 <384000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
-					opp-peak-kBps = <600000 900000>;
-					opp-avg-kBps = <261438 300000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5400000 1600000>;
+					opp-avg-kBps = <390000 0>;
 				};
 			};
 		};
@@ -2585,15 +2585,15 @@
 				opp-100000000 {
 					opp-hz = /bits/ 64 <100000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
-					opp-peak-kBps = <160000 100000>;
-					opp-avg-kBps = <80000 50000>;
+					opp-peak-kBps = <1800000 600000>;
+					opp-avg-kBps = <100000 0>;
 				};
 
 				opp-202000000 {
 					opp-hz = /bits/ 64 <202000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
-					opp-peak-kBps = <200000	120000>;
-					opp-avg-kBps = <100000 60000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5400000 1600000>;
+					opp-avg-kBps = <200000 0>;
 				};
 			};
 		};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

