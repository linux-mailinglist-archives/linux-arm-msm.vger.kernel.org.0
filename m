Return-Path: <linux-arm-msm+bounces-81957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 241FCC60E69
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 02:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 329D94EBB88
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 01:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17C51F7575;
	Sun, 16 Nov 2025 01:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="eZAqF4Mu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE891E1DE9;
	Sun, 16 Nov 2025 01:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763255621; cv=none; b=ohRdUJOtdrFEdW72nXkDhSTOBfh3dMULAKnRVI1kPKG/wQUEUqrSyDaD406ZSj9v68mpXGe2Tbt9GZ2I5lnvmsatyeJRbUgsDCGd/38JytDlkODg024cDr1IQDSr0y0Ivpjq4U6BuQ5MHYbBohKbtt/0VTJLgKGpcKhoHqAtWX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763255621; c=relaxed/simple;
	bh=oKjm2pBf2aAQQKHvfSrwj82kDinKyncuoesGVBSNX74=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d45AqLFgsM6BF7rN+J5El2ifiAb3iAJWLHKdUh/7Q87KNEHUaeebsDlnaf1pMo82mKoTtROZUrHx208zyl3QirGFPFXTlmoMx1b06bz/dI/7REmkagGGElahOb9XuvC0qG7X5Fl/Ruw+lFv1Y3Jk43b4d+J0wwRVJJ45Rm5//xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=eZAqF4Mu; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1763255607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a4PXq7Rgx8/hRFwiVk4QQ8umfI2YEPdEWl4yazxnH7w=;
	b=eZAqF4MuNIos9EB/3lAFcWKniOb4Wo6Po5DEtnIt+dTBhdy02/HQKQzGsqPI1f4Kiq0E3V
	9yIeyl0oNyQrMvrYdFY9tSrabHGb99NdH9CVk/x/YBn7H6lOkxwuZNWIT8+8F9VigTz8o5
	ryQ9mNBTAnIdb2Fhm1SEzVZZF1wWgdJ79eUAlMOz9uELktHPsGOx/XXBYNzjG7qVyuV8ss
	Vsk9ic3TAr7blfkQdnulhv9t08k5ZFNRD6j3OSvqV7rODY4t42IuB7W/oufbsM/WmUJ4Uv
	9Q2ailkeB7BpWOGHXtRzZHzptCfC0ztPrBdXWYRRykLcyWkur5GzyuQF10D6IQ==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH v2 0/3] SDM630/660: Add missing MDSS reset
Date: Sun, 16 Nov 2025 04:12:32 +0300
Message-Id: <20251116-sdm660-mdss-reset-v2-0-6219bec0a97f@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAlGWkC/32NTQqDMBBGryKz7pT8aJCueg9xEXXUUDQyE6RFv
 HtTD9Dle/C97wAhDiTwKA5g2oOEuGYwtwL62a8TYRgyg1Gm0spqlGFxTuEyiCCTUEKlK186b2z
 dVZB3G9MY3lezaTPPQVLkz3Wx65/9V9s1KtRl35XkautG89yipMXzi1KUe+QJ2vM8v8NTUbG5A
 AAA
X-Change-ID: 20251031-sdm660-mdss-reset-015a46a238b5
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>
X-Migadu-Flow: FLOW_OUT

Since kernel 6.17 display stack needs to reset the hardware properly to
ensure that we don't run into issues with the hardware configured by the
bootloader. MDSS reset is necessary to have working display when the
bootloader has already initialized it for the boot splash screen.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
Changes in v2:
- Added "Fixes" tag, pointing to commit which is the root cause for
  exposing this "bug", which is only present since 6.17
- Extended commit messages
- Prepared series using correct user.email git setting
- Link to v1: https://lore.kernel.org/r/20251031-sdm660-mdss-reset-v1-0-14cb4e6836f2@postmarketos.org

---
Alexey Minnekhanov (3):
      dt-bindings: clock: mmcc-sdm660: Add missing MDSS reset
      clk: qcom: mmcc-sdm660: Add missing MDSS reset
      arm64: dts: qcom: sdm630: Add missing MDSS reset

 arch/arm64/boot/dts/qcom/sdm630.dtsi         | 1 +
 drivers/clk/qcom/mmcc-sdm660.c               | 1 +
 include/dt-bindings/clock/qcom,mmcc-sdm660.h | 1 +
 3 files changed, 3 insertions(+)
---
base-commit: 1cc41c88ef00de0f3216c5f4b9cfab47de1c49d3
change-id: 20251031-sdm660-mdss-reset-015a46a238b5

Best regards,
-- 
Alexey Minnekhanov <alexeymin@postmarketos.org>


