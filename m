Return-Path: <linux-arm-msm+bounces-111038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EdMLKrxXIGo/1gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 18:35:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBE0639C89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 18:35:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=QYtq8dt0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111038-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111038-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B3D730010E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 16:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1073E9C08;
	Wed,  3 Jun 2026 16:34:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound11.mail.transip.nl (outbound11.mail.transip.nl [136.144.136.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4DF39A079;
	Wed,  3 Jun 2026 16:34:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780504459; cv=none; b=cXtqQpCdL6AN0/2SHNZ5lss7FdbT9N6pmUztk6/IKT29R5braRWpniS+0HXnIyIogayUrJkVF3QoXkOkiyG4wwbLnHUFvGduvwHE3gRuukCV9wkGryN5vFxVTb1gA/IH9D8slpttfVKVoYDTAqwT4BN33taTudoeUjLeM4d2pRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780504459; c=relaxed/simple;
	bh=Ls9YNOyjqv9xby3NHUrvlbaMuhPviQdZ1jA4wXVtXcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WW/8CXnklShBjRs3IgRVeKlOgpGYHPCzpcYstXUJVs4IYvT55qWZ0+9badYEMJtah2a7vQV2azAMTt+jZW4xJevMIHXJ8bKRkWTxCVNv2TOmTnML3m8nURUtUsatObzgr0XjUPnKeYkHDMDgBFmQDr3u7aYseIdx7OiLBhdkJjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=QYtq8dt0; arc=none smtp.client-ip=136.144.136.18
Received: from submission3.mail.transip.nl (unknown [10.100.4.72])
	by outbound11.mail.transip.nl (Postfix) with ESMTP id 4gVtZC4YVkzkQNbM;
	Wed,  3 Jun 2026 18:34:11 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission3.mail.transip.nl (Postfix) with ESMTPA id 4gVtZC0gbrzf52bM;
	Wed,  3 Jun 2026 18:34:11 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: djakov@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 0/2] interconnect: qcom: add MSM8x60 (MSM8660/APQ8060) NoC driver
Date: Wed,  3 Jun 2026 18:34:08 +0200
Message-ID: <20260603163410.2312712-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission3.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780504451; h=from:subject:to:cc:date:
 mime-version:content-type;
 bh=jjeoKzD/DVr/ENOQbG3qxugLqPPqGCnMqtxH85Fdlsc=;
 b=QYtq8dt0YlGMjuNFg3/C7t+T/EpEahJNsZqntn5e3s0bXM7tsSRG2cBwPc9Vp5AuOIR9nJ
 wKF5azVnfx8lebPdwCHgScTtzQjUspv0t1NCVbITOdn0rzP4XJx1daMgCZAq5z75I0S5Uj
 Dv+kKVUgpkvGCImd6TEGptOj9pqDhMUDTMganMf28BRhEuU24W6ahUo8dx3k2LOeEMRB+I
 wWOvsfyoBrMfrp2lYX3ezjGADog3uJ1GsaR5V14+ha+j/saUMyOHyHA3f3xs4WE5sQJJ7B
 OHugFKHMVjyEWDaXSwvbatvZ98bWZ/D1UogdlgFee+uorN1Oei+30vR7rMOL5w==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111038-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	DMARC_NA(0.00)[herrie.org];
	DKIM_TRACE(0.00)[herrie.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,herrie.org:mid,herrie.org:dkim,herrie.org:from_mime,herrie.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DBE0639C89

Add interconnect support for the MSM8x60 family (MSM8260, MSM8660,
APQ8060) — Qualcomm's Scorpion dual-core SoC generation used in devices
like the HP TouchPad, HTC EVO 3D and HTC Sensation.

The chip's Network-on-Chip fabric is divided into four sub-fabrics:

  AFAB  - Applications fabric: Scorpion CPU + L2 cache, paths to EBI
  SFAB  - System fabric: DMA engines, SPS, USB HS, LPASS, MSS
  MMFAB - Multimedia fabric: MDP, GPU, camera (VFE/JPEG), video codec
  DFAB  - Daytona fabric: eMMC/SD (SDC), ADM DMA, USB voter

Bandwidth requests are committed to the RPM firmware via its shared-memory
arbitration tables using the qcom-rpm driver backend; each fabric also has
a bus clock whose rate is derived from the aggregated bandwidth.

The driver includes a 384 MHz bus clock floor, replacing the previous
266 MHz minimum that caused USB starvation on real hardware, and careful
devm/device_link lifecycle to handle EPROBE_DEFER from both RPM and
clock lookups without leaking clock prepare/enable references.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>

Herman van Hazendonk (2):
  dt-bindings: interconnect: qcom: add msm8660 fabric IDs
  interconnect: qcom: add MSM8x60 NoC driver

 drivers/interconnect/qcom/Kconfig             |   14 +
 drivers/interconnect/qcom/Makefile            |    2 +
 drivers/interconnect/qcom/msm8660.c           | 1147 +++++++++++++++++
 .../dt-bindings/interconnect/qcom,msm8660.h   |  156 +++
 4 files changed, 1319 insertions(+)
 create mode 100644 drivers/interconnect/qcom/msm8660.c
 create mode 100644 include/dt-bindings/interconnect/qcom,msm8660.h


base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
-- 
2.43.0


