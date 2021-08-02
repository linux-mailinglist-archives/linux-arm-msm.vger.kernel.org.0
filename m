Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE83A3DE319
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 01:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233319AbhHBXaf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 19:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbhHBXae (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 19:30:34 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D716C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Aug 2021 16:30:23 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id f11so22231794ioj.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Aug 2021 16:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wmjQVNSZtVohWFF+DxXEIMaU+MncLNjWBs6iyjh1uQ0=;
        b=fLGI5ysy2kb16zeHNWiYoBNA7qEUZyanhSU47oANOIh5KEiyJWypnWyuNcgLuevSmL
         Z+PDztWfXK4+xpK3mOvTT9F8swt+WmgEr+alzW7xHx/EpLgbu6AJCkTPYvGsFjriLt9U
         X3T0DwfI0qukLvvILVaJuQEVbeqpuS5zqaY2S7kW5qbeGwVjSobyIhjhMspkeb3+SKr9
         w2dMLu5srTyX7JnD3X/3GZJNS1kEnsRnmWGm3jhpZU/HRRhjn5NWHRRkX4zdYoJfSIoC
         w5iO6WNcXf/3MGnEKbDSbqI5hLF0062/rpDY2PghSne6Af4acTdCS1D8AGTXTo2SRbDo
         smYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wmjQVNSZtVohWFF+DxXEIMaU+MncLNjWBs6iyjh1uQ0=;
        b=Tq/0qcxMaPMsetvgWUuAL5fqDXb/2GdH/4IfYo7J5El5Vylvv76IKGrCQwD0Zzw6eD
         1pLX5uVhNzXudBIWXwwJW3B/RdtJ18hF+PlSb/2OC77+6n5pbHUUlFvZEEgjwgIJu086
         0+CJAO1k/V2KGMkzgugSw4UhOEKHTTyldC2B6bMsCyYkx31UcmD8ox/MPgop7Su0a7xD
         TEds1gC6aix1y12T79siyAyqc7ithzSVMFrxc3GbMtke+q89CqLIDFnpH1pZEootbRpO
         u8v3v+LMgUppmFkVrj60mk2+GjPa3IMzMrz5pM2gOHUgOI+kwHZSTWfFkBBYvoNAIg4s
         WzZw==
X-Gm-Message-State: AOAM530u71NOAwlvbJBtQ5+O3vbPTv+1R0PTGVvRCnm1LeHf4JZbiDVR
        jgnhtOi2evo2+ryeAmWGbdwY+w==
X-Google-Smtp-Source: ABdhPJzpEN+WtC0hdjPzcfHayTwUdwgoN2rTeVk0eaogV8FJXcHTRodX8uCpDOsRMScUUOXdBHqePg==
X-Received: by 2002:a02:5d0a:: with SMTP id w10mr16888339jaa.47.1627947022980;
        Mon, 02 Aug 2021 16:30:22 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id y17sm460883ilm.0.2021.08.02.16.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 16:30:22 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        subashab@codeaurora.org, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/1] Revert "Merge branch 'qcom-dts-updates'"
