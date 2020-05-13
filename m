Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5CB1D0C4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 11:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732555AbgEMJcT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 05:32:19 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:57584 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732544AbgEMJcS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 05:32:18 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 13 May 2020 15:01:35 +0530
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 13 May 2020 15:01:09 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 4341421789; Wed, 13 May 2020 15:01:07 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V5 09/10] arm64: dts: Add support for scm on IPQ8074 SoCs
Date:   Wed, 13 May 2020 15:01:04 +0530
Message-Id: <1589362265-22702-10-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589362265-22702-1-git-send-email-gokulsri@codeaurora.org>
References: <1589362265-22702-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enables scm support, clock is not needed for enabling scm interface.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 2b31823..4107614 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -10,6 +10,12 @@
 	model = "Qualcomm Technologies, Inc. IPQ8074";
 	compatible = "qcom,ipq8074";
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-ipq8074", "qcom,scm";
+		};
+	};
+
 	soc: soc {
 		#address-cells = <0x1>;
 		#size-cells = <0x1>;
-- 
2.7.4

