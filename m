Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2A6D16C78
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 22:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbfEGUle (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 16:41:34 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53042 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727128AbfEGUkz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 16:40:55 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2E180609CD; Tue,  7 May 2019 20:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261655;
        bh=FvVIHSPF6TCOHS2vRpI1pV1Cn/7oodyF9St6quwD52M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hixVokxqOtjqymzXsK5Ec5PQBRTvW759zd7J0GzeK/9fK6nOgjtS48MTpgaRTXwAB
         lZJZu3GeGsL8/iTVRm929ZxBUyjK6/IN3PoYMPVXOXUoViUl5JJFlopUjqdUSHZ5GQ
         UwfUBz1X0YNBFgJBOHdWlaTafQWF/9qv+gBj59X4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7176760F3F;
        Tue,  7 May 2019 20:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261654;
        bh=FvVIHSPF6TCOHS2vRpI1pV1Cn/7oodyF9St6quwD52M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AcWT5ESZ7Gdwdp8j3RkWJFxXVQ45sYW9TWEDE21Qk4xDJuu9Qp6bu83ttrLFLdhpW
         0Jpxd2K73PUzqjSAaLTc9Jj7uyGVUrUmOR5ffs8DR5TQE00f/thVs85dV185gnpu9N
         rl3b/gm0SdKbmAdNXaGaqZW0ALDRi74PY+4j5+2A=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7176760F3F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, rplsssn@codeaurora.org,
        linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com,
        bjorn.andersson@linaro.org, dianders@chromium.org,
        Lina Iyer <ilina@codeaurora.org>, devicetree@vger.kernel.org
Subject: [PATCH v5 04/11] of: irq: document properties for wakeup interrupt parent
Date:   Tue,  7 May 2019 14:37:42 -0600
Message-Id: <20190507203749.3384-5-ilina@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507203749.3384-1-ilina@codeaurora.org>
References: <20190507203749.3384-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some interrupt controllers in a SoC, are always powered on and have a
select interrupts routed to them, so that they can wakeup the SoC from
suspend. Add wakeup-parent DT property to refer to these interrupt
controllers.

If the interrupts routed to the wakeup parent are not sequential, than a
map needs to exist to associate the same interrupt line on multiple
interrupt controllers. Providing this map in every driver is cumbersome.
Let's add this in the device tree and document the properties to map the
interrupt specifiers

Cc: devicetree@vger.kernel.org
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
Changes in v5:
	- Update documentation to describe masks in the example
Changes in v4:
	- Added this documentation
---
 .../interrupt-controller/interrupts.txt       | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
index 8a3c40829899..e3e43f5d5566 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
@@ -108,3 +108,57 @@ commonly used:
 			sensitivity = <7>;
 		};
 	};
+
+3) Interrupt wakeup parent
+--------------------------
+
+Some interrupt controllers in a SoC, are always powered on and have a select
+interrupts routed to them, so that they can wakeup the SoC from suspend. These
+interrupt controllers do not fall into the category of a parent interrupt
+controller and can be specified by the "wakeup-parent" property and contain a
+single phandle referring to the wakeup capable interrupt controller.
+
+   Example:
+	wakeup-parent = <&pdc_intc>;
+
+
+4) Interrupt mapping
+--------------------
+
+Sometimes interrupts may be detected by more than one interrupt controller
+(depending on which controller is active). The interrupt controllers may not
+be in hierarchy and therefore the interrupt controller driver is required to
+establish the relationship between the same interrupt at different interrupt
+controllers. If these interrupts are not sequential then a map needs to be
+specified to help identify these interrupts.
+
+Mapping the interrupt specifiers in the device tree can be done using the
+"irqdomain-map" property. The property contains interrupt specifier at the
+current interrupt controller followed by the interrupt specifier at the mapped
+interrupt controller.
+
+   irqdomain-map = <incoming-interrupt-specifier mapped-interrupt-specifier>
+
+The optional properties "irqdomain-map-mask" and "irqdomain-map-pass-thru" may
+be provided to help interpret the valid bits of the incoming and mapped
+interrupt specifiers respectively.
+
+   Example:
+	intc: interrupt-controller@17a00000 {
+		#interrupt-cells = <3>;
+	};
+
+	pinctrl@3400000 {
+		#interrupt-cells = <2>;
+		irqdomain-map = <22 0 &intc 36 0>, <24 0 &intc 37 0>;
+		irqdomain-map-mask = <0xff 0>;
+		irqdomain-map-pass-thru = <0 0xff>;
+	};
+
+In the above example, the input interrupt specifier map-mask <0xff 0> applied
+on the incoming interrupt specifier of the map <22 0>, <24 0>, returns the
+input interrupt 22, 24 etc. The second argument being irq type is immaterial
+from the map and is used from the incoming request instead. The pass-thru
+specifier parses the output interrupt specifier from the rest of the unparsed
+argments from the map <&intc 36 0>, <&intc 37 0> etc to return the output
+interrupt 36, 37 etc.
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

