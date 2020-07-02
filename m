Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D8A212149
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 12:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbgGBKab (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 06:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728552AbgGBKaT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 06:30:19 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93943C08C5E1
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 03:30:18 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f18so19460959wrs.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 03:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LlGrsZv5MDXCoixnPWrg/mlv9SQt5SL1loevVSN/VHc=;
        b=KeFi1ABsxr3fl8GMR0/3qDI8qj0sYAqgYksocmCHaogDsB9OQ3G5HpO6Y6CBVUElHV
         PvUS3X88SRGYnJImNTB84cxpPTk7lVw9xAogix8X8LJRF8vymzAo+R4PdDRQcyUspUfH
         WAbhIsS2RcJmQxrnlTbxPcuf1DH88gm3VBZfM6Alq0BSEDO4ZF5QbQxI2d7YOu1iw/lb
         4tP4BwAHtDWiQfZU/4tcUT3UbOJ1AuWEsYRORfi0MWP79GUWDvgiBrFx7Qfy0Nt1puyb
         pNV/n9QLoVLRnSFw4AKwnxG+ByqeBDny3S/7QB8o7vPb2VI1az0o+DFpaD1vabdZV6uE
         20Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LlGrsZv5MDXCoixnPWrg/mlv9SQt5SL1loevVSN/VHc=;
        b=F8fpnIbrmS6umJUILDhNgznNKZFEuxxRIn2xBGMiItczbBr91sSZlwqgSoUSBM2xSR
         C+8Vo2F5MIAO8zeYDUnLY6yAc/1tes5NfAgyweQ4QyXeDrVuUVf1j6iyaMg9D7A46O10
         XLeDC1ksJRJxTfeSeKkd4fPIwLo7Pf+1AXatYJ85MtJv+yDj/yDBR6wizyD539w2volP
         QBGeIqqP66I3H56b6OfAsZn7Ey+o4vkgRA9ZGqJCK6gF5Z3dDKW9iV2e6feYcZpk05sX
         SqY8c3lPv/LT3Q4Ngi4QQorWO9Xq4Ywgvzk1LGtuIWIU1M1XKVU3ODc2d9d24PF51ekn
         MDqw==
X-Gm-Message-State: AOAM530mytnX5hQpTXlVeyYWpvzJOcY7XfOYmRab+EyFv0yELe8oHoBS
        1lXV1dWbes1fUE+wkp3pIkTImg==
X-Google-Smtp-Source: ABdhPJzrKkA5IL6AI6zOIP68F3NzFvD0431eMMCeA/kAyZb4PVbZ8/a84PbeXlReLLXV8E4fU5mjaQ==
X-Received: by 2002:a5d:60c7:: with SMTP id x7mr28770641wrt.138.1593685817345;
        Thu, 02 Jul 2020 03:30:17 -0700 (PDT)
Received: from localhost.localdomain (dh207-99-59.xnet.hr. [88.207.99.59])
        by smtp.googlemail.com with ESMTPSA id 68sm10406912wmz.40.2020.07.02.03.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 03:30:16 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [net-next,PATCH 4/4] dt-bindings: mdio-ipq4019: add clock support
Date:   Thu,  2 Jul 2020 12:30:01 +0200
Message-Id: <20200702103001.233961-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200702103001.233961-1-robert.marko@sartura.hr>
References: <20200702103001.233961-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds the necessary bindings for SoC-s that have a separate MDIO clock.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../devicetree/bindings/net/qcom,ipq4019-mdio.yaml    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
index 13555a89975f..06b4eedb4370 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
@@ -25,6 +25,17 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: mdio_ahb
+    maxItems: 1
+
+  clock-frequency:
+    default: 100000000
+
 required:
   - compatible
   - reg
-- 
2.26.2

