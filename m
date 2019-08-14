Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89E678D3D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 14:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbfHNMwT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 08:52:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:35316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbfHNMwS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 08:52:18 -0400
Received: from localhost.localdomain (unknown [171.76.115.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66F0D20679;
        Wed, 14 Aug 2019 12:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565787137;
        bh=y9Udmlikj8Xlw26tM8G37ayGSDYc1TpuB5aLIUMtNf4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GE2YkdCJ9dUIF6wcLDjUVKlYAycNf0xMs6EfMEGO1XaopM+0SqQM6S2IR8SsdruF2
         4FasFfaEYzaVPhw5V6AyBAyz7c7fWjd0vOO9BsMM8P8aPCQbnIPkstumfDesT6M5el
         E9ko2Zg+q+jFj/OpA45sIl8SqEoscDYrp7c1RdoY=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/22] arm64: dts: qcom: pm8150: Add vadc node
Date:   Wed, 14 Aug 2019 18:19:58 +0530
Message-Id: <20190814125012.8700-9-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814125012.8700-1-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PM8150 PMIC contains vadc device so add node for this.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/pm8150.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
index 2cb727ce30eb..a137def0e26a 100644
--- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
@@ -5,6 +5,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 
 &spmi_bus {
 	pm8150_0: pm8150@0 {
@@ -25,6 +26,33 @@
 			};
 		};
 
+		pm8150_adc: adc@3100 {
+			compatible = "qcom,spmi-adc5";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#io-channel-cells = <1>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+
+			ref-gnd@0 {
+				reg = <ADC5_REF_GND>;
+				qcom,pre-scaling = <1 1>;
+				label = "ref_gnd";
+			};
+
+			vref-1p25@1 {
+				reg = <ADC5_1P25VREF>;
+				qcom,pre-scaling = <1 1>;
+				label = "vref_1p25";
+			};
+
+			die-temp@6 {
+				reg = <ADC5_DIE_TEMP>;
+				qcom,pre-scaling = <1 1>;
+				label = "die_temp";
+			};
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>;
-- 
2.20.1

