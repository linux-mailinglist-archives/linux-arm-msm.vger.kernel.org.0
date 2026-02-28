Return-Path: <linux-arm-msm+bounces-94612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGM2Npv5omn18QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:20:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA4E1C385E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D18030DF866
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962BC3033F4;
	Sat, 28 Feb 2026 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSdT91KR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0771D32E6BB
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 14:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772288346; cv=none; b=VPd2dJhZCwO34Jz2zNBZGfner8FtampOGa08Glc9kyIEw4J661RoUHQpBQAOO6uaRnipy/8kD0WYN0cIZD07p9dvUFvvjnZVnPBp256A9fEeWybpef9n9+KOahCeft9cZmO33Aq6vvNBKPppeuRSn69bbHdr5VrBzy7gBEdDx3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772288346; c=relaxed/simple;
	bh=2Q+93zcYs07cAM5ogkes+mi0L0Q3+o2uuGePjmWgSD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dX5PCz4z1hf10PbkKriqV4WXK3633+XS3UYw/e3kxO1Z5AjlmA71a3IKZTNbKpxB3CRjefbdVmdZC4i1kNgztReP6GGwP6nncHRd7Qai7O86su5U57HnSuwU5mv0o3vQLEqpl409y3Vt7eDIx3xTa4kE/uvLA0EjcDGorcEn+ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSdT91KR; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2aae4816912so20392845ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 06:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772288344; x=1772893144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80XRk/bwjPPdNiwFQbXl7n9xoB7/2Y8y5DKEs5r1FxA=;
        b=mSdT91KRzG3uT5Rk7tcndvibxIDUrY7C3VvZei+4jNco/J9uVQRVcm8aj0rszG27GW
         /AWSC4HQEkglI7GlXS0G1TlcKdyMAGT8vLaVvsL00d+S4tI0+vxgpSxYhgPoU4g2c229
         2u+BTPj8TChuSvTGiAqYoZWcuHMbgxpd2EecmWVS/Bo3J098WZWRh1HwMglSo1VIJwfF
         TuIZuus/SKtGWcMIx37f8T+W2HydUGFcsmrB8Tpn/FuYlHR1wWmmuLNcDwN0pXLM6BWK
         FN1l4Sp0D5UeHToYel9Dxt08CL4bZn+aEBBCNs5VwTz4oZiLWcFEhKPppnh1ELHspH3m
         p2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772288344; x=1772893144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=80XRk/bwjPPdNiwFQbXl7n9xoB7/2Y8y5DKEs5r1FxA=;
        b=IPrUoc27Kx7pQ4QjYeI6LtUy2if3ajBLfI2tphvE51hcSxqmi4Tz4SAFJTBnIeSmBP
         sSE6uqCwY3pQGjcqGqGxWgoRAmezYfiJEQGF/vhiVh6B6hn/3DoclTKGPlxz6o79A1kH
         9dmCv8BMXldy+/34BWrTDNYX7qrT/5QmR4ZbFHvIzLTrVEn5uFbrtntECka/4qnQnkLl
         mwVgXf2D/+xgg2PXuPKpzlxTmNR7j515mDb71ZaI8xmyeoW7oC54RGn8IlbGfMWvDtv4
         rNbAhDzbCVtTvHK1b+ZZGWMNpk/umeN3q9yyngDRmwBrIBfeQvEFll4iFG2su+LA/O+8
         vr5Q==
X-Gm-Message-State: AOJu0Yw34BvwCi5IufimBQj+ElChqwLnBZiw3+VSgQzyLF+yqx09F3X7
	jTT5HfFW43kmYLN1jNS/VJX1z9Poxn0mCdFoeuwpCW0v4v46XU7M6J20snHF/8mq3Xs=
X-Gm-Gg: ATEYQzwyCoBjAZpabZ59whjA99QulBJPlj4y2CZihg+MpiQtDfxscvZ8QdhvR910yDR
	ksLI7EPBagBDTlVBjMr8bALr1q1niCEhVjxAaqdxeE1IYs4nXGinqphdLuTmR71lvJc/UBUr8w3
	xITa4g0IkR76ARyfVZwg8TiaQxqUzpCzi0qy5NJ/nj+pj+t9LFV179DFStjq4tmma2IKZZyFUXj
	z+e6GNtJl5HevQzX70rfiB/BGPoqNqOOjblaYFmjoicIkhW1+PrHPmidrHsNpinWt2QKhSv3jUS
	dr9niNsMLIj8cpJ3UAb9tEBzPlI+lrECTudNj125haGxqEp0KHYZoTT4qH1+MipH7NPMwtvDblC
	3ZtfPn53c0EX8YCbJqlgd5FFJmkKfKT9qieNNJW3hlreeKUTnsWcsUAhZYi4tjz/NdScg4WxlHy
	HDapvIF5tTm6nBk5R6jICD
