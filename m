Return-Path: <linux-arm-msm+bounces-54835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C187A94B66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 05:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 487893B03BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 03:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875C52586C1;
	Mon, 21 Apr 2025 03:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="bmmBAkN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE54325743C;
	Mon, 21 Apr 2025 03:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745204974; cv=none; b=LmepqQdl4stKCpxOLmLMbYB7fKyj9cQisvM18VLgThJiVg5iR3AZfXSbiqU/2J6d5gqYzBtJGjTqrDWheBoppNFumYUVgMvexIN7k0tnl8Kd5laiort8o+FhJ92a80bwvVCDwOodR22jhz9c+2BV8qGzAdtaiPFDbQ7l+9l6UzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745204974; c=relaxed/simple;
	bh=fAfyXieDjeLVW7PmrL+oK+9YbBprYzNzlpQ7ltV8A0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hcT7Cw1IIDEFX3BW2Fp8JflyWDQq0ovexjdYcOBrJIWkIZGqpX9kVL94NFg9K+gxvBKKNuEKRsZr9cYrgTFRoGEHSoTJ3y15pE6/FizcIpP0kon0Hqq9Jvo+GQ+jMcfbRY/p56fn1XQS6hALwZ4G033hrTKXCowALNX1WUyAwuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=bmmBAkN9; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.183.162] (254C255A.nat.pool.telekom.hu [37.76.37.90])
	by mail.mainlining.org (Postfix) with ESMTPSA id ADECDBBB03;
	Mon, 21 Apr 2025 03:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745204970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D4erXkx1N6odG+LR0LejQIlj+eK/ZO/Lp1JgPLjIo9Q=;
	b=bmmBAkN95K4IlrqMxNY9XRjPbRR7+U9XQ1PN253AF6O+qtZ/rJ2zhkfdBuujpGAjswLrk5
	uc2dsvR+fC5qjaRUWDwvgNhR98xeuuN3dp5sJSBdtuC96w74VTehS4kSC7FgQDnSqexoxc
	Lq2KADQU1Lm8/0KUCYsQsIjoenI/eeqZnKUJ4twcgFlIPOY1WcBZbbh7Be6Uk0Q4rrWG4W
	VS7iUEhEU3MtgKez7B5XoZUKtkxnsOjvxTNdLnepRgfOysoen2GwhkSzYHcLUNZQ9GUXvG
	7BpoFv64ZFzt2luPMYJ1CqSwgyorNPrEQ17kK4ZBdyfSGm02+W02HLmz6T3fnw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 21 Apr 2025 05:09:23 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: msm8976: sort adreno clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-a5xx-schema-v1-3-7d96b889322a@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745204964; l=1290;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=fAfyXieDjeLVW7PmrL+oK+9YbBprYzNzlpQ7ltV8A0Q=;
 b=k+ltu8PJiKWj7fBFhPfjLb0vyR3IdskK9K/Dotz1CAdug3F4FC1aBBsn6aKX4LIQxplwPNPg5
 2kURV563nu8CQVvBohjt8M6PWcd+KTqeVtpyZvpvbGipgmfjYTTsLcg
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Sort adreno clocks in alphabetical order.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index e2ac2fd6882fcf47e846a92d45e0fcb9beba633a..86a9d24da0faab2dc7ecc53d60aa0c78703eef91 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -1129,18 +1129,18 @@ adreno_gpu: gpu@1c00000 {
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "kgsl_3d0_irq";
 
-			clocks = <&gcc GCC_GFX3D_OXILI_CLK>,
+			clocks = <&gcc GCC_GFX3D_OXILI_AON_CLK>,
+				 <&gcc GCC_GFX3D_OXILI_CLK>,
 				 <&gcc GCC_GFX3D_OXILI_AHB_CLK>,
 				 <&gcc GCC_GFX3D_OXILI_GMEM_CLK>,
 				 <&gcc GCC_GFX3D_BIMC_CLK>,
-				 <&gcc GCC_GFX3D_OXILI_TIMER_CLK>,
-				 <&gcc GCC_GFX3D_OXILI_AON_CLK>;
-			clock-names = "core",
+				 <&gcc GCC_GFX3D_OXILI_TIMER_CLK>;
+			clock-names = "alwayson",
+				      "core",
 				      "iface",
 				      "mem",
 				      "mem_iface",
-				      "rbbmtimer",
-				      "alwayson";
+				      "rbbmtimer";
 
 			power-domains = <&gcc OXILI_GX_GDSC>;
 

-- 
2.49.0


