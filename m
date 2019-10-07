Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C365ECDA46
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 03:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbfJGBpc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Oct 2019 21:45:32 -0400
Received: from onstation.org ([52.200.56.107]:33086 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727158AbfJGBpY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Oct 2019 21:45:24 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 24DC03F23D;
        Mon,  7 Oct 2019 01:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1570412723;
        bh=qSF7JxG0bFyn3cQPR8q7gVg5cnvbx8ozSyPIX8JTT9c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MQ17mbX0Vsr/tmary8b/IbFnHUF9g4q96V0QWEe7CEGCSGnd62+BzOTpbjTDrNxcM
         h3cVvNbZ5/DGjMCi0EqY2j1hg/9qki3fxibtvEGECG3dFENvMewbniGUGU6iVAAQdH
         xoahdq/riTIuaqz+bBsU9JvI/+/CyJbneBdyaGYA=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     bjorn.andersson@linaro.org, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, jonathan@marek.ca,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH RFC v2 4/5] ARM: dts: qcom: msm8974: add HDMI nodes
Date:   Sun,  6 Oct 2019 21:45:08 -0400
Message-Id: <20191007014509.25180-5-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007014509.25180-1-masneyb@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add HDMI tx and phy nodes to support an external display that can be
connected over the SlimPort. This is based on work from Jonathan Marek.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes since v1:
- Add hdmi_pll to hdmi-phy node
- add power-domain to hdmi-phy per binding specification
- Remove FIXME comment regarding the hpd-gdsc-supply. I saw a recent
  post on linux-arm-msm that this is present for running the upstream
  MSM display driver on the downstream kernel.

 arch/arm/boot/dts/qcom-msm8974.dtsi | 78 +++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 7fc23e422cc5..af02eace14e2 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1258,6 +1258,13 @@
 
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
@@ -1335,6 +1342,77 @@
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
+				reg = <0xfd922500 0x7c>,
+				      <0xfd922700 0xd4>;
+				reg-names = "hdmi_phy",
+				            "hdmi_pll";
+
+				clocks = <&mmcc MDSS_AHB_CLK>,
+				         <&mmcc MDSS_HDMI_AHB_CLK>;
+				clock-names = "iface",
+				              "alt_iface";
+
+				core-vdda-supply = <&pm8941_l12>;
+				vddio-supply = <&pm8941_s3>;
+
+				power-domains = <&mmcc MDSS_GDSC>;
+
+				#phy-cells = <0>;
+			};
 		};
 	};
 
-- 
2.21.0

