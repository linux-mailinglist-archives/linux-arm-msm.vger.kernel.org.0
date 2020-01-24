Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17F3A14912A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 23:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387486AbgAXWn1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 17:43:27 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39383 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387470AbgAXWnZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 17:43:25 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so1364323plp.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 14:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KgDJnseYnz4OU4RUOTS2EdiEuy4zgbQiW3cvu5KP3Bs=;
        b=GAuRxrEUmOh1B/lYq8pdQNa2Ca4EhT9saJERWCzXtmnE8VntcFpUki5UHOAstOSmkP
         i3VSpJxMwUeIIc7K/XYK2OAzVhsmxra6igc8yt7Vhaank8vcIRJ707V1CsdHroQBquV5
         JeoMA39mKgXUxpl9qyig7L7KuxfJoMVrluNXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KgDJnseYnz4OU4RUOTS2EdiEuy4zgbQiW3cvu5KP3Bs=;
        b=TOo61Qn9KuAHW8dSN8QK+gjoenu2Jg44cl17pvE5HDmlaHRJ/GxTxCnwC5d6aTbAKj
         FpMMqyjW5gwOtlZ8fbCWqlEGgaiUIY2Vh+MF0VYzyeCuJu4iPoQfUFOnsLh5LUrU62YS
         fkLyA8TR7P/h4BI/JXV1G3elGhYhzOr2voQc+LBAzN+8uTs36i5P12SVdgLZ+5A9GbVN
         M6Zk2UmTFwd3ulPnaXm+L7Zd2b22I+4r7TxYAE57eVOQpdpelTGdbB5gc6oJQ7SXxmrZ
         A53UXeLDp44F3tvLVqMpvDFGEeWlfGzM6ur/E4v7lgZwApJhLFpyHT/7diXvswDktvC7
         ROXA==
X-Gm-Message-State: APjAAAWyzsIb0nILxNZmJ9htZ1j3VJSfOqyEt8iqbjS6h3bHKgiKJERn
        JrKe9x7jA0v24mL3pJp08qyCMw==
X-Google-Smtp-Source: APXvYqxPaY2TkvBXDFF6hVUkaUSUdjm0Pk7pvufJGy0X/2Yc03N2ElivrqXa01QJ+81P7T4JRLsCFA==
X-Received: by 2002:a17:902:aa45:: with SMTP id c5mr5882411plr.305.1579905804708;
        Fri, 24 Jan 2020 14:43:24 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id o2sm7690948pjo.26.2020.01.24.14.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 14:43:24 -0800 (PST)
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
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 08/10] dt-bindings: clock: Cleanup qcom,videocc bindings for sdm845/sc7180
Date:   Fri, 24 Jan 2020 14:42:23 -0800
Message-Id: <20200124144154.v2.8.I27bbd90045f38cd3218c259526409d52a48efb35@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200124224225.22547-1-dianders@chromium.org>
References: <20200124224225.22547-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This makes the qcom,videocc bindings match the recent changes to the
dispcc and gpucc.  Unlike the recent changes to those files, this one
doesn't really have any functional change.  It:

1. Adds a description for the XO clock.  Not terribly important but
   nice if it cleanly matches its cousins.

2. Updates the example to use the symbolic name for the RPMH clock and
   also show that the real devices are currently using 2 address cells
   / size cells and fixes the spacing on the closing brace.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Patch ("dt-bindings: clock: Cleanup qcom,videocc") new for v2.

 .../devicetree/bindings/clock/qcom,videocc.yaml        | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 43cfc893a8d1..745928dc0fcb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -20,7 +20,8 @@ properties:
       - qcom,sdm845-videocc
 
   clocks:
-    maxItems: 1
+    items:
+      - description: Board XO source
 
   clock-names:
     items:
@@ -50,13 +51,14 @@ required:
 examples:
   # Example of VIDEOCC with clock node properties for SDM845:
   - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
     clock-controller@ab00000 {
       compatible = "qcom,sdm845-videocc";
-      reg = <0xab00000 0x10000>;
-      clocks = <&rpmhcc 0>;
+      reg = <0 0x0ab00000 0 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>;
       clock-names = "xo";
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;
-     };
+    };
 ...
-- 
2.25.0.341.g760bfbb309-goog

