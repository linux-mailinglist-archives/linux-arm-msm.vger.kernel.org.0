Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C06E2F117E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 12:31:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729631AbhAKLbF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 06:31:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728318AbhAKLbF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 06:31:05 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36314C06179F
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 03:30:25 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id c13so8077675pfi.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jan 2021 03:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gNG6N/pV6VIa5E8JKb3QHyInio2tEUXc13R/HbhzYZQ=;
        b=ioxdDAE0x/NC4PB0WJwZcjE8v/bbxIKJyXJJrkOW/Q9KOyJs19uQgWltV0udrjAo9a
         Ukwpzy8PCqUo8gPiCSRfW0NIIfuf+t8Lvoz/sWwemH7+MybzUxFrnNb48v4ehHbUlpNu
         ViryAebl2i2WKDXTowFUxrizJu3pFo7vGEpVTK8tcSt/A10ps7GTt+83TRLNdygwW5K1
         oshXYhsnw0ge8fnf7QaXa0JCXUMO3jfd8XwvI3A4U1drhHqc5QIk52btS6cxA7LwUlFq
         MfeIQycEQM5skLQGaR4+64i4vrKJPaLSDrvWH5r4QD3sAoFju+87BgAWeXTEixbS3zgs
         fEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gNG6N/pV6VIa5E8JKb3QHyInio2tEUXc13R/HbhzYZQ=;
        b=J2LA4f+6XuRysPT/Kn3eZ98JIImvhXJ4IZca/nIioe/+Lia6otVfK5giSgWsB2RY6T
         GyvefYWRI5yG30eUEAYXsnccf1UXB+FWc3hb1g/FR5OE4x/ab2nKwqsOn/1a9zMgU4p1
         VNr5FWuZc6loxan/TLIVW+TUQzCfimJhFKUWgszwhU5E516Jxt8XfFXJSal9+QJFWuFp
         gc1HwOrgzmpXsZxsFh5QQILd6jk7yQG09AF7WIlyef10IPyZjJI0Q9GmHDFfoA/U+5hv
         LyZEVDT2lBKsil4tRJxoqmwvYkt2hufSJg1gDGbiNgcBFoLyZvvQ78PMkfl8enAX8Vsx
         /Tjw==
X-Gm-Message-State: AOAM531STwSNDVj0dlE4ForNzSuMLIM4f7pjI71JKvku7JmLXaUpWknZ
        vlm4l9yf2KYgTeJ8dy8UUZ55
X-Google-Smtp-Source: ABdhPJxC/iJws3KF9Bo7B7zH5CRS4kYElMacxpppqCNIyPXySZ7haa+e2NcqkTfk0gOJNDGEPUJOBQ==
X-Received: by 2002:a62:7857:0:b029:19d:fe6a:3069 with SMTP id t84-20020a6278570000b029019dfe6a3069mr19052046pfc.3.1610364624745;
        Mon, 11 Jan 2021 03:30:24 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id x20sm18803134pfc.3.2021.01.11.03.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 03:30:23 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, vkoul@kernel.org, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,qmp: Add SDX55 USB PHY binding
Date:   Mon, 11 Jan 2021 17:00:09 +0530
Message-Id: <20210111113010.32056-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111113010.32056-1-manivannan.sadhasivam@linaro.org>
References: <20210111113010.32056-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree YAML binding for Qualcomm QMP Super Speed (SS) PHY found
in SDX55.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/phy/qcom,qmp-phy.yaml | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index ec05db374645..0f00d82461fd 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - qcom,sm8250-qmp-gen3x1-pcie-phy
       - qcom,sm8250-qmp-gen3x2-pcie-phy
       - qcom,sm8250-qmp-modem-pcie-phy
+      - qcom,sdx55-qmp-usb3-uni-phy
 
   reg:
     items:
@@ -131,6 +132,32 @@ allOf:
           items:
             - const: phy
             - const: common
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdx55-qmp-usb3-uni-phy
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Phy aux clock.
+            - description: Phy config clock.
+            - description: 19.2 MHz ref clk.
+        clock-names:
+          items:
+            - const: aux
+            - const: cfg_ahb
+            - const: ref
+        resets:
+          items:
+            - description: reset of phy block.
+            - description: phy common block reset.
+        reset-names:
+          items:
+            - const: phy
+            - const: common
   - if:
       properties:
         compatible:
-- 
2.25.1

