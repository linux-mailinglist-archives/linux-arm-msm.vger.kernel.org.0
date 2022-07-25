Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E952B5803CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 20:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236414AbiGYSJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 14:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232916AbiGYSJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 14:09:34 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D744DF1E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 11:09:33 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id r8so2771009plh.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 11:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lXHUeursV/DnjA3vkdaJ9YQ6tDdJ4lD2AcKBqo+/DmM=;
        b=pU+PspT7bMrdPFrmwH5v7iD+m9BosZvMDVMaMlBSdp2Yh8KrPvuVldL1USRhBCv8Pk
         KpnX5yU3diW7ZhoNYURhrbXdGGR9Z3yYQ9vdsGklAn8txZyAgWOWyxNtAWG6y9iwBnTw
         yRUUT0PJrxHczV/PWHAEnb1PVQbzOtYOWKtgYShEzF8kCBPuPcCCOWyW+mw8Bx5gQ8F+
         hN/uqE01TP2o6xChI3TUQZb3U0Adl1iwExG5Ycti+ayXcMEaepTJ2Oz56TqKuc51FUP4
         +suUot1DegNzhmDIJuXLuViLToZzEKtZ4ZjL4RHwdcNG6UCHqnQ+mMWF92/9LHhaXook
         vK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lXHUeursV/DnjA3vkdaJ9YQ6tDdJ4lD2AcKBqo+/DmM=;
        b=ikzACiRaIxO4S1XuoZCDpc8DBFbtm5vS5gqQtn4dQoPZjvqDqjMEJpfGg0721gZ267
         xvcXV7taobVvjAG81ydfCvgsHG0RpB/E75Omkpg37LVQkraiF2rdCoqcV3UK/MN+iPWD
         hQ6qEHf/QiI9aGaBUx3f8KLSf7OxEGvgMuDj60bqBkBQVs82fWGs5yteWdAa0GjaQ7iJ
         HvME6t6XukAcMKQ/UO+IZeEv6gL9lBJTIJ0YBJ66pNCBQN1cJdy1aUixuI+aVvPXDMfj
         /GxlKjy0+nYE4C4s39Bp+lYGI0P2bhiSf5J2mH3bHAuIaWSnnTTtcYvAlcqylqIIU0sq
         0n9g==
X-Gm-Message-State: AJIora9hc8NpHH6wLoxsJQBBfJVVZGPtBLQbko2ia451EFSdv252lEE6
        92dByKySBVGWcGNLp0aUt2m27g==
X-Google-Smtp-Source: AGRyM1sJFjjTAQKKaSs8M50XszsAs8p2m3lvgVY9YJiOr1lX5bLoCrA+vhgLYYf4q/AvaxN8bKPlqw==
X-Received: by 2002:a17:90b:38c3:b0:1f2:e229:41fd with SMTP id nn3-20020a17090b38c300b001f2e22941fdmr1481399pjb.201.1658772572680;
        Mon, 25 Jul 2022 11:09:32 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3a:5a45:a9cd:d7dd:fd01:73c0])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090a64c800b001ec92575e83sm9219735pjm.4.2022.07.25.11.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 11:09:32 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-mmc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, ulf.hansson@linaro.org,
        robh@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org
Subject: [PATCH] dt-bindings: mmc: Set maximum documented operating frequency as 384MHz
Date:   Mon, 25 Jul 2022 23:39:16 +0530
Message-Id: <20220725180916.2850228-1-bhupesh.sharma@linaro.org>
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
- Rebased on linux-next/master

 .../devicetree/bindings/mmc/mmc-controller.yaml          | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
index ff5ce89e5111..c49f3060c24a 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
@@ -87,12 +87,19 @@ properties:
     enum: [1, 4, 8]
     default: 1
 
+  # Maximum operating frequency:
+  # - for eMMC, the maximum supported frequency is 200MHz,
+  # - for SD/SDIO cards the SDR104 mode has a max supported
+  #   frequency of 208MHz,
+  # - some mmc host controllers do support a max frequency
+  #   upto 384MHz,
+  # so lets keep the maximum supported value here.
   max-frequency:
     description:
       Maximum operating frequency of the bus.
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 400000
-    maximum: 200000000
+    maximum: 384000000
 
   disable-wp:
     $ref: /schemas/types.yaml#/definitions/flag
-- 
2.35.3

