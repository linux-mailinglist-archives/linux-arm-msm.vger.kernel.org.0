Return-Path: <linux-arm-msm+bounces-98665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDMuAX+6u2mtmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:57:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 523FD2C82AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 212AB310B707
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CB83ACEF6;
	Thu, 19 Mar 2026 08:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4E40rKP5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B292636D9E1
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 08:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910512; cv=none; b=uiyQDe8q/xb4dWYfXN1RQnMogIVLqs8nZVe1X2fSIuco9lAzZOYLQGfWHa+GBWaauaNF1jnc7gT2QEVRO+EFifZ4b/shW+yLcPgTGbcmQemWG75j64UU75tGHDZKjK3uP06OvZMH0MbSwT5HkENYWrhmcRsrEqh2YDIlywFdjVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910512; c=relaxed/simple;
	bh=IzA7DVYs76tgOv9WJWrIsFdXTl5V2IRyQcUpczSkiBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Mp34AoRTh2Zpk+XUxVWuzkHZn+go0GHzzKmIaIwaM1tk8udbVQz4Vhqo+sgjukPa5FEgySofRxfuvdCom2JsABtRTbBrbdYV/H3PFkCJeGfnN/K7nuy4szT2RKJZy8WoGMzNf4G2v9WnnGsXIglZnsd8VTEsbQ1reVJq4STepw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4E40rKP5; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so1516631a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 01:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773910509; x=1774515309; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BHtIJcQ4yOLtdh3EcNfW3X1czpv1TxdBE8D7th0R/gQ=;
        b=4E40rKP561ZGR08+kjOzLmw92B4RAvzpjP0wmeib/6YuKDtmDfR2pUvBTi8q0459ro
         qV55hl03EWp0HWPt8m3PpzEYAq6eP1F/zzmkXwLtl4pG+/mdjaqDPUeUI1SwyjPQ8naR
         1xQ16WFrHIKXXrTodK1RnVApuEw4Eh7aT+H+xVOuRmVlyC9dx1Syq/foPYPUWBT05yBN
         H/I9ynFC+raXKdfYsEiZWpZN+nb2TDpE3wGvenC6QtpHnXETsomMCqOaMqkYVDCWzCvw
         19PpyQCjbg8pxk/ko4eyue1sRoX9IXsBwt52utndRtoIoTWBV0DtIGj8gXMHuXGLZ4J6
         hfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910509; x=1774515309;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHtIJcQ4yOLtdh3EcNfW3X1czpv1TxdBE8D7th0R/gQ=;
        b=DsE3Ly9yk86eLgX585P7Zlmpq5uBPxPyoR9V+fDmamemusT1Ju3iQBxtU1JwawA5Z5
         Suzv/pVQuPF+E0TdUd7g5C4o6QiyAIbM9HXh0q6o9bWzxhbeF4/yz1VV33n6erhiX28b
         cXrnU0Wrp/rmK86DdVJXs8ObrZPv3u2p31s+hUNF5Ox8DAbBZujN7Jw2dSQyvyFq50wH
         +0/JSiOTz0EBSCiX4fEoYoxWBI83PJ0iB5caxQcRDRnAcGdaP8DuIVG+VSBZDz/WSDhS
         7chX+TVGGD7VJTg9PKWrultlTgA1gatqI/sKbGiwnIbm5xsUHURVSaZ39YnD27eSltLK
         s+ag==
X-Forwarded-Encrypted: i=1; AJvYcCUlgp0wuRy4PEDZ8lBJcws4/qTWDrEm9m4IxfBCOVDjC3dIiR2cDwTGa/95rxsz7Q8hDr/dxWC4Rrnl4gyY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+peZ4aHTZNTyrn2q86z9urFArT5yzCqz5HOBaMPVFRLBqzXmX
	TslfS76WsFAXkLIDfIEe0dv0KiYB3DH93njHnCe0J9nlQLSynvxWGK9CoHnh7JoUAQRnPRdXQyx
	QtsUb
