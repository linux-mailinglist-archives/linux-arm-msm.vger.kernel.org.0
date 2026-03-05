Return-Path: <linux-arm-msm+bounces-95675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHEmKJK+qWnNDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 18:34:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557A2164E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 18:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68B233122CA0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 17:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187CB3E122A;
	Thu,  5 Mar 2026 17:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="DJwabuWU";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="3QjMSCW5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53A8313540;
	Thu,  5 Mar 2026 17:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731749; cv=none; b=nt0WZbKf4Ogw0dJ4fMqdwTWh0QbcpcSDszv4aLgOPtYSq+LR0yWy/1nPx79T+qNBamlvbUjhy5NJ2dBdsXXk96oJBmRD4szKFzj9Wyi64+3Yl17ehLRApjPcjqbSdxcM83ei1PZY74yoQYe55PdZRbvGtef28hLQd1Ng9W+QOx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731749; c=relaxed/simple;
	bh=zcJSmOmN3xafWLxMlqnYXDawmBYO+JKoYNcl0mT8OP8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lAthomPqO1sWw/81AkupUZs9S0bjgEUSkvMOojOxYwhscI7XRXrLEf57Z707RdP0EFQE041Ih89L1NZ2CjvhXf2BPBuiFV4av1z3x2vn6JV49ZvrSrDtlV13l05Q6MUYhey+MnEHrTrQ000cV+49OHTf6dEReeWQcDqNcAMSqB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=DJwabuWU; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=3QjMSCW5; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1772731726; bh=N854RCmLSX8Z2Z+/ygFlUEq
	5mRJryu/DCluuMqOr8/Q=; b=DJwabuWUL+uyIfwGr5TkKtC8MyynZ+QKi4xwTmPlIiWdRvCcxK
	Ke1jPmgz6cQBCYCWbOl2JQ8aarohY/dCbdzwKXNgF+Fr8/v9Sr4uWMkQM9mbHUkR8XOahkV/GuA
	nS0VLZ9aJmvfxdDui+MAWglcFZwDMK4ZyBrnubk9Hu/zm+oM9PuxJ2q/Gdxre+qirgg1xhwS5Kv
	tEtBrJg62xmPVu9h1bI9X330SG9qUHg9IyRdAxY6WmD9JMQm9vEGQtBADkuT2QJ/5geUz4jg4Oj
	Ax+1GeBrrN7MbyKReUup6jbnuSPePUVIT5cViFJo/2sRGfHRYAltz3JQBnNZY3V/Zvw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1772731726; bh=N854RCmLSX8Z2Z+/ygFlUEq
	5mRJryu/DCluuMqOr8/Q=; b=3QjMSCW5BCnJOjr803/M/Rb2Mijtx4qgYNvZHWLb/2IUgLxaUz
	fDgum8VYydHBk6bSe5m7DHcOdLpbyF8xljCw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/5] Commonize Redmi 5A for 4A and GO
Date: Thu, 05 Mar 2026 18:28:32 +0100
Message-Id: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMT3aLMskTd5Pzc3Pw8XTOzVMtkSxMLQ8tEEyWgjoKi1LTMCrBp0bG
 1tQCFwAvsXQAAAA==
X-Change-ID: 20260304-riva-common-66e9c94819a4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, phone-devel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772731726; l=1366;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=zcJSmOmN3xafWLxMlqnYXDawmBYO+JKoYNcl0mT8OP8=;
 b=/VvWKjz8Qgp3zfnRjx4oYNpdxyXmxUH315XBy0+4uhJfq8LBHNagCl1ksrhkr/fk8EnCsIoiZ
 Ukmvn6EiEL8B06rgXCVSbS+ujqqWqqbOO4b4vBnJ72btfToeGPbOQzF
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Queue-Id: 0557A2164E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	R_MIXED_CHARSET(1.15)[subject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95675-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mainlining.org:dkim,mainlining.org:email,mainlining.org:mid]
X-Rspamd-Action: no action

Redmi 5A is similar device like Redmi GO and Redmi 4A.

This patch series commonize it to avoid code duplications.

Differences between 4A and 5A:
- Different charger and fg
- Different displays panel but same resolution
- Different speaker codec configuration (awinic-mode)

Differences between GO and 5A:
- Different charger and fg
- Different speaker codec (aw87319)

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (5):
      arm64: dts: qcom: msm8917-xiaomi-riva: Commonize for Redmi 4A and GO
      dt-bindings: arm: qcom: Add Redmi 4A
      arm64: dts: qcom: Add Redmi 4A
      dt-bindings: arm: qcom: Add Redmi Go
      arm64: dts: qcom: Add Redmi Go

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi  | 333 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   | 304 +------------------
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts  |  19 ++
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts  |  27 ++
 6 files changed, 386 insertions(+), 301 deletions(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260304-riva-common-66e9c94819a4

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


