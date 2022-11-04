Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4E86196D2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 14:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbiKDNDe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 09:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbiKDNDd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 09:03:33 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821181F622
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 06:03:31 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id b2so7332901lfp.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNrknjkwY6y7Nl2U9FfGOLqpO7+QERv2EXshAod3N+Q=;
        b=v0heW5S1Jn7iGCMqNDKVJf4qL/DJ0z8sJTh8IzmLrHaihk3vKDUNoB78z+Mgpv/GSI
         Ac7k/2QGz4IolW3GBdEogZxSURhotEJv1fazJHDzNpY29loarznugYLVjKNyW6v36oxC
         vquTkWKlonhinXx1gZlSAP2B5N3ckALJsMr76Jn0VrfKbLpQgzWCyfNZEniiOG6rvnPK
         m607J6LCHYRrQFcL7FXS3j7eGjdf2MgpN8PdbnEC9Xd43uRBvvy0tIv2dLy47NdWyXiJ
         DRUjiFyt8GJdN11lMXOrzaX+eg493NMWvdnNsDkJ7h5ADmju930sIZMDoOYy/FRzoYyN
         f0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNrknjkwY6y7Nl2U9FfGOLqpO7+QERv2EXshAod3N+Q=;
        b=hAEvvpsveWZsib21T6oXnGzkNLe0fQpUJ+WVuat7zqax5aVz9yAy+Su2YZFuZLc1ed
         d1lJV9dY6lD1d8AhEZdO4ibGHJEJC/oZgfE7tgst0GmgWRr26bnzmgV43ifg1N72a0kx
         YeFq3b+DkRJuZAfvoKirIDYWZ8vLaxrG+n8x4UPofBCRpypVX6A9dG3wLPiaGsaFcxmo
         AGlcBoLygy5uJacaBe3d9QcCNgKh63PJxLaAOIXYm+xlnNC//y6zWQ8JY7Ndd37dtfaw
         aPAUCOJZEtt19cF17YkooYMfnGTusqhwv7Xx6nERP4PaemXQKbx2I88idMBv/PoveJpJ
         3how==
X-Gm-Message-State: ACrzQf2WnhTO/hduZSeQ/PRDPVHDYA1ymJn8Qhj5ybU7k9lvdXo7jisF
        ZtYHgwREPqkhqu9o5Rzn8mr1Iw==
X-Google-Smtp-Source: AMsMyM4OhY9/soUr3/Yu6/mBlVo1w6eYUp/ojteavHzsT/k8xoq6igsCEFJ2PP/9/dtHSu6sdgKLZA==
X-Received: by 2002:ac2:4c0f:0:b0:4af:e7d3:e97d with SMTP id t15-20020ac24c0f000000b004afe7d3e97dmr12943317lfq.467.1667567009346;
        Fri, 04 Nov 2022 06:03:29 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id s6-20020a2eb626000000b0026fe0a052c5sm419975ljn.129.2022.11.04.06.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 06:03:29 -0700 (PDT)
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
        freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/8] dt-bindings: display/msm/dsi-controller-main: allow defining opp-table
Date:   Fri,  4 Nov 2022 16:03:17 +0300
Message-Id: <20221104130324.1024242-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
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

Allow defining DSI OPP table inside the DSI controller node.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 3b609c19e0bc..c37dd9503da0 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -80,6 +80,9 @@ properties:
 
   operating-points-v2: true
 
+  opp-table:
+    type: object
+
   ports:
     $ref: "/schemas/graph.yaml#/properties/ports"
     description: |
-- 
2.35.1

