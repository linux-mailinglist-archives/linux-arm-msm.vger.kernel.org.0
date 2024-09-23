Return-Path: <linux-arm-msm+bounces-32182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34DD97E68E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 09:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15750B20E01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 07:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F093F9D5;
	Mon, 23 Sep 2024 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfWS0RD5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017DD1D52B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727076535; cv=none; b=O0P01J39Ojgkn6K8xsLh6odCH9AkQ9IaOyeNuhgjQn7UcCI7h89EUrynEqPIOEDwYdr5PRwIqTFgclQyzlgOz98IuBz237Ai2QXpZFFdwyQutmXhmMYkGl9jMsO7/ZPn7RR7KiZyCUsSXM4aWsFoC3hQpvXjK8ZV0SEeVh7CGPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727076535; c=relaxed/simple;
	bh=MfnbIixBbEOE5SvFf2hrmEE6vy1PGJfrpFj9gYE3p/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQYdNxHPuANGq7c403aQDYQaYC0Lr5zvrSANmCsCqKe/hITX+BYe1DK2P8MbnH3LPJS3iLGI0FIUWdG+oWwPVzVJeAjJVnxLmqCd9a1YnpDWVaviNc7IcnVmjHzEQFdGuH3C/QCt+T6oi6rFztIRVGx3iH57Dca4tYUZkm1kq7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dfWS0RD5; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6c367e0ce98so4191096d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 00:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727076533; x=1727681333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pT/EXZlbVPom6UNobkfH8WUZIuJN9T5Vd+XJGcXSykg=;
        b=dfWS0RD5Sr1ff7AM/hwtMAPw6xi+ubIWrqaQmMLLpOruIVYJTAuz1z/QDnQbgV8O+G
         jcvI3gSdHOjIWuLRy6OeaJ0eZLBAcYJNAnZf2E/i0GdDqMPhCr0ynD7Br1uTTd3HKctz
         yLKdTU7hkrwDkZ0pVWoO/ElmygNQBsei0WBiWephE0+l3nWnxKcrKImqDiOKsmac9IC2
         fOtBRYkyDadDbznXqwoUcbAz4ozsh99/cEAtkchWLDqn+1t0LW10WBHuYxbXhQa23VZk
         ySnd4hNLzUred7mE9RoWTtgyGnh4MEboXWM65QO9N6YXdRyjLHWlmbWKd0BiK47pO/fE
         qCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727076533; x=1727681333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT/EXZlbVPom6UNobkfH8WUZIuJN9T5Vd+XJGcXSykg=;
        b=kSWVybsRRKNAOYLdIMd4qFqeJoiBZonUOcFEd0l89kyzXowA3q6mIjF7GqMSOijFnM
         83ujULAP8PIraXE7GUKt+dDknnPsRMr+7UbfadeoWqc354O59DwsM84/gD81k7GAm8Vt
         4KCTEkJHx1UyQCdgmGUBrqW9x9fNik3N3X01Xs+GiVrdCF6Ysg37IiKLa7iA4BCE3A9p
         9SKDY0aFCSx1joc0dogduHn8Ouqo9Cx44nDTVCvNwtYFUYMu/UKf+a+eJORblzD8qNzC
         IhVCSlnDrLqnKSrhwVCzMrtK1I4W/QQKOwSonwDer9+3+hY4R7yYvOnB/83sK6kkRUFP
         kzPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX8Pt6SfzzQfWBMbYH6rKE71V5hR+oIcAJdLXLSjeq+a8YVMb9XzG3k+eDCGJRKMWT+fU5XQ8jPR5Cnvwl@vger.kernel.org
X-Gm-Message-State: AOJu0YyiPxbHXNvtcuwYj0Rns9fv9OYCTZzaviLmsEfgCrOWNgSUKRuS
	0N9GZ6DZpEe+DoUm2FCUTTAJOekCl6eOPgzRqkXqK9fv+Ije57WFOFUtDd+nKQw=
X-Google-Smtp-Source: AGHT+IHulH/ZaYAzFdZYq2X1itcsjqm0kvM8wERGKIR2X8zflsHtpG2exRYy3ostPugRJf1sLrejyg==
X-Received: by 2002:a05:620a:171e:b0:7ac:b32a:3ace with SMTP id af79cd13be357-7acb80a2194mr838206485a.2.1727076532988;
        Mon, 23 Sep 2024 00:28:52 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acb08c182dsm452872285a.75.2024.09.23.00.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 00:28:52 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/6] dt-bindings: media: qcom,sdm845-camss: Fix interrupt types
Date: Mon, 23 Sep 2024 10:28:23 +0300
Message-ID: <20240923072827.3772504-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The expected type of all CAMSS interrupts is edge rising, fix it in
the documented example from CAMSS device tree bindings for sdm845.

Fixes: d1d5ce260165 ("media: dt-bindings: media: camss: Add qcom,sdm845-camss binding")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


