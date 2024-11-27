Return-Path: <linux-arm-msm+bounces-39312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF03D9DA7C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 13:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E5A6162912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 12:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4C11FC7C4;
	Wed, 27 Nov 2024 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W0+rGztM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50911FC10D
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 12:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710602; cv=none; b=GgC1+odNAYxJWzILU1o3EXKW5Uub5IdHHSqxQ5oLZHmK/YKd8yeQrBS4u9Z0HJyUtoBcC//0wLJQnDRGe2EpmiRZCKuaHzZRdNaQoD/GzUYr3/UFc7VN479gyiooIThsDnHhyC8U0IYGsZMnbsozoUK+33evEWqOp1fFz35h6UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710602; c=relaxed/simple;
	bh=9p/jyFvJvxTgMMbHLD2yI1raRNWAtu7jp4tx6zRjySA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdmAi0jBrUkrNCMxSPHtgwmR+ZrRvff+S0R+q5CswSW01EiMgzqnrzRG9pQ+8/BMJ1/iryyg8gWgBMFnNkO/YPQ2YExyU234ao2B7L0EYdUVLV/4uOQa/CTYlk2htxbPXaewDeoUdO4BrjNQmRTZAhYMSelCAaqa0yDejcmIJCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W0+rGztM; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53ddb4c05c0so667359e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 04:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732710599; x=1733315399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8zgSfvfKIphPp8nFZAGLP3oTDza+8F+XqLeI7oYefM=;
        b=W0+rGztMSXI4v+X/Jz103wMOi/b9iEjvbcbjPm1vZ2UVdZnLSdTD0rJKTl71slhqWb
         9eOjEOhQ4YXbdByoCnMhXk0vcfc7/OjMEFDz9oX+c67R8HR4IgdZ8S0l3Id7LfD5Uicp
         io0hS5drdPyOEAlJsFArvCYDIL537ObbMkp3rrcyuRk2/9c1/scr9qLlDQxiULpZ2QVP
         h9OOLgQ04w5EJgx7m60gqs7qqXaxU4RlwzfS7LxM7zlkpIyRWbvfOodIfvcddOoPbf3N
         /ybf8LskMk8XWPhrBIhrcSSyvbeRIhJ0P5J8zB0lOyJkZ10HvlSbB7uXemNjitn11PsD
         K9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732710599; x=1733315399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8zgSfvfKIphPp8nFZAGLP3oTDza+8F+XqLeI7oYefM=;
        b=Q2Vtzdg/euheNokP9se1TC7EQTT/9WocIvZoVFwQZpKaraStNdXlkqL2SnUZAnl4xB
         lwqUm0w1+lp1boYWVXlRIwaNyqUr9N23NMcGAVWD8voVgJLH8fu86YV7U3W9D/WFRtQh
         QsE1qm1GXqbSamUt09aMAggzGei/U2flVFgodbpkAawt/QmGShqg5FTr+1zHHsIWq1/P
         ejf0/Z64U1I3F3nVDqzAhwjTjuO/vNTYJo9jR//A+4xWoN5fTZg1QQndabOkeiQO9/qf
         YTgaSE7BbItoK/eh3GlyV1Iq848awA/x5cUq8SE80u6q+bEtPqTwg7DiGvfcowZ25Pgc
         zabQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMeXoph8XI0RwRV2ZYf7D/YAMPu9eWU4ZBYuLKiPO9IRE3tca1m0phvcL5aPVz9RQ+ksXElCgZoMTcAaSE@vger.kernel.org
X-Gm-Message-State: AOJu0YyRA1ryOO+LRXs3mk8/JiQT7DLwzcTO1E20byQUtyuVEy9vHBOs
	RuhCQz2fWRbxT1SbEje/1O2zU6oKjQ5AZrfdZedZqJ9yY9qtbRJuHW0OaBb+pc4=
X-Gm-Gg: ASbGncsGxxhGeivpAeOKHcYmPhiVwKZr9zFTwyDs5le4e4dulGOqQMIqHHZeVyll26b
	cwIcG/PblUERstBgMovkuy4yfUO+6pLt0KCcerWsc0Jz0tv2PEnJ2iYjf0fJrfGdvMWKZfLiPqI
	G1sa53utH9DZiEdkaS+vvSmB2vuWf2MXeGBU+iDHj3UOS3c4J4h0bVzI4hzAEiABA52O//sjM2Y
	kDf8+slPZ1/Vgq1+r1FqkAIKLlV6d0iZFbzyS9wT7G+Qc52NIqpG3JJ+7680ozrCv3gPR88sVFB
	R/ArWGSj8uQDtMV9FxyLhGfoCkyUVYJ7s8FOfck=
X-Google-Smtp-Source: AGHT+IG7i7jYJ2wHxo+R3RMZH8XtvIAgLEudwz3gXtA9tAxpAaehlC7idqe4lC4o47Tq7+3rVDOXQA==
X-Received: by 2002:a05:6512:3188:b0:53d:a07e:8957 with SMTP id 2adb3069b0e04-53df00de15amr273734e87.6.1732710598925;
        Wed, 27 Nov 2024 04:29:58 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24953a1sm2276621e87.228.2024.11.27.04.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:29:58 -0800 (PST)
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
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/6] dt-bindings: media: qcom,sdm845-camss: Fix interrupt types
Date: Wed, 27 Nov 2024 14:29:46 +0200
Message-ID: <20241127122950.885982-3-vladimir.zapolskiy@linaro.org>
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

Qualcomm IP catalog says that all CAMSS interrupts are edge rising,
fix it in the documented example from CAMSS device tree bindings for
sdm845 SoC.

Fixes: d1d5ce260165 ("media: dt-bindings: media: camss: Add qcom,sdm845-camss binding")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,sdm845-camss.yaml     | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index ec4380a0a03f..d32daaef1b50 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -296,16 +296,16 @@ examples:
           "vfe_lite_cphy_rx",
           "vfe_lite_src";
 
-        interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-          <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+        interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+          <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
 
         interrupt-names = "csid0",
           "csid1",
-- 
2.45.2


