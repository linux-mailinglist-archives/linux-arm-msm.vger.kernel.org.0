Return-Path: <linux-arm-msm+bounces-98792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG1bHTYYvGlEsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:37:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5FE2CDD10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDA9C307908E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6B83E7177;
	Thu, 19 Mar 2026 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="l3S5Wgnc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CE43E3179
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934600; cv=none; b=JTCsz7nhcisjkWpRbtnMvhA11Mgb3GNy3PtdtTkBQFUn3mjXQp62jaHNowKn5Q2jsqFpl8ewH8jMxpxBzOv+FtA7MXj3QtFmdY1ZNw9k2/47IkYC/X5rcfCZeGRJWwzfQvwURUM3LWq7A9D6fq6X3d9tkpxZeuIfDaC2No85DrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934600; c=relaxed/simple;
	bh=8w/E078ryHouVBIkDM5VDxMyqIuPpnQJBxohdYMpZzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rt/TyD5Xpp/HvSSdt4N9ivNFwNem9oHtbSiD9ZBSrqsh9y8o01u2ZAvkXhYH273UlCZyqhylayAkWHHZjxAHTMoTHMfpeCrZHhp/SoF6EKfkB/9UUvYwhoJnEnWwRwKO9nHtqC0iUTD500FPr3fM1+v0bCsO9vao1HZ9+9zALeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=l3S5Wgnc; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66847de014aso1582943a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773934597; x=1774539397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iN6KKsEF4bWiFrFM9ysSK8lwY6F3e56lREb03czgqC8=;
        b=l3S5WgnccwfxLQIfqKAtJQ1GIybpxRBXsZ7ss/XOqkb23tdhZTD45fk7ZJivZMvvTo
         Kcv53rZaBIovZH8MniGOR2dOAnVEA/Gxc7gwqA25wnPW45qUgKbu7my7iT3ZOnSoS2Gc
         TiXOMMKDk3Y/kCEH8+PgXL3km8YBDD2x/SaTFmGC+pMwoNKGolICcCQ/u3O8Y5FWC1OP
         5dbWDT7koY7pfU4jM6Ns3AsN+tarFbOJn869trjr5YnfzpquM/xeHvA5YA2X6gqprTKd
         t6gmOKIs7zavyhjiOco+0Kyj8lOW+8bABIe82hUGr4AofClLe5QIHm2t1KBM3150vd7C
         FNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773934597; x=1774539397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iN6KKsEF4bWiFrFM9ysSK8lwY6F3e56lREb03czgqC8=;
        b=Pi9yMPjHuCjn2xQLNYbqmUJrou+87ZREUf2X61VVn6Ir+zObO68FXKOvdKN5lG+oFX
         8xvzcLP98s8t5L9nHgt4cgBPsAENMZUgc8QcXpe3KeX0e6USGTutdr7jbYh2tEDQvfVa
         0vM5DI3QTFwlC9vWz/4tFhNOnDA/bNEDtrowkjIBnmf1aIkNfRKDEe/Ni3ktL3Dhi94C
         /LROZac0nhVdtLAy/4+m2jrdIudn86pVWvPwEKSJkgo+1Mll0vH06la6XPpSR9Yo+2SQ
         bZPptmLWvg16PSApD+65EMTrJw4erfFoY3vSZMvWCv+fVPk1I3Z3hTehhgOhrye0UYAp
         sxXA==
X-Forwarded-Encrypted: i=1; AJvYcCU0rIvVSk9MjLWI8qPiA3b3Is4Uv7PpxSCmE/gG2SLljcfC1x6chfomBpZqwbauql2lMzGXLTotJv9M8w2Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxQmOiEpnNBKAnaOTWuhBjtxf1RUwZsMOQ5s02Pu1J4vbOrEXAe
	eDqKaVF+8GGzn386ydqIBLhHmU701V/PhD8vyuRiZ6eLsjYg4WrS7QdPCWFi0x2I3MI=
