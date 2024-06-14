Return-Path: <linux-arm-msm+bounces-22699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CCD908869
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 11:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3CCAB24918
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 09:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBDE19DF7F;
	Fri, 14 Jun 2024 09:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O8504xe4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859A119DF4B
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 09:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358425; cv=none; b=FJwHUDWCLpBSj5FT98v0vOTN8Npn5n9SpA8MKNt+sO5lBxZif38Z/t3Folj5GA360TrUHCMoSirbMOqjqb+YOPXslQThx0R4l917ndc1eNd5bL5duR2/pvMzuI7moJuemFpy9IAlupqnSoNyhSAi2y8JLzhP1TEz5/jDWJ+aFS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358425; c=relaxed/simple;
	bh=rpuNS2iyU2OY1Fsid3Kqc5QDO3n5JBWLxF/W1R0sPwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ECko+Z62mSJ7k5E0DSGOOpCX5u8Ck7ha0i388hbrKxS780b/NiiMMrWosLpf2nRmaqqcFLUQH5+d4wW/khGYSweNHAiVCwpi48kqhhrtH/bJgpzCH4dILvhUQdj0wwwiFLhs+KwGnYnxIVfrSI3BtOMxKeCSmctMmrxKPavm2yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O8504xe4; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6e43dad8ecso360919166b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2024 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358422; x=1718963222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xst6Q4HKXSHpj0dsrGI7SNIM5Xkm2Oh1h9QPylE4GLY=;
        b=O8504xe4tVrpOkHmEUOvU6cp1trBWXIlZUiUIBYMzP6PY5lVdpcTEpBUFDZdD0oTH0
         Xlus/V9kOes5k3qkKPk0ENHj1eqyVM/6iFaEhm8UkAoJUy6/S5Fv7vr4FZeuEwb0zH9/
         Ns7VK1u8u31BQdUsFAqdVnfgV8mmbMIDtXD17wZO1a2FQr6bP4nxomJ2cIECgYnChbX9
         PiOLDLp156a+vDWcVFrnhhrVtYXy2Wo8leeQGNDGM2ZuBBswaeAO47IKx6pwZ114GXYI
         bYx6QRar9bRYAIl5vqW3nOwVpFBPKO2Qr2aT0c2VkwG2IrcBKdWWfWaBToUo2NnPdokL
         5Lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358422; x=1718963222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xst6Q4HKXSHpj0dsrGI7SNIM5Xkm2Oh1h9QPylE4GLY=;
        b=Y4cDmtCdWlxAdLn0gvRh7icBicGy5ff7DceEm/OUdgwyef5r04XYPDbUseqBpDtiHr
         GiATJYMDTIu8fDI74IWjic0pGOJHSWuoTWFB9HmECe7MRAS3go35iCURglltSy9iH5ny
         GgLwZFy6IGTDKjWNRffaRyupfRrEPJoO95284BTvuyUtDq7m2F/rJGaC5nxmVQ7hLhzF
         uAKIcCyod3wrWZR58i+Qpj6XLRF9tdVhCc/2eb4cQIDPUXrHAscjSo6GpT+W2/PWjswP
         cpo+V+xyakMhtARQdBxTE1lUyp9E7sLVpssk6d1Tn3I8UapdEwm3cvnTe0ND4baRq/vX
         /lQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPV48xqvY3IbrxChKMtWy9s6qVr3qPhKeyMfnQgKSDlKUjKt6zsECurEC89Aci6Y6pMXY/dqFwFFB9B/SA3NeUiahLDSR8yCv8+u7siQ==
X-Gm-Message-State: AOJu0YxarzvkQeIhuC2MGVVe4rIvBdPOznGY10TOibj5hl1WF692pp1p
	ZaM+mqzEKLvfz0OlIrZz/ek/Ws6M2yLCRSvfh3hwNLNPi47IyqXNmJnZhZzrv/k=
X-Google-Smtp-Source: AGHT+IGAEOJ8/Eq/DXhbXLqPscGRVDNmR6uXpGnxSfm7LmH1ErumRz9nwzEhow0zGr3WMGsUdb3qBQ==
X-Received: by 2002:a17:906:9c8d:b0:a6f:6b3b:d034 with SMTP id a640c23a62f3a-a6f6b3bd16emr35934466b.2.1718358421943;
        Fri, 14 Jun 2024 02:47:01 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:47:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:12 +0200
Subject: [PATCH 13/22] dt-bindings: thermal: rcar-gen3: reference
 thermal-sensor schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240614-dt-bindings-thermal-allof-v1-13-30b25a6ae24e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rpuNS2iyU2OY1Fsid3Kqc5QDO3n5JBWLxF/W1R0sPwI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFrkuJnoT5D7TUdkG7FcAVQbX/5GndtGQlj5
 3lpE+6QYFOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRawAKCRDBN2bmhouD
 1wzaD/0Tab4yh0LCsewgEaD/ET5KJN+2kKHthAr0z6S2A5kFlUNqTxe/e3Uj3hNmO5eXvlrViui
 2Y33IWyT190pg/BJizhRchR4cjGkup51OgbLSjJsTpTO+NVC67xRxXuZvm8KHPIqk1d5AUnuorz
 QQ0E8O9UI9GpZ1WtXnrKVhLIGnwrCTPiyVXaKZMmTGW2TPFNtV6AUHJ62pISBPvJu23hhlgWtK/
 brvgzh2e5JMfwDvzg3u9O6SkCqZL7h8VXiRA/ooujXQSJztMxQT6BChRZUvlxwoQzz6VG1kwMeA
 ooj7ACmcdZUwXi3Npgv1akW45aLKyDmC2D5n5+FpK8hi9CJBi1MZTIPXVlx0sYRD21Q7imj5uWM
 wK4okjnLJTCj98w5UUxpfNA8fqeVtag4Ybsu9ia5cTqR1RnyvfdPy5IThulporCW9NI5x5pTmOq
 4I+4ovx5uBLQL1VlN/1q8EP33MfumMbiiD6mL/YUoYOP81xTmhd24ZbHIgN4qzMdKDEKnaM0AhL
 9/B0GekVy0UOV84c5RE2n7KhDCexOSXM4ehaOgKYGcDeQfE9DEJc9PjsIvo91q5PfU3MRzsq6eH
 BekBHTSU0IWtc66yGmQuQ9VSYgTr/NrkM0gfmAoDoECvtGGhESPKKe5TDQlhGjaOfh03wP3IpPV
 V43AIzP/kZdGwxg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
index 6a81cb6e11bc..d92e882c9e8d 100644
--- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.yaml
@@ -15,6 +15,8 @@ description:
 maintainers:
   - Niklas Söderlund <niklas.soderlund@ragnatech.se>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     enum:
@@ -57,7 +59,6 @@ required:
   - clocks
   - power-domains
   - resets
-  - "#thermal-sensor-cells"
 
 if:
   properties:
@@ -96,7 +97,7 @@ else:
     required:
       - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


