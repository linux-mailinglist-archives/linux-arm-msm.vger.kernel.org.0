Return-Path: <linux-arm-msm+bounces-39316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 350C59DA7D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 13:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9AEE281C3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 12:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EF71FCCE9;
	Wed, 27 Nov 2024 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c6xpPiwo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C711FCCE5
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 12:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710610; cv=none; b=FLRauVef4ZQ/uRngmzOfcNr15YrSceX+Fr/jdfcPJZYpztGyYwkJHPmpw/65YgHVrSyqPdlaWJsL5JJhZiVOce0X6Ez+jGuGbxy9nRQ37VtjEp0uEiI4AeclZgNNxLqazN1iM7eQfRFW0WdkoccHn9XIW09ErkOCt2Fq9e9r0jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710610; c=relaxed/simple;
	bh=Vuj6kK0EJ7CHZhxp1LbnuDzYrHFVMG2293bs/7UUbfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kAUs9RchtlpiRTgJ7hXI8BZD8GFe4He/tdWlPyTfZNXp8fjgDL7le4uVIjzPEyjghwU26cOpny3FzVYNqReJd/02D9dtKj72fOqKYgkit6mB+Og7R3OZ3mGIHQdwSbB2v+++Xyygbtw03gSTUB3eOaEW8xTha8PTf2xplncAI5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c6xpPiwo; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53ddb4f8450so535562e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 04:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732710607; x=1733315407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEFUpzbKvTfhb0tLH7vWZRk6FYNLH55/qvFLVseGYTQ=;
        b=c6xpPiwoRbxpaEFA49OVbY8+8sE0r0HTY/odAwiXcGjMsy0pu3Mv+YCAc4lXSEzrGx
         Jj4K60ZuiW2SMSTFGbL8CgdL3WSBwch+4ue8H7o7rNYbm5jQrDMeMYx0OTGrpW7d+6gE
         mkrnrb9p6DbddPlMNjXdXZRhovsII/5GJuRRjiJINVqCXSrngAtYc7sDIFJ+AnCUwrKH
         HdxBHSSjh6TeK6zhic+yRLazYfGdz04lSLr98uid0ex0Hitug+47l7KmfY7ExXd1L1wY
         0PP1bBKRg6eCtyTDCW4j/hhFwT2nqPCyGWas18UcEAm3oTsGK3Gd7S7TIJFKY9TWIK10
         1Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732710607; x=1733315407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEFUpzbKvTfhb0tLH7vWZRk6FYNLH55/qvFLVseGYTQ=;
        b=MRvmbv+mviXtl3+slAOQmqGYTv2SGZbBk6El9UAcpRD6voC3zYuL+2dPlQHwUhr3zv
         ryjVkUFO5hU5w+1rCk5ehqh1zDeygaPwVocVhNQoR4qrt05xwXoDmSa7xpq72HXJgaih
         AB8Q8/lIUgHxFXr95ffR1QD2E9eFz/XLguI/N7RwOU2uRnlmTucR1l/J+BbWXR14eCJE
         j/dHPXOYWQ7ioXMb7dGNikRkOs1xWuk8OrjKsfWX4+VI/7MJHVZLdPczkFQpc4akxght
         nmKdscIVO+uzA8vSDJ6v5BBPjjT46c1y2MFEB/qhPyVRiaemTvEyS6X3qmC8+SgnImwm
         Ff4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTwMA6hBY4fxpPoRSKBx1UshYRx7ndkQk4mHYT3dpv/BmDcCKrOLD465wHg2NEWKSS5Rr+t1pQazAIZzHW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0maNaYQC4o6FHPjthLvt9AorYBSVH4OHTnZ5u146EXcQWRbs/
	B6LrGWkaiAS5nox+X4sLqEdx7eDZxoLpauAvWTSGBugeADDJNhLRubgdWnEHqmA=
X-Gm-Gg: ASbGncsZ7FDZq1vhQeG0RGpbVyTlXYXrkiI9trs7f87Tra4D1aOg2+mXVAsU0lSGG23
	JnMpurXv4wDVXpW/CDbqew+iX2iBBjKVY0EHDE5jP0VfU8oCpHnHVlgggSbawhxfZFXS1+ZcHb0
	k/hthdn6lPpl+gaqasSiTgnsA7PT7nXL08X/3q3w9UOnt5EhEGzgNcHYoyhdQn2AhTNGcSdiTIv
	W1Vblzx4rakW6aHLmnEImkRmFbxF1AjG4v7O0gS8pHZxqcpGhsACmS8IwGxOfsT/BFoR/MXQIDh
	CIyauztZcELVpmNKAl/RA+zAsgniZcthEh89c3A=
X-Google-Smtp-Source: AGHT+IGowptFkbTEAuQlP2B0QYnkmEvdwwGsERNzdVAtmUweyyASYJRRN2IvILq4TFHcbz3FkjIJkg==
X-Received: by 2002:a05:6512:124f:b0:53d:ee0f:2562 with SMTP id 2adb3069b0e04-53df010fa1cmr286662e87.13.1732710606739;
        Wed, 27 Nov 2024 04:30:06 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24953a1sm2276621e87.228.2024.11.27.04.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:30:06 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 6/6] arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts
Date: Wed, 27 Nov 2024 14:29:50 +0200
Message-ID: <20241127122950.885982-7-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241127122950.885982-1-vladimir.zapolskiy@linaro.org>
References: <20241127122950.885982-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm IP catalog says that all CAMSS interrupts is edge rising,
fix it in the CAMSS device tree node for sm8250 SoC.

Fixes: 30325603b910 ("arm64: dts: qcom: sm8250: camss: Add CAMSS block definition")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 48318ed1ce98..e5a4bd25ff23 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4481,20 +4481,20 @@ camss: camss@ac6a000 {
 				    "vfe_lite0",
 				    "vfe_lite1";
 
-			interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "csiphy0",
 					  "csiphy1",
 					  "csiphy2",
-- 
2.45.2


