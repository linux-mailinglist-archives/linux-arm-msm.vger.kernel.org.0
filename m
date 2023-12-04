Return-Path: <linux-arm-msm+bounces-3167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E90A4802A11
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 03:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2672F1C203B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 02:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8236523AA;
	Mon,  4 Dec 2023 02:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wj/bQjc0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0BBD9
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 18:03:07 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bc22c836bso5328451e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 18:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701655385; x=1702260185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObBx9TWLrIBpB0H9q8V9qBSHqmx+qoGHKzq0yJDmTtU=;
        b=Wj/bQjc03wNcfC2zoBnv5PekO8ZphTPcnUhI9qlWfGsO9wnUdpuiMy9zk7OyeGMf2+
         2iwd8h05WEoM4UxRAC5IMpjVkE5WhnQ9CQkLP67MdFhDH5GUZes8rE5BawILvODUEpUr
         +ICV0JifG41DKT/2tJoP1n6c9PwCv0OVhDogMT+H9vi4yV7ndPw7cLCzMMMXOwGKxU25
         WT0+KPf3GyvCYNDhsNU78SV0IfCOUrSroSP6s+m43JzKZn26UfWuRhTVsZ21f2OS4eTR
         HyuQ6H/8M7WX/UTLDDbpVeH4X4V/LHpky/n3+HJ+h/X7W8Hx+MFWoAEyEcK+HPrZDUNS
         Mgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701655385; x=1702260185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObBx9TWLrIBpB0H9q8V9qBSHqmx+qoGHKzq0yJDmTtU=;
        b=pkGYqArsSnRYGQ77SR/T+tAPF02yX3TkZtOy17rDeYEUkv94C5G8e2phx3mSqp43QM
         javoZSWvMNljgZ6qyv97Hm9Vaca3iIn/3f9VCtR1TGl298IGhT7sGq+WjoFwpauBxB+P
         eyQvI9wGHxyeVj6LfZYbACsWryzVyZtgrYEMy+z3OjEaF8y0FaAZ/gTcwX3zTahK97FV
         k01nZaeDOPozqoCac0OMhqduKUL+DPSkaTZ2VGqzWCr7wixlUXT667+O54YgGKt4Je3s
         0FOJa616aGXBV4yMDH7+aXOoMCAyWiYrjsy5XitmCm3gkUe0x0fCfIlFcE8hBPSqmTAY
         w+ZA==
X-Gm-Message-State: AOJu0Yxk811Eu+KFpOAFsShdPCh40NzMk2jDovohLrkPRBZI6mVOMzOC
	V/csrMfWOukx+JPSSDM2HMbVAQ==
X-Google-Smtp-Source: AGHT+IGQ0l3lZw9Y9VLkl78eTQoCX7i8NWPwi3Mb9gkL2b9k9s3lIiyNJDsNIkxsTjgfigkS3zcfGA==
X-Received: by 2002:ac2:5ec2:0:b0:50b:f776:1d57 with SMTP id d2-20020ac25ec2000000b0050bf7761d57mr400656lfq.28.1701655385280;
        Sun, 03 Dec 2023 18:03:05 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v12-20020a056512348c00b0050bea5c2850sm525381lfr.39.2023.12.03.18.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 18:03:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Rob Herring" <robh+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Andy Gross" <agross@kernel.org>,
	"Bjorn Andersson" <andersson@kernel.org>,
	"Konrad Dybcio" <konrad.dybcio@linaro.org>,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Mark Gross" <markgross@kernel.org>,
	"Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: connector: usb: add altmodes description
Date: Mon,  4 Dec 2023 04:03:00 +0200
Message-ID: <20231204020303.2287338-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204020303.2287338-1-dmitry.baryshkov@linaro.org>
References: <20231204020303.2287338-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/connector/usb-connector.yaml     | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 7c8a3e8430d3..28660b931d0c 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -171,6 +171,32 @@ properties:
       offer the power, Capability Mismatch is set. Required for power sink and
       power dual role.
 
+  altmodes:
+    type: object
+    description: List of Alternative Modes supported by the schematics on the
+      particular device. This is only necessary if there are no other means to
+      discover supported alternative modes (e.g. through the UCSI firmware
+      interface).
+
+    additionalProperties: false
+
+    patternProperties:
+      "^(displayport)$":
+        type: object
+        description:
+          A single USB-C Alternative Mode as supported by the USB-C connector logic.
+
+        additionalProperties: false
+
+        properties:
+          svid:
+            $ref: /schemas/types.yaml#/definitions/uint16
+            description: Unique value assigned by USB-IF to the Vendor / AltMode.
+            enum: [ 0xff01 ]
+          vdo:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: VDO returned by Discover Modes USB PD command.
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description: OF graph bindings modeling a data bus to the connector, e.g.
@@ -289,6 +315,13 @@ examples:
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


