Return-Path: <linux-arm-msm+bounces-28415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6594950CAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 20:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82B4B280FBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 18:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83CE1A706C;
	Tue, 13 Aug 2024 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qWfOiFjv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE211A4F3F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723575523; cv=none; b=doUGBQaHMYfe+h+IVcQqtVECnTj/GUeXrWfE7e9Y7J47Z8Ysl8HX+rMbb6jZdbveW4wD78cqlkbuJVuVsp1aDXRqHYzEDRtiWQPvI+wpi19bZJJRJuqeLOhMmdFZJXw1gAyEQMkq1pAe9MgKjWK0nWd4B8Trxrus8BL0PxmH/ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723575523; c=relaxed/simple;
	bh=cgKJ86aFQSXRkOjVomh98YNMu7bmzApkdVedZLziGQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q69ODHKcA2u4tdqPiCoiu0QhU+p+JOl8aSw/NX/eIigUw+6OfaJ6cBbgQxBhhUSp8eUc2X1XPct4Gj8THrsGiKf1AI2xzdqyI6gwOw9xeFiSi9FX2ooU6Q3vi4CFQ0A74GNFkUdHBhWETvh3QcRZBqxjAqvS8FN4PHeXN0yu71o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qWfOiFjv; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-530e22878cfso5370373e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 11:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723575519; x=1724180319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUV4XHIlWDdmSvDrr/xcQAhn7NeKcNTvFWfePKkt2OE=;
        b=qWfOiFjvafyFjK/BMEWr1YZgOL5h2I57oiPSOX0QdINpGG0sI9WIiNPWeJs3yFZbs0
         UIBfX5K8BFBW14TtKnbKAqP2d0GE+hHxwAB5V7EDIX9/k2CVPhv3gfgdDGYcxgAFjDj6
         N4ZKn0B8nMX+I1e3ponl0nD2UReqevGHqJduBYhHYKiM4fykc1s+0VLtCLI6e5RlWROD
         ptIKrlxwS0KizXOnQl3kv11wHLPfjd4qT/8E/RMpux25qbLCcje5cihTnT17mj1kSjnD
         8Q4EToNB0mX0mwyiV4gw8iqbFQNbXWitzOaQEu4sWxmkWeTyFaF9ldrjp8C4AZON9JC1
         MdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723575519; x=1724180319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUV4XHIlWDdmSvDrr/xcQAhn7NeKcNTvFWfePKkt2OE=;
        b=kHNFpo1TLM0w3H3Fn9dFqoY5bFYJQyl07ssnWUf9NRoi4nDxQPrTpB7lM85UOne1v9
         t1iCY5U69Cci/uCX6HflI+DYcbIPexON5CVYF7yzRGr/Q0xzdnLzXZ4aIQCjPbK7UHpp
         yBSzH+5HIyik7PPUOgebp6575u+hnQrDEs4gUc4gKMub3dWMnrQ3ibIXqAT+uCmaXFjq
         hnlLsJUnZJpsEwyPp5gmN309W5ajqKBIQAcqaTKMa7sFS9WBNTLXi60l7JlaipJCZoOv
         6igj2hVFZEGQkg0jwjxQVezFRka22NJIyzU4TWHEHe7Xtst7z6Wz7TcnFQrAoDWQ2q0p
         mZdQ==
X-Gm-Message-State: AOJu0Yy+vKmtVIxC9rgIhdbk9cQgjPyg1zQd/KZ70G9I+JcsGAke4lIN
	Mvt4+tl+Iw6Jxa1OlQh15w3LXgXOwdchyXqSDkeuZPQcbAtvmsDkPxn5eEPJ+9k=
X-Google-Smtp-Source: AGHT+IGlYNi54ow/y9t4POWEbVoEw86CSboMPSwBpuuHQA7APctLUhJ3CK5aCCTQbHdiSdknwVbK+A==
X-Received: by 2002:a05:6512:39cc:b0:52c:d626:77aa with SMTP id 2adb3069b0e04-532edbbf2a5mr203953e87.58.1723575519313;
        Tue, 13 Aug 2024 11:58:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3979:ff54:1b42:968a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c775c509sm151208145e9.44.2024.08.13.11.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 11:58:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 3/3] regulator: dt-bindings: qcom,qca6390-pmu: document the swctrl-gpios property
Date: Tue, 13 Aug 2024 20:58:27 +0200
Message-ID: <20240813185827.154779-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813185827.154779-1-brgl@bgdev.pl>
References: <20240813185827.154779-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add support for the swctrl-gpios property which contains the phandle to
the GPIO indicating the clock supply to the BT module.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,qca6390-pmu.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
index 6677939dd957..11ed04c95542 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -68,6 +68,10 @@ properties:
     maxItems: 1
     description: GPIO line enabling the Bluetooth module supplied by the PMU
 
+  swctrl-gpios:
+    maxItems: 1
+    description: GPIO line indicating the state of the clock supply to the BT module
+
   clocks:
     maxItems: 1
     description: Reference clock handle
-- 
2.43.0


