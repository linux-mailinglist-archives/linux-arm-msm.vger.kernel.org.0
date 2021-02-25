Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E88325151
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 15:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbhBYOKm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 09:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233067AbhBYOKd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 09:10:33 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4932C06178B
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 06:09:20 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id t26so3857530pgv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 06:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+/fZuaWYVZIMIkTfAOgxpNFqBTcFkZg8zMovp/of1IE=;
        b=QQq9Hyp6dQvfLQP4R5h1797glkzOuUgcY0k++QNnerFfLYh8aDNnUmh6CJDyZpKB7J
         wTIUaAnpolneUPzLvhoOY0e1qkVec2T1vTEf/iYQbSL5QUPB4rq747O500T6shcgcG7W
         ny4VVf3fnupgoSCjCksbtABCyhQ5uu6fYFpj0FCklS+ahdoV1PknvSzpvG49D7GJg+Xt
         iDvC4NIQxLG5CxKcdx8jHxar/Y98e1nDeGBDWfouLejDbCq/RgCkiK7Sof/aOem9cRVT
         bah8x4QnwbN2ulCCBygGmOUMpMVw0kSyrK0zruK/56IdTO/97MchfA0leEwnEjtrL6J6
         nlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+/fZuaWYVZIMIkTfAOgxpNFqBTcFkZg8zMovp/of1IE=;
        b=XjSwdgr6rn9BoywMSXdKsxI055T8aTZeAtM9YB37yji1nPGk+pfJs2K8MY3ZeSXsFy
         wZyB/WNfWCUy+lSPRr7e3A/z4M7zqYkDx5MbZlbYdhF6o4tlMqaKix4f5yNFFKezuz9C
         eBWyldYzbGh53Zh0v0ZTTCYRHRhVlqsmtmS7RlbpnwXvX46mFoUEndEY+AFBP+0UqHej
         YEGt6BIuagvLhytv2fh8R3BKO01xjRuWkSuqPceIqcJKky8BpPr2UGME5XAHclsydRH6
         sRbvBaPG00ad2jHONB/mR+TcojFJe11TztuNH4gXW8RBV1+BKB07bj1rqT5JZsDsdJQu
         ARXQ==
X-Gm-Message-State: AOAM531BjfUi1iGMDFZLeOsNFRiPjpVBC64EaO+hke5t//dXVP0kxS2V
        7Yy1Iz59JSDkdKczDTNg02Tr
X-Google-Smtp-Source: ABdhPJwVFyz+crFLDkYG/XHLDkUo66t4VXaT6pkICGmOeNSZ9uGzMSs/LPo3hrAylx2FuDPNOpMlVg==
X-Received: by 2002:a63:a512:: with SMTP id n18mr3051853pgf.329.1614262160060;
        Thu, 25 Feb 2021 06:09:20 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.45])
        by smtp.gmail.com with ESMTPSA id f3sm6228918pfe.25.2021.02.25.06.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 06:09:19 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 2/3] dt-bindings: mtd: Add a property to declare secure regions in NAND chips
Date:   Thu, 25 Feb 2021 19:38:41 +0530
Message-Id: <20210225140842.66927-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210225140842.66927-1-manivannan.sadhasivam@linaro.org>
References: <20210225140842.66927-1-manivannan.sadhasivam@linaro.org>
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
drivers can skip touching them.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index d0e422f4b3e0..acc7dfd6ef28 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -143,6 +143,13 @@ patternProperties:
           Ready/Busy pins. Active state refers to the NAND ready state and
           should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
 
+      secure-regions:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Regions in the NAND chip which are protected using a secure element
+          like Trustzone. This property contains the start address and size of
+          the secure regions present.
+
     required:
       - reg
 
-- 
2.25.1

