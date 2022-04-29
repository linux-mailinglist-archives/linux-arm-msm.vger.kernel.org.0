Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A0C515727
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 23:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238903AbiD2Vr7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 17:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238924AbiD2Vrw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 17:47:52 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27710D95F5
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:44:31 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id n18so8235696plg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 14:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G+b/5mZlFuHtU2XDozomo84+nsQCdCx5HIlm6/xmsSw=;
        b=Lk7L4IygC+lKFXqlatdS4sTNMrlHQVhH4QHq/GcQWEOUR6yjyfqapWDnENI0syOUvP
         Pzv1QdFuuw86sXzVfRNyM1MpUmh2rZFLO84tTRpO1RKk4nE8A79vzXTk6vg+/EpXwhl3
         GhmbUD8NL9c5bj5oiGDKHapJL4bLvGZP8hYJKNjbpf4YwyFIV/A704gevl80qAnna8dw
         6z/7oAuCmHf9MYIdniHiHYo+yFKWsKFck1vKvl2O02zcet1rDAya5x/AlXPuy64iE0ev
         rU9n9WSGcs5Bhnby8BeF5QDgxgMy2rAenTRY41M2Y2Y/gvok6CsFMUe1AndjZKQUXG74
         hapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G+b/5mZlFuHtU2XDozomo84+nsQCdCx5HIlm6/xmsSw=;
        b=VrrSk/tQvCGkWHa41OZHqz7l5txQS05WIPvgrLXyFvFsr2t2aVnmhEnWUzMLUo9fCl
         7n0I5e5xnLl6SEoWsHb8T51o03y0VK7wAfyXL+7WuJauQl5+X4h1hVnNHHpnj7JalZuf
         w1/Pk+N4MDgVn5lVb0OzhXeCG6To0H04XDkICyAQpvRhz4ohxwhq7S4571fDcr1Y49h7
         s8zkE0G1lhhGHvi7v7bfxYIFTONdnmVEStsHMmNSq5Y7A7LLo4QYe7/Qh3mfGbzhaAOI
         I8ffk3lPvGzNBDJEdBQH0fNYGqNVDPHjymCxJGCE0jrVfHGY9VPr20gAW2FpKYd8sfPq
         UQkA==
X-Gm-Message-State: AOAM530WI6y8CmufSCVTf+LYXbz5lMFolXK/R3NCzI2ZzzlWsCQ+foSN
        6rEv8qrqwFLZXBsNBd+y8rdEX33zmN8iiw==
X-Google-Smtp-Source: ABdhPJwx9C+GPVAfhw27WAXdFgQUSO3zeFDI+lxbdL2k29gyzRGPqHdj1Zd+ey7umQd4Li4UnuYzKw==
X-Received: by 2002:a17:903:1252:b0:154:ca85:59a0 with SMTP id u18-20020a170903125200b00154ca8559a0mr1273711plh.169.1651268670521;
        Fri, 29 Apr 2022 14:44:30 -0700 (PDT)
Received: from localhost.localdomain ([223.233.64.97])
        by smtp.gmail.com with ESMTPSA id fv12-20020a17090b0e8c00b001cd4989fed0sm15271086pjb.28.2022.04.29.14.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 14:44:30 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 1/3] arm64: dts: qcom: sdm630: Fix 'interconnect-names' for sdhci nodes
Date:   Sat, 30 Apr 2022 03:14:18 +0530
Message-Id: <20220429214420.854335-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429214420.854335-1-bhupesh.sharma@linaro.org>
References: <20220429214420.854335-1-bhupesh.sharma@linaro.org>
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

Since the Qualcomm sdhci-msm device-tree binding has been converted
to yaml format, 'make dtbs_check' reports issues with
inconsistent 'interconnect-names' used for sdhci nodes.

Fix the same.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 7f875bf9390a..db18b35d4a7d 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1285,6 +1285,7 @@ sdhc_2: sdhci@c084000 {
 
 			interconnects = <&a2noc 3 &a2noc 10>,
 					<&gnoc 0 &cnoc 28>;
+			interconnect-names = "sdhc-ddr","cpu-sdhc";
 			operating-points-v2 = <&sdhc2_opp_table>;
 
 			pinctrl-names = "default", "sleep";
@@ -1337,7 +1338,7 @@ sdhc_1: sdhci@c0c4000 {
 
 			interconnects = <&a2noc 2 &a2noc 10>,
 					<&gnoc 0 &cnoc 27>;
-			interconnect-names = "sdhc1-ddr", "cpu-sdhc1";
+			interconnect-names = "sdhc-ddr", "cpu-sdhc";
 			operating-points-v2 = <&sdhc1_opp_table>;
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&sdc1_state_on>;
-- 
2.35.1

