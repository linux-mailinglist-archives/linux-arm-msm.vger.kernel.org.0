Return-Path: <linux-arm-msm+bounces-7217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9BB82CE84
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 21:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 006AE1F2205C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 20:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819FD17BDC;
	Sat, 13 Jan 2024 20:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lz1+7e39"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0091642A
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 20:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cd64022164so79329881fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 12:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705179357; x=1705784157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7p6gWY0YoqvRhvH4CsaKCkw0XoA/dxUPDgcmLcO++Co=;
        b=lz1+7e39YQZlrJzMxIfebWkDPjzES428oQdzT/1ACb1DpbAAU5FBLuW92xqsrcHgPe
         GbiTupc23lD1KsPW3bZ24XuSpNZSHi6yr0kkWjCYXsBzWGvEau/g4UWPe40BA+4LU+RP
         a0fagI9gXC/3ZuQdZRpKjV7OJh6A+Mu3f99hiYeIFKbOQazZ5vJMBtApdPCfWyxwHNHP
         igNpk+fm7BWmZeGMtoMIdLyRIX80z95TFy077ldAyx1IkgEauuxqzuOZ08dlY6z7Ti9E
         RGOuGN+b8IWkjbmIxvIDc8dltrV7VrjhQEljKKynw/B27RoUcJsBuXWcEyPBJZhq2V+U
         fkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705179357; x=1705784157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7p6gWY0YoqvRhvH4CsaKCkw0XoA/dxUPDgcmLcO++Co=;
        b=VGKUmrky5iztykDlIMTZnqPCCDU8IDxXU/5gCzDrpWUhpNiyhSKYBDYeMNnYUzA3UN
         CWuMf0A0xl+AOe7Txq6pgakb7hOyjKSP01gp1LfmLCbCR2Nb6hOKinP22PxkhpBq2QtR
         JB/2OELQ9crrYSvHlM+4cNOX+SyrsEccfUHTeej67GOLENhf32OEiQOk3XC+e7epMtD9
         BBbm7j+ftzyvTNDN2fgzXc24n9kaxHZRxBEXvA9nsGpAgK8LkyQEQc26mw/2a+3pMz9U
         4/yFMuHA4BAUHUcpYXamW3Xg7c4DlSWA8eoxahmHRbcvuxqSFlnvmey1CSUee+MPFNtZ
         v1fA==
X-Gm-Message-State: AOJu0YxI4nxH31OhvF6yp4npP0zieBDwpwxAr063SMq9+qrHyfOWhzFd
	ct0NFm7k/Wu52PRll/lY50ACM3KpQTGFTw==
X-Google-Smtp-Source: AGHT+IHbb6Hk424wpmBXA/9fo5agMx0JnS4ckc6EKBxpEvGttdRpEC8T4a1XsFQYTmrfLJQJgkphAQ==
X-Received: by 2002:a05:6512:3a3:b0:50e:ac97:8bb2 with SMTP id v3-20020a05651203a300b0050eac978bb2mr1475688lfp.40.1705179357005;
        Sat, 13 Jan 2024 12:55:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p14-20020a056512328e00b0050e9355d7eesm919802lfe.103.2024.01.13.12.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 12:55:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 22:55:47 +0200
Subject: [PATCH v2 04/15] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy:
 support USB-C data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v2-4-182d9aa0a5b3@linaro.org>
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1888;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DFAh3NKLCMzL120f+oFd/fyT9CXy+jx6bI/mJAUdqN0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlovjW4B6beCENV5/96moOaMSzx2h+m+EJaFunL
 SthbyEEWY2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaL41gAKCRCLPIo+Aiko
 1aCJB/91Cw/8WKjyEpSIFaaHXcsRjP6p85e6/a/7FdD7cuRjSfW8kepdL17IrwnUK+i2Q0xwLnX
 xX16b70KjG4G7vkM6zQMZtvR7jTqglUIkIPwxu9pkPnuJBUj7/TImgzzDsaY+z1SVo8hF50iPPw
 KxsrPhgDEIoLOOls1Jqze+HRaqp66PsRl2Qp+Da9bnC6ij1ech7MWsshoiA8R+29ljeH2wcWeqQ
 w+Fik+qyIUtQJEGv7H/y4GiFDtJmkqT9GifaK2QPzq5EIYc8h15LRZtZRaTkgo8zK7sU/UhPRAa
 QCFhZAxajUCLimoZgB4K1iyX3jONmza/VNmI7rgzUooJTPCt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Extend the Qualcomm USB-C QMP PHY schema with the USB-C related entry
points: orientation-switch property and USB-C connection graph.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
index 868fabd44d72..da5d4cbca24c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
@@ -50,6 +50,22 @@ properties:
   "#phy-cells":
     const: 0
 
+  orientation-switch:
+    description:
+      Flag the PHY as possible handler of USB Type-C orientation switching
+    type: boolean
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output endpoint of the PHY
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
 required:
   - compatible
   - reg
@@ -129,4 +145,27 @@ examples:
 
       vdda-phy-supply = <&vreg_l1a_0p875>;
       vdda-pll-supply = <&vreg_l2a_1p2>;
+
+      orientation-switch;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+
+          endpoint {
+            remote-endpoint = <&pmic_typec_mux_in>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+
+          endpoint {
+            remote-endpoint = <&usb_dwc3_ss>;
+          };
+        };
+      };
     };

-- 
2.39.2


