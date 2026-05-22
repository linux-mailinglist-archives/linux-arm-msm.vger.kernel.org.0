Return-Path: <linux-arm-msm+bounces-109351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDI/IlNuEGqgXAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:55:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9E55B6899
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA5D33057B6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 14:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE21407565;
	Fri, 22 May 2026 14:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="u5N5Oy57"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75322E7165
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 14:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461187; cv=none; b=SbKRgFUx9WBxmGGdXl7H3xnDZY5Lxq+biN4pLV4dVqxyRS0xlrWxmRoQKvpZbJ2llbBmTkz0G0Yg0hBEYUBkaPQorYBUEOcmaXNxDDZwOnJqwrc+VMf4ub+h2cav3k4Jwq1lqoFK9u+J1rs4dtdbncpKVMfHWLWYhI6ZNdDRFgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461187; c=relaxed/simple;
	bh=qoLnYPJqnHUVZXd8RXxjoQBFw/TAaSr7XQYY2BSu/bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Dmuir5+zdCzPXGQpxIAPoel/ppx8aHwJMUf3A6ilLJ8+vldPp1zGsRTQ/Fx2VLV4hBCI2LhsKwmAKC86bvHmJwW5sYs4TubXK1FhO+dY6PWe+GGbNqLCRaSlyjGZ6iNGAN6Yii4GckankFLnkiSbjXEHg9BlR7vwsNpoFOb3bqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=u5N5Oy57; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b936331786dso951714366b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779461183; x=1780065983; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VGAwIuoj5JvRKNrPuvWOwKjLuq0UQO0ceZvzFpGZvlY=;
        b=u5N5Oy57vwLrbKJSnZYz/7tQLXSkpkjZaNJHbwoJWSoU0REFryn84yyhKsSVvaoFZQ
         STJ8CCGVrzHlR6U9kyp6Y1f/SVnMYC5IiM52uk3RcjV5WV8uLnruNrDZjgjr4rW+lSfh
         9whWfB4DBE7D7mCMB3y6UMw6m1K71rAhdc1gvWp+MYdG+33Z+vqy+K2i3Lo9h8mHbeCn
         9wBqyMsyYSbwhUH2rvksmLnUNIWFwoXsHeJTJVon+aSN0iRmQix3I227dGlWtXHhKcuZ
         fNpu9KCBNfCGM3R2dUPfRciD8bz4PSkrxVrkOODy26IK7CreK/TJYNbuOYcFXDSrjd8Y
         Pu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779461183; x=1780065983;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGAwIuoj5JvRKNrPuvWOwKjLuq0UQO0ceZvzFpGZvlY=;
        b=ZEKeZc0t+jy6GBTChIxjsaqKB3GKxzFSLkeSKpKQ2ouzGu4qgmI92bfDVvoWFTrF3q
         JHMLbaLojEMJP+OqyEaYkVmSrLxcMOAevy3QKby8a0Gad+eh0Q01I+JB/7KszhJZr5nJ
         OZF35W45LVBiPoUMdtJAbJlgg5guk7lc33n5w9Zr1IcEV2wvZOJygZ6pnLwWjXBxNEJO
         4du6VL/buj+H6JGKUy26Bfb/dkHeUx5yOQMjxb81mdlxMLO7K0C9flIirXnMzhgb2KXE
         ojiLObqUAm5d4GJKtt7LkYpTSoXHE5kyOfxOgMVDs2jzFj8KwRBC1spmkJU/VrthFX58
         Uo8g==
X-Forwarded-Encrypted: i=1; AFNElJ/TucVRMzYpYCkjHExcpq22AKe4yAsbHTIyZ65XM0kV4QGovIM3uXqWRq/MYXFxGDNDU0XAWDPA6W3lKODK@vger.kernel.org
X-Gm-Message-State: AOJu0YzK6vZj4rdn/VsdrYBsL+RHJk0mmVcPP9NKTifUEmWVWrk3V88K
	VlzNidquIiCbdGHDDYhahSuIC6ETM+ELq5pDu+rRfb1euryUuC7DMnM91f+aZ4U+s+g=
