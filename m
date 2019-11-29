Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF70110DB37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2019 22:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387448AbfK2Vjp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Nov 2019 16:39:45 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34265 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387418AbfK2Vjp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Nov 2019 16:39:45 -0500
Received: by mail-lj1-f194.google.com with SMTP id m6so25949419ljc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2019 13:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N+931pEx1Hg+i4sg3YN9R80y/JO2qyDWX3fVbDkLEV8=;
        b=WMAlo2z7ud+xPkLazAHrcoYGu8P9EvsN5yyG3J0z6osHw9Hfp20eNgq31QExaYQnHR
         jCV4wkikzQ/b9oS60p4i0hkEYTiegVdpXDNXYMxPWnq2bd+hpYdt+tmqAm4hJ8ITnfdh
         eOhh5CIYFwnVFBdZYEXyqtB0jpJBKc5p8WkYBOUZm/JyGUtyinIkWyS8tNvharNZO3lP
         rVhw7mYjDKRJ8uh6jXOxP6z3M9autwIfMBl2UBXzW337kttsbvUuiX+qAETURTA8LT4r
         Jk4ZeT+zE5bOjhb8mSnT3PUqgdsw0h+7uRdDx2ICEiyBd0DsW6mBoD8PLRwkq2t2tSNs
         kksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N+931pEx1Hg+i4sg3YN9R80y/JO2qyDWX3fVbDkLEV8=;
        b=FfY4PNAFV/TaVEEDBLVYiMREuTnwK1DDT78kUcLHp4L+awnJDQzuI0hdZIOwR0JRgG
         XsZRS9owgLdboBcD8z3XA3hKDq4bq9y74Yvv8OlQcgbXSWZSEqlApB4UZfYFkFLVTdeG
         wfQE12ggGfY431nKYm2ljjbAddPeZ8154XgENLVi6aKqangMcX5G/FJm5DIqG4gKtbqA
         FMltBybtAMujKHg4dCd0u9AVBj+siST/UVa8bQSpotOIsUh6WAcQEfVDvtja3P8KFgN/
         zPQTGVFJ8zfI8Y+rJXjv5lC2AF9GGSqjS7sKqVRXWof4B1u95Gr6O13O+zqjLY/c+rZy
         pQ2A==
X-Gm-Message-State: APjAAAWsV7LksJPr92aZbEJ+L/QaJHFSt1KkdOze0YR5MEjdJRDLuXC5
        snUT4YFznfAoI6kjUfIEbcJW4gxsSx/5Uw==
X-Google-Smtp-Source: APXvYqxsCnVwv6LDBL1jcUqv344vlPQituvC1/sYcz9y5J3rTQoP49a6zLtvx7rPh5xuFEVF65iQWQ==
X-Received: by 2002:a2e:2914:: with SMTP id u20mr24260689lje.219.1575063581426;
        Fri, 29 Nov 2019 13:39:41 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id p4sm10817755lji.107.2019.11.29.13.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 13:39:40 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, ulf.hansson@linaro.org,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/5] arm64: dts: qcom: qcs404: Add CPR and populate OPP table
Date:   Fri, 29 Nov 2019 22:39:13 +0100
Message-Id: <20191129213917.1301110-4-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191129213917.1301110-1-niklas.cassel@linaro.org>
References: <20191129213917.1301110-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add CPR and populate OPP table.

Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
---
Changes since v6:
-Picked up Bjorn's and Ulf's Reviewed-by.

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 132 +++++++++++++++++++++++++--
 1 file changed, 124 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 03aa80f2814a..ca255d98d007 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -44,7 +44,8 @@
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-supply = <&pms405_s3>;
+			power-domains = <&cpr>;
+			power-domain-names = "cpr";
 		};
 
 		CPU1: cpu@101 {
@@ -57,7 +58,8 @@
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-supply = <&pms405_s3>;
+			power-domains = <&cpr>;
+			power-domain-names = "cpr";
 		};
 
 		CPU2: cpu@102 {
@@ -70,7 +72,8 @@
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-supply = <&pms405_s3>;
+			power-domains = <&cpr>;
+			power-domain-names = "cpr";
 		};
 
 		CPU3: cpu@103 {
@@ -83,7 +86,8 @@
 			#cooling-cells = <2>;
 			clocks = <&apcs_glb>;
 			operating-points-v2 = <&cpu_opp_table>;
-			cpu-supply = <&pms405_s3>;
+			power-domains = <&cpr>;
+			power-domain-names = "cpr";
 		};
 
 		L2_0: l2-cache {
@@ -107,20 +111,37 @@
 	};
 
 	cpu_opp_table: cpu-opp-table {
-		compatible = "operating-points-v2";
+		compatible = "operating-points-v2-kryo-cpu";
 		opp-shared;
 
 		opp-1094400000 {
 			opp-hz = /bits/ 64 <1094400000>;
-			opp-microvolt = <1224000 1224000 1224000>;
+			required-opps = <&cpr_opp1>;
 		};
 		opp-1248000000 {
 			opp-hz = /bits/ 64 <1248000000>;
-			opp-microvolt = <1288000 1288000 1288000>;
+			required-opps = <&cpr_opp2>;
 		};
 		opp-1401600000 {
 			opp-hz = /bits/ 64 <1401600000>;
-			opp-microvolt = <1384000 1384000 1384000>;
+			required-opps = <&cpr_opp3>;
+		};
+	};
+
+	cpr_opp_table: cpr-opp-table {
+		compatible = "operating-points-v2-qcom-level";
+
+		cpr_opp1: opp1 {
+			opp-level = <1>;
+			qcom,opp-fuse-level = <1>;
+		};
+		cpr_opp2: opp2 {
+			opp-level = <2>;
+			qcom,opp-fuse-level = <2>;
+		};
+		cpr_opp3: opp3 {
+			opp-level = <3>;
+			qcom,opp-fuse-level = <3>;
 		};
 	};
 
