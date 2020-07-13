Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC58721DA62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 17:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730132AbgGMPnB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 11:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730186AbgGMPnB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 11:43:01 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA892C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 08:42:59 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id k18so12607771qke.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 08:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VZ9xGmnDMhVmVeHb/A9jwCumG7lyw2W/vCjl/eftB8Q=;
        b=uh/p1Ef6AcNvbVRpHudmQkMOJ1S/koQyeNCuMN4rYGt0P/Cyivoo4wCbanFKcJKRsw
         Sx+iSxYxAONbEgso6SXVN1HbKBlMhfPWnD02+V6DrlX8CAN/kj1BQ1G0k9xeJHqMp+9W
         O9k+hZuCuW3iwbAZV+poMsuO5Zj7hjPr2Tha8nmyOw4IbWOqhuoF1lxQjUSWCCpxZAPn
         vpDtaQDcVMepBU3YZJPIhf/JR4M8jBEcXb2kwTq0WEYrLyHlOOmpBOSXuGXcYtu0R+lN
         FOVlrlxqZeWl7ixsowFCXK9LAT6TB6rDkHOgR/V0SGEnAbVmL6suW7KAKN5I7NX/vCeH
         HPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VZ9xGmnDMhVmVeHb/A9jwCumG7lyw2W/vCjl/eftB8Q=;
        b=jr9lzVXsCDNbL3XxmklbGG9po5sooQlW6n4pBaWrBbRxIxinM7BM3fWQoXJZdJQYMv
         64j8RJ2tnUnbhzbXTylvxNwHSti0AjBUPBHM+mY36nECbb/QAWoPVbmYpQ6qN9fi7pMm
         IW/6t9XkraGDmrjoeJ4atxBTlzyAhEQHg36v5KWs/EOgGxqceXL2MfcXgLFFuN0a+nRU
         xTdq2i4OfKQ5OanX7co3UmGbTBXi8S56hlrlFAy726aqDqlULS4/wzgsBLwSvCvAqKDC
         bksjC0c5U7fFe0iBVQgPOVcWtmuwfBhRDud/EI80MsW3NKpDbtlSdK/AyuCCXC6uYeKF
         jyYw==
X-Gm-Message-State: AOAM530fErtU2DeKer46WihqG8jWfQpCQF+yy1y0qIdFaOXQo13Xn1yE
        Vnh6ut+T3TjUF5TOF3YWEEfpGwXb63w=
X-Google-Smtp-Source: ABdhPJzsL343pl6s6o//ejmnrLm038pBE/14aNx1jNZS+SLcX9OWFto4sJBCKMsdD+D/PXhSscjkOw==
X-Received: by 2002:ae9:e212:: with SMTP id c18mr211782qkc.348.1594654978946;
        Mon, 13 Jul 2020 08:42:58 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id l1sm19806371qtk.18.2020.07.13.08.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 08:42:58 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 6/7] arm64: dts: qcom: sm8150: add interconnect nodes
Date:   Mon, 13 Jul 2020 11:41:15 -0400
Message-Id: <20200713154121.22094-7-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200713154121.22094-1-jonathan@marek.ca>
References: <20200713154121.22094-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the interconnect dts nodes for sm8150.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 82 ++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 33ff99132f4f..fa9cd9d60093 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,gcc-sm8150.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
+#include <dt-bindings/interconnect/qcom,sm8150.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -440,6 +441,69 @@ uart2: serial@a90000 {
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
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8150-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
@@ -860,6 +924,20 @@ usb_2_ssphy: lane@88eb200 {
 			};
 		};
 
+		mc_virt: interconnect@9680000 {
+			compatible = "qcom,sm8150-mc-virt";
+			reg = <0 0x09680000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		gem_noc: interconnect@96ab000 {
+			compatible = "qcom,sm8150-gem-noc";
+			reg = <0 0x096ab000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sm8150-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
@@ -1280,6 +1358,10 @@ rpmhpd_opp_turbo_l1: opp11 {
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

