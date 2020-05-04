Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44491C4595
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 20:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730851AbgEDSP5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 14:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730708AbgEDR7J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 13:59:09 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56924C061A41
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 10:59:09 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id k81so463180qke.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 10:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hmchGPRatpHGz7FXodcq0SJqPYC5mC9nnx68TlaFw4w=;
        b=nKm/NU/E8zknhGFBOyhBDH4qXUn8D776cT5h6JHftF4GhhDK6x9ry2rz/3390vKj+L
         tN2liW5eIzpYXyOpEagl2/5lPJmBZ/VQImzT4IVSWB4A1XwFTg5LAMBg+Y79lMTvnRbz
         fqUzQGcouFhzr7nhC+k8ZJKatIpZACKQ5KsgukU8IdQ4ybdM5qw3Q2p8bw7XJfI58Ne8
         d+GGbZTZ274frK+wfzNePMwxV38lK3jsUAI762x47ra+I05WuZNE7YyUGRj4Ej2dR8IG
         Zvj23kfA5xhRNdBa/Sm5jyZbT83OnNaTEKCCSmD7asI0QyaFyDOXBFhqBZG9KzBxltEi
         hTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hmchGPRatpHGz7FXodcq0SJqPYC5mC9nnx68TlaFw4w=;
        b=P3Ean+0IGeVNz2d5Di04OCQzHwLeJktrBgCYRPOa8l8/U498GtFDoQq+zlk8vZA3kC
         92wnrwrXDp0nHlcJ5XJRco1IULu7I/BQi3P+/SBTqGyMcDZKXPqhbsXjjE1OOTRZ6J4p
         cyOQl5dQN7cQ/n8w+4LaMc/pCsz7KSBeCgN2h3ahVCKM0XWY+95+QkrhTWqFkMCgsphK
         phV1FCwkPF0fv5gnfiXPxv+c0crKXxVYna/j0VWaTUcW6tza+6N5PMGYk0K1J0BajxFB
         xHpjTNsjiPr7dpOfx2jFAEhxwMofVEou8Jn/hludgJDIlawHORlKR4lu2JdxRNk2ECCq
         7THg==
X-Gm-Message-State: AGi0PuZqPPGKWl8hQL07xp8d4P2gOI4nz57EfLLr8wdwJgrsifhDZZyZ
        SJ8un892y/O+Rwe/l80r3ow8jg==
X-Google-Smtp-Source: APiQypKHzejQhJPuhrRIg5ZslvlTZGo4JtzrXdUU6lsW+xZU4Q0pY9zUQ7/oIZ0C/MMhJDrMkTTBcg==
X-Received: by 2002:a05:620a:15c1:: with SMTP id o1mr387681qkm.187.1588615148533;
        Mon, 04 May 2020 10:59:08 -0700 (PDT)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id h19sm11271088qtk.78.2020.05.04.10.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 10:59:08 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, davem@davemloft.net
Cc:     evgreen@chromium.org, subashab@codeaurora.org,
        cpratapa@codeaurora.org, bjorn.andersson@linaro.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/4] dt-bindings: net: add IPA iommus property
Date:   Mon,  4 May 2020 12:58:56 -0500
Message-Id: <20200504175859.22606-2-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200504175859.22606-1-elder@linaro.org>
References: <20200504175859.22606-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The IPA accesses "IMEM" and main system memory through an SMMU, so
its DT node requires an iommus property to define range of stream IDs
it uses.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 140f15245654..7b749fc04c32 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -20,7 +20,10 @@ description:
   The GSI is an integral part of the IPA, but it is logically isolated
   and has a distinct interrupt and a separately-defined address space.
 
-  See also soc/qcom/qcom,smp2p.txt and interconnect/interconnect.txt.
+  See also soc/qcom/qcom,smp2p.txt and interconnect/interconnect.txt.  See
+  iommu/iommu.txt and iommu/arm,smmu.yaml for more information about SMMU
+  bindings.
+
 
   - |
     --------             ---------
@@ -54,6 +57,9 @@ properties:
       - const: ipa-shared
       - const: gsi
 
+  iommus:
+    maxItems: 1
+
   clocks:
     maxItems: 1
 
@@ -126,6 +132,7 @@ properties:
 
 required:
   - compatible
+  - iommus
   - reg
   - clocks
   - interrupts
@@ -164,6 +171,7 @@ examples:
                 modem-init;
                 modem-remoteproc = <&mss_pil>;
 
+                iommus = <&apps_smmu 0x720 0x3>;
                 reg = <0 0x1e40000 0 0x7000>,
                         <0 0x1e47000 0 0x2000>,
                         <0 0x1e04000 0 0x2c000>;
-- 
2.20.1

