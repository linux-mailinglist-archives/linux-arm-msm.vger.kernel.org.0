Return-Path: <linux-arm-msm+bounces-73839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FD6B7EDAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12C51523194
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 01:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB462BEC4A;
	Wed, 17 Sep 2025 01:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="m+ice5PW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11492BE648;
	Wed, 17 Sep 2025 01:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071482; cv=none; b=WZmEJWPQD7fDamu0GtMANAhswpLDElUUBpmgw+IosFGlQAB8YkrVTbV5qg6fqvcvlIuX/m43kxwdqDTQsjlG2G1Bf3zH379hguE6nafEbtn6N+1kUByIg9aH4Z1nG7HNBNe33OP0zcUkmoAO3YqN4Hy4wgo9TxFW8w8/iEIxbTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071482; c=relaxed/simple;
	bh=YHLZqINYGk1H0hz1fmUIwha3w4JbcoCTKRM8L5WzdUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/dz7lHSdKp3WcAdtBjfkGIYd0wp1GiQtzQMGDQtWrt1fywxalQEthNUDT3Luud2jLwmtTAbU2NfpWU/NKkeFYIH/gORqeUIAl1k5tM1tr2E3CDu0XFJBoReJfTsjBcMJsHfgunMFsSbVq44TKJdiTCPgm4XnjMeXZsv7QhLfq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=m+ice5PW; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1758071479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UswufxGWEFrBrOYDPqROAB1alfGVOumzaZNgZawT5wI=;
	b=m+ice5PWlAhqB5gRatPuJ8bts1p377xtTkYVEVfb3uS1pckVow1FRHPE67tSnJTfvt0wJ6
	j/P7EzVH7EQVdCgZ3yKmKsMnBnC6XBMIVDDc7XrYGAD5lzS4AJKq64Jcaysbss/D+awQhy
	0nRrYYQh6lATvdUOsJGu2iN7YxJkTPqzOJioaBLw/1aOBmTabu8FpudUx8RIR8oltp5qUQ
	6bcsbPTolYXV4NEgAVptMwyPw68ENEIC8AYPaKFiCBv46E6gElMPPixEfcSMucxb39JDM+
	zOK9lv9ncddlcTXQqH5QICzJJ/i0/rmv4/3dYlTtA9jf3QvI6CBLmsFvJSmn3g==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 16 Sep 2025 18:09:58 -0700
Subject: [PATCH v2 12/13] arm64: dts: qcom: sdm845-judyln-common: Remove
 framebuffer reserved-mem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-judyln-dts-v2-12-5e16e60263af@postmarketos.org>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
In-Reply-To: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758071415; l=811;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=YHLZqINYGk1H0hz1fmUIwha3w4JbcoCTKRM8L5WzdUc=;
 b=+XYEEK6aymO3iy4E2XkPdewGJoBhWR6c6hrtAbpPT09Zis82z3dOtC5xV8OoLmtQHlNGz+vJL
 q16xJqDat7MBftIUOdqOd2x5X4CQf+ocNYrpURick04vLvnP1mTdeRq
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

It causes a conflict with simple-framebuffer

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index a513cd931b3a984443183ee4e8df7b0e45732630..d8ff202a68da58a11392ffeb609390a677182715 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -100,12 +100,6 @@ spss_mem: memory@99000000 {
 			no-map;
 		};
 
-		/* Framebuffer region */
-		memory@9d400000 {
-			reg = <0x0 0x9d400000 0x0 0x2400000>;
-			no-map;
-		};
-
 		qseecom_mem: memory@b2000000 {
 			reg = <0 0xb2000000 0 0x1800000>;
 			no-map;

-- 
2.51.0


