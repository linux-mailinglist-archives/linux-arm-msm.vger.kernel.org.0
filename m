Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C97922FFB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 04:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgG1Cj5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 22:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbgG1Cj4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 22:39:56 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61363C0619D4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 19:39:56 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id t23so10763192qto.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2020 19:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yVMPt7oOkfZt8+mUHt1G0xa2MlVS24FjEN8IWHp4iEo=;
        b=pE2T9gbdYmjqIIlPzOAZd82ha1siBwlQ7+aqGKUBhzB956MvcoSllJKtUgM/vuchFj
         65XNk38RaKlXMsUVHA2sRcbYfuEWnsz2DuQwDi+9jN0sdyhY8kOEKhTBdJ4+wYI023Xl
         MFwH5RMrShhwyPE0gf0/v78xNytmH7QkkhaTEPIsWnEL2cLbbGN69zdu32rr77bLOehX
         KclOQTBEIGUuSXmA9McU/EMfgmovfxTlPHHR1maf9vJU8DcqN8o8RX2IysSmsPT8rRG0
         w8aC+EQ171zdAiOtG/jSn18vnHo+U3lc1uDMpZ6HgGXzzOYa23M3XKzMFFq/G0J6dXxR
         KGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yVMPt7oOkfZt8+mUHt1G0xa2MlVS24FjEN8IWHp4iEo=;
        b=Ux7E9CvZRtGWaRTqysw8Rbj9i+dPRd5QlUetmu7U9P6XflL3+wCToDrFBWFPfOEd3d
         amJOsM0mTtHo/w63g7jV4SBHhylo50DZGt4qQH/gOuDhYpzZZpu45xHrgJh8xxBT3u6v
         OfaOAkdU+T6tfI1my7fLtQAfxQCXXs3HgmPDfwyiBRXeym6Hvbq++bgwz19qFzQyiJ4h
         tygCAKrfVONWcFP6uIFaPEP0NA3nOSmF2MCmxXFb+7IbVttPiTaA84ROdUEuooSxxFyj
         mbsYO2mzqK56Q2We1HQpLRusZ+Qp1yitrSty5KS6Z1Ny7fF7z4njdX/EO+5RvG5Qk6qb
         zxmg==
X-Gm-Message-State: AOAM5315VxArhAuf7JgM74gtV27TujzYl/i8YXnJxfG+grgirF195SDs
        0XPsIgfzvmYKHM84xasfRIWAOyX3wuU=
X-Google-Smtp-Source: ABdhPJzQfSmnfR0G1sOyYPd3hsEqIvngYIz1b2nbxP+KHp/4YvgtL1f1Ho3I9NvGxE1etSwgHmI7qQ==
X-Received: by 2002:aed:2f04:: with SMTP id l4mr25452746qtd.227.1595903995355;
        Mon, 27 Jul 2020 19:39:55 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id z3sm13885548qkc.4.2020.07.27.19.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 19:39:54 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 7/7] arm64: dts: qcom: sm8250: add interconnect nodes
Date:   Mon, 27 Jul 2020 22:38:06 -0400
Message-Id: <20200728023811.5607-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200728023811.5607-1-jonathan@marek.ca>
References: <20200728023811.5607-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the interconnect dts nodes for sm8250.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 82 ++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 636e2196138c..945bd4a9d640 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,gcc-sm8250.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8250.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-aoss-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -978,6 +979,55 @@ spi13: spi@a94000 {
 			};
 		};
 
+		config_noc: interconnect@1500000 {
+			compatible = "qcom,sm8250-config-noc";
+			reg = <0 0x01500000 0 0xa580>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		system_noc: interconnect@1620000 {
+			compatible = "qcom,sm8250-system-noc";
+			reg = <0 0x01620000 0 0x1c200>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mc_virt: interconnect@163d000 {
+			compatible = "qcom,sm8250-mc-virt";
+			reg = <0 0x0163d000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre1_noc: interconnect@16e0000 {
+			compatible = "qcom,sm8250-aggre1-noc";
+			reg = <0 0x016e0000 0 0x1f180>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre2_noc: interconnect@1700000 {
+			compatible = "qcom,sm8250-aggre2-noc";
+			reg = <0 0x01700000 0 0x33000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		compute_noc: interconnect@1733000 {
+			compatible = "qcom,sm8250-compute-noc";
+			reg = <0 0x01733000 0 0xa180>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mmss_noc: interconnect@1740000 {
+			compatible = "qcom,sm8250-mmss-noc";
+			reg = <0 0x01740000 0 0x1f080>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8250-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
@@ -1050,6 +1100,13 @@ ufs_mem_phy_lanes: lanes@1d87400 {
 			};
 		};
 
+		ipa_virt: interconnect@1e00000 {
+			compatible = "qcom,sm8250-ipa-virt";
+			reg = <0 0x01e00000 0 0x1000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		tcsr_mutex_regs: syscon@1f40000 {
 			compatible = "syscon";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
@@ -1364,6 +1421,27 @@ usb_2_ssphy: lane@88eb200 {
 			};
 		};
 
+		dc_noc: interconnect@90c0000 {
+			compatible = "qcom,sm8250-dc-noc";
+			reg = <0 0x090c0000 0 0x4200>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		gem_noc: interconnect@9100000 {
+			compatible = "qcom,sm8250-gem-noc";
+			reg = <0 0x09100000 0 0xb4000>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		npu_noc: interconnect@9990000 {
+			compatible = "qcom,sm8250-npu-noc";
+			reg = <0 0x09990000 0 0x1600>;
+			#interconnect-cells = <1>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sm8250-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
@@ -2359,6 +2437,10 @@ rpmhpd_opp_turbo_l1: opp10 {
 					};
 				};
 			};
+
+			apps_bcm_voter: bcm_voter {
+				compatible = "qcom,bcm-voter";
+			};
 		};
 	};
 
-- 
2.26.1

