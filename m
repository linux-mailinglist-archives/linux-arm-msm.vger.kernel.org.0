Return-Path: <linux-arm-msm+bounces-10486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA64185032E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 08:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B86D1F2349E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 07:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DA93C6B9;
	Sat, 10 Feb 2024 07:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EBPCKMmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A573D3C461
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 07:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707549012; cv=none; b=JHguqh7m+GLOVlcs9jPz63AkkiYnvn5cZF7+XTYtfCAsCu8OMEebIQUA/iMIKAGajmaYtUWF9d+N3adZ4LkfgAnvPCrK7USS9bWv/HTTnzuuKbOGNLp3yq59liOA1h4ZMZnE8t2R6cKXJ+QPSLzIi0j4wK8We5fXGVQoh30LYA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707549012; c=relaxed/simple;
	bh=QWiqq/EJWFUQcAozvbWJFLlKJLTTtEoiwf9S8hzbqeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pUFcxOfZv6VZKlwHzMrPhc6ROtWblv0ImkzKHczjBE+B+QyV9zFUSKkrgJ8Exu1sxvI6YD1o1kycJDWy0DlTQhwhnUewcSxwY42GEZcEDVeNrE9K1qljE40fUKAaxp4oqhHMG6V5gT5bOiRRL6SoXHL7V3dbxebwuWJHCLcGv+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EBPCKMmb; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7c4205020c4so74259839f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 23:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707549010; x=1708153810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDZTkmgJLWBgtbMLYvgKp9lpTe2pMS2z/gX4STfhWdw=;
        b=EBPCKMmbly507rz+7I39RF8gwJrkMOSmxnE/8DJxt1ozP2LYApwJGDRkbXQAxJjn8e
         Y3DyhaCixDP9uIPx6ia77hde3rLFk+14P39N3NFLt6H+0VJKt32McTA0weMZLPRVKk9E
         NKnBL0UAh6Re+yKG4+62UI1RM6Cm+lmYMYd2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707549010; x=1708153810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDZTkmgJLWBgtbMLYvgKp9lpTe2pMS2z/gX4STfhWdw=;
        b=ClPMxsX6mGT6lWwqfBl5jnNfEGOFJhjGe8viWmtgb+t+mWFrb6gywxMCmzVvM1GxRZ
         FzCjX836bKldWdDw4o/T3TRjTRNh4LnLtLtvUkcobI2laM+kfKf/jJaZjNB1biIVtQtR
         64ndOKrupHyPefmpBdxHlleBYyO9uQaheiMfsBPoqcz6xA/BGIc/EmKING/gwZWbnfuE
         ugmdDhzVk7snl5ykBrr87gmRNE2r7HEKXIBvM17f8xXlrM4poJXOsPZw8ThS1leAZP5Z
         lDlqrzCJKJNyP1HctbxvEyGDKYuyK0D25pVKSG/fJnRLjRYR20K7t4w+8N1aziXiSR/v
         GbMw==
X-Forwarded-Encrypted: i=1; AJvYcCVW38cfoR/IXZhfrHGnbDuyefg7+Z1qkwzjw381aUNp8wZTzsSZCGZWXF39czASUie3X+OLdp6R9FUe7rN5gx7zYbRpYhjfmY30C12wXA==
X-Gm-Message-State: AOJu0Ywh7hNLyJb2tdMbe/+xBcMBW+ZhPc+THjK5A1NBGzY77UJgTj4l
	t+A7BBrwjIdX/et43yodQmCG/6vvRo++2YBdhYcCzc7LkaX3tdhh/nhQJ4j26A==
X-Google-Smtp-Source: AGHT+IHs/c8PKyjVEScyFRbE6bgu7Z0/4J8m591pv2LP5Byv5N2xK8dgo6/QivpRemKJGxe0uIu3Cw==
X-Received: by 2002:a92:d68d:0:b0:363:8440:94af with SMTP id p13-20020a92d68d000000b00363844094afmr1850383iln.4.1707549009907;
        Fri, 09 Feb 2024 23:10:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcbuzrwhJYBRxjSeZiLO7NiAXZkROYgoL66zUbURb+mKWdFNkE6YZWqeF+fYWzC1OoLZJ7vIaJmnoX3ubJWT7jqdvCY3rb09nwzZNcZhyC6krhPIcpvVvuVMMZNAnyKp9wnSSTH4t5cCAFUNIT7kJ+WfzMIPezrdAnaANZwomwtlICT/Zr6r6RH5dlWO4ezhFtYRQ6Q6Oh3zoSRI5OqGmM7ak06KvSvc3623YX+w3HE1EN3Csld1jrH73e0N3sxhR0B0J3jsxOise0EElL18ApOgIkSprzCthwYIBL1QtBa+JJtH2NCkcO9g0jOyB9NNaWXW17EVaMe/lRlek3BOYXPVYdRj87lUF0pBXGkR6DRfMEjWr7zzTZSsxS1JPLsk6LX/BNGwzXn6f6u6mmbipoH8xhmPQ3KatEpPcQwL4MwelEQEs/zshZ39hj53M=
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id bx34-20020a056a02052200b005d8b69f882esm2566257pgb.38.2024.02.09.23.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 23:10:09 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH 18/22] dt-bindings: chrome: Add binding for ChromeOS Pogo pin connector
Date: Fri,  9 Feb 2024 23:09:29 -0800
Message-ID: <20240210070934.2549994-19-swboyd@chromium.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240210070934.2549994-1-swboyd@chromium.org>
References: <20240210070934.2549994-1-swboyd@chromium.org>
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

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../chrome/google,pogo-pin-connector.yaml     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml

diff --git a/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml b/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
new file mode 100644
index 000000000000..5ba68fd95fcd
--- /dev/null
+++ b/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/chrome/google,pogo-pin-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Pogo Pin Connector
+
+maintainers:
+  - Stephen Boyd <swboyd@chromium.org>
+
+properties:
+  compatible:
+    const: google,pogo-pin-connector
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Connection to USB2 port providing USB signals
+    required:
+      - endpoint
+
+patternProperties:
+  "^keyboard@[0-9a-f]{1,2}$":
+    description: The detachable keyboard
+    type: object
+    $ref: /schemas/usb/usb-device.yaml
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
+        compatible = "google,pogo-pin-connector";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        keyboard@2 {
+          compatible = "usb18d1,504c";
+          reg = <2>;
+        };
+
+        port {
+            pogo_connector_in: endpoint {
+                remote-endpoint = <&usb_hub_dsp3_hs>;
+            };
+        };
+    };
+
+...
-- 
https://chromeos.dev


