Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A923010B215
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2019 16:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbfK0PNy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Nov 2019 10:13:54 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:48553 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727194AbfK0PNf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Nov 2019 10:13:35 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Nov 2019 20:43:26 +0530
IronPort-SDR: uFejh9MXrKnUSsAyceESIRMObHLqEOdmBmXhpOzXJo6M3LZpFfDn5R885WR1At11XsABKsSGTm
 ndpLok4qpHG9fr1jfiSFl3dng7AGtI3lsudX9WRG7M6uoXKPCNmgaYBHV4P8mCpquufenYZeVc
 syfOHSm7wFCBpJ/PmyCo16IYDV31ayFJ9XlyyA+B5jyfNtBG5tEG6+lzUaqDoAdSAe6Td9Qcqn
 hgLpO+iK1nQiPMmyLfkLxE1o7gSD6kp4lZn3xIfbnLGsjZQAw6O+GC6FSRem8dIgtPDuIQTGUo
 eJJjGaG9pKq9Oym84DZAsl8D
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 27 Nov 2019 20:42:58 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 0E1CC398F; Wed, 27 Nov 2019 20:42:55 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V3 09/10] arm64: dts: Add support for scm on IPQ8074 SoCs
Date:   Wed, 27 Nov 2019 20:42:53 +0530
Message-Id: <1574867574-2216-10-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574867574-2216-1-git-send-email-gokulsri@codeaurora.org>
References: <1574867574-2216-1-git-send-email-gokulsri@codeaurora.org>
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
index 67ee5f5..6a61a63 100644
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
1.9.1

