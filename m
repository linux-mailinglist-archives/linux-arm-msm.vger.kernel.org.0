Return-Path: <linux-arm-msm+bounces-53203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E81DA7B918
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 10:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04E6F3B64DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 08:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B049819D07B;
	Fri,  4 Apr 2025 08:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RZz9MmEM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A5819CCF5
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756149; cv=none; b=MvviMZZ30JSMDaWUhRWx+tp84nn3mxAs4zZV1/W6NHngHBi8IN6yjPrkZI9iVH/ABblsxGG8WHpwl0TwjVgwrGBGrg3ov37SGZNr8bp7xrJRDW3pxXuL0xV8dEq947GX4VGvxjs1ucPZn7t5KKko8TwFzPBw/1UPDUPb4KBgO54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756149; c=relaxed/simple;
	bh=MS7WaIMkq20DORNXyXmGMCpiPauFYp4ukxiNJ1OFdIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Pei4+AarmbNVUkxHYrYqvAvNgJ/fWPTXbXQFRWtYYZxJHNoDOWO1oiwRlWdRRkSXPrQW2FQosaxlkKj9kX2vBehUTco3MSB6ygG0NIj2IBZ9rJ2mbVAtAXuQbv4ZehFTKTBfr/MczQXahc2TaY9+4AzdQbaVkKz1dkEznQFAyWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RZz9MmEM; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so2382534a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 01:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1743756146; x=1744360946; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EvpxFOAMjGbDEHBzr8d3BstbBwgEQIKMSe6Zjgd2RsE=;
        b=RZz9MmEMnTgfc4/W7G43u7gvKWnEbMjqTmmHJJxQOj//rWl/peRlGenjLYOwZP8fjb
         090TUTc3c0Hgr9k+jINC6jPeNgYJTfwVTkpw3HmJ9EvnjtGPpU0NHHkMJElch1QrMBEU
         HmXIx2r2Sh+yeMmm5dgfGDZujDmCeM4BPZ3bQz0YOPPl4MStkoTaixub/0dXLVz8Srq2
         qk3YoBI3wCaD2zau50uc6G65wLG9pvLZaIA55TLGfv9gOOimz9M5ikcA+47t0mI04ppb
         /igZ8hBxIKdjOHsRNYU9LropLM4HUO+gcVteXMeGVea/BKTbuOtU9xSwiDraPKzyu0Y8
         bwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743756146; x=1744360946;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvpxFOAMjGbDEHBzr8d3BstbBwgEQIKMSe6Zjgd2RsE=;
        b=rizlZyCuxqGyD0Kv/OTkXYvkwuR7A4VYpcoG2lusmwD6XAar19IlDhPe59e02vUBBp
         UWBla8iAP9XzkyZ0qyC0bKtViVSrdePP5JqN+TUPwvAZn3/YOmzN9D60GEBPHqEvUdGR
         R1HRxE9guhCCv0A3wRl7S+hkA9peluibZiXzN2WqhRApzgmaxfLjC5k2thTHABEwP2cM
         QAofN+cUugP01lgKikbZzDkF44AKtEtuNIgqap3DhkyZloTpD0qcgRINLBvw6SK9tAV2
         luIyTgCbuAnE0V9xM4Dt1pWNWDELZ8KaY8rwe1WeiI5WaPhtFuVsaOBxlTu0TdmkVU2v
         HaVg==
X-Forwarded-Encrypted: i=1; AJvYcCWHOwoLMt/lm3C/mRUYf3jYLvlpPSKWHdQlZ8dCTut0YD90T8ZRiteUYJHhy5Pd5nXQSQHMW8C3UEvl3G0s@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvc6mDOn72SCSEJZl581n8bOF/LWtFJzJ7PjOzu4tuamHiWEtZ
	WnYXqmNjc6a/tuX9WMTlBS52jo0emsXE0eUGCbCIPvwwNfinf65oRDUCDe2P04A=
