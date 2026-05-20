Return-Path: <linux-arm-msm+bounces-108859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N6/MWLnDWqm4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:54:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A92BB592A05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6F2A30C65AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA7936B067;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edaATBZ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FF8363C59;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295242; cv=none; b=phyHjfwOhOGunYE/qHTfZgsCU+gooFTCGk0hYn0fCyxoxJrTS8MEAQsQ+Q2V+7fc/FW6Y98pt+MIQ91pHAt8l7mUjKsfy6ZbW2lVGq5od1+gYD+tFS798QIVrNYg0UjT/YhnBfLVIN4wdtwY2/+4Tak8E35ZEo+RiQ+evvlMLwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295242; c=relaxed/simple;
	bh=knTtz4F+48wvyzMOyCiKlq4avjtUX4KrcQGtpNh5T3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OGBrtRaKb1W1VMRowyDZeAsoyZbRGj7zxmOXMoaZrFgHe2TcnCj7c1oLO1A49bLoKDmlTIWoi48N1FKNy8pJFUETqPtJzdJs4EjibcUafNOVN4B6VBDrAjb4N1zolHpYbAqDGQgTmICcASVrxHz4RWPVarPrdJDBqJvysGadGVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edaATBZ6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04D6BC2BCB8;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779295242;
	bh=knTtz4F+48wvyzMOyCiKlq4avjtUX4KrcQGtpNh5T3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=edaATBZ6OF6uEmcJOlTD8c7N+6lNTTzYAOtKsht+4ZOTSbI2BKwWBHwfNtAB/z5qL
	 2/+xHtvs+pvvQ6Z8RJhEcv7g0bCPNPZVsCfRPABuMxwFIninrTrKETBGaDflxPtLtG
	 xho8L4rmkJYL0XX+EqROL5apprqISl/AcmJkBj7xdd/FAj4hcJBVVScgFcooNilpJw
	 eg6X321mCZiQUNeANtO2RjRH4k2TUewPryyE2S2nnuZ3xfQhSGMcEC2mXtKCxuTFR9
	 F1k02R8EIUUr5txXjMmgOWu266UtaEfn36LKmUFlPsnvG2hBQdDRlrneEOJ+LKVtTg
	 SNtB38nA7bWmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E705DCD4F3D;
	Wed, 20 May 2026 16:40:41 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Wed, 20 May 2026 18:40:07 +0200
Subject: [PATCH 03/11] arm64: dts: qcom: sc8280xp-arcata: Enable the eDP
 display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-surface-sp9-5g-for-next-v1-3-9df52552bf87@gmail.com>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779295238; l=5543;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=ldc0TLCvhrzO6UcurjPbFyDeI/OxIDyYi6mefy873oA=;
 b=P74/w6D9vJWdNC8SZSxpTKm3NCYK6eA8VtY7KbSZ1H1bYHK9Ot79FUFIq0bevBtlsETm8/Ghr
 eB6Rk8sWlM3AqLIbTAgQYK+8i78M9/ltYac3FTrlo8W4oRQb+Zt/qz6
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com
X-Spamd-Result: default: False [1.87 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.53)[subject];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108859-lists,linux-arm-msm=lfdr.de,jerome.debretagne.gmail.com];
	FREEMAIL_TO(0.00)[chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	HAS_REPLYTO(0.00)[jerome.debretagne@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A92BB592A05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Add the vreg_edp_3p3, edp_reg_en and mdss0_dp3 nodes to enable the
Surface Pro 9 5G eDP-based LCD display (LG LP129WT232166).

The enable GPIO 36 was found by decompiling AeoB dumps [1]:

                Package ()
                {
                    "CLOCK",
                    Package ()
                    {
                        "gcc_edp3_phy_clkref_en",
                        0x0000000000000001,
                    },
                },
                Package ()
                {
                    "FOOTSWITCH",
                    Package ()
                    {
                        "mdss_0_disp_cc_mdss_core_gdsc",
                        0x0000000000000001,
                        0x0000000000000001,
                    },
                },
                Package ()
                {
                    "PSTATE_ADJUST",
                    Package ()
                    {
                        0x0000000000000002,
                        0x0000000000000000,
                    },
                },
                Package ()
                {
                    "PSTATE_ADJUST",
                    Package ()
                    {
                        0x0000000000000003,
                        0x0000000000000001,
                    },
                },
                Package ()
                {
                    "PMICVREGVOTE",
                    Package ()
                    {
                        "PPP_RESOURCE_ID_LDO3_B",
                        0x0000000000000001,
                        0x0000000000124F80,
                        0x0000000000000001,
                        0x0000000000000007,
                        0x0000000000000000,
                        "HLOS_DRV",
                        "REQUIRED",
                    },
                },
                Package ()
                {
                    "PMICVREGVOTE",
                    Package ()
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        0x0000000000000001,
                        0x00000000000D6D80,
                        0x0000000000000001,
                        0x0000000000000007,
                        0x0000000000000000,
                        "HLOS_DRV",
                        "REQUIRED",
                    },
                },
                Package ()
                {
                    "TLMMGPIO",
                    Package ()
                    {
                        0x0000000000000024,  <== GPIO 36
                        0x0000000000000001,
                        0x0000000000000000,
                        0x0000000000000001,
                        0x0000000000000000,
                        0x0000000000000000,
                    },
                },

[1] https://github.com/alexVinarskis/qcom-aeob-dumps/blob/master/microsoft-surface-pro-9-5G-1996/qcdxkmext8280_ARC_part2.json#L156-L168

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 64 ++++++++++++++++++++--
 1 file changed, 59 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index 14287092fb07ea15e527fd318f7ea2155448b26c..7f1cc1899002529b7ac7340974c99f6ed493d410 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -137,6 +137,22 @@ pmic_glink_con1_sbu: endpoint {
 		};
 	};
 
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 36 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_edp_bl: regulator-edp-bl {
 		compatible = "regulator-fixed";
 
@@ -361,7 +377,6 @@ vreg_l6b: ldo6 {
 			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-boot-on;
-			regulator-always-on;	// FIXME: VDD_A_EDP_0_0P9
 		};
 	};
 
@@ -465,10 +480,6 @@ &dispcc0 {
 	status = "okay";
 };
 
-&dispcc1 {
-	status = "okay";
-};
-
 &gpi_dma0 {
 	status = "okay";
 };
@@ -511,6 +522,42 @@ &mdss0_dp1_out {
 	remote-endpoint = <&usb_1_qmpphy_dp_in>;
 };
 
+&mdss0_dp3 {
+	compatible = "qcom,sc8280xp-edp";
+	/delete-property/ #sound-dai-cells;
+
+	data-lanes = <0 1 2 3>;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+
+			backlight = <&backlight>;
+			power-supply = <&vreg_edp_3p3>;
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss0_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss0_dp3_out {
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss0_dp3_phy {
+	compatible = "qcom,sc8280xp-edp-phy";
+	vdda-phy-supply = <&vreg_l6b>;
+	vdda-pll-supply = <&vreg_l3b>;
+
+	status = "okay";
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
@@ -932,6 +979,13 @@ hstp-sw-ctrl-pins {
 		};
 	};
 
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio36";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	nvme_reg_en: nvme-reg-en-state {
 		pins = "gpio135";
 		function = "gpio";

-- 
2.47.3



