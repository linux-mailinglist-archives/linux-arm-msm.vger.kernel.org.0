Return-Path: <linux-arm-msm+bounces-85933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC69CD0F05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 17:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7D90303ACAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 16:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2108834F485;
	Fri, 19 Dec 2025 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iR/HRyWy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7A33491C7
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162492; cv=none; b=Tdh8AmA70waPBF38QXg7+mLT7yqgrRUsXc6Q8Hr5iVxIFEtHBo36UwRMZ6FkkYldZPOfK4dLypkNFZXxbauHGcOY57RYozaObsKbIIJXc9yehm5rFyIgohr/9OCurkr1/vaSbaKbx3atnz33gSYPCiLzZU0Kwc74PZ1mSlu3pss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162492; c=relaxed/simple;
	bh=LbaF66ke8LZxZbzBSqWF+LbtIQHMEYFknVPL8JPpg/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NM+NFoyNrIqz8GQgLw0+7djz9/nKMzGdZdW6mobWPmhNQObhPsgGY20H86WV6DqwWO2p+5WXERfBa8TRiZlgmtn6HRb6IahEbmREAaAy6k2OxuV5s7cWTsDmm4tbkNCwfPdxAQfuKybjX/A4uzRj94fWo3zJzlBYJ+spiv+OUI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iR/HRyWy; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7636c96b9aso344473666b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 08:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766162484; x=1766767284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2Cw2KB1P5Y6mcnQJX0NULNND1p0iocVjya6HA4fgP4=;
        b=iR/HRyWytBvsluQHGs1uWbZEyhdPClEaoT+6qL2mpen5W8cwT16x/EKBTRCLrVnH/R
         0Z6KI0JJjxzMvtzUZwHXX1AeDtT1KNqo7y0d1xOIgrDqZJHGINyrqOIgnDYSj4u/UlRS
         Lge7gKT4q93y2b+mSRklybGNo0Y+HKvkm4IC3Yiz/aQVJj2cg31QsckiRTtA8QkgBhx8
         j+cDWpA0ECla214yE1h4uPUUzOfPsnfC63Fxy1xKDuo/FQKEm5qU65GG6IodRM/PkZEJ
         AsfCna+CZvjwRbTl5y6repf0fc1rj6pMbHEnSUgbknAj9WTOfDWljTcIOEf+uS3Y35PX
         6lNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766162484; x=1766767284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e2Cw2KB1P5Y6mcnQJX0NULNND1p0iocVjya6HA4fgP4=;
        b=XDgm27TIwHkDiWHmzs5Uiuaet14JV2xjTH7XpGate3HkQ0TZxorKjfWn3mjEsra41B
         dci15LiLaJNreFx6HPp1hJbMnHRLo0GpxqqkvRScpXLaq6LGnP/znle0JhhsBblP/yLp
         gkbQw0x0YN6EqcClGfb8WISdhIiDXAtKecPV6YgFB52IrOphSQSPATeHRiKSvXomNaQ+
         ujpJDacqSNqu8pZpqaLHnTxI3FH/uvTwkU6drEh1SzP7hUxh//xDjCuYNQ4o5w/iqO1L
         Bk+fOVyu1iQFrrCrb4YmmGyskljrWlESQCHu851g1BGz9+iDy8kf/beohc8dTKqu2xYB
         cPsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEZFPqgSpxVeXJdlrbbYnzs5twKIaG5D8X2ifkOyEVzYQ+kOY3bX4w9VNVBbUO5ps/T8tgpepuJM67o2vg@vger.kernel.org
X-Gm-Message-State: AOJu0YzALzLiZB6MnYFlhKCwDbrMHWcLZf624dhzEnwbxtefpjYyllqe
	diCrGnSVLIz4/2msrQ9pRrq0qqzILAcO+ql4M3bMJfcQ0whF845JMi1nGSPpzX5alopc6u6nI8/
	8ev0KQSDLtFfm
