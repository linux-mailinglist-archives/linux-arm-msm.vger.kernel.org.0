Return-Path: <linux-arm-msm+bounces-65259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3565EB077B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 16:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 756D916FB89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CCE224B0E;
	Wed, 16 Jul 2025 14:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b="FscqjAco";
	dkim=permerror (0-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b="1USMiIpy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.adomerle.pw (mail.adomerle.pw [185.125.100.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F23C223DE9;
	Wed, 16 Jul 2025 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.100.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752675268; cv=none; b=BR1S+UIEutGjgZ6+nv1txAzkIKTi8E5fGaV4oVgbvlcYhu1Z11qr6O4aDUNIaJzCWlxGM+uU4b2OShmy0780V7M2KZj+kK3wi6JVWteXopOJu9ON/cFCjxc+XfM1khHZNk3mo1EHjix0nj1AjOgJWORkQYh1xKA2lLmlQkanKxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752675268; c=relaxed/simple;
	bh=oC0XTtISJxvo2BCtfjAODIWn/3GJDhfvusuFz82KB4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CisJaM7UDm0tF1n4qMTxEnJuP2LH91BL8/C1Llp3Z3ybyUn8DB1loYgljKmIgD1+A/aHL7GuujLJ7FuSI/YOvuNvHhee0ihy46p6dKH2iC+igiFdzRgP8OBRHNnbP90tH4jY3x7pVtnBDVSCmQcEGB08WcdQQ8jchaCCJO1IYRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adomerle.pw; spf=pass smtp.mailfrom=adomerle.pw; dkim=pass (2048-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b=FscqjAco; dkim=permerror (0-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b=1USMiIpy; arc=none smtp.client-ip=185.125.100.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adomerle.pw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adomerle.pw
DKIM-Signature: v=1; a=rsa-sha256; s=202506r; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1752675258; bh=vRAcQX40/n5jNFVH3L1NqOG
	4Uzww5QWT2UB0HV+psgk=; b=FscqjAcofc8NIa6CSy81xvAA+H39VPgquIDAtJtjTy6f1MK9Xg
	gWyzZ5KEFyB1ey7Qogyx1qMmgO8AiduTUCpc3CQ/2GrV4Laiw7xtpBhv5b58HrAEWUY1kYIX9Jv
	uK6fnRwprbOI2R2owPmgZKHZk/A9g5yHEtand0pv7yVIUF/pXdKYMYu/sxwIPVCMW8fBEMpANxC
	vMxSM+EBwTQvm7TP/SgeHrnwUJynBcpnciGmGbrPQsymQC/rD5J6u1Kr6WlRq++z4YU5JoO/pJG
	R/zOJ3ImOWe5dgPGhmUKy1kZSAEk/ZooXaY8oipNDoG9NgkkCtvI7aadQjh7tEknLxg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202506e; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1752675258; bh=vRAcQX40/n5jNFVH3L1NqOG
	4Uzww5QWT2UB0HV+psgk=; b=1USMiIpy+6jiU9FYdkjYch8HmmwT9NSPgJ5JgS3+YI40Jv3XRH
	3yKt0kALHmFnkamClI0r6hRe8efp9sGvwwBg==;
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
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop unused bq27z561
Date: Wed, 16 Jul 2025 18:10:40 +0400
Message-ID: <20250716141041.24507-2-me@adomerle.pw>
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

It looks like the fuel gauge is not connected to the battery,
it reports nonsense info. Downstream kernel uses pmic fg.

Reviewed-by: Luka Panio <lukapanio@gmail.com>
Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
---
 .../boot/dts/qcom/sm8250-xiaomi-pipa.dts      | 22 -------------------
 1 file changed, 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
index a4c8b778ae46..c2d0f0254776 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
@@ -437,17 +437,6 @@ zap-shader {
 	};
 };
 
-&i2c0 {
-	clock-frequency = <400000>;
-	status = "okay";
-
-	fuel-gauge@55 {
-		compatible = "ti,bq27z561";
-		reg = <0x55>;
-		monitored-battery = <&battery_r>;
-	};
-};
-
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -465,17 +454,6 @@ backlight: backlight@11 {
 	};
 };
 
-&i2c13 {
-	clock-frequency = <400000>;
-	status = "okay";
-
-	fuel-gauge@55 {
-		compatible = "ti,bq27z561";
-		reg = <0x55>;
-		monitored-battery = <&battery_l>;
-	};
-};
-
 &pcie0 {
 	status = "okay";
 };
-- 
2.50.0


