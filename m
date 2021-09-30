Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36B141E0EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 20:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350811AbhI3SVL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 14:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350445AbhI3SVJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 14:21:09 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C1CC06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 11:19:26 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id a17-20020a4a6851000000b002b59bfbf669so2127274oof.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I3QEbxt5uEHrOmXC8KCrrnLxWzCqzAmWjkibzCAclE4=;
        b=MXtkO4ZL2hg6pJxEcl6h3nK1ZPFXDIpp3fzznUJXpyc3ZujmcrZh9AxCkxfMYVXJ+c
         wfczBlkCOikmsURoZoCQZpla2ICy8zT4o0AFWkS+SoSyZzbRTkcNDqxgr3ynXI0BZzj1
         ED9YKCwiHYk1xmc6D810dKtLLrGKLDOdn0mB/A6+G24k/QOPkCIpPrxugQX+JfDWM//X
         nKGuQUFjBZOgJ1FweOAidBb/O7jIe1eKODkxTaD+x/CQ4Yf09nHOdHdwjRIuMhhpR8Vn
         egZ0Z3GnVYR9+qJ9DZxDoxYy8XEUBzzzUuzlNychc9Y1328x8++UVKx6lUKwKfMvTzVy
         GogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I3QEbxt5uEHrOmXC8KCrrnLxWzCqzAmWjkibzCAclE4=;
        b=Lz71p+wqsL3/h8mGmjvSVBgQtvBgzP7sazM8JM2ML1dp0CgF5UPApT00YBDMp6beeR
         7aAVSTNkORSJd2Hew3WhysVBGm6Cvla0HUhImE5NKYkCCXf7t3C9DA9X/8a7ouW7+kl7
         VFsbhQ/aD0dfNyLmiElNJobkg76WWX8EXGtp6jy0yAWlnXOhazwjbC5hITUwz918HLzW
         5x3TPe6HSjxIKVgkTDDIQPbmivRPM1tCeTHLCYzSINm/vPHYynOFEZHTKFXJ8c05Nzpw
         x6qVHzN6iBbtjqLvOs90ONEq7J67YkLEYa8uoClBgzmlpCJBEL+TIPvUYWGoL4CKP/gu
         TdAA==
X-Gm-Message-State: AOAM53160zf7XT/lAeLJPeAbY1N+emPm1/EPJL2SpfTJpnY6tWSOFGgG
        0IpERUW0a6wPDEDGgM7tI/YWmA==
X-Google-Smtp-Source: ABdhPJyJ0gLxYo5g3S61yQhJ3Qd1BV0yhEyePn5x/zs2PClR9zQgPLraSzO91ZyDUITuSMtDXcWmYg==
X-Received: by 2002:a4a:d9c6:: with SMTP id l6mr6134204oou.0.1633025965420;
        Thu, 30 Sep 2021 11:19:25 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k6sm727416otf.80.2021.09.30.11.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 11:19:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chris Lew <clew@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH v2 2/4] dt-bindings: soc: smem: Make indirection optional
Date:   Thu, 30 Sep 2021 11:21:09 -0700
Message-Id: <20210930182111.57353-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210930182111.57353-1-bjorn.andersson@linaro.org>
References: <20210930182111.57353-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the olden days the Qualcomm shared memory (SMEM) region consisted of
multiple chunks of memory, so SMEM was described as a standalone node
with references to its various memory regions.

But practically all modern Qualcomm platforms has a single reserved memory
region used for SMEM. So rather than having to use two nodes to describe
the one SMEM region, update the binding to allow the reserved-memory
region alone to describe SMEM.

The olden format is preserved as valid, as this is widely used already.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 .../bindings/soc/qcom/qcom,smem.yaml          | 34 ++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
index f7e17713b3d8..4149cf2b66be 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
@@ -10,14 +10,18 @@ maintainers:
   - Andy Gross <agross@kernel.org>
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
-description: |
-  This binding describes the Qualcomm Shared Memory Manager, used to share data
-  between various subsystems and OSes in Qualcomm platforms.
+description:
+  This binding describes the Qualcomm Shared Memory Manager, a region of
+  reserved-memory used to share data between various subsystems and OSes in
+  Qualcomm platforms.
 
 properties:
   compatible:
     const: qcom,smem
 
+  reg:
+    maxItems: 1
+
   memory-region:
     maxItems: 1
     description: handle to memory reservation for main SMEM memory region.
@@ -29,11 +33,19 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: handle to RPM message memory resource
 
+  no-map: true
+
 required:
   - compatible
-  - memory-region
   - hwlocks
 
+oneOf:
+  - required:
+      - reg
+      - no-map
+  - required:
+      - memory-region
+
 additionalProperties: false
 
 examples:
@@ -43,6 +55,20 @@ examples:
         #size-cells = <1>;
         ranges;
 
+        smem@fa00000 {
+            compatible = "qcom,smem";
+            reg = <0xfa00000 0x200000>;
+            no-map;
+
+            hwlocks = <&tcsr_mutex 3>;
+        };
+    };
+  - |
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
         smem_region: smem@fa00000 {
             reg = <0xfa00000 0x200000>;
             no-map;
-- 
2.29.2

