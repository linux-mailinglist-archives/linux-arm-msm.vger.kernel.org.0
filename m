Return-Path: <linux-arm-msm+bounces-91059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEYoEPsyeml+4gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:02:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0BFA4F45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 870C630842D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9EC313E24;
	Wed, 28 Jan 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vsnzKvfe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9249030CDA1
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 15:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615489; cv=none; b=DK6FHCc/MYAkZUS1uxklwvcgwp0B4aphnkM3RnlGW1P29H3O2v+8g/Brddrwy+V2lHTvCJbOlWLpEnrHywAEFNHYrr/GUIqKEC/kpnxmo3L7DRVsv1jYVwAbKMHoRWjd3vgDXruUM8hrTpoVQUnzjx/MF413pooxdn5Ism0OGPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615489; c=relaxed/simple;
	bh=OE8Va/qqR+Kr9++NQoSw36y7Yx+kr2GMJCERdWsWQhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXmAQ7pmK1nVUWgj32UgtNAdaCUPIqxCqWL/TPtWPwU4tbS8jQupDPv2QhaHsPuGWo+zKBRKaPQ4SkI/mGBnbMKwy3hMFoXOzYS18mzBGGI0bIWvdp6dDCEO+We2lSaUE1Ev2DzM5Z0hQy8ewDDH77dKpbSDI03kiVRk9Pu82vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vsnzKvfe; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6505cac9879so30539a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 07:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769615486; x=1770220286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldPtKD6ix4w1Qcpvj9OyKIUSGU8VGaicrJuthvpMMWY=;
        b=vsnzKvfeipDs/3LNEQeXGg/I+GFFNnEYs9twFxa/7y2s5shimLQA7sWI0b3PZT0jZP
         0tN+tRIxyLZJ93uCxwll43a9pcdlvJfLZPDYX9RH2C83IgaXXvyxvfQ9LMiIH2YBG1Uq
         uDw2xx1PBcF6KMoi0aQRyD8yKUtuFqCZU5QSPQlsjl0bGG0ALOP0oVFaJlJ8IcnY/0Tb
         pqO05/McLlBQxofqiw1ypOVEI6vLvxrFnOt8/IFUfqg6/DKjCtoAJY8cOAtINrbcxjxT
         vJFA4ODRaSEn7z+EaOC1qC0n1Ww+EVyrKy/zSgf4a4nIH94q8yYTw2Hxtcu79Nvtx/xL
         ZjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769615486; x=1770220286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ldPtKD6ix4w1Qcpvj9OyKIUSGU8VGaicrJuthvpMMWY=;
        b=cpLzVMcBv2mZlWvzWu1d95wSnc9uvrlPRQvXBiSx0oerd7g7e2QH2oR3FoaOCPWEgp
         0uao/n4bg8NOgWVtkGOCAxbE/Cp3kqVnlZsIs4xLGAe34sbDGFLzXtm2lhCDBWX5cxQ1
         pqOaRRVbGHhJHn9fsaxiM7JsKx6IlIi8As/3MilPo5wGYOZFZjFJwFCiVduNduCrGtAF
         IBod53Ic1gvL7catEJkkhkZiEo+RkFQqwoh/O7yNxFwIlRBkXp9VRcuZSJnnlUcPMxsk
         VPxasm/4IhZukM8QROhJ468S0QcqiBcn0hXNfB8CLC0XqJVo7S9dDOt8TKMycBh6ysdJ
         4Flg==
X-Forwarded-Encrypted: i=1; AJvYcCX9YKbluVDdN5d2b6G3omq3rPOk2rnuMEg1ZYLn3qOn/vRd43ACDhCvRbUPYksg5iCZUhmEiwaUDOF6Lt69@vger.kernel.org
X-Gm-Message-State: AOJu0YyObTCblsnA1pa329NQGNX1uTSKfxOe3oZLjC1WE5LT125Cta9O
	F+l8ZTaCWvEw7QLjlQUHDpvqTSG1H2fWJPZkbAyPmJnscJl1mcTVb6Avt1zeabDuR+I=
X-Gm-Gg: AZuq6aI5a68pqtXnXkfSuS6A+Kih6NXzQDp/3AVWGDEDFMbYVDcI017/PKswzFBcGcx
	DAC/8NKfb73eYK2P9yv+rkvi8HSkqLmqkoQSGjYZ7LTRcv0eqvwoV9XjRmMAl4rWedRdZAsesnS
	zPfya70aB1CmS+fkzf4JytRfHry+Uah4cvkPz1DN10cpR5SbwaEE2XivRWBKXmngrLSEEsMsv56
	8QiltGpPodaAP7LcCNWEk5sjBJ8nNPt8JycKX6KSJnIj4sfRygDFrTQMgHp7hYckLmuqd125BD0
	Hm00/kKy7B4dz7X1CdroB0bIxgKEkM9++pbGNSQkrlZimeghVB7sTBxwfe9qNuMrKr7VDj4v38q
	WHG4GYkANhDcl/ZFhdroqG5y8DbkkPWy0EZ4mnBCciV5vpns3HKnM/Vy8JLRskT6HwSifXl/YPM
	lfmbB8Xu0iyUtOsffYolq3OEv4JdXqgnt+zkbMH/kxach9KLvYVNpsngcIQRTVkJH6lIgj
X-Received: by 2002:a50:9ea4:0:b0:658:b535:77d0 with SMTP id 4fb4d7f45d1cf-658b5357977mr1666850a12.34.1769615485687;
        Wed, 28 Jan 2026 07:51:25 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469eb9fsm1727223a12.28.2026.01.28.07.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:51:25 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Wed, 28 Jan 2026 16:51:15 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add vibrator
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-aw86938-driver-v2-3-b51ee086aaf5@fairphone.com>
References: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
In-Reply-To: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769615481; l=1330;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=OE8Va/qqR+Kr9++NQoSw36y7Yx+kr2GMJCERdWsWQhs=;
 b=Wz7Wn2eegKWPudoKWK1GhVW4YccbSOgvk4e0Jityiqj7256/xXYqOuzhC7BGfZAfeQIJS/F3J
 6D3dn6u2AeRCVapUoogJ0y2zRUgD/TTfO8LUsgp4hnETv+rC8Gs/Wrs
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-91059-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	RSPAMD_URIBL_FAIL(0.00)[fairphone.com:query timed out];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	RSPAMD_EMAILBL_FAIL(0.00)[vibrator.5a:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EB0BFA4F45
X-Rspamd-Action: no action

Add the required node for haptic playback (Awinic AW86938)

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 52895dd9e4fa117aef6822df230ebf644e5f02ba..881239d22fa97685206d1fa3a70723c5b77a339c 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -625,7 +625,17 @@ vreg_l7p: ldo7 {
 	};
 
 	/* VL53L3 ToF @ 0x29 */
-	/* AW86938FCR vibrator @ 0x5a */
+
+	vibrator@5a {
+		compatible = "awinic,aw86938";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 80 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw86938_int_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &pm8550vs_c {
@@ -755,6 +765,13 @@ sdc2_card_det_n: sdc2-card-det-state {
 		bias-pull-up;
 	};
 
+	aw86938_int_default: aw86938-int-default-state {
+		pins = "gpio80";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	pm8008_int_default: pm8008-int-default-state {
 		pins = "gpio125";
 		function = "gpio";

-- 
2.43.0


