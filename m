Return-Path: <linux-arm-msm+bounces-54834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0FAA94B5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 05:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 192173B06EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 03:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21DF25744A;
	Mon, 21 Apr 2025 03:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="dI/DmWz4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CD02571D0;
	Mon, 21 Apr 2025 03:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745204972; cv=none; b=TIQTudZ+vLMQanM0iajKObhlfCoUfzgIfNIDbp7p2YQrN3BO7rGkDM1nXgvyPbx9FNIBGxFWAcKZiWYIY//nPoqBMvGLywIXsUuV7rSl0bXxstgeksxThTkXUpeLnp4gdKMih+11vOmuuEcniOKxgBm+N8mVT8kQrW/tesifm4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745204972; c=relaxed/simple;
	bh=8CGVttQ4brRRp/Et9bfjInhjPjjWXhiu3XI2uNWNBZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lmhuo2aUTWRcdXJ+Wp/fBM//rUnjzJt8hnclS1AVYvwXMDPNxlQN9SWzO8eqw/uIYVBJ1j/CEA3rsEBAz6u3hv1qtL8eiT/ez6RqRHuRFB9FBQOiiUOuvQLuVnCRKpeVKbEx8MLpbUncdvweOCG1mnZCa0c0B0FR4zBRq2pL7o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=dI/DmWz4; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.183.162] (254C255A.nat.pool.telekom.hu [37.76.37.90])
	by mail.mainlining.org (Postfix) with ESMTPSA id 095F6BBB02;
	Mon, 21 Apr 2025 03:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745204969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wv+9auBazsXKRxnpNGjY94AHAY380sF3mVbWNFTcSIE=;
	b=dI/DmWz4BMQRwpDUkcE7ume6kI/K/r36eiPebrJ69AjBWdhXGbhBlWLvgxoRGCDIUGkGB6
	zi+Y6cYXK8orlbt/YoEBSxo9ENQvDJTr+EnrGJeppDjr9E+0d9AZPK0XzTytnSwX7EttE1
	PXxWcz+oXCNEmm1VhMZs0jBeY5tnMfNUJBlH7rZsvU77mMKgagedfh6H7fhoygscamuiz2
	Qymc+iGyJ+YGBk0b+trUt6DDTIg5lLVSneD9rUSmcYiewy8dHxpBxlyxDLSF2bRm1PyvsV
	O1GOv4rN3QrjpeE8PXlfRqNlAFBCaPPNNEuzWTVMnvNh/cicBzoVeYs4SsYfdw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 21 Apr 2025 05:09:22 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: msm8953: sort adreno clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-a5xx-schema-v1-2-7d96b889322a@mainlining.org>
References: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
In-Reply-To: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745204964; l=1346;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=8CGVttQ4brRRp/Et9bfjInhjPjjWXhiu3XI2uNWNBZM=;
 b=TjyYsd76Y3LeeiryRw3AdtOVuspeapRONKo4JRNMab7nsDwXiG/D8gu1tLp+pMJjsqwxG8PuL
 S2cpia1wU0UAxBLR8M9G+Je7G9I2nNCzUdkTCHxt5I/uey7X6zCiYb6
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Sort adreno clocks in alphabetical order.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 4793a60fa946195d3220b6c44dec170d443f56db..8a7e80c959fad09f950fe202eba76d3aae01d1ea 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -1052,18 +1052,18 @@ gpu: gpu@1c00000 {
 			reg-names = "kgsl_3d0_reg_memory";
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 
-			clocks = <&gcc GCC_OXILI_GFX3D_CLK>,
+			clocks = <&gcc GCC_BIMC_GPU_CLK>,
+				 <&gcc GCC_OXILI_AON_CLK>,
+				 <&gcc GCC_OXILI_GFX3D_CLK>,
 				 <&gcc GCC_OXILI_AHB_CLK>,
 				 <&gcc GCC_BIMC_GFX_CLK>,
-				 <&gcc GCC_BIMC_GPU_CLK>,
-				 <&gcc GCC_OXILI_TIMER_CLK>,
-				 <&gcc GCC_OXILI_AON_CLK>;
-			clock-names = "core",
+				 <&gcc GCC_OXILI_TIMER_CLK>;
+			clock-names = "alt_mem_iface",
+				      "alwayson",
+				      "core",
 				      "iface",
 				      "mem_iface",
-				      "alt_mem_iface",
-				      "rbbmtimer",
-				      "alwayson";
+				      "rbbmtimer";
 			power-domains = <&gcc OXILI_GX_GDSC>;
 
 			iommus = <&gpu_iommu 0>;

-- 
2.49.0


