Return-Path: <linux-arm-msm+bounces-52187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D57EFA6BC47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF53E3BA4FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 13:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C77189913;
	Fri, 21 Mar 2025 13:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8zRqAwD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA34813B59B;
	Fri, 21 Mar 2025 13:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565544; cv=none; b=N9sFWoJjEOm0PwciBA9S7zE9AZuqpxp30v5Gy4i6oBrw/hIbLRealsfAX3lXk1IHnIxgK6gVS+Hm/UrCHVWvhtmZfggzVdZj0dPOV8G7h3ondUE/JFPQIpmd62vEmdnACpgxS3e0hucI1+lTXFq8UtzGZQdmOglhxWiaPBpaDrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565544; c=relaxed/simple;
	bh=jsQQOkrQmvbShJEtG/AMWe3sjG5owu6VcOYtQWsu03I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QcEHB1zPEr/PjFVFClMO7VoDeWWUb6SKPWVFnHmb+nVbKTQhnRFgtp2IcipwHQLcLfVGcY5ckPS1FuaJKKruQmWDXobiAKAa8XX4pNeLVRgARxI8IHrJN8TfQXac2KOrTJ7tiZxU9qDcdqVbIIMJ0DA2VOKgN+EcQH4BxowUZbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8zRqAwD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3913958ebf2so1697589f8f.3;
        Fri, 21 Mar 2025 06:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565541; x=1743170341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIPPP5ujVDHuio5jUo3vfs/ZWMgoIwqmA1jTNPm5vS8=;
        b=A8zRqAwDY1EkUiho9InAXa++qRN/oPHZlPRRkCscr1by6Epa+QCKkgYA/v/uJoVt2P
         U4EKOEloqZV5+dGaoMM3oauc0u4y5qL9iQWk6UcoFr7GWa+w1mwRMqEgvi2zULCsyQ6b
         kfkjOUlqoBi//rcAUGxxZoTbgItHF4SJ/N3R83C25Nc4u2uVucWwri12v28AXcjMasWo
         fDcuS9+K/L/npRRlWoIAA8qZsxFC3yX7kQ1sMJIulY1Fq18af7oT5yPBH0EZCDcbtRgp
         dMzcR5xBSk6YogUgO2a3Wh7s4cGe94nS06ODF/rPXoVpxGqslUSB4WBmLmxQ1kLRUE/I
         NTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565541; x=1743170341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIPPP5ujVDHuio5jUo3vfs/ZWMgoIwqmA1jTNPm5vS8=;
        b=mrFglYEtppJu63xpzHGeMfOiFg/BKksIRLLBaGjnG5DxlKUSGxfjejCRKwGl5pnDFf
         n7CPYozmMoTBmvmSPV4cOxxupy83O0rKHVt7Wus5G2rEk6VCpK5eKpj1s1NuzSOmcrkp
         mOIdr+M3EXkYOIa2CdGT9qCXNZod1KcuD36asEuSX8tGtj7NXaWyJyfEU+2CQZASLrpM
         KKowyR/QlS8GTYAOV7pmQZT80KGhuPVwYOm2n7nnX45KHCs611X56dRxLauZg+1HrziH
         VKzKRfW5WpGVLZNCFXP8Pmhpti+UCydYYsoUzziG+0KWyD6fY4v4YmGNt8Hemr/53LhM
         40xg==
X-Forwarded-Encrypted: i=1; AJvYcCULMhd7XOcwmTt9rhQLE37gtAV/ucZiOFBT4039HUYKvT6rxHV6I+9OujcDtKsMnKhI8l6dJAuMIP17@vger.kernel.org, AJvYcCUalvarDaFZvcPF1+7TggOEgHl8SUU2lnyW7Q6qBy4uWUifiFP4uS23XEqiiGwXsDHMjekBJGhQjsf+WewJYklgvew=@vger.kernel.org, AJvYcCW+DFgzmFm0fUGSWMVlk2nQbdMSrb7J9BEbKv4hYTIq1+xH5k/tDYoZdKACKqRX6y+p9lfSVDr9KrlLCVgQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJIed63pULa64Z7KXcGcyCsAXzvm4Fwd6gw4xudYMYc0xe7ic
	xsH3pXTJXx9QU5Pjp/P74zAxnU4G9SQRccR4VYEYJnt580xyDdam
X-Gm-Gg: ASbGnct67JQUxHl2Wlz99WhE1cikG4XFOczEiAxo3yPI7/qIOsZr14Dt61sKnU+QKu7
	NhTPNBEELMhe4n5cvaII1/tAUQKwC+2/8tNZg1ldnoKZ+QtDm6cYESvCikWT7Q87q2NsPt8iJTV
	f5uVlUAdPVeb5gN7LDH5DIfMQrtnkO7a7ehkh4jxD/F5GLY4BAbAxtiKAmwOy2IK+gfS7pW7olm
	3fkXBgNDbEsbKNmQLXmiBMCxvAbl+BsIX8PY0lUJ3/bgl+gFM5DvcgeI8XmBGKB3I40OYi+Cvcv
	akbgjJarDVAfn9hTvNOCdGUUfCE5p4Phr5w/5poVYpIoaXatEHAQai+atDzj+OCeMx/wTCdwh2f
	+4BiiIhGGs+834DJDCW+AbWDZHRtu5jQ=
X-Google-Smtp-Source: AGHT+IFPFP42aVOYqjs1M5n27C94uUx314miaX7k0Qe1RphsqIE1/Aq6oAnk++IxGDHQycnfkPWZLg==
X-Received: by 2002:a5d:6485:0:b0:391:4231:414 with SMTP id ffacd0b85a97d-3997f9397e6mr3645126f8f.40.1742565540690;
        Fri, 21 Mar 2025 06:59:00 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:59:00 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 02/10] dt-bindings: phy: samsung,usb3-drd-phy: add exynos2200 support
Date: Fri, 21 Mar 2025 15:58:46 +0200
Message-ID: <20250321135854.1431375-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for Exynos2200. As the USBDRD 3.2 4nm controller
consists of Synopsys eUSB2.0 phy and USBDP/SS combophy, which will
be handled by external drivers, define only the bus clocked used
by the link controller.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 16321cdd4..819e4afe6 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     enum:
       - google,gs101-usb31drd-phy
+      - samsung,exynos2200-usb32drd-phy
       - samsung,exynos5250-usbdrd-phy
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
@@ -33,24 +34,32 @@ properties:
       - samsung,exynos850-usbdrd-phy
 
   clocks:
-    minItems: 2
+    minItems: 1
     maxItems: 5
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 5
     description: |
-      At least two clocks::
+      Typically two clocks::
         - Main PHY clock (same as USB DRD controller i.e. DWC3 IP clock), used
           for register access.
         - PHY reference clock (usually crystal clock), used for PHY operations,
           associated by phy name. It is used to determine bit values for clock
           settings register.  For Exynos5420 this is given as 'sclk_usbphy30'
-          in the CMU.
+          in the CMU. It's not needed for Exynos2200.
 
   "#phy-cells":
     const: 1
 
+  phys:
+    maxItems: 1
+    description:
+      Phandle to USBDRD-underlying high-speed PHY
+
+  phy-names:
+    const: hs
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
@@ -137,6 +146,27 @@ allOf:
         - vdda-usbdp-supply
         - vddh-usbdp-supply
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos2200-usb32drd-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: phy
+        reg:
+          maxItems: 1
+        reg-names:
+          maxItems: 1
+      required:
+        - phys
+        - phy-names
+
   - if:
       properties:
         compatible:
-- 
2.43.0


