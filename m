Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD5DF42BE27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 12:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhJMK7H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 06:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbhJMK6i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 06:58:38 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5248FC061773
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 03:56:24 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id l6so1522921plh.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 03:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z2sBrvxA3Mihi2vqUGXbJq+xZIOpCjvkxgHKQyKWO9M=;
        b=dLxvEsOxnAJ/yiZvhLJAWdzUsjZx4F/hO8SG55sjqC0uoMeR5cKq8CRX6rctKV7T67
         Jnys6dAYsj5lAOLQp7uBRdoyWZsJvcC9PIimn/onluhCZRb2JuuEotwod62vfk2svJN0
         FYD3mJgXEgaXBT/qqliSdkQDC73Kr5MPVt02l+0OE1aVwSdKU80Nrd9auYlbcoMlWXPg
         dW+FpGdBF+SjX9kHvmUMPAfpOKCkKP41ROJmArpxZ/8LzolH0WeLVXrdQXVQ50Mhx311
         fCDBbsAvrNH63RX3hSSaPtxGTzzdqYWlskRYVOe+Pe3rxCTPoONuN/u0ax2AgjASAjCG
         5z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z2sBrvxA3Mihi2vqUGXbJq+xZIOpCjvkxgHKQyKWO9M=;
        b=QJN2PmLqq6Rfoi0xbT+lAEIVnQx3gbWu1nZHc+dNY7P3UzaYqca7p26skfDzVBRAKf
         put+p5CK59Df8rI90Q9Mxazyw065ojowe6ozg2lYr7lALtD6nfDvTksx4vtPpMJgfPls
         LeIkw5LMOv/gnarqLYaQ6zWklXWfZLEn2+hlMMDGRn5ZicJQ5DM2kuY1eJEf3u8vqZaU
         GGtTaz4PnwT9OZNeYVTLD60D/tnKj5zx6PYcNdf6uNYYq5wNLn4ZPzPMgM8iU5bqVdEM
         9/F4ZRzKBEzQaMqo/E1LhOdtMq8z1WHVeLqKBMqX9kehaYNEfxYZjoNlPgFK63oLhFN6
         84gQ==
X-Gm-Message-State: AOAM533v1fc1acNvTN0dFOfybTXL/MkGQCE5E2spNB/mXmYhOJv5HFuk
        DPzDxfWLhOgvPuqgVajW6gym0jT1CPgKEw==
X-Google-Smtp-Source: ABdhPJzS5MsQJ5G6pY/x5ilWe9j0Ca4cdetOxPcEMbiTwTVvfiYrezOs7OgcrbQRhYkzYJDvZNyTdw==
X-Received: by 2002:a17:90b:4d8e:: with SMTP id oj14mr12663660pjb.160.1634122583633;
        Wed, 13 Oct 2021 03:56:23 -0700 (PDT)
Received: from localhost.name ([122.161.48.68])
        by smtp.gmail.com with ESMTPSA id b13sm6155351pjl.15.2021.10.13.03.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 03:56:23 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 06/20] dt-bindings: qcom-bam: Add 'iommus' to optional properties
Date:   Wed, 13 Oct 2021 16:25:27 +0530
Message-Id: <20211013105541.68045-7-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add 'optional' property - 'iommus' to the
device-tree binding documentation for qcom-bam DMA IP.

This property describes the phandle(s) to apps_smmu node
with sid mask.

Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/dma/qcom_bam_dma.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
index 602e68df971f..7c046a281fcd 100644
--- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
@@ -53,6 +53,12 @@ properties:
   interconnect-names:
     const: memory
 
+  iommus:
+    minItems: 1
+    maxItems: 8
+    description: |
+      phandle(s) to apps_smmu node with sid mask.
+
   qcom,ee:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -94,4 +100,8 @@ examples:
         clock-names = "bam_clk";
         #dma-cells = <1>;
         qcom,ee = <0>;
+        iommus = <&apps_smmu 0x584 0x0011>,
+                 <&apps_smmu 0x586 0x0011>,
+                 <&apps_smmu 0x594 0x0011>,
+                 <&apps_smmu 0x596 0x0011>;
     };
-- 
2.31.1

