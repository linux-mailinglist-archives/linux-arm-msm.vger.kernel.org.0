Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2990B634AED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 00:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235282AbiKVXMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 18:12:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235289AbiKVXMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 18:12:42 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CA713CEF
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:12:41 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id j16so25720736lfe.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 15:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6yfa/gbbLb8r9CDdFD4rR6qCDT67lUql/3o3mSvJqo=;
        b=WlcfOapqTEQmXO05S/sqfsZV1/ZIf2CwSTJo8Ayc+MfGHSlQvV4A0WRY3mGrL0Hr4C
         AKA5wpUkuQaW719bCPlCqHuPLbVg2TW+Ur7tAq8B7k5ILEEJpOyMQ3Dy0kxZLNwNreRY
         bpazKO2XgpTb/ZMTwEAfeOwhoxn4WKs9WKmo5HE33K+YCuC0eGrXJAGmxNsN9XEM0vSo
         Adpwh09QDsj2BynnMiRgmWb00nfIzUMWesNWBlVukjXsjTQ6CxtPM/h5OVS+MvwSc98D
         omn0s0ikdloPKo3LX1ZO6+bqbZiKNJoDrlcQuUVYgIPo2paN6OtSGHZNOQg5xWtJc6QK
         pg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6yfa/gbbLb8r9CDdFD4rR6qCDT67lUql/3o3mSvJqo=;
        b=JEF8jWI9rd+BzOLMMT62pnp+tqomqvvXbbYtVLNNZlQgyg3CnIDrX1Y1xrlONCGYas
         0oDybLbDGgIctqZnIhT4YWpB1yzhHsQ4pT7CgQFcx98hlXuaNFePo4968G8mbUCeT54R
         gNNaIExKIMGWdDM3YuoNEdOlfV1uv38vYC2wmP43KY3llMxJnZzpquIL5cV9JHBrYoDi
         0vq2KWNcI8lOOjldRdFqf/N1Z7Zsq9RKI9mrB8U2El6K4gZLit5TUV6L95l4/4F7EwAZ
         hjfPR2sshIHQTgE+wWTdNsUjrk2dL3OPDnITXk/Gsd4+znyxXSy3Dy5FFpO6OxQluBMS
         3psA==
X-Gm-Message-State: ANoB5pnrGwJ4X3Lis7/tJ2si3+cehkyUJgIF4nca3QYkI0f8AACevaRj
        lkps6+s3zE1B7WFncYwkDvNGkQ==
X-Google-Smtp-Source: AA0mqf6M//tJi0iqBqqzJEX/ky3XoQjCwZq2azXmC4OveKdON/JsF6RhuaqFB/vGoE4SY6R8nbl0Gw==
X-Received: by 2002:a05:6512:5d3:b0:4a4:1cfd:c4ef with SMTP id o19-20020a05651205d300b004a41cfdc4efmr8931501lfo.678.1669158759519;
        Tue, 22 Nov 2022 15:12:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
        by smtp.gmail.com with ESMTPSA id q18-20020ac246f2000000b00497feee98basm2617541lfo.274.2022.11.22.15.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 15:12:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 04/11] dt-bindings: display/msm: add sm8350 and sm8450 DSI PHYs
Date:   Wed, 23 Nov 2022 01:12:27 +0200
Message-Id: <20221122231235.3299737-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
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

SM8350 and SM8450 platforms use the same driver and same bindings as the
existing 7nm DSI PHYs. Add corresponding compatibility strings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index c851770bbdf2..bffd161fedfd 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,dsi-phy-5nm-8350
+      - qcom,dsi-phy-5nm-8450
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
       - qcom,sc7280-dsi-phy-7nm
-- 
2.35.1

