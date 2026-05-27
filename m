Return-Path: <linux-arm-msm+bounces-110020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBpSOfpQF2oIBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 22:15:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B55E9F79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 22:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16F8C300C03E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 20:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C3C3446C0;
	Wed, 27 May 2026 20:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHU9eUVE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B2039182A
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 20:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779912490; cv=none; b=hxdNQXXR8zzWKU/WXVV2OLJT5AcdqqudK/K4WzNAu/kjWmdd9ahPU7fZE4rcCo8y2/cNJ2XIwUYTS7oURGaeu9rnIrgoANTO6Q6qT9RzMzAi1o0Z4x2djyeHOmnIpBShkttI/A6DWDYkeJcyvfV47Kv8C/kUMYQtf/XFDUvZoYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779912490; c=relaxed/simple;
	bh=kTpBUkX0rt0xbSv0yoLPWHk+BTyd3gSxlTejaHQkxZA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V2mFj6afTGlGestvOEbwYeSAkLeop2tcCYH8QHzYH+iPb5ftk6r2H+78X4zMYlOjPXkXe8QKO9JbwLMS2kdr3dRrX9gTllfZRZbxXna2aToP29+pupfqCgiR0rY/YK3MW1+/kN81eAYpGlH6vCACK5msUJ2rE50NbRE/gOSVXN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHU9eUVE; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7b6ae2ea4a1so125877767b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779912488; x=1780517288; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q7uoGG35zfSYVF4g6jttWnLIJujz61rH2XH/8UbJJQI=;
        b=VHU9eUVEdIg2NokaADiwijJJykp+GQcvIF4/NLF9mvPHPBTTvfGo3Yq8rO1ZeB/SOO
         YrBAIpB68z3Hp7ocdNBb02YA6QocUSSK8LDPvIXoX4LIzpwQX1ToWlpy+dJEIqwvtTAe
         GIzYNoq6oHAoKrE9N5OnlRD7lsAtopbIqiPRDGzusX4/APNYDu5I72ASVVlPEH6piDSl
         7o6eM5dsz+W3+1miFSjWmjn6Nthzc/YTStH6T1vNwOViSGx9xhugro2wR0GSavkF9B7w
         seNVuhj5x58Mq29cFS8UkLk7sJU6i3eBPGf++8tsJ/cy34yPs3GeYaOKSfEYag9orfAd
         9tUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779912488; x=1780517288;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7uoGG35zfSYVF4g6jttWnLIJujz61rH2XH/8UbJJQI=;
        b=EFFS4OzAbsaEN3kU8OJ+qylevdweRdQx4h4a+dDISIFZLxsGZf+C/DENtXlYd8RhG7
         kcII3DZajrSFiREMsGJ7is2jRD1Lg49c/mg1GPSGbkcMCfcPArTPob4fqyAtbZwVbZmX
         XjlT51uPiIiMIP/IcRdR0AEsibddwmD/gX1UgIk51ff/H0twIhWkxLqjgUhvg6rvQADz
         K6jqaCWfivCqCgYXIHkOZZVJny8U5OgQFJ+6J5/EjSjd7e6Vvbk785tMe3UT0vJpkuJp
         ZncosStIGmP08pwxEN/w2DxpxqJ+yFzQnoJ5BxiLVszdNTOw0hSxk+3EfGDk/Oh8Z5ob
         yvhA==
X-Gm-Message-State: AOJu0YwNPL6QrTIRMWiTdcDjZuvyi+cUrJhauXufWA5MCvJGWCPQmNnC
	6zOCxgYr7jq3KCCo/9snCpk3iIkcpznQH+Udy/peTIvnaZEd3k8p190k
X-Gm-Gg: Acq92OE/51LmcrBFWqej8agmT23tZWyrDMM9PsUMzd8SFiJEBctOQwor/lqLupy1r6C
	uxZheiu0szxcXX+OsyP01hSMJouRJuAiKqDdbsb3OaMF3HrmWr7ivgO26+r2BaNYyqmg1x1pQTh
	d9VTM0EW+rNv9OTWnpW6JJg+fstAzUmu+U8Qubl/JmBgr7XwdXi4j78bTj4g85GHm2myhk+7fwS
	E28r097StBE/73qN8dRLoASpzcT3nxSLEBOjdNxV9qdyuQNGdqSP5ObkuQlQnJxAaVVqrG1TGQY
	GG8/lFtufIb09qYAcxHGy5gj06Qz+SUJ19JQqDx4DfGPXgme1i2bG8DKyJYpZZABhLgu52zMKhc
	aetSz+5jXN7QbslOU1ScO9Dutq/geI6u2bDXyIceSQw2IG+9jvl2+W4hrH7TcDwq3GwRe1AT96F
	C76EX6AovLn1DM+M6dXBDQzxxScVBm9I6dp5u1
X-Received: by 2002:a05:690c:48c7:b0:7d0:1583:4cd2 with SMTP id 00721157ae682-7d3339e48acmr245510687b3.9.1779912488525;
        Wed, 27 May 2026 13:08:08 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38be36898sm79065497b3.27.2026.05.27.13.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:08:08 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add
 initial device tree
Date: Wed, 27 May 2026 23:08:00 +0300
Message-Id: <20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDXRhkZcRSyKaQ1S0iJEenfF8
 i3+v8GjI/RQJTc4PMjTYiN4mkA3KGuQUR8NIhMyK4Rk1z4tlqEyMzJZlFrokiue9xCL1aGm87v
 VzW+/tyN227uAEB7MUA1dbwAAAA==
X-Change-ID: 20260526-yukon-eagle-658f2f81a14d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110020-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 457B55E9F79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sony Xperia M2 is a smartphone released in 2014 based on the Qualcomm
Snapdragon 400 (MSM8926) platform.

Add initial device tree with for Sony Xperia M2 with support for:
- Framebuffer
- Regulators
- Internal storage
- SD card
- Accelerometer
- Magnetometer
- Ambient Light/Proximity sensor
- NFC
- USB/Charger

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Add Sony Xperia M2
      ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 406 +++++++++++++++++++++
 3 files changed, 408 insertions(+)
---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260526-yukon-eagle-658f2f81a14d

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>


