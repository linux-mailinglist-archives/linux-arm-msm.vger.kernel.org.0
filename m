Return-Path: <linux-arm-msm+bounces-24792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 295F191DC1B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 12:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52AA61C20B54
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 10:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8CD129A78;
	Mon,  1 Jul 2024 10:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="AdzFlVXn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0453E38397;
	Mon,  1 Jul 2024 10:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719828623; cv=none; b=PBZVR5Nf7JCWPgfaD0pYmRhnCKojxcMKMlc3Gv4nEQGbA/E7OUwDNMPJBwfxq7NKGG1622Fv/Pe+6JJU6HMsWl+EZOESNuZCjb/f2W+jU+KS85MDpREnpSf5R1zbcX1sFwXxbT4fqFfY8Ej/fFP3mWTU2nwdGIDfAQv3lSr6zbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719828623; c=relaxed/simple;
	bh=3RsDpfCoTAZ3q1FNMCir3GnLeMMkBWdgV78aDzg85+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bB/5Ool42tUYVeRICnAf/6MM6gTrMuEsrxGlvAXmYZLLfvD2F2MWmnfFZDTYJGkUyoQ1Ed0boYCCrtnIyOLHrICVUQu3a4qoYJephnmFhlotXGiL61xQI8e0MmmVqm0kT2RK1DSea17FXtF9xNY2aiYanYfoNVjV8uQrLxwT4PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=AdzFlVXn; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WCMHC0fCCzDqh4;
	Mon,  1 Jul 2024 10:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1719828615; bh=3RsDpfCoTAZ3q1FNMCir3GnLeMMkBWdgV78aDzg85+A=;
	h=From:Date:Subject:To:Cc:From;
	b=AdzFlVXnCppvzWVbrzh//iVrRDRZSf40pXrYiwxVDwzhCAxHtWvldkLicD1ixBpV+
	 Eta5GCfLmvF2ZqO60c6WNwnu2ZYNmaSkBR5ATIAAX6/3W9QqXG+UANPG9QJs2Qh4jS
	 Pg1NsCmOqNVkhISHTzem7/LCtNO4XJ6lxnrdGsXY=
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WCMH35p0Jz9vXW;
	Mon,  1 Jul 2024 10:10:07 +0000 (UTC)
X-Riseup-User-ID: 1D35BC222651F46F43E4F43BC3D5A4A6C635349B67A1625C0F0EC58AC523AE47
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WCMGn5hsDzJrqG;
	Mon,  1 Jul 2024 10:09:53 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Mon, 01 Jul 2024 17:09:42 +0700
Subject: [PATCH] arm64: dts: qcom: qrb4210-rb2: Correct PMI632 VBUS voltage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-qrd4210rb2-vbus-volt-v1-1-5c06f8358436@riseup.net>
X-B4-Tracking: v=1; b=H4sIAGWAgmYC/x3MQQqEMAxA0atI1gbaUKx4lcGFrVEDomPqlAHx7
 haXb/H/BYlVOEFXXaCcJcm+Fdi6grgM28woYzGQIWe8sXjo6MgaDYQ5/BLmfT2xJfKNiz5OcYC
 SfpUn+b/bT3/fD7xOmVpmAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dang Huynh <danct12@riseup.net>

According to downstream sources, PMI632 maximum VBUS voltage is
1 volt.

Taken from msm-4.19 (631561973a034e46ccacd0e53ef65d13a40d87a4)
Line 685-687 in drivers/power/supply/qcom/qpnp-smb5.c

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
In previous patch series, there's a suggestion to correct
PMI632's VBUS voltage.

Unfortunately it didn't make it and probably forgotten.
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1c7de7f2db79..1888d99d398b 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -305,7 +305,7 @@ pmi632_ss_in: endpoint {
 
 &pmi632_vbus {
 	regulator-min-microamp = <500000>;
-	regulator-max-microamp = <3000000>;
+	regulator-max-microamp = <1000000>;
 	status = "okay";
 };
 

---
base-commit: 642a16ca7994a50d7de85715996a8ce171a5bdfb
change-id: 20240701-qrd4210rb2-vbus-volt-822764c7cfca

Best regards,
-- 
Dang Huynh <danct12@riseup.net>