X-Received: by 2002:a17:902:f64c:b0:2aa:d6a1:e18b with SMTP id d9443c01a7336-2ae2e3f14e1mr76946475ad.18.1772288344231;
        Sat, 28 Feb 2026 06:19:04 -0800 (PST)
Received: from nuvole ([2408:844d:b08:3702:16a4:72fd:8170:4ed3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm18697235ad.6.2026.02.28.06.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 06:19:03 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyu Gao <gty0622@gmail.com>,
	White Lewis <liu224806@gmail.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP
Date: Sat, 28 Feb 2026 22:17:15 +0800
Message-ID: <20260228141715.35307-5-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228141715.35307-1-mitltlatltl@gmail.com>
References: <20260228141715.35307-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-94612-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4CA4E1C385E
X-Rspamd-Action: no action

The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
utilizing the same register layouts and clock structures.

However, DSI won't work properly for now until we submit dispcc fixes.
And some DSC enabled panels require DPU timing calculation fixes too.
(hdisplay / width timing round errors cause the fifo error)

Co-developed-by: Tianyu Gao <gty0622@gmail.com>
Signed-off-by: Tianyu Gao <gty0622@gmail.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
Tested-by: White Lewis <liu224806@gmail.com> # HUAWEI Gaokun3
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 404 ++++++++++++++++++++++++-
 1 file changed, 396 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 706eb1309..1599d698b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
 #include <dt-bindings/clock/qcom,gpucc-sc8280xp.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -4652,13 +4653,31 @@ ports {
 
 					port@0 {
 						reg = <0>;
+
 						mdss0_intf0_out: endpoint {
 							remote-endpoint = <&mdss0_dp0_in>;
 						};
 					};
 
+					port@1 {
+						reg = <1>;
+
+						mdss0_intf1_out: endpoint {
+							remote-endpoint = <&mdss0_dsi0_in>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						mdss0_intf2_out: endpoint {
+							remote-endpoint = <&mdss0_dsi1_in>;
+						};
+					};
+
 					port@4 {
 						reg = <4>;
+
 						mdss0_intf4_out: endpoint {
 							remote-endpoint = <&mdss0_dp1_in>;
 						};
@@ -4666,6 +4685,7 @@ mdss0_intf4_out: endpoint {
 
 					port@5 {
 						reg = <5>;
+
 						mdss0_intf5_out: endpoint {
 							remote-endpoint = <&mdss0_dp3_in>;
 						};
@@ -4673,6 +4693,7 @@ mdss0_intf5_out: endpoint {
 
 					port@6 {
 						reg = <6>;
+
 						mdss0_intf6_out: endpoint {
 							remote-endpoint = <&mdss0_dp2_in>;
 						};
@@ -4791,6 +4812,189 @@ opp-810000000 {
 				};
 			};
 
+			mdss0_dsi0: dsi@ae94000 {
+				compatible = "qcom,sc8280xp-dsi-ctrl",
+					     "qcom,sa8775p-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0 0x0ae94000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <4>;
+
+				clocks = <&dispcc0 DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc0 DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc0 DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_MMCX>;
+
+				refgen-supply = <&refgen>;
+
+				phys = <&mdss0_dsi0_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss0_dsi0_in: endpoint {
+							remote-endpoint = <&mdss0_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss0_dsi0_out: endpoint {
+						};
+					};
+				};
+
+				dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss0_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,sc8280xp-dsi-phy-5nm"
+					     "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0 0x0ae94400 0 0x200>,
+				      <0 0x0ae94600 0 0x280>,
+				      <0 0x0ae94900 0 0x280>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			mdss0_dsi1: dsi@ae96000 {
+				compatible = "qcom,sc8280xp-dsi-ctrl",
+					     "qcom,sa8775p-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0 0x0ae96000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <5>;
+
+				clocks = <&dispcc0 DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc0 DISP_CC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc0 DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_MMCX>;
+
+				refgen-supply = <&refgen>;
+
+				phys = <&mdss0_dsi1_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss0_dsi1_in: endpoint {
+							remote-endpoint = <&mdss0_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss0_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss0_dsi1_phy: phy@ae96400 {
+				compatible = "qcom,sc8280xp-dsi-phy-5nm"
+					     "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0 0x0ae96400 0 0x200>,
+				      <0 0x0ae96600 0 0x280>,
+				      <0 0x0ae96900 0 0x280>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
 			mdss0_dp1: displayport-controller@ae98000 {
 				compatible = "qcom,sc8280xp-dp";
 				reg = <0 0xae98000 0 0x200>,
@@ -5080,10 +5284,10 @@ dispcc0: clock-controller@af00000 {
 				 <&mdss0_dp2_phy 1>,
 				 <&mdss0_dp3_phy 0>,
 				 <&mdss0_dp3_phy 1>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>;
+				 <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
 			power-domains = <&rpmhpd SC8280XP_MMCX>;
 
 			#clock-cells = <1>;
@@ -6011,13 +6215,31 @@ ports {
 
 					port@0 {
 						reg = <0>;
+
 						mdss1_intf0_out: endpoint {
 							remote-endpoint = <&mdss1_dp0_in>;
 						};
 					};
 
+					port@1 {
+						reg = <1>;
+
+						mdss1_intf1_out: endpoint {
+							remote-endpoint = <&mdss1_dsi0_in>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						mdss1_intf2_out: endpoint {
+							remote-endpoint = <&mdss1_dsi1_in>;
+						};
+					};
+
 					port@4 {
 						reg = <4>;
+
 						mdss1_intf4_out: endpoint {
 							remote-endpoint = <&mdss1_dp1_in>;
 						};
@@ -6025,6 +6247,7 @@ mdss1_intf4_out: endpoint {
 
 					port@5 {
 						reg = <5>;
+
 						mdss1_intf5_out: endpoint {
 							remote-endpoint = <&mdss1_dp3_in>;
 						};
@@ -6032,6 +6255,7 @@ mdss1_intf5_out: endpoint {
 
 					port@6 {
 						reg = <6>;
+
 						mdss1_intf6_out: endpoint {
 							remote-endpoint = <&mdss1_dp2_in>;
 						};
@@ -6147,6 +6371,170 @@ opp-810000000 {
 				};
 			};
 
+			mdss1_dsi0: dsi@22094000 {
+				compatible = "qcom,sc8280xp-dsi-ctrl",
+					     "qcom,sa8775p-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0 0x22094000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <4>;
+
+				clocks = <&dispcc1 DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc1 DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc1 DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss1_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_MMCX>;
+
+				refgen-supply = <&refgen>;
+
+				phys = <&mdss1_dsi0_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss1_dsi0_in: endpoint {
+							remote-endpoint = <&mdss1_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss1_dsi0_phy: phy@22094400 {
+				compatible = "qcom,sc8280xp-dsi-phy-5nm"
+					     "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0 0x22094400 0 0x200>,
+				      <0 0x22094600 0 0x280>,
+				      <0 0x22094900 0 0x280>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			mdss1_dsi1: dsi@22096000 {
+				compatible = "qcom,sc8280xp-dsi-ctrl",
+					     "qcom,sa8775p-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0 0x22096000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <5>;
+
+				clocks = <&dispcc1 DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc1 DISP_CC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc1 DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss1_dsi1_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SC8280XP_MMCX>;
+
+				refgen-supply = <&refgen>;
+
+				phys = <&mdss1_dsi1_phy>;
+				phy-names = "dsi";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss1_dsi1_in: endpoint {
+							remote-endpoint = <&mdss1_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss1_dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss1_dsi1_phy: phy@22096400 {
+				compatible = "qcom,sc8280xp-dsi-phy-5nm"
+					     "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0 0x22096400 0 0x200>,
+				      <0 0x22096600 0 0x280>,
+				      <0 0x22096900 0 0x280>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
 			mdss1_dp1: displayport-controller@22098000 {
 				compatible = "qcom,sc8280xp-dp";
 				reg = <0 0x22098000 0 0x200>,
@@ -6434,10 +6822,10 @@ dispcc1: clock-controller@22100000 {
 				 <&mdss1_dp2_phy 1>,
 				 <&mdss1_dp3_phy 0>,
 				 <&mdss1_dp3_phy 1>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>;
+				 <&mdss1_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss1_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss1_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss1_dsi1_phy DSI_PIXEL_PLL_CLK>;
 			power-domains = <&rpmhpd SC8280XP_MMCX>;
 
 			#clock-cells = <1>;
-- 
2.53.0


