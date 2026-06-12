Return-Path: <linux-arm-msm+bounces-112932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IEEtD0MBLGqjJQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 14:53:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 801AA67984A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 14:53:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=cuwJq4We;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112932-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112932-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A8DD302F265
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 12:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569A7374E62;
	Fri, 12 Jun 2026 12:52:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5645C3E834D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 12:52:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268771; cv=none; b=dFsd67EGtDrp2eniWJTNkboAT7POCSXHCi+hlIROQT+cIQyLyDcWIpqhKipHDiRkHV35zyb7h07dugXEX2b7C7BuzbmS1v1hVjOUGanxa/fos27Sx59sqpW/FXgk4H3FDv/+DNUkcSC26yhMuW4Hi4NJwMNARstX4fB4W9wnu0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268771; c=relaxed/simple;
	bh=+gJoHyGsiFiNaIlHB7RgSHLds74RlNXffkN/maQntfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P1zH6xWOZT/C/ZpT/Vui/wkZEBvO06MdTZY8W6ENvrKhvsdkw13SsP6f8nsJE7w1jVxsGxZ8i1tNLFIMKamvRPWu4OZ/+UQhUhaG93GW4r8OCQli5VTGh3Z22BjSk4m+kyeMoiE5EhIErYXfyZQZOJRGYD6d65ya8s8hezQk4Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cuwJq4We; arc=none smtp.client-ip=209.85.218.49
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-befee9e5ef7so113001166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781268765; x=1781873565; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q6boKDQpN4ENAhHPbAvIJHcNbXUFoJdy37O/+JGrt8U=;
        b=cuwJq4Weasr8kyaVwhIvSaJh6R+L9O/J6VUXnnI/TFRmx6LrfnOptNtc9HQTWanNU3
         UV3TUbSUEqjDsqksJUkA1dyUIq3fOPcWx0MGFWRzTMxXVZNRbk1JfGxDc2EDCA9AlQY3
         wmHcDXo8/UEUFmTTfnrlC+TwPMzRtjcRIpbs173p/tbCVN+6EZJYG4C+K6zRF+8wUZvW
         nIavBcrgLP5lWYIIN/VWOE1AkcrC37TObuqV2WgfH3lNjrKfQ3RP20fngCXYfnynS1uq
         l2TknREudIdCZEaIpz8/BwIDttpuO2Z9f19pOOSmCfRbiMPfqqwt2qaHmaTsL04jUB54
         0yHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268765; x=1781873565;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6boKDQpN4ENAhHPbAvIJHcNbXUFoJdy37O/+JGrt8U=;
        b=h7EQjA0DhEt6rok7A0ABVBxqvRDtvZdXB0w2K0xroGbq6h4oSGmK4NpD8dp2Sb/Dkk
         X/WQ2gabZ0uFyz8wJWcBDgLQY60U7lG31Ar2hFj9ow2DOmIF+m7A62As9qrQt++6Um6w
         XSR3VVj3/n5Ok2wFzcmPNL73kBFjcryyxDC/0AiJn3WN8ywcDPWiZToq1dUJb7/aZJQz
         aQE3V35Q4LLuEFH3NViA3GSuLAnLmSPvewzem7kg6PFtAjkuMI7V3NnKmuZaTKrdx9R9
         Me2/inJry0VvE0Xjc7dtZPrpFvaBqnGmei6NpWVY1AJeew6gMhgRHWMuHCDx0KF4K2d2
         YsFw==
X-Forwarded-Encrypted: i=1; AFNElJ+Irbh1mUZCQ6/JVvTEIDXI/NqZJAoMwhKy+UoF+6tLyTcXMF6AeT3vAY1JfMcBCUOqxtcaIDawJQr6Dv6l@vger.kernel.org
X-Gm-Message-State: AOJu0YyAkT+7D2zWvDVtONeRK69/avxaZ9Yg66S1UQ49VFVpPQlrpxW7
	wfOL5F85VlNE/yXb3ZMzrUn3/eNvPDmLWRlYlZhPchd29PDrlhSuwiWfWdch+ed5ruk=
X-Gm-Gg: Acq92OGBlbPJNEMr6Fw9ZuVJwM23+9UL2gZ3LWxsqNfRhhg1CkehJrmlFsKBamO781/
	t97Yq7SqX7ZdfzTBgJexEO7AZp3cD4XbmntDFiCI2c2gQYrNPf6UZ7hhM+0KYb7777DfmcvbINz
	hyUQtRD84VmkJOLFpeaxXeIw4aqXjbh2DTEPNBG9v8AbwlX9Nk3YK03Xz7joGOP5Bys3OWP0mZd
	4SyLM0pdNpGn5RKwdIPKgo+y8J84FMxO4vKBu4oE/9BAc43RtnKYzyeSI//J7PVqcbl/jbC/5O4
	wmyk+2nhclPsbblss90eDGnaOVQiP8Z0RK+laj/p7PYBSor1PMzohoDGDUv70XMcnuFvpRdCSaH
	OK4PC3faC2AHyc3o6EoJWVNKTmc2T1oeH8ruepzz+eYE1k2z3hKgyrJFWZNOQoe4bo3VqteLwim
	9oU8FK2QpxzPdwN7vL2/2nd795iOBPW5jcA/yeT1e66vcBd88vu9BDnitzVY1TRnq7j0RjnyasA
	RRR9V80JDd8NTjTuqVdm0RXCD6IAkIhswuD4Xa9XCiWVY6Q8vjnXxvGbyM=
