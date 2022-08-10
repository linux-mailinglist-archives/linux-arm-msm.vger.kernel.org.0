Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D50FE58E5A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 05:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiHJDrk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Aug 2022 23:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiHJDri (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Aug 2022 23:47:38 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22ED7FE5A
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Aug 2022 20:47:37 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1168e046c85so6602186fac.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Aug 2022 20:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rxO1yJUE3IlkLApY46vIfgmzfPEQ54X/NIOEVG3JrrQ=;
        b=wZnC4appiqNUEiQGmLWSwEltHJUt+9QDq46haOzM+ed0GT2SVOeWxlwCGYGOAAr9Ly
         u4WzjVgE6vTJI3VlWMbdo8iq5hE8Tsu4wUoWaO3m0PoSJoQ1EfYGIdUbtZIY02vB4t29
         1z9Gs1IwzuzpKJ9jGqIXWKqCzFPLzu+wC1Nz+fdIAytGCkyyjWsQRZeBib7Ra95+sFac
         eyhw9vzbJmqEqy2hZ7XtmYSKxDvOcVlAVFs04yDetvqqnsX3YIJ1a63zAhb6/SzYah0F
         GexPGZ/Am0SsnZQ/OQTN/62QJgzI9BJ+KEtwl/pNKxM8cjzOY5pCXvVOOm3ExIjIhjL/
         FBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rxO1yJUE3IlkLApY46vIfgmzfPEQ54X/NIOEVG3JrrQ=;
        b=7AxzqHjjMY2UoClsb8Jvd9ZwTto6+R7/qQwg7axfDOcrsD0J/Fsxvfnd8ZNX0kP4Wn
         D5rrz4yMRYcmCc6e93v2YyfFxPB4754WoaKDlJEgIaPBewXJEKkc85CB3Hr3HKJEDWa4
         TBs5V3OHmjT8Eiqm4zgjhEqGt0Ad3o7VL2Nr8XkJyES4rEFhhpzEiwL+8ZacvfDI6e/k
         9098MeN5jeMgvkzcbZDrQNq15YZYdJStstqlxov8s36BI3S6RXb7l4mjOk4eyZz3Kdr4
         mlFM1iplJinLsQs0izkvxBopW+tsY7wvL8LaymUWkgI8CA78Jv5Aa7K8PfqbwY5/F3Kl
         g0dw==
X-Gm-Message-State: ACgBeo17b8XiQiZ+wduDHSEf1rbGOVXt/9dFLbcJCUyAzQkNBPHp4v/t
        aRV0c//RSa6RCQqFIhMIDtfMKQ==
X-Google-Smtp-Source: AA6agR5Fu2RRDv1UHVCEFfelP9y7yZj87HztXn4G3e065ctAs40MSp5H03fK49MziNwWhwN8ZkUhCg==
X-Received: by 2002:a05:6870:89a9:b0:101:d81d:e970 with SMTP id f41-20020a05687089a900b00101d81de970mr651827oaq.43.1660103257025;
        Tue, 09 Aug 2022 20:47:37 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n2-20020a4ae742000000b00444f26822e5sm454337oov.10.2022.08.09.20.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 20:47:36 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles
Date:   Tue,  9 Aug 2022 20:50:07 -0700
Message-Id: <20220810035013.3582848-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
Qualcomm SDM845 and SC8280XP platforms.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 94bc6e1b6451..90f9302d1731 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -16,11 +16,14 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sdm845-dp
       - qcom,sc7180-dp
       - qcom,sc7280-dp
       - qcom,sc7280-edp
       - qcom,sc8180x-dp
       - qcom,sc8180x-edp
+      - qcom,sc8280xp-dp
+      - qcom,sc8280xp-edp
       - qcom,sm8350-dp
 
   reg:
-- 
2.35.1

