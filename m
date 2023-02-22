Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 562BB69F7EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 16:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbjBVPd0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 10:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbjBVPdX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 10:33:23 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3469838B6A
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 07:33:16 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id i10so248037plr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 07:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGDet0K+1/m01Mue6GMZv5iNZBwdpYi4DRLEmHhKT40=;
        b=e8OzNJHBrUsax0QZ5vhaNQNApDvVLjnLbFaw8uXDvLGnHcdn9gchb+57K1RNfkr+XD
         3qtDxULa5bde2YfYUzyND9T6izfeYbws9/drjyvPyb2xZYkCmvr2MLAsZPkPJwVOLjP3
         inJqdZUf1SbRVuiPucZ3F7ErIHzRCPusMF0sGLJ/bWZCl+hcmR9rHcvOg8+idRRCeli5
         z5rHI/74PQ5bdXQWYUhgueYan02m4X74cJSKh52YobomLJggUEQDq/KwH5L2nCiaQH+J
         PaBLY0iR8sDOh0Iudx7GjVWdWixLfkmk9y3xx5IKK5uuhrN/ETsEniCNrzuQbQBFgxy/
         8HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGDet0K+1/m01Mue6GMZv5iNZBwdpYi4DRLEmHhKT40=;
        b=yO0lXUoZjTh2HrsPNgmyUS0IV1VouDOT3l0PY2eWtaisxZuYF5ORkAaq6UCwQpwwoG
         II9fgKd2MAdmDp5rpKelL0o9/iJrh43lN3gI71w89md0vcELMoDGfZV3ft1GpSD3UWcp
         TwaOVd47kOBwxtEAnj0WHjxA5g9W7Q63J8ruUcWlPg1g6tcIrvQLNXsxLjGi6dzCUhH8
         PNdYWHVfs3s2Hz3NVjAhpu4M1XUa4SEH8jsiyyEnECIdgT+xWIRR4Y+ALLIe3zQvXwNG
         JUl1aVUROP6TOnGE+xpEKmo2Lq0DkiG8xH2HcSz9ER2bEDT6v97H1hP/O1RXnGttXvNi
         YkpA==
X-Gm-Message-State: AO0yUKXJQOhIHWnywn7FCg+zIXXOy6vsd666d7GvlH6wMw/HC6LintOP
        HgAUFqyvmm0YQhxMuBoxIIMA
X-Google-Smtp-Source: AK7set85fOda6NNHVt4rOXQqxDXgbFFt1j3cqkh0/SrhLRDeQeJPSHDWGBhyu2q20Bbo+vf9uURHhA==
X-Received: by 2002:a05:6a20:8e0c:b0:cb:c276:588d with SMTP id y12-20020a056a208e0c00b000cbc276588dmr2906445pzj.22.1677079995590;
        Wed, 22 Feb 2023 07:33:15 -0800 (PST)
Received: from localhost.localdomain ([117.216.123.15])
        by smtp.gmail.com with ESMTPSA id f15-20020aa78b0f000000b005ac419804d3sm5222482pfd.186.2023.02.22.07.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 07:33:15 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
        kw@linux.com, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org
Cc:     konrad.dybcio@linaro.org, bhelgaas@google.com, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 02/11] dt-bindings: PCI: qcom: Add iommu properties
Date:   Wed, 22 Feb 2023 21:02:42 +0530
Message-Id: <20230222153251.254492-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230222153251.254492-1-manivannan.sadhasivam@linaro.org>
References: <20230222153251.254492-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Most of the PCIe controllers require iommu support to function properly.
So let's add them to the binding.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/pci/qcom,pcie.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index a3639920fcbb..f48d0792aa57 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -64,6 +64,11 @@ properties:
 
   dma-coherent: true
 
+  iommus:
+    maxItems: 1
+
+  iommu-map: true
+
   interconnects:
     maxItems: 2
 
-- 
2.25.1

