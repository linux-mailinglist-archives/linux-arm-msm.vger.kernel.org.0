Return-Path: <linux-arm-msm+bounces-60140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EB5ACC5FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 13:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A05DE188E423
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 11:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E6123183D;
	Tue,  3 Jun 2025 11:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iLihSSRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAF422FF30
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951854; cv=none; b=MwBRX0OP16aZRCRhxQHvoOCf/nxZKiwi9xioz+/Fmc2YnVY66Nx04/tL/NdwORuoHlIns3fSfS4XOjJs6LZpEjxX3HLkKuLGWl9AftmGCEQkw0bN7ZyKEFrPMCnvURXiAoYaV6mmhA2FKhQWsOA3nlpOUoFwMtpLChrM05xq+lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951854; c=relaxed/simple;
	bh=pbB5PzrHWvVUn04LbVYo2MNOE6kLsW5gBdzmEzOHczU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bElXkMgnAbPJMTUElW5pijf2yhf0AyFh4RWBx+0aaMV/LI5jQs3qlPbuiEMmNk6W5Gpsqmx0t1/2cwAEc+lCOTOWhDVFmUF+nqfLRU1cLCF1dGJHTdMM9G9wty75etFmDqEjm0zKey8ZXTfiEAmXb9dIY0bsM0ixk+wbVNLPdZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iLihSSRE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4e6a0c274so583110f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 04:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951851; x=1749556651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExhN+XF0N6J6awaTyjEwEtgTC+vyO+pqDRvv89W3ABg=;
        b=iLihSSREAI+7rdTpPTk0/xTDzi+FlOfeeBX83JoAFtLmW9HE04ZXhUw29ibgSmoJmh
         CbQrIqu/YZhYj7VXYXb/fWwTbneOmsKmlUFcW/RC7kzH1/J5hDI8d3WKd2+EJv2hU++O
         J/2odWmkLtxBsR+N/NRtmBIAHHzL8AZ924Iu8TGtCEut+c3tTyrLoPj6fS0UivaULyvy
         DoAfWOE0fur1UaLXIDbRsPEDzT5lIlSknQDWT9LpI41GaAjPmVQxqL1uOHCHPgx0XaEX
         1vfAzJV24Ey64w4m32tMVajDZbMn+/XX/blrStzuLAhveRzYhGhdyXazOTkNw+jDmaE2
         R8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951851; x=1749556651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExhN+XF0N6J6awaTyjEwEtgTC+vyO+pqDRvv89W3ABg=;
        b=tN/Xlow+/fvf+FboJj2CD33OYCuj4C2DKScinrX5eFTXxgaUTgBX9RpZkK+fK5lLLM
         mrNTkarZqUXAXMxK8iwuym6guh6PRcDnfv5KL1Lpwkant5cl5DIclHQJp1okdS3+a0KA
         WrWUcaqBWD5rJZkUOwHu7pAd9LC8w2IVFhTu/inNoqGEC6I1TkyUqn912S6zZM+x4qrI
         rGNJoU2lnzbSA/770P8Bjhe8TJom0YmReDYQpCQH0uXCXS5qrgWrmZixnFfVaOyQk2ST
         xyuixpLbCvq35U/+Vwaq09VPLua7B/iu8VmGzomBZSvNX5JmQaCz3Jnx07QWp05FZCPE
         +dgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw38ZCbmT2/sodBruSB0vXG4yjJhz7YeILRslLa6W8akAWbxurxx8JOJVAM1yLSdEmE6XGnssgPcj4UvN0@vger.kernel.org
X-Gm-Message-State: AOJu0YzKSh9cj8Sqye0/0ZevDRXVC3STTh/2sfYYbJ2mD4l6hqE59OHj
	IRSqx0AuzVJjv8VqdrVqu0E9mPGPsCnw/lB2exuP7hPKCQuPn4qOMlirbfK/+6q3zrw=
X-Gm-Gg: ASbGncs4H4YCX6ZApY6hx5YqKVyFTMmi9wBwYmOPyK4upq4phU3DJc8iASAfSBxly/D
	FRnb7/jmK0QXc88rzR/+6G5mIKC4uStIp0lDK+B1NOa3JOYq+AT93wPWwHn/sxf0/ZrKRjb6MKz
	nMLzYJ4bdWdz/nuy4E135u8BlhIvIHeiqV+VmNDS+o21k518SHDm6PfEQATayFmLc8fD0rAIlkT
	Kw7dyHCUxtWEpmuqEeqj0/TcN9XoIkB57MJSLAEqKCUJXI6liqbvFNsVuzBQrSqH73i3HN5qUf4
	0+OVkm6gi2volf6KmdOVYZOCMuPLR24qN8VV9Q3yMyV6vn7scyUV1bOu4vhRaCMOA4eZf/8sX/W
	wyvs9RlfxSu8NXLNMXEHWJw==
X-Google-Smtp-Source: AGHT+IFtYARGpAfUwedcZUr+rv2i3DwXIs+E+vyvXAOm1JZEhhjjlgKaNxSVWr0jm35V1p0FWxTuuQ==
X-Received: by 2002:a05:6000:144a:b0:3a4:d7c7:89d1 with SMTP id ffacd0b85a97d-3a512c0dcf3mr920895f8f.4.1748951850998;
        Tue, 03 Jun 2025 04:57:30 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:10 +0200
