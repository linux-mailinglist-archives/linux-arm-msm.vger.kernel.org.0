Return-Path: <linux-arm-msm+bounces-116211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wvjPKAJuR2qtYAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:08:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 216926FFE63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:08:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MzYnb6Ns;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116211-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116211-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 452FF305093E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0395B37104F;
	Fri,  3 Jul 2026 08:00:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2E5370AF1
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:00:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065619; cv=none; b=EcNdXMiruNVvIJt9rfAJ2OceMp1k7lTxJcnJ88DW8VX5vr0BbTw7qrnIX/eVxghoyngQTBwFtgCneTeJsyb3PDnH9sfa0u554oRuZ/19bPl7/qHzSOmgBBZmx3cTSadC0GjsrGt1gMCdRg+BiI7wcm2Mc9Wt5mPnhe9NDTgWkfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065619; c=relaxed/simple;
	bh=cXawQkAkES/EtQ2U21t1nXPu9yCgC3LC/ilrBUgPwqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sAqqdOtIIFrf0kEfjNghHNs8J/ZXplrihAaK513ettFZ+rVCDmIH2u2o1eFyGgdTwGvIvJBYyEAUI9dP5yxdtOMB6X1TbpceEYgxsEE8O0QE+refuTBDtqcqmQXA63kmWq6Oq8OLOhlOTNbTMVaoiO9t8ni3hxbIcB7t7hlQcAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzYnb6Ns; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-474560436c3so297739f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783065617; x=1783670417; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qbgcaj2LDFDPaFWKXTYQNHTo75owqcWEeCmEV7+wZUs=;
        b=MzYnb6NsVHamPvRTfPGJPOrxg+08QdX6hv/F7xJ7cY7WJ+tCvrIKzdOodx6rz8/uyF
         n9xk3rAFr6iIugCE+Y44ygtx95i7h//SsGLrYdsMDh4khNlAD+PAIznNJNRVC5f2yK+V
         HbV07mAgwz9fVffNg5DscLLZBFHeOiaDsAqmHetBzdiZAsrw5CYwFqOq/u3Xn7zb9cMA
         tskY8ELh1n2KQ4Id1P42mAn7UmiSwFspN9ri+KEAoUsQ3cY3C+lRC7oPpE4V3kX/NpgH
         YxKxzOB7RuZ8esCyZNZWyIQY29Xtxka3smryK6OMJAN6gPT02muGl+cA060+PogvrqaP
         oE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065617; x=1783670417;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qbgcaj2LDFDPaFWKXTYQNHTo75owqcWEeCmEV7+wZUs=;
        b=qWWnqpKxrpbue5GGikO4szG0ZuVxQvQ6BSflh5af2cHzpTxuhCF5XJhHd01+tcYk1g
         6F6oVJbuRU3veEcvRM8H9G38RODwKTEOvgrynMUUmKe6jqEOLILFTiOmTSiqB6T3R+j/
         eQhtMsrIHM8OnDff9/x4cUPMMdYqfLr8GtORUgz4YoC2HIDFWMsby5lelize+JUUnz0p
         enKQ0PftEw6ojMwCI4BhU3T7AHDKDAOnEWIMSY1VYFU1WuEBiG8LTGZBifk4UIYGpnVe
         amB1TgY8tZr9c1kAyj1Qqf4PhVc4x3b2lhuEiMVoEl22wqNvUApKRf7Xui/gFMKCBlhp
         rbYg==
X-Gm-Message-State: AOJu0Yz3621oq3wedAYwedEhwPXT+XB0llhn8/GSHdpSX7X8pmbOVX3o
	DihKVSrMikalYmoqSCTK4k4FbMBbdr6a7NQf1Ldm7yQvXV3gqZAwXgVsrMj6ng==
X-Gm-Gg: AfdE7cldPSrGy+Pcfy0fzpZU1Q3KWiVcY+B9+bej8B2wZZaupZkznZbmKZr6U/dkOl0
	k4sRfn54E67dyEstezyAHaE2ITGJNtzzNlt0h5I7zb3ixfYydxhfwkQSdje7T8waAHG5dw7CMOB
	k85u5E+OQmWEGLHfA1I1fqii/LmWBXDQco7tghuPru3NSio/e32BPIV5P51I6FwbqAIwEWEcrdJ
	7eTYCVnhJ/5hMVbH0Vd6qH/2z8xCF6Xoaz4PZRfJ5dqYNme4w7zbGygPteDBtnqje4RCBN2BzkB
	08NL6/3VY27L2MpP4Tvb6G0l1HmBGh8IZh3VrYvh144ymr8Hiqj+/zg6p/Bj44lyIOTcVlDgcJi
	sy4P1mPdhYVvDHQg44+3lNFHuZs39i3C5SZLDlpE1PBwkxtYShuIl0fs65TpDWkg+VzYGRXm9cy
	Kd3JPnvX7OelgPxffKjQ==
X-Received: by 2002:a5d:56cf:0:b0:475:f0d1:eb5d with SMTP id ffacd0b85a97d-477b1b996a6mr9797187f8f.56.1783065616579;
        Fri, 03 Jul 2026 01:00:16 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:cb6f:2cd6:80ba:ca9:891c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477d766e0b4sm15116051f8f.0.2026.07.03.01.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:00:16 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree for SM7125 Samsung platform
Date: Fri, 03 Jul 2026 10:59:37 +0300
Message-Id: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNz3eJcc0MjU93ixNzi0rx03SQzC9MUiyTL5BQTAyWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgBZ3v1xcgAAAA==
X-Change-ID: 20260627-sm7125-samsung-b685d8b9cd40
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>, Vitalii Skorkin <nikroksm@mail.ru>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116211-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:xerikasxx@gmail.com,m:nikroksm@mail.ru,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,postmarketos.org,lists.sr.ht,gmail.com,mail.ru];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 216926FFE63

Samsung Galaxy A52/A72 are smartphones released in 2021 on SM7125
(atoll) platform. This patch series introduces support for SM7125
Samsung devices with the following components enabled:
- Framebuffer
- GPIO keys
- Hall sensor
- Vibrator
- Regulators
- Reset input
- Real-time clock
- SD card
- UFS
- USB
Along with that, SM7125 was affected by a hang when launching SHM
bridge. A similar issue was reported on a similar chipset:
https://lore.kernel.org/all/20250721-sc7180-shm-hang-v1-1-99ad9ffeb5b4@trvn.ru/
Add SM7125 to the qcom_tzmem_blacklist to avoid hangs when booting.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Document Samsung Galaxy A52/A72
      arm64: dts: qcom: sm7125-samsung: add initial device tree

Vitalii Skorkin (1):
      firmware: qcom: tzmem: disable SHM bridge for SM7125 platform

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  31 ++
 arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  31 ++
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 518 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.c                 |   1 +
 6 files changed, 585 insertions(+)
---
base-commit: 6eb8711ece2ce27e52e327a5b7a628ed39b97f45
change-id: 20260627-sm7125-samsung-b685d8b9cd40

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>


