Return-Path: <linux-arm-msm+bounces-47495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8F6A2FDE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 23:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F4F91664DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 22:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6D4259489;
	Mon, 10 Feb 2025 22:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IB0jmWQw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDB925A2A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739228239; cv=none; b=rtDe7IYJI/5gHwt63VgxBCA4zvrLUyJthD5w+snxoh4eMfQfRA1nlPwW2h38ExjNrzVSEQS9K+H41XNAlED0nAmYzVsV2q1vbRO5aQ73LvWwjU992LgogiKbB5DvC/TmagqO0veAcjzLJ7q/uYLoKugO4hf9oHk5fg6SDdktvdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739228239; c=relaxed/simple;
	bh=TigOjWjByS/qOxFStuN4jxQdOoIMiI/Kd8fVikyy1TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XbDfAVDyjLnwhKKVrDZnTo77QC7niTLun7Feezytd/2RDfNAtTIbGxI62tFI4gbiWRVNCTYUOSBBBCuch4zCsL9KGp6SQDMpD7IxRs00e1Uz6JyeHUcr87XjW58d2eJ1HbRFR5u2d6HqCp4sblxd92V+G7MPCfgjANGgAn50das=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IB0jmWQw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21c2f1b610dso120318535ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 14:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739228237; x=1739833037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZJsAaQGNn6Yx+uv7DpUfzz85gmu7DiYTeAAhcXBbX4=;
        b=IB0jmWQwT2FxQhF10tXeQW9PjWfvwL4KYJYDG6AcTELx5gdjyaGsaNQ4ZGfinwm+vP
         J/MJBU7VybBzzn6T5h+k3G2R6DYUAE1hUYmSgxg1N8PJ73mMN1qFdTI5CzB5bWljZ/Sx
         faxvvE9KyFsjSvPK4JVK4ItwsSM+tl/+YdGHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228237; x=1739833037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZJsAaQGNn6Yx+uv7DpUfzz85gmu7DiYTeAAhcXBbX4=;
        b=P08xNdt34YS3fhpKE6p/N60OgFMTIYJAgVBwMiMbSkgZUJdBrasI3P8bsjTj+KvIv6
         z3+A3WupwShnUabUZzHjqsh64FWWvTAcraDlJpKUcdqIAtW9i43U1xm5VG/QqX1M5gLs
         3aC8JQb7vAGulujKbheCoooNt6/cdV5y6UsOcojNUm5jHAYZC9G6IJKgtBTZzmQvoEKU
         NlZJkkyXY2Plsl1xFWdYAQhwuuRdIGAnqNllYDeix6e+GaAtpHnrbyHte8SHcACARHFN
         AN40CsotgAMI77Mv9Y06x3wQ0aoNAOwUi8eEA9IoS6d069qIK9S3t8wNLhRPvs/wQVdT
         FyOg==
X-Forwarded-Encrypted: i=1; AJvYcCUZmPdPn8bFW3/CWQaZM706rqpO5QA0SNT3+rb3iyFks1krIbYFsY8U/EXo8CSDWI5Ara1ACZb9I7XD9nqW@vger.kernel.org
X-Gm-Message-State: AOJu0YxjDcSewBpz4drQ79fFeTyRohNlsaiuKYGXbYV6yNbjytu/mvwu
	+VqKuUfGEFOmICUhfZZ2AHoohYkTxQ2oMX7xsbkXwCJDVpKldLKpTGdD/rDnWA==
X-Gm-Gg: ASbGncsKJkdikQ5Yk04Ot1s8K/Tli7BOdh1osLKXlsg6qP9ELHh8A3mqZVRbFj1oxuA
	MJHrVDi1BjTYCL88TB382SXy28/6G93FWNvCNOq7T3XikoTOYOatq4ptskVUFgD7uOwJhQRC0iy
	p6PmIA9mZt6qvvz7pksy//WWq1SIypDhaXqI4H8Y/vfgE577GWy7m6K/VWxqEgwiqkq1E1u5roF
	/69OHLaAu2Y+ujpjuwjxCtdrN+mImjIMceei0BmQVtBhoyZCAIhjkgKmBLnGSdsqU0VLNL+AQiU
	zQZhKuU0DS3WG4b3zFVzoBhiYybAEFlVxYmSOkilcOfghCPWWDkSA+Y=
X-Google-Smtp-Source: AGHT+IGZ3N+kY02h1wIak+gBqbJaa+gpVr6uo4aUlKJT3x7EaQ/2I7u1jOu0/8aGMau+q+PMMuwGiA==
X-Received: by 2002:a05:6a00:1798:b0:730:8e97:bd74 with SMTP id d2e1a72fcca58-7308e97c379mr8317065b3a.2.1739228236978;
        Mon, 10 Feb 2025 14:57:16 -0800 (PST)
Received: from localhost (222.246.125.34.bc.googleusercontent.com. [34.125.246.222])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-730840e842bsm3436416b3a.88.2025.02.10.14.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 14:57:16 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: usb: Add binding for ChromeOS Pogo pin keyboard connector
Date: Mon, 10 Feb 2025 14:57:11 -0800
Message-ID: <20250210225714.1073618-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250210225714.1073618-1-swboyd@chromium.org>
References: <20250210225714.1073618-1-swboyd@chromium.org>
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
index 000000000000..e1b3b2c1711e
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
+  "^keyboard@[0-9a-f]{1,2}$":
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


