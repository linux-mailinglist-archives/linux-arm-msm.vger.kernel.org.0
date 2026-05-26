Return-Path: <linux-arm-msm+bounces-109886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGcDLlm/FWrYZgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:42:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 998AD5D8F1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CEBE302F1B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5315B32D0FC;
	Tue, 26 May 2026 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hBPwvYY2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64BC315D29
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809412; cv=none; b=VPp4aBX2p8xMmb/DRT4kvEUCeFbHRAVAdM73QDSNX2pmRNTe1nnouVh+M/bkHBexw+ivs0EuSbaia7+Lq3HbuwL4KAqOUclMYCHbLpto9vAnFefIBY8EB+fKFRD3lwTYwwqha2/QjHLXSo7Hxb0d07KUcQlShA+cXf80+2kvpUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809412; c=relaxed/simple;
	bh=iGTwHgBHeLX3ILgd04nNErc/W++Eogoek/IlmiG7e0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oif7XmEtiuvVEk1hUih0fcYrv4eHw8sYieOJXTFnkj4LznoCOTTsOeEFewTDW/RLmsyDm6nZc4Gw0ME7WLGoowVokbk7vh9JJM809AApxorOzeKSzr7FbvcoX3s7APqXpq2ukUGw+Xosse3privX6V1gXjNZFgXxiORsC818FhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hBPwvYY2; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d75312379so9085995f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779809405; x=1780414205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhkmSXGNrf6eecWgP6NaxELfI3WHj96xq4ue7rXgP0U=;
        b=hBPwvYY21w+3Kqj6/ns1M1Bz8PM2RUgx7L7AYPv27bqP5n1nxUYeYDr/GMP0QRLbAf
         /oB1excYIvSTwEFzycoE7gZ+uLZGSXkkxOhGEWlr1sj4evau5S/eoRUD15kXeLsmIAVQ
         /zThqbCBEgDtQOOFf+0AgUdzbNQ32pqguAi9De/6KVbLz/smPVETiEc7DbZznDd00EJX
         VPxfgWpQcrYI5ge9K5t+GMt/vKxS9x1UcJk4kvJYgQ9PanShUFU5df5yH6XHRRj6/U/g
         qjYJstEgM/HgP8W2BsiQrssQM7ptx9sdbLoeNbr8gFV5tMLf35TlMgkSwFl0ZwmFqjeE
         JbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779809405; x=1780414205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vhkmSXGNrf6eecWgP6NaxELfI3WHj96xq4ue7rXgP0U=;
        b=E03+MQDWJtKnlspL3Ye0SxrcGFF5pnapld1i3EYYnB4lfZTnbxCwrOTe0anUET251y
         ojMVA2fBEEk3Xdhcn0o4gx9Y4cLXloypOhtbnspFxf+9NuGc68ig4cHkRGopzx0LdKPN
         cCWpbCfqDsszqL0B7zNEBevtjqyLOvkv/KCX+KCVRWnqZ7877LHoX0cI1HjIzPDve30G
         0Uwq1jX/juNQLdEZMlIMZ7u+u/2aa1SC+i9A0RLVR2xz+0o1QKQmlIsvDtNQLGlBs3uf
         qATx5e5G5KBv8+KAmo9iXs9MOxiTmH9Ok4ylei/+cfbKpDULfWQuSOOieEminqHMGxkj
         n9Qw==
X-Forwarded-Encrypted: i=1; AFNElJ+Munv8gZzj8U8wCRyQpiVMlfTePpeepIx1B+0n80Ec6PDMZSfK+zh/azf6cpaueen8MFfOiinIz2E2pGmE@vger.kernel.org
X-Gm-Message-State: AOJu0YwdHHwFibdvhfsMgMMHB7+SljmqOtEQ/NQ9pQtoFMRqJU8Q8p06
	rSdEnm2MAoAObjPU7kjub9B5/AYhWg/VcVdVPYuhyaNey/7FwJDsYI/pi+FMDpFO8v0=
X-Gm-Gg: Acq92OElgG2CxaTkQsHUVm8byvvSu8lRJL3Ub3OCdQ2TopG6KA8SBmyx9ZOvHKsiyE4
	hDa084/cH7wjKjzSI4nf4raV7C5/qrSnHcdxj+9n3ElFNILbbU//y2EvjsgrpPbTreWtalzcqOT
	gtpmPPBZkxWNWhTV/fBuGVwCksbs0Acpa4j5mhXNCAWoEH8x5jjF48DzDIt0ov8XdlDCqczFfM1
	m2GqdLFPEEvA2z6faTEeOX99ZZ3CvZLOxIg0DWSBmtb/Ji5fgT96XcgZbbStJ75uLkCfIGL7ZFf
	xusyCudCMOUNGUYj+bnYM6q/1LJgpXAKM86RCj+D3ejY5Ym9GXhPMd64W8GdOATVejRawFhYkeY
	QMr+Dw9kVLvZHFrMO82ZawJ7LcmG1tAgUxRiDyqxwkgT4aiX5kdNPnVIAltHmlbITCSYpRyzHnT
	iFkLAqeKEMfs8jnsQymU3QIJyurZpBuZhV
