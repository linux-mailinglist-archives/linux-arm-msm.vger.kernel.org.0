Return-Path: <linux-arm-msm+bounces-115579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fs98JYaxRGpjzAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 08:19:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1096EA284
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 08:19:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=xUq1NEcx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115579-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115579-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 854DA3037832
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 06:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C043AE71F;
	Wed,  1 Jul 2026 06:19:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA27A3AD51F
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 06:19:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782886777; cv=none; b=LJr+tr5NNJxguUKTBIl+rNKCvk+2tsubkD4cBAOQTL2YXm4m11QJYSKQqc3Cynq9hdxPTqeV6xF+ZT/lJpph1el/bEBHVn+Rbsz9/UHpDsxNLzH2P9wm4bXS5xQ5uzJlq7dLE5RcyhQIwHBlic0TKYTXwWKFKy6SwsZ5thvG3JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782886777; c=relaxed/simple;
	bh=y35146R1hLQHr0cXVvffTxW+/OTdywP5qn459ftUbR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TzJbPQAAQTbGmUSyEu0j0FGFC7+3y9Tx0MCTiwXZcy4ZARF/MLmz/VNZR/8PAepLR3gltkCFY+NJJAqxVyr48YBp2NV6W9D7ePoe3Ac4N313qWIywf6Fg+SSySYnUO7SVPuZPIxHN2/4I/l+aj6OH2GdnDfyZhxyy9urhz0Ieo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xUq1NEcx; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-473ba028d46so216451f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 23:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1782886773; x=1783491573; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+PbsLJCR1LGXeK1bTzaX+dlzYS17E09lgiH/dHDN2c=;
        b=xUq1NEcxIq0ESL4lfVzuX73zd+FCW6ZoU08QsS1bk8p0eewqXjlrHh/BV9bjWIRJsO
         YVSNhNje4IpOtEUNHDI58wNU+6T7BUZtkNK8aZdpzFp+DH/L/0OXp2HnKNux9pXg1Bvr
         GLHxfCVr0PJD2a7KIeHgDRlFrX+c20UHLfhopyfkKchefnNxYs4k5sPRIeu3XEKBQ0Nn
         6SMmq8XxtAyDyzrU5oJ5t+9zAeaem5vwyBZ+MVRNJESuksfshgBpt831epMBBOkyMKKP
         /xtrpOo38R8NvISqS9+r9mT6UA4dfbSjlnaRNM4D0hxK8N2br1szu+CemwTQZbND4f49
         hXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782886773; x=1783491573;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+PbsLJCR1LGXeK1bTzaX+dlzYS17E09lgiH/dHDN2c=;
        b=S966THZnmkA0Jdy59pa1mQNNx9J0iit7dWZDUHhzh52SK+VEqR01/9ToZRh2iVdyPL
         b3v/D+sYvoBncH5EAZbv5bGXTxAwZheEiS/gCiM5dAODea7zWrJtCF1UZsungNoLGxA0
         9CbzEM6FZM9rpUuFFHbj7nm9MeZKv4VhuPllMJV0FDZVRYFXGBWqRgtn79OjSVPECYSQ
         GbBEZFwo8neqiNsNszdPoLAnZana9YqYPJpuMHtXiI2k76Co39i/gjcHYPTR7u5IWSVX
         CvSPsZEoBwBH3IrZ+m3hP0GsIXwncdNZFKcY5TLdb01G5Q024ARqMreWBMH6LP0VNV7R
         dpYA==
X-Forwarded-Encrypted: i=1; AFNElJ+fya63fOsJY1vCHnduj7L1qb8ZmmkgZyrl0zVLvZSTcpYNBgDgUcLU01erJQiO7d9FsQ2w/LdM0eU6v+mp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0w8/HJ+OS57fb60+T1QHWSNqnVMDVTby+qGiiL4gSd2siRkHu
	tJVSMDaaCEI5UhOERm5A80AoQhfd+4Qw23uUP9aKIQSdPGombahDtzCSDDKMia8FjOM=
X-Gm-Gg: AfdE7cmpadFAU14MrPo4z/3gA+MNl3ofdsufrRP+9VzAd/uVIwVkwkHToGZ0/xeWdfw
	LuKFFSPCaH9aDU12a/vyClRj86O2jpse6YVRA3JfJEVAv4eJNFOqwEEQn/Agvj2gqhYZfTA9ttK
	mIOg3AiJiXOKP/NlUxo6ocg3JKr0cNTy0/cCnolv1LSlbzbRWwCVWyrGicSGHAvwCO5TRHfE6f5
	2CC/jne+E8USIRF42BlpkpubO5uv8oCADRwZersJe+DMvzpQ/P/qL/OjsSwAF03yhSnVEEquotl
	dtm8sRSt6mtHrIPq1L1S7efE75IA5qxLr1r+Z8DlJgImwtYAJsiTkRsNrR+qwC2r4SuDYreFVIk
	r5u0XzsbfgW4EOfIEbLdQQ/WC6fmWzfXi+NoHPxnEdtbLGeU+RsXnEXnPjZv6kdMmvY+5k/zlO/
	1cnTQ5XZGYOkwv5Au0Np0=
X-Received: by 2002:a05:600c:c046:b0:492:4668:27b5 with SMTP id 5b1f17b1804b1-493c2b3d3ffmr2644035e9.6.1782886773243;
        Tue, 30 Jun 2026 23:19:33 -0700 (PDT)
Received: from [10.33.0.72] ([212.133.41.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d194b0sm14748608f8f.1.2026.06.30.23.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 23:19:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 01 Jul 2026 08:19:30 +0200
Subject: [PATCH] clk: qcom: Don't use all caps for Glymur GPUCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-glymur-uncaps-v1-1-5f7065348eb2@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwND3fScytzSIt3SvOTEgmJdyyRTYwszE9M0gyQLJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAHjbmdRxAAAA
X-Change-ID: 20260701-glymur-uncaps-9b538645f0b8
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782886771; l=1097;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=y35146R1hLQHr0cXVvffTxW+/OTdywP5qn459ftUbR0=;
 b=mQrz1gNPzurdTuK+gXJ6oSM7mBxuhXNjzjZoHt5+V/7V1w1jwV2UE9wRxS5ime2wHKmUg+QDK
 BN1QGSiW8PrAbsH6RKrNTWZV4Mlh56gWTl0qGGPjVJaqfciqq3Vsqc+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115579-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luca.weiss@fairphone.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,fairphone.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E1096EA284

All other Glymur driver use "Glymur" and not all caps "GLYMUR". Align
the prompt and help text.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 7d84c2f1d911..4169ecd95ef3 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -65,11 +65,11 @@ config CLK_GLYMUR_GCC
 	  I2C, USB, UFS, SDCC, etc.
 
 config CLK_GLYMUR_GPUCC
-	tristate "GLYMUR Graphics Clock Controller"
+	tristate "Glymur Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
 	help
-	  Support for the graphics clock controller on GLYMUR devices.
+	  Support for the graphics clock controller on Glymur devices.
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.
 

---
base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
change-id: 20260701-glymur-uncaps-9b538645f0b8

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