X-Gm-Gg: Acq92OFPdBBOl/6dz8e//ktwKlf7w5KZPa6CCanhBbr7Hma6vSwKeGeObEugAXTK8im
	6a+TIyhEwxTEeyUax/hpTYJ9er5s+U+aavCXMM5kKz3CFX2A+u7eu/8bMYrte6P6K1D+ddypTlG
	OHyvr5RsmL1N5eVgfh7Fnn++FPI3Bt4te2P8y9332OHfOeQGeecneqr3bABwtF3RCuIfERECCXd
	u3QAZKGTfQ3HKTEIMrlTHyQUAyjtkSia+toGfKwrXXaYNbypWNwQrZ43dQ7YpTAk9VFyNF8zmom
	MmaPTdivPt3meETLBmN94ACKAEqAspR7iKhfMCtG27s0CfeWitOHKXZNtUWSHxaPfJD9ndz6GAf
	oM6VuIBsgxVw/Q5gMllLbTVygY1mxHSQvgzL8teWEHYszaVvXn5uRCFXWET1eiRzyyzn9Y9boBp
	cae8e0Sxt7L9xzKScfGPzKdj/sDQMUJmYSexM8ineuXoUt6Q5W0pEcyOdW9IjDedjjeE8CiRlq5
	UweaA==
X-Received: by 2002:a17:906:8f15:b0:bd5:7a3:a58c with SMTP id a640c23a62f3a-bdd269b72cfmr257887466b.47.1779461182976;
        Fri, 22 May 2026 07:46:22 -0700 (PDT)
Received: from [172.16.240.102] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc69d78cbsm59587966b.61.2026.05.22.07.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:46:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 22 May 2026 16:46:21 +0200
Subject: [PATCH] arm64: dts: qcom: kodiak: Elite-ify LPASS macros
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7SS0WmK4imFRylRHbCttMSSEu
 1uF5Uvef3+FRJEpQVutEOnDiYMvIE4VmIf2d0IeCoOsZVMrKXEMA+sR6cWZ0GkTQ0J7IWXEVdn
 mrKEs35EsL//qrds5zf2TTP6lDiPSNJe7vGvQ60RognOc28rTkvG4FNBt2xfuMR2RqAAAAA==
X-Change-ID: 20260522-kodiak-elite-macros-f4e5c185f63a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779461182; l=7874;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=qoLnYPJqnHUVZXd8RXxjoQBFw/TAaSr7XQYY2BSu/bg=;
 b=PT+PSVJMoAsWcJ+Xu1Fo5SeW2/jOSsYSVBnybUQY5mI7iluYfbTQ+Wxm06Aa0WE/C81xvnmeZ
 3WiGYInMz3FDYgJu7b0NR3KIH7QW2DsmYctgMHHvJh9vyR/lUhOnc/m
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109351-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.49.112.64:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.51.108.16:email,fairphone.com:email,fairphone.com:mid,fairphone.com:dkim,0.49.34.32:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.48.212.0:email]
X-Rspamd-Queue-Id: 2A9E55B6899
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Due to initial kodiak/sc7280 bringup being done for Chrome platforms,
some Chrome-specific bits still remain in kodiak.dtsi, like the clocks
and power-domains for the LPASS RX/TX/WSA/VA macros.

Move them to sc7280-chrome-common.dtsi and put Elite (q6afecc)
equivalents in its place. The qcs6490-audioreach.dtsi file can also drop
deletion of power-domains properties then.

This follows previous commits moving Chrome-specific configuration to
the correct file, leaving kodiak.dtsi for Elite and
qcs6490-audioreach.dtsi for AudioReach.

