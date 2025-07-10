Return-Path: <linux-arm-msm+bounces-64426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2D8B00856
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 18:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C014C1C849B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 16:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2392EFD82;
	Thu, 10 Jul 2025 16:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w/w7aghk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02188274FFD
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164214; cv=none; b=BVkPITdmxRy/cV/ocRDkZGQhp2kuUr1JHKlM145YXM0GVdsZrVxPmQul/lhms/e9diB+m39CamwNXT99PC7svnGt6mFfHOpwiECksZTlQlABbiVjs/Kbd4gNH5iM7dS5s2Reukm7N+PA9FjrSgsfPbpskUSRE30OrzqCaXR4Z5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164214; c=relaxed/simple;
	bh=09k8nauOQI+SPJuQ2FMg+lvL3iW+Ogwh/RRpwWFIjkc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TzRITsUffLR71XN3y/9IsvlVmxN7o/uO1U/a+2aJOPn9mThMot1stYy58Yn730EJghYJQ9fAb4QlDJeMeXxxDSVwRpfvcddArm4U8MxZldGQcD9MdX/Jwhe8t1uKMxYizLz9g37cos1hqY2uL1cvUu3zJ/vEGLYfgxYnKAWZBKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w/w7aghk; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-3a51481a598so709665f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752164210; x=1752769010; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vh2A4NxX3SzhrObk7arX5jA4Dh37ZpCGm1SS0zq8Pao=;
        b=w/w7aghkBHCLpOH1BHLgUUAHSPRzP7QjMswi/6vcDZhcnNZc4ldoAgwdTh09LKUuid
         /LwJF2WNmP4VHYgInJedyb+XAnosAlOUVwrILp2aGFxBSW7cG9ByH+ZctcGx6GLcFYxR
         NBEZ9Nl8VUDTIjLNM48Cs3j1Ucw8tk+MgHkKq9FhckVqgGvEOEtRuVH/EiX0a2qVq22F
         MMdhDCLfXUR/znm1CTjRef1QQyD7Uo6QqmaTZ57ufVEC0GG+yGRqMGOrLEGdFMwg5MCO
         6lJtbbIxNJME3h7SjZ9YAf+QbgRSZiQd0WvO0nULQWzAe4z8nC0temcH7HI4TFC3U9fl
         XHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164210; x=1752769010;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vh2A4NxX3SzhrObk7arX5jA4Dh37ZpCGm1SS0zq8Pao=;
        b=C2gnDVzs+0NMbu8n3XeIw+PBscARh3WCiwjY1BbfKNj00RBfmKFmms4RGzYqQLNFFP
         kV/FCFHWVXED8wu+II/ILCRVJGaCKNzEMw5Mlv1fXp6R7UFnIBgSCPej/I+WdX5SV/Z5
         6NCHL9w1ucBwITokPGkAzxp5mQuyasL01AtrYkmADNlV6UuxrORi0NYOkExlgIUtbe3q
         wQolFno4zMSpSnqSHzFshH3vjfcY5PmC/mezkW90yj2zU6HdN1GmDeVfMfbhC4IdX8OU
         wxHu0uMDTCJaenLwIUpI5WVsGGJaZ/NvEZW3UnubjzGmADrPZAVZsxiSWaGo+vRBt6L5
         hHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI2GOz9HvRZUFZp6YYr3W/vXH/pas6Lqm2V6yHZE1Kfgr/jXMoJxBE0ELJjCNRKS4Jit8myAOVuO1s6ydA@vger.kernel.org
X-Gm-Message-State: AOJu0YxJVTdYIBLCMb7PC9ikuQ0A/+NZoPLTmaPmPlvJq+YVEbBv7UO6
	+lXBmVhQYiV0L+hWALtiM5sZjYlFdtANpsL/PmGDRfy/NdEV7SJC3Lt33Mmvkm2fV1c=
X-Gm-Gg: ASbGncuQ5ctnkbxbEw4hQjrkWFVARH96OWWKQ/W/XrsXQxSSEFGNBZKStM0yaKUWsut
	XX+kLLZ9HmLxm7kL8AL7p6rNDbRjU/hqsEW/J/MCq1mgyzlcMDZ75FBAukgBePxSFSzERXfLth8
	IhFvku7eEkqbgXMThu7GhJGDyzCreE7pY+dFxElNUAdkCJlT1Fu4ppsl5fPlQCqzucaiMzJJ/Ac
	Z7KXaeLsjBqnk4tIGJF1ErBnNmxwoJEmvzKbJruMQJqZG/SRg1BFmfvVCJv9R5TXwhuo6YnCV9A
	RPKkEPykSRLH/sr68fwS4GT3dorKQkoSo44g+C6ARWzh9VyekuzCAy6zQkPKjKWLKjhgSx3trhN
	fJTG8wn5uGLioxCsvpinYUmHDjzeain1GzgcsC/0=
X-Google-Smtp-Source: AGHT+IERdBO0d8lPpetUFVBGxZDmPMxF4u7RG24UaG947RWVv9nQ3kmWBfXeC2Ax/LUwUkeRu0REmw==
X-Received: by 2002:a05:6000:4402:b0:3a4:ddd6:427f with SMTP id ffacd0b85a97d-3b5f18d3d1bmr90390f8f.35.1752164210220;
        Thu, 10 Jul 2025 09:16:50 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm2314207f8f.34.2025.07.10.09.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:16:49 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Date: Thu, 10 Jul 2025 17:16:46 +0100
