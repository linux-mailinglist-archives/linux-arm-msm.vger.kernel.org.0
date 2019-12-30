Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 254A812D235
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 17:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbfL3Qnu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Dec 2019 11:43:50 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38826 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbfL3Qnu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Dec 2019 11:43:50 -0500
Received: by mail-wm1-f66.google.com with SMTP id u2so14607603wmc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2019 08:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=kgPv1xhL+mbW9NmJe5kryNqVes+1z2lPlIFwnRL1YA0=;
        b=Psl9DHkuLRMRbZBQKdJDOr9T90aJc4PCn7utL9orf4h1Ecgt+QT5u1fdFpYsQ2dFnb
         Jo4d5JdzXsjS9I0EuUpup66VGIA6Bjg2YolonDUqeOeK8oRG3BWWN4VotQwu5tzxwpRI
         redkNdkG2fJH5GWMJ+K7MnCkQ4Z7HAobyDGgmCpwkZQgEfUu8VfpsUtWJEAyWU9m6Un0
         XFeEfF015sA0s4eyhUJ54fu7M+rOPPk301KL1ieFC2IcCFg3JMCzUEnHhFP/Mh31atVl
         DpEhDkQ5zJIafcbhJxVNT94XzKvL70NTETwddempwMv7y6N+Y6hXA+Y3khDIfhWsmDp6
         kcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kgPv1xhL+mbW9NmJe5kryNqVes+1z2lPlIFwnRL1YA0=;
        b=fG6GPtr5VM4Jvfu5eEhIZzR3MsSpjXu/fgj35+qPEK3L+vqN5uA0QRaFD9EImFHXnI
         vKhFjXuXFy1mvRKJbe2NZsB7M4RC7Pp+QgfDxj1VTp0Vu7ZZ5aEm3k6OIio41H/wZ14L
         Tpd1W6BjBQ327aIbcQB+7tw8yUr8SsILQGr4fZ4YzzoX+rcuqTIFJfTddXFsZgA3qLIU
         7M+T8QrcKh22zUv4+qv+6jKlHn40JfthEtQ6PxJpr6xxGdq7XLe/MY5HcqDi1hrBMLJ6
         rKF+U80U7ae41c5/48dluOuS7OA4HSaJGxupdot+/EphnX5jsuyXkvzQLnXlpRrGdZMz
         Qelg==
X-Gm-Message-State: APjAAAXR+CGNdeZlZ1WFeqorKeeNgpj5mubBE/qNrElC3hhR7KCLFA7R
        rEPcqXwM/O1j2Z50s6e+25abFw==
X-Google-Smtp-Source: APXvYqyeObx+3NbIgTlCtbfomqRNNuk8NcEjqsjAH35tCaLcaREHtPp0jrwnaiIzzIbJrlPRdr5L6g==
X-Received: by 2002:a1c:1d16:: with SMTP id d22mr36683233wmd.158.1577724226375;
        Mon, 30 Dec 2019 08:43:46 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id g2sm45691586wrw.76.2019.12.30.08.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 08:43:45 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v7 11/15] dt-bindings: arm: Juno platform - add CTI entries to device tree.
Date:   Mon, 30 Dec 2019 16:43:39 +0000
Message-Id: <20191230164340.28317-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add in CTI entries for Juno r0, r1 and r2 to device tree entries.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi    | 162 +++++++++++++++++++++-
 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi |  37 ++++-
 arch/arm64/boot/dts/arm/juno-r1.dts       |  25 ++++
 arch/arm64/boot/dts/arm/juno-r2.dts       |  25 ++++
 arch/arm64/boot/dts/arm/juno.dts          |  25 ++++
 5 files changed, 269 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 1f3c80aafbd7..fffd75cd2fd9 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -119,7 +119,7 @@
 	 * The actual size is just 4K though 64K is reserved. Access to the
 	 * unmapped reserved region results in a DECERR response.
 	 */
-	etf@20010000 { /* etf0 */
+	etf_sys0: etf@20010000 { /* etf0 */
 		compatible = "arm,coresight-tmc", "arm,primecell";
 		reg = <0 0x20010000 0 0x1000>;
 
@@ -143,7 +143,7 @@
 		};
 	};
 
-	tpiu@20030000 {
+	tpiu_sys: tpiu@20030000 {
 		compatible = "arm,coresight-tpiu", "arm,primecell";
 		reg = <0 0x20030000 0 0x1000>;
 
@@ -196,7 +196,7 @@
 		};
 	};
 
-	etr@20070000 {
+	etr_sys: etr@20070000 {
 		compatible = "arm,coresight-tmc", "arm,primecell";
 		reg = <0 0x20070000 0 0x1000>;
 		iommus = <&smmu_etr 0>;
@@ -214,7 +214,7 @@
 		};
 	};
 
