Return-Path: <linux-arm-msm+bounces-90592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AMXH+qXd2n0iwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:35:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF648ABB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D8F2301CFF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 16:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF4A34253A;
	Mon, 26 Jan 2026 16:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="X2n1ouzp";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="wXk4B3vH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BBF340298;
	Mon, 26 Jan 2026 16:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445329; cv=none; b=F2Fzfs2P3sT5JVPmqcGsbCMy77p+avcJKfVIyKZFaBiauB+SBevya1BIcbSncDWShKTH4LFn40G304rQbpsGy6q/nFO0rLH02pxiM5Ks19IHUQHjLb2Jh0w+51UULwzgPZkEbOpT1OttfOPNoDMUYtW0F7I1z3fRpBgulrzGcQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445329; c=relaxed/simple;
	bh=bm8kFrAljREFT7X0OXbNyMmjsEJiPsk99UNFXaev5SE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hFu3TbGaWQ9DkJx2fkcMYkbyhmmC6EaNaZUpYvRDFWkVP52jLs7ejQUKxm7YIjGBOvxreVH8Jsx5g1Dx2oCGqp1IdvuPgaznqcXKx24tFOjTt5WbWEaWWeS04uZ2fs4FXHSq2ZEd4+HtAVOr3WxiTywSln7Jxaky28usiXwyVyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=X2n1ouzp; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=wXk4B3vH; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1769445294; bh=81qBTX0uQZYtXRZJscu2FoC
	nk8QfLTOi8lBcM6tJ260=; b=X2n1ouzpSiLpJnv8IX88FPCg6bp3bxAotenQ87q6vU02pEWNNa
	5uAiPWNIQksnj75IbhuIM5kAKRCjyRQZELX89ymV23CnxxX2TRzceGTwQxPDXzxmDi9RfFAvzll
	aV0sDmadNZ/ij7sgt9BIgBUBIClcDSfyI9cLabpK2pcUReHd/Y+ZYB++8hgkPvxKnkFmnWQIlwr
	Y56/84dU6IIXh3AlvUpoXVFs9u0tef5TuDZzbBik58Xv9BfJ+P9s5M2jrypOL/fvL5FiTxqcfRB
	q7N2gGGM3ZAPEFY18OE1Kf2IFX3zRZbHVBYdaLPzRCSVJKXhClb2sTWaT8qyK+Fegtw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1769445294; bh=81qBTX0uQZYtXRZJscu2FoC
	nk8QfLTOi8lBcM6tJ260=; b=wXk4B3vHUzVmvVN6jqJx3cYS2jL04d7oooi0+f7As5piF/K2Hx
	KO+qpu4rk36ca4wsWnhw1eAwq3HTePHxx6AQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH v3 0/7] Initial Redmi Note 8T support and more
Date: Mon, 26 Jan 2026 17:34:50 +0100
Message-Id: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XQ32rDIBQG8FcJXs+gp0ZtGKPvMXZhkmN7aBJXT
 dN/9N1nWgajuxG+A/78jjeWMBImVhc3FnGmRGHMYfVWsHbnxi1y6nJmIEALKSU/kwsD8RP1fTh
 xpWxVgRdgNLB85zuip/PD+/zKeUdpCvHy4Ge5TH8leJFmyQW3qJTRdm30ym4GR2NPI43bMsQtW
 7gZ/hL6lYBMKL1WHhsj2q75R9yfFSMejnnT6dmTDZiSe2xaF+/ZriTAWiqwQpegpLCWA9/H6yV
 dp+DLfbjm19KeNiGl8nB0fRuGoczHx/IFjUvIlwlNdeGVNI3xvm3Qm87oRnTWalFJ6yvRORRos
 MLO5Wr3Hwt408yMAQAA
X-Change-ID: 20260111-xiaomi-willow-448552f02762
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales <semfault@disroot.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769445293; l=2505;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=bm8kFrAljREFT7X0OXbNyMmjsEJiPsk99UNFXaev5SE=;
 b=YQ2CkTN+AjGCRdwRjvHn4DmdFZNG0OOOLEk22YPIrFAWsMg07i6cisXT4nI25pTOhmidvqM0E
 gMU/DV8gsqnD95qxMipFImZoHqxZzu/Qhz3SC2Wd08t2yIacg85Y2oN
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-90592-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,disroot.org,intel.com,igalia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 1AF648ABB8
X-Rspamd-Action: no action

Redmi Note 8 and 8T are sibling devices the only difference
is Redmi Note 8T have NFC.
This patch series is commonizing Redmi Note 8 devicetree
for a base for both devices.

The patch series also contains some fixes for Redmi Note 8:
- Fix reserved memory ranges, they were wrongly defined.
- Remove board-id, board-id is not neccessary for the bootloader.
- Fix reserved-gpio-ranges the reserved ranges was wrongly
defined what caused the device crash on the boot.
- Remove unnecessary usb-extcon, gpio102 is related to DisplayPort
what is not supported by these devices.
- Use memory-region property for framebuffer.

Depends on:
[1] https://lore.kernel.org/all/20251229142806.241088-2-krzysztof.kozlowski@oss.qualcomm.com/

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v3:
- Remove unit address and label from frambuffer node.
- Link to v2: https://lore.kernel.org/r/20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org

Changes in v2:
- Fix copyright in sm6125-xiaomi-ginkgo.dts as requested.
- Use memory-region property for the framebuffer.
- Add comment about the NFC.
- Remove msm-id change in favor of [1].
- Link to v1: https://lore.kernel.org/r/20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org

---
Barnabás Czémán (7):
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove board-id
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct reserved memory ranges
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Set memory-region for framebuffer
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved gpio ranges
      dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8T
      arm64: dts: qcom: Add Redmi Note 8T

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +-
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 301 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  | 285 +------------------
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |  15 +
 5 files changed, 320 insertions(+), 285 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260111-xiaomi-willow-448552f02762
prerequisite-message-id: <20251229142806.241088-2-krzysztof.kozlowski@oss.qualcomm.com>
prerequisite-patch-id: 1bc49c0e2bec1a47667df776e1ab265b0699ea35

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


