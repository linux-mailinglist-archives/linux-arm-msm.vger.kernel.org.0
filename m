Return-Path: <linux-arm-msm+bounces-94133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM8+DK0Kn2neYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:43:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAE3198E36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A53C302F7DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC403D3CEF;
	Wed, 25 Feb 2026 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WU/4bZN/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA633D3337
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772030616; cv=none; b=ai2fErPj2ZRQifQ5mq4miyL9ePemtMinY3UrgsLIK1nS1aj5vl8CO+LlwHfnTjF03SyqbdAVJQj1nkosAZF7hRkyVVmRLbLCjm1+idESUIG89LQSZPlcFJw9krOfvsJNmdVfc4KQfhUEUwxeULPiL/nVgIHyvK6ok6bIBjBZpwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772030616; c=relaxed/simple;
	bh=rKEeqVjE7wfvhzODV5z9zcNrAw4sm3ndUuu6PN9eKjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pNyMdmG3bv74qJt5D5ebODXQUs0HAoTsIBc2RCV+WCXYaNQ39sRyVjYsXq9X8eVpAjIx6oK209qf5vZMG2DQ/arZhG4GUg6DB+khc4ZmbVBABHsovsEmAbppa3OjXYJ3c+/fX9nUq8KG68qFfcca9mkuKzfUncUTnT0cxQHUWGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WU/4bZN/; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64c9a6d7f81so2400532d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772030614; x=1772635414; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5kQ77vzvVXrrGoka+gxza3DJxHiQ4HnQDx7tuRIPuo=;
        b=WU/4bZN/VSsPB7FurFAyKD2xFJUePr35LRXNhCSzmMarD7zrW1uvTFiOt5BOEHUjVK
         ZNdX71XGotDL5pflPbwNqXzQbuagcsYee89LoKd8pByIYnckd+DjfZ7NyhTtjrQUgyUB
         TfKBoQZT0jqEq1q4IHJpa9yzzrTyiERuZlckkXzN8pTxFB2kL3KnGrsCFSJC0dbv3dLM
         Sod22LyFbCG+ytfwUVLwQa9A0P4kJ5+TSee/o0/v3IQAzI3ABkqFeusI6n0Acxvnu/CW
         vhAov4aRSsMOcIwBbiVeVm9xBHai2yxroZiH/nW58YGhA6EeL8NLEDOUZVNwU+1nRgxM
         v9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772030614; x=1772635414;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5kQ77vzvVXrrGoka+gxza3DJxHiQ4HnQDx7tuRIPuo=;
        b=HeEV4kafeVucHqJTXDdbWVAtvPnrUKZnXKOknBI4DJXY2lGGOl1xC/i7C8uGFOUJT6
         HnGmQeqFN0uYttNRyhW6cmjm1uM8rRCFVwAw+DBrlPtyimYQ1lAtqmwfQuswxfhFA6hZ
         0UVyoP5u01RLd+5h5RvnzQkA3lu0PWWwytQQi4bMMUisPHZcNrDxGKt4T1MllNFzWD/r
         zpN0LAfL3ZgBEq42f6Yxzejmo1+fs2BuH3ONFyKDciP8jlRxuKsLDm2YGlG9B/wJudSJ
         3VVYVzCyivSbsUPnPSYqTiT0msZxQVUi1octpBsODF9I3L8CUfDYqU8a1EdqTJjZKbM9
         W4sA==
X-Gm-Message-State: AOJu0YyG+qphoEClR8A0YvDmsVA1Iz26TBAvLQ/Q+958hxigkw5de1MG
	ahcS1xYSYjxCpPHQwfAm9SBhLhnR0Eac+V9lcxYJFMPHG0CRKlyHJt1i
X-Gm-Gg: ATEYQzxPO9h165bfNkMejiUsBsPwOb7rGpiqYrhAJ7tFUtZfynbFmFyscG74GiM1IGv
	GnrniRuWOhTrL/uH1uOt3EibJuZEaq5J1zF/xiDngzJt5zJXjpRY+3T8eSotR/JTECrRIR+J8+d
	KoVf+FhwUYgK6OzVzUvAmUCFShqq9RXqtvqS2a3bSRTNjgHlohS0qPw8TqWqnf4MCvPSKLyCaw7
	mCKvq7mv5lpr5frGVYh77Xzu1ugNRNLUuZsbRo/hbsLsBHVNf0dTzLmFbfy167cgU+1CG9Na3WI
	h0vTXiU3yyWJwwFJgo3lmiQE3wKTDyEnEkUV3dy/YNjKo8wp9PRxPj41v84ZUn1QUrpiAl/yANL
	wQb8wUjgPhrby8BZbfwpu0lUzuHk54fXQM9qxRg+Sjh9csrJ8FYaRxXbR1vGZbFOs6Z6nHZUe+N
	EL/hKdE83gXaU7r5STvzgRTQ==
X-Received: by 2002:a05:690e:16e4:b0:649:b975:df20 with SMTP id 956f58d0204a3-64cb24d9de7mr443663d50.52.1772030613902;
        Wed, 25 Feb 2026 06:43:33 -0800 (PST)
Received: from [192.168.0.40] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c7a2520b6sm5555814d50.2.2026.02.25.06.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 06:43:33 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 25 Feb 2026 16:43:24 +0200
Subject: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add ambient light and
 proximity sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-z00t-capella-sensor-v1-1-99f767bc326a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1hOIGazMXEVmUdpUA1KlEZER7
 25x+Rb/n2BSVAy+zQlFdjVdckX7aiBMPo+CGquBiR0xd/gn2jD4VebZo0m2pWBM8d0H/jhKDmq
 5Fkl6PNfhd103OxgcZ2UAAAA=
X-Change-ID: 20260225-z00t-capella-sensor-dfd37c2960f6
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94133-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.68:email,0.0.0.60:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,c:email]
X-Rspamd-Queue-Id: 9AAE3198E36
X-Rspamd-Action: no action

This device uses Capella CM36686 as its ambient light and proximity
sensor. It is fully compatible with Vishay VCNL4040. Downstream device
tree reports Capella CM36283, but upon probe, a device ID for CM36686 is
actually found. This commit adds support for Capella CM36686 ambient
light and proximity sensor.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
arm64: dts: qcom: msm8939-asus-z00t: add ambient light and proximity
sensor

This device uses Capella CM36686 as its ambient light and proximity
sensor. Downstream device tree uses the compatible of CM36283, but upon
probe, we can see that a device ID of CM36686 is actually read. Possibly
a driver for CM36283 was adapted to be used on CM36686.
This patch enables Capella CM36686 ambient light and proximity sensor on
Asus ZenFone 2 Laser/Selfie.
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index ea90b00a2c8a..1a340fa92755 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -147,6 +147,17 @@ magnetometer@c {
 		pinctrl-names = "default";
 	};
 
+	light-sensor@60 {
+		compatible = "capella,cm36686", "vishay,vcnl4040";
+		reg = <0x60>;
+
+		interrupts-extended = <&tlmm 113 IRQ_TYPE_EDGE_FALLING>;
+		proximity-near-level = <30>;
+
+		pinctrl-0 = <&light_int_default>;
+		pinctrl-names = "default";
+	};
+
 	imu@68 {
 		compatible = "invensense,mpu6515";
 		reg = <0x68>;
@@ -330,4 +341,11 @@ mag_reset_default: mag-reset-default-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	light_int_default: light-int-default-state {
+		pins = "gpio113";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+	};
 };

---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260225-z00t-capella-sensor-dfd37c2960f6

Best regards,
-- 
Erikas Bitovtas <xerikasxx@gmail.com>


