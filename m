Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29417577D0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 10:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233448AbiGRIDM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 04:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233431AbiGRIDL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 04:03:11 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0230186EB
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 01:03:10 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id o31-20020a17090a0a2200b001ef7bd037bbso11909338pjo.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 01:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=20A8d3QKuqR55DqSEaCOxZca1dq4+G/QxQSgtWMnIuY=;
        b=dF8tz5UKfYMyW4FP8lANsjwINYJruISKQD229AJrJvla8/z2uzkBddsXd6MrrabocB
         D3neIwaTAIJUK7KyNM96/DDMuCobhbfHI1VPJLIC9X9Ugl1Y6aqzz5fQtNqNvw1SaSXE
         tdq3hYhsWdqHjXNCvYF4GjgacVf+ZSk3MbqK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=20A8d3QKuqR55DqSEaCOxZca1dq4+G/QxQSgtWMnIuY=;
        b=2648WGOR8iUKFMnIZriCOUbZBph6Omh3cuoU2s/Wi+LE+b1ZWF0WsdoOXcE8H0p7xL
         6AqX2PawMS8Of4jP/iKMcFvJDkoKr7xa3ReRc39Jy83tC1m9Whh1ZqpkuYHqhWRsnWVG
         U7hDTaGYSJ93Gy55VgS8iVAZdjz5Oyh8L5z3tJ5DrQ3GyYODuuQn2mGRa9eVTRFu9zqV
         8QnRE/iVOSq5xfiy4XzFHxZ+BqkQLGV0AfHQZVDcleAB7J3wr7PbrTzoeuGTY5Lipd91
         oCGjj4u8oho7TvIKbQB7ld2vuMSJrTlYqr9i8gP5kDIbcSLAD+ZKcsMfJg/CfRi8t99x
         CVkA==
X-Gm-Message-State: AJIora8ExVNE9JQravTCDLE8Yb5rs6kFdyHhf1aQGPQqqvfkVpqaJkj5
        E3hK0Fa0G2HY7fJBdxCOV0y35Q==
X-Google-Smtp-Source: AGRyM1t+/pisY8sC/UfSbD+X53uqi2JVe7JkhqJ3g74tT1ZCkP7hnoDtIv57xgtagMBE/PpZIFSvfA==
X-Received: by 2002:a17:902:db02:b0:16c:5568:d740 with SMTP id m2-20020a170902db0200b0016c5568d740mr27301256plx.100.1658131390297;
        Mon, 18 Jul 2022 01:03:10 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id 1-20020a170902c10100b0015e8d4eb2cdsm8672616pli.279.2022.07.18.01.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:03:09 -0700 (PDT)
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
Subject: [PATCH v2 1/3] arm64: dts: qcom: sc7280: herobrine: Add pinconf settings for mi2s1
Date:   Mon, 18 Jul 2022 08:02:50 +0000
Message-Id: <20220718080252.789585-2-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
In-Reply-To: <20220718080252.789585-1-judyhsiao@chromium.org>
References: <20220718080252.789585-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 0a220e7421d9..74c451bf0d00 100644
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

