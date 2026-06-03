Return-Path: <linux-arm-msm+bounces-111033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1a1ZNx5QIGpc0wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 18:02:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BED663985E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 18:02:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Sjfc/xO7";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111033-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111033-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B16CA3101282
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 15:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7E73DD513;
	Wed,  3 Jun 2026 15:49:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5311F3E171F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 15:49:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501750; cv=none; b=DIb+azMVMmh4+tfQQry2U9AHSfbV51O5fkRAkwcosEf0/ldc5VJZC1nqQECDk7kevAnpqyvnlE6c6uhBqahlm/LHoPyZgRNpaKEMYR7lSYZ5lDqF/YV3VAEOY1gG5dhUJutjammvl11sZuHR9bSXn8QxA1Xjc1w5Sly/NLckFcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501750; c=relaxed/simple;
	bh=tzR6u468eiX3z652pYwVYHRR0tQSZHHfkd7L7z2RPVI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OhvEkl6oxokZ7pPm4jF4dSmHaixh5F4yvB8qrG/xQGN8dsuVltfFvLNr3N5EBLaaGaEDKRmhgQv3V8nZq4wUArbwT/Q/66uirPy/Y/CRGR1pLUxy/1/lou2nYawJBRZ6avUDfJK0MgnqDYYtB7zhGZzgZ+t6RT61yWXwORHdnxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sjfc/xO7; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b3637b90so18251745e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 08:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780501747; x=1781106547; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLHaVnXrOktQICnRN40yNAwYJy7xMA0u1k7xFhJSUUU=;
        b=Sjfc/xO7Hc/sT8u9aLCbr2wCovykt4o1e1omJuWazMBZGDtaQkDdkl9CGgSlVHAI4X
         qY81xuOUVljkYizu8j9RdN6yq0OncG84Lc1g4SXLb7jowRVpAFtvqh1tL6v5PSinBT8p
         O2hbSP1D8S0K+n1i6wrL/H0nSG393DVR4i3IX/JdFx+gL2hm6/4gbcuk5EQT4n2eqXXh
         6HT1iT3S2tK440b4JxmIAmIid+XRD7lAoEQSUDwPXe3yW3H//IVM42VjwFffrldZndyR
         7FFKBtXyctO30yyikRSoQ/DHLBlga1v30N64l/tlp90HjBRY6zStpbYrykdn+JL2c51C
         1NtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501747; x=1781106547;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLHaVnXrOktQICnRN40yNAwYJy7xMA0u1k7xFhJSUUU=;
        b=WG0H7wJych3bzmxgxlTJ/P1CBakecO9nv7gu1Rnp6iq4QiLUqoypqPXLKb2siJcLQ5
         lmZgzoSvLYKhgQ+4nc3sGHkaV67Td+yQGqm7mmA/zEpqJl+1tzu6kTzsoIh9oq+Y8Wdw
         bbV9av9tH0W57llAZu7x50dECWjI4G3f+q4BEAV9dzQaaBPCla06Nixb83o6yrG5jkrr
         7hW2WPeEmI3x5bjKIYRsSYcmTdY1Zvee0T4PYAMUr+i1mInwIFb7p5/h+FsovUwBFagQ
         GuTLfLAYoqIVAgfV8zJN3DaC2u+r/gCk/BxK3kNWJSpMRn52a4FnzvcJLWJftRE3UrIS
         CIig==
X-Gm-Message-State: AOJu0YzefMYXqMNwUjiCONzfbDM6QbyExGMbG86AS7ldVVPnCSWNYGfS
	3z5o4TJZUKYxwfnWXy25g/1QKfrOdBfExUlXIJDEbZ7AXrgeI/c40/sB
X-Gm-Gg: Acq92OFNKo3Bx/iT0CnKPON/S3MxdcbtZAmvFGipYbyoTzzazvtVhi4lbX4v+jGkDzz
	lJXnu+x8X7voo0QiYj0gO2ASiAW44EQsQyEPEAea5yTVccuzo4r/99anZm9JZ5SQs72zC+AMxL+
	nUjPuTU2/IkMIIwm8RVtNljzp6OTkMvNToo40RRk/mw1kaguj4Wzo4aKlFZvB0nFSJeN7klW5Bn
	mQYl/u0hhI9hdyA2YZe3gx7UtTICVu87d7LGz7aBJsVopMuTsi9vLwBVt8Sfc0clR2UtmtPZtCn
	HFO4ANqkByV6f5+IxMH56jR80bSU2YN54C7etqTobTD/PmZnmw1Thrne4k7ondHJwtC8CoBYDK5
	HfCSDnHqJ7BBtk3JJzvTSwpagO5JF2t32T0X2Sr1zSej3CD1DUy6BtfXqWTpVlANR1BRJP2Dh/o
	K8DuqOU8MKP6uttj0scYXNQ1y5ff8ir10uv6EtAw==
X-Received: by 2002:a05:600c:c092:b0:490:b724:5085 with SMTP id 5b1f17b1804b1-490b724521cmr43435605e9.33.1780501746668;
        Wed, 03 Jun 2026 08:49:06 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:43ff:9a39:ef13:72e0:8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc412sm8886008f8f.4.2026.06.03.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:49:06 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v2 0/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
Date: Wed, 03 Jun 2026 18:48:20 +0300
Message-Id: <20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNQQ6CMBBFr0JmbQ3TQAFX3MOwKDDAKLSmBSIh3
 F3AuHD5kvffX8GTY/JwC1ZwNLNna3aQlwCqTpuWBNc7gwylCmOpxDI9rRGk256EitNGNilqjGr
 YFy9HDb/P2r34sp/KB1XjkTiMjv1o3XLezXh4v3LyV55RhCJLEbNaRTrBMm8Hzf21sgMU27Z9A
 GUSqRW4AAAA
X-Change-ID: 20260526-yukon-eagle-658f2f81a14d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111033-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:xerikasxx@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BED663985E

Sony Xperia M2 is a smartphone released in 2014 based on the Qualcomm
Snapdragon 400 (MSM8926) platform.

Add initial device tree with for Sony Xperia M2 with support for:
- Framebuffer
- GPIO buttons (Volume Down and Camera)
- Regulators
- Internal storage
- SD card
- Accelerometer
- Magnetometer
- Ambient Light/Proximity sensor
- NFC
- pm8226_resin (Volume Up)
- USB/Charger

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v2:
- Dropped `regulator-always-on` for l3, l6 and l8.
- Mentioned added GPIO buttons and reset input in the commit message.
- Link to v1: https://patch.msgid.link/20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Add Sony Xperia M2
      ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 403 +++++++++++++++++++++
 3 files changed, 405 insertions(+)
---
base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
change-id: 20260526-yukon-eagle-658f2f81a14d

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>


