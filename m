Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE3439F921
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 16:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbhFHObE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 10:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233364AbhFHObB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 10:31:01 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7EFC061795
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 07:29:08 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id u20so7141353qtx.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 07:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ya4sSOjySMHGjVVWLWrWfBjZGU/UNkNaSi2rQLK5WkI=;
        b=1X5vWiICSrpwWJEznutissR6pu/5bj0Ju4L12Omxfb3SP/Za4+dbBmiY5ac1YZbKIK
         ZG13VmDs1K+v5GcUYx9Wwwv2H6/36pMlI7sLQ13lWvQNb9cG4O+rGaWEmLbbXhb6UUxh
         5esOht+eSbhW/L4rTNDyaCRQzfpBW8sDQ6SN4xJOjmkYLM4j3/QgHBS4m24oAVKNAiAC
         czFQVsq/j33+Q72tzzg3NZaPvn3E0ncGwKDHzqNRVU1K+swCemhYaJeSINjAwyAyLxp+
         Cw7O0VRMEYe77xyeurCssl/ojJtN0mIqs6ld3PD6xrEGp44zgFGp7vK4Ic4gsyJN91Nh
         3yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ya4sSOjySMHGjVVWLWrWfBjZGU/UNkNaSi2rQLK5WkI=;
        b=DS8BD/J5r4pFZpMhtlBg7Pgkvq+/69QoWkgOFppuq+HH9RZxTTr4TEFPHpcGauPUUt
         cp/wnox2EdBP3Jxmof4OLMW4lwBLNWLUrwwVdYCPbuP6iLgHNC38ebBIzi7UqeYRUphM
         gWZ4c8C4QcrRJn0fLFh66dzyo4At9FkUTPpUVyiCyjsrnok+72DFKX+M6VEJIcbCgmSE
         k2GPAf7hjxthPGBtOQx0N9npEzmpU7ibvlAGgdfEXWldNgzj08h5Nr4fuGUccyBeUDmD
         iPo/087HjHAAthD9vis/L6zIpMq92jl8uKWs3f01kjtoo2rifC7qUZqqi97Lww9ivbTv
         VZKQ==
X-Gm-Message-State: AOAM530lWwZNi3zXI87TF8bAUSP86UzFxzty1CbS2RcBtdxXHgSkICMI
        SuLhTCbnsj131Gb1ZGgQC3Lp04lwmpFpczVJvaI=
X-Google-Smtp-Source: ABdhPJwXYMw9s+35IctDKhPg2MZvfzZqU2XLhwmUCtvJaU+eoTE/zoB5Ljo1Tzq6Z54HDxylEPn7EQ==
X-Received: by 2002:a05:622a:154:: with SMTP id v20mr21676270qtw.91.1623162547243;
        Tue, 08 Jun 2021 07:29:07 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id v6sm11838748qkv.54.2021.06.08.07.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:29:06 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/2] dt-bindings: clock: add QCOM SM8350 display clock bindings
Date:   Tue,  8 Jun 2021 10:27:07 -0400
Message-Id: <20210608142707.19637-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608142707.19637-1-jonathan@marek.ca>
References: <20210608142707.19637-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
bindings. Update the documentation with the new compatible.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml       | 6 ++++--
 include/dt-bindings/clock/qcom,dispcc-sm8350.h              | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 0cdf53f41f84..8f414642445e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -4,24 +4,26 @@
 $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250
+title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250/SM8350
 
 maintainers:
   - Jonathan Marek <jonathan@marek.ca>
 
 description: |
   Qualcomm display clock control module which supports the clocks, resets and
-  power domains on SM8150 and SM8250.
+  power domains on SM8150/SM8250/SM8350.
 
   See also:
     dt-bindings/clock/qcom,dispcc-sm8150.h
     dt-bindings/clock/qcom,dispcc-sm8250.h
+    dt-bindings/clock/qcom,dispcc-sm8350.h
 
 properties:
   compatible:
     enum:
       - qcom,sm8150-dispcc
       - qcom,sm8250-dispcc
+      - qcom,sm8350-dispcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8350.h b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
new file mode 120000
index 000000000000..0312b4544acb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
@@ -0,0 +1 @@
+qcom,dispcc-sm8250.h
\ No newline at end of file
-- 
2.26.1

