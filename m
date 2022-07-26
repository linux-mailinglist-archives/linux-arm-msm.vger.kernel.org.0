Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB0F580F58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 10:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbiGZIpp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 04:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbiGZIpm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 04:45:42 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDA428710
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 01:45:41 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id t3-20020a17090a3b4300b001f21eb7e8b0so16082074pjf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 01:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NyOOkD+eRbzSyetXYFfpw0k4gfFU2yiJ20e/GWk7olk=;
        b=X7vIiDhSLybQdcdrocjp2PDtEI9FAfSfkt/GXXlm4Zq/NT2ao/naZ1esoCW9iPs4LK
         SGlmzljGdXxTJjAxwE8hTZYvO3lcpxl/vz51eedoNV3wF7QLgpuk8AxL/mG/0al1EiAf
         YIACUX/TNOOLxiePT/3J4xQU/fas/m/5SN0cpELonIwUzewB4HMd2AoS5+2URULeUeaP
         r/4XThUPpUjIqQCm6/vYuLVspxYEWMyU3EvsaDYydWOkEIEhFGwT/RHKrtOFdQZBaGZc
         9AqERj1aHC/cECI4jGRdcZxd/Q5VCLkxJ81p20pIjVuIOf9SqqVjbeoZO/Ldo7OIWx/e
         8RAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NyOOkD+eRbzSyetXYFfpw0k4gfFU2yiJ20e/GWk7olk=;
        b=BU5x+P9IDctQARgrJw8jaoy1y0z0XE4PMO9dE8P9Fzt6Q5dlLKMYXqBzbMDz76/Dfh
         tfz/S0W7hKiaBrlk0rjJXuCiUb1M6qV84toGl3bzpWcttL+9wMadFiSFOn3gKbBvLxLW
         RwW4NgmXX3pHC4Y1J/+BnNWUol2bjIfVuBn3GZdRYl7Q/4T/Ub+fPC50lpVCl7KGehiC
         g17PaYH/qC91s0S9k34YFxTgmhRhBWtzjG/YanfcltvqsPRjUolZYb3T3qo4OJ8LZRiO
         32r3AuE6vrAz+YmebjYxZRprUwvVmPeaYlCgopDU8VKs/3Tftkc7n69gt1esAbAypbon
         axmg==
X-Gm-Message-State: AJIora/lgQh5roG1/X/hoZgHVRW0pt26urNSevsEbVfvBE603FarfSOS
        ib9KgfZ4Kh5rcfuLUEcpw8qKpg==
X-Google-Smtp-Source: AGRyM1tImQ0our/59COnOeI0PSnlKWT0efVS/MN9w29JmZjyd9OsYz0Z2+TKak57pzx+1Gq4ZXhjew==
X-Received: by 2002:a17:90a:4216:b0:1f2:70ed:1116 with SMTP id o22-20020a17090a421600b001f270ed1116mr16168424pjg.89.1658825141232;
        Tue, 26 Jul 2022 01:45:41 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3a:5a45:a9cd:d7dd:fd01:73c0])
        by smtp.gmail.com with ESMTPSA id d4-20020aa797a4000000b00528c16966casm11450560pfq.174.2022.07.26.01.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 01:45:40 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, ulf.hansson@linaro.org,
        robh@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Subject: [PATCH v2] dt-bindings: mmc: Set maximum documented operating frequency as 384MHz
Date:   Tue, 26 Jul 2022 14:15:20 +0530
Message-Id: <20220726084520.2895454-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As Ulf noted in [1], the maximum operating frequency
documented in the mmc-controller device-tree bindings
should be updated to the maximum frequency supported
by the mmc controller(s).

Without this fix in place, the 'make dtbs_check' reports
issues with 'max-frequency' value for ipq8074 sdhci node:

  arch/arm64/boot/dts/qcom/ipq8074-hk01.dtb: mmc@7824900:
   max-frequency:0:0: 384000000 is greater than the maximum of 200000000

[1]. https://www.spinics.net/lists/kernel/msg4442049.html

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 - v1 can be viewed here: https://lore.kernel.org/linux-arm-msm/20220725180916.2850228-1-bhupesh.sharma@linaro.org/
 - Rebased on linux-next/master

 .../devicetree/bindings/mmc/mmc-controller.yaml     | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
index ff5ce89e5111..802e3ca8be4d 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
@@ -88,11 +88,18 @@ properties:
     default: 1
 
   max-frequency:
-    description:
-      Maximum operating frequency of the bus.
+    description: |
+      Maximum operating frequency of the bus:
+        - for eMMC, the maximum supported frequency is 200MHz,
+        - for SD/SDIO cards the SDR104 mode has a max supported
+          frequency of 208MHz,
+        - some mmc host controllers do support a max frequency upto
+          384MHz.
+      So, lets keep the maximum supported value here.
+
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 400000
-    maximum: 200000000
+    maximum: 384000000
 
   disable-wp:
     $ref: /schemas/types.yaml#/definitions/flag
-- 
2.35.3

