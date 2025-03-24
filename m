Return-Path: <linux-arm-msm+bounces-52334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89753A6DA6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 13:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1A977A7BB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 12:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7581025EFBD;
	Mon, 24 Mar 2025 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XlmsQXd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F9A25EFBC
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 12:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742820751; cv=none; b=OlQ5M4SEpPYtMUlfGYAa4zFMnUSgk/rLJh0UC7TtJ/TFRrKqYoCANFfHBZ4z07nt6Buf/WxVNM33UZHb5t/FRBEmcK4UJYqQf41DIF7CHGQ9QElO0I0Flty8Y7ewW0xRXZE3l1MBlLSk/4vgt4+1Ao+qUDtP8jRnizmW61a5fd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742820751; c=relaxed/simple;
	bh=chitrqrnSa6cJWsoZBuUNvscJvUlLOoj3Yo6FWLqkkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HY+ypmV0M8cAwXUrR55hDHNG6hUiAqnJ8OWpwN/WiqWPLuqNAQ95UOEb5MoGzay7OxSoolpj0kNqQ5FTdgSx4M5eVKVTk681MpnguNYxRRuROxUkYX7thoAmu86LiKjA0EdfpUcVHBhK+kRytA12h9EJiRhf39r33OLSdFRY5x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XlmsQXd0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so4548955e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 05:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820746; x=1743425546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LzQkT2/vQ7md+WCBkEBxd0za9gJ+1+dJS4YU8fFuils=;
        b=XlmsQXd0Wz8I4pY28KoUIEZVjuQWPht89M9yhZJWoiSOrQfNeCq6o2Ud458tOG0gFy
         joJFaZ22O432JwXVbvpUevrP0qAaInsUOgflWn3vFNO69sprFJuyJTBBhM/auan/W7GG
         MbuT+0aDtE5+RlKEeu2hocC4zw4tLPCr+NmjmU7CaxS5FYjynOrW5vwytgz1aKZqgHhR
         HmX13ziOEtf7N5pG0pNmrLaCN5SC+arCQhuaaS3rajzmJRN1wkZVzl1WdYRpnZu8jQqb
         79qTUm8Qc6wAJHqcqwI/5XUylUoS1mOlX+fTnvV20/uigUhLXO+RLGQ9D2hhKH5C+ExF
         oabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820746; x=1743425546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzQkT2/vQ7md+WCBkEBxd0za9gJ+1+dJS4YU8fFuils=;
        b=XBNS46ZME0ueTVfY5aDbTCFoJgVsOt/FVrBGAO2/waks7kZr9V8jR7hAFjMX9JkSdt
         wCm0g6VWC+ijpfTt8XxuBWYEZ0SY+8sSmnfnwGgI80613+DjFS5gFEC+MrNQpkjzV10S
         n4nULyst7XF44yAdgPTotZVyUKTdq38tHpa2njqGQg/nTeGDfcaOZ6xt0+go58JI8aGS
         Z+zrVhXeYqhUAgLn8IlMy85ATrHlpRV18iAdf6knGY1yic5uSv3xbIy9GgiIyY2/qHCI
         bfqmV4JRMHbENVMaVm5vT2oXOi/3FcDrYpQRgBWLHBlNQ4fEBTDVCRKhCcC6HmCvo1Hz
         3RuA==
X-Forwarded-Encrypted: i=1; AJvYcCWapFCs9nqqvHhMQypfkWN+v+n8o2lGVl4h0vdSoOhnK85/w7+nCzIoeWpGkxIaH4cB4rK0950gfQdc1ANs@vger.kernel.org
X-Gm-Message-State: AOJu0YxTzMzmqCzxO2PSaTIoQkFRm060o+F/L1SZEbQ6Hcv+TjYi1rJw
	QAimpTkuK6kqZFlOcQPPbWZcBkqKi2QCpbc6OmwIVE0ngkjsFQGUCjp9Fe3rCCDe97wWc1M2OE5
	W
X-Gm-Gg: ASbGncsUQdLpPgVjMnGgagc9MFk+QaOHxwsqAuZRh+omrN/2VBEzMlWJRa++yPfiqQx
	ZpGEH0XvbWN8VRqzrx74TCZLr1rCk0bS8M0ChhlTYoFCqOoobxsyeM0mKEnTo+gXOFdGCSGFvGt
	5aI6ShRnO5VIqD8hap0Niv+zS9eIzyCDCJJygrxPF8V6UnVSU4fRCvTB9bQri4razfdxEHUiOQY
	2DXLOr+QbKjP4v21F4OtN0Uj/QzrQITFNWX5bSEL4QcpvNpd5uyEf28R8WKJnVYToko10hZwj9f
	SewrdcXU9Fcx1DTAO0rRYZ52fue2oW6/z5vXaqFWRV94YvDzRIYka/issQ==
X-Google-Smtp-Source: AGHT+IHigrY3PHOFldlCzJ8vlwnInEATFLh/99kGQvln1Q9qBXvO1GQ8JqQwrXTWTD0MPZYBaFhJrw==
X-Received: by 2002:a05:600c:c08:b0:43b:bbb9:e25f with SMTP id 5b1f17b1804b1-43d50a526bfmr48046505e9.6.1742820746484;
        Mon, 24 Mar 2025 05:52:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd277d5sm120614535e9.19.2025.03.24.05.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:52:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alex Elder <elder@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: net: qcom,ipa: Correct indentation and style in DTS example