Date:   Mon,  2 Aug 2021 18:30:19 -0500
Message-Id: <20210802233019.800250-2-elder@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210802233019.800250-1-elder@linaro.org>
References: <20210802233019.800250-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit b79c6fba6cd7c49a7dbea9999e182f74cca63e19, reversing
these changes made to 0ac26271344478ff718329fa9d4ef81d4bcbc43b:

  commit 6a0eb6c9d934 ("dt-bindings: net: qcom,ipa: make imem interconnect
                       optional")
  commit f8bd3c82bf7d ("arm64: dts: qcom: sc7280: add IPA information")
  commit fd0f72c34bd9 ("arm64: dts: qcom: sc7180: define ipa_fw_mem node")

I intend for these commits to go through the Qualcomm repository, to
avoid conflicting with other activity being merged there.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 .../devicetree/bindings/net/qcom,ipa.yaml     | 18 ++++----
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  5 ---
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 43 -------------------
 3 files changed, 8 insertions(+), 58 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 4853ab7017bd9..ed88ba4b94df5 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -87,18 +87,16 @@ properties:
       - const: ipa-setup-ready
 
   interconnects:
-    minItems: 2
     items:
-      - description: Path leading to system memory
-      - description: Path between the AP and IPA config space
-      - description: Path leading to internal memory
+      - description: Interconnect path between IPA and main memory
+      - description: Interconnect path between IPA and internal memory
+      - description: Interconnect path between IPA and the AP subsystem
 
   interconnect-names:
-    minItems: 2
     items:
       - const: memory
-      - const: config
       - const: imem
+      - const: config
 
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -209,11 +207,11 @@ examples:
 
                 interconnects =
                         <&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_EBI1>,
-                        <&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_IPA_CFG>,
-                        <&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_IMEM>;
+                        <&rsc_hlos MASTER_IPA &rsc_hlos SLAVE_IMEM>,
+                        <&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_IPA_CFG>;
                 interconnect-names = "memory",
-                                     "config",
-                                     "imem";
+                                     "imem",
+                                     "config";
 
                 qcom,smem-states = <&ipa_smp2p_out 0>,
                                    <&ipa_smp2p_out 1>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 7e0ff917e548c..a9a052f8c63c8 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -110,11 +110,6 @@ tz_mem: memory@80b00000 {
 			no-map;
 		};
 
-		ipa_fw_mem: memory@8b700000 {
-			reg = <0 0x8b700000 0 0x10000>;
-			no-map;
-		};
-
 		rmtfs_mem: memory@94600000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0x94600000 0x0 0x200000>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 5eb2b58ea23be..a8c274ad74c47 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -7,7 +7,6 @@
 
 #include <dt-bindings/clock/qcom,gcc-sc7280.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
-#include <dt-bindings/interconnect/qcom,sc7280.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-aoss-qmp.h>
@@ -64,11 +63,6 @@ cpucp_mem: memory@80b00000 {
 			no-map;
 			reg = <0x0 0x80b00000 0x0 0x100000>;
 		};
-
-		ipa_fw_mem: memory@8b700000 {
-			reg = <0 0x8b700000 0 0x10000>;
-			no-map;
-		};
 	};
 
 	cpus {
@@ -514,43 +508,6 @@ mmss_noc: interconnect@1740000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
-		ipa: ipa@1e40000 {
-			compatible = "qcom,sc7280-ipa";
-
-			iommus = <&apps_smmu 0x480 0x0>,
-				 <&apps_smmu 0x482 0x0>;
-			reg = <0 0x1e40000 0 0x8000>,
-			      <0 0x1e50000 0 0x4ad0>,
-			      <0 0x1e04000 0 0x23000>;
-			reg-names = "ipa-reg",
-				    "ipa-shared",
-				    "gsi";
-
-			interrupts-extended = <&intc 0 654 IRQ_TYPE_EDGE_RISING>,
-					      <&intc 0 432 IRQ_TYPE_LEVEL_HIGH>,
-					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "ipa",
-					  "gsi",
-					  "ipa-clock-query",
-					  "ipa-setup-ready";
-
-			clocks = <&rpmhcc RPMH_IPA_CLK>;
-			clock-names = "core";
-
-			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_IPA_CFG 0>;
-			interconnect-names = "memory",
-					     "config";
-
-			qcom,smem-states = <&ipa_smp2p_out 0>,
-					   <&ipa_smp2p_out 1>;
-			qcom,smem-state-names = "ipa-clock-enabled-valid",
-						"ipa-clock-enabled";
-
-			status = "disabled";
-		};
-
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex", "syscon";
 			reg = <0 0x01f40000 0 0x40000>;
-- 
2.27.0

