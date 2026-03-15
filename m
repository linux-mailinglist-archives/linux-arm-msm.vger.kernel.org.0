Return-Path: <linux-arm-msm+bounces-97720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMY+Lu3dtmlMJwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 17:27:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E5F2916A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 17:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6B27300A531
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 16:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2567D373C07;
	Sun, 15 Mar 2026 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Rfb1pYIN";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Os2jTDuv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E425C372EC7;
	Sun, 15 Mar 2026 16:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773592003; cv=none; b=Ki0VPMLG4us32RjyLSXTPjDSXkGSFHb4kzPp0/ePnON+s0HSlbvTb6hrWJUVBzz5IQEPXFbiSRWsNdu+/Sy/mqCdSLbPg49F6KTkEHweLGaKEVIWyuGLhEzFC1XVBEk24eYNuzyaX44eD6ADRpk4tBzBWvljoVxDlu+Zo4rUpog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773592003; c=relaxed/simple;
	bh=Qv/0mt3K1ZGVC5zwWg88s9g1sE15YjvjmlLsD4egYVU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iGWXLxswARA2RfYRIyAG07eOXkcA3M4al9vy2ZUmMYPj7EmAjvo0PFYloDKgFBP0EzhRYiSqfvo6DsBBZmPdnb2hy2j8CWLM3okc39VctuUmIqP1NlrRsaZuHahqJu+b8Ngzd88zzB7lsUbFH58L5UNXYR22mjoL8XgQLOP/pDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Rfb1pYIN; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Os2jTDuv; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1773591983; bh=9MDuQpXz9EY+lYi48n7MBX4
	3xM7tnzw19M/+uYyQhv8=; b=Rfb1pYINC/6mUxJsweatSGw1rrluRwq4mJfMzcHl9+NUb6UJYJ
	044PrwuHo3LJvOnEqef8YgWa3N9IjrZNNgoMcqA6uUeR4ltIXOSKdq3tU3Y9OC+Ba4OJvufvrWY
	DtyGJsz1HRaX5fKc6M0PVoGWp3s/rRRLYHSKS6rPj9mJ8HknIy7oafs6T60Dwc378+fxLXcbmVx
	/JVjMDaz+MHfbpz6aQNynakcS6aEjSii1IqmZ6TK0nl77j1FmqccXF+M9/DZOn+rRdqx820tiUA
	lFk5TQ2ZbXk97okJd2wYNVeB5/VU/vktUOuKTKXseA+/s0Mw8/uh7MUM3oLb58BthCw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1773591983; bh=9MDuQpXz9EY+lYi48n7MBX4
	3xM7tnzw19M/+uYyQhv8=; b=Os2jTDuvfnX2msi6qCtZRQiKgmmN0gcLYQCaBNG3S36j6CcO/s
	SlRcMIevCs8WggRzuWCV43F0GzYrims/bnCQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v3 0/6] Commonize Redmi 5A for 4A and GO
Date: Sun, 15 Mar 2026 17:26:18 +0100
Message-Id: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XM3wrCIByG4VsZHmf4b2521H1EB87U/aBpaEgxd
 u+5QdDo8P3ge2aUbQKb0amZUbIFMsRQgx8aZEYdvMVwq40YYZJwInCCorGJ0xQDltIqo0RPlRa
 oPh7JOnht2uVae4T8jOm94YWu69dpd06hmGDBpaNODB1X6jxpCHcIEPwxJo9WrLAfgJI9wCrAB
 2dYPcu+7f6AZVk+wfQJ3OwAAAA=
X-Change-ID: 20260304-riva-common-66e9c94819a4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773591982; l=2496;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=Qv/0mt3K1ZGVC5zwWg88s9g1sE15YjvjmlLsD4egYVU=;
 b=eFTzWe6qxFDimuq27B5zcMCRaxIJ+iGL7LdfIQvKTwFKWiu0nuluShv75xhChi2UHCcDaVxUl
 3vMRbb96or7A+yheioAQ9/SnlsxccB6N4V63gVUdc6a+xq9lzoQDW20
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Spamd-Result: default: False [0.41 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MIXED_CHARSET(1.07)[subject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97720-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:dkim,mainlining.org:email,mainlining.org:mid]
X-Rspamd-Queue-Id: 36E5F2916A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Redmi 5A is similar device like Redmi GO and Redmi 4A.

This patch series commonize it to avoid code duplications.

Differences between 4A and 5A:
- Different charger and fg
- Different displays panel but same resolution
- Different speaker codec configuration (awinic-mode)

Differences between GO and 5A:
- Different charger and fg
- Different speaker codec (aw87319)

Additional changes:
- Update Redmi 5A board-id for support nougat and oreo bootloader.
- Add Goodix touch controller support for all variants.
  The necessary touch controller can be enabled by devicetree overlay or lk2nd.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v3:
- xiaomi-tiare: Remove l23 regulator override, add min-volateg for l22.
- xiaomi-riva: use generic names for fg and charger.
- xiaomi-wingtech: Use memory-region for framebuffer.
- squash riva addition commit to comminization commit.
- Link to v2: https://lore.kernel.org/r/20260310-riva-common-v2-0-3bfc23996857@mainlining.org

Changes in v2:
- Rename msm8917-xiaomi-riva-common to msm8917-xiaomi-wingtech.
- Split goodix touch controller addition to a different commit.
- Disable touch controllers by default.
- Split new Redmi 5A devicetree to a different commit.
- Fix Redmi 4A board-id.
- Update riva board-id to make it able to run all bootloader version.
- Squash the devicetree bindings.
- Link to v1: https://lore.kernel.org/r/20260305-riva-common-v1-0-436f1f4b7399@mainlining.org

---
Barnabás Czémán (6):
      arm64: dts: qcom: msm8917-xiaomi-riva: Fix board-id for all bootloader
      arm64: dts: qcom: Make a common base from Redmi 5A
      arm64: dts: qcom: msm8917-xiaomi-wingtech: Add goodix touch
      dt-bindings: arm: qcom: Add Redmi 4A and Go
      arm64: dts: qcom: Add Redmi 4A
      arm64: dts: qcom: Add Redmi Go

 Documentation/devicetree/bindings/arm/qcom.yaml    |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   | 310 +--------------------
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts  |  15 +
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts  |  20 ++
 ...iaomi-riva.dts => msm8917-xiaomi-wingtech.dtsi} |  61 ++--
 6 files changed, 60 insertions(+), 350 deletions(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260304-riva-common-66e9c94819a4

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


