Return-Path: <linux-arm-msm+bounces-1242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1517F20A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 23:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97D7C282832
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 22:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D943A8EE;
	Mon, 20 Nov 2023 22:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+dM2Gfb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECE9DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 14:49:23 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50a938dda08so6987796e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 14:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700520562; x=1701125362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTZE+Yyh5kIyB1ncprfjmtJf/HhgeQFmAHJ18g9kLYU=;
        b=Z+dM2GfbMb9MkZJGoomW+/RFhjH3ISvghR7CKm28zzYJz62samQIA1mcUk6eMcs1rp
         hWKE13y/OIO7E1g+Ux+whMdk1lssRtf32iSYuMAtrOUwZcoiSoqoRAuXdPWpjm+Gi0X3
         vjeM5TbMh+6DxK2TaWl/n3YkikR6xH1ocB4uOQ99qOwYazFD/G14brbwmEW7CeRV5+/1
         98BXGpxqLfwwVs4cmo7KX8oYge9e1D3V7qsQ/SjemFcEJbKJ06cqs2U87nGIxOV8S/AT
         LXFSWWS4F8v1mAMSHLZZm/eMVcyr5IL9xrto0xOi9Z1ItELqGSOOutsypp/KpetuGDir
         K3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700520562; x=1701125362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTZE+Yyh5kIyB1ncprfjmtJf/HhgeQFmAHJ18g9kLYU=;
        b=BGZ3x+x7USAgfN8kF2xPgdUPhvoPhq2ISbb9+IE8OV1fBwuZUSua/I+p35x6nZAWqC
         h2xC/7x0PyFZ4/ivJpjyzswCVz7NhgczuVG5eO+mTB+TTtKI3eDLgIQc4c7mhQL9cCki
         lGu4TZeM6SdnfVpE+j39Vt9CQLMXBtEs4cCm1byL6MvucsXlom4V+RfRNMXh/UpxAV1n
         rG5dfdXwIWIvM+n7wNOJ8NIMrt+6qzP4Xb2aQDlDtdmhCxeLjO4YNWiEJ2jD8cwDIcZk
         4jcgL5Mc3mf296Z0prYyYYDaIiWzsc5UZL12c+z3hShJUh83KGIByHEoPzosUPUBMoTc
         UF1w==
X-Gm-Message-State: AOJu0Yx+7howh7DywJapxiYOWvgqQKhjpA4qFZJuyfRupaAIbtoKjwRG
	GZZ6n1Z32NsNVVNnLfbcynIftQ==
X-Google-Smtp-Source: AGHT+IET8ZFead2qL40qpVsAg7bFbRz1l/L2umnEoT+GoBgTHa6uj75zEbiibhyfKA16qDxUC9hLjA==
X-Received: by 2002:ac2:43a5:0:b0:501:c406:c296 with SMTP id t5-20020ac243a5000000b00501c406c296mr6204735lfl.31.1700520562151;
        Mon, 20 Nov 2023 14:49:22 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c26-20020ac25f7a000000b00503189d8b8csm1297756lfc.198.2023.11.20.14.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 14:49:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: connector: usb: add altmodes description
Date: Tue, 21 Nov 2023 00:00:18 +0200
Message-ID: <20231120224919.2293730-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120224919.2293730-1-dmitry.baryshkov@linaro.org>
References: <20231120224919.2293730-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add description of the USB-C AltModes supported on the particular USB-C
connector. This is required for devices like Qualcomm Robotics RB5,
which have no other way to express alternative modes supported by the
hardware platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/connector/usb-connector.yaml     | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 7c8a3e8430d3..c1aaac861d9d 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -171,6 +171,28 @@ properties:
       offer the power, Capability Mismatch is set. Required for power sink and
       power dual role.
 
+  altmodes:
+    type: object
+    description: List of Alternative Modes supported by the schematics on the
+      particular device. This is only necessary if there are no other means to
+      discover supported alternative modes (e.g. through the UCSI firmware
+      interface).
+
+    patternProperties:
+      "^(displayport)$":
+        type: object
+        description:
+          A single USB-C Alternative Mode as supported by the USB-C connector logic.
+        properties:
+          svid:
+            $ref: /schemas/types.yaml#/definitions/uint16
+            description: Unique value assigned by USB-IF to the Vendor / AltMode.
+          vdo:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: VDO returned by Discover Modes USB PD command.
+        additionalProperties: false
+    additionalProperties: false
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description: OF graph bindings modeling a data bus to the connector, e.g.
@@ -289,6 +311,13 @@ examples:
             compatible = "usb-c-connector";
             label = "USB-C";
 
+            altmodes {
+                displayport {
+                    svid = /bits/ 16 <0xff01>;
+                    vdo = <0x00001c46>;
+                };
+            };
+
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;
-- 
2.42.0


