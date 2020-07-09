Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61975219EBB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 13:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbgGILGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 07:06:23 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40974 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726813AbgGILGW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 07:06:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594292781; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=yxKB+f0iO9CExiHd4llgeNv4VdmTVWRtzF0m4fF95jk=; b=CIvd6ZbhTDS1igoUe0iN63BVw297gih4+3uu6SnVGvjULEsW6wUNXowA1k6cdK4LizX9KLmb
 SPVdRtUuBBHsjZdEPAK2JsPQb2W++IK9Tg+UNd0IqmjlWBIpHpG8HdN0WGXqnPpDzkonc/QQ
 cwpHo3Feg0br15qHeiFkLOibrMc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-west-2.postgun.com with SMTP id
 5f06f9e8f97e988aab0f76b4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 11:05:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65DE7C4339C; Thu,  9 Jul 2020 11:05:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D95EAC433CA;
        Thu,  9 Jul 2020 11:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D95EAC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 4/4] arm64: dts: sc7180: Add DSI and MDP OPP tables and power-domains
Date:   Thu,  9 Jul 2020 16:34:34 +0530
Message-Id: <1594292674-15632-5-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594292674-15632-1-git-send-email-rnayak@codeaurora.org>
References: <1594292674-15632-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the OPP tables for DSI and MDP based on the perf state/clk
requirements, and add the power-domains property to specify the
scalable power domain.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 49 ++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 2be81a2..1ce895f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2642,6 +2642,8 @@
 						       <19200000>,
 						       <19200000>,
 						       <19200000>;
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmhpd SC7180_CX>;
 
 				interrupt-parent = <&mdss>;
 				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
@@ -2659,6 +2661,31 @@
 						};
 					};
 				};
+
+				mdp_opp_table: mdp-opp-table {
+					compatible = "operating-points-v2";
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <200000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-345000000 {
+						opp-hz = /bits/ 64 <345000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-460000000 {
+						opp-hz = /bits/ 64 <460000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+
 			};
 
 			dsi0: dsi@ae94000 {
@@ -2682,6 +2709,9 @@
 					      "iface",
 					      "bus";
 
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SC7180_CX>;
+
 				phys = <&dsi_phy>;
 				phy-names = "dsi";
 
@@ -2707,6 +2737,25 @@
 						};
 					};
 				};
+
+				dsi_opp_table: dsi-opp-table {
+					compatible = "operating-points-v2";
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
 			};
 
 			dsi_phy: dsi-phy@ae94400 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