X-Gm-Gg: ATEYQzxYFcUTDq3fp3LFJlQSsIVQ2XdIxn1k5fCIieY7oRnMRBxEIEEWVt2PWCBCCu/
	YKZ+0m2NizOksAG3BX7UIpoLSmj4ud/OLt3Fh820psc1/Jjo4qGLuwFbR6KlPLRovs13GEo0sNm
	jFzWS50H462xQDahdAniN7vAluJcWyawrxy5t1UEVsR3oJiJkzjmje/Xm9UWoUyIm/15Ks+fXpi
	jcXxtsqVigiSO4zQVGvLDIpbGjq91B2aoEn6r1Pj84J3i8AKApmf4Hr2ECJxsNr+xSFkCq3zyOJ
	Brf4AeDLJEd3EQhKgXndO6v/sNckWuBC0a7IuKNpVhTfGBiVjHzOPH2YbgkKmW+Ikr/Jt5UxGDx
	lUyc++EmYORNU8mrlBjVlXUQmoklImunSwp9scx0YyrMgj6Sx4Zbh5Kn4loeD7aahT3Yidc9lrM
	XAp9VlEZnhuB++7WohF3aBJyMI0XkTUVdj/TEK7yrqiH8j4t6vvkoigpQVfn8I6YKNsCXoLMXqd
	BiZGwoQ4n3wIBfM
X-Received: by 2002:a17:907:a0e:b0:b97:f28c:fea6 with SMTP id a640c23a62f3a-b97f486677amr382865166b.8.1773910508797;
        Thu, 19 Mar 2026 01:55:08 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f16d7ddfsm409472566b.44.2026.03.19.01.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 01:55:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 19 Mar 2026 09:55:00 +0100
Subject: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting
 bias pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAMAzAviI9W9jmEOpXxINop73o6FSEsb87P
 CaQZEiswgmGJoPyI0nOo4JtG1j2+dgYZa0MzrjedJYwRI/3rJfFIC9S4I6MI++JoDZRuer/N06
 lfFnpZ2NfAAAA
X-Change-ID: 20260319-fp4-uart1-fix-9fe390294499
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773910507; l=1651;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=IzA7DVYs76tgOv9WJWrIsFdXTl5V2IRyQcUpczSkiBE=;
 b=2S1wO6Nl6QAu+Y/oouP1Cgz4PwvApvauSatoiG+hngdXSOZLwdj3C8wvO3LwpUYBu/LBkWGhx
 eQ54Cx0biQRAQo921yxM/935gTwwW2HWLuIN7Ad0iPSXUOJaOfqHfwx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98665-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: 523FD2C82AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pinctrl nodes from sm6350.dtsi already contain a bias-* property, so
that needs to be deleted, otherwise the dtb will contain two conflicting
bias-* properties.

Reported-by: Conor Dooley <conor@kernel.org>
Closes: https://lore.kernel.org/r/20260310-maritime-silly-05e7b7e03aa6@spud/
Fixes: c4ef464b24c5 ("arm64: dts: qcom: sm7225-fairphone-fp4: Add Bluetooth")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index a3c2b26736f4..3964aae47fd4 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -1019,12 +1019,14 @@ &qup_uart1_cts {
 	 * the Bluetooth module drives the pin in either
 	 * direction or leaves the pin fully unpowered.
 	 */
+	/delete-property/ bias-disable;
 	bias-bus-hold;
 };
 
 &qup_uart1_rts {
 	/* We'll drive RTS, so no pull */
 	drive-strength = <2>;
+	/delete-property/ bias-pull-down;
 	bias-disable;
 };
 
@@ -1035,12 +1037,14 @@ &qup_uart1_rx {
 	 * in tri-state (module powered off or not driving the
 	 * signal yet).
 	 */
+	/delete-property/ bias-disable;
 	bias-pull-up;
 };
 
 &qup_uart1_tx {
 	/* We'll drive TX, so no pull */
 	drive-strength = <2>;
+	/delete-property/ bias-pull-up;
 	bias-disable;
 };
 

---
base-commit: de79886ae0ce739608514f6b1ae91c14c6a9e600
change-id: 20260319-fp4-uart1-fix-9fe390294499

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