-	stm@20100000 {
+	stm_sys: stm@20100000 {
 		compatible = "arm,coresight-stm", "arm,primecell";
 		reg = <0 0x20100000 0 0x1000>,
 		      <0 0x28000000 0 0x1000000>;
@@ -291,6 +291,18 @@
 		};
 	};
 
+	cti0: cti@22020000 {
+		compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+			     "arm,primecell";
+		reg = <0 0x22020000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
+
+		arm,cs-dev-assoc = <&etm0>;
+	};
+
 	funnel@220c0000 { /* cluster0 funnel */
 		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 		reg = <0 0x220c0000 0 0x1000>;
@@ -351,6 +363,18 @@
 		};
 	};
 
+	cti1: cti@22120000 {
+		compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+			     "arm,primecell";
+		reg = <0 0x22120000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
+
+		arm,cs-dev-assoc = <&etm1>;
+	};
+
 	cpu_debug2: cpu-debug@23010000 {
 		compatible = "arm,coresight-cpu-debug", "arm,primecell";
 		reg = <0x0 0x23010000 0x0 0x1000>;
@@ -376,6 +400,18 @@
 		};
 	};
 
+	cti2: cti@23020000 {
+		compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+			     "arm,primecell";
+		reg = <0 0x23020000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
+
+		arm,cs-dev-assoc = <&etm2>;
+	};
+
 	funnel@230c0000 { /* cluster1 funnel */
 		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 		reg = <0 0x230c0000 0 0x1000>;
@@ -448,6 +484,18 @@
 		};
 	};
 
+	cti3: cti@23120000 {
+		compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+			     "arm,primecell";
+		reg = <0 0x23120000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
+
+		arm,cs-dev-assoc = <&etm3>;
+	};
+
 	cpu_debug4: cpu-debug@23210000 {
 		compatible = "arm,coresight-cpu-debug", "arm,primecell";
 		reg = <0x0 0x23210000 0x0 0x1000>;
@@ -473,6 +521,18 @@
 		};
 	};
 
+	cti4: cti@23220000 {
+		compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+			     "arm,primecell";
+		reg = <0 0x23220000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
+
+		arm,cs-dev-assoc = <&etm4>;
+	};
+
 	cpu_debug5: cpu-debug@23310000 {
 		compatible = "arm,coresight-cpu-debug", "arm,primecell";
 		reg = <0x0 0x23310000 0x0 0x1000>;
@@ -498,6 +558,100 @@
 		};
 	};
 
+	cti5: cti@23320000 {
+		compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
+			     "arm,primecell";
+		reg = <0 0x23320000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
+
+		arm,cs-dev-assoc = <&etm5>;
+	};
+
+	cti@20020000 { /* sys_cti_0 */
+		compatible = "arm,coresight-cti", "arm,primecell";
+		reg = <0 0x20020000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		trig-conns@0 {
+			reg = <0>;
+			arm,trig-in-sigs=<2 3>;
+			arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
+			arm,trig-out-sigs=<0 1>;
+			arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
+			arm,cs-dev-assoc = <&etr_sys>;
+		};
+
+		trig-conns@1 {
+			reg = <1>;
+			arm,trig-in-sigs=<0 1>;
+			arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
+			arm,trig-out-sigs=<7 6>;
+			arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
+			arm,cs-dev-assoc = <&etf_sys0>;
+		};
+
+		trig-conns@2 {
+			reg = <2>;
+			arm,trig-in-sigs=<4 5 6 7>;
+			arm,trig-in-types=<STM_TOUT_SPTE STM_TOUT_SW
+					   STM_TOUT_HETE STM_ASYNCOUT>;
+			arm,trig-out-sigs=<4 5>;
+			arm,trig-out-types=<STM_HWEVENT STM_HWEVENT>;
+			arm,cs-dev-assoc = <&stm_sys>;
+		};
+
+		trig-conns@3 {
+			reg = <3>;
+			arm,trig-out-sigs=<2 3>;
+			arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
+			arm,cs-dev-assoc = <&tpiu_sys>;
+		};
+	};
+
+	cti@20110000 { /* sys_cti_1 */
+		compatible = "arm,coresight-cti", "arm,primecell";
+		reg = <0 0x20110000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		trig-conns@0 {
+			reg = <0>;
+			arm,trig-in-sigs=<0>;
+			arm,trig-in-types=<GEN_INTREQ>;
+			arm,trig-out-sigs=<0>;
+			arm,trig-out-types=<GEN_HALTREQ>;
+			arm,trig-conn-name = "sys_profiler";
+		};
+
+		trig-conns@1 {
+			reg = <1>;
+			arm,trig-out-sigs=<2 3>;
+			arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
+			arm,trig-conn-name = "watchdog";
+		};
+
+		trig-conns@2 {
+			reg = <2>;
+			arm,trig-out-sigs=<1 6>;
+			arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
+			arm,trig-conn-name = "g_counter";
+		};
+	};
+
 	gpu: gpu@2d000000 {
 		compatible = "arm,juno-mali", "arm,mali-t624";
 		reg = <0 0x2d000000 0 0x10000>;
diff --git a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
index eda3d9e18af6..752b05f8bf31 100644
--- a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
@@ -23,7 +23,7 @@
 		};
 	};
 
