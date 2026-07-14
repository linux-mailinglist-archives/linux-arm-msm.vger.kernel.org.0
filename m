Return-Path: <linux-arm-msm+bounces-119034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h/7QMNM1VmoA1gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:12:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D5E754ECA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:12:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qMJNRbOf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119034-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119034-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49C2C325999B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE99246AF0E;
	Tue, 14 Jul 2026 13:05:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F321D46AF18
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:05:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034312; cv=none; b=bdb4Wd93Q6mo6XMlzGYDbwExrYFvmM0KdGW/79vCbmyvWsStMaJ0Sf08ka+fxeHJ3YxYlXsc5ucM/AGrDaQAw1ij17KyW4JIY401Ipk0TQcwYbAJaILrGo6iXqLEDFSf3lggPiJ2keEGErd02rgwn1Ymx0K8MEJFJrnrimrEnaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034312; c=relaxed/simple;
	bh=VOMTGOfRoJ5Rdr+KHFMcafRgWYnlPdDlGpYkrvPKcNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z/Vuu35MzJ4Y/Qllw9q8ztqLdVaOl0V4evua24HlS2O66C5MjKP68I12oiZAq7Y8kTYDuvmhP5Jf1APoYyZHKDHxMMcegSk85yG+ihC37NIEsRqX0ZdstYcl53k+xAQv9vdkjqm7/ItdTbf61YHpccK8lHWf/9zggDv1vyB4BAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qMJNRbOf; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47dec32798aso4367610f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784034309; x=1784639109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WL8L6KsMjnQpZyewy/NTC9SiE2jOxkz1VcH1kHCfURE=;
        b=qMJNRbOf0M3w285d9KLTy+aAEWflNl/ve2n04STE9l5unPMpEjihby5Tn/gBIhk44j
         mfBg25qG7bAixlB8Q9NNF35oBJHyfuvHF01hAPjDqb7Gmuc4kNoS4cPC4jYDp9g0Xqs6
         axt0ruLReZadA/rIxF8sNhg0zWyC6BQTWgzI2mYf1poQzCKx89woMcFD6K4PK5VMmeA9
         QLlzVx1uB3nQs9S8XJ4Rq35Thqj9tQon+mmFMap0Fv/xd4am7j3YsNGdpfWgyPDDE66c
         Po8/eaolGAG6B1CDSeDqtYKKWGxdBPF4CVJe5a+os4V3kqB+qTfiZnoeXq4bBdFT9Klm
         ZmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034309; x=1784639109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WL8L6KsMjnQpZyewy/NTC9SiE2jOxkz1VcH1kHCfURE=;
        b=eD05UgjCTRE4Zw0Rjdw0BVtShaZtEF/82Ui5oKMjoBfopz1IKRmJ+lkLl0p73MuD6t
         bswteycn1kJxSki3zZ9NgToAM9bh1No9/l8AST/cNbCAxl6HuTu/W2/x44ZCwRZzbf0x
         Kxw8w+l4IDAocR6IacikQ5todri2syMQ7nvKoGny1i2P+FRoifAvfVSreViffcnbCfn1
         teZXyjyUjfg6EAV4iUkgPrNOrvkd7fkJ2rOdOdVeatMwvIOmoaRQ5a9/kS4RQZw0/a2c
         zRBlAgJ1xCK5WysYoW0SpDb7VLJCvPJU+ZnnQ4ko6ReJyBVjOykCla0xLlVLcnVkY9m/
         uRag==
X-Forwarded-Encrypted: i=1; AHgh+RoFu9aSdThpSiuGGaxkAz7Ed34/qb9zInRqgN2Plx3lN9bAIHju/9ioQDHlhR33pPUTcKIUL7mFLQfVeXHi@vger.kernel.org
X-Gm-Message-State: AOJu0YzeiVQ5opcH+7SPI7Wl7R3wXh8F1lXzLU5ywF5nISeqsPRjj/lP
	Zn6PQ548P6jwF2bTJz8vyB03DBvriX5/15VbXz4QrQIpACa2MMwXmcKUNLH1Ug==
X-Gm-Gg: AfdE7clN49nLfqPv8UAz0oZOPYUsSKwPQBGDwo2ex28qC0HvSdiOigof6Jaw5kY8gxl
	3dnxiHNodXEYJ2eH/bTIo5Poc7BAZ60Dcx6U+Q5sSQWyDwkmOCu2onmA9Od4gatwSz5xWBb+Upf
	LjfHR149RaQTMekRsQk5qOHAxSU5wVU6Om66RCoJ6eWVytUGfTBDdmT+DQe3I+5NXH+2Qjm3Y6t
	kJ1wk9vdymigUkvH/Jm9Wn0VaCnGDIWcdiVqQydCqtLPn9TUygClwAW8GHFJhbR73UuSD5e8CYj
	wHpkAya09kAw7Yi9vefmmIvLqVKhn+GWgnHFNx5+R8mvkJ3ESNUaYftGUedfDAr9qMLIxKLZOHS
	M4G7rWYalK5bbf13Sou1d4hVKT/veMqPwajHEaHFqpSE3gkqupUkiOM4WZYHs86HjhQ3HNv0Ik+
	bOCsHErXu+fgIu1lbquAXsbFTSw3ZbBw==
X-Received: by 2002:a05:6000:2207:b0:46f:7d90:811c with SMTP id ffacd0b85a97d-47f4885699cmr2979583f8f.13.1784034309005;
        Tue, 14 Jul 2026 06:05:09 -0700 (PDT)
Received: from localhost.localdomain ([151.27.210.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c30a9sm7670107f8f.31.2026.07.14.06.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:05:08 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
Date: Tue, 14 Jul 2026 14:58:04 +0200
Message-ID: <20260714125806.310708-1-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119034-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:oleksiionchul@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiionchul@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiionchul@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26D5E754ECA

Add initial support for the Xiaomi 11 Lite 5G NE, codenamed lisa.

The supported hardware includes regulators, UFS, USB, GPU, remote
processors, Wi-Fi, Bluetooth, touchscreen, flash LED, thermal sensors
and the hardware buttons.

Link to v1: https://lore.kernel.org/all/20260711184934.55701-1-oleksiionchul@gmail.com/

Changes in v2:
- Drop SD card support because card detection is not reliable yet.
- Constrain the UFS VCC rail to 2.952 V.
- Drop the unused FSA4480 interrupt.
- Add the touchscreen pinctrl state.
- Reference the reserved framebuffer through memory-region.
- Enable ramoops ECC and use decimal notation for mem-type.
- Allow the unused camera PMIC regulators to be disabled.
- Document all GPIO reserved ranges inline.
- Replace underscores in node names with hyphens.
- Drop the unverified USB limitation comment.
- Drop IPA properties now provided by kodiak.dtsi.
- Drop redundant USB role properties.

Oleksii Onchul (2):
  dt-bindings: arm: qcom: Add Xiaomi 11 Lite 5G NE
  arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/sm7325-xiaomi-lisa.dts      | 1106 +++++++++++++++++
 3 files changed, 1108 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts


base-commit: 1c553b3d0cfca9cac2186daea6e2f81808ce7d8b
-- 
2.55.0

