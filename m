Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A4B372578
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 07:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbhEDF3z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 May 2021 01:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhEDF3y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 May 2021 01:29:54 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B521C061761
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 22:29:00 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id i13so6313653pfu.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 22:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=X/MGql9b3iDHbEGk1fEF6JKWQobHRfGqiTtP2HlirKU=;
        b=iS9nCRP7N9X6bE0kTfKXOusCAuIrnl8h6+WTgpHG4cgzI3sKDwyO86ZcNy0PBqRRlm
         WHuYmTz71Bh4ORHanWMW7xywzeUOSI5dYYR7e+eNev09g47nJN3/P6/dF1ONqNLXLmaT
         w1p1G4afuDqhq46T45V6isPZyTJBz/Wg6b0PHuH5KOmIPAwZ2kYRMbcFUpODesq4kyLi
         a/RTcLtmwjEjp92s6ij9UqXVFMHNKgkSuw88u65bssRRLx7Q87Z/tcYbyCeET25aF1T5
         b0FZnS72x/TumwhihxZX8uDeaFYfI5P+UaE8WD952Pj+wIyeeeFZsJMX4RSoAhu8GLBy
         Qb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=X/MGql9b3iDHbEGk1fEF6JKWQobHRfGqiTtP2HlirKU=;
        b=BGe093XKhHK7UssWvmD1RBxKFjW5jC+Gbt1dVmJ3BAPZGz7JV/bt53PQT6rhUaHkLx
         TU6SzXkEgnSAF0Df6sNgqMHBEL00oEQwaIJ2zxUqP9I/nMzGiDJ1KmhiWKUPZkUZcjdK
         60knf1DAQ71bTr8hfp2N+8YlJk4U0SF3AdS+9nyzjivblwHJs9//jIOyY2Iv5ts94Oq8
         dOGmvvF0f/hgIU+yh0WXdx0Uu4ew88n1QRr1KVi3xmQxmp9wtASNY88B7N01ZPgB8jJr
         FwOJteBKlsobPGe9WLy8cz9Cby18yv49zeUFjIu2ipxB9v4R3NVf786X/s74p3+4wThg
         mSrg==
X-Gm-Message-State: AOAM533D65Vs8faVID/HX2kWkpm22d5kuGKVVhRmA2+bSpWY+C4Cpsq0
        Pf07Md8I1WcqGD5GdbjFRkt1dQ==
X-Google-Smtp-Source: ABdhPJywiTibTwj7xJxYmWX80ZWetjXfmFhE3ID2gOO9/TOdnUtWWo5TilrYykHq1s/yrBXP6Sm5LQ==
X-Received: by 2002:a63:1a5e:: with SMTP id a30mr21988129pgm.156.1620106139731;
        Mon, 03 May 2021 22:28:59 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 145sm5933229pfv.196.2021.05.03.22.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 22:28:59 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/5] dt-bindings: clock: update qcom,a53pll bindings for MSM8939 support
Date:   Tue,  4 May 2021 13:28:41 +0800
Message-Id: <20210504052844.21096-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504052844.21096-1-shawn.guo@linaro.org>
References: <20210504052844.21096-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update qcom,a53pll bindings for MSM8939 support:

 - Add optional clock-output-names property.
 - Add MSM8939 specific compatibles.
 - Add MSM8939 examples.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../bindings/clock/qcom,a53pll.yaml           | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index db3d0ea6bc7a..7a410a76be2f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -18,6 +18,9 @@ properties:
     enum:
       - qcom,ipq6018-a53pll
       - qcom,msm8916-a53pll
+      - qcom,msm8939-a53pll-c0
+      - qcom,msm8939-a53pll-c1
+      - qcom,msm8939-a53pll-cci
 
   reg:
     maxItems: 1
@@ -33,6 +36,9 @@ properties:
     items:
       - const: xo
 
+  clock-output-names:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -57,3 +63,31 @@ examples:
         clocks = <&xo>;
         clock-names = "xo";
     };
+  #Example 3 - A53 PLLs found on MSM8939 devices
+  - |
+    a53pll_c1: clock-controller@b016000 {
+        compatible = "qcom,msm8939-a53pll-c1";
+        reg = <0xb016000 0x40>;
+        #clock-cells = <0>;
+        clocks = <&xo_board>;
+        clock-names = "xo";
+        clock-output-names = "a53pll_c1";
+    };
+
+    a53pll_c0: clock-controller@b116000 {
+        compatible = "qcom,msm8939-a53pll-c0";
+        reg = <0xb116000 0x40>;
+        #clock-cells = <0>;
+        clocks = <&xo_board>;
+        clock-names = "xo";
+        clock-output-names = "a53pll_c0";
+    };
+
+    a53pll_cci: clock-controller@b1d0000 {
+        compatible = "qcom,msm8939-a53pll-cci";
+        reg = <0xb1d0000 0x40>;
+        #clock-cells = <0>;
+        clocks = <&xo_board>;
+        clock-names = "xo";
+        clock-output-names = "a53pll_cci";
+    };
-- 
2.17.1