@@ -310,6 +331,62 @@
 			tsens_caldata: caldata@d0 {
 				reg = <0x1f8 0x14>;
 			};
+			cpr_efuse_speedbin: speedbin@13c {
+				reg = <0x13c 0x4>;
+				bits = <2 3>;
+			};
+			cpr_efuse_quot_offset1: qoffset1@231 {
+				reg = <0x231 0x4>;
+				bits = <4 7>;
+			};
+			cpr_efuse_quot_offset2: qoffset2@232 {
+				reg = <0x232 0x4>;
+				bits = <3 7>;
+			};
+			cpr_efuse_quot_offset3: qoffset3@233 {
+				reg = <0x233 0x4>;
+				bits = <2 7>;
+			};
+			cpr_efuse_init_voltage1: ivoltage1@229 {
+				reg = <0x229 0x4>;
+				bits = <4 6>;
+			};
+			cpr_efuse_init_voltage2: ivoltage2@22a {
+				reg = <0x22a 0x4>;
+				bits = <2 6>;
+			};
+			cpr_efuse_init_voltage3: ivoltage3@22b {
+				reg = <0x22b 0x4>;
+				bits = <0 6>;
+			};
+			cpr_efuse_quot1: quot1@22b {
+				reg = <0x22b 0x4>;
+				bits = <6 12>;
+			};
+			cpr_efuse_quot2: quot2@22d {
+				reg = <0x22d 0x4>;
+				bits = <2 12>;
+			};
+			cpr_efuse_quot3: quot3@230 {
+				reg = <0x230 0x4>;
+				bits = <0 12>;
+			};
+			cpr_efuse_ring1: ring1@228 {
+				reg = <0x228 0x4>;
+				bits = <0 3>;
+			};
+			cpr_efuse_ring2: ring2@228 {
+				reg = <0x228 0x4>;
+				bits = <4 3>;
+			};
+			cpr_efuse_ring3: ring3@229 {
+				reg = <0x229 0x4>;
+				bits = <0 3>;
+			};
+			cpr_efuse_revision: revision@218 {
+				reg = <0x218 0x4>;
+				bits = <3 3>;
+			};
 		};
 
 		rng: rng@e3000 {
@@ -952,6 +1029,45 @@
 			clocks = <&sleep_clk>;
 		};
 
+		cpr: power-controller@b018000 {
+			compatible = "qcom,qcs404-cpr", "qcom,cpr";
+			reg = <0x0b018000 0x1000>;
+			interrupts = <0 15 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&xo_board>;
+			clock-names = "ref";
+			vdd-apc-supply = <&pms405_s3>;
+			#power-domain-cells = <0>;
+			operating-points-v2 = <&cpr_opp_table>;
+			acc-syscon = <&tcsr>;
+
+			nvmem-cells = <&cpr_efuse_quot_offset1>,
+				<&cpr_efuse_quot_offset2>,
+				<&cpr_efuse_quot_offset3>,
+				<&cpr_efuse_init_voltage1>,
+				<&cpr_efuse_init_voltage2>,
+				<&cpr_efuse_init_voltage3>,
+				<&cpr_efuse_quot1>,
+				<&cpr_efuse_quot2>,
+				<&cpr_efuse_quot3>,
+				<&cpr_efuse_ring1>,
+				<&cpr_efuse_ring2>,
+				<&cpr_efuse_ring3>,
+				<&cpr_efuse_revision>;
+			nvmem-cell-names = "cpr_quotient_offset1",
+				"cpr_quotient_offset2",
+				"cpr_quotient_offset3",
+				"cpr_init_voltage1",
+				"cpr_init_voltage2",
+				"cpr_init_voltage3",
+				"cpr_quotient1",
+				"cpr_quotient2",
+				"cpr_quotient3",
+				"cpr_ring_osc1",
+				"cpr_ring_osc2",
+				"cpr_ring_osc3",
+				"cpr_fuse_revision";
+		};
+
 		timer@b120000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.23.0

