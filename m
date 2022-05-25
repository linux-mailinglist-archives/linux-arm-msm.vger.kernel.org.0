Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDF65334DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 03:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243353AbiEYBnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 May 2022 21:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243358AbiEYBne (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 May 2022 21:43:34 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D97A373556
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 18:43:30 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id q18so17326757pln.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 18:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xb/SxnzZRA8lvdgyOL4I+fRz/jFWMo6rTxKCV7Sryew=;
        b=gr2Mj+T8LtdSFaoySl3h9txPZ72cOi2udZPda9NVxFE84EtTr8ZWeWVfZFfKvwD9NE
         e4LsAjDKY4hKSrBdaVHiK4cftO4kM5gln9ulX9eUuLmCsRhFmb0p+N+OfTw09OfQ+6rP
         ox4f/NaV67X94ZxkqJF4xVaf4rEwGbX/za8oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xb/SxnzZRA8lvdgyOL4I+fRz/jFWMo6rTxKCV7Sryew=;
        b=8Rb3zbFZiOdtl068Z5w3Y0xnw6vX1GUHZYdAOZMkKmH6om1NvQWpDu9reX5Fz8K/sY
         Qmpvqw3m8LDXlAnNZgmShuoBbWWhi9DWqES9Ww5ha9Q78FcgbmP1IcgZRUnlEH4L//lm
         XmAzMWTUKLzqcmbB7NjRuzgjfUdRcEvnQ8fjPKKFRLkY+pJtI7+llVDUwyn++NDqaFDR
         6kOYLBEigJfUe7VVvrFHph+tPbgfdQAzOwuCtvP71jZZGEXX9goZq7or6TWh0f3EbBkZ
         Z/4TKGsMplXdxBG9GlLgqwC88ZYGOH3ZgwevbzN5/YxMF8eqCn2kZs36pXpWq3YTqDGH
         zHkA==
X-Gm-Message-State: AOAM532dUr77mZ+44zt4rkgfX1H9TIuZ2cmtj0CoNgFD7gPSdCgInoIh
        Zt6x09aRZe9XpwEzcAYMY21uDw==
X-Google-Smtp-Source: ABdhPJxdvJnWTu9cJaaIXlQgiul9IY8icRBYKEiFJLuy0e4pa6+lZ+unBwAiZ2v4cza/C/ndSFdiuA==
X-Received: by 2002:a17:90b:4f4c:b0:1df:e74f:ebcc with SMTP id pj12-20020a17090b4f4c00b001dfe74febccmr7645453pjb.38.1653443010119;
        Tue, 24 May 2022 18:43:30 -0700 (PDT)
Received: from judyhsiao0319.c.googlers.com.com (164.135.233.35.bc.googleusercontent.com. [35.233.135.164])
        by smtp.gmail.com with ESMTPSA id n11-20020a1709026a8b00b0015e8d4eb2bcsm7877317plk.262.2022.05.24.18.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 18:43:29 -0700 (PDT)
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
Subject: [v3 1/3] arm64: dts: qcom: sc7280: herobrine: Add pinconf settings for mi2s1
Date:   Wed, 25 May 2022 01:43:06 +0000
Message-Id: <20220525014308.1853576-2-judyhsiao@chromium.org>
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

1. Add drive strength property for mi2s1 on sc7280 based platforms.
2. Disable the pull-up for mi2s1 lines.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 9cb1bc8ed6b5..f3044b39ba66 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -612,6 +612,21 @@ &dp_hot_plug_det {
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
+	bias-disable;
+};
+
 &pcie1_clkreq_n {
 	bias-pull-up;
 	drive-strength = <2>;
-- 
2.36.1.124.g0e6072fb45-goog

