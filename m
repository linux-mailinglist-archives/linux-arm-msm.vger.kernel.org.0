Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2219636F63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 01:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiKXAt0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 19:49:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbiKXAtB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 19:49:01 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5E51001EF
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:22 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id i12so303367wrb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 16:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIJDbyegl6u8zeEPDRjfbckMoUQq7Dd8VduqGlrKmeE=;
        b=JlbA9+8W450YbRnk4VYcS3AdEM2Va8QQwzmvPTb8phkZo5MqG61ujr+F5SSG69Cno2
         gT+l/WoqdumqULNpM6lhJ0OjoDUsE2q0lTwhFGghl6zjlw2W59ARTkvIZEDMKzuB8PlE
         sbA+1FaOJ2oj/L8puLQ6gTSfV5HMDvEFaLHZ/Rm290qPmUtxeJNTDzLRYe8FyFQIo7MB
         /FfraxLNDYUvD49gv+HXzXrLd/vsNctsoRz6CHOEgt0jPpapG7KF2rUXTRuHvqqkfHaS
         AoO8NXOQshhQ6WWpWGSTDtoU6WXrQfPFLANtBFGxQ9UoFNdgvA3tAxxcS8g+GThC0Gg6
         i3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIJDbyegl6u8zeEPDRjfbckMoUQq7Dd8VduqGlrKmeE=;
        b=r9sCRf7oexJhSWQuOe0TdKHJBgwOUcic4AgjcjHcx3eZItMXrlTMa9UtOBCKMg4NPe
         ND92+/eLOIiDQKcRAc1cZ2plj00u3Eq5Ek4cUt0gi/0WfSLkmZzi5qCiFq+7aOGxgJgm
         rnCIF7yu8HjM/dO+c6oDZxU019pRq0CqXrUZ4lpnO3R25QrrlvB0u1Q3L1Cw7TsuSuAa
         VP8yVTb6v4QFdkn8rKoEeIWLYC1JYsInLXgczx33m6IBEuB7ULa7Gp/oK7AGpmzwjtfw
         2RKAMIEtaaOxBqvhSBvLo1wRr5SX8NXBMHi0kA/9wlBgyRNC+Rh+cEzy9om4JvYS8/0c
         E2sQ==
X-Gm-Message-State: ANoB5pmUC9jEyqC6NvXDxBgiAeu+9hMcuRaxVQa6UEw7/SgqbTDsAjFZ
        C/0dbix5lWwzZ2hiKeCIF0WRfuA/rxDa5Q==
X-Google-Smtp-Source: AA0mqf4MZt+wx+bbi0GWwMA/YGWDOYht44nKXvQxpfQF4vjdgr98EfXiMvTzdAqTsh34jZ5BlSjkKA==
X-Received: by 2002:a05:6000:46:b0:241:bc67:c7af with SMTP id k6-20020a056000004600b00241bc67c7afmr13010638wrx.91.1669250901571;
        Wed, 23 Nov 2022 16:48:21 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c3ba600b003c6bbe910fdsm5245076wms.9.2022.11.23.16.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 16:48:21 -0800 (PST)
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
Subject: [PATCH v3 14/18] arm64: dts: qcom: sc7280: Add compat qcom,sc7280-dsi-ctrl
Date:   Thu, 24 Nov 2022 00:47:57 +0000
Message-Id: <20221124004801.361232-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sc7280-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sc7280 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index a4d6e866b5999..3368531e004e8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3903,7 +3903,8 @@ opp-506666667 {
 			};
 
 			mdss_dsi: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sc7280-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

