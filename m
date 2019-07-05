Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13C7B60384
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 11:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbfGEJ6J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 05:58:09 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34041 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbfGEJ6I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 05:58:08 -0400
Received: by mail-lf1-f65.google.com with SMTP id b29so5978165lfq.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2019 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3GNalLtrTqW5s+BFJJMMFnFc3aO7NBuze3htvzi00W0=;
        b=hmExekYi60+hf8c4YDeaGqFYkUdJGMndPOTAz0wzT5VaYrhc79TdPrC82wL7SI1HMS
         4B9mDD2JiVa++vAEXHVQb0+EI7rCDihpO7F40mAaBXF7Uk9HbWS/PAUzo7lcLs1D+Z+5
         +VCR+V4xb6J4WTh8C16gju5+rR5NbyRcecrcUSwIsPl0ZzwWjh9zoIUlEBYwFgv9gE9s
         YZU+4liOcFjYB4deygvG/JxyDYUhIx9AambMTyv7d4zxy7I1buYsHQHlCwGBegiQVp1R
         vigjgZqTKy8zqnB1XSWpP3VssMyj7Beg5ro1l+jhu2Vwbsl++Xdy1jq8OMNcv8pL3J7+
         4otA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3GNalLtrTqW5s+BFJJMMFnFc3aO7NBuze3htvzi00W0=;
        b=mXBjLtLF1dLkdV0joWP9Q88HFKqA4yx8m2zGqiM2ADz+lcDes3oSAP7ese67ZNW7RI
         Vt4ZIOw438sM2PSjCxZo8H1De3ntd6i4+vvDF/P70T46ZR0Bjkqw9sQhCQdmlDqpU6KH
         EhkuUoSoJ6xqNbj93ME+01Ea2jSkFe+EnzwgZxR9ow3McyVMH2A5c+qJt4M/dxsalwEZ
         DBO/2eR5IP0/9qPZ9mNTFTfI7Y6SRJMq54GMmeKIJw70VZK4LYun0lqBQwpSq13JFuEr
         vKEnpxEKPwFcsLmGaycvJvEuR0Zsbw7S4kF4VOdzBYuf30hEA/IpZTxOkSnP+8gaqbYo
         MWRQ==
X-Gm-Message-State: APjAAAWlBVHlsXkggPmrhdkkhCjR3tlbal8eLTDJwOL5y6GBCHn2/sGr
        sqALMyk5pOWCcif43H9Pf7uOqg==
X-Google-Smtp-Source: APXvYqwE4CIl8CEAtpIJlQJkbUer2Z0hhINHb7uHx65wmIJHGa6qKcwuuJ0HkO9FENk2/2/WJUlxRg==
X-Received: by 2002:ac2:4a6e:: with SMTP id q14mr1583691lfp.154.1562320686116;
        Fri, 05 Jul 2019 02:58:06 -0700 (PDT)
Received: from localhost.localdomain (ua-83-226-34-119.bbcust.telenor.se. [83.226.34.119])
        by smtp.gmail.com with ESMTPSA id 25sm1692704ljn.62.2019.07.05.02.58.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 02:58:05 -0700 (PDT)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/13] dt-bindings: cpufreq: qcom-nvmem: Support pstates provided by a power domain
Date:   Fri,  5 Jul 2019 11:57:16 +0200
Message-Id: <20190705095726.21433-6-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190705095726.21433-1-niklas.cassel@linaro.org>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some Qualcomm SoCs have support for Core Power Reduction (CPR).
On these platforms, we need to attach to the power domain provider
providing the performance states, so that the leaky device (the CPU)
can configure the performance states (which represent different
CPU clock frequencies).

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
---
 .../bindings/opp/qcom-nvmem-cpufreq.txt       | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
index c5ea8b90e35d..e19a95318e98 100644
--- a/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
+++ b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
@@ -23,6 +23,15 @@ In 'operating-points-v2' table:
 
 Optional properties:
 --------------------
+In 'cpus' nodes:
+- power-domains: A phandle pointing to the PM domain specifier which provides
+		the performance states available for active state management.
+		Please refer to the power-domains bindings
+		Documentation/devicetree/bindings/power/power_domain.txt
+		and also examples below.
+- power-domain-names: Should be
+	- 'cpr' for qcs404.
+
 In 'operating-points-v2' table:
 - nvmem-cells: A phandle pointing to a nvmem-cells node representing the
 		efuse registers that has information about the
@@ -682,3 +691,105 @@ soc {
 		};
 	};
 };
+
+Example 2:
+---------
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		CPU0: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x100>;
+			....
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			power-domains = <&cprpd>;
+			power-domain-names = "cpr";
+		};
+
+		CPU1: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x101>;
+			....
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			power-domains = <&cprpd>;
+			power-domain-names = "cpr";
+		};
+
+		CPU2: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x102>;
+			....
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			power-domains = <&cprpd>;
+			power-domain-names = "cpr";
+		};
+
+		CPU3: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x103>;
+			....
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			power-domains = <&cprpd>;
+			power-domain-names = "cpr";
+		};
+	};
+
+	cpu_opp_table: cpu-opp-table {
+		compatible = "operating-points-v2-kryo-cpu";
+		opp-shared;
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			required-opps = <&cpr_opp1>;
+		};
+		opp-1248000000 {
+			opp-hz = /bits/ 64 <1248000000>;
+			required-opps = <&cpr_opp2>;
+		};
+		opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+			required-opps = <&cpr_opp3>;
+		};
+	};
+
+	cpr_opp_table: cpr-opp-table {
+		compatible = "operating-points-v2-qcom-level";
+
+		cpr_opp1: opp1 {
+			opp-level = <1>;
+			....
+		};
+		cpr_opp2: opp2 {
+			opp-level = <2>;
+			....
+		};
+		cpr_opp3: opp3 {
+			opp-level = <3>;
+			....
+		};
+	};
+
+....
+
+soc {
+....
+	cprpd: cpr@b018000 {
+		compatible = "qcom,qcs404-cpr", "qcom,cpr";
+		reg = <0x0b018000 0x1000>;
+		....
+		vdd-apc-supply = <&pms405_s3>;
+		#power-domain-cells = <0>;
+		operating-points-v2 = <&cpr_opp_table>;
+		....
+	};
+};
-- 
2.21.0

