Return-Path: <linux-arm-msm+bounces-25347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C558928589
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 244BA283D7A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9B4148319;
	Fri,  5 Jul 2024 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uALLdvYg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC811474C0
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720173120; cv=none; b=W+aOUyf6UHc46OOHVmrS2Htv6sJGrddaF++QCORASF1M4/HuMha4aYqAvKpr65Ak0C5mzHITyLOU0em9c1qutpDQdm+mb+B4bjYC0WgNhqrgNcF9lYx0tgPYjJgTb0TiTcDNTmUOL6Dhm7CivvRM+R7170vjQgHamj04IJXxa7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720173120; c=relaxed/simple;
	bh=3EnSa82o7YAfbkSZeSakkuZ4xjdHqVx+EJ+E8oKBlvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ivXxvKUcktxSwFTBXlw8JAShVNK3qOm7HSvH+p2Ed7V26a6JS6Z32TgkXHCgHZJzFI+LEUpnelHYWAfpunHWq+TsrU7p5CP9bg96CXWA0MItZ9Q+3Dk1cHJyL0yq+sW+e9EzxYiIpnBvO9oeKAb659e0j4gIOeIcFiyIn7nazKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uALLdvYg; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ea0f18500so1353551e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173116; x=1720777916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1lgREowMpDgegSv36xdcxK3AnkFlFwaiDjciQiE+8Y=;
        b=uALLdvYgWCf4pyOhfaKQ/y/f+F/B7BjTLlG/k8IW/3c6EqVxb3/v9XWS0aYioVjHzt
         TW96BPdDejya6a289uQrm3k3TWrbgL+bp2cRYcy+zZxrnfrHOJkUNgiR329igr8bcP8d
         P5YD3YDMBHUgv60TqC6sYmoakk4nzyPtKAk7jKEXWLtIqSAP7pxI0hhNloVsvauxYDw3
         OW8WlLbS9mMtgQxOgEMOWvSMxGWIFElsNKozzlbqL+AAjAaxWGJ9e5cu8uDxnyBvaUQy
         OCMd2ixBwA3HdUSadekCtzGDrOXc62kzcVv8SHVfEqzbxYLg/ycw8Sa7KN0Et2iVnp0m
         eN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173116; x=1720777916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1lgREowMpDgegSv36xdcxK3AnkFlFwaiDjciQiE+8Y=;
        b=IRgw5MkqPgOYn6GPpvQBzlZtHKOvri9UyS0u7FT2ZDwNwXuhxenqrukXVWOa+vVrhv
         lLcUe97H+LvGhGMB2eNIErfjAmrf6Q10zoLaQnihptkr2+aPd6AY1XiCMgnh9tReZVOV
         rg4fQNnBtlAH5he2V3tn4/o22k9opb0DLEHd/cLFzxLr0ztNWceM57Yfs+ob316Cc00D
         Sev70jfj3KKu8aoiMJIhM0qYoYpL3u5ta2aBLh14tbalsvd1LL81HoFIawSdbKfFKUN7
         TOcJKadU2WzoPjkC8fGhLu5Xztya6m+NHhJM0UNWRx1mUWcQFTGrBN/Yaktv/GfJ/3wH
         f38w==
X-Forwarded-Encrypted: i=1; AJvYcCVMjctW0hbZ09bDMvf78N2iqO5n2oMcNjrdZOr45DhfGZgKtJ2iGpAs8UeYmCQtyN4E8oL5ekyLoPtB/u9zxPcpFGMrtSPrz1aQrW7ZzA==
X-Gm-Message-State: AOJu0Ywb14PcoCgUWR/A7MwYAWypbBBlk+xT2Rd31HKwxXDP9WPhOYcP
	wkcI6MxcBBTs6vScsPPkn6mhoDQOFVH09jpguk9tomXUNybLJ2Hqc5YZQOo3I3U=
X-Google-Smtp-Source: AGHT+IEeSo1l6X3Fn7oREnziy7wGl86YV+iWvBeIrZ1RnzxH6wICinSt6W9cTAWxOTsN1SfeBkyhoQ==
X-Received: by 2002:ac2:47fb:0:b0:52e:6d6e:5770 with SMTP id 2adb3069b0e04-52ea061f4a5mr2746219e87.14.1720173116487;
        Fri, 05 Jul 2024 02:51:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:51:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:20 +0200
Subject: [PATCH RESEND 01/22] dt-bindings: thermal: samsung,exynos: specify
 cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-dt-bindings-thermal-allof-v1-1-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3EnSa82o7YAfbkSZeSakkuZ4xjdHqVx+EJ+E8oKBlvg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IkvFsEQjTwZFnbae9AS2ygRayZquLi0sRos
 UXLxi65fnCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCJAAKCRDBN2bmhouD
 17PuD/9a49GewAbEVoD10yTzhnQEIJm7VmLlCWlVgVZiMpLg6K5LLHZn7lT1CAo/2so5Q3+XXF1
 Tjbp+LcH4moDaYOy3CUt0+YHeNd9BGdOqIwbRBykpRhvc9rKVkMxe3piyICn6h5RhtDePV7NnCt
 6Cr5rJCjnFcf2AbZZeOQxZLPwBDwqxET1/yWFebn0e/7AaDIo7JAW6+1okCZcjnqPQIyJa5cDBw
 vua10epXrG9CiX7NnWzzT3B8QxMahZgtWcUPiUdtO7hnqZmfWCChO4B1VozqWnEheSnRpvSZ3x0
 zpMYhpkXacNsNT78pm/OgCTK9ZtGQD40/GqQtWScwbJsnytA5Q2ubJH55ro+g8zuc1ZW89uYkDq
 /x4vhyjvRaYjLeC7C1MeZagVotfluZqWAAufbRbJubk4Xa9n4ZQ8jaak5OEhDd/l1gWJHWE172X
 aRN0zlVnImPidjB4ONSQ4oO7gog5Umsylxs6EQA9Zx0MlkLZ1ydbxhY0p31lsUnl17b7LYYlqGU
 TK3+xHPXDGHja8qrdgMTUzvvq82VgcN8s5mqc/EjGE3c49RP1fwFwzzkVleR+PPIxeH/OvTOyXu
 AXkWN4yvcmqD0ctz8QtvSWiyJSOTLPl3O0ILl7vQwO9ge36B3+c6ILtuQ61lYLyUZre0QUQIlot
 5awo2AdWu4Ir/Yg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

All Samsung Exynos SoCs Thermal Management Units have only one sensor,
so make '#thermal-sensor-cells' fixed at 0.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
index 1344df708e2d..29a08b0729ee 100644
--- a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
@@ -61,7 +61,8 @@ properties:
           TRIMINFO at 0x10068000 contains data for TMU channel 2
     minItems: 1
 
-  '#thermal-sensor-cells': true
+  '#thermal-sensor-cells':
+    const: 0
 
   vtmu-supply:
     description: The regulator node supplying voltage to TMU.

-- 
2.43.0


