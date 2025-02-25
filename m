Return-Path: <linux-arm-msm+bounces-49390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB30A45044
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 23:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD24B4257E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 22:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46542192F4;
	Tue, 25 Feb 2025 22:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QUSOCo5T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135CB215F79
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 22:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740522643; cv=none; b=MPBPZB3rrLrUtO5LPTaA2rboHeAkKYPFMjnPf4DIq4F4ApijVFyti/tUTkrhIoF6xc5BFguAnLpFIL94GxupKmr3UCSrukUuTmvLxshwY044pib8cHr9LJjaO3Uyl0Qw8SJPnJmPHCFjNxMjNxkTFNSQuXfavX0LvYzt9L9SYKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740522643; c=relaxed/simple;
	bh=LsqVGCjtMo5lMpVB8FHpQNoTpKeLzijmuixmRj5EbJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QEJIZZ0xiO+R9fGKCZe+zmKWJe357mzzYG9gcTBK1c5poHX07mvrJMknDcS+T5wVrINIi/tGA+WXQOC9z3K+DOLND0RKIVYnnZDpb3Oj+/er8aL5q3iaCjP2ug7mtQ3lAQDO3gnScv1Vu+XtCM8dX66poSnGRJ3U+jCpn1a7F7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QUSOCo5T; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220e989edb6so169989265ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 14:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740522641; x=1741127441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApYHs/n7IfGYX7B4lQQ+p4O3G1a7OCsUKtghlEJmtj4=;
        b=QUSOCo5TMPV7m/c4IaFjN5LLiPUH9ZpqLA9nAIx7iqaZpDPHcWtF1mGO5Te2vGdI0t
         Tnmz96DYETSS8HRiR7nTsFAfFREL5jXY0gus8pJSFvzZKuYTxdV/YtxFbA9GVAJTsoxX
         7sLOMp17vxRU6A5BLb8BwaM6OFD0rVQvAqZ8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522641; x=1741127441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApYHs/n7IfGYX7B4lQQ+p4O3G1a7OCsUKtghlEJmtj4=;
        b=uro8EswEUGnpfkU5x2KwpNhqKkMSP1JqvD3jCBsgmzHNwfoseppIbfz/b2NMrbhkiK
         D8lOEkpwub7rQ3NobtShx5BA+Jj+Hd+FBwVLcXFlmaa2crNwPLOo9Dqyn3z7ml3/cmPc
         q/EWlywocT8m3MjX6yXXyJuH8aiMJsvm1VSchljR+OAb81dQSinEtCEOPfQF9W9aFxSu
         dhx2swWjzIF3j/gC8yMbQ21TgWTq5i5QbTT6WfK47SK9QBbG2NeJRAOsrq2XYzlbm0bH
         yuGhLRStK7yCggMMXRQP5lE30eKmGohvFMozbtddG6bc7j2mLlf6/blb02LM4InPJqYw
         d+UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPyKxJnHl8U/l+EyHdzyqj/asKSswqVwaF7j/fx6HkMPYh48xHZypTrFlNAQCK9rj+MCPxhUTeTDRp1/XO@vger.kernel.org
X-Gm-Message-State: AOJu0YyTx+2PtKHmUUoomttO7auOMTUpRuMkdhk8MHQs+M+WOx45vn3e
	HtpEaacpwkwGKyNsuQnRfI/hvzMtZjORqSRO/UdZyGsCq+6wcPYNSh27E1wbmQ==
X-Gm-Gg: ASbGncvmUhqHvReuHxfEE5jRflFFYDOwLIp0NwMaH+6bGzWhMdyeg7p3xwovyDizsUg
	YG0xJ9KwLm/7z8VyB78Dih4o0gjmSGqeAKYtJ1mJEWuPYLRHJ7FkiNfjvg89DDvQ3pLw6doG/JU
	q3p1TQK/drtGWg2oSHKgg3gktjFNNgDs2Lh032LYK5R9yYf8A3i3F5uL+H86X1YM4ohm5n/Jut1
	38izO4o1slqHj11kwMQJyvTNw0iXpyX3jZXXwghTcZIAU4j2RIwLAZZv5b6uakr4nBJ8wRKFwvF
	h5PAAdtDb+/U/R0zC3Izipno4Mjp/m7NT1ZrzqM4Ys33Uh8qQSxUN6z8whJrrEiDCQ==
X-Google-Smtp-Source: AGHT+IHW1xqPTBE6DlhH45+k6SdX/yDbLaHBxXJlSInk+OwmjcdfQ4C/YpQmsbuuwHQxPH6RrUiRJg==
X-Received: by 2002:a17:902:cf10:b0:215:853d:38 with SMTP id d9443c01a7336-22307b59639mr75965445ad.25.1740522641460;
        Tue, 25 Feb 2025 14:30:41 -0800 (PST)
Received: from localhost (222.246.125.34.bc.googleusercontent.com. [34.125.246.222])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2fe825baa7fsm78653a91.11.2025.02.25.14.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 14:30:41 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v5 1/2] dt-bindings: usb: Add binding for ChromeOS Pogo pin keyboard connector
Date: Tue, 25 Feb 2025 14:30:36 -0800
Message-ID: <20250225223038.879614-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
In-Reply-To: <20250225223038.879614-1-swboyd@chromium.org>
References: <20250225223038.879614-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the set of pins used to connect the detachable keyboard on
detachable ChromeOS devices. The set of pins is called the "pogo pins".
It's basically USB 2.0 with an extra pin for base detection. We expect
to find a keyboard on the other side of this connector with a specific
vid/pid, so describe that as a child device at the port of the usb
device connected upstream.

Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../usb/google,usb-pogo-keyboard.yaml         | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml

diff --git a/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml b/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml
new file mode 100644
index 000000000000..053c1cfed6d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/google,usb-pogo-keyboard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google USB Pogo Pin Keyboard
+
+maintainers:
+  - Stephen Boyd <swboyd@chromium.org>
+
+description:
+  ChromeOS devices with a detachable keyboard have a set of five pogo pins that
+  are the typical four pins for USB (D+/D-, VBUS, GND) and an extra pin for
+  base detection. The detachable keyboard is a USB device that connects to the
+  four USB pogo pins.
+
+properties:
+  compatible:
+    const: google,usb-pogo-keyboard
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Connection to USB2 port providing USB HS signals
+    required:
+      - endpoint
+
+patternProperties:
+  '^keyboard@[0-9a-f]{1,2}$':
+    description: The detachable keyboard
+    type: object
+    $ref: /schemas/usb/usb-device.yaml
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    connector {
+      compatible = "google,usb-pogo-keyboard";
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      keyboard@2 {
+        compatible = "usb18d1,504c";
+        reg = <2>;
+      };
+
+      port {
+        pogo_connector_in: endpoint {
+          remote-endpoint = <&usb_hub_dsp3_hs>;
+        };
+      };
+    };
+
+...
-- 
https://chromeos.dev


