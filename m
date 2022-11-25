Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 171FF638A13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Nov 2022 13:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbiKYMhO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Nov 2022 07:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbiKYMhG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Nov 2022 07:37:06 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0BD4D5D6
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 04:37:00 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id i12so6645167wrb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 04:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIJDbyegl6u8zeEPDRjfbckMoUQq7Dd8VduqGlrKmeE=;
        b=iTTFGz8jy339GLHg541jLaT9dA4HA9fvcmEO/fxQQLN90d/PvISNhJ/6lYpUa33DqM
         BuZdaImi1QmDyjXNVpnbNKH+CWWBgx5+tewEjSOPxCX1DPPUPRlE+WdVGb8nNY23febT
         8c3i6qBRHyNv7rtI67twEqc7kXcrUYF352w+JFNABHyOqoeX7Z3wE1ci8CT2Pb4FzIRA
         ybr7jZ+zmXuoDO8tmc64YSTOjG9AV03zMEQjW2N+z9quZHX5m6qcf4QDlHz1lVzhlllL
         onWM8RRIVU+eEb8Ec/Ynjf85tRle8T2COWlcdqEFXsG0z9Bm+R+XE+c6aKJh6Z4DAAgx
         nGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIJDbyegl6u8zeEPDRjfbckMoUQq7Dd8VduqGlrKmeE=;
        b=PlEbJ6BOsmdnWMDLiIptbEcOC6IooV+erIHgocxaf9zqZ7/d9/vi2/s1fSpDNnbCqc
         RkRBDquMG8GJhPyLvFpFxi+g0r9wbpJ6tDCQYLc4f9IOnrUqO7zzTpiXyrlIz5LTfMD2
         xEMYGS4GFUyTIT+YdKwVPozu1QWTouilFIOgpy5HV6PX8tFfsh5f6y6sFvh58GZNiSm4
         oNCIN8XhNvzApgPqMQOmPi/z7QtYSG0YSan+iknGYKR7n7X9ao1lPqRHXuHZQOym2n0I
         69DoZcCxt4p6Qg/l3STflXbCYDDDQwSKDUbH9CZ4HpqMyCjuwVSRAAe9stuFhkYXtYkb
         CmOg==
X-Gm-Message-State: ANoB5pnLrK72MNki4kHfLy16sYCyYS72JEdHQiGOq7x9PijT0S+1ugwt
        Vb91zShc+KlymbhZvOnsqBVB1vx7sBogyA==
X-Google-Smtp-Source: AA0mqf7ptg6Hh54tGkUUz+d4qRCLeoMdzWcd+Am87+jMuUBCw7bWpqd12qOjMU+fHgv/lRZIaUCVmw==
X-Received: by 2002:adf:ec49:0:b0:22e:28fe:39d6 with SMTP id w9-20020adfec49000000b0022e28fe39d6mr23382964wrn.701.1669379819110;
        Fri, 25 Nov 2022 04:36:59 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k15-20020a5d6d4f000000b002366dd0e030sm3574111wri.68.2022.11.25.04.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 04:36:58 -0800 (PST)
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
Subject: [PATCH v4 14/18] arm64: dts: qcom: sc7280: Add compat qcom,sc7280-dsi-ctrl
Date:   Fri, 25 Nov 2022 12:36:34 +0000
Message-Id: <20221125123638.823261-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
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

