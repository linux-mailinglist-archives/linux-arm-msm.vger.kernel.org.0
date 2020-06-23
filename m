Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B89072067A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 00:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389226AbgFWWtW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 18:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388769AbgFWWs3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 18:48:29 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA09FC061795;
        Tue, 23 Jun 2020 15:48:28 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id g18so273349wrm.2;
        Tue, 23 Jun 2020 15:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bw0AmxFMN1A8XctnpocFH+OiGgPLlOSm0R6C/XSlsWg=;
        b=GW+HfY5TWijGo3e/Z4qrZWOZErt2nwimUGLz6YNCp3BPOqyUIwdwwOWlc9s159Obkt
         tPhg4bfgjVcKXoH6A2dYJanrCh3XdN4xZun52Ltn5SagKBDYD4Ml89uQyfassY+vO0iH
         QGezN6vNjSg3/KcahxwOL1W5JX9MD+qlVkb6qtqeCc5GXWaRRiZlvfh5rCWG4LS0iHPt
         GWRBj8gVYuBf0bP5J5mOHWXgCJFBowOIaWM0N4kGloAA9zuo/YsG2y1O4q9GElr+WN29
         /XL3/0EJCpKmbgL7w52fBg7myokCCYx/TWZSh6feF/Oiaq/YTThzmCqXRklZo/YFeRwL
         RMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bw0AmxFMN1A8XctnpocFH+OiGgPLlOSm0R6C/XSlsWg=;
        b=fFMu0ddQRX9MXGk21RnIwR5nv/YHphsiL+Ua2gzn4C1EK4vcrTRNilZrUNzLBe23Mh
         xkUlf27YCPK/Bjotn4/b2eNgs4R3DVQPuQJ7DgMQ3E9xiBcg6bX1c5/ACVPrgbWTM6p+
         6G4cGViX3c1tn8q2AMi5QrWUcfMoRiFaW0W/h8h9fO4xlWx4PZIck0sfqSsk+JeqZxAZ
         kL2ya999UWkCcWi77qgPr6i4hL+Csmm/LeAVSUCwMzf20TFRqg56Y6/Ga9xY6ewgmgRR
         d+NUqrN/Bx8mibhQoK2CHET7ymgmcV4wwuYQdRW2BxCNQWfMZmRiZeVRDX17GtvR8H71
         AVFA==
X-Gm-Message-State: AOAM530XYIXbaCrrtenWbj2ygGRvIxNeEFCO/ekbkJXbi/8zZrcEPOCr
        nHOKGHoQ6DiTWEGFWhpvd2s=
X-Google-Smtp-Source: ABdhPJy9EB/bawh9AAQIIrmMTRJdAvSswAogr3LGk49QZBA9/0tS3riMNaI9xP1+c+CEhDgF9SExRw==
X-Received: by 2002:adf:f745:: with SMTP id z5mr28893913wrp.128.1592952507700;
        Tue, 23 Jun 2020 15:48:27 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id g144sm5671179wme.2.2020.06.23.15.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 15:48:27 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/12] arm64: dts: qcom: msm8994: Add support for SMD RPM
Date:   Wed, 24 Jun 2020 00:48:03 +0200
Message-Id: <20200623224813.297077-5-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623224813.297077-1-konradybcio@gmail.com>
References: <20200623224813.297077-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for SMD RPM, including pm8994 and pmi8994
regulators.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 111 ++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index e7f4b06eb12c..a4edc3be7024 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -159,9 +159,100 @@ smem_mem: smem_region@6a00000 {
 		};
 	};
 
