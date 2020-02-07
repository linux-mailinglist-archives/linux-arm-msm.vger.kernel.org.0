Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBBC6155F62
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 21:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgBGUSK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 15:18:10 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38147 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbgBGURA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 15:17:00 -0500
Received: by mail-wm1-f67.google.com with SMTP id a9so4154620wmj.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2020 12:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YJAqrsEVC7Ekr/URFS4yzXVcz6M9nFcDb80ARG3rIgM=;
        b=WZ51lh1fq0MYo0SCtyIFC3oYHS7ViiqD5i868ejJZ4aPhJc5v0XzJfPKVXBMWyETki
         703NY7DnDV1gbrk2DvH5XQ/oDt0eCrkXK/w4w+LO8gLpve7UgrSUrHegxKasmjTUWAlu
         YVK8a4BkKVmgKch9RioLapCS0q9em8AFQULhvw416KbFu0miOhkEhJhrkfm9lEIPYrwy
         yz9F1nHBxynF2yiMuQCDl1Xj4ottYTeTMFo6kvyIAdTShW4F1l076OiDxwBW8n8/Hu1S
         oRCw0t9Vcr1hmhNuj/l5NSNPqjGYrvFvd3Ql9v3zjyar4lkB0ohNvAHSn6iK10PaWJf3
         +PDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YJAqrsEVC7Ekr/URFS4yzXVcz6M9nFcDb80ARG3rIgM=;
        b=aBqEgmh1be97htOl0QOAGPCRQt8ciIBqhdNrA5vwwjmuQLPJVjYLfp1qLutOBOGUKJ
         wnK4CjOlkVfEC5zh5cy+wQkrDn0EpoHQp4lT0El5yO4Y7sRKzdwoeVdUDfBgNKO95b/E
         MsBbQbcZA0RbQYHhaVCGyuiZ81VeA7LY4o3/xVVCHUB2lVR/1ug8zKWzayN9Qom0eMPk
         7l09S91SoDA+FM92861NCleXJinzDw0iI/wA6hUMFFmfqJTqdV44PMz+0Cz1Nzg40kLX
         3oq5CAaAxXIF2dmYpHYGatAzrJtPMhMXDTMERj832IvBlD7CJFOjZaXcToWQZU3lQiNe
         5tdg==
X-Gm-Message-State: APjAAAWmX5iqu0YOJI+ocxSZk94wZHBf/QjEARWWENdmJGDgqftQfXbt
        udLmlrepOx7FhMH949Miqz4+rBQ3iIU=
X-Google-Smtp-Source: APXvYqzezawQiQ2oHWWJh6wPEXDEUNqGENo1mV0NNbnQdK2tooXjya/h3bB3B0brBsWwqRPxKD4k5w==
X-Received: by 2002:a1c:6645:: with SMTP id a66mr17223wmc.121.1581106618314;
        Fri, 07 Feb 2020 12:16:58 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id h2sm5018542wrt.45.2020.02.07.12.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 12:16:57 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v5 07/18] dt-bindings: usb: dwc3: Add a gpio-usb-connector example
Date:   Fri,  7 Feb 2020 20:16:43 +0000
Message-Id: <20200207201654.641525-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A USB connector should be a child node of the USB controller
connector/usb-connector.txt. This patch adds an example of how to do this
to the dwc3 binding descriptions.

It is necessary to declare a connector as a child-node of a USB controller
for role-switching to work, so this example should be helpful to others
implementing that.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..4e1e4afccee6 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -121,4 +121,12 @@ dwc3@4a030000 {
 	interrupts = <0 92 4>
 	usb-phy = <&usb2_phy>, <&usb3,phy>;
 	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
+
+	usb_con: connector {
+		compatible = "gpio-usb-b-connector";
+		id-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb3_vbus_reg>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb3_id_pin>, <&usb3_vbus_pin>;
+	};
 };
-- 
2.25.0

