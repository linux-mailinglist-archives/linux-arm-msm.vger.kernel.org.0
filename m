Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88E63519D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236582AbhDAR4h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235957AbhDARxf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:53:35 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 624D0C02258E
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 08:20:16 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id c17so1700668pfn.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 08:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I0ki0lC8MA7ZU5srSBRCAeZerDP7DRSW7mDv/jEyzhw=;
        b=qQ0v8/k4NrH6jKqHmdH5VXybvg1m4144BVeYDTvfC96mDKCt11Vs81OC9ACNp+Zhp4
         A5BoQrzj8lb2eWR43CMRD+1En5lcgIjRxX2LZan9wjifgdEP6YOd0eymSZskboVwCAnU
         WABpIPUI8bJsBNhKiDsOESSHZXui8Ye72eq0WPv/fZc1CeXA09dhGjV9r7FBkveB0zbu
         JTLDqxpnrdkuSa/+o5dTKcqYRN8G7UhDxWDSJtjm6hwKiZivqC/5+EsT1nkoFPjBdf/O
         uSH37NVre7DHl6MXpEl1f3AUJ0gZGSRSehux30GBHeXBAXjDVMRLaE9FpgQKlW/2yacY
         KkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I0ki0lC8MA7ZU5srSBRCAeZerDP7DRSW7mDv/jEyzhw=;
        b=HmghgccPHVHaizQdriSUYKCde2lOwETHcPLbRNLX9kghzAPghkroCQoG96Rn7cW+JJ
         Nhki5cY0vDnFDq5aouHpSUuyBJkATiKcc4XLTlCDfF82DOeQoPw45XoScmRktsMJO8sW
         q3S6frZ+XFzF1bCEsJiMAyj86ENQYrt3Fhm1IFcrQ0CkNdabSznpmkHnNPGyhqVyqc5/
         BsBF9rwE7cO4jlSDQgzhjYwebQd0O4kvr6KBLb894586jU4PTqdYFzwmSMN/KR27Ouuf
         aJ4xPXVL01cZ5NL/EHO+Qysf09jtKdAxUQZRSs8NGMQHg9hAp1tYKHpOlb1FFH+IPPkw
         +F1A==
X-Gm-Message-State: AOAM532FiignVgZ7In9QZuf5Iz1Cud0A3sqge1crTs2rXgHVX2kmx1Kv
        MShiHYJt5fLKrAq6U7LeI9bO
X-Google-Smtp-Source: ABdhPJzwbbKb4PxWcqooRWmHcWkE3XNAzSdnNl7CBX4C1OfeHXT92d/xTOsH+fB0qhD9v7jbEPwu+g==
X-Received: by 2002:a63:be0f:: with SMTP id l15mr3536418pgf.39.1617290415914;
        Thu, 01 Apr 2021 08:20:15 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.138])
        by smtp.gmail.com with ESMTPSA id l22sm6500919pjl.14.2021.04.01.08.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:20:15 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v10 2/4] dt-bindings: mtd: Add a property to declare secure regions in NAND chips
Date:   Thu,  1 Apr 2021 20:49:53 +0530
Message-Id: <20210401151955.143817-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401151955.143817-1-manivannan.sadhasivam@linaro.org>
References: <20210401151955.143817-1-manivannan.sadhasivam@linaro.org>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index d0e422f4b3e0..678b39952502 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -143,6 +143,13 @@ patternProperties:
           Ready/Busy pins. Active state refers to the NAND ready state and
           should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
 
+      secure-regions:
+        $ref: /schemas/types.yaml#/definitions/uint64-matrix
+        description:
+          Regions in the NAND chip which are protected using a secure element
+          like Trustzone. This property contains the start address and size of
+          the secure regions present.
+
     required:
       - reg
 
-- 
2.25.1

