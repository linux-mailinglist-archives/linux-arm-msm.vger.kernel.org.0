Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 671D15334E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 03:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237609AbiEYBni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 May 2022 21:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243338AbiEYBnh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 May 2022 21:43:37 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270BF58E64
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 18:43:36 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id i1so17329421plg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 18:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZB7BWpRnlBzFfCqwBENpii045L63Udnz6UdJqFoKbrg=;
        b=WQPkx5sRg9kMNQHXWHkA4fBFgp50bfJD7M4HD/6geM+zKjOoOobHnz1PmPsC58wXtu
         FnIcQbR9GBw0MCwxzVD8TkjHuJwNvzQPpo5NTYqRwjnOHs7bb4fUS+DtBDwTqq40Z3Bh
         qy+W4n5gWpOA7TyPKvxzD0JA0T3CADCEd2jTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZB7BWpRnlBzFfCqwBENpii045L63Udnz6UdJqFoKbrg=;
        b=0kghFs7E1oex2Bsmwk0p69ySa9cdauRQTrPQo+HU3LwhBcUhUNt0iDj31O5voPp4id
         3dg3IClk7PPxQIyCE2TBV5qGpkXYqV9iV+nZSn/oQ2CrUuya9IDPCqQSSJYBRmC4Pr+Z
         D5HYPMXJNYCGTN9b1rjCul5NB6rqFtWUlhOcK/lGy1Loz3GBZYZcc4C+9k3Eom1eqSPI
         au8CXRt+6znpJ7uFmzKBjPa6edGSanwsMg1j+fQzyu2D6OXaBw0FHivip18kYlhzpA/x
         HVqvm+BcaO2LtNaIWByC0kIjw3LU3I8qBR+k41GNIhDO57OyAjoJirZhxavVBV2YDBDc
         C8cw==
X-Gm-Message-State: AOAM5305QorhgGgDD69cftJYU0TN8PPWM8JsbwnCwXDMQC4FY7ZMbcGo
        S8lhHq8sr028rPgp3r8nco2t/Q==
X-Google-Smtp-Source: ABdhPJywU2wti1e7muLPKna4m8wIF8KXNRmodbfg3d7tscQ4iNi2fS0MwKcRipR5DikQqr5tMVmq9A==
X-Received: by 2002:a17:902:ebc8:b0:15f:417c:288b with SMTP id p8-20020a170902ebc800b0015f417c288bmr30810154plg.14.1653443015901;
        Tue, 24 May 2022 18:43:35 -0700 (PDT)
Received: from judyhsiao0319.c.googlers.com.com (164.135.233.35.bc.googleusercontent.com. [35.233.135.164])
        by smtp.gmail.com with ESMTPSA id n11-20020a1709026a8b00b0015e8d4eb2bcsm7877317plk.262.2022.05.24.18.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 18:43:35 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [v3 3/3] arm64: dts: qcom: sc7280: include sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1
Date:   Wed, 25 May 2022 01:43:08 +0000
Message-Id: <20220525014308.1853576-4-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220525014308.1853576-1-judyhsiao@chromium.org>
References: <20220525014308.1853576-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Include sc7280-herobrine-audio-rt5682.dtsi in villager and herobrine-r1 as
these boards use rt5682 codec.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts | 1 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
index b69ca09d9bfb..f68d28f8701b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sc7280-herobrine.dtsi"
+#include "sc7280-herobrine-audio-rt5682.dtsi"
 
 / {
 	model = "Google Herobrine (rev1+)";
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
index d3d6ffad4eff..7a4acd3b9ee3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "sc7280-herobrine.dtsi"
+#include "sc7280-herobrine-audio-rt5682.dtsi"
 
 / {
 	model = "Google Villager (rev0+)";
-- 
2.36.1.124.g0e6072fb45-goog

