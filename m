Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC5875F0ED1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 17:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbiI3P2G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 11:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbiI3P1q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 11:27:46 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABBF7184834
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 08:27:42 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id 9so4522667pfz.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LPYKbguZc/KYKDAy5XVdCd4nJdkVt/SEkrsrImBpX8M=;
        b=QO/TF1TNKtb4QyPMMPtineoZsKRrwcEslkNxYHDy7pmXsMR2gufPagDwtI84c9fL+4
         UYMyG5FENa6TS5E6+dij/qpwLBIp4H9XmD7+VQ+thOf3qblqwTZ4VKe5NmpthWyfAkVa
         ddCUujWy4ojYU3Zu8diFNEBv6P9ZP1pDzw7gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LPYKbguZc/KYKDAy5XVdCd4nJdkVt/SEkrsrImBpX8M=;
        b=V8p6audIlyqhkZpN5ShgIG8PZy7eGDwWT33I/hswGg7EjjhkDuD22oITfeGDUHv5mo
         lK8HglIaAUzEqgpZM4IkQ6Zp25w9J4aBu9BPAmxaIGY75rrPZU7Y/Yd2OW5qTfa6reMt
         ehLIhaxZUkzfqgdIOzpbhubpf+DDpADyLBuhzxpWTpKlY0Z4QkorAi75apgLIF0CN0aq
         iRQIPfJv/rTqqU2d1l3BstvYG/QShQPhK0L3GqZSqfEkNu3U7y6Q+US7/vSLxInDcjr6
         1Ry/64O7s2q3uaGMmFhTJvnq01JS/RtKqCCnHrfxP+FpQamBxj3x0DIEZUR9TObF3IUr
         Z/bw==
X-Gm-Message-State: ACrzQf3eO+lAlxIL8lqJZSO/i42l9c8wSOoaihmem6OmuoB12OAsGWXU
        ayo5uhgyeJl1pAo+Vl9FWdZtqA==
X-Google-Smtp-Source: AMsMyM68rZnXqbxGTRkqoJ+2ZphomMhvwQl/2z1iRnCzfodcoDCed/fQt4XFChNiRPcA1UFo7Aj4kg==
X-Received: by 2002:a65:58c8:0:b0:438:aecf:5cc8 with SMTP id e8-20020a6558c8000000b00438aecf5cc8mr8012063pgu.18.1664551661335;
        Fri, 30 Sep 2022 08:27:41 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
        by smtp.gmail.com with ESMTPSA id o9-20020a170902d4c900b0016dbdf7b97bsm2006133plg.266.2022.09.30.08.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 08:27:40 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     bjorn.andersson@linaro.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH v5 3/3] arm64: dts: qcom: sc7280: Include sc7280-herobrine-audio-rt5682.dtsi in herobrine-r1 and villager-r0
Date:   Fri, 30 Sep 2022 15:26:13 +0000
Message-Id: <20220930152613.2018360-4-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20220930152613.2018360-1-judyhsiao@chromium.org>
References: <20220930152613.2018360-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Include sc7280-herobrine-audio-rt5682.dtsi in herobrine-r1
and villager-r0 as they use rt5682 codec.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts | 1 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
index c1a671968725..c569d7a5edb7 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
@@ -9,6 +9,7 @@
 
 #include "sc7280-herobrine.dtsi"
 #include "sc7280-herobrine-lte-sku.dtsi"
+#include "sc7280-herobrine-audio-rt5682.dtsi"
 
 / {
 	model = "Google Herobrine (rev1+)";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
index 73e24cc55a09..31a57ae5af57 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
@@ -9,6 +9,7 @@
 
 #include "sc7280-herobrine-villager.dtsi"
 #include "sc7280-herobrine-lte-sku.dtsi"
+#include "sc7280-herobrine-audio-rt5682.dtsi"
 
 / {
 	model = "Google Villager (rev0)";
-- 
2.37.3.998.g577e59143f-goog

