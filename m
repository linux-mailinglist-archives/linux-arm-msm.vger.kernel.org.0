Return-Path: <linux-arm-msm+bounces-92398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBreD/uqimmbMwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 04:50:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EC8116CDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 04:50:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 729853009B22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFF9283C93;
	Tue, 10 Feb 2026 03:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyK0ZWJ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B991E211A28
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 03:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770695416; cv=none; b=cxFVbrz6KDJ95Ms9W90TOpo391xl9w0m2OEuLZDPuN7+IJtrk6ttnHrpmyhxfGk3roEnRnSLqKnkEaceJcWlnq3IU9tHCHIR3pACoHu0GxQR0Fhu7E4quoNXHz/uu/YDoZWavp+RajiZtpC0STycpDxLbFYZnuc37xXokcITjCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770695416; c=relaxed/simple;
	bh=6mwOA0dPC+Xr0uI2n1ZFZV+bR933rcuFFj/RWST+Emg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SLIeAts5x/sFHhN7DtAxTMO6uJaRTgDEKrHXIzCn8TsTERg0W4muML3TZCfvwS4/vANVlKvO6G8hz7grmLwXSZMg+0C2gRmVqjQ2Pwp7L7w9VMWEkc1I5n42p8g2znKJOzmArHXyJq1vEItxsuir4IhgI++EhY81kFKdJiQMcC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyK0ZWJ0; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c6f21c2d81so46949985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 19:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770695415; x=1771300215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iup6qDNhA3Ov81Mqulz5I0c3UbxOYNMRh+dC/qq+Kk=;
        b=cyK0ZWJ02zIrwUJtit44YaVWjt4SMtHP+liykCC7dWhs1zZiFwye776fYuRgiKeljs
         VaVp0ByB6cGLARu7o8RI0oB3LD8UE3VmlnBNjh1zr2GcnCNEkkI7IL6SRQJXUvv+6adj
         TQfY4mR2iHP7KbY/HisydcZ5Ni6pCzhAk0WV/6jMxsEYE663dYVIYXenduA+58q5vOJ9
         xfZNQVslzDij5wzl6lWueYU9uj0vxU8aeMwvOR6/9Dk6MtOuQd1pyyRaR5FItDXVvp3r
         iyBr2ws72tVxp4qj6HdkU9rnHiGqd/JDD7JmH4f9FmLEgiofeHw3ACq6T63wfUXZj/30
         1+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770695415; x=1771300215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5iup6qDNhA3Ov81Mqulz5I0c3UbxOYNMRh+dC/qq+Kk=;
        b=BI2mkC0U6bsZH7kVYSQq8QrtIuj2k/xFjSaqal2CUoPoqGwDo4fOCHWPVRja1Q0Ocg
         HFfZl9TID47xXKNFhMfBj+a+0bVH0rSiw4qs0WvmZhQYI5/2SggRuDyqfph0GZoSDXbD
         +z1CmqX6cuCpLZU7vwwcho2lwP3zgW6B48kRsgMSeWeACj7nAxLExsy2MMQGXtopwI+K
         iGnYc1AmO3gcdaVD8gJ+X8k483U2Bb7tl4JpIfm3M8LGhEsir7fXiW92QDdMDu/+eFJT
         4NsVxx8gopB68fogetRLz90cuYlzBHhp4fRl3VzebEQr3/RvKZR+JrDojAKD23VEas5d
         4SHA==
X-Forwarded-Encrypted: i=1; AJvYcCUB0xO6sni4eOjN/y/4jgYPgu81eeLd+h8e7P27WVzJm+UImPe5VQ4juiCz/VqMcRu9rDMrsndtg8Ryjx2+@vger.kernel.org
X-Gm-Message-State: AOJu0YyJVn7v7eKgngwirRBnLhZKU10EpBqaf3FeaJ7yYGla6M46KC/1
	4RcQKDCOCC5bTbQ0uyikJoJsbElWznCtBGt9FIbBo95mzfrg7mYsNu8GGr/zDg==
X-Gm-Gg: AZuq6aJvUpg6Rp2cJ8Rqwfd9bKmy+Wa3+dEF9DN1l5c+tAI5PEMc12jBOvXhkHoDuw6
	uILec4Ex+XzhUvDf+zTPiVC6nKQDShQUvqO6b0hhsh0CVDOzCuGo/nEcwTmxHzNpHl5SKSkI8VC
	3isgLfqC3B6MpNAIrRShHfqW6NSaq6KJfdqOO9JPXXMucZNcuJoofVBp37KHXCOEyZ/5P7djXz5
	69LSgOfdRJcmtAkwGKzb7WNT+fyqYC4ciZKolLz1hgA45eB0OdiIcbs2Qyk7YGwd0BQC8x2xD+M
	/PC2TzDGfP1xv9JZJppY2ulRPOumcEHQV52b/dx2ec+PRHMrViKvkWnIAYuapn0PSehTNuDkgQd
	04w2EeMps16HDzCcMCDZ2smHz34/nWlxcXcRRLXzTgK1gB1PN5HpHZdoLAtgxMYRS0+O5LaXa0s
	0W06ZbCaHk21pTX20ux8fAyS2dT4fuHAmzbeLKT2UN8Q19z5eDALQRwJRIMF+f7N+ICmftCUUrn
	E0xepdl9zk9x1Y=
X-Received: by 2002:ac8:7f87:0:b0:505:e7b8:5531 with SMTP id d75a77b69052e-506398d24a1mr168396881cf.14.1770688894933;
        Mon, 09 Feb 2026 18:01:34 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c03fca0sm89311366d6.28.2026.02.09.18.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:01:34 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v8 2/7] dt-bindings: media: i2c: Add Sony IMX355
Date: Mon,  9 Feb 2026 21:02:01 -0500
Message-ID: <20260210020207.10246-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>
References: <20260210020207.10246-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-92398-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B4EC8116CDE
X-Rspamd-Action: no action

The IMX355 camera sensor is a camera sensor that can be found as the
front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
3a, and Pixel 3a XL. It already has a driver, but needs support for
device tree. Document the IMX355 to support defining it in device tree.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/i2c/sony,imx355.yaml       | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
new file mode 100644
index 000000000000..6050d7e7dcfe
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx355.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX355 Sensor
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  The IMX355 sensor is a 3280x2464 image sensor, commonly found as the front
+  camera in smartphones.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: sony,imx355
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply.
+
+  dvdd-supply:
+    description: Digital power supply.
+
+  dovdd-supply:
+    description: Interface power supply.
+
+  reset-gpios:
+    description: Reset GPIO (active low).
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            minItems: 4
+            maxItems: 4
+
+        required:
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@1a {
+            compatible = "sony,imx355";
+            reg = <0x1a>;
+
+            clocks = <&camcc CAM_CC_MCLK2_CLK>;
+
+            assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+            assigned-clock-rates = <24000000>;
+
+            reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&cam_front_ldo>;
+            dvdd-supply = <&cam_front_ldo>;
+            dovdd-supply = <&cam_vio_ldo>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&cam_front_default>;
+
+            rotation = <270>;
+            orientation = <0>;
+
+            port {
+                cam_front_endpoint: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <360000000>;
+                    remote-endpoint = <&camss_endpoint1>;
+                };
+            };
+        };
+    };
-- 
2.53.0


