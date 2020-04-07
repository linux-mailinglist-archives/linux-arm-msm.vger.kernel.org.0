Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0226E1A0952
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 10:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgDGI2o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 04:28:44 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35242 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727922AbgDGI2o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 04:28:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id g3so2849058wrx.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 01:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=n8MGU1HiLA780t2T4XRqSok5NI7APd4pvMc/AV+INgk=;
        b=LGffqUaGwVMsTKWFB6wSemmyYwKrFBn5rCvxYtmZsSvgxzMcaWTQcDifzq2hLdg1uw
         XdiuEHMD0iZDorY1u8X4B5+ub7eYBphfR9yuZnuEWtNSDCrs0V1+vrC90oEqJC8gUVM5
         x0Ge946srsU5FYic+LqEoZR9LBWNf44rYcVqPyG00MBscyKmyabXB6dl3hiMdVOSxmHs
         44yL7PGhy3ROp0YA4XqMm50T99mCSoVac8IzxUGJKOV8Sy+fUz27qMedg0uCoQ4cfnsl
         EMNFDklUWguBiAHUy0nv7GaJ99jITppEgCd2b7d47FZVjgyyEJY64ul6ADmVSInVI+Bi
         xDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=n8MGU1HiLA780t2T4XRqSok5NI7APd4pvMc/AV+INgk=;
        b=XrrXwlmsxVLBccBwyrE4crx6XNyeCsYQgRqSNsFH4tk2Iy+m1i2Bm1RIQu4vO0aRrN
         yDjwcCywucGW4aHt/AeYqkIauOsL3R48HvLV4GRMcXpcufTTphrRBSbjdcAA5ubK0V3e
         dOxQClLVa5DYNaA8LZDq/WM+eYGIkyWZjrmcmjZMlFy8Uw9fqLvIgL/gyyBMEUu4oRJb
         pjw6RrhpIkfKMKxsIYBd19j3GfO+5OK0eHveIcW3b/fWezA3RFG9WGCnNuXri1xknIB4
         iSXV3KxNVAUlrSI2gHQXqjH3x1SAzxuK2YN+fP4VsB4N8En+vuD4ImH0Y5qqIShJaIVz
         DbBQ==
X-Gm-Message-State: AGi0PuanNG4gYDUUaObr+8KcGoVL1/4MvmQYZYQCOQuQEBwxlCY68aRs
        FnM4OtA7Yv+WA/0wJLMNJuX3yA==
X-Google-Smtp-Source: APiQypJjwN/llOS3WZmzGBrNI5ew7iz6eMPEqFyRwZrG+B57det3S0Ga9Cl7c6NrQggvHmhButpxhA==
X-Received: by 2002:adf:b6a9:: with SMTP id j41mr1464690wre.70.1586248120879;
        Tue, 07 Apr 2020 01:28:40 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id r5sm1360057wmr.15.2020.04.07.01.28.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 07 Apr 2020 01:28:40 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     wsa@the-dreams.de
Cc:     vkoul@kernel.org, robert.foss@linaro.org,
        bjorn.andersson@linaro.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>
Subject: [PATCH v7 2/3] dt-bindings: i2c: Add binding for Qualcomm CCI I2C controller
Date:   Tue,  7 Apr 2020 10:33:01 +0200
Message-Id: <1586248382-9058-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586248382-9058-1-git-send-email-loic.poulain@linaro.org>
References: <1586248382-9058-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Todor Tomov <todor.tomov@linaro.org>

Add DT binding document for Qualcomm Camera Control Interface (CCI)
I2C controller.

Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
--- 
 v2: Fix subnode properties, remove mandatory clock names
 v3: Add sdm845 compatible string
 v4: no change
 v5: no change
 v6: no change
 v7: no change

 .../devicetree/bindings/i2c/i2c-qcom-cci.txt       | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
new file mode 100644
index 0000000..c6668b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
@@ -0,0 +1,92 @@
+Qualcomm Camera Control Interface (CCI) I2C controller
+
+PROPERTIES:
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: must be one of:
+		"qcom,msm8916-cci"
+		"qcom,msm8996-cci"
+		"qcom,sdm845-cci"
+
+- reg
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: base address CCI I2C controller and length of memory
+		    mapped region.
+
+- interrupts:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: specifies the CCI I2C interrupt. The format of the
+		    specifier is defined by the binding document describing
+		    the node's interrupt parent.
+
+- clocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: a list of phandle, should contain an entry for each
+		    entries in clock-names.
+
+- clock-names
+	Usage: required
+	Value type: <string>
+	Definition: a list of clock names, must include "cci" clock.
+
+- power-domains
+	Usage: required for "qcom,msm8996-cci"
+	Value type: <prop-encoded-array>
+	Definition:
+
+SUBNODES:
+
+The CCI provides I2C masters for one (msm8916) or two i2c busses (msm8996 and
+sdm845), described as subdevices named "i2c-bus@0" and "i2c-bus@1".
+
+PROPERTIES:
+
+- reg:
+	Usage: required
+	Value type: <u32>
+	Definition: Index of the CCI bus/master
+
+- clock-frequency:
+	Usage: optional
+	Value type: <u32>
+	Definition: Desired I2C bus clock frequency in Hz, defaults to 100
+		    kHz if omitted.
+
+Example:
+
+	cci@a0c000 {
+		compatible = "qcom,msm8996-cci";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0xa0c000 0x1000>;
+		interrupts = <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&mmcc MMSS_MMAGIC_AHB_CLK>,
+			 <&mmcc CAMSS_TOP_AHB_CLK>,
+			 <&mmcc CAMSS_CCI_AHB_CLK>,
+			 <&mmcc CAMSS_CCI_CLK>,
+			 <&mmcc CAMSS_AHB_CLK>;
+		clock-names = "mmss_mmagic_ahb",
+			      "camss_top_ahb",
+			      "cci_ahb",
+			      "cci",
+			      "camss_ahb";
+
+		i2c-bus@0 {
+			reg = <0>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c-bus@1 {
+			reg = <1>;
+			clock-frequency = <400000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
-- 
2.7.4

