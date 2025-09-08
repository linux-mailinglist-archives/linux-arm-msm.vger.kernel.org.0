Return-Path: <linux-arm-msm+bounces-72576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D52D8B48E9F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 093F4342408
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 13:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279343081A6;
	Mon,  8 Sep 2025 13:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XHmaNLhz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B625830AD19
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 13:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336672; cv=none; b=Btv4F4kycynDihEZBDmtL70WCN7FjxKuHPc0X6UBRU2zkW50IACpomvk/e0ChXumbyzLKx60dIQn8iK0DVF+Gd8CugyaYh2Uro/5HHKLp7Ve/JigA4Kc/3yb/nzNsNmUpvJeZgkT5JozGZvQFQlGZnZek9AjkM1f2BADfBpjNyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336672; c=relaxed/simple;
	bh=l4jGjPnr6kkCLH/MgyK2xCnnHwY9L5KdNaTbIaLUKls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hTv0sX4yqDouOjZ8JiXFCp5QStVMbCXph+Pj2V+lPxDtHYp00T2EGSmjg/0QY3jxv7lF0JoQgndx3wE8ZWTDT6+B7twZGFs1JftnpuBZR8ziAx6Pw/NnIxrGp0a6mAl3Z615Z/EBoEsRT6DYlErNgr1T3lA+nM64bB06gtgiipc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XHmaNLhz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45de287cc11so6357385e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 06:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336668; x=1757941468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3lH/JWdCi466yT+Udujas8igi6yje6X10bcnQeYQ7U=;
        b=XHmaNLhzPH5wA2iONOJPrMN0Ojd25JBC8LMiitfMj+xo5jU6j4UhMXcTxqcYINmzYS
         hN8FJOGQyhVcG7MdK+fQbQMe4tTQFTHXCZW7xs8rxMy6YWtH0eTwQ8SjHw16qKzjxPSQ
         jsLsSU2JKlObioa2fcH7eW1mcbS3bhhRlOQZcXO78EbBKdv7zqVp0vxeH/NYmiLyuyRm
         j1xjmQTdQXED4Jhk+3AAW9K/uN/kUpJI2ovB79s0jr5OvsblMVK/o/8AHJyoQyJoobMV
         6V4k3I5iBrv86Q4iJx6NQ4CFeKtH1/lDFtCDBgIJ0Y+ZOucWPb+UiX3E2fImYeMnfgjw
         EWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336668; x=1757941468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3lH/JWdCi466yT+Udujas8igi6yje6X10bcnQeYQ7U=;
        b=jWZzU4yz0PXdOaaJCmsslmwkcsBBD8qsD1NuGAa1MhRLJUBmBI89kkh4JoLSsg8oNL
         E6DnBliB6G0saE1ea5IQxVOvBV958uxhuqLfYM8sPueZtQInsva7NkLCi9nIT3Xy953G
         AFVfPgYgkKXF3d15BF6ftbDNU4J2VxYivUJffCU60ovYQpX5r3BG1Bm1UMsS8lvPJr2w
         s2L8YrcC2jLpVcuLkLQvAGO3fZMs6PdbhD8SsLBYLeePhO69kixVbHcLysPVSUVkwqVq
         QFS39Wxit/n6EN9rbSSARm6dQwPMWw5AZDJt8h3Hpqs0Nx2MphVB0KBrIWT1UjeaqYsr
         3LTg==
X-Forwarded-Encrypted: i=1; AJvYcCVsBxNhPFSXJON7XnfsPnrUZw4AFXrWfWyz9ju5gmKtpHgIahRciSffAmDO2HpRufcnDv11HYTAI/gn8Uf/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9kP3bepBKYhBW45MFT4NjDDiN5luO0mFgHYz7jwxjvupFwH1d
	sl4+ipQXoicAB3nZoNR1vtqZoHpZ348JfmFjBIJLgaxa8bNBZX8rgnc9O8mGahtmuZ8heaxgjkP
	bqBKMVLM=
X-Gm-Gg: ASbGncvOXkaVrKNdr0H980GCSFIEjwrqZVtiBNs+IbhI2z7H/75sPaCMqjfgSxfsHgf
	Wp8TtkL5olN9LzrRdhnR1sniE/hbo7SmxqMohi/EcEFJeEx4Hz6wcpmappuAthADs8Cpnb4G3XL
	ZzaP+Yik7KI5TOR8v/I/wxxRmOkcQo3m28NsGHJBW4kZrpyWN/fPIaKGCd+wZ62DVz1X9sgSE6G
	fBGfF90402NbRfclfipInje8dYxgr2iqcmNUm2Wdm1UrkG639vvce+TRfICRtiA0+qXgycmqYpY
	ymQFwOe6SXz4OtJT/88TJSSIAie4x5a6tmTW/kLjkSkDRkCGX+aBW5Ikh4zeElMyuUASxtb5kwf
	FIECNjWYS3YE8HUBO1yi+APBlwxh3AuhRd31frNYiVia9b3y9+eFLog==
