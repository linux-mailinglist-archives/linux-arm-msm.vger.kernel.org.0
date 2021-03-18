Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323BE3405CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 13:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbhCRMoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 08:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbhCRMoG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 08:44:06 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E71C061763
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 05:44:05 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id h20so1245529plr.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Mar 2021 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cGzmTTjWe1AbEuSBzNDXhCdxGNlI9I7Ym5rhNfsOEPE=;
        b=YC6h+Stopa6z4/mq+u/ZKuzl0bQVUdulYA/hh1D1RU0UCZ49zW6TI1tDmrWJyrxjsZ
         9+29bYa5hJW16jRKG8vqcJ6i3r78Be26LUrc7lP54b+z4rE0q2K6m03X+ptLa8hp7qMl
         PiHQln2RVCE4T8F+USS0E4npCJsvUczGecOPSjXYy2Rjq1iy7/n1gXVsrlknpFE9TUvE
         lEzpZtiBNO8JhjbVow7AKisJI8Hmcvqx7shtmV5sm0+/P7mXSrAykVtKCPNvy5D5kk6L
         iZLn4mmd2WFfWjcLH0/86A3m9tbErGOC4s2TL9/gTioudWfaN9AqT6wDQh5Y6VXgvtAC
         iVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cGzmTTjWe1AbEuSBzNDXhCdxGNlI9I7Ym5rhNfsOEPE=;
        b=S7woCbBg0UVdFY5O7Rw5BztoKl76pQT2CtlRKLi1oY/vtMlQm+HPyEOpRaEcI88SWX
         a9Cr5iRdUNlSba8P6aX8F97Y5k1qK2u8i8gVEQ/NEaqK0BNgo1mkvYbnZnNpNmeEcEQ+
         5dan+hOUPqTjgveo5XFw9N7KWeO5RpeTCx6cTs3HOg/KSAINZUslYOsQfwDaUNYliBVj
         0iGnCPrmJ/7qw2SFq5le5CaeI9y9XYUV4wCV4EzV2z256Dp9h+GjfroHqMoJTbq0xBDT
         zRA0rwIZ48fnU3Mbxkes1h9R7eOcOOtgW+E83Uo6fAoQj/npafM0zVleo3Y2kEz2Od/H
         LtZA==
X-Gm-Message-State: AOAM533gqGBv1wqRLjfDz50HnMhl3uaUjZNjL/dKdau1O7fXzpYpkhxr
        zmyBNXn+lZdzN9FTHi6rOY49
X-Google-Smtp-Source: ABdhPJyZmBBHjfYzZLXR3tLchvSFoaX5tKaC+xbOnAaz9tQnnDGB37XBmQLX8mkxaOkIvUg6+00nXg==
X-Received: by 2002:a17:903:4112:b029:e5:f79d:3eb1 with SMTP id r18-20020a1709034112b02900e5f79d3eb1mr9293334pld.48.1616071445438;
        Thu, 18 Mar 2021 05:44:05 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6d00:4737:af26:182c:a57e:1d9e])
        by smtp.gmail.com with ESMTPSA id w84sm2530694pfc.142.2021.03.18.05.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 05:44:04 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 2/3] dt-bindings: mtd: Add a property to declare secure regions in NAND chips
Date:   Thu, 18 Mar 2021 18:13:41 +0530
Message-Id: <20210318124342.32745-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318124342.32745-1-manivannan.sadhasivam@linaro.org>
References: <20210318124342.32745-1-manivannan.sadhasivam@linaro.org>
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

