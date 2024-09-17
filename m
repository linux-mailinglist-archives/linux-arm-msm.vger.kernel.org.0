Return-Path: <linux-arm-msm+bounces-31878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11597AACD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 06:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BADBC2861B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 04:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD7E4436E;
	Tue, 17 Sep 2024 04:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiZ5JmKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDC02628C;
	Tue, 17 Sep 2024 04:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726548516; cv=none; b=kAm82ER1/klocHtcPFo/FbP667sfyAPtluCWdOcUDYHT76eNaH6NzA/5BF06qgThZWMey+akPzGxycelzOSBbAdJAGe+YjNMRNbsuAgr2QORrTlctCm0pN2RyjB09aILkZIZMx1W5GEjzc2A0zI/SBLAmRpV/2o+2SBkRkRd5o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726548516; c=relaxed/simple;
	bh=oKSypXT+O8xQvmO/3o+T7oQdtJbsfOnu405VHrNJ2/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bw/UEQbaWYjf+wNwwQo0BLzIiKvVLvifo31xdKMKLnmV79IBJaYJtr5RI0FLOvXcsXOwaqEz7hVG04siiczs4CoZN+qcxJC7lCGQDEH3hUFKKoxeog/iWd/JqLqpJ3RC/yyUmjVrSq10dDTKbySAQ9BnEbOEa0JDjI+4AFEwQeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiZ5JmKs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12457C4CEC6;
	Tue, 17 Sep 2024 04:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726548516;
	bh=oKSypXT+O8xQvmO/3o+T7oQdtJbsfOnu405VHrNJ2/Y=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ZiZ5JmKse2G8sBLbuwLAYoeqv+SaUpZjTqjQ28g2XS+gSY6g2AnJ/UQTyxEHDFkhT
	 wmPUYzCiWS3Sg33QxtQHeWyTz7EZ5cvnCSOP5BYVOC4DElmzeIBJ6Qkhp/08takHSM
	 XIFPyoa928G1fNnuhZ0X/m9CD+XLc7pEgLVxAibUZpCnfp2Hkrb0NgR3y80bTjM1jV
	 Qk3w7lylzhTDLo1KlffuYUQBhqECgVrWyVTZWK1BjmHcspaL81kM1nWFp1NmDPF5k3
	 QQDZqlpB5l7P1UTeyEQIrT8KxN+d/rX30Fygac9FMXOhGw1CTenlxe/wgg9/3/F8hB
	 vRmJoe7CBfNZw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01828C3ABAD;
	Tue, 17 Sep 2024 04:48:36 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Mon, 16 Sep 2024 21:48:35 -0700
Subject: [PATCH] arm: expressatt: fix pm8921_l6 regulator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240916-sd-card-regulator-v1-1-669533c393d7@gmail.com>
X-B4-Tracking: v=1; b=H4sIACIK6WYC/x3MMQqAMAxA0atIZgO2iFavIg6hjTUgKqmKIN7d4
 viG/x9IrMIJ+uIB5UuSbGuGKQvwM62RUUI22MrWVWcaTAE9aUDleC50bIrUGts4T3XLDnK3K09
 y/89hfN8PdF7ctmMAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726548515; l=930;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=0szhZ8yMa3ObS2XdUtiow/IhLUveGGFKEJjNsTf2maw=;
 b=zNZLIIpIV6we+iuTTRtSItw7FtLYgumjoSgbLi6eTwkq4WKZbzffar16BnHfZ4QK7tk/HS01Q
 QuBuG4fSa8ZDOE4oAY+BHc1JYdUFaFw+/e3ulBI1fONbL1rE8DFREcP
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

The SD card refuses to work because the regulator is turned off. Enable
it by default.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index af6cc6393d74..13c102a562ab 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -253,6 +253,7 @@ pm8921_l5: l5 {
 		};
 
 		pm8921_l6: l6 {
+			regulator-always-on;
 			regulator-min-microvolt = <2950000>;
 			regulator-max-microvolt = <2950000>;
 			bias-pull-down;

---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20240916-sd-card-regulator-a71268ca47e8

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>



