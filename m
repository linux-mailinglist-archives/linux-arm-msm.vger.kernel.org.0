Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 613F39D46E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 18:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbfHZQsi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 12:48:38 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36194 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731578AbfHZQsM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 12:48:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id r3so16004268wrt.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2019 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YOocsbJSeEFZluDhuzPE1zAAorjfBXrmhgRxid6+uG4=;
        b=NsZnHTnbHWll2bdVW2ovEHICEh3GJqof/NEoMfJ4Y8yrH0xeFp417Yy+3C+h1fJv1p
         AjePh5kfIe6BX5pLNWHmxs6MSQzBqgP7+JmZiY7k7pKJauPYW+NYLjUnQ64q6jljK/d4
         ErMrPOf5XameBxDFh50wEbNTfj8M4NJ/Ujq/x5LYBFq79CY6PQp9SHDudQaIRyQvFZvH
         ZcPK/pW7zutvsABFwvilgc1rRl9mkzJvaD0EBfooe1GdX0K47j+4wlQN3fWe5i0LcIgw
         Fgb85bN60puObL2yXFhMaOiox2CBlB+yEu20ZaBaDUlhk2wKX4CPOQi8fhJx8ngVqJYW
         QNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YOocsbJSeEFZluDhuzPE1zAAorjfBXrmhgRxid6+uG4=;
        b=BvJa15qPd8tzt0+OF0TGmdpxcAr4G9Luopw0id2Zr+Y451OhVg7PUxf1m1GwcyMCW9
         Ew/5qNZkONg46m2P/mUbyoBNb0vsKS7QliqWHm8jU89qy4mbgZS7eylOcBlSBmXTAz/l
         bjzrXAcQyhKFkevWENrgezCuiEcpzbOoW1EgB50mJgX7tDNSaovkb9groSwvJD8bP8ZT
         DBc1pbqT86W3tcMM5/Tr+lByXhaGOEEh/Ry5W8yZMJQchWcl9ZWl9l9U1LMlLLnK9bHs
         Ip/n5a/kpfhW5c213DNfgGdpU//rGdH6zu7Fa2w8NxlxsQZjkmz8DfJXS4ivcEeJFAfU
         yzpQ==
X-Gm-Message-State: APjAAAVOWEwVKqyYuJxsGYhITKHxGW+9fcALaVYK4CeMPoXw/HkYfhIi
        nqo9uf2bhE5OOal+Gpdp6hIm7A==
X-Google-Smtp-Source: APXvYqzPcgyMXXhYl1Q3zNI2CZd1u12C3LHziyafTloiYXqCJAA7EACMMiSblht14P9NtKAoKIy1ow==
X-Received: by 2002:adf:e887:: with SMTP id d7mr23481374wrm.282.1566838090464;
        Mon, 26 Aug 2019 09:48:10 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id o14sm21800076wrg.64.2019.08.26.09.48.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 26 Aug 2019 09:48:10 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com
Cc:     niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: mailbox: qcom: Add clock-name optional property
Date:   Mon, 26 Aug 2019 18:48:02 +0200
Message-Id: <20190826164807.7028-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When the APCS clock is registered (platform dependent), it retrieves
its parent names from hardcoded values in the driver.

The following commit allows the DT node to provide such clock names to
the platform data based clock driver therefore avoiding having to
explicitly embed those names in the clock driver source code.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../mailbox/qcom,apcs-kpss-global.txt         | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
index 1232fc9fc709..b69310322b09 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
@@ -18,10 +18,11 @@ platforms.
 	Usage: required
 	Value type: <prop-encoded-array>
 	Definition: must specify the base address and size of the global block
+
 - clocks:
-	Usage: required if #clocks-cells property is present
-	Value type: <phandle>
-	Definition: phandle to the input PLL, which feeds the APCS mux/divider
+	Usage: required if #clock-names property is present
+	Value type: <phandle array>
+	Definition: phandles to the two parent clocks of the clock driver.
 
 - #mbox-cells:
 	Usage: required
@@ -33,6 +34,12 @@ platforms.
 	Value type: <u32>
 	Definition: as described in clock.txt, must be 0
 
+- clock-names:
+	Usage: required if the platform data based clock driver needs to
+	retrieve the parent clock names from device tree.
+	This will requires two mandatory clocks to be defined.
+	Value type: <string-array>
+	Definition: must be "aux" and "pll"
 
 = EXAMPLE
 The following example describes the APCS HMSS found in MSM8996 and part of the
@@ -65,3 +72,14 @@ Below is another example of the APCS binding on MSM8916 platforms:
 		clocks = <&a53pll>;
 		#clock-cells = <0>;
 	};
+
+Below is another example of the APCS binding on QCS404 platforms:
+
+	apcs_glb: mailbox@b011000 {
+		compatible = "qcom,qcs404-apcs-apps-global", "syscon";
+		reg = <0x0b011000 0x1000>;
+		#mbox-cells = <1>;
+		clocks = <&gcc GCC_GPLL0_AO_OUT_MAIN>, <&apcs_hfpll>;
+		clock-names = "aux", "pll";
+		#clock-cells = <0>;
+	};
-- 
2.22.0

