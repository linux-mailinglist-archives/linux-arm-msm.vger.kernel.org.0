Return-Path: <linux-arm-msm+bounces-106685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KL4CxPe/Wn0jwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:58:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A683C4F6A60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0547308C2AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 12:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1858C3E0C52;
	Fri,  8 May 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cEcX/+L+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3204F3E0C6F
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244813; cv=none; b=svkYS9iK86DGV4X2Wk9a/gyOaYuIUSLKi4cGkOstuwc4S5vZp+gHAqcfPd9ODWCm05lqskv7jOtsEAcnhnNRGMtU/v2MMr3kNrW7ktFpN5pTue14JPP0zGzQ5dds8f5oSb+EYCLiKJ6iD2BUT6xkig2uY9WLwfWULnZst1Ywq7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244813; c=relaxed/simple;
	bh=tIDX7JUVBtImT75drxZOT43afatjq2eglYC9uyAHIeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mi4sNYBxAeKo5QCswoF5yu7RkkYNCNTVcAmI0ACeNMMHkrXHlBacLO6G0lNDvw+J61M5vyQiS0+bE2JLCzWVnxyB8DH31pC1c4xqnLqQ38Ncigi/fLANZrtVykAWCm0RGsFIjPTFpSg9s2UgP4+j3FazU/ihrhUPXG5fHksSyxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cEcX/+L+; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67b6da5a618so2879847a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 05:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778244810; x=1778849610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iH/xL0hFptFpdB14N/xJEwQzcQQr4/b2TTbHc4T4Jhk=;
        b=cEcX/+L+g5ORSMeyQLW6lp1Ef/OqGNZsYt0zrqfPkq5DXVDyRlKfHLii4fwVuawRtv
         NxLwffnwWNa5OssvUelV6bhOnVj0DLL+N7hLWvVz5/8RKLv2ZyByO82NvUYVnYrWlcx2
         Pl18QswAYqEME8d4zn5FaFdYL5BiqhC+oJ08Pmawl35ma9+nx2hYRAg2i+3574B8zXt4
         hdLKCgfwzlT1scygv5/gFVqobxxPo8c5jHBhqkUV8CU0ILfQiH487w88/d59VhnSkvIu
         eOz3cVwtupsqIAgf0QKD/ucDUnbWo7gcBMt87Gx5bCtrTG5UvqK5YUi8HIYUibu5uk29
         hkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778244810; x=1778849610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iH/xL0hFptFpdB14N/xJEwQzcQQr4/b2TTbHc4T4Jhk=;
        b=gIGTAEMonrW/6Ro3a0im1GS6Cq55d9QNmpo65GOCF8He8aSKVtkuCTTrBOtwzeNLXG
         VVEMnKhltQqi5B2Tmubb2dnfvlpziSz+pFFBM8DR5hOesRt8xf1s4kfDUqSnFwSUwP/d
         rMQXqCeuDpsmbxNfOjY7IRN2EfDpjCy3/si3RjcwMuJxr4Sn2eYLyQ/tsHvksUGlHWvT
         +wJwedOlr5QU6BJFXYfS/NlE60Z55Rx0OJ+zs82/NqdNw+YHFvF+Qr7gUs1/EBGw71BU
         vCD6Kmph0CoLIoHVvH+NnTbe8GKHjU3a2+sBEQoAEE7YSzEQnTpQDTkHmnLlq8r35LJ+
         Clsw==
X-Forwarded-Encrypted: i=1; AFNElJ901UvnyQtc1S0cmYVEcPHf9LI7YiJkxoW2kxllChgh4uZ5M6XmVjkVf21j4+OPoM0EzgIfUFjazbnYqWj8@vger.kernel.org
X-Gm-Message-State: AOJu0YyQTLJpbuS8e45uxsyU+gtF/ESgoiX3it/h8MMbNUfi+JPGClEj
	Lx4B+IESYpyNHBYGv4ohS8qdgQpmT2KU7YJ89vRfZPyPMUYl7smaob7D4YlqoslmwTg=
X-Gm-Gg: AeBDieu3cwA2cHWSACupLfKT/Vwzavzr9dFhaWnMQjcDpUyP0ycQHhyMP+N+GEzPgsD
	MjLyigukwXzTZtrCv9xPuc3HhyGS1NZQ8HaLtaJIB00QFcCb4v6Wg9mPmMK3rqnxff3IP8XvphT
	bJsBAtC+ruR458FJDhl2U74QOVRNLpPny1tRMwWIYLCJu5o5qlNXUWtH2f6rn5QFcd9gcEzFfgn
	BWXpIhpJzu8us85QW+ip0DsvONpNnGHzR4ET0zenlhdAbl5JYL0HzwGTFOo+K/Mofixd3kpc1a5
	+UfEfQiKz53IQBm744860fgCcVzibrljM5ZVM3SClEQJG5vLOv6c+qecLzNBxkoh5FSFnU9mYIq
	jEgx+4kNtuNcKt3pu6BF3OXF2e8qkTsjFk8qOhzFn5S04ASpbysc1G+da5U69TFqjxoWrrK4Ocn
	d6HmajXIipjcne5QcgYvZTnEUsh/5G9OoAPIfI6fX6IAuLQD0ekxSdKK56r724ls1olsklxhZWQ
	T5ptRGokA==
X-Received: by 2002:a17:907:fd8a:b0:bba:3bd7:17c7 with SMTP id a640c23a62f3a-bc56ac3654amr669181666b.7.1778244809659;
        Fri, 08 May 2026 05:53:29 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb94415c94sm800266b.53.2026.05.08.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:53:29 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Fri, 08 May 2026 14:53:16 +0200
Subject: [PATCH RFC 4/4] arm64: dts: qcom: milos-fairphone-fp6: add supply
 for Hall Effect sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-gpiokeys-vdd-supply-v1-4-0bb32e8e6428@fairphone.com>
References: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
In-Reply-To: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778244804; l=1397;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=tIDX7JUVBtImT75drxZOT43afatjq2eglYC9uyAHIeQ=;
 b=KT7bF/QDdLpdfF7n1XKRTlGsLTboMP/ClM4Ln/rj5O8mk+AT0De3KpscYOUGknrVFyaVp40Vd
 MR0dqPY85ufC++wlLpRWg937MPDzmsW/GsazLjn2qSNoZCrgHWb1vNG
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Queue-Id: A683C4F6A60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106685-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:mid,fairphone.com:dkim]
X-Rspamd-Action: no action

Add vdd-supply for the Hall Effect sensor in gpio-keys so that power for
the sensor will be enabled when it's in use.

With this, we can drop the regulator-always-on for vreg_l10b.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index c1899db46e714137d7849b3b043062fe8b05cc42..ae6900c3f75c64ea5b4feadf38df101abb43c1ea 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -32,13 +32,13 @@ gpio-keys {
 		pinctrl-0 = <&volume_up_default>, <&hall_sensor_default>;
 		pinctrl-names = "default";
 
-		/* Powered by the always-on vreg_l10b */
 		event-hall-sensor {
 			label = "Hall Effect Sensor";
 			gpios = <&tlmm 70 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
 			linux,code = <SW_LID>;
 			linux,can-disable;
+			vdd-supply = <&vreg_l10b>;
 			wakeup-source;
 		};
 
@@ -326,8 +326,6 @@ vreg_l10b: ldo10 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			/* Hall sensor VDD */
-			regulator-always-on;
 		};
 
 		vreg_l11b: ldo11 {

-- 
2.43.0


