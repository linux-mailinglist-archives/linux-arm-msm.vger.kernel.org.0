Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F888210C8C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 15:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731199AbgGANpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 09:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731191AbgGANpN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 09:45:13 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D163CC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2020 06:45:12 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id l6so22173262qkc.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E0dkCsLMudyJQK9XopmL4Ao0miVXXn03E6CRX3A6/rQ=;
        b=Ds3haewbsxIZQB7VrwO8zsiVjHuhg7a59ZPErCBkNWhNtDtbn4Xtun+UqGh30dIjXm
         MlSXZspMgDORz9ZGhwVZDI0Nc0qu31eNwsfz6qmYJiLl2yC0Zu6XzpPepvoYixGlo7Jw
         EsCWPd492S28x8C6Dq/NW1Fb7/Deya4QNu+5Czs1fIDfq9Z4yYonFaWyLZ/m9BtJ/SeG
         3Mhv8W1a4yiYe50FKipXYaN/pYtqJeMWvUD2NWkmss8pdYO6d6l9iruzTl77edbgPW0Y
         ymOINHs3gbuEUxAMqP+KMKrPqoeDvn8skfQEQ5mM6FvLntWeAtMYNPe33LkrKgSdcyfS
         mG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E0dkCsLMudyJQK9XopmL4Ao0miVXXn03E6CRX3A6/rQ=;
        b=tHqR6OBuCH2sU1R+09yteZpb24Opb1DjfVU3tdiQ5bkjZh3wSQfLzHjYMATb4mA7Uv
         J6iefo2f8KGQbMM9774qLcVJEz/Dq2VuC7vtQ2n6CtL74fU1WjA8/v1GTTkN9f2/bSHj
         dYVxlDeJGwodTZShFxPoJKoD6X5cqmXuOMPn0ZKSqMOD2ysocB3An0Kc0M162ISpvve4
         eMVjfb/WuMrQYerplGJjbf7V4KoZtagIZDEEnoHe+CpLN06QAElbz4zpgiX4PM/Vr/FU
         mhPlCoISeDhkIab+OjVuwdAfbM94uv0gfnZezbYelnGZryB2/DLTEN2c6uTjke/UiCzE
         RmCQ==
X-Gm-Message-State: AOAM5328LYBfTUqCtgV/0qU4z+m9grOGFJyDSQsznu5n5NgEZibad9ag
        I5oKUWt93CZeeUu14ooCxJjiRnessnE=
X-Google-Smtp-Source: ABdhPJzYfEivJD4euXPPpHJlrDaa/xqN3ucLIESTkPqSaMHKQswi5Z0yqOcc4fXP8uDh8TngVFNsSg==
X-Received: by 2002:a05:620a:1235:: with SMTP id v21mr7627144qkj.454.1593611111444;
        Wed, 01 Jul 2020 06:45:11 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id d136sm1444345qke.47.2020.07.01.06.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 06:45:10 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/6] arm64: dts: qcom: sm8150: add interconnect nodes
Date:   Wed,  1 Jul 2020 09:42:54 -0400
Message-Id: <20200701134259.8055-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200701134259.8055-1-jonathan@marek.ca>
References: <20200701134259.8055-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the interconnect dts nodes for sm8150.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 118 +++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 5272e27eca70..747521666700 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,gcc-sm8150.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
+#include <dt-bindings/interconnect/qcom,sm8150.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -431,6 +432,75 @@ uart2: serial@a90000 {
 			};
 		};
 
+		dc_noc: interconnect@14e0000 {
+			compatible = "qcom,sm8150-dc-noc";
+			reg = <0 0x014e0000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		config_noc: interconnect@1500000 {
+			compatible = "qcom,sm8150-config-noc";
+			reg = <0 0x01500000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		camnoc_virt: interconnect@1620000 {
+			compatible = "qcom,sm8150-camnoc-virt";
+			reg = <0 0x01620000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		ipa_virt: interconnect-ipa@1620000 {
+			compatible = "qcom,sm8150-ipa-virt";
+			reg = <0 0x01620000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		system_noc: interconnect@1629000 {
+			compatible = "qcom,sm8150-system-noc";
+			reg = <0 0x01629000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre1_noc: interconnect@16e4000 {
+			compatible = "qcom,sm8150-aggre1-noc";
+			reg = <0 0x016e4000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre2_noc: interconnect@1706000 {
+			compatible = "qcom,sm8150-aggre2-noc";
+			reg = <0 0x01706000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		compute_noc: interconnect@1720000 {
+			compatible = "qcom,sm8150-compute-noc";
+			reg = <0 0x01720000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mmss_noc: interconnect@1749000 {
+			compatible = "qcom,sm8150-mmss-noc";
+			reg = <0 0x01749000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mmss_noc_display: interconnect-display@1749000 {
+			compatible = "qcom,sm8150-mmss-noc-display";
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&disp_bcm_voter>;
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8150-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
@@ -851,6 +921,32 @@ usb_2_ssphy: lane@88eb200 {
 			};
 		};
 
+		mc_virt: interconnect@9680000 {
+			compatible = "qcom,sm8150-mc-virt";
+			reg = <0 0x09680000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mc_virt_display: interconnect-display@9680000 {
+			compatible = "qcom,sm8150-mc-virt-display";
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&disp_bcm_voter>;
+		};
+
+		gem_noc: interconnect@96ab000 {
+			compatible = "qcom,sm8150-gem-noc";
+			reg = <0 0x096ab000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		gem_noc_display: interconnect-display@96ab000 {
+			compatible = "qcom,sm8150-gem-noc-display";
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&disp_bcm_voter>;
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sm8150-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
@@ -941,6 +1037,24 @@ usb_2_dwc3: dwc3@a800000 {
 			};
 		};
 
+		disp_rsc: rsc@af20000 {
+			label = "display_rsc";
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x0 0xaf20000 0x0 0x10000>;
+			reg-names = "drv-0";
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0x1c00>;
+			qcom,drv-id = <0>;
+			qcom,tcs-config = <SLEEP_TCS   1>,
+					  <WAKE_TCS    1>,
+					  <ACTIVE_TCS  2>,
+					  <CONTROL_TCS 0>;
+
+			disp_bcm_voter: bcm_voter {
+				compatible = "qcom,bcm-voter";
+			};
+		};
+
 		aoss_qmp: power-controller@c300000 {
 			compatible = "qcom,sm8150-aoss-qmp";
 			reg = <0x0 0x0c300000 0x0 0x100000>;
@@ -1249,6 +1363,10 @@ rpmhpd_opp_turbo_l1: opp11 {
 					};
 				};
 			};
+
+			apps_bcm_voter: bcm_voter {
+				compatible = "qcom,bcm-voter";
+			};
 		};
 
 		cpufreq_hw: cpufreq@18323000 {
-- 
2.26.1

