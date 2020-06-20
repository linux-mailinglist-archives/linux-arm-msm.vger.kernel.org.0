Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8B6202494
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbgFTOtm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728305AbgFTOs0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:26 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBA7C0613EF;
        Sat, 20 Jun 2020 07:48:26 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a6so10393801wrm.4;
        Sat, 20 Jun 2020 07:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NDbZgnSpbzmFJhwG16PsfsPK9AUHPobxxZQXjVJN29U=;
        b=iaL3LNNdHL41hKDdpsxLURMBf5Xnsa+lvpKlLhDUyxgwRIV4XNCDHxU5WMbngvLNI6
         gmN4RUHKZ8jMrZZuM+SO+/N79sFKjpQ8XBTxaGCBmnYSHnEau58NIfhPjvADfsqZ5h3Z
         wFnZ2J02KiF+kSUXD6UijoWqaNxLHAAhpYZidtC3JTb/PtS3iEucEIx2CoEGgVr74lHT
         byBxAGtaYAKyUi8w3LqCgENoDwAs7kmhLasOsOIxJdS4KO++/61gUwTthr8CHe6cRh6z
         XMQL8MdqCfEhTJ+SalkxRfRE9USYE0uO2DHyMVDND/WjYYQ7JsJHUv4zFsrYYpTSr1wP
         4A0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NDbZgnSpbzmFJhwG16PsfsPK9AUHPobxxZQXjVJN29U=;
        b=a0kY7AxYtqUNRTcgzrV9HoSBavkEV1pg3seF48Qxe6G0E8xe/vpPxtZQatWG3X3EnO
         5jUI2vyN3aknymX2aGsOqPeqfE70jTohUP5rLyGwXjo+oqLfU0RL44jdNUv8wQGg5edN
         jNgUnJjf8WI3e9YXx+8edXAuME9RhEp3LM4pG1qTbO47TyN2t04r2dYrjahIss0xoQZR
         cvuWdg9HUDC9EOJDefcJeeZXQiDYjBmrDfvF4NH5xVs89tDjkUt6mdSTmhDiw/pNwPYS
         Gh3IM06sUtBWtiQNYjUyTWKgIV6KyoqFEiRuwfsmAOyphw+623Y/YVl+mpn6uc6JyeE9
         xHSw==
X-Gm-Message-State: AOAM533mOfADpRNPEuBdo3TH3NleYHmVy8OYR7WMIlQPpE2ukNSdEMSD
        Iru14bL7IKpDfqWLRO0u1QE=
X-Google-Smtp-Source: ABdhPJxBvZ+semH55mfvKCNOcVb+Fqw1ld1fdNag1bM73sxOXrgytMVS0gg5e0wvOa8zXBHydObz5Q==
X-Received: by 2002:adf:8444:: with SMTP id 62mr9145192wrf.278.1592664505142;
        Sat, 20 Jun 2020 07:48:25 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:24 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/21] arm64: dts: qcom: msm8994: Add support for SMD RPM
Date:   Sat, 20 Jun 2020 16:46:26 +0200
Message-Id: <20200620144639.335093-11-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
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
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 108 ++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 076da1fc52a1..f623f7e08994 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -262,6 +262,11 @@ tcsr_mutex_regs: syscon@fd484000 {
 			reg = <0xfd484000 0x2000>;
 		};
 
+		rpm_msg_ram: memory@fc428000 {
+			compatible = "qcom,rpm-msg-ram";
+			reg = <0xfc428000 0x4000>;
+		};
+
 		gcc: clock-controller@fc400000 {
 			compatible = "qcom,gcc-msm8994";
 			#clock-cells = <1>;
@@ -292,6 +297,97 @@ psci {
 		method = "hvc";
 	};
 
+	smd_rpm: smd {
+		compatible = "qcom,smd";
+		rpm {
+			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+			qcom,ipc = <&apcs 8 0>;
+			qcom,smd-edge = <15>;
+			qcom,local-pid = <0>;
+			qcom,remote-pid = <6>;
+
+			rpm_requests: rpm-requests {
+				compatible = "qcom,rpm-msm8994";
+				qcom,smd-channels = "rpm_requests";
+
+				rpmcc: qcom,rpmcc {
+					compatible = "qcom,rpmcc-msm8994";
+					#clock-cells = <1>;
+				};
+
+				pm8994-regulators {
+					compatible = "qcom,rpm-pm8994-regulators";
+
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
+				pmi8994-regulators {
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
 	clocks {
 		xo_board: xo_board {
 			compatible = "fixed-clock";
@@ -306,6 +402,17 @@ sleep_clk: sleep_clk {
 		};
 	};
 
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		status = "okay";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -326,6 +433,7 @@ tcsr_mutex: hwlock {
 	smem {
 		compatible = "qcom,smem";
 		memory-region = <&smem_mem>;
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
 		hwlocks = <&tcsr_mutex 3>;
 	};
 };
-- 
2.27.0

