Return-Path: <linux-arm-msm+bounces-84827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E18A0CB1813
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 103B83024995
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 00:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274801C84D7;
	Wed, 10 Dec 2025 00:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Db2ZIqMB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185681D6DA9
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765327063; cv=none; b=fy5/7nqLpLF5kmZhn3dTt00QIro7VVXosPCkSROd4qK/bZplYHMtPylmRHFh5tqmXcActEk4O+wJORoORLzevxoZrBoYGsPPDx8P2OyOWNleN7UfjlHqf9Iq27+zLASkNcDeU7OmlbbM7R2vHH6ew8loaB5fQ7lKrJbmiTpRMXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765327063; c=relaxed/simple;
	bh=MkNz6YqHsBSFvsaxHTigfveKtaQAkdkwyH1gzRZO2Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMgWffzOmWHpkfNZN9xMM/WdXw7L+MWqEIr6W6VuwvWoizJ0nPeGcRmJtu0wWnwHipnW+Cui7N2wX+gBPXJa0fA8C7ko3Be9zcdK5jDm+BcTK1zwa246RT0aR+98Fuk6c3E3P4TijHrvnsiyOuwNPJm7s/RRSWGQZQsN51QbEDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Db2ZIqMB; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3f551ad50d1so1102051fac.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 16:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765327060; x=1765931860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+PYBSiJp/d+9az4w/HJpjkv67V4ACob7nnsTPY6B7o=;
        b=Db2ZIqMBsuRCQzCcf10BznD5P8LWHoZ08kxUgnERlfgikX3bQ1czrma0lFeSoQj3rk
         63uzZFJF1QsN/I8vH9OeHhc86HWIRkqKZ/zk8kvltYs9RRXrmIopF2ZQtLf3GQ5wZGzM
         rtmznEyRe+KV42dXKml8T2Re6alGYQEQTdniRXV9gYEyJc7S6V1i8RTd55eKYdpryxD9
         5JDL5OsHyRncmy0XRUE5QpGmA+oGlad5LdylP9riVaoU6UhFzqcFr8SBmY3ksh4PRm45
         rrHlKPl9zk7wWneYiNAucO7jGl2HIyFxGRcSI8QjcAh6/3AfmTNszqt4jWEvN0JnS4x0
         Otqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765327060; x=1765931860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z+PYBSiJp/d+9az4w/HJpjkv67V4ACob7nnsTPY6B7o=;
        b=b8utPg2WmanB2iayoqz+f/ybKGcFfJce4DdM3HxvAOcn3RlsrDCdv5AbZXnTuGuwpd
         hWxSBNfgkRkC0zd/YvnhsTtuB7jkWjQqDF0qpXv/m1ZFJDsG8Xp9ToWoIRSByhIAqkay
         IXACK4XrnRKh8nxUmwtqV3NJsKsM7cVGYD8gR25yf6nvkNghPMA6SiCRaN177eBulxoT
         xZYeLkWNhg5NbsoX2FI3vXZ10/fnIAh6HM33p1Q7fXOjif6bbq+6HIE9Yy48GiZJUBa4
         32PGSIdADjdwJ/oUQ0Mwa4R3IvrVff2m+3sj51ZBtDPF8APFjOnSzsuqrYL+DLgrGfaB
         oTqg==
X-Forwarded-Encrypted: i=1; AJvYcCV3gboJSI7OaAZVytf4oD1hgSDqBC3sAviZNj/7qC+xwIptKwG376jnekk8folByTZW74JpbxXVpiatS2kd@vger.kernel.org
X-Gm-Message-State: AOJu0YxI8gJchmmw1BzIFHGtHpTlV9J4ezOKt5qWxeYpCUSqcDiYU/c9
	1Ia1x1SnsDtf1ZwPu25GxyfRVpGUtDUAHW2EWXTsPFDKZwE/zmiH98XN
