Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBD36711BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 04:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjARDUd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 22:20:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjARDU2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 22:20:28 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4176521C6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:20:27 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ud5so80131397ejc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 19:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fqxXCRMWUpX9mz5WAQxvM+x2hdkUx8K3aD6Kwx9JWK0=;
        b=Vrxm+BaKUW7drwnQMkZl0L5zgktqfdhc5QBgrqW4OhcWixP8Oa34SJU3K7L/ob7SGX
         ivySSdkdp6unYI9GRyCLh/AMyR57Aw1Nkr7eDZMSHB6yje+uGyz3A7DYbsCNmoiUT24z
         BaPaP3sb3tBI2VEyrehlMaGvlBd9/7cQzKfTK7NG/oH7sxk1tzWN7/uT4xKoAG2dk05u
         YdN0v3nNRXYLv+5rMQLCL+f7DaeU3NOLUCyt0uhXBoGPCiUE1wW43M3E/Z7KcAFXO+Om
         whnT0nXMUFIqY8aCBvCgZbqKUeEB2Xy0bZLwtVgqNGt4HiIHnN0gYn+JP2FP2iEvexLS
         ts+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqxXCRMWUpX9mz5WAQxvM+x2hdkUx8K3aD6Kwx9JWK0=;
        b=Zijj5IIkJd7ts0ICyK+TKuqiSUKw8+ge3XA3BlHj1eyeGjuTnsc8FwkcxwbeBxtMv0
         9Qr0K4PFhNGoWcSDqu8YzrC0M0NsJNjZuiisBADnF1WJBqTKSxzteANNQItCH04D3G1p
         6UEjuIvuRhvx8qJdtk/a2O5WTiIXgI/hUe4KTDnE2O9iQR00q/f7Cdjiy6L7m7s5fDz+
         zUskUeSJG3v7mrcubPosdWo/S/BZd7yG6FD6Ud01p2Jy6K9XncrgSqhablToDLyhiBMQ
         83Vf28ltmqrM35eHMJvHbXHzkNPkpthJZ7X9CA16cQqj3iGHh3IXfOmB+E2IwHkq/LCp
         Sb7Q==
X-Gm-Message-State: AFqh2kodMWXe1wuF5PhvjVxHZUiw2quNQLEeKZuLBc/lU9HZdV5HsAAk
        NpQPFxRD23nX8BnIiyvffWVbuw==
X-Google-Smtp-Source: AMrXdXsPlqnmJSh/9i3ssUfdZIrIq/56AHP8tZA7qU5AK5epPxuuKnYq5TUQHuvBHjMl8efcGuCF1Q==
X-Received: by 2002:a17:906:6a27:b0:872:8c97:db27 with SMTP id qw39-20020a1709066a2700b008728c97db27mr5499157ejc.69.1674012026448;
        Tue, 17 Jan 2023 19:20:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hu16-20020a170907a09000b0086ffe8a00fdsm3766670ejc.84.2023.01.17.19.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 19:20:26 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] arm64: dts: qcom: sm8350: use qcom,sm8350-dsi-ctrl compatibles
Date:   Wed, 18 Jan 2023 05:20:24 +0200
Message-Id: <20230118032024.1715857-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Add the per-SoC (qcom,sm8350-dsi-ctrl) compatible strings to DSI nodes
to follow the pending DSI bindings changes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 703ba3d81e82..a066566b6ea9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2883,7 +2883,7 @@ dpu_intf1_out: endpoint {
 			};
 
 			mdss_dsi0: dsi@ae94000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae94000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
@@ -2978,7 +2978,7 @@ mdss_dsi0_phy: phy@ae94400 {
 			};
 
 			mdss_dsi1: dsi@ae96000 {
-				compatible = "qcom,mdss-dsi-ctrl";
+				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0 0x0ae96000 0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.39.0

