Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4377A3C2A21
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 22:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhGIUL3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 16:11:29 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:40819 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbhGIUL3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 16:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1625861325; x=1657397325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6exCK3yFf7819/7R8UcfvKH4goBf4X/dWlPBPrO/xS8=;
  b=YveZjF7+6foMfi1sMcdjaGH5sgatdzb52361X6RWLHh8oVPG/EhqSznL
   ZjNBrFyPIxDDlML18bgicRfvxZp0qWKfhRBonExrsku84Jk2VW50z0S8Z
   JMAJrPf11xznwZRFGk3bMuanGdbxYWd21489Z6p1ES0QvXKibmVLdBY+6
   g=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 09 Jul 2021 13:08:45 -0700
X-QCInternal: smtphost
Received: from nalasexr03e.na.qualcomm.com ([10.49.195.114])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Jul 2021 13:08:45 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nalasexr03e.na.qualcomm.com (10.49.195.114) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18; Fri, 9 Jul 2021 13:08:44 -0700
From:   <quic_vamslank@quicinc.com>
To:     <agross@kernel.org>, <robh+dt@kernel.org>,
        <bjorn.andersson@linaro.org>, <linus.walleij@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <manivannan.sadhasivam@linaro.org>,
        "Vamsi krishna Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH 1/1] ARM: dts: qcom: sdx65: Add pincontrol node
Date:   Fri, 9 Jul 2021 13:08:19 -0700
Message-ID: <20210709200819.20373-2-quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709200819.20373-1-quic_vamslank@quicinc.com>
References: <20210709200819.20373-1-quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03g.na.qualcomm.com (10.85.0.49) To
 nalasexr03e.na.qualcomm.com (10.49.195.114)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>

This commit adds pincontrol node to SDX65 dts.

Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
---
 arch/arm/boot/dts/qcom-sdx65.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx65.dtsi b/arch/arm/boot/dts/qcom-sdx65.dtsi
index 4b5e7248c34d..155635d1de2f 100644
--- a/arch/arm/boot/dts/qcom-sdx65.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx65.dtsi
@@ -96,6 +96,17 @@ blsp1_uart3: serial@831000 {
 			status = "disabled";
 		};
 
+		tlmm: pinctrl@f100000 {
+			compatible = "qcom,sdx65-pinctrl";
+			reg = <0xf100000 0x300000>;
+			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			interrupt-parent = <&intc>;
+			#interrupt-cells = <2>;
+		};
+
 		pdc: interrupt-controller@b210000 {
 			compatible = "qcom,sdx65-pdc", "qcom,pdc";
 			reg = <0xb210000 0x10000>;
-- 
2.32.0