X-Gm-Gg: ASbGncseWi/DZB4qit2V+as0L911GUWYhUPCv0prNYio1mJJQbdZN5tJEJwkYlWRw2i
	b+eulit8sx9R3y4p4GaeFISoI9So4lRsJi2+qLySmm0SuG8MwT8M1fxPz/+sbadkDN28rcEhlrh
	iX+JQ1j+280FlluJFZR8aVq8+D7Pc2gxzFtPrkpF/HsERjA5ixxmip4eDAkC3Xqr9FmkERwDH46
	rX8uWIzisSXKTwUP9bKCFK/yM/hX6VFBBJobs8rrUq79JJL03JgJny586/IY4qf5vo522xl4MKH
	9GjWQEQQWJM2py54PKA+0sjuLSWYNebC6gx1vw9rqvj/j19bowm6ShNcIhlBRC9hmx38i1bSgXj
	wWCwti948LEWBN5/8kUKm2UldKG8oImgroCfYHY1cvYGeSrxRhQH4dxdj8zL0PFucSDLFGyt8eD
	Ixhbcam4d25NF7x00L+a7UrmhoREFmkVwAjwnZDWTASE2DHT/bf3WoMlcDSqw1YGQaeF8BHsY3f
	Vc53VE/OreRUec1tkK0uDyLyjnZ
X-Google-Smtp-Source: AGHT+IFmHaV8CXvM01LwOOyl6BMhdBjJsxkT1IkIhIQRnuDkPGFOEOlSZ4eSnruo/u54dcHyKVEoOQ==
X-Received: by 2002:a05:6820:210d:b0:659:9a49:8e71 with SMTP id 006d021491bc7-65b2acebe42mr515805eaf.65.1765327060188;
        Tue, 09 Dec 2025 16:37:40 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6597ea6807esm8588826eaf.0.2025.12.09.16.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 16:37:39 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Placeholder Maintainer <placeholder@kernel.org>
Cc: konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH RFC 1/3] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil: convert to DT schema
Date: Tue,  9 Dec 2025 18:37:23 -0600
Message-ID: <20251210003729.3909663-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251210003729.3909663-1-mr.nuke.me@gmail.com>
References: <20251210003729.3909663-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the QCS404 and IPQ WCSS Peripheral Image Loader bindings to DT
schema. The text bindngs incorrectly implied that IPQ8074 needs only
one qcom,smem-states entry. This is only true for QCS404. IPQ8074
requires both "stop" and "shutdown".

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 .../remoteproc/qcom,ipq9574-wcss-pil.yaml     | 167 ++++++++++++++++++
 .../bindings/remoteproc/qcom,q6v5.txt         | 102 -----------
 2 files changed, 167 insertions(+), 102 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.yaml
