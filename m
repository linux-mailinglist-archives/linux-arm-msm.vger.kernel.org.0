Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095723249B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 05:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234123AbhBYENF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 23:13:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234498AbhBYENB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 23:13:01 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75DCC06178B
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 20:11:50 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id i14so1090553pjz.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 20:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6hU6WGdCR9365lMcGYUik+Qyi/ZAYDHu+MFoj3y6wt4=;
        b=PLak/fmjN7fnFTz8fRzhp1I+hcyR24BNlkBt5PJNVU8drkHY1J+dcgL9k1ye8PzB4P
         XgniJRQ2nOYiqNNyhmVcWaxrxhf8nKffy5ArsDIKieuXGcs7Pt+28n/MDmCQVcRdtvCX
         U4OcK9AbfHpeTyG/tJio6DBDkX64Me6iyH2IWf6mzidlyUiVSec5eZ4N/iHNnpwbmyVn
         SUD6Xx40S9tRXZQ37zRs+OwPIDxkyYhtAblnvXqDUWdCnJYmzK4y1XwAZ7BZ4ybWaXXF
         8GDQNQEe427tSGC7c8qUTdeKx4+k/mok2MRa2gO3bQNoHfY5HCjz8kvmYF1/giAjeoyr
         V64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6hU6WGdCR9365lMcGYUik+Qyi/ZAYDHu+MFoj3y6wt4=;
        b=e9wFlnHv8Rhr82NJW18mm4bOgNQyCWUKTLXQWgTagzs2eyWxgzbR96YZ1mz72vO+kA
         gZFRAibovbAcBV+gvp6JN6pu1by3NR9N25wlNk149Qr6aVIyPpFrfSINkC3h2Xt0+sn5
         9Gm3JOzGQJLtZSrH8ungzrjE7cvVjMX45+8GJbI8GXF2sG9UQtNPeOjb5Teq/YFPC9pp
         jc/8qVBH1aIaE65FcY0KwNIZZlG6zHYaJf2+nzsLeF+hT6dpGGIZGX6XV3qpggZq9DOn
         DHgunxf2WIHzRLfCWwiXSNwP6kna3cDNZoC8CZH/e7H/DJyGo33iF/Q4aQq6YKj6Y/Pg
         xE1g==
X-Gm-Message-State: AOAM530KjbJY+dsddDQNaqWhjxSpqJCWP7caNNlzyiWhsVFqp9nFUEwT
        DJQqeee6g2ufe5/58B6Dgg8d
X-Google-Smtp-Source: ABdhPJzuwcRoiNHqmUzL20tCRghQTkRE9CDlSMQRUYr9GReiIvlfg/rCEryLOScv6WOd2u3ydXxAZg==
X-Received: by 2002:a17:90a:cc18:: with SMTP id b24mr1304343pju.214.1614226310108;
        Wed, 24 Feb 2021 20:11:50 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.45])
        by smtp.gmail.com with ESMTPSA id c12sm4155494pjq.48.2021.02.24.20.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 20:11:49 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: mtd: Add a property to declare secure regions in NAND chips
Date:   Thu, 25 Feb 2021 09:41:28 +0530
Message-Id: <20210225041129.58576-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210225041129.58576-1-manivannan.sadhasivam@linaro.org>
References: <20210225041129.58576-1-manivannan.sadhasivam@linaro.org>
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
index d0e422f4b3e0..4a528468b90f 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -143,6 +143,13 @@ patternProperties:
           Ready/Busy pins. Active state refers to the NAND ready state and
           should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
 
+      nand-secure-regions:
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

