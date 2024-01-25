Return-Path: <linux-arm-msm+bounces-8254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A4083C335
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 14:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CFA0290778
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 13:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132C252F61;
	Thu, 25 Jan 2024 13:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KnljLQej"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A495100D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706187999; cv=none; b=exf/ZGBKjkTV8ULe3/951JEtbUWwoZKp5FkivdtUUR76Lq3Tl+8K57JTcUkDxWzXo826oePuMPz+KB1DRpJIHCExe1g0d+SeMrQTfI3ryz3C/Md+hB2DxqTmVb99IH1+qd9Ppy5eAQQVjyhappiDVQD+/qzCt/fvW6lxGxET5tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706187999; c=relaxed/simple;
	bh=sjcG4/ma8tbyKCoCrDYR6cljyYo1p8TcKJd2Kq4h5p4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ylv0/UxPyoFt4h6pkY/DkUrwfSedZHj19eLaq2Ow7DKcPg9+QvX/+zAbGMsZKfsMEbMiaj3OpEGyOw7gFa9NaqLhEsgI3H/gLSW6Fy30VfdiEOklXA4hO0z3y5o+LwJqEnFEr/7PUEwwCsB4W48IkLpd3nWLND8RqzRm2qrBZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KnljLQej; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51005675963so4741629e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 05:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706187994; x=1706792794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvAgZjjRyxLIBC3kWs0rtcbioAlmCOgsCMgReuWOJMg=;
        b=KnljLQejq5KVvMTcizplQ82oe0zzPZYF+egkHv79rVJCwtLSlHRNcIPZfv+RraK2Oe
         6I9/eTPi1s9R73AklaYFwTxRPjnJE5tPe0urPC8owl/SNyU9pfil8P5IrpXepGgvQ2TQ
         UDrdHdCu1+LQIZzBZplpyN8i/0js2gjb04UwfSpl1bqMs2p8O8oMeYk0A96XfbS95uNx
         LqQHCtEJMEUrXtRaIyISY2AcoZqylV0+r+dAsSE6ehb6W21wBilqhhuKGv4U6dN3bKBC
         X0ub3opOWyDIWdfzRcnXGQaRQ2yXZAD1gaiVPm47Eotg76PIcCjmoq1mwEXXbl8EphrW
         qatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706187994; x=1706792794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvAgZjjRyxLIBC3kWs0rtcbioAlmCOgsCMgReuWOJMg=;
        b=vp3TaoCv688HySmzWxmiBIcg++8pCSbAfTMwR2tN0fGMqopJT364VdsDlxPgHG8nRn
         C2TlLGLt8GOjWD5SXyLERxNkOxqz9GMexb3Zrun0yV2iid3antpXeyblNj4Z46OJ0ma/
         0snjPUCsoErmR82h1MOR1BKpca19e5NZrbZszYjAvRv+HurwQkzJPfNWchkWYKvU2kiN
         clIQhPJLrz4jQWkLM9StPIJtS2AGxqCPwePbExOR1y6gNEOFRfKlMuI8oB+zo+i8aMa5
         PdD75RCLmCmSV1hSrsvPHksOppUu6U3Z2sqJ6LTcwQSMH1hxq+bFS7W709TZfD3yClLK
         O24g==
X-Gm-Message-State: AOJu0Ywahi3tF0yrBGPR7c1acufNB2Eg3T7XeUqC9J5HOK2Blj4a9kty
	AYcgyZW8FJM29TJVLEulnsZRkbPwG7w9r+EZRKWXPgOVkA6CccZCDXkwQ8x/y9k=
X-Google-Smtp-Source: AGHT+IHeqsfvStR29s4hQlPs85aUPuq3ZzXN7r5K/d5JmfyVgUb613Q0ZSrMwcyHZVWL9Y5awD9/KQ==
X-Received: by 2002:a19:f016:0:b0:50e:9356:da5e with SMTP id p22-20020a19f016000000b0050e9356da5emr332993lfc.122.1706187994265;
        Thu, 25 Jan 2024 05:06:34 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id ig1-20020a056402458100b0055ca5ce62ddsm1873315edb.12.2024.01.25.05.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 05:06:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/6] arm64: dts: qcom: sm8250: describe all PCI MSI interrupts
Date: Thu, 25 Jan 2024 14:06:22 +0100
Message-Id: <20240125130626.390850-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org>
References: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each group of MSI interrupts is mapped to the separate host interrupt.
Describe each of interrupts in the device tree for PCIe hosts.  Not
tested on hardware.

PCIe0 was done already in commit f2819650aab5 ("arm64: dts: qcom:
sm8250: provide additional MSI interrupts").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 760501c1301a..41f5e6eb2f6b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2248,8 +2248,16 @@ pcie1: pcie@1c08000 {
 			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
 
-			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0", "msi1", "msi2", "msi3",
+					  "msi4", "msi5", "msi6", "msi7";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
@@ -2349,8 +2357,16 @@ pcie2: pcie@1c10000 {
 			ranges = <0x01000000 0x0 0x00000000 0x0 0x64200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x64300000 0x0 0x64300000 0x0 0x3d00000>;
 
-			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
+			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0", "msi1", "msi2", "msi3",
+					  "msi4", "msi5", "msi6", "msi7";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 290 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-- 
2.34.1


