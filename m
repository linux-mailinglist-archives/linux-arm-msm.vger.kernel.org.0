Return-Path: <linux-arm-msm+bounces-22698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A89908861
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 11:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99D6C1C20EC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 09:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E068819DF5A;
	Fri, 14 Jun 2024 09:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXSaM5fi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6250719D064
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 09:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358423; cv=none; b=k0QlmQ0yVwV0uGt7TQ2gFdIiix8gpZmrdnq30lHpRKB9liNDV22xZGIZPkrBQ/XRjdE94HG4Ks8k/+xaa5S8+2XF66qDQRuyxqV5LQuEGL/dznh2CsnzDNqjVYhAxBu25eACzcIsqQuIpJf0xW+oVUScE23pTBpwOwB5anub1Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358423; c=relaxed/simple;
	bh=6K88OrzUlGKwU/OIT91fDcYr84l9rnvsFelXhKUGuj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1z4Grt5EDPFl8LNqIFKuMOKuDRKqL2luvAYTV41+NO1WqEXnOxFuiFId8V+R+59Mdlwtdp3EHg4HX8WRGtm5muCWsMxmVNRWYdTp8MTXMfjoFzTpx1Cgi87WNj98zhjOvV8JzVZ212M1QhTB6Ud4x7SNYEHYU/0xzNrG/tCVlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXSaM5fi; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57ca578ce8dso2253473a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 02:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358420; x=1718963220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDzTOCTa4HJwR4/y3cSITmAiI012UOCdoAFLWrMKEdw=;
        b=PXSaM5fi+Z5FB3wBe7rUy+SLH47JTWwKhjTCgPhO4g2fOzlfSBVtPYAYvzBgLvwmMG
         NZ+4t/Ck9dWcgRFMjAWI6pnHepJlGqgB/trfpVSxzqQ/yrCEOZrZ10MMxFVsS6X9kUKx
         zZ//ZP/7l+/7p3bFW6egc/JnhrOh00KrWjg9DvT1cT4NSD+37fbzobsSCtjiDNDkvfWN
         cnhMmUW6zW/tQbVwd8y0HwUZJ2K7PRy0XfekiDe9CWdl2ijFXXU0j7zgdS8s/WsDOmXb
         t7iLc20MpRVqeBHhcgRth28usGVQxkHXPINTaxv43Xlr39DkpiXKsS/JjOOQcUTL68Rz
         0ucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358420; x=1718963220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDzTOCTa4HJwR4/y3cSITmAiI012UOCdoAFLWrMKEdw=;
        b=HlZFkxbPPLcXBf7x4UKP5YLWIYrhgI57xNd/aPqCZKM5j8BDdWnyXBVeyYXCF84J8+
         P8Go1mK4e0qCSrtoN4dPURuwSV2luHNyOWSk5NASpeo3pPC0+G2GRijPFff5v0fkP7tE
         ybOF8+plpO9Ee5/PVeoknv2b5b3pw6/spKm03IWgajgrTcXNwsj+RBvj21G3C8HU7P1o
         OXJAohRnuilr7E100GzsAQea735yvo7CEkdc3F6I/XeOFCAJzmWWl0IhSeCyWn93zXT6
         AmDqIS/I1SIIoFgWV+gb7FKdWhKWTeo0fa/bUuCdSX5Zqn3Rtd/RGLg3TfHLheaHVuqL
         Hqyw==
X-Forwarded-Encrypted: i=1; AJvYcCUtrnNt8bfgfP25m7seES40Ehdn3wnncYrZnpLlAnfORi6xSA2nAWWlDUQMEjGQ39nn9kDtQ9K4827zfwdJCgm4F/58zjxbfK52ocWqew==
X-Gm-Message-State: AOJu0YwYIoLHfbBsYTmdg1inqvWzQl9LQThcIg1oZhKMhvsJl9Ogfkt3
	nQIS6qdBsboueY7614WDojHpsqCujvXugYqzJhfuEvvEEQ/TZn+F0BhsuhUfo/s=
X-Google-Smtp-Source: AGHT+IHhkyg88ZBx9XhMDtFiqgUV4Rag8J/EJOgSqpavN3y+auOUjMfbZQ27USxrJdLN7rF9YSoJ6w==
X-Received: by 2002:a17:906:710a:b0:a6f:10aa:9c3f with SMTP id a640c23a62f3a-a6f60dc8929mr154328766b.54.1718358419616;
        Fri, 14 Jun 2024 02:46:59 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:11 +0200
Subject: [PATCH 12/22] dt-bindings: thermal: qoriq: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-12-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6K88OrzUlGKwU/OIT91fDcYr84l9rnvsFelXhKUGuj0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFqsowHNS9EMEGb3wL4geaYGfXVspaQAvTpg
 JsPzU2j5jmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRagAKCRDBN2bmhouD
 1z1kD/9IUCDeffbNBN9bpMVJ0DiYXdqHjYtE0sxmsol/oMd2LeKdcEW91r1jkcXS67PrsPsJugf
 2wnYoYHmD/cihlX6pZcYeGos7YlWMhbiK1QmxDz7j5+f3b5D437pOJLb+THCJZkZWUBPb5YpmZs
 pQkwaxDIGiULmQrWDb6vQA/6+urQZWCUxTB+CAfQykgBgiJB7yoY9HKFugY2P82OMPZHw4+jws/
 I6XeZbxQaXRuMsn+Fjt/eZz2aVocpoq0Q1LftcrMLw0Gmn7fovh3SPdabv3b8ISxzrxTG4qm4EO
 8yUQtBc5krW4nk//Lj3kKH8LBQZ6a6nQqoLgVEm21HtLYFKDqw1BBW8aBoLV04Hga5YUBkkgLUt
 fe0e1gqURCIYhU2TpPrjABlwgbidr6MDQOTVrUd4GQGTO9eYZg/rgVMHTG8y7KLUqbjzou0tBj9
 zOwgcS+XOPtTEW6vccmPPz0BRKP0F+K1BqR7DWw8c1RMqGHDuJuYpftHMRoOx/ATTPqlBG6VT6M
 XKANnL2u4BxCUH+oCpM7jVyL8JYdU2G6eXA9jXZE3lAEj3n2tNY2hyYKlK6Vl8WTu8WgIah3d+O
 FtirAA9jo7GtIKGUvNIaOysrzg6yGFS5m1Ioes5P5iGPW/fPhF+llIcTwhmH6symH5XfIq0Wxr2
 vmHgozeGpKX2Yag==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
index d155d6799da6..1876fe9555d6 100644
--- a/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/qoriq-thermal.yaml
@@ -9,6 +9,8 @@ title: Thermal Monitoring Unit (TMU) on Freescale QorIQ SoCs
 maintainers:
   - Anson Huang <Anson.Huang@nxp.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     description: |
@@ -68,9 +70,8 @@ required:
   - interrupts
   - fsl,tmu-range
   - fsl,tmu-calibration
-  - '#thermal-sensor-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


