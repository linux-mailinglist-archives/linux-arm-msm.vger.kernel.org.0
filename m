Return-Path: <linux-arm-msm+bounces-103632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JYlIwUS5WmBeAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 19:33:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED55F424E46
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 19:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99496300C58B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 17:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CAF2D9797;
	Sun, 19 Apr 2026 17:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7lLwrQy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF7F2BE621
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 17:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776620025; cv=none; b=mMhVB2mCU09sx436m1P6EVW2TvMaag8Q/9lW6eru9dCLIsfzh5NXHnD9KZasQs0jx0R1ITA6IZAp2e9frX3JVDI+YPDBHPMO76S8tFeqysRt7AdAOwq5fTac6H79rWcOTkKkBiAkE+NmAA6IVf/drAhgndogMoeUmTrOhN535Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776620025; c=relaxed/simple;
	bh=VfP9+j3JJS8OnZilAvB7Mr5mri02iMAluBnOBrDPduM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jHCjBGOPJoy5quNYZ1xmz5uWXOOdtq80Ah/2nUu8Uq7XG8BoHmmC6b11t0TGioJFRW9j739kp83dDN/uThPzdSTa9Y+a/AlRVNztoIh2nCpl+sqaOMYzn4ajGoa/uXbxSGGc6S/XJuik0Xbcg58jzak9DY3FmGUx9SGt7qkFwOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7lLwrQy; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-823c56765fdso922494b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776620024; x=1777224824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ3KdgLgxvb6g2g/BE5TW9o0z4+hlSLHmQpjSJrtIyY=;
        b=B7lLwrQy+xsG71sV7qOh6U0lnpQpJHKd5MoqUei2eguOaSjCgtiLmnXFPZVQvFdkXa
         plMvO5wBliQtJa0sPqbdX6n4DZojUUZM9x3KWQtqmcPEIKSmJcqGpbRvCQVu8XGG9diH
         9NrVP3QBjxrq1J5xnree5aAIcSYUCbhZ0qDL6lRel+McVcDaNPvHGqzuVXVYiM13xkwv
         8daJtHCB4jDNdbrmfM8nXv/a4e71s5eqfqV4xt4zL2qakjJWxFBUw3ciclCQoh6MOVce
         eUMm9ZNfp+fsBHhIpouvdtQ16iQqRo9pRXTSNtwcGIW99tFEtETL8hEzIHsAgiFoGZV5
         ER1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776620024; x=1777224824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZ3KdgLgxvb6g2g/BE5TW9o0z4+hlSLHmQpjSJrtIyY=;
        b=ZEOwQU/UUlzmSSQIOqdNyGs5ts9GeET596bZhKPWcYipdHvqrIL2ol/+ofCxpN0Xh8
         CLROV56jGf7yQYaGLlLRBG07zJEK/6MZQFC/gW8qOGmKkqiswmDOq8z+Mx3pt8WLmDpE
         2nWTdlZYCCeJxcMsrhX/pnbQ7sR60BW7VT8x0kgxetG5ByMjshQLaBGznm3DKH8WHM7P
         FUG5AwXlqVjbziodaVMfHTiELJtfC9jPIi2VIlJSrFrW5RzSSOAtqip1jFsaKgItH1rW
         S15+LOtYHtebHn+eej5EwMRhRrG9w+7CRgIRkLFU68QONhS2iuC+MczUQbyPDVa6XJP/
         VdIA==
X-Forwarded-Encrypted: i=1; AFNElJ/mLINz9ORgf+TH6BUs3qe+fKuzXv7lBovir7XrxTEsr/gazcdrGCzDkSlqZw0SYPWtiZK1tzaCiC8Fur2Q@vger.kernel.org
X-Gm-Message-State: AOJu0YypcJYAsy77AXbcjnDbC023jICJ0ocrgnY4XD51Od4UhkI75eIV
	UkWN9RAhsZWOB5i8hw4a0n870Miyf6fjfTrjM1XjHAq37+LvuOq0ljaa
X-Gm-Gg: AeBDietkPri2vXaGbl1Tllggm+RRpuc7n0IVTRVpyZWj3GeqYziP08IQxyJx+IAsUY6
	kGlNaIrWxBTwAuNMSkAuH5JMXn7PjQ1tbwyuBq0pG4D0Q3Af6iD2sfW0UliS6a98kaBnsOSxtN2
	pByKKndeKD3SCuB8equ+XErzKXB/GuZR1b1PA1GaTInge7RbLaOUAWmtaC0u2OYQqtZaptSV8Yc
	/UYSiX84Wau9mNEhiyf/wKeKdYSn0640MLdimCKKa0SyGgC+rM1B0FYhnYE8bpwapKnmAOxkqTL
	J++3W1cG3GUrn74iwBbX4aOs8lYSBIQ5OoKXxtrDBTeFEE3dS1hwpnhd24TmFWaPaD9G1AqPpTk
	cN7TpQup+ZIyGu6ltt3uw5RvdztXM+6uOPtEzV7PWjkIR71rIhYzYtnUWSze7CdD4bxgFq6QQFU
	5vqQLiBv2m9IW2SA==
X-Received: by 2002:a05:6a00:10c5:b0:82c:d7c4:4c57 with SMTP id d2e1a72fcca58-82f8c830fcdmr10858118b3a.19.1776620024073;
        Sun, 19 Apr 2026 10:33:44 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::6c5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe40dasm7954833b3a.40.2026.04.19.10.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 10:33:42 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sc8280xp: add several missing pdc map entries
Date: Mon, 20 Apr 2026 01:32:49 +0800
Message-ID: <20260419173251.1180026-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-103632-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ED55F424E46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

pdc 215, 256, 257 are missing, but we can find tlmm pin 103, 84, 90
are mapped to them respectively, so add the map entries from pdc to
gic. These entries are reversed from .data section of qcgpio.sys

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 8d526ffede36..fa1bd27aa16f 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5365,7 +5365,7 @@ pdc: interrupt-controller@b220000 {
 					  <211 699 1>,
 					  <212 705 1>,
 					  <213 450 1>,
-					  <214 643 1>,
+					  <214 643 2>,
 					  <216 646 5>,
 					  <221 390 5>,
 					  <226 700 3>,
@@ -5388,7 +5388,7 @@ pdc: interrupt-controller@b220000 {
 					  <252 798 1>,
 					  <253 765 1>,
 					  <254 763 1>,
-					  <255 454 1>,
+					  <255 454 3>,
 					  <258 139 1>,
 					  <259 786 2>,
 					  <261 370 2>,
-- 
2.53.0


