Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBB57CB847
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 04:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbjJQCSu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 22:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjJQCSt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 22:18:49 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0B8B4;
        Mon, 16 Oct 2023 19:18:48 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7781bc3783fso4155385a.1;
        Mon, 16 Oct 2023 19:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697509127; x=1698113927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/FjPGL9FZLD3HPQhfLZqhNvGFa7zL77tDFLRHXNnA8=;
        b=bleZ20Wj/tq/ymeVQ2aAprJYmBuc0hEDtC/Ho0APtqGLQHwhaMUIWZ9stS1jwdR8l0
         81JDltUZPxLuqutUy3wDhRUhdwM0yticr/7qjpAVR6cPQlko1HlC6v5TxXF2xuslynZZ
         Dh8quzo1TbtLazyfgEErpisCJKtGIGV7GgeXzhcY9O27IvCRHVFkKtMBhIy6WNbpqw84
         38Y6CqDTzUSuc0oU56tH73rW2w9ST382U2zv5BOwnCWI9nFHC2AX8EnrggVUf3us3MlS
         1K5BHrc9GUmnTS1HHan1HltrMZMhwJ5JxQ++G69wHTXDsi1Em5kWUKiTZ9EqVJbp2Q/9
         kjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697509127; x=1698113927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/FjPGL9FZLD3HPQhfLZqhNvGFa7zL77tDFLRHXNnA8=;
        b=n1f0/FJgUrxMsLYQFaKO2OLbO2Awn+LEcN+9N72ap62lvye8yGErZmBwES2Ae4YZp1
         4L5FzamxZLqd9b9Ib1iJbAxcSi6Nw8x/GFkAZ2bsuk1GuoolWgZjxi3PDRhvvGQXi3GW
         Y5/1VJGpR/ANZywCGF66rtfQsPD3eKP/YEagBP09z0JmFT+qnFeDLadCIjInfFuejnS0
         HbYQK07sBLc+YqFGsq1YWEmLGVK4VKB/ARI1qhLt29S8GalSL46Vp0kVqZOvhEV3391X
         r9DkqQzpMydYtGfuChnSISGquc4agv4bDbhKhtixUZRDLV6xua7n+ahD3z+Eso9FKyGs
         IsZQ==
X-Gm-Message-State: AOJu0Yyv70htVLmx4cb8KtI7wREEyzyYlDdH8isdWFXm9cFQV1/RKLn8
        nTILH7ep03zD5CTlI+rj2IvfzOg4pqyycg==
X-Google-Smtp-Source: AGHT+IHQoraOOoyj6tVbREUcQPV1tqXJduJzETutZzJSrZEjrSXoOo3h9yuz+x1/zrCB3KO/r86qOg==
X-Received: by 2002:a05:620a:3728:b0:76d:4252:95d2 with SMTP id de40-20020a05620a372800b0076d425295d2mr1036496qkb.39.1697509127288;
        Mon, 16 Oct 2023 19:18:47 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
        by smtp.gmail.com with ESMTPSA id b5-20020a05620a0f8500b007776c520488sm256505qkn.9.2023.10.16.19.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 19:18:46 -0700 (PDT)
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
Subject: [PATCH v4 1/6] dt-bindings: display/msm: dsi-controller-main: add SDM670 compatible
Date:   Mon, 16 Oct 2023 22:18:08 -0400
Message-ID: <20231017021805.1083350-10-mailingradian@gmail.com>
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

The SDM670 has DSI ports. Add the compatible for the controller.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index c6dbab65d5f7..887c7dcaf438 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
+              - qcom,sdm670-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl
-- 
2.42.0

