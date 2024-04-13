Return-Path: <linux-arm-msm+bounces-17382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 825928A3D40
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 17:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAB111F21B09
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Apr 2024 15:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19ED047768;
	Sat, 13 Apr 2024 15:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zO9prDnS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D2446420
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Apr 2024 15:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713021413; cv=none; b=ZbgEKrRp5wi7rGGKZJ/W+bpNS3Mz6ASOk+g7vmdjZC16VqEGtZ3k5C7f7jnDgJXTlVVgALOq2PfVIDwedhGuIB2HqBW2JUHgkygEV5pdLA4gY7q9n/ZnfZPyJjQWvCDhZzLyoHLPdo2nFc1hO4yg9oiJEnQIAww5ttCUsfpeU18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713021413; c=relaxed/simple;
	bh=cFWp70sx3tMkTUxQbFvRrHb6KCDa5fBTXCWoL899f+0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BT8koVPS1gWaHXJmyRlgs/Qp1ZGJZ+zooyYU1NhzvCdENGhbZQwWkSsSOf2GfVabcnRHDjIH9+YeQ8raBPzBOfZ5xXsta4ca+tB30+uOkTrbUv50KvHC6l2YE5ceD+EfGI018+wtC6bsjoFQFFegsYzUAZA+j6rEDTQJ15oYNwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zO9prDnS; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a523e1372b2so146312466b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Apr 2024 08:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713021410; x=1713626210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neBvhCn+WPQ4h/ZjCZEYGqL+71G8ilgcVWxHofmS/s8=;
        b=zO9prDnSTpxuSgaq4Jm0MYfj2B7bBxFYN+oqXinpYuj8hsf2CUWwoLMSgC/Uz8ddjV
         zhltJjdiMYKvjPghjrVbyo5xfkURZvGqPlrsGaNEkDDm7zmRRVpyjaE8kVbMCa4RKC0L
         0W5bJVPcbZ//bV7FfOJFTfIRL9j7mHqsXru3ymAzDCqR0D5eX+hU82dfCULIk5N/jy2/
         MqFCvz4XXUFZVIG16HeCE45yZ/xiuemnLfjUmIgGB7axaSK/0XDV04XSE6cbPOYMtVyH
         xaVPqqX6X/0irCcjeqfBkTLtykXDjKwTmXYyJ2VfS0Svci4kdVKZwAd0h8KxpfnewNZL
         gkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713021410; x=1713626210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=neBvhCn+WPQ4h/ZjCZEYGqL+71G8ilgcVWxHofmS/s8=;
        b=ETHYXIv00RJGJY0DyEE569eInOkSeFa3Hc8CPsJvi0iNohU9GJvjPlnC/n/3u0rvIt
         QtuMHK5Z91L+0TGoDMEenlB7AwEZB2UwAUt3IQntEAEuHfs5QR8xDXGRmDDzHy91rOED
         i9GWVkf3X0RTS9DEuUiM45dGhBy+DiyR7ViuVltBA4Z5hE7jgl0LDutO/76pHZs3NNSb
         LdqpNC2Fk6O0dyWClH5xsgRNexhbUcTHs7zxa8AbjAAow2znZ9mHHUL+WHTp4YgfN518
         qgpNQAlplLjDO8MyTZvR+7FA+NkZsOyIUy6l+3ZKB622cnqMXaNbNPAygVBeXjVHZxRD
         465A==
X-Forwarded-Encrypted: i=1; AJvYcCUW7q5ZenGii1V7edtm8qdzT/xNCY50BFOknP6k6O7Buau3dODiEkClNU9KY+O79P20WsiSQUhaJOPnWqSmSVLd4flnhU9UmT0Hx4PV2Q==
X-Gm-Message-State: AOJu0YydNFkAOAFBQvs2qMgJzn4vObJ95djRD53137lp6xD4g1QUa5Dv
	8GFRBp+f5K34S/ICg/lTqoX5cWehLhXk3y1CUV66FFuGx8129tpsMDry+NGgCXg=
X-Google-Smtp-Source: AGHT+IGKb7AoZ69n1AqRbU82SfLvRprWHXeXmnEazQwF4CPLBoqjFQPXhLvrbO4PedaeR1TSm2No+g==
X-Received: by 2002:a17:907:7f03:b0:a51:b1a2:80bb with SMTP id qf3-20020a1709077f0300b00a51b1a280bbmr3648935ejc.28.1713021409795;
        Sat, 13 Apr 2024 08:16:49 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id kj15-20020a170907764f00b00a51a60bf400sm3104956ejc.76.2024.04.13.08.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 08:16:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Tom Joseph <tjoseph@cadence.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 4/4] dt-bindings: PCI: mediatek,mt7621-pcie: switch from deprecated pci-bus.yaml
Date: Sat, 13 Apr 2024 17:16:17 +0200
Message-Id: <20240413151617.35630-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240413151617.35630-1-krzysztof.kozlowski@linaro.org>
References: <20240413151617.35630-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtschema package with core schemas deprecated pci-bus.yaml schema in
favor of individual schemas per host, device and pci-pci.

Switch Mediatek MT7621 PCIe host bridge binding to this new schema.

This requires dtschema package newer than v2024.02 to work fully.
v2024.02 will partially work: with a warning.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Important: This depends on change recently merged to dtschema, however
no release was yet made with mentioned change.
Therefore this patch probably should wait a bit. Previous patches do not
depend anyhow on future release, so they can be taken as is.

Changes in v3:
1. None

Changes in v2:
1. New patch
2. Split mediatek,mt7621-pcie to separate patch as it uses
   pci-pci-bridge schema.
---
 .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
index 61d027239910..6fba42156db6 100644
--- a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
@@ -14,7 +14,7 @@ description: |+
   with 3 Root Ports. Each Root Port supports a Gen1 1-lane Link
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
+  - $ref: /schemas/pci/pci-host-bridge.yaml#
 
 properties:
   compatible:
@@ -33,7 +33,7 @@ properties:
 patternProperties:
   '^pcie@[0-2],0$':
     type: object
-    $ref: /schemas/pci/pci-bus.yaml#
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
 
     properties:
       reg:
-- 
2.34.1