Date: Mon, 24 Mar 2025 13:52:22 +0100
Message-ID: <20250324125222.82057-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/qcom,ipa.yaml     | 124 +++++++++---------
 1 file changed, 62 insertions(+), 62 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 1a46d80a66e8..b4a79912d473 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -210,70 +210,70 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        #include <dt-bindings/clock/qcom,rpmh.h>
-        #include <dt-bindings/interconnect/qcom,sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,sdm845.h>
 
-        smp2p-mpss {
-                compatible = "qcom,smp2p";
-                interrupts = <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>;
-                mboxes = <&apss_shared 6>;
-                qcom,smem = <94>, <432>;
-                qcom,local-pid = <0>;
-                qcom,remote-pid = <5>;
+    smp2p-mpss {
+        compatible = "qcom,smp2p";
+        interrupts = <GIC_SPI 576 IRQ_TYPE_EDGE_RISING>;
+        mboxes = <&apss_shared 6>;
+        qcom,smem = <94>, <432>;
+        qcom,local-pid = <0>;
+        qcom,remote-pid = <5>;
 
-                ipa_smp2p_out: ipa-ap-to-modem {
-                        qcom,entry-name = "ipa";
-                        #qcom,smem-state-cells = <1>;
-                };
-
-                ipa_smp2p_in: ipa-modem-to-ap {
-                        qcom,entry-name = "ipa";
-                        interrupt-controller;
-                        #interrupt-cells = <2>;
-                };
+        ipa_smp2p_out: ipa-ap-to-modem {
+                qcom,entry-name = "ipa";
+                #qcom,smem-state-cells = <1>;
         };
 
-        ipa@1e40000 {
-                compatible = "qcom,sc7180-ipa";
-
-                qcom,gsi-loader = "self";
-                memory-region = <&ipa_fw_mem>;
-                firmware-name = "qcom/sc7180-trogdor/modem/modem.mbn";
-
-                iommus = <&apps_smmu 0x440 0x0>,
-                         <&apps_smmu 0x442 0x0>;
-                reg = <0x1e40000 0x7000>,
-                      <0x1e47000 0x2000>,
-                      <0x1e04000 0x2c000>;
-                reg-names = "ipa-reg",
-                            "ipa-shared",
-                            "gsi";
-
-                interrupts-extended = <&intc GIC_SPI 311 IRQ_TYPE_EDGE_RISING>,
-                                      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
-                                      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-                                      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
-                interrupt-names = "ipa",
-                                  "gsi",
-                                  "ipa-clock-query",
-                                  "ipa-setup-ready";
-
-                clocks = <&rpmhcc RPMH_IPA_CLK>;
-                clock-names = "core";
-
-                interconnects =
-                        <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
-                        <&aggre2_noc MASTER_IPA 0 &system_noc SLAVE_IMEM 0>,
-                        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_IPA_CFG 0>;
-                interconnect-names = "memory",
-                                     "imem",
-                                     "config";
-
-                qcom,qmp = <&aoss_qmp>;
-
-                qcom,smem-states = <&ipa_smp2p_out 0>,
-                                   <&ipa_smp2p_out 1>;
-                qcom,smem-state-names = "ipa-clock-enabled-valid",
-                                        "ipa-clock-enabled";
+        ipa_smp2p_in: ipa-modem-to-ap {
+                qcom,entry-name = "ipa";
+                interrupt-controller;
+                #interrupt-cells = <2>;
         };
+    };
+
+    ipa@1e40000 {
+        compatible = "qcom,sc7180-ipa";
+
+        qcom,gsi-loader = "self";
+        memory-region = <&ipa_fw_mem>;
+        firmware-name = "qcom/sc7180-trogdor/modem/modem.mbn";
+
+        iommus = <&apps_smmu 0x440 0x0>,
+                 <&apps_smmu 0x442 0x0>;
+        reg = <0x1e40000 0x7000>,
+              <0x1e47000 0x2000>,
+              <0x1e04000 0x2c000>;
+        reg-names = "ipa-reg",
+                    "ipa-shared",
+                    "gsi";
+
+        interrupts-extended = <&intc GIC_SPI 311 IRQ_TYPE_EDGE_RISING>,
+                              <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
+                              <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "ipa",
+                          "gsi",
+                          "ipa-clock-query",
+                          "ipa-setup-ready";
+
+        clocks = <&rpmhcc RPMH_IPA_CLK>;
+        clock-names = "core";
+
+        interconnects =
+                <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
+                <&aggre2_noc MASTER_IPA 0 &system_noc SLAVE_IMEM 0>,
+                <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_IPA_CFG 0>;
+        interconnect-names = "memory",
+                             "imem",
+                             "config";
+
+        qcom,qmp = <&aoss_qmp>;
+
+        qcom,smem-states = <&ipa_smp2p_out 0>,
+                           <&ipa_smp2p_out 1>;
+        qcom,smem-state-names = "ipa-clock-enabled-valid",
+                                "ipa-clock-enabled";
+    };
-- 
2.43.0


