Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBD55B9BEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 15:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiIONht (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 09:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiIONhs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 09:37:48 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF9257E2C
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 06:37:47 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id h3so13844234lja.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 06:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=QnLPNe+iKM00cshOq1HEgR2lwUHyezV+b5qRTjwgLIw=;
        b=tV6z3grq1vzzmNrhOtUiZd9uwgE0I0J/+LPx/Z46mh1AZc0+yRFiy1ygnMIZIgDSWb
         MGI1/mq77N56Agc5mhTYWGuoGDcRivTEujMPmAHOvh1DjROrIyAAZ4us5ZY3r2TDCzn2
         tIsGG4jm31Js6rpS2CO5h0CwaagM/BUg1ZCKWXG06VnmwSwEfmzGF7MhG02CTS/Ns9bL
         2WyvryUvChMZJ5L9OCQ4L4uMkTs6GxIU1XSOUoPoLD+rVTVq3vC4b6uguJAIWszqbreG
         QHCQ4mQ7uM74Zn8VcEUv/IuZj5fK+l5oj6rMXeSBdwb1QcT7EIttJIfXUeRv0G2NkNrM
         Z2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QnLPNe+iKM00cshOq1HEgR2lwUHyezV+b5qRTjwgLIw=;
        b=yD2TcfV6ELcz2raDsjzginm9imPGUorUICLlYmRBwdEIGOUhdfXMJ1XFFyu0KF9qgb
         HmO8eToivcmK71UzJ5HPjf66RGTOWfYED9acT5Xum55HahCGFG9WxMKOrBY1ikVPgMwi
         SqEiwtMJLSF5RwFCB4Q2dgIq8I1l/A/cMufug79DuUxBKYpjE+b1F/7LjTo5CGSdGSqD
         UF5k72f/YPvE6Q7ISNcTYVD/teFo6BjyWN1BcwRERFpVBoNbUnaLLQ97EsT4kIotOu/2
         5oOCEWx4lZmjhVHSEYjGtIJqkf8TtmKLIunqfhTRuAJsNdmf1c95Of/+wiFA7Bv2JsbU
         VqLg==
X-Gm-Message-State: ACrzQf0ruv4nKGcTsrDyST49/HPHdEh0bHP6O08PUADWMIckyP0kR5xC
        mNmJ93mSl2fUC3AuXzz1m+sKow==
X-Google-Smtp-Source: AMsMyM4UD05VNVSpuNUyec7dDFdrKjwlOjPBwXubUGJVv/SN05yO8Ib1mfwD0wEoOmZeTs5yvTV8LQ==
X-Received: by 2002:a2e:a589:0:b0:26c:2a8a:4179 with SMTP id m9-20020a2ea589000000b0026c2a8a4179mr2013169ljp.288.1663249065931;
        Thu, 15 Sep 2022 06:37:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 2-20020a2e0902000000b0026ad753448fsm3142634ljj.85.2022.09.15.06.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 06:37:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v7 03/12] dt-bindings: display/msm: add interconnects property to qcom,mdss-smd845
Date:   Thu, 15 Sep 2022 16:37:33 +0300
Message-Id: <20220915133742.115218-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
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

Add interconnects required for the SDM845 MDSS device tree node. This
change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
Add interconnects property for display"), but was not reflected in the
schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 3cb2ae336996..a87deea8e9bc 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,16 @@ properties:
 
   ranges: true
 
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from mdp1 port to the data bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: mdp1-mem
+
   resets:
     items:
       - description: MDSS_CORE reset
-- 
2.35.1

