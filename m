Return-Path: <linux-arm-msm+bounces-16709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AE089B4C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 01:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FECD1C20CB1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 23:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C4847F57;
	Sun,  7 Apr 2024 23:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SUQ4+4LM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9392744C66
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Apr 2024 23:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712534037; cv=none; b=t0y/9vEFMTncrKxyw7EFhrDl2iDkzOTbsoODT/lUBGbkBd+x+/fEcvsJDXWWCjj+lZDg5S71L1bpYGH56WIHWZOwcGWFL/M8nRRDh1kS3uZPp2v1xvfjQZKsb4VjaG1KxbfYvSnAFMaGfGP0gIyX9tCLc+DQ6x+a1UY6/jJHz7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712534037; c=relaxed/simple;
	bh=vWEb7jmHKp7plqaXgrmEtB1TTF7h90FJxtovdzgscyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=msvH2tfVS6X6B1IuimGzr5Aff2em7BGQcaIQhqGhwPBKz0QP95r3hZe8lSF7WHuDFZ5ID1PL7nSFP6+u5F/Cu8KvAzNfX3wArndE8d2RisR/OLcYpNKjhfb5iqRtop9bmABzx20ccqP1RJPaw13uKpV13hmqYZNB+mcUvRPSUdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SUQ4+4LM; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516c403c2e4so3355598e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Apr 2024 16:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712534033; x=1713138833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOB/W2al4fAWY1hZvIX+eyNZGmg0uhdq3Rfxx+fRp2E=;
        b=SUQ4+4LMej25GsktyhxYf0h/qTpLd8pQJ91XZjKG3flZkKkhy/AaZLx5nOPBOb5CMS
         +TJX8q3zRkwZmgr4M2C6G/+FUsW2kQq9RR6Gcj65gDWkl+m+gRHDrHC8iOhcCPdRq+Ga
         lbqZQCxiJ4cuXyDa6D+/XdAEWnvbP2DwhAMO9vHdXaCCONo84/96KUTSmA0BjJNShMzy
         4ZlZAONsBz1MELK48JPnODln7fKncrRIEUEGnckylkQimuJdb43SmCCm0OfFjW+iEdPg
         Qdjmpw+nQ9i+YJ43re+XeywKiXBsizKhDyO8f+w2CXtydpXHhzkzUTh9ltpwEaoL5nCw
         f8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712534033; x=1713138833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOB/W2al4fAWY1hZvIX+eyNZGmg0uhdq3Rfxx+fRp2E=;
        b=GBNA3qJ7fJcCa4SZLOiX0Y4sk/y6jxeqYj2uEmpGHClgNrD1nj+C/1aoAedVfLGTXb
         gCcntlCjjPpulokvUOo95WNdusD1ZPk0vFkLAFsK6FTCZwMFDZ0RTM94ahcYHX2wnghq
         kcdwLgjbMc4uzGkJ6ksoK7Z+hvna5BlX78dndYV2hL5Gfxt1cT52RjtMKAWNyXvNGNPK
         QmYCOvY2celAgxwZt7huFuOfWuD6J6S2yPvrQeTZxRhSAylKH8miUsN8Xyej/jHYQfMA
         RbNisGNww0ANUZFZuZk15MU5XBMjQJN4bYSB6feJZCLJs6UXjOgN498AjervUWwiVxc3
         tisg==
X-Forwarded-Encrypted: i=1; AJvYcCV6TF75/55kklQWIs6bOEa5VWuuDGxeeA+8fFEP+8R1E2Ixloet3VT+E3g4pov5fY7RVFtMtdnisRFAWixAAaoU4hbawhLAAt0/jKJP2A==
X-Gm-Message-State: AOJu0YxbVojcAzDSi2vDIaqqOHkr4iWkR2J/iBFHbna/w3mGcSVPnOlo
	J3VL1qwpp/F+Udz40m01ajOqaQRimibKNEz25dxMrEU2flnXSTeWELnUOwgnN+U=
X-Google-Smtp-Source: AGHT+IGD0r3TWDMnfJz85tZs40iCQ3bJgYJGGYfvxWOghAuoLrX29Zx8JuwsRwlnBsTyog5reBPcXQ==
X-Received: by 2002:ac2:44d9:0:b0:514:b624:5d36 with SMTP id d25-20020ac244d9000000b00514b6245d36mr2217144lfm.32.1712534032652;
        Sun, 07 Apr 2024 16:53:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t27-20020ac2549b000000b00516b07fdc26sm965696lfk.109.2024.04.07.16.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 16:53:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 08 Apr 2024 02:53:50 +0300
Subject: [PATCH v5 1/4] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240408-lg-sw43408-panel-v5-1-4e092da22991@linaro.org>
References: <20240408-lg-sw43408-panel-v5-0-4e092da22991@linaro.org>
In-Reply-To: <20240408-lg-sw43408-panel-v5-0-4e092da22991@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2202;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GwVgZdE26NDUHVKCdQIs4DldqMTJkpU3Pk/WgyxXJjg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmEzIOsWZE0K6uxILhzHgEr/EN647OWFab82UmR
 AyrlutwlYCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhMyDgAKCRCLPIo+Aiko
 1cfEB/9qTNSpJTLxEWDO34OifP37mWXh2knrveFUXkNPOwZnHoUWkEILGgPqYqazzTe3OuH6umb
 pydAY9tIgE+K9P8+dnKNxHOoL4glYzY3UBc3Y9mnbYmMC8avnPvzmZUYGmEuVlM5DtEC9zNJfdQ
 ap/+i87+GYqE+zyPmK1vKsuFf+ez2Z/LSmgt2jbCSEHkQ1wKhNMwCEYBzvmORhHWosl824MEOCO
 wU/NYpatsxsPS+B1K4xt+wjROTH9iU1buyX99DKQX2Bn6GyQ8GBo4Y/j/V31WQuPghZW0SNYPQv
 z1z+v6cYP/a6OxQ04iIpiW7Hl55SUgtCEj/tR4Ba4gobAJg8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Sumit Semwal <sumit.semwal@linaro.org>

LG SW43408 is 1080x2160, 4-lane MIPI-DSI panel present on Google Pixel 3
phones.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
[caleb: convert to yaml]
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/panel/lg,sw43408.yaml         | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
new file mode 100644
index 000000000000..1e08648f5bc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,sw43408.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG SW43408 1080x2160 DSI panel
+
+maintainers:
+  - Caleb Connolly <caleb.connolly@linaro.org>
+
+description:
+  This panel is used on the Pixel 3, it is a 60hz OLED panel which
+  required DSC (Display Stream Compression) and has rounded corners.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: lg,sw43408
+
+  reg: true
+  port: true
+  vddi-supply: true
+  vpnl-supply: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - vddi-supply
+  - vpnl-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "lg,sw43408";
+            reg = <0>;
+
+            vddi-supply = <&vreg_l14a_1p88>;
+            vpnl-supply = <&vreg_l28a_3p0>;
+
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...

-- 
2.39.2


