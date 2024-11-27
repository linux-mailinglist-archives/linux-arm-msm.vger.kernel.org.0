Return-Path: <linux-arm-msm+bounces-39315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF579DA7D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 13:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60129281F87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 12:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648D31FCCF2;
	Wed, 27 Nov 2024 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hyqmfg6m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF271FCCF3
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 12:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710609; cv=none; b=PK6zlXquEc4qDj/mXBZBDcinj45t2DVjtnlHNJJyKh/f04scX0c83Nl4KfB7RyUecaxa2vP2T/1p4vsLqJzVlss6jH1JNEZbP4HcNNjgd2CXzF84Omor2vBvQJgoqrQzL6kXlFBFQMZda4kxoJX31vXomZC0cug/2NudLPLQPTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710609; c=relaxed/simple;
	bh=1HSBdMh6wfN3s6P/Pz367KpBowZKJDapMzkV5wpGJCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmBgZLAnEq+ymHAdu9CL5AW0C8CypQ+VXIV8/Qr7hVoeLkYuCiaTAMonVAlSrINbML+Zwb6yeTKzN/vaJwzt7wg4i51b2m2JJqYS03RZimxIeUY4oxjXP9G+1e7vhw6v5+GW4MGLnx58xDkaFAHgRRrxiKtoi5ExQdwCgjJimSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hyqmfg6m; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53dce7dab43so838132e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 04:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732710606; x=1733315406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YHGkGvfRWiylmf26eOuJT5PWJDFkDGLf5fy8GDJu8o=;
        b=hyqmfg6mij14rNNI8OeFz0y/F3e6gUogH4XO+v2DYFA/OEUTnUIeEQkdzu1fM2yYd4
         PRhSsNBpIJiSGKR2MoIwwm4InzYnI9YiQTz8gJs4aWrkW6GlTL0iHGpH0uNjQPLb+vjy
         LCilJwSu1b7SvK+kxwW96VM7be10Id0jB4sZ2KIJ+6JjxS4W5R/rgmcrIYZG8g4zA3M6
         gSF/AahUCPZZ6SZU4NqvfZ8rUTn3XsUJcWqog6aRcfGk+GlPpqTbuyBXkPbHUZUjy/CI
         4+KE1U8OtPmZyYBZsAGScyhi4yMm1Qd3hVAvFeM90IjSanqJILfL49VwQkomjMZwjxxy
         YrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732710606; x=1733315406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YHGkGvfRWiylmf26eOuJT5PWJDFkDGLf5fy8GDJu8o=;
        b=PdovgfJB6Ap/6CAYT9dDUatB4GvnQk+gl5Tbi6POqtrGrOjsfz6iW+YobCIo2/PCKJ
         kHj/oq4pNYNqRYpysC8ht1WjzzSvDurmpY40TpRi4dYuhlZpoS5wyPOCwlIsdS+SaKT0
         YGbA0H+Sya3YWVNz80P2SOkZf2Zjl4RRLbILsnnws45RJTGCGC53n2LoH9HFbf3KdiQJ
         M4hma/D6Og+igt1aRxp5GeHuIXA5j4dbhPNj5RN9ckMxBN/USYK1q9zLXYAi0KfpBSjK
         /Nkob22ZoVCkBYa5dATkwvFMUF7jteWmrtbiPyCTor/zzF72ieFoMwU68aj/T9Oi+qnZ
         dkeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdhv/UMQc/px0v9cTYCi15GmwN1DAM0HFLa3xvzeV+c9U1gNoPOnuT2SYWWh0lPhOiPdHKGpVL7gIbkoBQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzur98J0OYKo9uhQ2vmxauyDMw8ZEsIBZAMQWGTU72SH2a3h6t2
	tU7W2mldWQGVRvI58CAv+cP+fLZ9UIVfNX5o1LO20v1A84ljR3m2s2dW/KzlCZg=
X-Gm-Gg: ASbGncvSF1hJ8UEPVMtsADPMd5Gyfw7E6lnc8idR+Y2QU0GyHua78TYYExWwthA5+XK
	1W0adkLPq6u6t/qMf5P0nys/fJHE0NYQNotO1sp34xom+CZjPznEGHFFOoq+eklowAs5wiLQGvk
	DglVPJluqOrll03AZTNBvm1cMxB2ktQc7EyRDONGqFw9h502+Sx6pMs+S+wzQ0cB3lw4pxD7VJW
	/FsBOxV3gwWSllT6mFh0AuHTR8QlcjW9xRI+WAEa6IO8Bng3HaBLBgtnkAnWAB6bLlJAjsm1OaZ
	e+5A/IPgF/JEyZ4p4aWLreVzAJAWLcSV9WPhw34=
X-Google-Smtp-Source: AGHT+IE6l2CbwDIyizpqAEKumrX5YByiMnhEAc9ERpp6FYYrorQ32FMnc66slHzbN+Jy6uQeksIX6w==
X-Received: by 2002:a05:6512:3e22:b0:53d:e4d2:bb8 with SMTP id 2adb3069b0e04-53df00d945dmr287070e87.7.1732710605774;
        Wed, 27 Nov 2024 04:30:05 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24953a1sm2276621e87.228.2024.11.27.04.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:30:04 -0800 (PST)
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
Subject: [PATCH v3 5/6] arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
Date: Wed, 27 Nov 2024 14:29:49 +0200
Message-ID: <20241127122950.885982-6-vladimir.zapolskiy@linaro.org>
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
fix it in the CAMSS device tree node for sdm845 SoC.

Fixes: d48a6698a6b7 ("arm64: dts: qcom: sdm845: Add CAMSS ISP node")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 1ed794638a7c..cb9fae39334c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4326,16 +4326,16 @@ camss: camss@acb3000 {
 				"vfe1",
 				"vfe_lite";
 
-			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "csid0",
 				"csid1",
 				"csid2",
-- 
2.45.2


