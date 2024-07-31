Return-Path: <linux-arm-msm+bounces-27484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2AE94267C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 296B31F238F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC9D16DC0D;
	Wed, 31 Jul 2024 06:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="eSbZ+fRk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E81E16C445;
	Wed, 31 Jul 2024 06:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406784; cv=none; b=REN+TtRmy2a0ttzGTfxlBTMhfLXItKa9lZwaeqAUTOGJKqYUzcBb0Mf/rdZNqp9qEHHY7qBp5bpp39Qy6taHZvanelQOC5OrRu6oqTgQBIk961pjBK92nOUOIBwBazLZvJCH4itDHwr8SqeFktihmh6c0xDOR1HTZwICHwfCqiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406784; c=relaxed/simple;
	bh=f5zeoTB04tLRJsV6ArCgkMBLNSpD1K4LawmTzHY4Zaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TW9sWy+spXoAcbQL4FtnSlm+OuhyUQVLp+nb/CdCTcBSAY7a2PqzkLobnRWl8PJDmps0Kw7kll3Z0177+0ro+6t1BW6weznyR50Pcv1NZTFoL7CkvVElZoQcrGFg2P5qRRc9363vVFKsFMdviG01naAxX96iWyz3ySpJWzBMAsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=eSbZ+fRk; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WYhlL2BhlzDqfm;
	Wed, 31 Jul 2024 06:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722406782; bh=f5zeoTB04tLRJsV6ArCgkMBLNSpD1K4LawmTzHY4Zaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eSbZ+fRkx9QNdaTK+Bmhnba04CVGfVar9zxfY0wzc8CSb1vDEVswdBinMWiI/v1rK
	 S+NXF1U+6gY1wZ5vrWHmThQZWum3bn8iS2SbgEPLovVm9/ykpZI92A4lI/750JOAfv
	 UlDbQX2Pv2oNJJjR8RS3fLF91/3q6w/gr4UYj0ks=
X-Riseup-User-ID: 7B93F4D4A2B396377C99452AFE7B4825CB412DCD47F921405976E221EB395DC0
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WYhlH3nGWzJsxW;
	Wed, 31 Jul 2024 06:19:39 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Wed, 31 Jul 2024 13:18:48 +0700
Subject: [PATCH v3 07/11] arm64: dts: qcom: sm6115-pro1x: Hook up USB3 SS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-qx1050-feature-expansion-v3-7-b945527fa5d2@riseup.net>
References: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
In-Reply-To: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

The F(x)tec Pro1X supports USB 3.0 through it's USB-C port.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 0301f04041e7..d28b870320c9 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -457,7 +457,6 @@ &usb {
 
 &usb_dwc3 {
 	/delete-property/ usb-role-switch;
-	maximum-speed = "high-speed";
 	dr_mode = "peripheral";
 };
 
@@ -468,6 +467,12 @@ &usb_hsphy {
 	status = "okay";
 };
 
+&usb_qmpphy {
+	vdda-phy-supply = <&pm6125_l4a>;
+	vdda-pll-supply = <&pm6125_l12a>;
+	status = "okay";
+};
+
 &xo_board {
 	clock-frequency = <19200000>;
 };

-- 
2.46.0


