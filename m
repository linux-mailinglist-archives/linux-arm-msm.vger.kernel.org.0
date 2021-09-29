Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7FB41BE8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 07:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244164AbhI2FMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 01:12:21 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:33524 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234626AbhI2FMU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 01:12:20 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 28 Sep 2021 22:10:40 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 Sep 2021 22:10:38 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg02-blr.qualcomm.com with ESMTP; 29 Sep 2021 10:40:18 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id 1AE5E21633; Wed, 29 Sep 2021 10:40:17 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org, mka@chromium.org,
        Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V1] arm64: dts: qcom: sc7280: Add 200MHz in qspi_opp_table
Date:   Wed, 29 Sep 2021 10:38:43 +0530
Message-Id: <1632892123-11006-1-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add 200MHz OPP in qspi_opp_table

Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 92b6b65..5f1efb2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -499,6 +499,11 @@
 			required-opps = <&rpmhpd_opp_svs>;
 		};
 
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
 		opp-300000000 {
 			opp-hz = /bits/ 64 <300000000>;
 			required-opps = <&rpmhpd_opp_nom>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

