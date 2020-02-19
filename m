Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1A01651A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 22:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbgBSVdQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 16:33:16 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:49136 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727589AbgBSVdP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 16:33:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582147995; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ut8jzi9vRb4lppctqPUVYJg9Q2+ACOmilLmkDbNVngA=; b=cVd5LpRYUTCybvfQTWuAeBUDZ0dJy3I9Xhrt8JPZ8YegEFKytnoKH4ZOrbV9I4YVgJVtzq/d
 GDLP7xGlJn7Dz57ubmN6cc+ujB2916+ozxPLdqlIjStDzMY30x4gVjiX2KGYEZfaqzZ8AW8p
 bfSkcnx8Em4wx+EjTJ1GBZP8Ubk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4da993.7f54d14b0d18-smtp-out-n01;
 Wed, 19 Feb 2020 21:33:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C7D0FC433A2; Wed, 19 Feb 2020 21:33:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 10EEAC4479C;
        Wed, 19 Feb 2020 21:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 10EEAC4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     John Stultz <john.stultz@linaro.org>, Sean Paul <sean@poorly.run>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Mark Rutland <mark.rutland@arm.com>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 2/4] dt-bindings: display: msm: Add required dma-range property
Date:   Wed, 19 Feb 2020 14:32:56 -0700
Message-Id: <1582147978-31475-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582147978-31475-1-git-send-email-jcrouse@codeaurora.org>
References: <1582147978-31475-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GMU node now requires a specific dma-range property so that the driver
can use the DMA API to do the few memory allocations required by the GMU.
This sets the IOMMU iova allocadtor to match the 'uncached' part of the
GMU virtual address space.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 Documentation/devicetree/bindings/display/msm/gmu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 776ff92..6952d5a 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -83,6 +83,13 @@ properties:
       Phandle to the OPP table for the available GMU frequencies. Refer to
       ../../opp/opp.txt for more information.
 
+  dma-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Describe the dma-address range for the device. This should always
+      describe the range between 0x60000000 and 0x80000000 which represents
+      the uncached region of the GMU address space.
+
 required:
   - compatible
   - reg
@@ -95,6 +102,7 @@ required:
   - power-domain-names
   - iommus
   - operating-points-v2
+  - dma-ranges
 
 examples:
  - |
@@ -127,4 +135,6 @@ examples:
 
         iommus = <&adreno_smmu 5>;
         operating-points-v2 = <&gmu_opp_table>;
+
+        dma-ranges = <0 0x60000000 0 0x60000000 0 0x80000000>;
    };
-- 
2.7.4
