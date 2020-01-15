Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAF9B13C57C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 15:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730131AbgAOOO5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 09:14:57 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33844 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729818AbgAOONP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 09:13:15 -0500
Received: by mail-wm1-f66.google.com with SMTP id w5so4844003wmi.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 06:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DIsjmUswGvrRKxCdfebndQX7l7F0RNfqSxsw3e2vjmY=;
        b=eUvoHbu4Q+Fw95TSJOpyi7I3EFyO/IEac7uJmtcTjJ2Ckc7KiIoodCBzxBfTDNUkif
         jJfKGbiYzH5rw7EXesMekD2yTq0APHlTuOb3dSGHR2FzKOG9rAGwf13OVXS55xEoGH5c
         1GdET20TP4kDvH0eOc5fteIFGVC1K9FYx2Muwi5irkGQ/6yJmIDLe4wlC8GAjvF+qDkG
         oV73J916yNPKPemBh1mtELTVYVo8zIfsttSGsbeBn1CqBuzYbO14+CXDnzesAGNOzVMW
         npdB60/CMgUuNkQEgN13q1ro2RFU9t9YfGsg24zdw499liCLYr4doKbUct9n4NkAPwMO
         dU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DIsjmUswGvrRKxCdfebndQX7l7F0RNfqSxsw3e2vjmY=;
        b=KpgqgnROst0W0zqTtJUftAFsqjzYqrGxIpi4KlqSakJIJM0ABf/uGZGgrPNCtQMi0P
         4jS7xAjntXZXSF9smEKpHr2+x48BHTj6JdhmRXguberwtqCIo5wLWBd/pZA4UulwsJbh
         Mcgu/PEkcGmSidrAXFZnk1jmcqAjJb96GpAg11HeGHgZKkgFL0BgJJ719xqGnJJVTJ1o
         lwHonxzfjKv892BNlY2sAweFa6/EQd5kMGHVxQ/ZCBe5ktTTz6K2gO9QkhJFy76cJh4k
         8n8XWuCYFSKtYAMX4c6J0GcG8zKU1fep8z+XyfWfagU1NC9e2Oxs/9/fBCPwOmFMF6Hq
         zj5Q==
X-Gm-Message-State: APjAAAW/0nLwGpBJ0RlVagS78Yhqlp33zlzJvLqtkH9/JblGAlRao5eV
        bnWsiDOmEl1t2pYb0aHfVz3kfRIdglo=
X-Google-Smtp-Source: APXvYqzSzoI7ZzoyJ3yUHknZ5H6GNhKJ7SRZnV2SCM3yJ1cJyW8Ll+w4cA+3el5jiBAe1Q8RJ7itew==
X-Received: by 2002:a05:600c:224d:: with SMTP id a13mr34458090wmm.57.1579097593348;
        Wed, 15 Jan 2020 06:13:13 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:12 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 06/19] dt-bindings: usb: dwc3: Add a gpio-usb-connector description
Date:   Wed, 15 Jan 2020 14:13:20 +0000
Message-Id: <20200115141333.1222676-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
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
2.24.0

