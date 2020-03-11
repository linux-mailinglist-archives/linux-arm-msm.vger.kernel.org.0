Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9F47182203
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 20:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731017AbgCKTQQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 15:16:16 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40866 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731179AbgCKTOx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 15:14:53 -0400
Received: by mail-wr1-f68.google.com with SMTP id p2so4118027wrw.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 12:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vudtvgrawzh2cqBvZiaEVAxNMRavt8ab+X8qR17ohY0=;
        b=m5JY+QA/QUJA9VTYBe+0CbDg4XmYWs7WE/pYH56q5M0sVsOx8WSbjtjw6nEzvTDKPq
         H9GZyyKugZofXpVnusJymMXlS2mo+tVqc8AgeCmZi0edjd8NG/BXU+yrMPls8R0kTw9G
         gs1joCi63VOl6EfNNZXIugNXG7RkCXoxwa9LsPVWWEuu3f915knt0UEVUIndHkw2YXmr
         /2bci8jq+Bad5Iysp43W6297elcHRaucbhUPRF/kn/sfF/N0NmX0Dx5ZSNYvsBXvZJ4F
         7HSRbdhWoBKahanX72G3WsBeGEWrRtVXufLXBm0BXGjrTgTw+92asGOzu+TuRy77EjGX
         ye1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vudtvgrawzh2cqBvZiaEVAxNMRavt8ab+X8qR17ohY0=;
        b=kcmgAGXirJLe58pdwZRVWsL2AVqlzleJC/WCU8WMYFbBeF0pktQ1aPBFidzplxgUaR
         iSFvITyHt+t5KCpLoODxbtUe59+lINzqq67YdtIg9KpiwNnf4SNrUC0MJZ9gBYPL7DpW
         G1+pWy0IubNDV1GIr6wNYWw7pQn/MU9Xov620jIwkjQJQfshPoE9jxpKpRHURQwNo8Sg
         iIDbIWtkmR9RhbBbnnrrDLDp1R4+IhDKe2vmqGwZWtz7mi4KigHorroS6EbQkOulhq9L
         opyca4+YPaaqRyYeac1RFErdbM2Y7LnauKqgrEQDnkSmuXZjGVw5erxeTovBSAgwG/PB
         EvOA==
X-Gm-Message-State: ANhLgQ2V3PS99LHxFGLvUhbNXxHVAk7CKLXBCjyENJCGm/buN6bjYF+7
        zVz2N25W9G4wUHTINMR9BttuNg==
X-Google-Smtp-Source: ADFU+vu3rbsfGj5lv53zHTIxxCknP10LPZkBsCQj1xgQ/tIOnVushQXhnqSggkti1tXNRngLDmpjiQ==
X-Received: by 2002:adf:d081:: with SMTP id y1mr5604944wrh.50.1583954090994;
        Wed, 11 Mar 2020 12:14:50 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id n24sm32958496wra.61.2020.03.11.12.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:14:50 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, jackp@codeaurora.org, robh@kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: usb: dwc3: Add a gpio-usb-connector example
Date:   Wed, 11 Mar 2020 19:14:56 +0000
Message-Id: <20200311191501.8165-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org>
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
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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
2.25.1