Message-Id: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7nb2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0MD3QrDVN3k4kwj3YKMSt00MxNjkyQzU8MU40QloJaCotS0zAqwcdG
 xtbUASxDxul4AAAA=
X-Change-ID: 20250710-x1e-csi2-phy-f6434b651d3a
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=09k8nauOQI+SPJuQ2FMg+lvL3iW+Ogwh/RRpwWFIjkc=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBob+dwghGiTiZwUODkbb3BqmCZMxbX8rhID17lv
 e3N3Z1CtjWJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaG/ncAAKCRAicTuzoY3I
 OrOqD/9kP6o7zHrhn9IppVvEfzzjSS6CG4hFOsGvB8sLItvuICt3F8CJOqCLRHRaLmEwdzLzw5I
 BCbuYebi4e4TcpD+ihirP3CUYJ1vMgBq4HVHK1E3LJ3DuityYMCJRuHBVsbPb4HYNDKSa0ocMAe
 eyghoWqK8PW/fRxgrLfY2c3JO3yVsBwRRXn40UCHZ8we5CgfDQ8GKTQhWJturXeE/QfW14JY9H5
 JXAwTkzVAw/NNb0AUL4QsHDMslHv5FcOsXTdqzVuzrTcYwyVfoNkmY4BuZzFZjvwGefBbrlLHvF
 qX4g0luzZx4LOqtxVGwEp/wylhtYzQDKx9H7PJ5nWn+W74nySj8FAqRsQpOTfECqw4Vtg0HxYpV
 BewQjhfIakBxPs56w7R6mWWa/h+Tj4eNJbzpxU3Yqd54eQskzgO0OqD98MOl4hA1nLzRElgCSYG
 H4xcJKKJyUAEjPjwtovKJy2myujH8JfvuQKuo2cLeWR5eq6RftXaNOKsWVbquEPoFDjqx/1+j53
 U565Yj5lhLsb7swxkY87Pkf5y16frcbZ701jrEciGAEwuQOygNb2tapF4eo0zEha6trJn9aKUUc
 LAzWu1/aWAuUVOhNr2GokB0HpobvfDDNKrwnmKm8gjxPQcVvHlPlxXpabrFARdniYpgpVigzZr7
 8tJJDqzgJ90Nj5g==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

This short series adds a CSI2 MIPI PHY driver, initially supporting D-PHY
mode. The core logic and init sequences come directly from CAMSS and are
working on at least five separate x1e devices.

The rationale to instantiate CSI2 PHYs as standalone devices instead of as
sub-nodes of CAMSS is as follows.

1. Precedence
   CAMSS has a dedicated I2C bus called CCI Camera Control Interface.
   We model this controller as its own separate device in devicetree.
   This makes sense and CCI/I2C is a well defined bus type already modelled
   in Linux.

   MIPI CSI2 PHY devices similarly fit into a well defined separate
   bus/device structure.

   Contrast to another CAMSS component such as VFE, CSID or TPG these
   components only interact with other CAMSS inputs/outputs unlike CSIPHY
   which interacts with non-SoC components.

2. Hardware pinouts and rails
   The CSI2 PHY has its own data/clock lanes out from the SoC and indeed
   has its own incoming power-rails.

3. Other devicetree schemas
   There are several examples throughout the kernel of CSI PHYs modeled as
   standalone devices which one assumes follows the same reasoning as given
   above.

I've been working on this on-and-off since the end of April:
Link: https://lore.kernel.org/linux-media/c5cf0155-f839-4db9-b865-d39b56bb1e0a@linaro.org

There is another proposal to have the PHYs be subdevices of CAMSS but, I
believe we should go with a "full fat" PHY to match best practices in
drivers/phy/qualcomm/*.

Using the standard PHY API and the parameter passing that goes with it
allows us to move away from custom interfaces in CAMSS and to conform more
clearly to established PHY paradigms such as the QMP combo PHY.

Looking at existing compat strings I settled on
"qcom,x1e80100-mipi-csi2-combo-phy" deliberately omitting reference to the
fact the PHY is built on a four nano-meter process node, which seems to
match recent submissions to QMP PHY.

My first pass at this driver included support for the old two phase
devices:

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/a504c28d109296c93470340cfe7281231f573bcb#b6e59ed7db94c9da22e492bb03fcda6a4300983c

I realised that the device tree schema changes required to support a
comprehensive conversion of all CAMSS to this driver would be an
almost certainly be unacceptable ABI break or at the very least an enormous
amount of work and verification so I instead aimed to support just one new
SoC in the submission.

I've retained the callback indirections give us scope to add in another type of
future PHY including potentially adding in the 2PH later on.

This driver is tested and working on x1e/Hamoa and has been tested as not
breaking sc8280xp/Makena and sm8250/Kona.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      dt-bindings: phy: qcom: Add MIPI CSI2 C-PHY/DPHY Combo schema
      phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver

 .../phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml     |  95 ++++
 MAINTAINERS                                        |  11 +
 drivers/phy/qualcomm/Kconfig                       |  11 +
 drivers/phy/qualcomm/Makefile                      |   6 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 491 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 281 ++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 101 +++++
 7 files changed, 996 insertions(+)
---
base-commit: 2b0b621d5db55cf01bb200e6e6976b4ff4810544
change-id: 20250710-x1e-csi2-phy-f6434b651d3a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