X-Received: by 2002:a05:6000:25c8:b0:45e:b9b4:c68d with SMTP id ffacd0b85a97d-45eb9b4c854mr27242005f8f.4.1779809404418;
        Tue, 26 May 2026 08:30:04 -0700 (PDT)
Received: from [10.107.1.102] ([212.133.41.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5caeesm37691140f8f.29.2026.05.26.08.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:30:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 26 May 2026 17:29:55 +0200
Subject: [PATCH RFC 2/2] arm64: dts: qcom: kodiak: Fix up LPASS TX macro
 v9.4 control names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-sc7280-tx-macro-v1-2-1aad6900fec0@fairphone.com>
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
In-Reply-To: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779809398; l=6900;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=iGTwHgBHeLX3ILgd04nNErc/W++Eogoek/IlmiG7e0g=;
 b=opyYbtZw6SUYmPrNcW3j6K1y7j4lAENYIJUfh4vzihODYxclG05oeO/6oBQLoTDqVlE9HaKJ9
 IcoBrff4BUpBMVnr8RGjImnxyVwIin1ve76FvwVv21237CSdGbl8J7L
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109886-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:mid,fairphone.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 998AD5D8F1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

After fixing to the lpass-tx-macro driver to use the correct v9.4
configuration, some control names have changed and therefore need to be
updated.

* "TX SWR_ADC" 0-3 becomes "TX SWR_INPUT" 0-3
* "TX SWR_DMIC" 0-7 becomes "TX SWR_INPUT" 4-11

Update all usages in dts.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  2 +-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  2 +-
 arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts         | 22 +++++++++++-----------
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   | 22 +++++++++++-----------
 .../dts/qcom/sc7280-herobrine-villager-r1.dtsi     | 22 +++++++++++-----------
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 22 +++++++++++-----------
 6 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..565f7db91e77 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -860,7 +860,7 @@ &sound {
 			"TX DMIC0", "MIC BIAS1",
 			"TX DMIC1", "MIC BIAS2",
 			"TX DMIC2", "MIC BIAS3",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
 			"VA DMIC0", "VA MIC BIAS3",
 			"VA DMIC1", "VA MIC BIAS3",
 			"VA DMIC2", "VA MIC BIAS1",
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..a36bd6120ea2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -736,7 +736,7 @@ &sound {
 	audio-routing = "IN1_HPHL", "HPHL_OUT",
 			"IN2_HPHR", "HPHR_OUT",
 			"AMIC2", "MIC BIAS2",
-			"TX SWR_ADC1", "ADC2_OUTPUT";
+			"TX SWR_INPUT1", "ADC2_OUTPUT";
 
 	wcd-playback-dai-link {
 		link-name = "WCD Playback";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts b/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
index c2cba9d7179b..ffe028bd0c72 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts
@@ -101,17 +101,17 @@ &sound {
 		"VA DMIC1", "MIC BIAS1",
 		"VA DMIC2", "MIC BIAS3",
 		"VA DMIC3", "MIC BIAS3",
-		"TX SWR_ADC0", "ADC1_OUTPUT",
-		"TX SWR_ADC1", "ADC2_OUTPUT",
-		"TX SWR_ADC2", "ADC3_OUTPUT",
-		"TX SWR_DMIC0", "DMIC1_OUTPUT",
-		"TX SWR_DMIC1", "DMIC2_OUTPUT",
-		"TX SWR_DMIC2", "DMIC3_OUTPUT",
-		"TX SWR_DMIC3", "DMIC4_OUTPUT",
-		"TX SWR_DMIC4", "DMIC5_OUTPUT",
-		"TX SWR_DMIC5", "DMIC6_OUTPUT",
-		"TX SWR_DMIC6", "DMIC7_OUTPUT",
-		"TX SWR_DMIC7", "DMIC8_OUTPUT";
+		"TX SWR_INPUT0", "ADC1_OUTPUT",
+		"TX SWR_INPUT1", "ADC2_OUTPUT",
+		"TX SWR_INPUT2", "ADC3_OUTPUT",
+		"TX SWR_INPUT4", "DMIC1_OUTPUT",
+		"TX SWR_INPUT5", "DMIC2_OUTPUT",
+		"TX SWR_INPUT6", "DMIC3_OUTPUT",
+		"TX SWR_INPUT7", "DMIC4_OUTPUT",
+		"TX SWR_INPUT8", "DMIC5_OUTPUT",
+		"TX SWR_INPUT9", "DMIC6_OUTPUT",
+		"TX SWR_INPUT10", "DMIC7_OUTPUT",
+		"TX SWR_INPUT11", "DMIC8_OUTPUT";
 };
 
 &wcd9385 {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
index ce48e4cda170..bc492346f7dc 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi
@@ -20,17 +20,17 @@ sound: sound {
 			"VA DMIC1", "MIC BIAS1",
 			"VA DMIC2", "MIC BIAS3",
 			"VA DMIC3", "MIC BIAS3",
-			"TX SWR_ADC0", "ADC1_OUTPUT",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
-			"TX SWR_ADC2", "ADC3_OUTPUT",
-			"TX SWR_DMIC0", "DMIC1_OUTPUT",
-			"TX SWR_DMIC1", "DMIC2_OUTPUT",
-			"TX SWR_DMIC2", "DMIC3_OUTPUT",
-			"TX SWR_DMIC3", "DMIC4_OUTPUT",
-			"TX SWR_DMIC4", "DMIC5_OUTPUT",
-			"TX SWR_DMIC5", "DMIC6_OUTPUT",
-			"TX SWR_DMIC6", "DMIC7_OUTPUT",
-			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+			"TX SWR_INPUT0", "ADC1_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
+			"TX SWR_INPUT2", "ADC3_OUTPUT",
+			"TX SWR_INPUT4", "DMIC1_OUTPUT",
+			"TX SWR_INPUT5", "DMIC2_OUTPUT",
+			"TX SWR_INPUT6", "DMIC3_OUTPUT",
+			"TX SWR_INPUT7", "DMIC4_OUTPUT",
+			"TX SWR_INPUT8", "DMIC5_OUTPUT",
+			"TX SWR_INPUT9", "DMIC6_OUTPUT",
+			"TX SWR_INPUT10", "DMIC7_OUTPUT",
+			"TX SWR_INPUT11", "DMIC8_OUTPUT";
 
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi
index b25df5a99161..c6606b1eb71c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi
@@ -23,15 +23,15 @@ &sound {
 			"VA DMIC1", "vdd-micb",
 			"VA DMIC2", "vdd-micb",
 			"VA DMIC3", "vdd-micb",
-			"TX SWR_ADC0", "ADC1_OUTPUT",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
-			"TX SWR_ADC2", "ADC3_OUTPUT",
-			"TX SWR_DMIC0", "DMIC1_OUTPUT",
-			"TX SWR_DMIC1", "DMIC2_OUTPUT",
-			"TX SWR_DMIC2", "DMIC3_OUTPUT",
-			"TX SWR_DMIC3", "DMIC4_OUTPUT",
-			"TX SWR_DMIC4", "DMIC5_OUTPUT",
-			"TX SWR_DMIC5", "DMIC6_OUTPUT",
-			"TX SWR_DMIC6", "DMIC7_OUTPUT",
-			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+			"TX SWR_INPUT0", "ADC1_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
+			"TX SWR_INPUT2", "ADC3_OUTPUT",
+			"TX SWR_INPUT4", "DMIC1_OUTPUT",
+			"TX SWR_INPUT5", "DMIC2_OUTPUT",
+			"TX SWR_INPUT6", "DMIC3_OUTPUT",
+			"TX SWR_INPUT7", "DMIC4_OUTPUT",
+			"TX SWR_INPUT8", "DMIC5_OUTPUT",
+			"TX SWR_INPUT9", "DMIC6_OUTPUT",
+			"TX SWR_INPUT10", "DMIC7_OUTPUT",
+			"TX SWR_INPUT11", "DMIC8_OUTPUT";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 8cac4ce9c851..e54379147d2b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -101,17 +101,17 @@ sound: sound {
 			"VA DMIC1", "MIC BIAS3",
 			"VA DMIC2", "MIC BIAS1",
 			"VA DMIC3", "MIC BIAS1",
-			"TX SWR_ADC0", "ADC1_OUTPUT",
-			"TX SWR_ADC1", "ADC2_OUTPUT",
-			"TX SWR_ADC2", "ADC3_OUTPUT",
-			"TX SWR_DMIC0", "DMIC1_OUTPUT",
-			"TX SWR_DMIC1", "DMIC2_OUTPUT",
-			"TX SWR_DMIC2", "DMIC3_OUTPUT",
-			"TX SWR_DMIC3", "DMIC4_OUTPUT",
-			"TX SWR_DMIC4", "DMIC5_OUTPUT",
-			"TX SWR_DMIC5", "DMIC6_OUTPUT",
-			"TX SWR_DMIC6", "DMIC7_OUTPUT",
-			"TX SWR_DMIC7", "DMIC8_OUTPUT";
+			"TX SWR_INPUT0", "ADC1_OUTPUT",
+			"TX SWR_INPUT1", "ADC2_OUTPUT",
+			"TX SWR_INPUT2", "ADC3_OUTPUT",
+			"TX SWR_INPUT4", "DMIC1_OUTPUT",
+			"TX SWR_INPUT5", "DMIC2_OUTPUT",
+			"TX SWR_INPUT6", "DMIC3_OUTPUT",
+			"TX SWR_INPUT7", "DMIC4_OUTPUT",
+			"TX SWR_INPUT8", "DMIC5_OUTPUT",
+			"TX SWR_INPUT9", "DMIC6_OUTPUT",
+			"TX SWR_INPUT10", "DMIC7_OUTPUT",
+			"TX SWR_INPUT11", "DMIC8_OUTPUT";
 
 		#address-cells = <1>;
 		#size-cells = <0>;

-- 
2.54.0


