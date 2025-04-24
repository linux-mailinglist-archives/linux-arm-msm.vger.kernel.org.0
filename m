Return-Path: <linux-arm-msm+bounces-55414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9454FA9B06F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F9D75A2B4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F36284671;
	Thu, 24 Apr 2025 14:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ntOOgl9n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3678280A5A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504041; cv=none; b=L2Uyq1IBdriGF1Fi4shfkvkYIlZRrdYI0U3j6Z/yaf+PnFPCwf6OMNH/fCsuuj3JA16uxIRVsHwsxDmPEfy/yocjBFF+cKaYIch7XhJ1aCeRIsxYX0sz5YjwWeeatsgbUz+uT4T/nyJxHVw+295XWaa6ncpGp9spIoPSRfJLCq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504041; c=relaxed/simple;
	bh=nHdCN2XoC/vofWX1JvKbFFkxCi8mZFPmuv+AC6Hf5jo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZQpL8TcJqIiCD2J0ZDBmweEl3El0VPeexRYo2U4B/igGbIACsEKrSLHN8/sjPou/0ab6nIpltQSfupTq/IbpjKXKHcE+/NwzL4Vo40SVOt5Bt2SvWmhAjqJNO/40d62Dxxf5Jh0scsW0uAYu6J0WYsRwWVw1bIJHzmon0lxij9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ntOOgl9n; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1551362f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504037; x=1746108837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UEu5ZzgQoIbj2nEACS31q52k6ad3AHbKAZTQ1reR+A=;
        b=ntOOgl9n/47oroZlPn6W85vBTzu5j6rwgBhEPREb4qe+N2tqnT4YnQz2DuoRLWKqKE
         OBXxavFaZDwHbMUBy6/cWhwHQ5WvLaNgJ25npQJjfp/ft17XqPt9NoiwflfuD8Zh8kVp
         rlKDeiU34oH6MboBQ2L0v6yiz5rpUdrX6d4/L7lsJxBJwjw3Go1zmnt2zDqnPO4bE+Ja
         3rFMR1TjmrEwKb7z5vPaZ4/B9B8CB5b++pxgnG7+tJ1rSk38I32tp19nAfOLM8peApt2
         krnIwGIp5rlXpsAmiWONQf5GB/0WDGINuZKsk39kuKePSkTXs789DL2q9Y66Sl6J2IQW
         WiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504037; x=1746108837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UEu5ZzgQoIbj2nEACS31q52k6ad3AHbKAZTQ1reR+A=;
        b=dz6Ogwv4WOCuHSJ4sx2saZVnEikv4uaJCBm6wEz8J5R8t01YvtJ7IPJWvV4upjen6l
         V1A8xQ1QtUK8cSgeRH3v7Vw7JU8EudlNi8P+VUPTEJs7omCpSttuDGDx+uj9owDj4K3a
         TUJILlH1ulaO+831CjA/jIX7tJ1CSTY7wF2/2CXUIgZuuYsOpLta1LKmNocO0J1JBAjN
         dJceMjE7IhNT4i1Fe5VCWtN5DVSKC2dX744fv9g6EGF+4DGNpD1zdLMZ0B3/xmNdzgWx
         fz7HmGsqs1tEFDVfl1lzAiBF5Jg8IPhKkbUnWTKBstzO3DeVbdlTNAeJdijd+JqSxxcA
         /PPA==
X-Forwarded-Encrypted: i=1; AJvYcCVbu+1cIn86E8OCzkB2H9Bd49/0wFrlyOX8NN9qk+gkc06ynFlqB5QWY+qbWtK0qrJ3O2Ap/TcpZmckqh9e@vger.kernel.org
X-Gm-Message-State: AOJu0YwjX3iTocn8iAx9q9ma21LYOmjxjvwem/gpSWsoiak/RamcSgAx
	I3wj8ddtU9MxCVKHr15n80yCMMVxx+hStDziQEbCcHbxgoWmpYpbj+c88KOgu+A=