X-Gm-Gg: AY/fxX5TnXRjX+TMcFI2as2PmGi+yh6qtY9ErIBrv6nP2fABVvVz77vGP6y93rVngAj
	mHQqNUQTxEjahIv714qUVP0oJux1kqu5SOK65mLaAiT5oY9/bb1FlnE45BL/oUqscC1bvTDvaXU
	dv1HqLN+g3HqOrmoUtA1Iy1sVHDrOR3hibEpwPhRIAtAf8ketQfC0EdKfnwiHaU/Tabi1Yv93rd
	f6jEkUQxP7RZoZ2+dfokiOQSEwd0slsMwf9/OfmEVgLLFu6uEPNY3nyByYugAb4+Ok+AADV9JJy
	ggRgMEqlVnwyugaYGJ8cRDgJ7A6oiKGaxbMx4JQunBTQzZ1qon9hJ9rV6rVnc2i732aaIngmiK3
	DZPrcG1Oz2wcG+0fIkn293a2Nuf7GrYsds5jIkXC4BZ0kpnPySXJQo2lBPDpb2zUMSmuP1l0r17
	h0IKHr2aWO0RCzzObi+2MojIFV0NiaME8dR7XECqGfaSj9cTtbK4R230Vgerb5SWiepLcaoQGZc
	1fqQozrzU5xUTqIRZWmSuZAcABBScqsS0M=
X-Google-Smtp-Source: AGHT+IHcMyLakLOiabV0zgp9j2BbCuOpJ/ILNqwAtFawoKOVX3o7aGBaAA9adOk/BitF1e97wb/uow==
X-Received: by 2002:a17:907:6d23:b0:b7d:266a:7728 with SMTP id a640c23a62f3a-b80371f8f50mr342762466b.44.1766162483979;
        Fri, 19 Dec 2025 08:41:23 -0800 (PST)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:41:23 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:12 +0100
Subject: [PATCH RFC 6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable
 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-6-4537a916bdf9@fairphone.com>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=2578;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=LbaF66ke8LZxZbzBSqWF+LbtIQHMEYFknVPL8JPpg/I=;
 b=Rv0hSkSQEMyym7EIZ+cVRBj/6SP1f7dhM4pzbEWfaCF2YNFHzOP6VQw+YLffiycuav+hx1xjB
 GC1ASefj0LAB0zCj980vbPgQ3vI8SRE/lnefKNNv4uybbds++qyTiBv
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 71 ++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 92b40ab56c26..8cddab412581 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -612,11 +612,6 @@ eeprom@51 {
 	};
 };
 
-&dispcc {
-	/* Disable for now so simple-framebuffer continues working */
-	status = "disabled";
-};
-
 &gcc {
 	protected-clocks = <GCC_PCIE_1_AUX_CLK>, <GCC_PCIE_1_AUX_CLK_SRC>,
 			   <GCC_PCIE_1_CFG_AHB_CLK>, <GCC_PCIE_1_MSTR_AXI_CLK>,
@@ -725,6 +720,51 @@ &ipa {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "boe,bj631jhm-t71-d900";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vci-supply = <&vreg_l19b>;
+		vddio-supply = <&vreg_l9b>;
+		dvdd-supply = <&vreg_oled_dvdd_1p2>;
+		// avdd-supply = <&pmiv0104_oledb> (VREG_OLEDB): 5V-8V
+		// elvss-supply = <&pmiv0104_elvss> (VREG_ELVSS): -8V-0V
+		// elvdd-supply = <&pmiv0104_elvdd> (VREG_ELVDD - OLEDB): 0-8V
+
+		pinctrl-0 = <&disp_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
@@ -883,6 +923,20 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	ts_active: ts-irq-active-state {
 		pins = "gpio19";
 		function = "gpio";
@@ -910,6 +964,13 @@ pm8008_int_default: pm8008-int-default-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio129";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart5 {

-- 
2.52.0


