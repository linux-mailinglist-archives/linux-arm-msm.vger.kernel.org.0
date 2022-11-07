Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB8A262041F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 00:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232900AbiKGX5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 18:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbiKGX5L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 18:57:11 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642C127162
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 15:57:05 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id z14so18517637wrn.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 15:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKuGmPk1NWjFYE6G+xAiV43cbF23XemWP+03+XF+NtI=;
        b=A5slQpahUTnb6aWaJNgpTrX++hsgRb7B8m1RFqmJMYSGjDQnHdS3vdMBMDH8xmqFrQ
         DfaXqX4b+uUngPKVn+7B2dSfKsW9GlabJJlSxjUiLBOgSOBS8rIoHc4sc4FbtTc+YjDa
         +tkE0HwjdiXFPglslTvWU4GE69DixukEn0Za9pqqiPmZUj/4aL+rlu0eNc5IJqWY6cXD
         7OybnSeQF0zFTDo0Ucs8rw8sb+9rpAmXsLHUvjIicKqfZDvWRjdyufRVgr9poKddbcOA
         ouI8Mkmuhb8BH0IuaC/hzzrCSOF3Bl7HlQoWRa8bMbGGZW9FthFF+WHbHg/e2l7pxXkt
         xY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKuGmPk1NWjFYE6G+xAiV43cbF23XemWP+03+XF+NtI=;
        b=t97SQCo0WGVikNwkbfpQ+6Zm6yi8VLLUy6dU1mNbpYTLI5TcY2bUep+mLWCI0ARhS8
         kkw2KtUEWB1hZHK8ruUpa2mJDyQVfhUQFDS1EAwjbTj9mNwjoDczWoq7A4FIQuZkalpD
         k5gdizXovPGmqyrEvavuEd+Q8upT674h6l5+p18CvMNps5+NK/3QqF67JHq/P1FsU7DC
         iiN7ZAM3fjfuyiRPHVGfx6UEfp4MfTTQ8/hPMXzTkQzCY91qrHQikEoq3NmRkl+CciaQ
         RkksBD8ioj50qG7HMFiMhQoYwDkddsa3VuU89RWyOujcoc3smvOC6T2PXF5N9mVE8YQu
         vNOw==
X-Gm-Message-State: ACrzQf03rGaCWcvKymst3gFE2jRRp/gIikvZpIJtk37Wc1s5nludXwMO
        2nyvt1dxWhnS10KkfYg7oXOXxg==
X-Google-Smtp-Source: AMsMyM6zX41cbM0aON4aZqPSWqm7kQ9bn/74+MZykNz0SW2DqRu3GdEhlzlP/3XpxN+bxJxA+FBGNA==
X-Received: by 2002:a5d:4f05:0:b0:236:a65e:3762 with SMTP id c5-20020a5d4f05000000b00236a65e3762mr31983928wru.156.1667865423999;
        Mon, 07 Nov 2022 15:57:03 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b18-20020a056000055200b00236545edc91sm8386161wrf.76.2022.11.07.15.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 15:57:03 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/18] dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC
Date:   Mon,  7 Nov 2022 23:56:43 +0000
Message-Id: <20221107235654.1769462-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
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

Currently we do not differentiate between the various users of the
qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
compatible string but, the hardware does have some significant differences
in the number of clocks.

To facilitate documenting the clocks add the following compatible strings

- qcom,mdss-dsi-ctrl-apq8064
- qcom,mdss-dsi-ctrl-msm8916
- qcom,mdss-dsi-ctrl-msm8974
- qcom,mdss-dsi-ctrl-msm8996
- qcom,mdss-dsi-ctrl-sc7180
- qcom,mdss-dsi-ctrl-sc7280
- qcom,mdss-dsi-ctrl-sdm630
- qcom,mdss-dsi-ctrl-sdm660
- qcom,mdss-dsi-ctrl-sdm845
- qcom,mdss-dsi-ctrl-sm8250

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index b35130a77b43e..9db3e63acda3d 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -17,6 +17,16 @@ properties:
     enum:
       - qcom,dsi-ctrl-6g-qcm2290
       - qcom,mdss-dsi-ctrl
+      - qcom,mdss-dsi-ctrl-apq8064
+      - qcom,mdss-dsi-ctrl-msm8916
+      - qcom,mdss-dsi-ctrl-msm8974
+      - qcom,mdss-dsi-ctrl-msm8996
+      - qcom,mdss-dsi-ctrl-sc7180
+      - qcom,mdss-dsi-ctrl-sc7280
+      - qcom,mdss-dsi-ctrl-sdm630
+      - qcom,mdss-dsi-ctrl-sdm660
+      - qcom,mdss-dsi-ctrl-sdm845
+      - qcom,mdss-dsi-ctrl-sm8250
 
   reg:
     maxItems: 1
-- 
2.38.1

