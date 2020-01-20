Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 294EA142FF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 17:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729268AbgATQcV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jan 2020 11:32:21 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36841 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729388AbgATQa4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jan 2020 11:30:56 -0500
Received: by mail-wr1-f67.google.com with SMTP id z3so116552wru.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2020 08:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N7NGrZiCykS9PVNmtZp1ptOeaDXAZnoM5ctYQxR/lvg=;
        b=QSsOUcv5sbMN/jNpK7aTdB6iNUIs9LcZCj7zAz2uDe9RPSmHi2pYBq4sxVKvBwayfn
         m0lEWRwvs6AS/gjytjve68ZbgBIA+jVzDm/sNKBb6OzyEtuY0Czesv2ZdMT09O0+KPf8
         BZ8BKjQNhKVIaY1QlwyT2SdPJzTSxT1Cjq4wLLTT1+WQLmiJBCnJv8zPylMm54byok2y
         rWUfz4IZtBlYd6NgVUfFP50YULIoFv4yeRsfQc4xGEtss1jJTK8kF+20W17dlZzlboZG
         M8qjYY4xJUMQXKZEJNTTjNc41zGPFz9WwExl8pW949UhgW++KCQJjYHVirF+hAjmfHCs
         PYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N7NGrZiCykS9PVNmtZp1ptOeaDXAZnoM5ctYQxR/lvg=;
        b=XCtnCW48WoKj3tpFkWjwRJVd481XgfBLiwYqRAkijdTr4ZM0jSjQB6sq1f5b0FELne
         /p0+FpeJWim0i7HuP0Ih1jUgK/RqRchL0VMToFD8xyp9/PGMS7ILRr2cZPA0a6GvdaD6
         4ItSMXyuKF+biRuW6g1tFmOGFo9SX1XDnuHW9M4ImhEcES8EgG5oDADLh/48E2J7hZyb
         /vDYTMRoOpR0PD8JgJfCrg6SIzPhB4RdOV1/Kfm7BqCNJWRx2EYcfIeWxq51W7LY16Gc
         3zHo7w/tYN/I21ba9lFq/zxCQV3bCR0D8IpzP8+05VqhJ8i2tCe7Pl1+pCVecGpzLLOa
         sn3Q==
X-Gm-Message-State: APjAAAUz6/9E+wNTrK0autzDUwRXZEsekf5sIRPdzRXezus1tzHc8RI6
        vQnrT5APnNEBboo2rfHXKoDBAkw1yI0=
X-Google-Smtp-Source: APXvYqwl3wpIwjQgy1fvEQ3/mo0Hjarhfo+OgL53l2owZZAbLWFGTXpOMHj6b/X3PzgEGzPhnIPQmw==
X-Received: by 2002:adf:a746:: with SMTP id e6mr291993wrd.329.1579537854667;
        Mon, 20 Jan 2020 08:30:54 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:30:53 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v2 06/19] dt-bindings: usb: dwc3: Add a gpio-usb-connector description
Date:   Mon, 20 Jan 2020 16:31:03 +0000
Message-Id: <20200120163116.1197682-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A USB connector should be a child node of the USB controller
connector/usb-connector.txt. This patch adds a property
"gpio_usb_connector" which declares a connector child device. Code in the
DWC3 driver will then

- Search for "gpio_usb_controller"
- Do an of_platform_populate() if found

This will have the effect of making the declared node a child of the USB
controller and will make sure that USB role-switch events detected with the
gpio_usb_controller driver propagate into the DWC3 controller code
appropriately.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..b019bd472f83 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -108,6 +108,9 @@ Optional properties:
 			When just one value, which means INCRX burst mode enabled. When
 			more than one value, which means undefined length INCR burst type
 			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
+ - gpio_usb_connector: Declares a USB connector named 'gpio_usb_connector' as a
+		       child node of the DWC3 block. Use when modelling a USB
+		       connector based on the gpio-usb-b-connector driver.
 
  - in addition all properties from usb-xhci.txt from the current directory are
    supported as well
@@ -121,4 +124,12 @@ dwc3@4a030000 {
 	interrupts = <0 92 4>
 	usb-phy = <&usb2_phy>, <&usb3,phy>;
 	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+	usb_con: gpio_usb_connector {
+		compatible = "gpio-usb-b-connector";
+		id-gpio = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+		vbus-gpio = <&pms405_gpios 12 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb3_vbus_reg>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb3_id_pin>, <&usb3_vbus_pin>;
+	};
 };
-- 
2.25.0

