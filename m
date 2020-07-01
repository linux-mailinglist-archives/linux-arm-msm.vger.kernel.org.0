Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD24210C87
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 15:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731203AbgGANpP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 09:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731198AbgGANpO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 09:45:14 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A03D3C08C5DF
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2020 06:45:13 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id e3so4655681qvo.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 06:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sihixmd7y65qhAkfrcCiJqiM1K3NJIfRiJWtLm6ve+w=;
        b=ypGT2oo5BMx8h8U1DEuIXd3TFLjJbQ+P11ThIZRL8jDQUL3fy8V5yEQ0vehKc682LB
         N/nqNz/4pEUZY2fisxWJppArRzltHQePeMSSjTkVKT0bzozwE+kzAjakWrO0rHHfC2ul
         G9Qxnc/4ZzPcERnSe+FTAsBOqdtsvoTAo+d93uBY875MpehYnXq1qeOoMIS3qj8aqd7a
         DCDIXfnxpHuZiaUPxOlMlT0ejaBaomeM/e04gi7A96Q/OOtLV8f6Mws7QXzpX1+D8Xk8
         sZxiGxzvYdnyD18MK1nAFtxVh4A4+qRgeXksbL9/f00N/q8rt/CorQl2MIrhjU8o/YBF
         cdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sihixmd7y65qhAkfrcCiJqiM1K3NJIfRiJWtLm6ve+w=;
        b=FgaB0dQO1mt+5vPmq+97x65zjJL1xrNlff36ZtKIitYinvviuyeUlGidqNDxd+pAjn
         htL4Mi5EZRq0VrjkJbdewCxXiMG0u15m7WWRocKM5627l/cId0iKxv1vdMGNqV4D3qkB
         PFAhdZFn8blMPzcGwxclCtkX7xPXBXRhi5B92HZ8aMLBqQFsM5vdwOYupVzo+yIuQ8ee
         tbhf1nJgVwPbSYLt0jWwudN/+9NegGxPY09or71oZRfKQqPv4qH+bq1yzFHptN319ui4
         /EvIfCosb9Ht2reiV4QP1/a/PY7Sk44BMhQW2HTb5nRo7I94GdIB/SXLrh6S9CzxMnOm
         fYHw==
X-Gm-Message-State: AOAM5330TcXVZKemEoZeVx8Bx5xhhYM4GvqJvLglIOOSpl96zmlJU7eB
        gmm9W9o3voZgs2WFpAXG15CILhl6wos=
X-Google-Smtp-Source: ABdhPJw1StxecmRy8ucovZU0Ed9/qAHNkZQ7AxCR6utas4SBrzSeyyWUqIxmX0ZQ7iGogcqS4+fcvg==
X-Received: by 2002:a05:6214:a0a:: with SMTP id dw10mr25719942qvb.200.1593611112618;
        Wed, 01 Jul 2020 06:45:12 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id d136sm1444345qke.47.2020.07.01.06.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 06:45:12 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/6] arm64: dts: qcom: sm8250: add interconnect nodes
Date:   Wed,  1 Jul 2020 09:42:55 -0400
Message-Id: <20200701134259.8055-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200701134259.8055-1-jonathan@marek.ca>
References: <20200701134259.8055-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the interconnect dts nodes for sm8250.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 118 +++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c9b38dd88f43..b417523f1f1b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/interconnect/qcom,sm8250.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -310,6 +311,61 @@ uart2: serial@a90000 {
 			};
 		};
 
+		config_noc: interconnect@1500000 {
+			compatible = "qcom,sm8250-config-noc";
+			reg = <0 0x01500000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		ipa_virt: interconnect@1620000 {
+			compatible = "qcom,sm8250-ipa-virt";
+			reg = <0 0x01620000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		system_noc: interconnect@1632000 {
+			compatible = "qcom,sm8250-system-noc";
+			reg = <0 0x01632000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre1_noc: interconnect@16e2000 {
+			compatible = "qcom,sm8250-aggre1-noc";
+			reg = <0 0x016e2000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre2_noc: interconnect@1703000 {
+			compatible = "qcom,sm8250-aggre2-noc";
+			reg = <0 0x01703000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		compute_noc: interconnect@1733000 {
+			compatible = "qcom,sm8250-compute-noc";
+			reg = <0 0x01733000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mmss_noc: interconnect@174a000 {
+			compatible = "qcom,sm8250-mmss-noc";
+			reg = <0 0x0174a000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mmss_noc_display: interconnect-display@174a000 {
+			compatible = "qcom,sm8250-mmss-noc-display";
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&disp_bcm_voter>;
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8250-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
@@ -620,6 +676,46 @@ usb_2_ssphy: lane@88eb200 {
 			};
 		};
 
+		dc_noc: interconnect@90c0000 {
+			compatible = "qcom,sm8250-dc-noc";
+			reg = <0 0x090c0000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mc_virt: interconnect@9100000 {
+			compatible = "qcom,sm8250-mc-virt";
+			reg = <0 0x09100000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mc_virt_display: interconnect-display@9100000 {
+			compatible = "qcom,sm8250-mc-virt-display";
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&disp_bcm_voter>;
+		};
+
+		gem_noc: interconnect@9121000 {
+			compatible = "qcom,sm8250-gem-noc";
+			reg = <0 0x09121000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		gem_noc_display: interconnect-display@9121000 {
+			compatible = "qcom,sm8250-gem-noc-display";
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&disp_bcm_voter>;
+		};
+
+		npu_noc: interconnect@9990000 {
+			compatible = "qcom,sm8250-npu-noc";
+			reg = <0 0x09990000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sm8250-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
@@ -710,6 +806,24 @@ usb_2_dwc3: dwc3@a800000 {
 			};
 		};
 
+		disp_rsc: rsc@af20000 {
+			label = "disp_rsc";
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x0 0xaf20000 0x0 0x10000>;
+			reg-names = "drv-0";
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0x1c00>;
+			qcom,drv-id = <0>;
+			qcom,tcs-config = <ACTIVE_TCS  0>,
+					  <SLEEP_TCS   1>,
+					  <WAKE_TCS    1>,
+					  <CONTROL_TCS 0>;
+
+			disp_bcm_voter: bcm_voter {
+				compatible = "qcom,bcm-voter";
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8250-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
@@ -997,6 +1111,10 @@ rpmhpd_opp_turbo_l1: opp10 {
 					};
 				};
 			};
+
+			apps_bcm_voter: bcm_voter {
+				compatible = "qcom,bcm-voter";
+			};
 		};
 
 		cpufreq_hw: cpufreq@18591000 {
-- 
2.26.1

