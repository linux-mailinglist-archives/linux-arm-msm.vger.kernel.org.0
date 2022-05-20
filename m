Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3363952F00E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 18:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348160AbiETQIB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 12:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351366AbiETQIA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 12:08:00 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A6417D385
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 09:07:59 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id t11-20020a17090a6a0b00b001df6f318a8bso11863096pjj.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jrf0USGJflM7r6+ev6OSw+77Ui3swWmu+X4UMtW509E=;
        b=dKvOtYwieNzttXuWldodCcBrtBB6RAi9zjnnyIdYM7qP2J7gpJUj+0yRHZpMAFO5ZW
         qA3xjJZj3uZgyMpMglhCFel7fpPJ1TXbsL1x42X+S8z+kq09vjuQfClTwgc7E9SrUFCk
         mwcr1Pdl+3aOn85kMR0PTXn8bB0QWhkKkgLN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jrf0USGJflM7r6+ev6OSw+77Ui3swWmu+X4UMtW509E=;
        b=6ppxI8jDrcUG4wYlxU9MGTrl5gTBOSphuD96ya9Yv2HnT0oyEi3KI44nF2ZvLPqhdD
         tqx5y9Lu1tz47VUGSIJEBhNGZeQ1mtZgffqVW3NXNe+qvZki8fzf7DampgKS2bWXo4gJ
         Zxy2KqjrDBJPRUIrBhC8BYL0BUJ6CmlAiAh5agkq+Atkqooustzahq2qLntMHHgMAz0n
         JDlw1uSRXrUFvN2a/nnlOY/MxkRFGDUnH9JiPQk2f5mgFgIWtbxxgMeI1jNCqve6LX/O
         mtRsnISiPrjDv69GV1iGG9vAAEc9tq22Ak5sj1ui+H8nYfxy6M4aXzaeLSxmLwpTPejP
         p8Fg==
X-Gm-Message-State: AOAM5313Rxssq+77wFPUUESJaKn49A1gecFkBqQWxRJG8AO4kH1IvBwJ
        WT6c2/Ew7wBVNeW3VBfqcHEnJQ==
X-Google-Smtp-Source: ABdhPJzH5MIeuj8j4P/ITotxTpSA/cE3BT2qltFyRWMLZXbRUekOD2TOK4N/8DsEAFpJQ2xKTrAVKg==
X-Received: by 2002:a17:90a:149:b0:1df:3da1:3549 with SMTP id z9-20020a17090a014900b001df3da13549mr11508069pje.90.1653062878968;
        Fri, 20 May 2022 09:07:58 -0700 (PDT)
Received: from judyhsiao0319.c.googlers.com.com (164.135.233.35.bc.googleusercontent.com. [35.233.135.164])
        by smtp.gmail.com with ESMTPSA id iw3-20020a170903044300b00161a2d98a8esm5856138plb.226.2022.05.20.09.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 09:07:58 -0700 (PDT)
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
Date:   Fri, 20 May 2022 16:07:52 +0000
Message-Id: <20220520160754.1141281-2-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220520160754.1141281-1-judyhsiao@chromium.org>
References: <20220520160754.1141281-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

1. Add drive strength property for mi2s1 on sc7280 based platforms.
2. Disbale the pull-up mi2s1_data0, mi2s1_sclk.

Change-Id: Ie227da1076a4343b88b331a937169745fe91902c
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

