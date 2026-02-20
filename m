Return-Path: <linux-arm-msm+bounces-93472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IANHH8nmGlqBwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:21:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA524166226
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C6963063D59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 09:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755593203B4;
	Fri, 20 Feb 2026 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="iaAcC00L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6128831D364
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 09:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579158; cv=none; b=A/yuieCdVnhuOpI5lqzlPwUe4XY17BAhUoaqRKn5Drhk6LsWCQ8k8uyMRHGrtdK3t1MzW5x0/jsT+c9x8FgIetvDSUz4k7gwqYsQex5WPIEqXinmg8xNjTFce4ppC91luElBHWcL+6+FAcQbM7gZKbOjWYn5wWXwTSgYVMS0M9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579158; c=relaxed/simple;
	bh=C+wsarVI55ZZRQ3B5XA+RMI2p40E5xuzn687URb4gIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WeiU9Hy4n7pcSideEWdX1jeDcSqzX4yH3e1mfYeFCoM3f2k45ZRsWgWgg/oguP4sp5SA3KrNYbtKa7sIf3IBldfvRXkK2UL/y97ORDKdESUFDa7F/PvGCUwFPn3fGvA1bvNZPOOV0QkdDpnweTyrNRiE/iJVVN84wZ62g8GJqow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=iaAcC00L; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b885a18f620so327078166b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 01:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771579155; x=1772183955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6F37dsCD+l3Kjiw05UW38NxOXviWKT0380mYL15ak4=;
        b=iaAcC00LodtDz/r4vB+VTwoeWfpGCyQrFsYFj91kPksn2uYUwl0oLdm1Y3bJuQcmyh
         /t7R96eK34WUvAtIxI42JeW0vhs8RpFvOqN5alRsbzuSTda5dlC28zuuER/aQ8MzpaEI
         ULeGO9eD1iTZQOYoFo5XhemBGdl28Q9jRUZeTJqrfBMzwWFZYoa26eYhF9u8+KHEXHyl
         E0BTC6WpeiCX/f3EE6GgSRB1B8dSROAoyr4rd3gy1DxGXCCcup2LKE0xUFq14OpVsS56
         5NyHf26vXjju4yn0eLFUj4F6uEuCl2jFgi8nBGkVrW/w2c8iw1B8GRPRvNI4Y/fzC3KM
         uKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771579155; x=1772183955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u6F37dsCD+l3Kjiw05UW38NxOXviWKT0380mYL15ak4=;
        b=pSyHDplSgve3+8M21Xw2snu9pq48qyqsSVOiHamX1SrbTXCKF9HQBkRwtaon5o6Ipt
         +Fo16N3H8NItvWwAA4YdQFlt0JI9OeoB8v8R61Rda0jn5xySNlvSu27McB8TNp9x/DVJ
         lqnBCunQ8Sm5is7Q0JsjJg2rZ6koG15AH9YRhNcuqLmL9z4qUoVWFif6YImeVXb+EkYY
         1/Z+3Hfq5yu8hBIkGmRIT5ydBb/OxrO3Uq7V2wIV53U9aGq6Y+OrNo96Pwwr6PjdVAHZ
         Q2eeW4zgJO1ldpfkOE7c5H2N9Eye+l65MCPhOt5wkLH3QkdZXuTWXH3BvBLdt7tWX4OC
         mMkg==
X-Forwarded-Encrypted: i=1; AJvYcCUG1EhnC1PBFzUmd0WOTUsIWIm6QMZc14zbo0PLCopV2d5M+aVvzk1B+IrZq2aYLqz0oOvVBgnhr7VGfjdv@vger.kernel.org
X-Gm-Message-State: AOJu0YwQtsJ38BFoR9Xu9b0Ygl4YKSr5Lntn5MdzM4e8xk0pRWzGBnlz
	qcy6iu0/tq6403Tqd50XlkXZgIsqpLvNil1JBi+P8I36pSHfu1oTRGzJN56rAtcWN8E=
X-Gm-Gg: AZuq6aKpbxfCuOczBVj42S3LeHoY1JBy6TPAEQuKJS6/CmxvCeKJ28PuKQBm1Uk1ucK
	rqrwBUKbrbGf5ymkYFZqa+eke330v+qEwIGqSIpx4S+bKMv4ZIU5qaYk9di8CH9tck2qlyIXXJN
	IlZJGKOO2ApQycTBlSh8z0iAqT/zFMAwxlqcZIhuhCbGtYU+OxcN1mHzj2PV7Ak812ZYsIMlKA2
	7KaC+BOi4CfA+svukH7FfFELAzgieb8JctheGWqYd4xyZglMoxkY9638izRDd73wnOrpAnjwwZ+
	SJ+A1hiz5QyS65gMycnWhXQWNC7G98DHXAhtqscYR7OWD2O9aoaIQj8Lgpn/vGaZXZRVHDWYLmR
	2ykk9LoF/4rfhjsIXx3fTd2AainGNVJpv5uOcNM/MyXy6cmd5ROuokuXrSsCmMe3mbgIbl2Ei93
	77YuFFfiT6RhpcmtWyb/VhCNAzVeA6UD5K3xe3v+BZRb2uhOZ7gEZ2VOyue/yEAlptJKjj1/NiX
	OEIsw==
X-Received: by 2002:a17:907:86ac:b0:b87:3c4a:e68a with SMTP id a640c23a62f3a-b9072e7a717mr62188166b.9.1771579154631;
        Fri, 20 Feb 2026 01:19:14 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc769111fsm667098666b.57.2026.02.20.01.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:19:14 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Feb 2026 10:19:08 +0100
Subject: [PATCH v2 4/5] arm64: dts: qcom: pm7250b: Define battery
 temperature ADC channels
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-bat-temp-adc-v2-4-fe34ed4ea851@fairphone.com>
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
In-Reply-To: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771579150; l=1351;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=C+wsarVI55ZZRQ3B5XA+RMI2p40E5xuzn687URb4gIE=;
 b=T4QbfcfFNBuzPHyJEr/F2U8LVosN8lPbSUjMYubLbaa2KgB748SbdekHcjXI0agmKW1SoNgGy
 vLJ7EthvVKhBSFCWTH42xcBLl0ss7sWNlc20UjjFtalqtW2vF3aSf04
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93472-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.83:email,fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,4b:email,2a:email,1e:email]
X-Rspamd-Queue-Id: CA524166226
X-Rspamd-Action: no action

Add the definition for these ADC channels to the PM7250B definition.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 0761e6b5fd8d..c96089520548 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -156,6 +156,22 @@ channel@1e {
 				label = "chg_mid";
 			};
 
+			channel@2a {
+				reg = <ADC5_BAT_THERM_30K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_30k";
+			};
+
+			channel@4a {
+				reg = <ADC5_BAT_THERM_100K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_100k";
+			};
+
 			channel@4b {
 				reg = <ADC5_BAT_ID_100K_PU>;
 				qcom,hw-settle-time = <200>;
@@ -164,6 +180,14 @@ channel@4b {
 				label = "bat_id";
 			};
 
+			channel@6a {
+				reg = <ADC5_BAT_THERM_400K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_400k";
+			};
+
 			channel@83 {
 				reg = <ADC5_VPH_PWR>;
 				qcom,pre-scaling = <1 3>;

-- 
2.53.0


