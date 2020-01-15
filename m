Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E06913C531
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 15:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgAOON3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 09:13:29 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38000 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730256AbgAOON3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 09:13:29 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so15908056wrh.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 06:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OAQIBEtAB539ew/tof0mNoTYE3sNhscOlsV6pfoQF5g=;
        b=gs/z4tk4uFXXpj/yR4pB6Y9QVxyxwScRANH5ordeJtq8PSbgKFB4RS0FmPEndaNOby
         idsxHHb+xh0XR7tA+nsp+f73HnB0SIKRMWzbLQIy1MPD1zYGnGc7Gi4on33Dqg3SxtSs
         I2mFJf47QTsU0r37z588nkk1sKl//Rc6r0f2EX90EmZnJ0EWSkQbeaeYMYrUGiPtrFFF
         EFQUQQIEXBhARL4asIi7vRhf4bjU67B4PLotwT6jfw8+IDgEu33xSFja/esqsDtDexMN
         KEanjCsHPesyOLZrnA3QKbuklE1CMcHj4VRrrtH3qijobgMMNtwEf/Q/CRDyD6rdsKfo
         i6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OAQIBEtAB539ew/tof0mNoTYE3sNhscOlsV6pfoQF5g=;
        b=iTZdHwXdYyJ6Vk2dISgOuc5n6CvLGNFLBhkaU3lzlVxLyu3ahT2PIj7TPF6znD4jdZ
         sqRfgVz/UKyFZdyVYapXHpIHnB0cHdrXST4hyz90eH9RBsdTnQJ2YVbs74JTixiJh1S3
         8Nrr9L8x1f9hUhL81iNVSvhMsNF2rvgKnwGhgUQs+vTa0g/ljFqbMzRB9a1Go1uf6u7L
         V6ZBytxCPN9dBriZgxScv3yoC9xLD6Slk+WWo3FbAWzW2MWb0kH62SEswa43BINfpEEy
         rMsFF7QLGEIz6IbrvvEV1AGYGS99gJmeh+wX+7HiPvGEO2/Cq49fPSfFO6VbJYOrLKOW
         5cPw==
X-Gm-Message-State: APjAAAUeSp8sv3uDvX/d2WshDk84Pvflk8a++cXsKDTL5H/WUlbQITaw
        Sr1+7lPZ8WsSgf4G1X+lOB4xhXWFv5I=
X-Google-Smtp-Source: APXvYqzBNIB6sLizgF8/elzXx2JKJwR3Qm2h8MtVZZ6TJ6hyaGw3jAbQWdFFHKTn2qlDFLT5G/I1vQ==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr32581677wrq.348.1579097607065;
        Wed, 15 Jan 2020 06:13:27 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:26 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 16/19] arm64: dts: qcom: qcs404-evb: Describe external VBUS regulator
Date:   Wed, 15 Jan 2020 14:13:30 +0000
Message-Id: <20200115141333.1222676-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
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
2.24.0

