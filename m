Return-Path: <linux-arm-msm+bounces-17033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D30589F2AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 14:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60C161C23661
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 12:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A90415D5D8;
	Wed, 10 Apr 2024 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rS1ARDiz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A39415CD7C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712753218; cv=none; b=KWltmNueTc9pV6x5A79Tz0TbDb3KFxLaAyn4e4K0/MftWwPGwLsXEQ+pfdVStf0usiL9HItwTqM0RbuAc9iaPQh217oYpIYkIVpp4HTEiCBBiA+LfIIlr6DbaiIhjWixuqXwk4grADs0XN2vUyBJckhDnIo0woSHKRPwKseQn/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712753218; c=relaxed/simple;
	bh=MUjIQBvJOiC/7Sk0sNr5/dsV71Wum/L6nN9MsfPFHbs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EZv8URJOb0keqJb20ei64K3AimV2GMFWaF1LGQ4XUWOgMEX4duZTU3fvTSoh4r0IFoxw5C2ntR6pxBrwW3m+UiolPA3nQ8b3DTgR4F6EFKeAP3BWtQ+0OyXA2Ae1Cx40sxCFmU5UqYdpNhEe0LFZ2m1UgEKQ5OgOVtJPDVCmgoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rS1ARDiz; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d6fd3cfaa6so82993811fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 05:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712753213; x=1713358013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROLNBRTJMkk3QD0/QYv3fhL3ZXVxKfd2xATXL1q1dGU=;
        b=rS1ARDiznv0LUNq1SwctJ8DSF2nFAvy85MROcanSwVO+40T+U3Tid+VIeg9BqNWkwP
         BEm6f6pKUxDLl0EgpEbTCkRCmk+pbFORfS5/eFEw640FFbp1aJtRCTmDl1ZP64DJ6+sK
         rpZL+JiYhsSQmjH/f/FZr8ME/5HCV3ZHlypiq0mEQCHxyI0WKmvpVAXoBjIrEYhDAUcL
         4g7rhtxSlShm7ztBMrPQQmPkI5UoL1hxHTyy+vXVtgWYcf+aDQnTyf/QP9ZRKsVtwmVt
         LUxF75pYnXHauDbgwQzRKOiJKG1cEfg+hom19HEVY6BrxRLgZXQQimF6q2ALc5jxf4m0
         621w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712753213; x=1713358013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROLNBRTJMkk3QD0/QYv3fhL3ZXVxKfd2xATXL1q1dGU=;
        b=RfAbCZS/3z9FrDN98mZOLcnYvewH0EfkEMt+hp/SH1yX2CZYY/M855C2JGWGqXRLAe
         RzJVOkACR+xy/mPPNYUZIcMvTUDDUkItaYznYT2k8co/rfTiHgtSh0Xg5Agjx/ohGdut
         DvFDp/yrSU2HZGsfyM3JuudaCQoJ4WhX0vPCUB9+EDYAvKRO9VsYiZ3ZeVhfoFmoNfPg
         3CFsAUsqEoRMqCoSc9rROaVESsRpKhlud2HDCMF91whGoYnurh+PpnUKmOtIEhJmNb2k
         KEWLwHwRtsUAmb+6cNHkwYtTSHgrres/J5wG+lk7TQwa3cCw7OZALxgPn7MjypeGv6X6
         hq3A==
X-Forwarded-Encrypted: i=1; AJvYcCU8KfQXmpNFv06+7mok0teMQtgQXqehFaYn7rL8KNr7olrHEqEGT5mOndwGTHNIvm4ZIKFInfVZEGtQ9fmLOncGB82b89NCt3lvdthx7Q==
X-Gm-Message-State: AOJu0YyE99OAD8mZDNXYtHoITO7yDyoQbIVLxu9eXaNN6C8aHFEvtblB
	fhlSxtBDnCBO+l3w1LCJam1TJnIH/PYkGh6tAr4/sgAHMqPlK9maORxtgu+J5O4=
X-Google-Smtp-Source: AGHT+IGcE17iy2sNXYQsxYzAek5ZghfDLdvdj03jEMwZ8tyclrpGGb6yIV78jLd5Tw3AyCSfFGF+Kw==
X-Received: by 2002:a05:6512:3282:b0:516:be66:4d0 with SMTP id p2-20020a056512328200b00516be6604d0mr1508391lfe.56.1712753213325;
        Wed, 10 Apr 2024 05:46:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:6908:7e99:35c9:d585])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c444d00b0041663450a4asm2150929wmn.45.2024.04.10.05.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:46:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Saravana Kannan <saravanak@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>,
	Xilin Wu <wuxilin123@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 02/16] regulator: dt-bindings: describe the PMU module of the WCN7850 package
Date: Wed, 10 Apr 2024 14:46:14 +0200
Message-Id: <20240410124628.171783-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240410124628.171783-1-brgl@bgdev.pl>
References: <20240410124628.171783-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The WCN7850 package contains discreet modules for WLAN and Bluetooth. They
are powered by the Power Management Unit (PMU) that takes inputs from the
host and provides LDO outputs. Extend the bindings for QCA6390 to also
document this model.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/regulator/qcom,qca6390-pmu.yaml  | 36 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
index 9d39ff9a75fd..2e543661a1e2 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -16,20 +16,37 @@ description:
 
 properties:
   compatible:
-    const: qcom,qca6390-pmu
+    enum:
+      - qcom,qca6390-pmu
+      - qcom,wcn7850-pmu
+
+  vdd-supply:
+    description: VDD supply regulator handle
 
   vddaon-supply:
     description: VDD_AON supply regulator handle
 
+  vdddig-supply:
+    description: VDD_DIG supply regulator handle
+
   vddpmu-supply:
     description: VDD_PMU supply regulator handle
 
+  vddio1p2-supply:
+    description: VDD_IO_1P2 supply regulator handle
+
   vddrfa0p95-supply:
     description: VDD_RFA_0P95 supply regulator handle
 
+  vddrfa1p2-supply:
+    description: VDD_RFA_1P2 supply regulator handle
+
   vddrfa1p3-supply:
     description: VDD_RFA_1P3 supply regulator handle
 
+  vddrfa1p8-supply:
+    description: VDD_RFA_1P8 supply regulator handle
+
   vddrfa1p9-supply:
     description: VDD_RFA_1P9 supply regulator handle
 
@@ -50,6 +67,10 @@ properties:
     maxItems: 1
     description: GPIO line enabling the ATH11K Bluetooth module supplied by the PMU
 
+  clocks:
+    maxItems: 1
+    description: Reference clock handle
+
   regulators:
     type: object
     description:
@@ -83,6 +104,19 @@ allOf:
         - vddpcie1p3-supply
         - vddpcie1p9-supply
         - vddio-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,wcn7850-pmu
+    then:
+      required:
+        - vdd-supply
+        - vddio-supply
+        - vddaon-supply
+        - vdddig-supply
+        - vddrfa1p2-supply
+        - vddrfa1p8-supply
 
 additionalProperties: false
 
-- 
2.40.1


