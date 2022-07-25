Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4625580592
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 22:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237067AbiGYU11 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 16:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237051AbiGYU10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 16:27:26 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF74B220E1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 13:27:17 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id c3so11411435pfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 13:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6pnjId8157F0YTWhWfSC/5aTXpHZCwIpGW/QEGNcteY=;
        b=abaAiWLmWu93GmZ4BTbyEdgieqn+J3Po/WKjkZo6zp2S8oYLiqt/zNpFD0WKEmFOu0
         gF4YImq4nZK32SgJkJkgCCKL+wD6+PPDWD34RPRliXyeJptGKWoSsqa91+Vcwu2BBR81
         sXV7gYpizMscVuktwLzAuXnWJxKSY0IjFPS0HyHtqzS4GTleqogdTNkb2HnErRUyWQHk
         9sbENXwqhXbzK5CODpLnaectsCjxJyQqD/C/uRylazhGROMQnXqwhFux4qGxv8/aa0AE
         6BEE7yfP6U8eDnObkVzoZJ/vBoZg5tLkWcI4PJPw1TIvH7OWZSDVQlLAxrJk1wxvOJzB
         sx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6pnjId8157F0YTWhWfSC/5aTXpHZCwIpGW/QEGNcteY=;
        b=NEr7yD17eovIFzO5HbUGny8bkhKfnM2t6s86cAttHwnzf0VDUCmShj+/OiSi3412vR
         W06av4eIQfjScYusPSuZtkKIjosHh+3fIcqz/66GnzR7Wf+LN6lx+5pvQTYTLM/6eZBh
         TD0VrzYIJcEZIV0+v0zv4XcoM/t6t0e+uL2ZX9FoWr/nyZd+qr0O638dhmmd7PXodvEv
         ggLGJKv6Dxe2UxkxmxulGO3ysbB7OA1iaxmbMMrIeCAt2VepSXaBqEe5zZvAdtXiWUDg
         /UDtAyUjkoe4kyRIg9oKH66UwYdVC26klylAcXV1aMpuckP4MH1FTovcdtjZy9zQKyvi
         n5HA==
X-Gm-Message-State: AJIora+yH4jY5RTvqIxsOwksBNrYm/mI/aWjg9HJA1owuci0+mSU/Ch+
        u9WDlaRPVHK0K1QZl2q0dxvnEA==
X-Google-Smtp-Source: AGRyM1seKXbaSXVkL6RxTSPDAO8V8WuGv9UJA311bQxvxR8q5Qj+DwNK8ibUE0wINtgMaajoUaL/bw==
X-Received: by 2002:a63:1a09:0:b0:415:fa9a:ae57 with SMTP id a9-20020a631a09000000b00415fa9aae57mr12018258pga.181.1658780837266;
        Mon, 25 Jul 2022 13:27:17 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3a:5a45:a9cd:d7dd:fd01:73c0])
        by smtp.gmail.com with ESMTPSA id o4-20020a17090a678400b001ef7fd7954esm11568479pjj.20.2022.07.25.13.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 13:27:16 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-mmc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, ulf.hansson@linaro.org,
        robh@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mmc: sdhci-msm: Fix 'operating-points-v2 was unexpected' issue
Date:   Tue, 26 Jul 2022 01:57:09 +0530
Message-Id: <20220725202709.2861789-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
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

As Rob reported in [1], there is one more issue present
in the 'sdhci-msm' dt-binding which shows up when a fix for
'unevaluatedProperties' handling is applied:

 Documentation/devicetree/bindings/mmc/sdhci-msm.example.dtb:
  mmc@8804000: Unevaluated properties are not allowed
   ('operating-points-v2' was unexpected)

Fix the same.

[1]. https://lore.kernel.org/lkml/20220514220116.1008254-1-bhupesh.sharma@linaro.org/

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 - Rebased on linux-next/master.

 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index b00578ae1dea..fc0e81c2066c 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -137,6 +137,8 @@ properties:
 
   max-frequency: true
 
+  operating-points-v2: true
+
 patternProperties:
   '^opp-table(-[a-z0-9]+)?$':
     if:
-- 
2.35.3

