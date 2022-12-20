Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC116520AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 13:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233806AbiLTMh4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 07:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233713AbiLTMhG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 07:37:06 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100BD1A209
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 04:36:59 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id bg10so8620907wmb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 04:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rImy9qzQNsvaZKsJD53z0ZS74yDDaR5L8OHuycyt/+8=;
        b=b1dMW0eG8mZGJmDlBetQlxHLiE0Qn+BOZ4Yiqj2P2HY+eeZyTVUkuaE9LI8wTW0/R7
         d11X33T1puXL3C3ciUi56+uJqJbDYt2Lp63iU/wK7LnZkO4s8oUNzjkwTVKXgZb7S+lh
         1NRzK2rR78GrDsXIc24rLm0nmOFQbJ3UNzO0znW+RcUv+exmqAieDdV1DbWDKu++mqp/
         /yntMXb1LdvBWeS9i1UBamyFe7bWXrf6BW2/UrzrfknK8XRc2leCR4hIWMnM7Jx+Ka6B
         R91j/xBLSl70E9b1RZ10Hd6kwYsFTDbK8MMyKReEbBRE8U/ByM1cTESbDKYNbOVWxgTl
         BzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rImy9qzQNsvaZKsJD53z0ZS74yDDaR5L8OHuycyt/+8=;
        b=NBHW1L+Nr2Rev3R6SW3ny7qCB8Dh8hPaeVXdn1uD2Mrtaf09PJuXkkc0yu7UTG120o
         LGDt+M5DOKSdiHRTdgO6UfE2KLzlLAttQaSPa/47l6fH7UBx3NKB9I13mQ5luutqfvxu
         J3+3gs/3q19MCnGV6wqYpcnyqcyHZM+H43ICo8Ts5UbI5B78ILttuUWiBAqfmM8/JWDS
         4oZivyf0qPKq0MrD2TpxF3KLCZsWvp0ahNtTbPW/cyBFnEzRCEAwDAz+mP6mP8QO67j5
         0m4Q+EmbG6rUOp26XJlic4Ay4shBxCNRUeUdOTZiBiEVsnY/wtuvUEM9hnQGiJiPh6zL
         0gpA==
X-Gm-Message-State: ANoB5pnJI6wmSpG8SD0gyf7fnKsTg37++ieU8dac94RmZ2UMApuC5L5q
        t9UTAGzrgtCy54t0uQydenIrh8SIeW89DRQTzCI=
X-Google-Smtp-Source: AA0mqf6iHwbVHyEvGsTvVxs6wi0sc9SsG8Enzu0jPcef+MYUCXf6kyphBF1kj3CaYio4HGgb2Wwkgg==
X-Received: by 2002:a7b:c005:0:b0:3c6:e63d:fcfc with SMTP id c5-20020a7bc005000000b003c6e63dfcfcmr37476117wmb.35.1671539818399;
        Tue, 20 Dec 2022 04:36:58 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 04:36:58 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v5 18/21] arm64: dts: qcom: sdm630: Add compat qcom,sdm660-dsi-ctrl
Date:   Tue, 20 Dec 2022 12:36:31 +0000
Message-Id: <20221220123634.382970-19-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
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

The sdm630 can use the sdm660 mdss-dsi-ctrl compat. Currently it has the
same set of binding dependencies as sdm660.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 13e6a4fbba27c..8b9c7421bc0c6 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1572,7 +1572,8 @@ opp-412500000 {
 			};
 
 			dsi0: dsi@c994000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm660-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0x0c994000 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

