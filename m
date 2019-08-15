Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 143B58E216
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 02:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729001AbfHOAtd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 20:49:33 -0400
Received: from onstation.org ([52.200.56.107]:44630 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728721AbfHOAtT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 20:49:19 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 794583EA24;
        Thu, 15 Aug 2019 00:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565830158;
        bh=SH5QC5W6ScpXRbQk/bxm6ycmyn+BwV2nQJz7QhBnCZ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CoHO95m541ra2JxESP14PeSWxmMgK/RpMhhr8BrHGVhrPUGGDrqK37N8b/0jiTLDW
         youqx3ITy0pDNSmzOq6fYOzWmozzih25HM3gNXN/FqaFK1jeYz+EIFR847fXVrQnCR
         YgR2Aw7pxnkRi1q/6SxJbh/X8xATgknLqCIchHQ4=
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
        sean@poorly.run
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, linus.walleij@linaro.org,
        enric.balletbo@collabora.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH RFC 10/11] ARM: dts: qcom: msm8974: add HDMI nodes
Date:   Wed, 14 Aug 2019 20:48:53 -0400
Message-Id: <20190815004854.19860-11-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add HDMI tx and phy nodes to support an external display that can be
connected over the SlimPort. This is based on work from Jonathan Marek.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
The hdmi-tx node in the downstream MSM sources:
https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/boot/dts/msm8974-mdss.dtsi#L101

 arch/arm/boot/dts/qcom-msm8974.dtsi | 80 +++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 369e58f64145..35c51336a9d4 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1139,6 +1139,13 @@
 
 					port@0 {
 						reg = <0>;
+						mdp5_intf3_out: endpoint {
+							remote-endpoint = <&hdmi_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
 						mdp5_intf1_out: endpoint {
 							remote-endpoint = <&dsi0_in>;
 						};
@@ -1216,6 +1223,79 @@
 				clocks = <&mmcc MDSS_AHB_CLK>;
 				clock-names = "iface";
 			};
+
+			hdmi: hdmi-tx@fd922100 {
+				status = "disabled";
+
+				compatible = "qcom,hdmi-tx-8974";
+				reg = <0xfd922100 0x35c>,
+				      <0xfc4b8000 0x60f0>;
+				reg-names = "core_physical",
+				            "qfprom_physical";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+
+				power-domains = <&mmcc MDSS_GDSC>;
+
+				clocks = <&mmcc MDSS_MDP_CLK>,
+				         <&mmcc MDSS_AHB_CLK>,
+				         <&mmcc MDSS_HDMI_CLK>,
+				         <&mmcc MDSS_HDMI_AHB_CLK>,
+				         <&mmcc MDSS_EXTPCLK_CLK>;
+				clock-names = "mdp_core",
+				              "iface",
+				              "core",
+				              "alt_iface",
+				              "extp";
+
+				hpd-5v-supply = <&pm8941_5vs2>;
+				core-vdda-supply = <&pm8941_l12>;
+				core-vcc-supply = <&pm8941_s3>;
+
+				/*
+				 * FIXME - drivers/gpu/drm/msm/hdmi/hdmi.c via hpd_reg_names_8x74
+				 * looks for hpd-gdsc-supply. What should be used here? Shouldn't
+				 * this functionality be provided by the power-domains above?
+				 */
+
+				phys = <&hdmi_phy>;
+				phy-names = "hdmi_phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						hdmi_in: endpoint {
+							remote-endpoint = <&mdp5_intf3_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+					};
+				};
+			};
+
+			hdmi_phy: hdmi-phy@fd922500 {
+				status = "disabled";
+
+				compatible = "qcom,hdmi-phy-8974";
+				reg = <0xfd922500 0x7c>;
+				reg-names = "hdmi_phy";
+
+				clocks = <&mmcc MDSS_AHB_CLK>,
+				         <&mmcc MDSS_HDMI_AHB_CLK>;
+				clock-names = "iface",
+				              "alt_iface";
+
+				core-vdda-supply = <&pm8941_l12>;
+				vddio-supply = <&pm8941_s3>;
+
+				#phy-cells = <0>;
+			};
 		};
 	};
 
-- 
2.21.0

