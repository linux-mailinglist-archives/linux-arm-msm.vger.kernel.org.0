Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE1E149123
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 23:43:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387400AbgAXWnV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 17:43:21 -0500
Received: from mail-pf1-f176.google.com ([209.85.210.176]:37525 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387425AbgAXWnU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 17:43:20 -0500
Received: by mail-pf1-f176.google.com with SMTP id p14so1801109pfn.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 14:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fR36UAT87Z0TKgzJqLSUdRVGW5KC0xvFs4pz6EoaSEs=;
        b=W+AWfGtYERngYx58+JdIqakd2DAkpetfVaeID9hwBCBbON7jnjF1idcPZDN1OLhN3w
         622xZcGgQxsvPHvZRkgWq4dOLsTOXwAZNJpdMf7SjRPUPWSR5XzyvfIPtF37IF8PcLyF
         eG2poAj44PWrspC186mA54CivpdLZzf8SEW8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fR36UAT87Z0TKgzJqLSUdRVGW5KC0xvFs4pz6EoaSEs=;
        b=pjD9rlfIB96TsurtP0sBapMTwsF8MiHsd4wW5PzKvCXDqNNHRU3ytUccvY3l8V0UfL
         lhHoDzUnZpvkCDSrNEgFWbde6w+CTCw30GaUS7wWw5HXmBpeg4DXRJgGWrHscRxYwCBz
         qJMt3yYj8zbG8QaGjA01pRAVOtbHxMe0hEoz+zgn8DzDLCCPC7b+u29PxJg8Br8UkFxp
         8fj0dsYgfOumhfEJr4VGkkH7q2IqUhhvyWy+6geREntBrkInkHj78GN2JrqAWKcz6xy6
         qNUgr32YyvZ1vY/gYxWf6qe3LLiK0jZRw3l3rKklp2CUaI7Pq2JUUoLFAn6iUjMg+5jA
         B12Q==
X-Gm-Message-State: APjAAAUf8BzT8cKydfAAAuY42psSp92qQOTxte1vwlWqpiCjGlDpe/tg
        836C9ta4VyetGqJqV0t8wjUJBw==
X-Google-Smtp-Source: APXvYqzQWhWF4MQsZ7Z+9Immx0ruH/IjtEERzHTTTIJYCcURTdVPjfvN5BCLXulZMP1xLv21An1JIQ==
X-Received: by 2002:a63:1a19:: with SMTP id a25mr6709867pga.447.1579905800195;
        Fri, 24 Jan 2020 14:43:20 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id o2sm7690948pjo.26.2020.01.24.14.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 14:43:19 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        mka@chromium.org, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        hoegsberg@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/10] dt-bindings: clock: Fix qcom,gpucc bindings for sdm845/sc7180/msm8998
Date:   Fri, 24 Jan 2020 14:42:19 -0800
Message-Id: <20200124144154.v2.4.I513cd73b16665065ae6c22cf594d8b543745e28c@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200124224225.22547-1-dianders@chromium.org>
References: <20200124224225.22547-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qcom,dispcc bindings had a few problems with them:

1. When things were converted to yaml the name of the "gpll0 main"
   clock got changed from "gpll0" to "gpll0_main".  Change it back.

2. The bindings are written so that new boards don't have to specify
   all the clocks.  That doesn't really make sense.  Make it so that
   on new boards all 3 clocks are required.

This also updates the example to be sc7180 and use symbolic names for
clock indicies.

NOTE: It seems that we can only make things _more_ restrictive in the
per-SoC overrides for minItems/maxItems.  ...so by default we start
out with a loose min=2, max=3 (implicit).  Then we restrict msm8998 to
exactly 2 and everything else to exactly 3.

Fixes: 5c6f3a36b913 ("dt-bindings: clock: Add YAML schemas for the QCOM GPUCC clock bindings")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Patch ("dt-bindings: clock: Fix qcom,gpucc...") new for v2.

 .../devicetree/bindings/clock/qcom,gpucc.yaml | 42 ++++++++++++++-----
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 622845aa643f..64cf3c450325 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -21,19 +21,17 @@ properties:
       - qcom,sdm845-gpucc
 
   clocks:
-    minItems: 1
-    maxItems: 3
+    minItems: 2
     items:
       - description: Board XO source
-      - description: GPLL0 main branch source from GCC(gcc_gpu_gpll0_clk_src)
-      - description: GPLL0 div branch source from GCC(gcc_gpu_gpll0_div_clk_src)
+      - description: GPLL0 main branch source (gcc_gpu_gpll0_clk_src)
+      - description: GPLL0 div branch source (gcc_gpu_gpll0_div_clk_src)
 
   clock-names:
-    minItems: 1
-    maxItems: 3
+    minItems: 2
     items:
       - const: xo
-      - const: gpll0_main
+      - const: gpll0
       - const: gpll0_div
 
   '#clock-cells':
@@ -57,16 +55,38 @@ required:
   - '#reset-cells'
   - '#power-domain-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: qcom,msm8998-gpucc
+then:
+  properties:
+    clocks:
+      maxItems: 2
+    clock-names:
+      maxItems: 2
+else:
+  properties:
+    clocks:
+      minItems: 3
+    clock-names:
+      minItems: 3
+
 examples:
   # Example of GPUCC with clock node properties for SDM845:
   - |
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
     clock-controller@5090000 {
       compatible = "qcom,sdm845-gpucc";
-      reg = <0x5090000 0x9000>;
-      clocks = <&rpmhcc 0>, <&gcc 31>, <&gcc 32>;
-      clock-names = "xo", "gpll0_main", "gpll0_div";
+      reg = <0 0x05090000 0 0x9000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+         <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+         <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+      clock-names = "xo", "gpll0", "gpll0_div";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-     };
+    };
 ...
-- 
2.25.0.341.g760bfbb309-goog

