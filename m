Return-Path: <linux-arm-msm+bounces-79346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F160DC18BF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55F531B20657
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 07:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967603128B5;
	Wed, 29 Oct 2025 07:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NAwnj6Me"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6439F3126C5
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761723861; cv=none; b=n45PwQ7/qNbenVx6dekCTuLqTOaZEkWrVLfYUJSXVKsFJgPWvX52u5xTCGsa7KWeGnB0o4meo71Kns7M/7Fbnd2WgUPjeL2drg60SJOwsOMOcJ3LITPHAlSKIGhDpb/8dOueUQz+4eiWYNNtKH/4jhHijEj2fC0fcQZYWgdviks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761723861; c=relaxed/simple;
	bh=LqA6uMqruY93gqaEo7sHxG58d/m7WjYdsDZDQiN4wCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XgdfHJcxgeuNr2Xp3Dl1i14EN7yNNcDDzJgTYKbcgcLLDqw2SALpzTL6NjJH6zMfA+8dq3CkYSRknVCS2p/7jpO/CLSoYpJrZE/i21vxft/z+dpHTjv9cNspjMQlvDSHXDwiicgfq4Y1s/lrLAAJxcBM3veUz1lvCry55QtKG1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NAwnj6Me; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-429a8a27db6so202118f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761723857; x=1762328657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXoO6JFu6PFRG9ZjBC/NKjZXam02fA7IvjSxlXAqMXk=;
        b=NAwnj6MeAMATmPO2o8RtRveatc6bTE+wqNgFdurGhAEJNOjAMNBfHLMZSnCib+/90p
         Rxq7PeC3dg5nmD/pskZzWIptKs26O2pv825W+Ab8ERMG33zb5pqsCG+qdHjtUJoBk6ZK
         sFKmjpJVP+12fWsAnTrpXdnt9g/rEOGFzyMzoxquF/SnCFmBujvKm9ZvEP63Zlkh38dn
         jRkjmfNjJuBBDw9MDkjtffOQ3E2k6WXa50QgxwLpfcBav2551qPbL0HAZE90op+D7p4i
         00WiuOnui0kS/b8FDqNgJjRNP1rRcrLt40vZTySUVadA+Cg1YOFex6ju+3m0CZOzUBJJ
         AoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761723857; x=1762328657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXoO6JFu6PFRG9ZjBC/NKjZXam02fA7IvjSxlXAqMXk=;
        b=l4+vdgKsWtNXKJdeggPI7VHCfTAezz6IJIZFRNl7EquJC/7fBT4wR569b2lv2vPoFd
         2H5jmglXRKokKmTMxUQFVZoqTTFiWFqzL4y9oNowjVwlJJqeM0ZRncVOEgXynFVwMrYX
         DZJu83VNQy1v5ez0xd8oIfzqqVliyjNjxXAuugs/OufMXQaSp8edBA2K5BP0M6KAPpa1
         Ybvzq5CL192yr/P71mEbMfAxLUJ3uMOzGIntyIu86X+RmSsojIVEQmRqh8uUfGMjyCFT
         EHOdDK5mMGFVHy2ZGyhBadNLvUNmCCYKFAUy6eO4Xi9Q2lyrNO30hHdPy7iTi5oo9owl
         SBJw==
X-Forwarded-Encrypted: i=1; AJvYcCWLSzCp2j6DW3+kHl2RAmErMekFq+0JWNkSWIZ0EpQVNyydMdC7e4DL1wREN5L4zpnCxzzK59o9xSI4wOsO@vger.kernel.org
X-Gm-Message-State: AOJu0YxC1UAc8OZ3JvinCGCfq+/2wnQdP44/SHr/HcxSdx01EGgsVO20
	NPmc6afGCE6Ba/qMVtK474H5Y2YRrZN9GbObGwAw/AQ/+EOa4A03ZNqrGdvEVuitSmU=
X-Gm-Gg: ASbGnculc+eUATZuNvAL3RZTS/S96dhHNaowWyzS/sWbBkaLdOsN5GpWphv9WfA98go
	9WMSbWbbSbz40yJXP4k7QAA5CyiJeqsQmiqzg3YA5LaL2X2yGVJzUh3pkZ4chqLjCq+bILNBnRa
	zcrZEWxYBP7pdFoflHWM92ZLOgLufvPx7UkVoP1nB+zCJD9gIq2Xb0PlxPJ5rATk/OiuwGgXPjH
	UFemVwPfW8BFtINdZzBvnDFM5J2QasfGQPW/Yxe2UaQeUh3aCFE5yK5TTBLP4giePtpmcmAPRfB
	goLwqtyOmSlYQlbxc5TCkbMK+T088lccwPtLi8ohFEkPX7/jlfbrWVYqnLNZNSLClqC4293f/oF
	kvowPcH03SRmycodSoLhcv9tYB0JPEoJ+ENwlroOJ3FRCkmD+L/3g5nRpZK+SiURT++0Tcojc51
	0msKQUCvW5+Eo21MA6