X-Received: by 2002:a17:906:4794:b0:bed:a213:a89b with SMTP id a640c23a62f3a-bfe2b0f8f54mr142133466b.37.1781268765453;
        Fri, 12 Jun 2026 05:52:45 -0700 (PDT)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe6f9c46f0sm57823066b.1.2026.06.12.05.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 05:52:45 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 12 Jun 2026 14:52:43 +0200
Subject: [PATCH v2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add AW88261
 amplifiers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-fp5-aw88261-v2-1-f7ef7d060170@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OQQ6CMBREr0L+2hralIquvIdh0daP1IQW24IYw
 t0txaXLSea9mQUCeoMBLsUCHicTjLMpsEMBupP2gcTcUwZWMlFWjJF2qIh81zUTlMiSKVUiV+J
 8gkQMHlszZ9ut2XMY1RN13BS/hsfXmGbiXgMlAxLt+t7ES2FxjiRPCUphU3QmROc/+d9EM/H3y
 kQJTSRyylBxzfHaSuOHzlk8Jjs067p+AdXc6g3tAAAA
X-Change-ID: 20260522-fp5-aw88261-a02bb0e4b697
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Val Packett <val@packett.cool>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781268764; l=2873;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+gJoHyGsiFiNaIlHB7RgSHLds74RlNXffkN/maQntfI=;
 b=5ftPVdQT3awobwhdIKpoO8iBgTIf1JN92Puc7p1+tF6/AWKV+9xg1A4MGMO8NQVwuWmKAqkc0
 NzuiKq3ds/GDe/tNM5BeoXHNWRhS0S1ykKsWEiIsRWgqoFfm2xmAJRE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112932-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:val@packett.cool,m:bharadwaj.raju@machinesoul.in,m:bhushan.shah@machinesoul.in,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,fairphone.com:from_mime,msgid.link:url,machinesoul.in:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 801AA67984A

Add nodes for the two AW88261 amplifiers, for the top and bottom
speakers of this phone. Hook them up to the sound card.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Signed-off-by: Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Remove awinic,sync-flag for both amps since it's actually not needed
  (Bhushan, off-list)
- Remove RFC prefix
- Pick up tags
- Link to v1: https://patch.msgid.link/20260522-fp5-aw88261-v1-1-20e412eb4c4e@fairphone.com
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 57 +++++++++++++++++++++-
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29f..6ed34b5a99b6 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -866,8 +866,33 @@ vibrator@5a {
 &i2c2 {
 	status = "okay";
 
-	/* AW88261FCR amplifier @ 34 */
-	/* AW88261FCR amplifier @ 35 */
+	/* Top speaker / ear speaker */
+	aw88261_l: audio-codec@34 {
+		compatible = "awinic,aw88261";
+		reg = <0x34>;
+
+		dvdd-supply = <&vreg_l18b>;
+		sound-name-prefix = "Amplifier L";
+		firmware-name = "qcom/qcm6490/fairphone5/aw88261_acf.bin";
+
+		awinic,audio-channel = <0>;
+
+		#sound-dai-cells = <0>;
+	};
+
+	/* Bottom speaker */
+	aw88261_r: audio-codec@35 {
+		compatible = "awinic,aw88261";
+		reg = <0x35>;
+
+		dvdd-supply = <&vreg_l18b>;
+		sound-name-prefix = "Amplifier R";
+		firmware-name = "qcom/qcm6490/fairphone5/aw88261_acf.bin";
+
+		awinic,audio-channel = <1>;
+
+		#sound-dai-cells = <0>;
+	};
 };
 
 &i2c4 {
@@ -1161,6 +1186,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&q6afedai {
+	dai@127 {
+		reg = <QUINARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+};
+
 &qup_spi13_cs {
 	drive-strength = <6>;
 	bias-disable;
@@ -1238,6 +1270,11 @@ &sound {
 	compatible = "fairphone,fp5-sndcard";
 	model = "Fairphone 5";
 
+	pinctrl-0 = <&lpass_i2s1_active>;
+	pinctrl-1 = <&lpass_i2s1_sleep>;
+	pinctrl-names = "default",
+			"sleep";
+
 	mm1-dai-link {
 		link-name = "MultiMedia1";
 
@@ -1246,6 +1283,22 @@ cpu {
 		};
 	};
 
+	i2s-dai-link {
+		link-name = "Quinary MI2S Playback";
+
+		codec {
+			sound-dai = <&aw88261_l>, <&aw88261_r>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai QUINARY_MI2S_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
 	displayport-rx-dai-link {
 		link-name = "DisplayPort Playback";
 

---
base-commit: e7b907ffb2cd66314df92360e41f7bd5fdaa8182
change-id: 20260522-fp5-aw88261-a02bb0e4b697

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