No functional change intended. The clock-output-names property will now
exist for both Chrome and AudioReach devices but this shouldn't have any
relevant effect. And WSA macro clocks weren't added to Chrome because I
don't believe this would've ever worked given it already referenced
q6afecc and the nodes were originally added during AudioReach bringup.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 48 +++++++++++++---------
 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi   |  6 ---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 38 +++++++++++++++++
 3 files changed, 67 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c51beada8c7d..bdfa6cd47a4a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2681,14 +2681,18 @@ lpass_rx_macro: codec@3200000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&lpass_rx_swr_clk>, <&lpass_rx_swr_data>;
 
-			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
-				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&lpass_va_macro>;
-			clock-names = "mclk", "npl", "fsgen";
+			clock-names = "mclk",
+				      "npl",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
 
-			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
-					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
-			power-domain-names = "macro", "dcodec";
+			clock-output-names = "mclk";
 
 			#clock-cells = <0>;
 			#sound-dai-cells = <1>;
@@ -2734,14 +2738,18 @@ lpass_tx_macro: codec@3220000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&lpass_tx_swr_clk>, <&lpass_tx_swr_data>;
 
-			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
-				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&lpass_va_macro>;
-			clock-names = "mclk", "npl", "fsgen";
+			clock-names = "mclk",
+				      "npl",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
 
-			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
-					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
-			power-domain-names = "macro", "dcodec";
+			clock-output-names = "mclk";
 
 			#clock-cells = <0>;
 			#sound-dai-cells = <1>;
@@ -2785,8 +2793,8 @@ lpass_wsa_macro: codec@3240000 {
 			compatible = "qcom,sc7280-lpass-wsa-macro";
 			reg = <0x0 0x03240000 0x0 0x1000>;
 
-			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
-				 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 				 <&lpass_va_macro>;
@@ -2858,12 +2866,14 @@ lpass_va_macro: codec@3370000 {
 			compatible = "qcom,sc7280-lpass-va-macro";
 			reg = <0 0x03370000 0 0x1000>;
 
-			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>;
-			clock-names = "mclk";
+			clocks = <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec";
 
-			power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
-					<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
-			power-domain-names = "macro", "dcodec";
+			clock-output-names = "fsgen";
 
 			#clock-cells = <0>;
 			#sound-dai-cells = <1>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
index c1867711298b..037a5f6c030a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
@@ -11,8 +11,6 @@
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 &lpass_rx_macro {
-	/delete-property/ power-domains;
-	/delete-property/ power-domain-names;
 	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
@@ -33,8 +31,6 @@ &lpass_tlmm {
 };
 
 &lpass_tx_macro {
-	/delete-property/ power-domains;
-	/delete-property/ power-domain-names;
 	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
@@ -48,8 +44,6 @@ &lpass_tx_macro {
 };
 
 &lpass_va_macro {
-	/delete-property/ power-domains;
-	/delete-property/ power-domain-names;
 	clocks = <&q6prmcc LPASS_CLK_ID_VA_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 		 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
 		 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index debf62baec9b..5b25501484fa 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -67,11 +67,49 @@ &lpass_hm {
 	status = "okay";
 };
 
+&lpass_rx_macro {
+	power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+
+	clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
+		 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk",
+		      "npl",
+		      "fsgen";
+};
+
 &lpass_tlmm {
 	/delete-property/ clocks;
 	/delete-property/ clock-names;
 };
 
+&lpass_tx_macro {
+	clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
+		 <&lpass_aon LPASS_AON_CC_TX_MCLK_2X_CLK>,
+		 <&lpass_va_macro>;
+	clock-names = "mclk",
+		      "npl",
+		      "fsgen";
+
+	power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+};
+
+&lpass_va_macro {
+	clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>;
+	clock-names = "mclk";
+
+	power-domains = <&lpass_hm LPASS_CORE_CC_LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+};
+
 &lpasscc {
 	status = "okay";
 };

---
base-commit: 1e45adb287ae5d431afc9900b4d387f4e73d9406
change-id: 20260522-kodiak-elite-macros-f4e5c185f63a

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


