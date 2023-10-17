Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 885A47CB849
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 04:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjJQCSw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 22:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232785AbjJQCSv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 22:18:51 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03922A1;
        Mon, 16 Oct 2023 19:18:50 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-77433e7a876so368007585a.3;
        Mon, 16 Oct 2023 19:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697509129; x=1698113929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIKmGdB/3utN+fo5YOdVXRGf1bdkoiZsUcVvijZ0k1o=;
        b=l1jdn9C1iw3B87qzzgsnUulHoZaejoze1VxGmTPvPzXPxY+NbieRI8xEKJpPDPtlEp
         TjNGPU67Kd4u6JstH7bnFAQwpFU6vm0Ua0GGzgSg24NY3x+aDCMLJ5DHw6wgv2VqrwwK
         YRSfGtS3nbwpYeVvMJ36m+QuZjLnEAIkPJYBkP5ieY7xw2EJ6UCgJDe2Vu7NJCNF2tdj
         OnRSTyqj0f1eRo66qeM40Vt9l8DgbOv3Cu8Z5OSG8p8EQaghfcbGKtkDs+QCuY/daszS
         dY8Xl2IKT9yldBBOEogYxhele0QQp/o5SICMi5hlmbVbtxVLs+W4hkrkF0bnZrzheFIx
         r2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697509129; x=1698113929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIKmGdB/3utN+fo5YOdVXRGf1bdkoiZsUcVvijZ0k1o=;
        b=OATzmApCd4gs5mHfkZWUqWByzF7iBVzMkZlv3lc9Zz0iOi+RGvFzDQ8o1wJv/LsnwX
         +8dKOCRjjeAXMOnFTVGZoIiJuQoj9N091Va57O3mE9ItCxoLObYXbz9Cn8os2+OpNtN9
         98CwYAmPta9E2sVtBvFEUirSOWUgON9f01WcuD4TldOs0ulO2dmAFyphli9RyyjABolq
         jOuaoMAlWsFZ2YL+u6+nVoWz6vzp0fGmUEMM3BzCwY2ksO0QGYSR7XD6UgDGpRICnr3z
         pboHfYMdKotI1tRdxZ1ZKks4IB6uJtOVZH/8hN1WZLvI1D2PsQqdhBWK71s16RswOw8V
         uFzw==
X-Gm-Message-State: AOJu0Yw7G0H02tMQgPv66XoW+DBVTC1bugjLA8Har7HSZzflBAx26OxW
        BVM+3mvIXA0owBVFkSMcX/w=
X-Google-Smtp-Source: AGHT+IHpRD3a9ueahU+jRZLNE34fhI0ZI8veKo0aNfBNElwBxT6JyjTInXYGTu1Yvsw4H8hWRbm/jQ==
X-Received: by 2002:a05:620a:1aa1:b0:775:7f6e:1af7 with SMTP id bl33-20020a05620a1aa100b007757f6e1af7mr1170399qkb.24.1697509129074;
        Mon, 16 Oct 2023 19:18:49 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
        by smtp.gmail.com with ESMTPSA id s4-20020a05620a080400b00775838e79f8sm245591qks.134.2023.10.16.19.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 19:18:48 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 2/6] dt-bindings: display/msm: sdm845-dpu: Describe SDM670
Date:   Mon, 16 Oct 2023 22:18:09 -0400
Message-ID: <20231017021805.1083350-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017021805.1083350-9-mailingradian@gmail.com>
References: <20231017021805.1083350-9-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SDM670 display controller has the same requirements as the SDM845
display controller, despite having distinct properties as described in
the catalog. Add the compatible for SDM670 to the SDM845 controller.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
index b917064bdf33..dc11fd421a27 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
@@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sdm845-dpu
+    enum:
+      - qcom,sdm670-dpu
+      - qcom,sdm845-dpu
 
   reg:
     items:
-- 
2.42.0

