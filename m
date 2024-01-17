Return-Path: <linux-arm-msm+bounces-7479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCC2830A9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 17:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 658F11C25C76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jan 2024 16:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E585125561;
	Wed, 17 Jan 2024 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QK7JaqDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C39E24B5D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 16:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705507722; cv=none; b=Bd84+rd3HiK/dKGlX9VujMzQFHadJZsEFCT2UHObuQZgB2JknBH5Q7ZK9G+Q7fMVehAGtM9t2uIhOihiY6XWrahwnHby0x39QZ3CDT6yM4YLQ14jef9tDPTieC//huMz0f2JPSaRUWSLizzIqC/0vGgT9OtwMnEvwVb0LEuTfNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705507722; c=relaxed/simple;
	bh=mM8PwsCjRqxpEKB13QqnWtlTPmsb6ofAXID4BuBezD4=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=FX7dIciy00VL6CtiWjkDx2Z17aD1fzXGejheF9L+s2M+Y/t7MXVJI/7jVrnMHSVpN/xi08duHrbKPiwB9AoWrEwU2WJPUtDpNVjOoAzozwvvTgoGGcSw0MmbL9k7ftHLTqDFScWD/Y7rtRCe79uHpWviS2bi48Ncv168mZVz8/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QK7JaqDA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-336c9acec03so9240476f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jan 2024 08:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705507719; x=1706112519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KiJFCSMkHl908ixeSikSO3f5Gun1Y9vXqztuxAOHIc=;
        b=QK7JaqDAX6UeY03/jWwluKciFOE4L7Z5QtbBbJsRWC+y010PQ5RkuSa7L3v3FXLFkZ
         +tSgLHDiYLvyGfbzKdaoYKrzIDO49cM+ZQ8nhgOfiHJKx40DfnX1+0aPK0FsNALedjOP
         JqIC25RgMeeUU31utBLG3fsLKCbCYSCaO11r0x8RpW7+jBrx/hmOZ8JkSG5vT0daH1+z
         1mWxjBcWyxs0Zpf/9AZyBD2Xz1ThUcQS+lq4kFOAcU7ubuvUbHRePdZSWWeBbQUlcO2c
         UDjoFIgh1/ceEp8738+sR7R0oiVQ5lciXFigpkpJMHjp/wZuaCqAYcY+wgLGvHX42Zim
         cVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507719; x=1706112519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KiJFCSMkHl908ixeSikSO3f5Gun1Y9vXqztuxAOHIc=;
        b=lxK7mT5goxFYnH+8Jd1075f/t+4++gWUNlS39kRqmZT7xvTN0VX9opPPyGuNYY5T7Y
         f1QSdYSP6We8j41/jBuAxe7W3XCkY2sVdyxfJlRuAs7x1/Mr87nQVJjzWQG8cRJMjX0Z
         YtDdrb0QKB/I7ho8B2blp64BkiLn6NRdXS3hFfiaC49OZz4B2NKT/3gqPrk2XMy4wdp1
         1Dbgy88DaMBkKsAlTDlWAcKJ6EabLR3iJbrnT3SYWhkrR0XBDH7HXHaqsry+en3aHBN4
         vfZv6s7L+iYIuuVOHl2o9qy2T5a+3YXz1RlYfyHm9Qq9nE2vnoefd0g126py13EpW7vP
         2iCQ==
X-Gm-Message-State: AOJu0Yxl/h1gMJDLtDsj6t3bklj3stm0NoUCrRdojVujfPMNeyW0ztpU
	Bm1uICvLzWZ2P6U+jsw6852we+UrAZuOVQ==
X-Google-Smtp-Source: AGHT+IE09EQiEo3vEyiN4aUkmSSulxM60vCAFa6QFBzATdMqmCKCemxhHosUEgDD4K1ltVFvSuduEg==
X-Received: by 2002:adf:e90b:0:b0:336:6bf0:a005 with SMTP id f11-20020adfe90b000000b003366bf0a005mr4715360wrm.92.1705507719524;
        Wed, 17 Jan 2024 08:08:39 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d0b5:43ec:48:baad])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d6a4a000000b00337b0374a3dsm1972092wrw.57.2024.01.17.08.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:08:39 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Peng Fan <peng.fan@nxp.com>,
	Robert Richter <rrichter@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Lukas Wunner <lukas@wunner.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 8/9] dt-bindings: wireless: ath11k: describe WCN7850
Date: Wed, 17 Jan 2024 17:07:47 +0100
Message-Id: <20240117160748.37682-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240117160748.37682-1-brgl@bgdev.pl>
References: <20240117160748.37682-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Describe the ath11k variant present on the WCN7850 module.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../net/wireless/qcom,ath11k-pci.yaml         | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
index c8ec9d313d93..5648c855a122 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k-pci.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - pci17cb,1101  # QCA6390
       - pci17cb,1103  # WCN6855
+      - pci17cb,1107  # WCN7850
 
   reg:
     maxItems: 1
@@ -28,13 +29,25 @@ properties:
       string to uniquely identify variant of the calibration data for designs
       with colliding bus and device ids
 
+  clocks:
+    maxItems: 1
+
   enable-gpios:
     description: GPIO line enabling the ATH11K module when asserted.
     maxItems: 1
 
+  vdd-supply:
+    description: VDD supply regulator handle
+
+  vdddig-supply:
+    description: VDD_DIG supply regulator handle
+
   vddio-supply:
     description: VDD_IO supply regulator handle
 
+  vddio12-supply:
+    description: VDD_IO12 supply regulator handle
+
   vddaon-supply:
     description: VDD_AON supply regulator handle
 
@@ -61,6 +74,18 @@ required:
   - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - pci17cb,1101
+    then:
+      properties:
+        clocks: false
+        vdd-supply: false
+        vdddig-supply: false
+        vddio12-supply: false
   - if:
       properties:
         compatible:
@@ -69,7 +94,11 @@ allOf:
               - pci17cb,1103
     then:
       properties:
+        clocks: false
         enable-gpios: false
+        vdd-supply: false
+        vddio12-supply: false
+        vdddig-supply: false
         vddio-supply: false
         vddaon-supply: false
         vddpmu-supply: false
@@ -78,6 +107,18 @@ allOf:
         vddrfa3-supply: false
         vddpcie1-supply: false
         vddpcie2-supply: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - pci17cb,1107
+    then:
+      properties:
+        vddpmu-supply: false
+        vddrfa3-supply: false
+        vddpcie1-supply: false
+        vddpcie2-supply: false
 
 additionalProperties: false
 
-- 
2.40.1


