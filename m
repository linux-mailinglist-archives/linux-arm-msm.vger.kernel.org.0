Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA617AE285
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 01:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjIYXhS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 19:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233536AbjIYXhR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 19:37:17 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05232139;
        Mon, 25 Sep 2023 16:37:11 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d81f35511e6so10937163276.0;
        Mon, 25 Sep 2023 16:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695685030; x=1696289830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOE0MqTdfK+5W0JIocej+dK+oLW8KHrRynMU3bSabA4=;
        b=Hd6pp0dMpE/6RI/lDNe2r6u4ancj6H9Z1RR3ZMqEUSGyhlA9NYCxFmRtb8EbVRNJ2N
         zr1znV1DcbKh7Xq+0zb3sSBLiVAgCaykwq2WtT7AaNELVf0Uo6gnMOhwYJvMNbXuTYGd
         c2WmmCnYKS/DYdbWWzhxYSG2bjrNJr+JJ+hzJg6YsKeYYBwYy0T7jYNOo5zVm+pF6ARS
         mzhmq9YQhsdqE1iSyc4CTBzXs5m7RTSgdiVaYqx6O86GzkVyS93hmnQ4sybcq5F2fVdM
         gX0uv6JH7dsLrf2WsayyPxhvOSf2V0lTGLuQJyO6896fRgGCWa/qZOv4BhImmHsgrR5Q
         0Nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695685030; x=1696289830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOE0MqTdfK+5W0JIocej+dK+oLW8KHrRynMU3bSabA4=;
        b=jZRP8NiaqE9bighar5l3S+K29qMVfdn1lnbJSJwikYq420R8IsnlBI/PHcKF9NMplq
         nn6b4KM9C6rONS338yjUmI3Xg7vQvX8v7POvyQh3iYFqpSk2hQZUuGArlWTXDLTAXxOB
         U+5Xq8e0EDCjG9OeA6pk1nbuX7hYDvuwZArg4xoL88HRrqqRbYYSZ+HlH2NbX71bJ3Op
         ZopMgbJgjJ9V4+BqiFZq8/1f5aiRZNaM2XTe0slXkfs+D0sDQJGvclTpWLtZtc8a0NUu
         GKT1Al/m/7DEQcWwPJ/oJo+mLzvqbG82pJqL7B+yNU2bRvuq9XWrAuVqFgMhxC2iTkDi
         BMyg==
X-Gm-Message-State: AOJu0Yw8JpabZve4DxgwD7tzID/NHxjGG59jxETyUrZJUpTH2IvlrPms
        l42HQ52GBfTozmp5yk+Plng=
X-Google-Smtp-Source: AGHT+IGGzBj4FuKKpIGhZfLGCb0ql+2q5qeKNbIDXNAptDgJjdL7AxM4cOTP1bJxUp4T5DDlu8KkAA==
X-Received: by 2002:a25:ae05:0:b0:d78:6ef:9178 with SMTP id a5-20020a25ae05000000b00d7806ef9178mr757342ybj.17.1695685030214;
        Mon, 25 Sep 2023 16:37:10 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
        by smtp.gmail.com with ESMTPSA id x8-20020a259a08000000b00d7b8a1074d4sm2337096ybn.57.2023.09.25.16.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 16:37:09 -0700 (PDT)
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
Subject: [PATCH 2/6] dt-bindings: display/msm: sdm845-dpu: Describe SDM670
Date:   Mon, 25 Sep 2023 19:26:29 -0400
Message-ID: <20230925232625.846666-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925232625.846666-9-mailingradian@gmail.com>
References: <20230925232625.846666-9-mailingradian@gmail.com>
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