X-Gm-Gg: ATEYQzwh43WpTDrkyBHVOTAnEnpN3JqQfReMPGhswH4PTfvE82piOYX64bJd8uqXZOj
	iQMJo3PW0LwkFyd5pf2EIj4rOk6ucdaj1p47x1FzQk6guEcXJBwkfGtI6aXJ0SiW1kPk/h4Phke
	gMB37fjWJJLPHESK/peofJkm1Vh5M7f6osFRDPY+nbQY+iibLIeTPr8tfrXD+nRn2pmJ6ObODWx
	vreSMCyRWlBuzOOJThjulPMLzXfFVsfCkCNxqPshRd8p3Usy7whhQve1qUun3iTFjZcFwhs0/p9
	eELaFKxWJCAkIUqD06EBkkaohpO1cXGAJK3001dtXdWGYXrxBz2av5YfFqhCX+5oetsmQhxaY+o
	Y7kPu1+28SISAwLQJbjiICm8ZFtaA2bItlgI9OwWH9rcLOEzx47mJx5ADVUP2fyD0IBIIYOh+h8
	1E67lzuYC0DmqEKeZS5yhXzeyC/WI1K3eBYFz3xBaVNPw+zTK5Xtp9Mhmx7PUDYL+Hq3UBaixNl
	mwmgg==
X-Received: by 2002:a17:907:2684:b0:b97:344:7d3b with SMTP id a640c23a62f3a-b97f4a60298mr445096866b.31.1773934597374;
        Thu, 19 Mar 2026 08:36:37 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3ccsm457568366b.59.2026.03.19.08.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:36:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 19 Mar 2026 16:36:28 +0100
Subject: [PATCH v3 1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Sort
 pinctrl nodes by pins
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fp5-s5kjn1-v3-1-9cf4b8c09567@fairphone.com>
References: <20260319-fp5-s5kjn1-v3-0-9cf4b8c09567@fairphone.com>
In-Reply-To: <20260319-fp5-s5kjn1-v3-0-9cf4b8c09567@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773934595; l=2875;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=8w/E078ryHouVBIkDM5VDxMyqIuPpnQJBxohdYMpZzM=;
 b=ryPESMsX54s5tOZtqFBy/A6pH2sDHEEgK8lztbunWwwW6BOjVWeRO+MkdRKDeaeCGh443M3Xp
 BU7MpT0qhcLBvvJH2ghJ7SZCvh0vbqeXgJE6xSaQjEBTC5JSYjUrO3t
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98792-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CC5FE2CDD10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As per DTS Coding Style, sort pinctrl subnodes by the "pins" property,
in preparation to add more pinctrl states.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 74 +++++++++++-----------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 455e5c9bb072..c9c24c36ba7e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -1257,41 +1257,6 @@ &tlmm {
 	 */
 	gpio-reserved-ranges = <32 2>, <56 4>;
 
-	bluetooth_enable_default: bluetooth-enable-default-state {
-		pins = "gpio85";
-		function = "gpio";
-		output-low;
-		bias-disable;
-	};
-
-	disp_reset_n_active: disp-reset-n-active-state {
-		pins = "gpio44";
-		function = "gpio";
-		drive-strength = <8>;
-		bias-disable;
-	};
-
-	disp_reset_n_suspend: disp-reset-n-suspend-state {
-		pins = "gpio44";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	hall_sensor_default: hall-sensor-default-state {
-		pins = "gpio155";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	mdp_vsync: mdp-vsync-state {
-		pins = "gpio80";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
 	pm8008_int_default: pm8008-int-default-state {
 		pins = "gpio25";
 		function = "gpio";
@@ -1345,9 +1310,17 @@ qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
 		bias-pull-up;
 	};
 
-	sw_ctrl_default: sw-ctrl-default-state {
-		pins = "gpio86";
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio44";
 		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio44";
+		function = "gpio";
+		drive-strength = <2>;
 		bias-pull-down;
 	};
 
@@ -1359,12 +1332,39 @@ usb_redrive_1v8_en_default: usb-redrive-1v8-en-default-state {
 		output-high;
 	};
 
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio80";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	bluetooth_enable_default: bluetooth-enable-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio86";
+		function = "gpio";
+		bias-pull-down;
+	};
+
 	aw86927_int_default: aw86927-int-default-state {
 		pins = "gpio101";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	hall_sensor_default: hall-sensor-default-state {
+		pins = "gpio155";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart5 {

-- 
2.53.0


