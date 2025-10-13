Return-Path: <linux-arm-msm+bounces-76951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 787D2BD229D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97B321899A06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 08:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DB32FB991;
	Mon, 13 Oct 2025 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InZBkXCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBEB34BA41
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760345752; cv=none; b=AYNA8GroDcL15ls0YEZ/QywKTJGwC4TXQgryNG6ky8qEG3GsL2BAHFfRfLc+9cUC4l+ycJbGjgH76qDmoKnFwZC1dJSifAadwoNGV7xtfH278ixumtudljRu6D/3cPkawmfJdpouaAt69xZdSiCUM4/n4vrJT9l+oPSqjj2yhRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760345752; c=relaxed/simple;
	bh=YInZ7JdDnKm+3ySHIrO7atO1XxJmgScnHOjoMAFRXss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4Julg5ucthnHbCV8NlNpvAi6x3iG/q0XMJYp3ohFbYBEIfPnXBZeCEsEKoe7TG159XN4NdFWW6ukcnLMIPilV0HEDgSLl3xhb7BJXXRRaQKmwR8WYytEL8FOwPijIigTUBpMjAQcTV1rSQX6aW5RUWuwW+uHJ2VhTTWnyGY8zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=InZBkXCx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46fc5e54cceso4862555e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760345749; x=1760950549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ug2JP506jPU6oV9mUJznaehPwlc7SjM420xn2UiJrHo=;
        b=InZBkXCx3eSg+d8S0C+i1eoRp569uo0pfFhPn4ujvn3Lyv0upRO+5rMNaB0nef1pA1
         2OR+qe4KsIdnOqoT+SbPJckW3DKZHPtPvUP2ciyBzQq9ejyiNcOSwlNOUNzo4OSOeD5k
         GwsAlbGupQ5vz/Ub1EgpIjwBhyd4tuAHcnyc/e5Z40i6YHpedGimHGDhDCrRiwOYUI85
         VC8IzOjgS1ARvWVrrftNp0CAJDmFWWYRc+mBCITx9qCQljDVJSZrX6WvyM/VSMjiLAX1
         tmAh8vhPUPpoECGdzjlj7SKN+mZGoQNKWLSJmuNHTKHxqX30jFOr3NB1Y+8/YZFRgL+s
         hgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760345749; x=1760950549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ug2JP506jPU6oV9mUJznaehPwlc7SjM420xn2UiJrHo=;
        b=GF6LQe42CUn5jkFJ5mk/LtxYTl5eyyPfF03vX8nJp2JjO2xmLnrrD77fPKCMQJ3qFb
         8Vg7STa5zY4JGHyFjkjcHMr9xpqFQZpwJEu6Cy5mpgh72R9x/HmNCEfhwmb/gv6lxO7O
         8ws7BBK8ZZ5pyk8uAeCS7/9yiv2O+tKvpP0V5vw+483QUwX+AHowddut3En104Dw52Hq
         wPUuMiEo+NYZNSefTydqWQAhj8bFzO86q+NUMsakT4/wOO12JpL4Agw17yG+TPu/GxzL
         /YcCzhEBLos8J9h4xVNflL/3BX2webK4mdX4//JtYBku7b3r0w4dIBi2Q5SH5olpk06Y
         Pr1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWduacMLyy+I1OjPjgeMt7yjbDsJoTHIsHb1j2sJDHicbgF1BTYNnahQOMVFCanvJa12VMv3mFxJvv6oTj1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpkq1lEXyDnmtlBoCXDQQHdKjNk3JrQ5136EU71cjHUYRD3dMr
	KMotBgBN15EEmadN4hBkpc3qAheNDMz9fIzH/s/b4cIOaxqE6HNyTMfveoxjM2TnqNA=
X-Gm-Gg: ASbGncvIl9Q/+WteJ1oN5BIUdoA2ZB1twAuhoNi2Epz/QkfOeH7xO7hDKVLJPFeUM+U
	ONQgpL+ITEg8N1q5dcPtEzu8EIHO0Ccqa2g2DR68dA5q1k72bnD3hTwOKdACbiowwcDakdAGye4
	EuVdN/fW8nmAGjKZeABlIf4SElfW9pfd1KUZmZTFLfaamO+9qDH5xGLi4GDETTkwLbchFfpst6B
	OqibK+1LRGkPaS2ypWNVmZttcltCN6GtziRS5ZhrnvVWj4QuC1TL4mJpaJAi+Oqteo7RS9ln4Rh
	sBSmDn3JqausdjR91WsMXvc3otYhDniokaFh2KWby4R3ax1TtX19f8GTDrhlpt9w8nmL9BAzZCF
	QjJ+5uX6mqzPuEkwhjqo3qzmmDQnCOc8POF+QPoug4qBnjgUlolWVInmo71K3U59oqOXM3q7R+R
	ht
