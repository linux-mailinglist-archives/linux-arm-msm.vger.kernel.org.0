Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6264131C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 12:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbhIUKlH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 06:41:07 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:33886 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbhIUKlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 06:41:07 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 21 Sep 2021 03:39:39 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 21 Sep 2021 03:39:37 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg01-blr.qualcomm.com with ESMTP; 21 Sep 2021 16:09:26 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id 15CAA215EE; Tue, 21 Sep 2021 16:09:25 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org, mka@chromium.org,
        dianders@chromium.org, Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V9 8/8] arm64: dts: sc7280: Add aliases for I2C and SPI
Date:   Tue, 21 Sep 2021 16:09:06 +0530
Message-Id: <1632220746-25943-9-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632220746-25943-1-git-send-email-rajpat@codeaurora.org>
References: <1632220746-25943-1-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add aliases for i2c and spi for sc7280 soc.

Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in V9:
 - No changes

Changes in V8:
 - No changes

Changes in V7:
 - As per Stephen's comments, Sorted alias names for i2c and spi as per alphabet order

Changes in V6:
 - As per Doug's comments, added aliases for i2c and spi


 arch/arm64/boot/dts/qcom/sc7280.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8ebd3ae..7a0102c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -26,8 +26,40 @@
 	chosen { };
 
 	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
+		i2c14 = &i2c14;
+		i2c15 = &i2c15;
 		mmc1 = &sdhc_1;
 		mmc2 = &sdhc_2;
+		spi0 = &spi0;
+		spi1 = &spi1;
+		spi2 = &spi2;
+		spi3 = &spi3;
+		spi4 = &spi4;
+		spi5 = &spi5;
+		spi6 = &spi6;
+		spi7 = &spi7;
+		spi8 = &spi8;
+		spi9 = &spi9;
+		spi10 = &spi10;
+		spi11 = &spi11;
+		spi12 = &spi12;
+		spi13 = &spi13;
+		spi14 = &spi14;
+		spi15 = &spi15;
 	};
 
 	clocks {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