-	etf@20140000 { /* etf1 */
+	etf_sys1: etf@20140000 { /* etf1 */
 		compatible = "arm,coresight-tmc", "arm,primecell";
 		reg = <0 0x20140000 0 0x1000>;
 
@@ -82,4 +82,39 @@
 
 		};
 	};
+
+	cti@20160000 { /* sys_cti_2 */
+		compatible = "arm,coresight-cti", "arm,primecell";
+		reg = <0 0x20160000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		trig-conns@0 {
+			reg = <0>;
+			arm,trig-in-sigs=<0 1>;
+			arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
+			arm,trig-out-sigs=<0 1>;
+			arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
+			arm,cs-dev-assoc = <&etf_sys1>;
+		};
+
+		trig-conns@1 {
+			reg = <1>;
+			arm,trig-in-sigs=<2 3 4>;
+			arm,trig-in-types=<ELA_DBGREQ ELA_TSTART ELA_TSTOP>;
+			arm,trig-conn-name = "ela_clus_0";
+		};
+
+		trig-conns@2 {
+			reg = <2>;
+			arm,trig-in-sigs=<5 6 7>;
+			arm,trig-in-types=<ELA_DBGREQ ELA_TSTART ELA_TSTOP>;
+			arm,trig-conn-name = "ela_clus_1";
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
index 5f290090b0cf..02aa51eb311d 100644
--- a/arch/arm64/boot/dts/arm/juno-r1.dts
+++ b/arch/arm64/boot/dts/arm/juno-r1.dts
@@ -9,6 +9,7 @@
 /dts-v1/;
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/arm/coresight-cti-dt.h>
 #include "juno-base.dtsi"
 #include "juno-cs-r1r2.dtsi"
 
@@ -309,3 +310,27 @@
 &cpu_debug5 {
 	cpu = <&A53_3>;
 };
+
+&cti0 {
+	cpu = <&A57_0>;
+};
+
+&cti1 {
+	cpu = <&A57_1>;
+};
+
+&cti2 {
+	cpu = <&A53_0>;
+};
+
+&cti3 {
+	cpu = <&A53_1>;
+};
+
+&cti4 {
+	cpu = <&A53_2>;
+};
+
+&cti5 {
+	cpu = <&A53_3>;
+};
diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/arm/juno-r2.dts
index 305300dd521c..75bb27c2d4dc 100644
--- a/arch/arm64/boot/dts/arm/juno-r2.dts
+++ b/arch/arm64/boot/dts/arm/juno-r2.dts
@@ -9,6 +9,7 @@
 /dts-v1/;
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/arm/coresight-cti-dt.h>
 #include "juno-base.dtsi"
 #include "juno-cs-r1r2.dtsi"
 
@@ -315,3 +316,27 @@
 &cpu_debug5 {
 	cpu = <&A53_3>;
 };
+
+&cti0 {
+	cpu = <&A72_0>;
+};
+
+&cti1 {
+	cpu = <&A72_1>;
+};
+
+&cti2 {
+	cpu = <&A53_0>;
+};
+
+&cti3 {
+	cpu = <&A53_1>;
+};
+
+&cti4 {
+	cpu = <&A53_2>;
+};
+
+&cti5 {
+	cpu = <&A53_3>;
+};
diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
index f00cffbd032c..dbc22e70b62c 100644
--- a/arch/arm64/boot/dts/arm/juno.dts
+++ b/arch/arm64/boot/dts/arm/juno.dts
@@ -9,6 +9,7 @@
 /dts-v1/;
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/arm/coresight-cti-dt.h>
 #include "juno-base.dtsi"
 
 / {
@@ -295,3 +296,27 @@
 &cpu_debug5 {
 	cpu = <&A53_3>;
 };
+
+&cti0 {
+	cpu = <&A57_0>;
+};
+
+&cti1 {
+	cpu = <&A57_1>;
+};
+
+&cti2 {
+	cpu = <&A53_0>;
+};
+
+&cti3 {
+	cpu = <&A53_1>;
+};
+
+&cti4 {
+	cpu = <&A53_2>;
+};
+
+&cti5 {
+	cpu = <&A53_3>;
+};
-- 
2.17.1

