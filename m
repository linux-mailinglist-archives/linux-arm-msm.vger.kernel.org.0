Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4EC6520C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 13:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbiLTMie (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 07:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233434AbiLTMh1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 07:37:27 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B601A068
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 04:37:01 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id h11so11549971wrw.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 04:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZI/lLtloM4Tug4sA61Civ+cVcFduOFVW5YccHSGp9ig=;
        b=eF+PhFf5qeLqtrw+IAez0BiPQ9HYoGvX7UcXyiaLnVZqXe2DyTL24DuL9/CjVL/1d6
         vwOE00klSdPx0UJBw06rX1r9eWdiqvwMisycqNx2T3dJgfgGdDNMRypzNpoau9JGIn9M
         D8QShZEwthKERVHWXBLSPsiDzXIcL8Ht0iXtukVcVMDRCZoH70Z25Az1jFFtHx7EW7/1
         ipEBrGdVlVthSpOBV7pLccubnfw7OKa04pJVPUzoaPqQBPDA2V3zipvjhZ2CJ1BuEFlR
         uEoNYxvPcJm9N3n4n37aTsURsMiCLWCB8c9eZDvK//Wf+ggp3G1c62W/bk3fQYJ/qWV1
         AM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZI/lLtloM4Tug4sA61Civ+cVcFduOFVW5YccHSGp9ig=;
        b=KhIDk0StCiY/bgWKgs9u3VqJiCR+DXK28bu7kcqqZvN/TgobiyInUTqLPva2DnIu2T
         obByPMObf1Fy1Nb7TKab3AMXPLu3hTkwmm8A10Q7dfnz73RGnNxAX9t9jdbc4w/Z0OFi
         Vo8eipEhXebjxAt1rQ+8+NkMCuWZljpguOuYlIRiwV++Fo2g0vxf4QrqfnM0LSNvha8x
         WmXTkpqaBMiXExbbMdr1+Nmw/b91x72B5Zeb9qjyg3IWmgbVDdrYpGbLWWysbNyQ1YpZ
         irx78VSvUp6X466aA//m8fiSknSKYCDwkQSIZ9lzhkXYMyMQ5PqLrbV040X4O3dlf+wY
         lt+g==
X-Gm-Message-State: AFqh2kpDuXLvx/PLExd1LHNsMzhuxGlTcEKBwJ9obgv3dvRRXySoL7+V
        S8Bb9ZPecWxt8e8aJ9puzrdc261SpnqnDqPKilM=
X-Google-Smtp-Source: AMrXdXvpt552/j2eYpyiJEvx8Y8iUdWPP8nWFBZn584KDHLE94EqwOEvXHfAl0Y2Sy4/Ct53UZYcSA==
X-Received: by 2002:a5d:4143:0:b0:262:3647:c1b1 with SMTP id c3-20020a5d4143000000b002623647c1b1mr997538wrq.58.1671539820722;
        Tue, 20 Dec 2022 04:37:00 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 04:37:00 -0800 (PST)
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
Subject: [PATCH v5 20/21] arm64: dts: qcom: sdm845: Add compat qcom,sdm845-dsi-ctrl
Date:   Tue, 20 Dec 2022 12:36:33 +0000
Message-Id: <20221220123634.382970-21-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
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

Add silicon specific compatible qcom,sdm845-dsi-ctrl to the
mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
for sdm845 against the yaml documentation.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 65032b94b46d6..623e5d7dddfd2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4645,7 +4645,8 @@ opp-810000000 {
 			};
 
 			dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -4716,7 +4717,8 @@ dsi0_phy: phy@ae94400 {
 			};
 
 			dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sdm845-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.38.1