Subject: [PATCH 3/5] dt-bindings: mailbox: Correct example indentation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5065;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=pbB5PzrHWvVUn04LbVYo2MNOE6kLsW5gBdzmEzOHczU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMdIBzxTrvdsP5gds/d0vjogFtPZqCCBexkU
 t2g8c+MQ+iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jHQAKCRDBN2bmhouD
 1xFyD/9L4+1GTV5DN1265YZBVsYfGT671n0VhpafJSb91mwvevxDWPkwfY40WAvavWVSdnU+oKt
 Oul+mg/UJQ89kOSzcxD5LsRCQ9Acsti3Mrc2v+VcXQ5aaKGlGq7jt1acfeHhjeNosEAA5Q/7GGm
 eGS3YqpRuHV86siWBlHPpFj41TaROQ96ys/d/JfM1FXitBk+o3yBl/OYpWLB7yPVR2Z10titntk
 KnMS7dslZtULk5I/aSaL/TbCHAPuqYMwom+/SLCL+0+ujJZiLU4XJoZ+lOGclDgOgoRXIVmFHLy
 irFm7Ztc9RUbHsC/CWQiAZSY3kGwQHDfxSbCfdceTq8dLC8feQ5/8UwFAvJP5pHuUCGmLp4nOj9
 NCR3wksI5Jhat9TOXbmwNu8Kz2+urDI5jTQ3cX7HOojU8O4d+lByyUWVZIP2AlA/C20a6gv+e4p
 P02u3sMkeIYYEcZYgTdJAs+VqRVrdEHt2IO21B9N3257zT4/OF95e2urmhCQyJ+Bi8SjdskB7jQ
 zyl774llaFFuVkbXNBCuRXGiLGYdXtf5iES9z33x77UWRyzpUFqldA4EucRbBYnQR3KT5SomaK+
 yDnULbjaDeWyLOrtLDh2fBnybkwPfmkdFDiBKfXFCiWAmJFWEfh/RFzExHvT0ZxT9pmyAT0IrdY
 RkEvLVdycgzd0KA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS example in the bindings should be indented with 2- or 4-spaces, so
correct a mixture of different styles to keep consistent 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml     | 14 +++++++-------
 .../bindings/mailbox/amlogic,meson-gxbb-mhu.yaml         |  8 ++++----
 .../devicetree/bindings/mailbox/apple,mailbox.yaml       | 16 ++++++++--------
 .../devicetree/bindings/mailbox/ti,secure-proxy.yaml     | 16 ++++++++--------
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
index 75d5d97305e19f50059e61a4db2632765885e850..87d31963c1b73c956b9782f029b1a5ad2654f507 100644
--- a/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
@@ -68,13 +68,13 @@ examples:
     #include <dt-bindings/reset/sun8i-h3-ccu.h>
 
     msgbox: mailbox@1c17000 {
-            compatible = "allwinner,sun8i-h3-msgbox",
-                         "allwinner,sun6i-a31-msgbox";
-            reg = <0x01c17000 0x1000>;
-            clocks = <&ccu CLK_BUS_MSGBOX>;
-            resets = <&ccu RST_BUS_MSGBOX>;
-            interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-            #mbox-cells = <1>;
+        compatible = "allwinner,sun8i-h3-msgbox",
+                     "allwinner,sun6i-a31-msgbox";
+        reg = <0x01c17000 0x1000>;
+        clocks = <&ccu CLK_BUS_MSGBOX>;
+        resets = <&ccu RST_BUS_MSGBOX>;
+        interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
index 0849799ee0c5caaeb27fe1e3e3714a630a7c2b09..79963c9878bad1684fa0810ad71554af2ceeb75d 100644
--- a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
+++ b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
@@ -46,8 +46,8 @@ additionalProperties: false
 examples:
   - |
     mailbox@c883c404 {
-          compatible = "amlogic,meson-gxbb-mhu";
-          reg = <0xc883c404 0x4c>;
-          interrupts = <208>, <209>, <210>;
-          #mbox-cells = <1>;
+        compatible = "amlogic,meson-gxbb-mhu";
+        reg = <0xc883c404 0x4c>;
+        interrupts = <208>, <209>, <210>;
+        #mbox-cells = <1>;
     };
diff --git a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
index 4c0668e5f0bdc1e03404cbd58a392465d30b0e8e..474c1a0f99f34777e1bed7fc0a34f89320a93b7c 100644
--- a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
@@ -78,11 +78,11 @@ additionalProperties: false
 
 examples:
   - |
-        mailbox@77408000 {
-                compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
-                reg = <0x77408000 0x4000>;
-                interrupts = <1 583 4>, <1 584 4>, <1 585 4>, <1 586 4>;
-                interrupt-names = "send-empty", "send-not-empty",
-                 "recv-empty", "recv-not-empty";
-                #mbox-cells = <0>;
-        };
+    mailbox@77408000 {
+        compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
+        reg = <0x77408000 0x4000>;
+        interrupts = <1 583 4>, <1 584 4>, <1 585 4>, <1 586 4>;
+        interrupt-names = "send-empty", "send-not-empty",
+                          "recv-empty", "recv-not-empty";
+        #mbox-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
index 682ccd76f5c25fc13bb3375007d39e6208cdddc0..c321b69f0ccd3cdc7cedefadf46982b42cce915e 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
@@ -68,12 +68,12 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     secure_proxy: mailbox@32c00000 {
-          compatible = "ti,am654-secure-proxy";
-          #mbox-cells = <1>;
-          reg-names = "target_data", "rt", "scfg";
-          reg = <0x32c00000 0x100000>,
-                <0x32400000 0x100000>,
-                <0x32800000 0x100000>;
-          interrupt-names = "rx_011";
-          interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+        compatible = "ti,am654-secure-proxy";
+        #mbox-cells = <1>;
+        reg-names = "target_data", "rt", "scfg";
+        reg = <0x32c00000 0x100000>,
+              <0x32400000 0x100000>,
+              <0x32800000 0x100000>;
+        interrupt-names = "rx_011";
+        interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
     };

-- 
2.45.2


