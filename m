Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A085E74BE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 12:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388358AbfGYKme (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 06:42:34 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38956 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389329AbfGYKme (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 06:42:34 -0400
Received: by mail-lj1-f193.google.com with SMTP id v18so47483215ljh.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 03:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3GNalLtrTqW5s+BFJJMMFnFc3aO7NBuze3htvzi00W0=;
        b=csVHpCLA5Pk3GDmRAP9m1Ka9VSO+6NzJzZMzdJorVAdGE3hwGdBVrpgI7dNWlxKh5+
         gp2Jnqh1jTzEYKZ2cuAO9fNIysTEyilMqkvBZ7Es/sttkX11gsh4pt17Bq5V5ikLgcPZ
         07h4eMoW6kC1kiC/JWESg9NsKm9MS3EWFMcEDENNY4HnbldWLbbmD0U/xtAOPCaINXcP
         lwBrhC+T1897IM+jvEohanzwbCHC/BLsmnRGCTZu41aQcIjP8uexSxkp2ORA4s2orTNl
         d0Daf2zOXzOT9wsg3Vk0S0kKM6dwDOTBAegabpvisdrX3oBYB2iPQrG5HICwn2pT+Pt0
         Cx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3GNalLtrTqW5s+BFJJMMFnFc3aO7NBuze3htvzi00W0=;
        b=FmIa1f0IJTUoev6z9H5ouBpjpdhCt2ZBSrhhbAf/XIvuImQNsH+ecwgDVEn3zYvlLM
         1nCPTKa/vRFU/px6AVeAWYY1ywMOz9nUCKe3oqFq3F4wbJu8CeVGUPxMC25hiPoY+NIA
         dHhLQL4/D+94Xtx6+sy9jIZ5XQxrKLcpNSr8nP8FJkT1MRtlUQYMUPZIU4QkdI+rt61Z
         QcXgS9iKjdkRTe8Ot6zS2037hPrJnafb049uj7FkoCAkb1I2kBT/zJszpXlOSGYIAlGA
         ZfZ3SrgW2tgc+5Gbe6x9qmhUvJHXExKS1YCNBAnUd6tU6m/69mCdgyXjCZliujMEhqdI
         mNng==
X-Gm-Message-State: APjAAAUxbo/eBmFTelTHdSLnARdp0exKfKZUoW7RU0GHpx0zdfiTzl8y
        v7vxKvTA9qSNEVRFrTH09GNQQw==
X-Google-Smtp-Source: APXvYqyHvHkP+AWTOyXPquqI0XYCPqA34oDmByMsp0Rt6v7ofJrmE5t2XRx7pQR6v1/c4yYOJ+NJ7g==
X-Received: by 2002:a2e:8849:: with SMTP id z9mr6421628ljj.203.1564051351281;
        Thu, 25 Jul 2019 03:42:31 -0700 (PDT)
Received: from localhost.localdomain (ua-83-226-44-230.bbcust.telenor.se. [83.226.44.230])
        by smtp.gmail.com with ESMTPSA id k124sm7461299lfd.60.2019.07.25.03.42.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 03:42:30 -0700 (PDT)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/14] dt-bindings: cpufreq: qcom-nvmem: Support pstates provided by a power domain
Date:   Thu, 25 Jul 2019 12:41:34 +0200
Message-Id: <20190725104144.22924-7-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190725104144.22924-1-niklas.cassel@linaro.org>
References: <20190725104144.22924-1-niklas.cassel@linaro.org>
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

