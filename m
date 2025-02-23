Return-Path: <linux-arm-msm+bounces-49055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00644A40ECC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 13:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 629A91898E37
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 12:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAB3206F25;
	Sun, 23 Feb 2025 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsJwR32R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D44C20409D;
	Sun, 23 Feb 2025 12:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740313356; cv=none; b=olemZkrAgqjYhZJJa1tTbfwOa28l2qjSJKaYkB2dDIIcVCfP7RQNxWIXdRR6YU0y665bAMdSqNDvjL6Tzx8Pbl6gC1rCokkZljSyb9pWw/R8PJ482LqTf2axAzUslzfAXE+dKOYXUdax17gwzRtI6BXeewlFTG4iRAmhw6Sd05o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740313356; c=relaxed/simple;
	bh=5kv+oUncvcmPyEDFirc9RwH6p4wXr6C2jOa6K8b8JPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JvrwGn5/BozIM9LA7+8Zt6qO/AMP1Wi7EJ7+sjlMAZtepFC6E4laY8El9/+SJQmk+DYaICcLXgguLTKtPF7yBtD5dahug2+wB3L1IRAgH+/v0EoY4BM0Y9NTR3bNg4sKZYdkrKxUW3F0Or9i2HS08ngdyZ8pT+czQ7ra4lNbT34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsJwR32R; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f406e9f80so3293854f8f.2;
        Sun, 23 Feb 2025 04:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313353; x=1740918153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Imu1A98L2KP46AIXwK/kKuPHdfCAq0a74bOMQZLOfVI=;
        b=SsJwR32RnnO67tpWIQ0lJzdxCVs8QiECH/mnDhGDZjUb3Y9W7t0uJ9jvMYlExMy82Y
         +ekHC6pwoXTa39AfgofKE8c+hKQx5CC5uflrvARndayqn4bqlthOmF/rPc26y6r1m6gC
         5vzpGv0YETqaR7WM7YBarxBOp92Z+TUD+KfjuMsVGxbygFXw9P1PZdQfcfoNEUP/m0Xh
         m7Pw2qdh8RmLoWJXF4Ftx2mpSZrEGieDuKQVinCjRMb3iVTFREqBnz8J2gZaGJhrXUJe
         Az0564SEzlr5fPiKLzAlK1tkGJ1ou+6g4R4O0bAO4nY+sfOQZyZSls/xfguC5dOuqVva
         4xKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313353; x=1740918153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Imu1A98L2KP46AIXwK/kKuPHdfCAq0a74bOMQZLOfVI=;
        b=pMytzEXdk4UmV3maX6e3xfkKiTenlsp2P371NtiDaE7UfXiZOf+CTssHgenEySYnmq
         YGIHeIYBHqKeGNSeNJcGUDGWaCLX6AbOgvCi8ygFQ2erDUwz3Vk3o4PUtQeYs5qvYcNB
         TxQunzgC6adJSdgPxd2xsT7TGIDvM/LP1shTrWBYtEBx3pM7/HThgEEdkguOvR41NWVS
         rOu5zTtNuvIP73c50H4KlYlXnzy1gH7aUCIVk6hD1q70RjntSZ58L3/EER0heamB/kQt
         qvUpM6XY6OH5Br4TmZ5cKfWiOfseKq4oEBBvDme+tpcTF07moSeWwcGZH4l4eWs6T78E
         qN6w==
X-Forwarded-Encrypted: i=1; AJvYcCVzNwXSLpfc/TDQ0yYKXRyDu/5q+9w3Ie18Nf9sK3ch+Gzb1j2RPf079d30UrnqH/odjKp5NMFK9vre7+N8iYOhon8=@vger.kernel.org, AJvYcCWG82i923arM838q7Qr1+0Ja+9NwzyhsAQVF4bzCIowYIPP9IExDI3dIK0avZAWCBoEIrAEpNS9VcROs5Tv@vger.kernel.org, AJvYcCXzUlxA4Yq89VC8Eu1nd3LI+iFZWzEljSGb/mV6Q2VvLBSyAUYhIpLubGXcZ8on83jDwVGbnBcNTdgG@vger.kernel.org
X-Gm-Message-State: AOJu0YyHWYdmGhjeefLgyaDFQreSAEqpDQ5xTdbbT53Bud5D2DSAnn+/
	KWeHlpgSyAtjoDgZhn9wF0agfshCL+90KSZ0nQolnyegAdiBIUYV
X-Gm-Gg: ASbGncu8Xv9yvUPP9DK//2ZK2aklgdlchfZy3D30J7d8tjQgqFfJ9yZ8UgzJlWxxKMS
	kTQwplNcm6P4eLJpHloJLKbzxUGHTkCR/xzFElOSv0jJ7lq4HMOWKidWJukHOkUYWdTMRTLKYwH
	cSCeAmb7LUkzDGCZ1OGRO1GilYZkuvzAAgrOI+ExG5Ru9TNj3qA3Lp0g2mBpgYsenW1bNNchdwA
	BuTKmpVKR0HHesNlcNpWlYeOxDgimijBFRbb+2ZO8/u5wu3A62NxHCzGrAeYV97QOLvcnLn9QWd
	5UR4xIhDYF0nCla8wMM4jA0XwsMo1LvtwqYJOYRp/kNeCBcNFovmjaFZnS3OhPZnWFiHtjiF46x
	jig==
X-Google-Smtp-Source: AGHT+IHaUz0XhpP9SWkDpIHgSlmiijMV4PEbmK8V+w/DLEX2GzBOqorv8lkEfT706XJetrp/boI5lQ==
X-Received: by 2002:a5d:5888:0:b0:38f:2efb:b829 with SMTP id ffacd0b85a97d-38f6f0d1d04mr7837154f8f.50.1740313351723;
        Sun, 23 Feb 2025 04:22:31 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:31 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: phy: rename qcom,snps-eusb2-phy binding to snps,eusb2-phy
Date: Sun, 23 Feb 2025 14:22:20 +0200
Message-ID: <20250223122227.725233-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As Samsung has been using the same Synopsys eUSB2 IP in Exynos2200,
albeit with a different register layout, rename qcom,snps-eusb2-phy
to snps,eusb2-phy and drop mentions of it being only for Qualcomm SoCs
in the binding description.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../phy/{qcom,snps-eusb2-phy.yaml => snps,eusb2-phy.yaml}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/phy/{qcom,snps-eusb2-phy.yaml => snps,eusb2-phy.yaml} (90%)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
similarity index 90%
rename from Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
rename to Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
index 142b3c883..22c77968f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml
@@ -1,16 +1,16 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/phy/qcom,snps-eusb2-phy.yaml#
+$id: http://devicetree.org/schemas/phy/snps,eusb2-phy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm SNPS eUSB2 phy controller
+title: SNPS eUSB2 phy controller
 
 maintainers:
   - Abel Vesa <abel.vesa@linaro.org>
 
 description:
-  eUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
+  eUSB2 controller supports LS/FS/HS usb connectivity.
 
 properties:
   compatible:
-- 
2.43.0


