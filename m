Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B0F7B5E8C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Oct 2023 03:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbjJCBVr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 21:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238955AbjJCBVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 21:21:46 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD1DEBD;
        Mon,  2 Oct 2023 18:21:43 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7740cf93901so29948685a.2;
        Mon, 02 Oct 2023 18:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696296103; x=1696900903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIKmGdB/3utN+fo5YOdVXRGf1bdkoiZsUcVvijZ0k1o=;
        b=fsFpiR57qHAnne3+iM0n+KMC4bxMuR80gUy3Fib3I4nxMpxkkkwz7L7U5H6kldOyhh
         /mrkOA+bthKGCD85EDC9XQXxorWIvXwq/2we8LJBeDK7YTIubc2L8BsbmP6yPZRawE+D
         F7FhCp+pOVqIuqrfbPUudn9FEIzwUCoe9TA5fbiGgPb8+VGcr0UPBcecZDPyXNBRdHRL
         2jgXfR39Zg0RQjLe/DVaZF6jiR2jaCXq0ycAAkISbtF6N3Cl+fQsHdDhXqGUQ26x/enW
         mgXDif79B/FHfW0rz7sPcqcblFN9rH1gjbmlxHSIW2lblwMNDvolScT5Pq0Thl2kEzYr
         PWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696296103; x=1696900903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIKmGdB/3utN+fo5YOdVXRGf1bdkoiZsUcVvijZ0k1o=;
        b=dRImZjfrZL2HW0zt7yslTtCvGzV0xktuevWnNoZiXs1SjA+GBQlGt/Z6STUl+ukN4A
         FcZavldvw4lXZydCquwO7JJ739ol4CxW45fyRCYnTDFoUzVHFVZfBN5W1uy+tzxxk97s
         TXZQ4GNeynnBIQlBTsJSvKF2o4L1aX5wB1ZC846zd7KRPWADFY2kv4IdduOLaiJ6QtFB
         0xSXQy8V0VaAcmVCR7yGx4gmvuUh1Wy9Tju7RP9NfyNLrvoBndgOtK1r4HuC9vKdQDu2
         RYkzLrAMKqwayxMFTMX78ePfe8bkOXjpVvPYxq1G72zwLtJA/DODHJbARFFTINWOeGis
         XcNw==
X-Gm-Message-State: AOJu0Yx4GCsss8K2rnptghF/3KfSzJpp/sIN4yIT8WSIETlkDGCAi4L8
        aJGoFNAYkVjClDXug0xXUMMdB+4b06w=
X-Google-Smtp-Source: AGHT+IHNw8OGFUKkkjiEB8fAXFWK2G4+EKx2/dfUGfePzwxGu8lQ/VgsWBi879Zgmova1OXAa/z7Mg==
X-Received: by 2002:a05:620a:15b1:b0:775:7e16:2cdf with SMTP id f17-20020a05620a15b100b007757e162cdfmr11749871qkk.39.1696296102740;
        Mon, 02 Oct 2023 18:21:42 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
        by smtp.gmail.com with ESMTPSA id b7-20020a05620a126700b00767d8e12ce3sm52577qkl.49.2023.10.02.18.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 18:21:42 -0700 (PDT)
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
Subject: [PATCH v2 2/6] dt-bindings: display/msm: sdm845-dpu: Describe SDM670
Date:   Mon,  2 Oct 2023 21:21:23 -0400
Message-ID: <20231003012119.857198-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003012119.857198-9-mailingradian@gmail.com>
References: <20231003012119.857198-9-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
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

