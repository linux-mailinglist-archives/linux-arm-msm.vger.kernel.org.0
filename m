Return-Path: <linux-arm-msm+bounces-16187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FF489632F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 05:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 393A31C21340
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 03:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8AFD3F9E9;
	Wed,  3 Apr 2024 03:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hr7u0PgO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BB73F9E0
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 03:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712115843; cv=none; b=GjknVv47LNNKatyYlIBkJHVCDUy+dPC7EeVxa4NOViDErxblLQYw0Sa80SNJ3IKCSbxjk7mdP5vZutTRZ71SNO6zoMcTfDGqiUI3D4MgJtkBEkkX/3cABbeWlKPyQ7fQ9IybyUxqomczf90TOw3gJmEx4ZnXAt+GnPDLEEf9Tyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712115843; c=relaxed/simple;
	bh=vWEb7jmHKp7plqaXgrmEtB1TTF7h90FJxtovdzgscyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=faRI1yROZ3XfNalVvlvoAgxBodglhR7A7v292Hzx8jzc24Bo7MWNl9MnkIehi5gH+A+YBEXA6/WdUgKi61v88vi8QpBA4m4pBnucZmhwpIuz/NmBI4CTF3qG1YK7hbTsAjA92ZUyZ512PViaLbYAaiqEeDWtrVQ0MzXkhtHxx0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hr7u0PgO; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516a01c8490so437057e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 20:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712115838; x=1712720638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOB/W2al4fAWY1hZvIX+eyNZGmg0uhdq3Rfxx+fRp2E=;
        b=Hr7u0PgOqi1kxHVQvk7qSANIQfDxTLkAHFKnCsvMun/d/n12lFoCzbzllOAN1uS9MM
         eS9L7iFJxWhJKH1uMSF8QmxKTPYM13dhLxV3fY8UKOH9I6o/DnIvhAnVLjYREmIHbWfo
         FYJYvrQP1taAphpHlh0RVVyJcl2GPyTa47U5ZtiOoM4QRlSGVhImaFGjXK5I3csdAXms
         9Sh1VpgqetbmperuyEyUYs135vz5dwAkCRpXOb6vgc3IGo9HPbLbiFTYcbCq0jH1wJtB
         tTyFvzwuYw1kfAkQFzPBP0hHupYFmzNN5f/GY++7gv+AVycDySTYGOhQ+wKZIfKHSBY8
         Q3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712115838; x=1712720638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOB/W2al4fAWY1hZvIX+eyNZGmg0uhdq3Rfxx+fRp2E=;
        b=Sd9YItkFsblVIiKKmc+v1okQz1Ohwy0qkvl/kZ2LW4OiUsC4WW4AangHT9Q6tjvk7n
         mvrHi7/CVMmUlwPwIBW0g7Aw0dLWEefKK0sE3PVnLJvTPWffeFRy+2arGK2ZZ5x8eYuj
         EX9r6DVBTej19V4vIqPsK/plGz4wy79AsMVQFUValElvfSAd57/xE8b8EqBUFE1fAw0e
         mWgnvZA//vZ+nqCFevxXCEiRbKMQ0tNCLTu967emZdFLb73GYqW2un5tbqM0rq6m0/A5
         jawgfb3slfm0+y0KHug2pk7mmjKdTu+vo8PnOxEmaPMCtzRPrTqT3StdhDyq0OnGAHY1
         p8OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFdgJgO+FMUuGxhy0kQ5cVyHM0hEutGosfNSC5avququJ+TcLBCv9Qu5fObloyFaeX3LYIVQTZOSl8LSmJXgLqdCIfnz9wHpRbVBN1/w==
X-Gm-Message-State: AOJu0Yz4ZXA0nGFtcCfYCDAq0VjHUN1iyrbrf16LX09zh+FxwtGFZUV7
	BKFyhiJOj0hgHw7dxhd5pTqBu53LP3EvtbBZcx4A9sc0dDzdayLZgQR6qJSDBIA=
X-Google-Smtp-Source: AGHT+IFdp6MlJx8Q86tmUkW4rWuR7xllrv3RX4DfJ/SDa8Jrr3PQWwHeU5veK8Heu+WrR0BggbwFAw==
X-Received: by 2002:a19:9144:0:b0:516:57d:e4f5 with SMTP id y4-20020a199144000000b00516057de4f5mr428324lfj.16.1712115838113;
        Tue, 02 Apr 2024 20:43:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id br31-20020a056512401f00b00516a69b1dcbsm940985lfb.78.2024.04.02.20.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:43:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 03 Apr 2024 06:43:55 +0300
Subject: [PATCH v4 1/4] dt-bindings: panel: Add LG SW43408 MIPI-DSI panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-lg-sw43408-panel-v4-1-a386d5d3b0c6@linaro.org>
References: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
In-Reply-To: <20240403-lg-sw43408-panel-v4-0-a386d5d3b0c6@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDNB7ss42XbFQ/Rh0+k3rxq0P6Jbz3+FOfUfiD
 DVWcLzhqb2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgzQewAKCRCLPIo+Aiko
 1UYIB/49YPYpkZtCCB7WnsVhlqTzEQjHe5iJJj1W9/Qwq0FgmL+5+K5z/b8IcGre5ssYS09Td7F
 vG6sNUB+Y/7uAcrbPSjOeWvHI8AwjgfKNs6+U9wU/VUWcKMyx4xPVVrH3m7yJhhMjWo0+x6FPW8
 IzJaJXaJk4LbyaoGMmAF1zPW0d6AXcHfntRdAbK4gy1vIt/DY8BkfU0nmFtVCh7Pp1vGpzg6aDa
 dikDTmV1S7EXpqXMwb+JdcjaEbNAc4fsbXBYzqBSFnyAGp+TZ5jeGlPNfFPXr62uiXZJbsgAZj4
 Q6wNTbIrbltQwaK89UARj2T2D064XYnLcQFJc6+WTcBvvQyQ
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


