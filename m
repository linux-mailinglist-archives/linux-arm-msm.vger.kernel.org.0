Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B72C052F022
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 18:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351419AbiETQKT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 12:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351422AbiETQKR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 12:10:17 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB1017D3B3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 09:10:16 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id bo5so8143393pfb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 09:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hED0E7H63k3wk0xBVAxG4bpFqihFcaVUlfl6ydWvpJ8=;
        b=evwRSx8YZOl35u8n6foEoPs2cAi0EhjjrqD+NQRGZ64BD12AHU//U5xgW0a0NPM0cE
         Mo8f1GLSA5jUTvCUVgHSyEY5ZDfgBTZPJ+TSjQ975WysA3nNIJ+3I05PXLYmS5yIKfv5
         GlPIKxLVQPm0IspSNuaZJpQKS0SSzcfzkelqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hED0E7H63k3wk0xBVAxG4bpFqihFcaVUlfl6ydWvpJ8=;
        b=7M+kOm75OPB7Iwb6uY3zo0YYryVaeFJtGULpE1kJs79iS/Pzpk04Y+/u2zan8C2YbO
         7oYb+8c3QIrnSX4ofrDwtmKAhSmRLB4ndv8LlTz+NDic5kk3X5oh4U0p3aWAvwKYklH0
         MlkvKjucv9oeBAXQ/J33eh48FSG/UM6J0vU5YPeBmdyaLiH4J7if3qBFhrGUHdpJDhZi
         3ch9XkUjEoLnQ0t8NKuvFnyDPkld2XBM9HF6KPEbiiZymIXey/b8R3Vkv1+qx3ANjQpC
         uHiETH/AtmAMT85aKqKivmp9sGBbOhOJmbI00Iw/QTnKIfsy4ntfa8w9nMMJ53J91xXT
         SufQ==
X-Gm-Message-State: AOAM530QqnGafFlwn6bzY4DUL+qJMDJoVbj2+MtJtpILxwQc2Cxxrbpp
        Lts90oovhWi4gV2t6YB0IeRMHg==
X-Google-Smtp-Source: ABdhPJysTU+dWsY9mu0Gsp5YsI0K9ijh7gY5No1co+XMmK1YLmtz9H1SSsQKEyavfMGVze4nq0DyqA==
X-Received: by 2002:a63:2002:0:b0:3c6:ae77:1869 with SMTP id g2-20020a632002000000b003c6ae771869mr8885371pgg.71.1653063016260;
        Fri, 20 May 2022 09:10:16 -0700 (PDT)
Received: from judyhsiao0319.c.googlers.com.com (164.135.233.35.bc.googleusercontent.com. [35.233.135.164])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902d38400b001619b47ae61sm5855078pld.245.2022.05.20.09.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 09:10:15 -0700 (PDT)
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
Subject: [v2 1/3] arm64: dts: qcom: sc7280: herobrine: Add pinconf settings for mi2s1
Date:   Fri, 20 May 2022 16:10:02 +0000
Message-Id: <20220520161004.1141554-2-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220520161004.1141554-1-judyhsiao@chromium.org>
References: <20220520161004.1141554-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

1. Add drive strength property for mi2s1 on sc7280 based platforms.
2. Disbale the pull-up mi2s1_data0, mi2s1_sclk.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 9cb1bc8ed6b5..6d8744e130b0 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -612,6 +612,20 @@ &dp_hot_plug_det {
 	bias-disable;
 };
 
+&mi2s1_data0 {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s1_sclk {
+	drive-strength = <6>;
+	bias-disable;
+};
+
+&mi2s1_ws {
+	drive-strength = <6>;
+};
+
 &pcie1_clkreq_n {
 	bias-pull-up;
 	drive-strength = <2>;
-- 
2.36.1.124.g0e6072fb45-goog

