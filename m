Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4139418F4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 08:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbhI0Gu1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 02:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233095AbhI0Gu0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 02:50:26 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB78C061740
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 23:48:49 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so14609765pjc.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 23:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1isXXJLmhlN1IlR8OI1SSeBiSZeElsmbNCFhrIVQTH0=;
        b=ABTl83oUoeXcPVOvaTSea7gdqrvVZsAjQ6zFnu2vJjGYYcmjkdCPTRo+kYW/xjsshe
         CifgXy8l102EraCs/0x2912tj9Brj13fiRhiMVcCSpMDNHXLe+j4ckTxFpEbgYZPywEH
         DpCR3QJwAF7NXcpL8zYytgv5dr+WLZIsiCHs8DS0CqFRYT4fgXXEtiMSg6WzQ4dtV95l
         HI96+pQNrANq01LnQZ3LcWO3HGbt+pla5Tfz6xOLlDceTiM+gAInSs5J7FRgmE2HJXxk
         vmSYuFCl8+jAWGkshh4/OE6OU7hvH0/Iaej6l2zDy8zHCD+Ps7qoCUHOe3TxZpm9rdOJ
         tnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1isXXJLmhlN1IlR8OI1SSeBiSZeElsmbNCFhrIVQTH0=;
        b=ax3LLRKWrwuzQC+ZbqiLD6usaEkFvdN+epfz2MkdBxPslgoCgqct9DEanTP808+LjJ
         H/3cncul9z/jzwciMQl6ruZzNKbcM2iG02uepYueg+H2X02czEqKczPd6qHlN+BrPLoo
         hxSiL+XPuF6kddVH8aiN+K3GpxHXYVcky14wzaNGOFTXPbrnEanAGaI55bBD03qxbqt2
         sifjPhDylgjjD0DiTQ5o2FMWvw97Tenr0Eh+DZ++svc/FXGCWMBE0Ktj0/xxICwGVCBi
         vTWjg7HepYbLFY/6cg9WajEBKOXNkVxh5TVBLyTAqIf0Qe45OynSn9qtS8ucgIAJMt7m
         wFQw==
X-Gm-Message-State: AOAM532p+cBPHn6MtyNCtj6iWN5xPXQfqWSc3adZkNTRJSHE5M4OHs3h
        4oYxA31Tk9lJOVIWth5SO7aRKw==
X-Google-Smtp-Source: ABdhPJygXoarE081fOIuaHVbPDbueZQSYkdfgpPeEF6QDomDVme6XxmwUOjjKqyHSmw2DMDIszn7NA==
X-Received: by 2002:a17:90b:38cf:: with SMTP id nn15mr18107377pjb.81.1632725329089;
        Sun, 26 Sep 2021 23:48:49 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id o16sm17169910pgv.29.2021.09.26.23.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 23:48:48 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add QCM2290 USB3 PHY
Date:   Mon, 27 Sep 2021 14:48:28 +0800
Message-Id: <20210927064829.5752-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210927064829.5752-1-shawn.guo@linaro.org>
References: <20210927064829.5752-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for USB3 PHY found on Qualcomm QCM2290 SoC.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../devicetree/bindings/phy/qcom,qmp-phy.yaml | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 75be5650a198..4e7371956ed4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -27,6 +27,7 @@ properties:
       - qcom,msm8998-qmp-pcie-phy
       - qcom,msm8998-qmp-ufs-phy
       - qcom,msm8998-qmp-usb3-phy
+      - qcom,qcm2290-qmp-usb3-phy
       - qcom,sc7180-qmp-usb3-phy
       - qcom,sc8180x-qmp-pcie-phy
       - qcom,sc8180x-qmp-ufs-phy
@@ -414,6 +415,32 @@ allOf:
           items:
             - const: phy
             - const: common
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcm2290-qmp-usb3-phy
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Phy config clock.
+            - description: 19.2 MHz ref clk.
+            - description: Phy common block aux clock.
+        clock-names:
+          items:
+            - const: cfg_ahb
+            - const: ref
+            - const: com_aux
+        resets:
+          items:
+            - description: phy_phy reset.
+            - description: reset of phy block.
+        reset-names:
+          items:
+            - const: phy_phy
+            - const: phy
 
 examples:
   - |
-- 
2.17.1