X-Gm-Gg: ASbGncstQrQ/7q5wVy+a+40tnXmhV2emhVD8zoyLtYYnxfmTUuBZ1nE0pj050OGz0Jb
	h0mvSd+QFcJH1sSZE6NOzVspJDLPcZhZ3YW6o2KWOxMRPD3rQ/GYwlWAhrIlhAAQL10sLsKEVl+
	1H/LdJ68Ii/Mja6qeMrc4e50eBJBOq77ThGRw6xJSTheAGY+wXBqanfaDNwrT1e6ZqqANnqxIhG
	LN3E7RQPrjQvLNhCmAqnT0KPP6NB5TGDBAArVM5vkiGXZHE13MKBH4Gouk0wU0gAyWsQVuDoarJ
	2SIqRVqP+DmYNeBI45JanbGAu4gz91pUkAWnR9DyUF6cahmQY9rnR3081t1dggjVQxFXY32kuMM
	Z8IF2ZtRdmQhg6Eo7sB90nw==
X-Google-Smtp-Source: AGHT+IHEpr1vauJBb+ztZ4BIYo4Rg69oVqKkkjWVKPc8XrGwoUcb7kFowBPp4QCiSvew91CEsHvqag==
X-Received: by 2002:a17:907:3d9f:b0:ac2:cae8:e153 with SMTP id a640c23a62f3a-ac7d6c9fa0emr181343366b.4.1743756145955;
        Fri, 04 Apr 2025 01:42:25 -0700 (PDT)
Received: from [172.16.240.58] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0185e15sm217465566b.132.2025.04.04.01.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:42:25 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 04 Apr 2025 10:42:22 +0200
Subject: [PATCH] arm64: dts: qcom: sc7280: Stop setting dmic01 pinctrl for
 va-macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-sc7280-va-dmic01-v1-1-2862ddd20c48@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAG2b72cC/x3MQQ5AMBBA0as0szbJtIpyFbGgBrNQ0iYiEXfXW
 L7F/w8kjsIJOvVA5EuSHCFDFwr8NoaVUeZsMGQqsmQx+cY4wmvEeRdPGuuprdlpcqX1kLMz8iL
 3v+yH9/0AtWv9t2IAAAA=
X-Change-ID: 20250404-sc7280-va-dmic01-6b96e810834c
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

There's devices that don't have a DMIC connected to va-macro, so stop
setting the pinctrl in sc7280.dtsi, but move it to the devices that
actually are using it.

No change in functionality is expected, just some boards with disabled
va-macro are losing the pinctrl (herobrine-r1, villager-r0, zombie*).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi     | 3 +++
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi                         | 2 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi                             | 3 ---
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi
index a90c70b1b73ea042af3c5509dccc60844f599acc..0e07429982bd69a5f2455d5fcb7bb03bdeb32fab 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi
@@ -139,6 +139,7 @@ &lpass_va_macro {
 	vdd-micb-supply = <&pp1800_l2c>;
 	pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>, <&lpass_dmic23_clk>,
 			<&lpass_dmic23_data>;
+	pinctrl-names = "default";
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
index 020ef666e35fc676fcc4e4ae8aa65e5ba4f42d98..ce48e4cda1708798f40e792620de96034f093472 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
@@ -141,6 +141,9 @@ &lpass_tx_macro {
 };
 
 &lpass_va_macro {
+	pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 7370aa0dbf0e3f9e7a3e38c3f00686e1d3dcbc9f..90e5b9ab5b847edc447111825999f73f6453b33a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -412,6 +412,8 @@ &lpass_tx_macro {
 &lpass_va_macro {
 	status = "okay";
 	vdd-micb-supply = <&vreg_bob>;
+	pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>;
+	pinctrl-names = "default";
 };
 
 &pcie1 {
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index ec96c917b56b4a077b45ac0186da6aaedb899dbe..7fba3c6e2b04f18295b7c63dcb83978b2c6049ca 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2617,9 +2617,6 @@ lpass_va_macro: codec@3370000 {
 			compatible = "qcom,sc7280-lpass-va-macro";
 			reg = <0 0x03370000 0 0x1000>;
 
-			pinctrl-names = "default";
-			pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>;
-
 			clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>;
 			clock-names = "mclk";
 

---
base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
change-id: 20250404-sc7280-va-dmic01-6b96e810834c

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