X-Google-Smtp-Source: AGHT+IFkkKhoPoiX2gIHcO200+09cQucP0qOjPbv6Cg43ssSNoNhPTs5o6d4q5dqr00kEd/iN89opw==
X-Received: by 2002:a05:600c:474d:b0:459:d451:3364 with SMTP id 5b1f17b1804b1-46fa9af81d5mr129042165e9.24.1760345748522;
        Mon, 13 Oct 2025 01:55:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b99fsm180016185e9.3.2025.10.13.01.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 01:55:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 13 Oct 2025 10:55:44 +0200
Subject: [PATCH v6 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-topic-x1e80100-hdmi-v6-1-3a9c8f7506d6@linaro.org>
References: <20251013-topic-x1e80100-hdmi-v6-0-3a9c8f7506d6@linaro.org>
In-Reply-To: <20251013-topic-x1e80100-hdmi-v6-0-3a9c8f7506d6@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4604;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YInZ7JdDnKm+3ySHIrO7atO1XxJmgScnHOjoMAFRXss=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo7L6RKFwecC4ug35Nf9hYward7etahAYeYcyqNVfb
 WyPBtqyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOy+kQAKCRB33NvayMhJ0YYqD/
 9wLDZpyaY6Fl0ogqJyb8JcMz1Wmfb6Ex0CL1taieTC2xRBP62d76AKVbPFnpQBYdOi9iaA9dkrqq2H
 H5FlIEjiDBGYZ6c3oM7a0WQ4bI03gGc26WYp/QMbLCjtsekQmW/WM6nnkzjh/8ZezAuI/YhmQjjaYc
 iSRCeh1DROCFU9pLwm+UgWgWMCIcLCT7aO9U23ykBuTTe2mojYpiI2y2o8U9KNPkEZOa9U1lHTl2rY
 Z+Va5zJGYehIU6T5G1qPyijQtwiR3u2kK1lWipYvpK0i7Ttx6lCnA7L3mJgRODHv11UvVx4nbACFUA
 BcMryB2WQr/haGK63EP5nNnOQFtjv88Jaj2iJ12LJyNuK1QXUMHkYAkZpelRCt78ltyQJ5FtdY1E+h
 rf/mf/JqF8c/nrBGTjgdpiaCpDSvrjChxiX4onN2SSCaXCE680A8j67nbGAq/zA71E4xV5/baNvqyw
 p/PW033Ur1XYfs+KfVVhuK1GKDGN4su51Tn04JqRmx/UMrYF3WL+PC5cXuAEO+B033nD/3Oq2dY3k3
 PpWHUu3r0+7+ylAApY7bGnnuGvqcThttk/taMtTLhhhxr304zjvj24CakTlv3EZBY2SJqJ6rGTdbkn
 ETILuSIXPhTdMwTKZjqFEs1Sy+Uz4Uq/N884iQeaRqJ/gPa/ptkOT2p8Kxsg==
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 69 +++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index bdf7894ff84869030252f64f20acb4f920fd19e9..1d7a7f0f356b11e080fc8d6c88a0c97be88a25a4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -85,10 +85,77 @@ properties:
 
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
+            description: Display Port Output lanes of the PHY when used with static mapping,
+                         The entry index is the DP lanes index, and the number is the PHY
+                         signal in the order RX0, TX0, TX1, RX1.
+            unevaluatedProperties: false
+
+            properties:
+              # Static lane mappings are mutually exclusive with typec-mux/orientation-mux
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                minItems: 2
+                maxItems: 4
+                oneOf:
+                  - items: # DisplayPort 1 lane, normal orientation
+                      - const: 3
+                  - items: # DisplayPort 1 lane, flipped orientation
+                      - const: 0
+                  - items: # DisplayPort 2 lanes, normal orientation
+                      - const: 3
+                      - const: 2
+                  - items: # DisplayPort 2 lanes, flipped orientation
+                      - const: 0
+                      - const: 1
+                  - items: # DisplayPort 4 lanes, normal orientation
+                      - const: 3
+                      - const: 2
+                      - const: 1
+                      - const: 0
+                  - items: # DisplayPort 4 lanes, flipped orientation
+                      - const: 0
+                      - const: 1
+                      - const: 2
+                      - const: 3
+            required:
+              - data-lanes
+
+          endpoint@1:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            description: USB Output lanes of the PHY when used with static mapping.
+                         The entry index is the USB3 lane in the order TX then RX, and the
+                         number is the PHY signal in the order RX0, TX0, TX1, RX1.
+            unevaluatedProperties: false
+
+            properties:
+              # Static lane mappings are mutually exclusive with typec-mux/orientation-mux
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


