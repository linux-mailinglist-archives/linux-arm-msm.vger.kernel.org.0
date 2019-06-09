Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E646A3A37D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jun 2019 06:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbfFIETg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jun 2019 00:19:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:58900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725770AbfFIETg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jun 2019 00:19:36 -0400
Received: from hector.attlocal.net (107-207-74-175.lightspeed.austtx.sbcglobal.net [107.207.74.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B92CF208E3;
        Sun,  9 Jun 2019 04:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560053976;
        bh=ILMIKm6unfoX0sFWJ1A3LaSPMfGyKOUWY4kQZ8AaS0A=;
        h=From:To:Cc:Subject:Date:From;
        b=0aA2xqD0SLfZNVTPTxO6F7sJ5iWvdnlSeaNhAzr5uGtqJKNV8DETsmrkVuYRB87Dy
         ZqCOZuse653Y5SwYrA/m8PootAso45zVBtIaxQ0V395yvVyXMLBImGtH+/+/7wTI01
         /3+ZsFhH0AQyeBYM3vCuWk6oEzxAoJRzKU3pD8TA=
From:   Andy Gross <agross@kernel.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, arm@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>
Subject: [PATCH] arm64: qcom: qcs404: Add reset-cells to GCC node
Date:   Sat,  8 Jun 2019 23:19:32 -0500
Message-Id: <1560053972-32273-1-git-send-email-agross@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds a reset-cells property to the gcc controller on the QCS404.
Without this in place, we get warnings like the following if nodes reference
a gcc reset:

arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_property):
/soc@0/remoteproc@b00000: Missing property '#reset-cells' in node
/soc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
  also defined at arch/arm64/boot/dts/qcom/qcs404-evb.dtsi:82.18-84.3
  DTC     arch/arm64/boot/dts/qcom/qcs404-evb-4000.dtb
arch/arm64/boot/dts/qcom/qcs404.dtsi:261.38-310.5: Warning (resets_property):
/soc@0/remoteproc@b00000: Missing property '#reset-cells' in node
/soc@0/clock-controller@1800000 or bad phandle (referred from resets[0])
  also defined at arch/arm64/boot/dts/qcom/qcs404-evb.dtsi:82.18-84.3

Signed-off-by: Andy Gross <agross@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 342788a..086cadb 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -426,6 +426,7 @@
 			compatible = "qcom,gcc-qcs404";
 			reg = <0x01800000 0x80000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 
 			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
 			assigned-clock-rates = <19200000>;
-- 
2.7.4

