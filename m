Return-Path: <linux-arm-msm+bounces-73837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 128D5B7FA2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E31F461E0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 01:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7250D21CC55;
	Wed, 17 Sep 2025 01:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="N5j18L6b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898A1298CA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 01:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071475; cv=none; b=DA5eX6QlEa3PYQbb0WYO/t2pL/+2YZopgZ7x8WMFxyDWaeenPBrOUggusJiFVmxk3YwiZGtILX8KxuAYdipD4oPievjLo0KVb1i21RFnYeBkaDaFKYShdju0BQ50ljn+pEeQpXpDPRMrwINXGvP0d/nCC3kxp2qW8kdyWCUDDv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071475; c=relaxed/simple;
	bh=/FmVkmoBEMyEFZyt5e3JDoIH8CgjgyOFDJbYas/fgvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GrjJ8IntFpyCVmvUt0g5KFW9SGPh/Q2AvcQGTAa9mFdbt7tkEnU+4kiL/VsMq0haCt9AubrkHlPk7ibq3i+1ZZp9vtINSW3guVFe9WrEJCKgqUvR3KA2/xgTMtuLZwC9NUePyKCt3gs7itdtnWnQEXl4U9xDDIT9nCZhUl7Vh+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=N5j18L6b; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1758071471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jlTKgWRadxT5QkMxP0BNCLF/Aqr/GkF2Ztfd0+62fqA=;
	b=N5j18L6bWvZ5uZAe0GHYB3IUzsy4IPljm7mybs3ZkjJDzkX4B3jTjjM+MQ1pKOH4JNJAyk
	4IgMORs5N/JPin4Qz4hoAHVJhKOISWcYVCJfJc5CcQJyCOzXXfc6mJ1jCfGCdoNPIBACgj
	rRVz8AsvWo5xYDzncOHb57RtpsDNEiFt4c66nTzsKpdnmCd1WeElhV5lHxcsVFdf/vDh/3
	Bdge4PDX2a/f1u5MOn/3EXMPT7VKW6kn4EPjrwpLzUAYQDqQXXtGooX8C1EiNXMwBiv0Bz
	mXOD+Xz7Bjx+wRhUIeX/ThTKPH5vdv1M+yLnSbizyRN5x4v0eJ4+yqVHRdJKYg==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 16 Sep 2025 18:09:56 -0700
Subject: [PATCH v2 10/13] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-judyln-dts-v2-10-5e16e60263af@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758071415; l=903;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=/FmVkmoBEMyEFZyt5e3JDoIH8CgjgyOFDJbYas/fgvg=;
 b=OGrPIij4pz4ZISiLtxXMLWLBj7/COyqgr5cRPvDam0jrP09Om3GVOezPIDYfTLXJVI2iSC9Wb
 9GkE+qpgyinCs1ybwQ0zmSf9IJKJs++gZ89zlXADRgOfsLLXOLkf3Kv
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

So it can be used as a flashlight

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 920a87e422518df980fd36a70b47f7b728536d23..1baec758c7d881026bf6001a0a305687d7a14b40 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -509,6 +509,19 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>;
+		led-max-microamp = <850000>;
+		flash-max-microamp = <850000>;
+		flash-max-timeout-us = <500000>;
+	};
+};
+
 &pmi8998_lpg {
 	status = "okay";
 

-- 
2.51.0