+	smd {
+		compatible = "qcom,smd";
+		rpm {
+			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+			qcom,ipc = <&apcs 8 0>;
+			qcom,smd-edge = <15>;
+			qcom,local-pid = <0>;
+			qcom,remote-pid = <6>;
+
+			rpm-requests {
+				compatible = "qcom,rpm-msm8994";
+				qcom,smd-channels = "rpm_requests";
+
+				rpmcc: rpmcc {
+					compatible = "qcom,rpmcc-msm8994";
+					#clock-cells = <1>;
+				};
+
+				pm8994_regulators: pm8994-regulators {
+					compatible = "qcom,rpm-pm8994-regulators";
+					vdd_l1-supply = <&pm8994_s1>;
+					vdd_l2_26_28-supply = <&pm8994_s3>;
+					vdd_l3_11-supply = <&pm8994_s3>;
+					vdd_l4_27_31-supply = <&pm8994_s3>;
+					vdd_l5_7-supply = <&pm8994_s3>;
+					vdd_l6_12_32-supply = <&pm8994_s5>;
+					vdd_l8_16_30-supply = <&vreg_vph_pwr>;
+					vdd_l9_10_18_22-supply = <&vreg_vph_pwr>;
+					vdd_l13_19_23_24-supply = <&vreg_vph_pwr>;
+					vdd_l14_15-supply = <&pm8994_s5>;
+					vdd_l17_29-supply = <&vreg_vph_pwr>;
+					vdd_l20_21-supply = <&vreg_vph_pwr>;
+					vdd_l25-supply = <&pm8994_s5>;
+					vdd_lvs1_2 = <&pm8994_s4>;
+
+					pm8994_s1: s1 {};
+					pm8994_s2: s2 {};
+					pm8994_s3: s3 {};
+					pm8994_s4: s4 {};
+					pm8994_s5: s5 {};
+					pm8994_s6: s6 {};
+					pm8994_s7: s7 {};
+
+					pm8994_l1: l1 {};
+					pm8994_l2: l2 {};
+					pm8994_l3: l3 {};
+					pm8994_l4: l4 {};
+					pm8994_l6: l6 {};
+					pm8994_l8: l8 {};
+					pm8994_l9: l9 {};
+					pm8994_l10: l10 {};
+					pm8994_l11: l11 {};
+					pm8994_l12: l12 {};
+					pm8994_l13: l13 {};
+					pm8994_l14: l14 {};
+					pm8994_l15: l15 {};
+					pm8994_l16: l16 {};
+					pm8994_l17: l17 {};
+					pm8994_l18: l18 {};
+					pm8994_l19: l19 {};
+					pm8994_l20: l20 {};
+					pm8994_l21: l21 {};
+					pm8994_l22: l22 {};
+					pm8994_l23: l23 {};
+					pm8994_l24: l24 {};
+					pm8994_l25: l25 {};
+					pm8994_l26: l26 {};
+					pm8994_l27: l27 {};
+					pm8994_l28: l28 {};
+					pm8994_l29: l29 {};
+					pm8994_l30: l30 {};
+					pm8994_l31: l31 {};
+					pm8994_l32: l32 {};
+
+					pm8994_lvs1: lvs1 {};
+					pm8994_lvs2: lvs2 {};
+				};
+
+				pmi8994_regulators: pmi8994-regulators {
+					compatible = "qcom,rpm-pmi8994-regulators";
+
+					pmi8994_s1: s1 {};
+					pmi8994_s2: s2 {};
+					pmi8994_s3: s3 {};
+					pmi8994_bby: boost-bypass {};
+				};
+			};
+		};
+	};
+
 	smem {
 		compatible = "qcom,smem";
 		memory-region = <&smem_mem>;
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
 		hwlocks = <&tcsr_mutex 3>;
 	};
 
@@ -180,6 +271,11 @@ intc: interrupt-controller@f9000000 {
 				  <0xf9002000 0x1000>;
 		};
 
+		apcs: syscon@f900d000 {
+			compatible = "syscon";
+			reg = <0xf900d000 0x2000>;
+		};
+
 		timer@f9020000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -256,6 +352,11 @@ gcc: clock-controller@fc400000 {
 			reg = <0xfc400000 0x2000>;
 		};
 
+		rpm_msg_ram: memory@fc428000 {
+			compatible = "qcom,rpm-msg-ram";
+			reg = <0xfc428000 0x4000>;
+		};
+
 		restart@fc4ab000 {
 			compatible = "qcom,pshold";
 			reg = <0xfc4ab000 0x4>;
@@ -473,5 +574,15 @@ timer {
 					<1 4 0xff08>,
 					<1 1 0xff08>;
 	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
 
-- 
2.27.0

