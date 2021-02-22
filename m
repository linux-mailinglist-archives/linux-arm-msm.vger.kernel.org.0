Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4823215B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Feb 2021 13:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhBVMEe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Feb 2021 07:04:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhBVMEc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Feb 2021 07:04:32 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407E6C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 04:03:22 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id ba1so7612460plb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 04:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iOqS3cmQFNPFE5oe5VQB+Nk7w3LubjtRbocEu7F5iiI=;
        b=vFxVbXKUqZ/PhEhh0tcVrVjqFnWAQDNVgcn43MpfUe4vuLQ1G8UaFfLvQIHe5/qGQw
         MQz/G0mcLEqEa33/kZXqP2CyYxjWxPjqwHOhf3fQrN/OvnTT83e1tdLUPXZbLjvKN1nt
         vNHbKLAnUXCdqyMeg72hnk/pS5kpbs949/bNJbXzDcB9U8P67S45nFj0r3dip4n5q8J4
         ExibsB4a1fiXD0F5IecD2lHsQFre4zikn3FD592AottfLygfpk5frggIz8yMgfK2TKYE
         5/t1caj+HICVv17ZEJlMYg03wpmWYNyd4oL8mR0CBr54PWV8GnvPlEp+cy0MCR5bZl72
         AQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iOqS3cmQFNPFE5oe5VQB+Nk7w3LubjtRbocEu7F5iiI=;
        b=lt4marpCwc1EqUoWrbtCvGnh0ZxzjZOCbKs0cWvAAt7W7LMJZN8GizjKdHJyIUjltE
         tBUF/Dhfi8rB8SO6GmSzd18RcOVfx6K9sa2FHD5o/ZJ7MeqIV+iJt4x5JlbD7cSDT1Pq
         oh98F/E70+/leN11HIhQEhkLlscJFxiHBiv4ZdROH3wIOOjH+r+Hdgd7qcWLQBGCK+dE
         to/Cn0kdQIswN+c7zZNzrxmbjcGd52rrlBMLZ16MfErhXlp8DqsWaUMYFsVsxuT22SOA
         BL1/Da3/BCHGwe9p1n54Z6TS/M+1t853jksr/E/q4NqZ15i6bzdla0MonGCL+bNwMZ3Z
         y8ug==
X-Gm-Message-State: AOAM530WNZdZa5KvsLrzL8YNRuPdVkol+nqX6XgQQFLfBndaED5+AN77
        KKmlSmu/Ac2Aa1IaTm1GciXN
X-Google-Smtp-Source: ABdhPJwDxNavOfUSgL+tVcok+qfNwASekjEXEmDMFINM10uJIvTfV9yZKboK8YK7erN+uRsIa3jkVw==
X-Received: by 2002:a17:90a:3d0d:: with SMTP id h13mr23313246pjc.224.1613995401804;
        Mon, 22 Feb 2021 04:03:21 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6215:cc7b:cb8f:abf4:d1c9:3864])
        by smtp.gmail.com with ESMTPSA id g17sm17017221pfh.14.2021.02.22.04.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 04:03:21 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/3] dt-bindings: mtd: Add a property to declare secure regions in Qcom NANDc
Date:   Mon, 22 Feb 2021 17:32:58 +0530
Message-Id: <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
References: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On a typical end product, a vendor may choose to secure some regions in
the NAND memory which are supposed to stay intact between FW upgrades.
The access to those regions will be blocked by a secure element like
Trustzone. So the normal world software like Linux kernel should not
touch these regions (including reading).

So let's add a property for declaring such secure regions so that the
driver can skip touching them.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
index 84ad7ff30121..7500e20da9c1 100644
--- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -48,6 +48,13 @@ patternProperties:
         enum:
           - 512
 
+      qcom,secure-regions:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Regions in the NAND memory which are protected using a secure element
+          like Trustzone. This property contains the start address and size of
+          the secure regions present (optional).
+
 allOf:
   - $ref: "nand-controller.yaml#"
 
-- 
2.25.1

