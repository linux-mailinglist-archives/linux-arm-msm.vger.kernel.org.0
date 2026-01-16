Return-Path: <linux-arm-msm+bounces-89426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44048D330C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6858431BC280
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF2B39A7E3;
	Fri, 16 Jan 2026 14:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Au6OobVI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002583939AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768575059; cv=none; b=fm49pNTNf9y6MKB2dywpUHe/mHnAT6Z68HYG0ScXI7fpG9+iwHGgm6ce2/1EjRsYuw3qepmuykSW4M5C2jvH6IRc4yGJPwlDwr/AccoeMrfvy0QXQwtH1QJeqmjxVtptnFd39sEX9Yh1vdj6JBdHN1vNNTTayDvqW08uef/QO9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768575059; c=relaxed/simple;
	bh=+zpZu6bjdZvKTMbOLVjTFjC7p+2hajSt1lFZKg+qsKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gAOvNHDSUNikJaOF2T2uu30CuwZ5a/+cs1MbE/1qDIHF1wIdHPUIHlB3FxjTi+R+pahK8cutnoiteLfbQKdyAN04gPh/liHv8mC+c5xDCn6sThNmYR0+N0OrVBzUt4jk1CEE2DJeEcHLKaHXFnf2GZogBkvuYBjDNdRCuc/qzvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Au6OobVI; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b879d5c1526so135498666b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768575055; x=1769179855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRdWStIWzRh0nMLcrgJX9j72ICaNq2gbItnjEMospDQ=;
        b=Au6OobVIv/ws+D+Y9xNfpoqNghrcMbY24db5QiBxgUZ9Ae0taKpS8VKD9xphSoDaY9
         w3KccMRsDNPu1G4FijeyaptlJ7Eusnihz+lkSJ86Eph8ong3Cmy4GHF6JYR/F2Qgf7KT
         6oUgKsJh4koPmsuhaM62ab1Fiv2JFPk3gXPbVb4Xkp35GCtsJqvIiDiUBrN/c0IKehow
         hTXyoWaPYbjCixcaRDmjvGhzKC+jSIeapV7r06O98K0S8kw81mb7hd5D/8qYKOTEzU8f
         sLGHu+87c2szps7PLg53VP0uapcJ7aeGY6Ycn3Hlbt8TRUeJeb4ghGagNGMZAvrlYC1n
         wxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768575055; x=1769179855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NRdWStIWzRh0nMLcrgJX9j72ICaNq2gbItnjEMospDQ=;
        b=A5hqasZEY2r+8aggJp7P0VjLL9FQQEC19ZXvETKDFmDLmFu1Hc0RrEXHXAIVWx4e62
         WMzIey+beAtPyhwjhFOiPcZMkKs4RyXnzSzLV5wYGx4ThCsbMGk87ljrxBaYnWcC00Uy
         8n9jbwHM6AvD8t/4ZjYE19j1Lym+vmx+XQBWDVZg0A2vaDjVqLm+ssSuiwFW9CZDKrL/
         967rPqayD4GFYqVowrGNBZzzkAGePBrodHXwNv2q2C12dKS0V2N54NwIHnyzJcnXfbEm
         m/Lq0Wc0tQjreSdEOBAVsNrikGlnyDlAx/vuCqdzvm6nqB9WJ5hOIHO5hpWig3du1gK2
         wyig==
X-Forwarded-Encrypted: i=1; AJvYcCXCGT24tx3xHNaTiVnrlVPvyXh2zt42JcvFcPLStMi2AvsdFMQ/RcaVqUORIT03M7MpClxWVwj4ZxUVHtjs@vger.kernel.org
X-Gm-Message-State: AOJu0YxsYfFjAkOJ3i1FmxcGBl4KRlxzfiddm60RSX1SJafV4EttRkvR
	QAfJs5Q58UYXrkwugfgy3N5rYLRvB9thIvqODpih31WlBzt7/o4lNB57WqHnstVMe+hKUZCu0Mv
	95EqO
X-Gm-Gg: AY/fxX4Sj3ZL3RoaDO2Q4XUxEOyRUz/YSzdFzW32CEt7m7GoctcuAk6wdA0Owt+KzW/
	4bsHyJ7biYZBAwDNvTbiPFK2+ZOi+0UJVcM+YXOmXBz+OxoIKo1O1cuEgpYc+ZTPxQNuyDyugIl
	Ty/S2sxj1X2a4/g9ypaE3PEDwxSJPI05I+wllfQuElk0jEnkgZXxemEygDb3Ln4oWU/AWUEG87/
	fhcmrL+9pleZoMuqak4VNsIarSq2Q8/y/i8/Qe9uEmMQyu4CNiEMl9KQLMWvU3JR5SZNtotj5DS
	NPYqKMjlFI17vUs/OU0R8At/75rhOC4Ux6ehzahMF+T0L8ik2V2Fvc+/8HCtT79YaEu3G0Ke1KH
	YYrF9s20+WfUn7/kW6GBfFVPDnuLm/AEvIRilob+oKikODk47g58ztKpMelY6lFumYe3BVLX19e
	UNFUvTk50bYQT6DGchSQOYzTwacDGT2HPnpqqbRuX+SvKl4pZTB+aNLHjrY9xbGWCH
X-Received: by 2002:a17:907:1c1f:b0:b87:2abc:4a26 with SMTP id a640c23a62f3a-b87968e2de0mr245353566b.14.1768575054734;
        Fri, 16 Jan 2026 06:50:54 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cdab55sm2699427a12.10.2026.01.16.06.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 06:50:54 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 15:50:51 +0100
Subject: [PATCH 5/5] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-fp6-bt-wifi-v1-5-27b4fbb77e9c@fairphone.com>
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768575048; l=1617;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+zpZu6bjdZvKTMbOLVjTFjC7p+2hajSt1lFZKg+qsKU=;
 b=yLnNtWAdCAc9wPmimGKbGRUkqiPT3x0pVDreMUTno30IiB6BLzkET8WHyplhqPkv6/qvjbgva
 Ott1WGC+aPcCkO34lZRKnyPHl8ZSd8JFw/f1C/sfvAKNwm3xAzTxxFG
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure and enable the WiFi node, and add the required pinctrl to
provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.

Thanks to Alexander Koskovich for helping with the bringup, adding
the missing pinctrl to make the WPSS stop crashing.

Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index cbe1507b0aaa..75f2b3a3e572 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -232,7 +232,7 @@ wcn6750-pmu {
 
 		clocks = <&rpmhcc RPMH_RF_CLK1>;
 
-		pinctrl-0 = <&bluetooth_enable_default>;
+		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
 		pinctrl-names = "default";
 
 		regulators {
@@ -704,6 +704,17 @@ &pmiv0104_eusb2_repeater {
 	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
 };
 
+&pmk8550_gpios {
+	pmk8550_sleep_clk_default: sleep-clk-default-state {
+		pins = "gpio5";
+		function = "func1";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <0>;
+	};
+};
+
 &pmr735b_gpios {
 	s1j_enable_default: s1j-enable-default-state {
 		pins = "gpio1";
@@ -962,3 +973,9 @@ &usb_1_hsphy {
 
 	status = "okay";
 };
+
+&wifi {
+	qcom,calibration-variant = "Fairphone_Gen_6";
+
+	status = "okay";
+};

-- 
2.52.0


