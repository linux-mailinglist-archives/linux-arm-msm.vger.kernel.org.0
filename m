Return-Path: <linux-arm-msm+bounces-65261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A446B077BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 16:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC235502FA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957C02264AE;
	Wed, 16 Jul 2025 14:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b="Mnr57y0R";
	dkim=permerror (0-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b="lvf5iBdm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.adomerle.pw (mail.adomerle.pw [185.125.100.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7804C1F8BCB;
	Wed, 16 Jul 2025 14:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.100.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752675268; cv=none; b=AuoTY2nAfbY3NZNd/gSjHgJuMTyIrMXHRLLvVw9rjLBvGU6J0QPdSmCBk+8ZxrlD8Z9xrtk1rDKewQNWVC1mUaZ9CZg6n8Lo4Du88c7Mk6hZcGQgpJKRrQpjpDzBkNrNFnxJtYXxlKG8/q1avA68CTdsVp2n36m34XWcZXvjC+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752675268; c=relaxed/simple;
	bh=kqK2z9lgFIWJo+iSpG7dDDrEyat9VsjegBJv/91Cuhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4r2ErA4ySQhyHACxX7GF/8qxGL2s3RF6G8232+x7vYgCSXhc7k08vZnYFzDyE/GgxWPxk2sLavQc+4Z/NOPhV+HA0yPh++oWAj1jjikATywkknH8ZE+P5NuGxpaFjeCG0TE83AxE1bssLoeiclHYTkEFXM0gpDQxgx8tCULP2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adomerle.pw; spf=pass smtp.mailfrom=adomerle.pw; dkim=pass (2048-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b=Mnr57y0R; dkim=permerror (0-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b=lvf5iBdm; arc=none smtp.client-ip=185.125.100.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adomerle.pw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adomerle.pw
DKIM-Signature: v=1; a=rsa-sha256; s=202506r; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1752675259; bh=eeXTc7+cYCPlzD/JL5Y751j
	dK1FWSKkt9rh8C37fSXE=; b=Mnr57y0RBvU0r0/W4yMHgNOfETR7ACEVk14eFDaxpjoKYrVHJh
	Rev81MZtWrc/Yn7hziMFdDySOvIy/w8wNuop4a4xvggoV8rQ4G8XVaWifV3r7fIXEbFg+JjjXtG
	SoDFfvQ9IBoBwTZcveqhkYyYi5cVDMZLhn46DRRoLykVFQ/axFEmWn7tEdDsemdAS3Kuhxood3A
	ErGZj3u7YO6wM0dAWg7HaCqXexuGJYyP6IwTwwsSK9rzMlyScX3Ni8kVlyCawscRGSJwN8sqKOS
	iYtOPAVYFIjkCdj+RDK3HFGmuZjycuYbNAZJjehr9xijLNaazTvilQe2HykRmzGm6Pw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202506e; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1752675259; bh=eeXTc7+cYCPlzD/JL5Y751j
	dK1FWSKkt9rh8C37fSXE=; b=lvf5iBdmaLKti5cndMJ2tYEJ1/h07u3jdG35XvdV62wOQh3OqF
	FbUELmXwDtc2+LLUZBewGG91sEPjGPNXBCDA==;
From: Arseniy Velikanov <me@adomerle.pw>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luka Panio <lukapanio@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Arseniy Velikanov <me@adomerle.pw>
Subject: [PATCH v2 3/3] arm64: dts: sm8250-xiaomi-pipa: Update battery info
Date: Wed, 16 Jul 2025 18:10:41 +0400
Message-ID: <20250716141041.24507-3-me@adomerle.pw>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716141041.24507-1-me@adomerle.pw>
References: <20250716141041.24507-1-me@adomerle.pw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added max design microvolt. Merged battery info into one node,
since pmic fuel-gauge uses mixed info about dual-cell battery.

Reviewed-by: Luka Panio <lukapanio@gmail.com>
Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
---
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
index c2d0f0254776..4ad24974c09f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
@@ -49,18 +49,12 @@ framebuffer: framebuffer@9c000000 {
 		};
 	};
 
-	battery_l: battery-l {
+	battery: battery {
 		compatible = "simple-battery";
-		voltage-min-design-microvolt = <3870000>;
-		energy-full-design-microwatt-hours = <16700000>;
-		charge-full-design-microamp-hours = <4420000>;
-	};
-
-	battery_r: battery-r {
-		compatible = "simple-battery";
-		voltage-min-design-microvolt = <3870000>;
-		energy-full-design-microwatt-hours = <16700000>;
-		charge-full-design-microamp-hours = <4420000>;
+		charge-full-design-microamp-hours = <8840000>;
+		energy-full-design-microwatt-hours = <34300000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4370000>;
 	};
 
 	bl_vddpos_5p5: bl-vddpos-regulator {
-- 
2.50.0


