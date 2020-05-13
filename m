Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B42D1D0403
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 02:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732119AbgEMAzq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 20:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732106AbgEMAzf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 20:55:35 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D31EAC05BD0B
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 17:55:32 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id a4so7002746pgc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 17:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RUnboi85SF121UrpH3bFZwKuXXQdWqb1eY3bgMeZfq0=;
        b=wDywye9WHHKlG4Dfqc21+Ymi2c2GhfCM0ndcG4w9gBx7gisAbn4XX9/yj7tDGO115V
         abVKOSJEUOvd6HoJP5oJpCXpWvka1K32OidCK+B8/6Jx40lL0mr4aXfEYJSTnCTl1LUI
         kgXiaIugTpwmRc/fuTUgNjtbo5iC7uftSfZM7cd81+K/Z4qfDiTgQUN/UoeRsAeabvEv
         ejL1Hehbz54YHGyo82eRm4yjvmrwTHHr981Dp+29CVSDPEt4AjHetPeMYtEJfRBtxIDQ
         1dyTYk1mY7y8sQr/uRKYp4w2rlVlQXl0f3wPGSwuk13zlP59aq/7d41SYBYCw2u7qWI3
         QKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RUnboi85SF121UrpH3bFZwKuXXQdWqb1eY3bgMeZfq0=;
        b=uZyri4QedQ817GhR8hsoEj1xpkrmT8xva/ZVTJmRh3e8C+9HW/2xah6/uh+7XK6vgA
         u4T2z6tGiZBSy0lQ3i1Y7a4njeMGboomRPFLnlr4yPYRXKRMEEGInWmfilWJZpz9NgHA
         wwsZ3xL9rnxQGCR7gSZq2qicXLVjvGbJ+IMszsaxZWdZHEUCf/BzHSuJDOoA5zAReAom
         zFnq2J3Mg+ZCD6pad64SPx2y/7+Rn9/XpaKUfJCBA/LhUrXhh6Qc71MkF8IxiuD10DBG
         hEYHxz2EARILVT2ZiZ9wnx6XQsc/I6qGGpyMpMj15BzeMYRdpb3DRyiqBk3NvdxPJKOA
         UhAQ==
X-Gm-Message-State: AOAM531Lx+CZpoDhnNtgyZFulxOaxdW70uuvoZwf7/fF17ScGb3RQI0z
        LxsYFJnMKx9OCR+Bhp2/xqbO8A==
X-Google-Smtp-Source: ABdhPJwIlsG5NiDBXR0Xm2F0/KvNmdfVmcPTDcQEKb3c9MavHvcvGtJXMUS6fhDsJSWryUxHKLA6BQ==
X-Received: by 2002:a62:8c0b:: with SMTP id m11mr3886830pfd.105.1589331332342;
        Tue, 12 May 2020 17:55:32 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p2sm11057428pgh.25.2020.05.12.17.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 17:55:31 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: hwlock: qcom: Allow device on mmio bus
Date:   Tue, 12 May 2020 17:54:39 -0700
Message-Id: <20200513005441.1102586-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
References: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In all modern Qualcomm platforms the mutex region of the TCSR is forked
off into its own block, all with a offset of 0 and stride of 4096.
Update the binding to allow the hardware block to be described directly
on the mmio bus, in addition to allowing the existing syscon based
definition.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/hwlock/qcom-hwspinlock.yaml         | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
index 71e63b52edd5..88f975837588 100644
--- a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
@@ -19,6 +19,9 @@ properties:
       - qcom,sfpb-mutex
       - qcom,tcsr-mutex
 
+  reg:
+    maxItems: 1
+
   '#hwlock-cells':
     const: 1
 
@@ -31,7 +34,12 @@ properties:
 required:
   - compatible
   - '#hwlock-cells'
-  - syscon
+
+oneOf:
+  - required:
+    - reg
+  - required:
+    - syscon
 
 additionalProperties: false
 
@@ -46,6 +54,12 @@ examples:
                 compatible = "qcom,tcsr-mutex";
                 syscon = <&tcsr_mutex_block 0 0x80>;
 
+                #hwlock-cells = <1>;
+        };
+  - |
+        tcsr_mutex: hwlock@1f40000 {
+                compatible = "qcom,tcsr-mutex";
+                reg = <0x01f40000 0x40000>;
                 #hwlock-cells = <1>;
         };
 ...
-- 
2.26.2

