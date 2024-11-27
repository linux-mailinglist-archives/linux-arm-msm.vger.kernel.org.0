Return-Path: <linux-arm-msm+bounces-39311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 054299DA7C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 13:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85500163CE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 12:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2991FC114;
	Wed, 27 Nov 2024 12:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OtVcdNAl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A520F1FC0F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 12:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710601; cv=none; b=jfIjkaRRkXBMg7+6xVD+Vz975jznkdv1kFIH39mZbRRo5DxT6yfdFX/GktcYd2R1R3/Gdupo8+ggf+P6MJdrounA7k6IUikTdMuLE3NZL2qx8WrbHH0TIszlM3yGw1Ew3kQIIampwXvbjCefi+M4DikKdClysNKgCorP8KdhwRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710601; c=relaxed/simple;
	bh=+fCGWoWcyECsM0wl/aP6Tkn6U+mnrA9RFPJcZbVhHBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+T1C2flVaiUdfbEsWgnFauB/6dBLB4i+gi+t9IYhne0+uBi9NCzo2M6WC6Z1Buyw16KlHsH13OW48z9KNZ685Sun5AWsksnNNyNi6UfPXro2W3zl2g+8dqg45tqFMkcFbzTXl6685QPKCVOSPD99jqddKXa70pkWidZ057b3yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OtVcdNAl; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53dd20efd75so721971e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 04:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732710597; x=1733315397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS0OrWqJSfJEkGDrw/31SedEoahtP5GJMRhfGX6petE=;
        b=OtVcdNAlsA3pabJHKT3MGSgXVBozCYyreTIdTuP9C4y0Ojvmp3B8R1pZeDaHcx4WC3
         qbkiCJ62vhidcwXTQvKIi/YN/63HiAjmlcFS4n+EC3HmeYIHQWRV94YkUGGs5CpxJ15Q
         Cxaxcp06sWjtE6T1yleeriOOtAge//cxrDfefw/juJo1WIuKpa0zpH/dRuyBc9ygLyHt
         PWMbF1/QZTOP4RGKcqRKLgYedBQtX2EbHexHuQCsLGPgI2jgmYBT/Ocs79wNbSlAAjI/
         4Q3fk26cK0oIkcvA/vY4WYU5eucXHa25MzT7TGy66Kc8kTtTDDoo1i1q/XQTt5hcKvZK
         JW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732710597; x=1733315397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MS0OrWqJSfJEkGDrw/31SedEoahtP5GJMRhfGX6petE=;
        b=GYOK9/4UfNQ7Wtcjcza32TE7xjRjkQ1mf8h3x0nS12mY/F7hsVUgCgwV1c3IA0Snpn
         u/m2Hef7ts6sRtj9ZHpVq7OofmVGrofCuzL3yRlCsajs7FBI50mhhifyltsjpdFxQHOP
         2C+9nMkrX/YNpIehamJMzsQKABbC2T5Vj7j/4WlPtlq80DefLzSD2CU7NSh6LeZ4/zHF
         PI9D5Qk4j1XQhiASYvUBXp1zzHJbnGagy73X3ZrdSCiQHK0DILiI7RyfKDpZlNHyt6E8
         4b2PlHe9rTw5OyNOeOxvpEraYVJtUeuDKpyaIUfWZwS4JI/EH/HyN6eZ0b3DGQWgWqFJ
         EYJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyOhmvM5NEGIihB8toA1CKcp61UuKb/jeWF3M0a7TfiNJcbdI0BvAbSfkjGMewG4RbSUfRPJjm6pEOifUO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpglv0uTChitoM8Hw4iYy7R1qjO9qF6nZMZxMCchBRD4FTEdUF
	Nh/PWLqD6Gh0mZeAC6O8nCIpRSGj8KFfiDRycp8X4VTSoMkzgQpVMXYFB+KjUIw=
X-Gm-Gg: ASbGncuaKKNDiaAvjNJH8Q0NFzgHTUzWkKaRwYxGsBO7iXWkTnvHX/SkatVj1gLwMKU
	k7TRbFsoEsTcIfStbm4QZmc1Fm1U1dIE7AwKOuN1YoTr3cjbTGaaEtppVoJtyFsgDFofR9UCcO9
	flMW3h2SfGbPh8ON5mU1+P7MS2xAHJnm4i0JrhRyRxQ+HKFRGnnhrmfS4hz0Y/P40gqSOskwOjS
	m/GL3SUGRGcofi0+vnRoZYwgkdutUREfvr8LsZYM8NXWDp7SH5oRWTqnVw7f7JL9UlTkNzZOu60
	jcUzaMp9ftxPL7ZGNrNFQ2mGvJdI997Z2yNy2wY=
X-Google-Smtp-Source: AGHT+IGMYRMBvLxzOeXvVX6lzQnUkLaJacSW0846B7I6+A5szlAV9+EARdZefGrGZYdP8ZUZ3vHYSA==
X-Received: by 2002:a05:6512:124f:b0:53d:ee75:4a02 with SMTP id 2adb3069b0e04-53df011183bmr347840e87.12.1732710596865;
        Wed, 27 Nov 2024 04:29:56 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24953a1sm2276621e87.228.2024.11.27.04.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:29:56 -0800 (PST)
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
Subject: [PATCH v3 1/6] dt-bindings: media: qcom,sc8280xp-camss: Fix interrupt types
Date: Wed, 27 Nov 2024 14:29:45 +0200
Message-ID: <20241127122950.885982-2-vladimir.zapolskiy@linaro.org>
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
fix it in the documented example from CAMSS device tree bindings
for sc8280xp SoC.

Fixes: bc5191e5799e ("media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,sc8280xp-camss.yaml   | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
index c0bc31709873..9936f0132417 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
@@ -328,26 +328,26 @@ examples:
             vdda-phy-supply = <&vreg_l6d>;
             vdda-pll-supply = <&vreg_l4d>;
 
-            interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 760 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 762 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
+            interrupts = <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 762 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 764 IRQ_TYPE_EDGE_RISING>;
 
             interrupt-names = "csid1_lite",
                               "vfe_lite1",
-- 
2.45.2


