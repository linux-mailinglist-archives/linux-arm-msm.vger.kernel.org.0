Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C691557AFA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 05:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238424AbiGTDxI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 23:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238223AbiGTDxH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 23:53:07 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2B16D556
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 20:53:06 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id gn24so2232932pjb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 20:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WyZzcrrFobayqjPnvh8BotCX2m5olW/PKmd+632dba4=;
        b=LInOYZaUyeCRyCFEavBzRarqCtNovHIZB4aOhDf9QepQxyGbV2OmPzMlndkV8qCj2r
         Yz6i7xsoZaoZD0Gi63JSi/OXm9+uROIyuGb4uEfaRMHOjLUveUtFCIodBVaQCPZ/frby
         eUl4g0Rq1SSWWWqqYqBc/k7ZvfKWqSRchkCKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WyZzcrrFobayqjPnvh8BotCX2m5olW/PKmd+632dba4=;
        b=jJHzc5vIvSnPErDv52WTRwVjdVwp7ngm3bNErhXX8vl/9MNE4toQc/UtEvJ3j2HjRh
         2YOLjrL8AI4XeRAqCMBLTFV72haWo/6wFAzEFQsNqjiTaamprFS+xTtcAOdHoyV4Hv6j
         snYRWYe82trOPT3W4KyBItdRYjPcDu3+jI7aS1fhdTkTskVCoIZ94ue1RcTv9ZfjPZHu
         i2vo+X08JpsTl9/mXbwS6TQvvBWEMa1ZOPU83BUQLcd6id/1zEX3otqz458EHSmpm4zT
         3kW0Hr3EwI4FrULKeRFYTjW3bXbLPgBOrCq3vy2KGcyGT2srQFlXEymUdmaVhdPX6elm
         q5Rg==
X-Gm-Message-State: AJIora+68RpzVWEKEIt7UJSsLnue53FIkQVW2DE3Etv+Xbn8D+ACCMGG
        M64rHiKNK+9o5expFgvvLHtO2Q==
X-Google-Smtp-Source: AGRyM1tt04eOtQvrg1dj/QNOyHA5z+GMm9J0cZfrEjzJNw3Pl7RAdggONE7Ila6Hnujd08g2ROgmcw==
X-Received: by 2002:a17:90b:1914:b0:1f0:23f8:1d3e with SMTP id mp20-20020a17090b191400b001f023f81d3emr3105977pjb.60.1658289186239;
        Tue, 19 Jul 2022 20:53:06 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id t11-20020a170902d14b00b0016648412514sm12378346plt.188.2022.07.19.20.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 20:53:05 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, mka@chromium.org, cychiang@google.com,
        judyhsiao@google.com, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [PATCH v3 1/3] arm64: dts: qcom: sc7280: herobrine: Add pinconf settings for mi2s1
Date:   Wed, 20 Jul 2022 03:52:52 +0000
Message-Id: <20220720035254.1411959-2-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
In-Reply-To: <20220720035254.1411959-1-judyhsiao@chromium.org>
References: <20220720035254.1411959-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

1. Add drive strength property for mi2s1 on sc7280 based platforms.
2. Disable the pull-up for mi2s1 lines.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

Change-Id: Id22b5c055d81547d27e385bdd167083248d6cae5
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 57bacca6c5e1..67874749f1a8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -632,6 +632,21 @@ &dp_hot_plug_det {
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
2.37.0.170.g444d1eabd0-goog

