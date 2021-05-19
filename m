Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6DA9388878
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 09:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237063AbhESHuP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 03:50:15 -0400
Received: from guitar.tcltek.co.il ([192.115.133.116]:33968 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235284AbhESHuO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 03:50:14 -0400
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 81B25440DF6;
        Wed, 19 May 2021 10:48:42 +0300 (IDT)
From:   Baruch Siach <baruch@tkos.co.il>
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc:     Baruch Siach <baruch@tkos.co.il>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Marko <robert.marko@sartura.hr>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: ipq6018: add pwm node
Date:   Wed, 19 May 2021 10:48:46 +0300
Message-Id: <645bfb28f93e475e354b4763f932f16d712ad600.1621410526.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <70ced827689b7ab35d8f3b07db8d9ccd1489e3e2.1621410526.git.baruch@tkos.co.il>
References: <70ced827689b7ab35d8f3b07db8d9ccd1489e3e2.1621410526.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Describe the PWM block on IPQ6018.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 6ee7b99c21ec..2da75bb558ff 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -355,6 +355,15 @@ i2c_1: i2c@78b7000 { /* BLSP1 QUP2 */
 			status = "disabled";
 		};
 
+		pwm: pwm@1941010 {
+			#pwm-cells = <2>;
+			compatible = "qcom,pwm-ipq6018";
+			reg = <0x0 0x1941010 0x0 0x20>;
+			clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			clock-names = "core";
+			status = "disabled";
+		};
+
 		qpic_bam: dma-controller@7984000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x0 0x07984000 0x0 0x1a000>;
-- 
2.30.2