X-Google-Smtp-Source: AGHT+IEoCJMvrySbDq5jyk5RqjV0NPwALftNDE3q+qWzdFdOy/QBMsqqG1w+PllPiaKresF5LY8s5A==
X-Received: by 2002:a5d:5f42:0:b0:3bd:13d6:6c21 with SMTP id ffacd0b85a97d-3e2fa64c720mr11205775f8f.0.1757336667919;
        Mon, 08 Sep 2025 06:04:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd6891d23sm145632475e9.4.2025.09.08.06.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 06:04:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 08 Sep 2025 15:04:20 +0200
Subject: [PATCH v3 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-topic-x1e80100-hdmi-v3-3-c53b0f2bc2fb@linaro.org>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
In-Reply-To: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3818;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=l4jGjPnr6kkCLH/MgyK2xCnnHwY9L5KdNaTbIaLUKls=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBovtRWHuZlAgozjbJFii6xfRJsDGdI6qiUd5eBIkOO
 gHg1sbqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaL7UVgAKCRB33NvayMhJ0VO0D/
 wN1IoFM+6iDMczeX69C67hBvvLtrQstZFRcQP2yOXqNzF+BNoOKcHNvVJwlesJ/bhhkmogtc/gYBG5
 4XN3Nh8lpDkzzH0uHemVY143GefTfB9r2huYqAUa9QQS+PHrWvDRPrsZnTlkqgim9ETpSWSY5XaaY3
 H75bzT+NVggBudkNCaMUgqU5MTzpuftNb3q80bQDgNCuzrKdNCwqtGGQ+4GGBKYJvXI/TMHT9tb88A
 zk9Qg7hq0kDunLwjNODM8+iMRPqDsi9VenmJUejjO/4Qv0Id4+4c8SXMx7xNDCGcdmy4X2PhUD+/vZ
 tuBuhdooBoUTXuL1IsBaqtg40K9EUY+pwAlTGfZr4WROgsgdmJ8o+VMsdj8bC3fGxTSAo7d/0H1gpG
 fI9wHZbMZkgvxbFhCWedjMDD0lRymsX9FR6z67Kg24aW7df04l62Sinpn7G+v9f7CwdtqY2z3RruP2
 prGrPv1UHPtK0RYzkdBO8ZNpO82TRCla3tvI79pzi4BQLnM+BkqLiz9IL2/phpG6YpG+GDThG3E4EI
 bUnLnZdlap7QuzJ8beN0t3zc5VHCQo/FN0qn0pJpBow49cDWzRVgbHrJr5i52VwvkUhge/6+4782Nk
 Mrd94O2dUWbZKQtUnToaTfid3nnf2bZZOL0lei1dE1+cP+ZQaM7bYHHRczxg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
of a combo glue to route either lanes to the 4 shared physical lanes.

The routing of the lanes can be:
- 2 DP + 2 USB3
- 4 DP
- 2 USB3

The layout of the lanes was designed to be mapped and swapped
related to the USB-C Power Delivery negociation, so it supports
a finite set of mappings inherited by the USB-C Altmode layouts.

Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
connector, DP->HDMI bridge, USB3 A Connector, etc... without
an USB-C connector and no PD events.

Document the data-lanes on numbered port@0 out endpoints,
allowing us to document the lanes mapping to DisplayPort
and/or USB3 connectors/peripherals.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 59 +++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 5005514d7c3a1e4a8893883497fd204bc04e12be..51e0d0983091af0b8a5170ac34a05ab0acc435a3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -81,10 +81,67 @@ properties:
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
+
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
         description: Output endpoint of the PHY
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+          endpoint@0:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            description: Display Port Output lanes of the PHY when used with static mapping
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                minItems: 2
+                maxItems: 4
+                oneOf:
+                  - items: # DisplayPort 2 lanes, normal orientation
+                      - const: 0
+                      - const: 1
+                  - items: # DisplayPort 2 lanes, flipped orientation
+                      - const: 3
+                      - const: 2
+                  - items: # DisplayPort 4 lanes, normal orientation
+                      - const: 0
+                      - const: 1
+                      - const: 2
+                      - const: 3
+                  - items: # DisplayPort 4 lanes, flipped orientation
+                      - const: 3
+                      - const: 2
+                      - const: 1
+                      - const: 0
+            required:
+              - data-lanes
+
+          endpoint@1:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            description: USB Output lanes of the PHY when used with static mapping
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                minItems: 2
+                oneOf:
+                  - items: # USB3, normal orientation
+                      - const: 1
+                      - const: 0
+                  - items: # USB3, flipped orientation
+                      - const: 2
+                      - const: 3
+
+            required:
+              - data-lanes
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port

-- 
2.34.1