X-Gm-Gg: ASbGnctjh7sqe95vGcD14TDSY/tIqoeCrlWvuT0DlYB9RXopEwdzCD/y+GW428ZOFbA
	OHuNWS1wVcgOz23J04ymzl8JzwZK+kxljaev2MNOwwudk4SPzs/pyJvvf0WB2n60z3g6yS9IWVa
	SVfJY5Jbv2NTZ/eIjyWyIXpRQVQrl98F99/0jEj8EnKVHIEdw+ZAyGJhn7SlWzQIEWSOlfjwpG+
	DhP/2vxwnpF8shnBb4M4XfQrfXEIxGxQRysUVP8wcyUYxQwFu1ugmT1JNYDI5hP9ycsVDMKxOQP
	L4O9bXoEu4uConNTYm1DZHt/1vNCXOXTk7Da8im5CvAVuUauMeC0d7807jCmVqMzvQzZ8HkFVTU
	Sp6+y+TgqTpIKL2jK
X-Google-Smtp-Source: AGHT+IGbR1o2FMJriTxMh0pqGyENTmZYeFEOhlcuDYlWi636WYjhDM2clZgLdfLT+7JHm7l12d/JYg==
X-Received: by 2002:a05:6000:22c4:b0:3a0:3d18:285 with SMTP id ffacd0b85a97d-3a06d6dd54emr2218203f8f.25.1745504036794;
        Thu, 24 Apr 2025 07:13:56 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:56 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>
Subject: [RFC PATCH 09/34] dt-bindings: Add binding for gunyah hypervisor
Date: Thu, 24 Apr 2025 15:13:16 +0100
Message-Id: <20250424141341.841734-10-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Elliot Berman <quic_eberman@quicinc.com>

The Gunyah Resource Manager applies a devicetree overlay describing the
virtual platform configuration of the guest VM, such as the message
queue capability IDs for communicating with the Resource Manager. This
information is not otherwise discoverable by a VM: the Gunyah hypervisor
core does not provide a direct interface to discover capability IDs nor
a way to communicate with RM without having already known the
corresponding message queue capability ID. Add the DT bindings that
Gunyah adheres for the hypervisor node and message queues.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 .../bindings/firmware/gunyah-hypervisor.yaml  | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml

diff --git a/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
new file mode 100644
index 000000000000..cdeb4885a807
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/gunyah-hypervisor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Gunyah Hypervisor
+
+maintainers:
+  - Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
+  - Elliot Berman <quic_eberman@quicinc.com>
+
+description: |+
+  Gunyah virtual machines use this information to determine the capability IDs
+  of the message queues used to communicate with the Gunyah Resource Manager.
+  See also: https://github.com/quic/gunyah-resource-manager/blob/develop/src/vm_creation/dto_construct.c
+
+properties:
+  compatible:
+    const: gunyah-hypervisor
+
+  "#address-cells":
+    description: Number of cells needed to represent 64-bit capability IDs.
+    const: 2
+
+  "#size-cells":
+    description: must be 0, because capability IDs are not memory address
+                  ranges and do not have a size.
+    const: 0
+
+patternProperties:
+  "^gunyah-resource-mgr(@.*)?":
+    type: object
+    description:
+      Resource Manager node which is required to communicate to Resource
+      Manager VM using Gunyah Message Queues.
+
+    properties:
+      compatible:
+        const: gunyah-resource-manager
+
+      reg:
+        items:
+          - description: Gunyah capability ID of the TX message queue
+          - description: Gunyah capability ID of the RX message queue
+
+      interrupts:
+        items:
+          - description: Interrupt for the TX message queue
+          - description: Interrupt for the RX message queue
+
+    additionalProperties: false
+
+    required:
+      - compatible
+      - reg
+      - interrupts
+
+additionalProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    hypervisor {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        compatible = "gunyah-hypervisor";
+
+        gunyah-resource-mgr@0 {
+            compatible = "gunyah-resource-manager";
+            interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>, /* TX allowed IRQ */
+                         <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>; /* RX requested IRQ */
+            reg = <0x00000000 0x00000000>, /* TX capability ID */
+                  <0x00000000 0x00000001>; /* RX capability ID */
+        };
+    };
-- 
2.39.5


