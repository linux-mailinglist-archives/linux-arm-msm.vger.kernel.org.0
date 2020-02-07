Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 269F5155F39
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 21:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgBGURa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 15:17:30 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40533 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727704AbgBGURK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 15:17:10 -0500
Received: by mail-wr1-f67.google.com with SMTP id t3so382541wru.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2020 12:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Kx77RkRZ6BLkxPPbqLY1opgnPyzoSH+OO3s+PAvU9w=;
        b=NNB0eR4gF6D0akB/wLDQi7VF/G5bIzb4qKIfynYdFaZ8eTK+nyksf4OrlNCNSWq4eN
         KRa2Oyj4VLS97PAlV/QkoMEGde8ibAoR0X520f2kpy7mZPrV6g5iPywabTYNghPWzrhT
         MxWJ67kXwItgti4oSjPqWXq14BFZQqgOJAH6zYs2UU9lyzm0fnn9fUSRaYRPWjF0Z2Db
         dPdWEaiijpGMiSLrFdNVdnQZljOuQHN6XlwqvoZHSCv4esNNqTa2fo1bnUa/nGXGoh1q
         xyoQagw2WIgXTm7N4LRbDsgtmThwMnraMQgWui+YfHnHS5hb9qLT14F/ALxkL+yE+kwE
         RrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Kx77RkRZ6BLkxPPbqLY1opgnPyzoSH+OO3s+PAvU9w=;
        b=pg1VVdpGIRk4uZ20VrmPi4ysCDCaVhhZD+CQ4hmpi+e63n+8Lwfpy869jplzG/NcRJ
         I3UQVx6iEEXwFnSfxOa7Hgl+yn6e/ugn9pp4nUY7ciwl3fZAbQhX9pimaJlFoDEFQFOM
         QPMoWuAvJFF2aLK0m7YEd4LmZi+1XAbxA4G4YNgf5S0GkAqsj6hcx0MJzw2BHAvl7wjw
         GDz1+dTQbVOHlP6xlnMh6H8EEw1IW+2VRThWF1Z/Rb6LTdirz8F8e8q53TrnjeWRLqzA
         GTdEFOYGaJJkZSAo8sIcx1sqAcQubUEqhrygBbWxBkue/fOQuKAlUDpt3tr9+qEh/uW4
         tZHA==
X-Gm-Message-State: APjAAAWblxWHVvS8Vft8xLIya4JliwNUXwrSicmNVYjFQgmr83zWGneX
        org/2hOFl04QIJzck/DZocT2N8rLddI=
X-Google-Smtp-Source: APXvYqyy9kx88k9/7jnobOn8K+q/1HXrmCbZ7g4EgrcNIObDg4TNQBpwDP1md3U93qBrLs5DOr57DA==
X-Received: by 2002:adf:df90:: with SMTP id z16mr678252wrl.273.1581106628513;
        Fri, 07 Feb 2020 12:17:08 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id h2sm5018542wrt.45.2020.02.07.12.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 12:17:07 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v5 16/18] arm64: dts: qcom: qcs404-evb: Describe external VBUS regulator
Date:   Fri,  7 Feb 2020 20:16:52 +0000
Message-Id: <20200207201654.641525-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

VBUS is supplied by an external regulator controlled by a GPIO pin. This
patch models the regulator as regulator-usb3-vbus.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index abfb2a9a37e9..01ef59e8e5b7 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -33,6 +33,18 @@ vdd_esmps3_3p3: vdd-esmps3-3p3-regulator {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	usb3_vbus_reg: regulator-usb3-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "VBUS_BOOST_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pms405_gpios 3 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_vbus_boost_pin>;
+		vin-supply = <&vph_pwr>;
+		enable-active-high;
+	};
 };
 
 &blsp1_uart3 {
-- 
2.25.0

