Return-Path: <linux-arm-msm+bounces-22692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A3908832
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 11:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47FBD1F278E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 09:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3482D1990D8;
	Fri, 14 Jun 2024 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v1jggcHM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95CF197A95
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358409; cv=none; b=qy3I+5sjpnE+oYMTtcFsSfa9Qfcxl2z7I3QeQANZm3vEyllKLnUKWQ2cAxDGi050k5coY8gY6Ao9GnjzU+OYYxy6VSGfARg/MBEfPmdrZrUgi+56Vo6rc+1rFNIhah0yD/AKBdNxSWZGG0zAeCoBTrYR6Y8Sg9c3Eky/2BkZnoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358409; c=relaxed/simple;
	bh=1QXEmZd+cFRuZ9pAA4Z0kWtLyHTijEgWCuJOa9SDRmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mq1ILFy6LpGMxgKQNzX9Hk0YTBUg3H95T3TQDgdkqaLu1vr1Inq492dL+DdSjUhLSbj5xJHLFwFKM/C0TKtJ1dTaicutqzLMX8tattmpo2TfhxqLyajrL2LRVyiNGYgk/nyeL6/7bncTDJvJr6R8wuHROu3m3VY9DrcDLSS1DIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v1jggcHM; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6efae34c83so255625966b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358405; x=1718963205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48jRV4Y+U5vH/naB0pf1Q5GHRMn8kZ6Tmm5P5ebQMO0=;
        b=v1jggcHMmAaIHdgl8g6YJdgjp35WeXYCmZ+R5uv1e9NTvWQYRGmpro1jIYUsRCJw2N
         yIKoOYWbPCH55izmrwrSU5u+eS7i7SW9vGdR3B5wILX+kPfHusgFgQKGpf2Pl3SXfTEd
         RrPTmKUJwzpsWTc/4GCejaFeeDz3/RxIV8FHpRQU3i/fh5wc8I6AzFCLHQwyeDHAqVfQ
         v6nYfbLM2kC+4H9JavPD5j0p0u1DgWg9irbL1MosR1KmfuS6EJL/UoHE5CCaaM2ibHje
         rthWQ460Dnxvgp3lZZLNAS/GsJRIYkpBF5ekFHtGr59JaDp9fTEyNvmeORh5cKaZZomH
         D1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358405; x=1718963205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48jRV4Y+U5vH/naB0pf1Q5GHRMn8kZ6Tmm5P5ebQMO0=;
        b=fPHfBKzmFigKQi6yEgNy+Jt+hqiJq+TrcA8aRBGq37hsDhRH6fU8vZGVUdS8KJfk/x
         op/hg7cLtHOHq8lzwsbumTLdOvojkAydYVEfZTWuD1W9O91TbmpA0hq21gwJ2jlqdzgK
         huZCXYp3eX8AGB+P+Vv6YGVQnp/6EL5uVqrGoGC32bCirusGSeBsyuX0aONU4BirPHo+
         a1+EbUQ5F6P/16S7RzR019ZOWzs9gqnto/djlXWaYJf+wERdD1XDjJ+sKSu8DEwpKAJk
         Bv1Xqi4pSX+5rZDUv2hxXRcKL+IqhbkzZnX1u6XN/Wvx8FgqGRtjbcHimfXzt4I1SfKd
         RbgA==
X-Forwarded-Encrypted: i=1; AJvYcCWr0pvrk+daPh6pJ397H4NTn8w7SLiaVhSrVjdkPPILdX2319ZfKdFc+kG7ROr9CK8F4XFm36gnZ/ovRAM2EcKwBeVgmJ84dZn8ZqJR4g==
X-Gm-Message-State: AOJu0YwZuQJCT0G6KEPs53poGckEgAOMGWb5ph0Iy1iz+ga63hwMCHxJ
	BB2Bbi9FEkwDQ/El49FWa3T2WCcTPuFa+ssNySdrNuGL6ARhHcl1cVe8cIA/dEM=
X-Google-Smtp-Source: AGHT+IHlYvfZnRQiJVv8ztAIy5FtuFGGY28pk8Ex9meikXiQo2nuK+J7KYvFbJtI8301IPK0vUIPpA==
X-Received: by 2002:a17:906:a09:b0:a6f:5f75:2096 with SMTP id a640c23a62f3a-a6f60d461f6mr140579766b.41.1718358405253;
        Fri, 14 Jun 2024 02:46:45 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:05 +0200
Subject: [PATCH 06/22] dt-bindings: thermal: imx8mm: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-6-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1QXEmZd+cFRuZ9pAA4Z0kWtLyHTijEgWCuJOa9SDRmU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFlbbbrZbxDOrrFndHK7KrXUzJDw1D1Nw6AE
 6S3xdbshASJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRZQAKCRDBN2bmhouD
 1+kFD/sGnvHOKrY+EhoCdoHu7iJLZC1M4sL9G6Yao9AC291vehS0a6iUOXKVgc0S7wTHdl2lCaV
 naDrLzfUXUetvHgv8FAhwUuXZX/C6jfC+VQuscZd3QgI9zJEWpPLlQVarLBRtvdZr1RvWKNUroC
 /R7/V3ndnLQS8wB+8XMj9ZGqWhXr5DjruMYMSrId1NeB/H/FHtCvMhUf1E2AceQ26NP/0Q7Nllm
 Q4s7N6oYkjyt+IZD9tkEODXQbliQk88dgc+dABH7rt5skMz186ou1uHERYerQZ7ZtajckM51A5D
 5zHR3EPZ6YBYyVo0md7YUD44+pWha8sx2fehN4w6yuMskcY8IOgkUyRR15h8UwGr5nix/Hmt9hl
 XW0pbFwgHTBppYNLodhiMPqpvvb5VjbIkSooty39pHu95j/vDGJ24JAP2nlwLfGhVXbDt13R24w
 imF2g2583XIAxUy2phI0JjSeYlOpbshrQZ6uQ93uJ9bD2AcJg+p8d6J+adWZV2YZJ8GntdBvAKW
 hd5aJ866j10e91MXXzh7Dcs5InXghT6WDBL5Q/gGDGafMAwRBQl20gIeBfDFzwqIPEk5G4fw3HB
 wvFZizoZTq5aXdChJYJk87xzmMo46BsqQ/9j4F0TNsY5WZg1BONp4xZPzytaP9vvpO/7gOStZBx
 nQSxk/Wn+Tzd5Ng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
index d2c1e4573c32..e7ddaa6c966e 100644
--- a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
@@ -16,6 +16,8 @@ description: |
   for i.MX8MM which has ONLY 1 sensor, v2 is for i.MX8MP which has
   2 sensors.
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -51,9 +53,8 @@ required:
   - compatible
   - reg
   - clocks
-  - '#thermal-sensor-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


