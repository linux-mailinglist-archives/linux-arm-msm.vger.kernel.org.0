Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72CCF6FFD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 14:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730466AbfGVMgJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 08:36:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:36012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730462AbfGVMgJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 08:36:09 -0400
Received: from localhost.localdomain (unknown [223.226.98.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF6D9218EA;
        Mon, 22 Jul 2019 12:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563798968;
        bh=1PLvDY/QA297kMSesie+GVrZ3hCS68jBy8NwFMw4DJg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OZiFduZ7bHBj8TlLdO9xK3v0ZWsKGWhjFIICaizGZxTuwNVEdtXHDTgiHux3vhDFo
         roSj9ChIL3txUsLd7d7EjStfjOxz6h2yYPZiuPKJGRgnanwJ+JpdMy/Ch+EjRRbZb2
         c0M8aowUprVYGOhbL0NO5ZI2I1XIUn4EDi7oSiLw=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: qcom: sdm845-cheza: remove macro from unit name
Date:   Mon, 22 Jul 2019 18:04:22 +0530
Message-Id: <20190722123422.4571-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722123422.4571-1-vkoul@kernel.org>
References: <20190722123422.4571-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Unit name is supposed to be a number, using a macro with hex value is
not recommended, so add the value in unit name.

arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:966.16-969.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4d: unit name should not have leading "0x"
arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:971.16-974.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4e: unit name should not have leading "0x"
arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:976.16-979.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4f: unit name should not have leading "0x"
arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:981.16-984.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x50: unit name should not have leading "0x"
arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:986.16-989.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x51: unit name should not have leading "0x"

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 1ebbd568dfd7..9b27b8346ba1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -963,27 +963,27 @@ ap_ts_i2c: &i2c14 {
 };
 
 &pm8998_adc {
-	adc-chan@ADC5_AMUX_THM1_100K_PU {
+	adc-chan@4d {
 		reg = <ADC5_AMUX_THM1_100K_PU>;
 		label = "sdm_temp";
 	};
 
-	adc-chan@ADC5_AMUX_THM2_100K_PU {
+	adc-chan@4e {
 		reg = <ADC5_AMUX_THM2_100K_PU>;
 		label = "quiet_temp";
 	};
 
-	adc-chan@ADC5_AMUX_THM3_100K_PU {
+	adc-chan@4f {
 		reg = <ADC5_AMUX_THM3_100K_PU>;
 		label = "lte_temp_1";
 	};
 
-	adc-chan@ADC5_AMUX_THM4_100K_PU {
+	adc-chan@50 {
 		reg = <ADC5_AMUX_THM4_100K_PU>;
 		label = "lte_temp_2";
 	};
 
-	adc-chan@ADC5_AMUX_THM5_100K_PU {
+	adc-chan@51 {
 		reg = <ADC5_AMUX_THM5_100K_PU>;
 		label = "charger_temp";
 	};
-- 
2.20.1

