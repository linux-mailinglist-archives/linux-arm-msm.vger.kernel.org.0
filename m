Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F91658F94D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 10:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbiHKIno (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 04:43:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234618AbiHKInm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 04:43:42 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8239B90C75
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 01:43:40 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id a9so24610338lfm.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Aug 2022 01:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vOeegMXGcCHbbRD+atxt5zrggNZkNZB4nunNOkeVqiA=;
        b=G3XsN5ytlY9pQlvu3e2ZT6OBZKT9GMTPjcowDtYXCLVMAJG2LmM8fG9V4rVAFhNYgS
         1/uLtBNmFP8gdXpCaLwyTvX9c2ctEaPJangChcwC3nFToWT8oM1+fISfXijLKCv8aBSX
         Q6Ql2RqcX5pGHqVfjpc6XTcfemJyeyiCPHeuDi8DRPeQegAuggG5SvoaRx9A7pgFfrjN
         o+poyuRdlQwqrP50Qn0GgIFz0o/NsiYHxQ/fgsvViigxXLXIMpZVcSYuAhiZMaV63rHC
         /TV3IzySh5yRqgB1ZtTGeN/aJlDY1JGpxpFxlFTs+94ihNGIiqZJ13qYWLyZlvJQGJl4
         dRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vOeegMXGcCHbbRD+atxt5zrggNZkNZB4nunNOkeVqiA=;
        b=fYXA6dZkXvg6/5KUl4Bxw0cDyXk7KEUd+7qvITwrzUFM53WmtL8kNMVUQkfD5+CCaa
         WKFiIqFJ2VZLJ02AIiSbVDnm6+HFMuKo+9OEcqjqoFr3QP4oTJMgZHPHEc1LXyzAyXbb
         2b0ilkl1l1zoYbXwS2k52MLgFLWL88/8kovs1XrxEeWg8o33JKCN+PgHRqDifu5ObF6x
         4osB4xHNGBNLvpwigJJEtEU0J4B0Jmzv9Y4V7jGOebJ1uk71ZW8y2Mb3Mfh3vCb+/qI+
         Mnn7cffDatSxyEgXWB6Zf6CMlJrr7mJWpe+8rShfRkN3PNqqnm7bBRv/1f17ijzRCxVe
         aVNg==
X-Gm-Message-State: ACgBeo039rz9r11lhdprF3AI0Db0mS8DJusOgDkyXxEp/CPOHMq6FLiu
        FZf6UuC/xgQgmVP0cJ2fECQteA==
X-Google-Smtp-Source: AA6agR4cHk+mdaF84yKH3YO0DKq65UeXVHmrFM+5SpJMbXMEbodqBabRm+SzkYsLQUjuPw005WU8Iw==
X-Received: by 2002:ac2:4f03:0:b0:481:5092:ec8f with SMTP id k3-20020ac24f03000000b004815092ec8fmr11230018lfr.35.1660207418739;
        Thu, 11 Aug 2022 01:43:38 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id f4-20020a056512360400b0048af379957asm631077lfs.72.2022.08.11.01.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 01:43:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/5] dt-bindings: display/msm: dpu-qcm2290: add missing DPU opp-table
Date:   Thu, 11 Aug 2022 11:43:28 +0300
Message-Id: <20220811084331.83715-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811084331.83715-1-krzysztof.kozlowski@linaro.org>
References: <20220811084331.83715-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
opp-table, so reference it which allows restricting DPU schema to fixed
list of properties.

Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 734d14de966d..47759c871429 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -74,6 +74,7 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
+    additionalProperties: false
 
     properties:
       compatible:
@@ -113,6 +114,7 @@ patternProperties:
         maxItems: 1
 
       operating-points-v2: true
+      opp-table: true
 
       ports:
         $ref: /schemas/graph.yaml#/properties/ports
-- 
2.34.1