X-Google-Smtp-Source: AGHT+IFtm/W30m4UPSxs1CUdrQ9Pyvb20Tqr6XUfGejw1SOgsIWVpQvgP0VX34renPLAcRaliu0orQ==
X-Received: by 2002:a05:6000:186e:b0:426:c349:eb1d with SMTP id ffacd0b85a97d-429aed36c07mr732821f8f.0.1761723857477;
        Wed, 29 Oct 2025 00:44:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d5c9dsm25861146f8f.26.2025.10.29.00.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 00:44:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 29 Oct 2025 08:43:54 +0100
Subject: [PATCH v2 04/11] dt-bindings: bluetooth: qcom,wcn3950-bt: Split to
 separate schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-dt-bindings-qcom-bluetooth-v2-4-dd8709501ea1@linaro.org>
References: <20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org>
In-Reply-To: <20251029-dt-bindings-qcom-bluetooth-v2-0-dd8709501ea1@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3331;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LqA6uMqruY93gqaEo7sHxG58d/m7WjYdsDZDQiN4wCs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAcXDpceFJ4UWTTJW6H+L6eLRlBpRXzhWT7XG2
 PigYAgF88aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQHFwwAKCRDBN2bmhouD
 13KCEACA8xAp/5e78El7+LGOpI37CQuHFgBe9+cJysvBjDCiPXpZJ3/utnbu6U0OudKdF/FDKQO
 OFMsjB3cEFMVi06hwdUk29lanQ39Z+b9MzI43cTmKM/CglE4jtqS0wBm0P5mw1Xd8ugfUY0iu4Q
 r1CwVs11C5kXiSPYt0IukB3gGCudFA54JufX7rLb7CbK6EF5gyfooRxHsla/FlaOD6DgSZuimGC
 RpaIEPi3XI08d/SItoEv8XPJEN6thyHAd40DEqzSB329ju8FGP+5BPwqWZ/Z4WjU71f3BdDedCS
 jShzZB0JSvr/pE5dQHTiIYGD5WZV5osk2B3OFv1TpOJGKvGXnWMnj1kwNSr0QAbNFl14/Q2ZETu
 SANW7Ce4w2bYhQj0arke8PO/xRodzBa94i8TuhC/M+d0R9GxujD5q/HFD+DDKWMFzJQWxEzJ9gR
 57+7C14bCabWLrctEUysRVRrLJ/+j/ynyKev1vNUyURIuqfoV7Zt3YjjGoJkVQn9lNsevFEMDdX
 hReoh24Ud/x8LwK832peE+t41+UXx3MPY1BwXqKk6iUBmPZDvKS5AwizSV7FK+eNZst7qCG1D7J
 /es8PrxmobELsqcM3NBe2PZp4n77lEKD5mH8bzRGB8+BBd81vXZzdDI3R2Fj67niGSbYpfTbYfb
 FuM3Ym8vKJ/4Kjg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

One big Qualcomm Bluetooth schema is hardly manageable: it lists all
possible properties (19 supplies).  Split qcom,wcn3950-bt to separate
bindings, so device schema will be easier to read/maintain and list only
relevant properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/net/bluetooth/qcom,wcn3950-bt.yaml    | 67 ++++++++++++++++++++++
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  4 --
 2 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn3950-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn3950-bt.yaml
new file mode 100644
index 000000000000..83382f3c9049
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn3950-bt.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,wcn3950-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCN3950/WCN3988 Bluetooth
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+properties:
+  compatible:
+    enum:
+      - qcom,wcn3950-bt
+      - qcom,wcn3988-bt
+
+  enable-gpios:
+    maxItems: 1
+
+  swctrl-gpios:
+    maxItems: 1
+    description: gpio specifier is used to find status
+                 of clock supply to SoC
+
+  vddch0-supply:
+    description: VDD_CH0 supply regulator handle
+
+  vddio-supply:
+    description: VDD_IO supply regulator handle
+
+  vddrf-supply:
+    description: VDD_RF supply regulator handle
+
+  vddxo-supply:
+    description: VDD_XO supply regulator handle
+
+required:
+  - compatible
+  - vddch0-supply
+  - vddio-supply
+  - vddrf-supply
+  - vddxo-supply
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+  - $ref: qcom,bluetooth-common.yaml
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    serial {
+        bluetooth {
+            compatible = "qcom,wcn3950-bt";
+            enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+            max-speed = <3200000>;
+            vddch0-supply = <&pm4125_l22>;
+            vddio-supply = <&pm4125_l15>;
+            vddrf-supply = <&pm4125_l10>;
+            vddxo-supply = <&pm4125_l13>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index ac58d6598091..82cce508e295 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -16,8 +16,6 @@ description:
 properties:
   compatible:
     enum:
-      - qcom,wcn3950-bt
-      - qcom,wcn3988-bt
       - qcom,wcn3990-bt
       - qcom,wcn3991-bt
       - qcom,wcn3998-bt
@@ -124,8 +122,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,wcn3950-bt
-              - qcom,wcn3988-bt
               - qcom,wcn3990-bt
               - qcom,wcn3991-bt
               - qcom,wcn3998-bt

-- 
2.48.1