new file mode 100644
index 0000000000000..d28f42661d084
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq9574-wcss-pil.yaml
@@ -0,0 +1,167 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,ipq9574-wcss-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ WCSS Peripheral Image Loader
+
+maintainers:
+  - Placeholder Maintainer <placeholder@kernel.org>
+
+description:
+  The IPQ WCSS peripheral image loader is used to load firmware on the Qualcomm
+  Q6 processor that exposes WiFi-6 devices to the OS via the AHB bus. It is
+  generally used by ath11k to start up the wireless firmware.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq8074-wcss-pil
+      - qcom,qcs404-wcss-pil
+
+  reg:
+    minItems: 2
+    maxItems: 2
+    description:
+      The base address and size of the QDSP6, and RMB register blocks
+
+  reg-names:
+    items:
+      - const: qdsp6
+      - const: rmb
+
+  interrupts-extended:
+    minItems: 5
+    maxItems: 5
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  resets:
+    minItems: 3
+    maxItems: 3
+
+  reset-names:
+    items:
+      - const: wcss_aon_reset
+      - const: wcss_reset
+      - const: wcss_q6_reset
+
+  clocks:
+    minItems: 10
+    maxItems: 13
+
+  clock-names:
+    minItems: 10
+    maxItems: 13
+
+  cx-supply:
+    description:
+      reference to the regulators used for the booting of the Hexagon core
+
+  memory-region:
+    description: Reference to wcss reserved-memory region
+
+  qcom,halt-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      A phandle reference to a syscon representing TCSR followed by the three
+      offsets within syscon for q6, wcss and nc halt registers.
+    items:
+      - items:
+          - description: phandle to TCSR_MUTEX registers
+          - description: offset to the Q6 halt register
+          - description: offset to the wcss halt register
+          - description: offset to the nc halt register
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the Modem.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts-extended
+  - interrupt-names
+  - memory-region
+  - qcom,halt-regs
+  - qcom,smem-states
+  - qcom,smem-state-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq8074-wcss-pil
+    then:
+      properties:
+        qcom,smem-states:
+          items:
+            - description: Shutdown Q6
+            - description: Stop Q6
+        qcom,smem-state-names:
+          items:
+            - const: shutdown
+            - const: stop
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs404-wcss-pil
+    then:
+      properties:
+        qcom,smem-states:
+          maxItems: 1
+        qcom,smem-state-names:
+          items:
+            - const: stop
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs404-wcss-pil
+    then:
+      properties:
+        clocks:
+          minItems: 10
+          maxItems: 10
+        clock-names:
+          items:
+            - const: xo
+            - const: gcc_abhs_cbcr
+            - const: gcc_axim_cbcr
+            - const: lcc_ahbfabric_cbc
+            - const: tcsr_lcc_cbc
+            - const: lcc_abhs_cbc
+            - const: lcc_tcm_slave_cbc
+            - const: lcc_abhm_cbc
+            - const: lcc_axim_cbc
+            - const: lcc_bcr_sleep
+      required:
+        - clocks
+        - clock-names
+        - cx-supply
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
deleted file mode 100644
index 573a88b606773..0000000000000
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ /dev/null
@@ -1,102 +0,0 @@
-Qualcomm Hexagon Peripheral Image Loader
-
-This document defines the binding for a component that loads and boots firmware
-on the Qualcomm Hexagon core.
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,ipq8074-wcss-pil"
-		    "qcom,qcs404-wcss-pil"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: must specify the base address and size of the qdsp6 and
-		    rmb register blocks
-
-- reg-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "q6dsp" and "rmb"
-
-- interrupts-extended:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: reference to the interrupts that match interrupt-names
-
-- interrupt-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
-
-- clocks:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the clocks that match clock-names
-
-- clock-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: The clocks needed depend on the compatible string:
-	qcom,ipq8074-wcss-pil:
-		    no clock names required
-	qcom,qcs404-wcss-pil:
-		    must be "xo", "gcc_abhs_cbcr", "gcc_abhs_cbcr",
-		    "gcc_axim_cbcr", "lcc_ahbfabric_cbc", "tcsr_lcc_cbc",
-		    "lcc_abhs_cbc", "lcc_tcm_slave_cbc", "lcc_abhm_cbc",
-		    "lcc_axim_cbc", "lcc_bcr_sleep"
-
-- resets:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the list of 3 reset-controllers for the
-		    wcss sub-system
-
-- reset-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "wcss_aon_reset", "wcss_reset", "wcss_q6_reset"
-		    for the wcss sub-system
-
-- memory-region:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to wcss reserved-memory region.
-
-For the compatible string below the following supplies are required:
-  "qcom,qcs404-wcss-pil"
-- cx-supply:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the regulators to be held on behalf of the
-		    booting of the Hexagon core
-
-- qcom,smem-states:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the smem state for requesting the Hexagon to
-		    shut down
-
-- qcom,smem-state-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "stop"
-
-- qcom,halt-regs:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: a phandle reference to a syscon representing TCSR followed
-		    by the three offsets within syscon for q6, wcss and nc
-		    halt registers.
-
-- memory-region:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the reserved-memory for the region
-
-The Hexagon node may also have an subnode named either "smd-edge" or
-"glink-edge" that describes the communication edge, channels and devices
-related to the Hexagon.  See ../soc/qcom/qcom,smd.yaml and
-../soc/qcom/qcom,glink.txt for details on how to describe these.
-- 
2.45.1


