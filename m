Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9759056AD9F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 23:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236618AbiGGVcR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 17:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236631AbiGGVcJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 17:32:09 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5C032EFE
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 14:32:08 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id c15so23870346ljr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 14:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g6bqacWTPjjHFhRsWqJbDsVdZPKLV6uJiyhcths+p2o=;
        b=D3idN/ahpbAGCpkBL2rzgaEyQ1TIrb1+uPATnXA2dqwS8zUPdqYqe4CPzf1a3Z7AH6
         efTjks/bwKfxavNw8+z2KSteIFR9KodVqjk+zSzps7jbYdJh4OCF9OITA80xsjcYeqn5
         bPm39Et/XN0vGI1kgnFeJlgx4hT0CKt8jQWkIjUL+PFUWzlcJyfc455cdMH46UhZMGir
         cziZp5RhdQaFUHPaei/WbNnP9I3tVbZiZCvRV7Am5HC2ltPDhseamHHO++jyXH++5EDz
         K5Uu/E4rs8cow2D6MT3xTBUj5O/dn6e/4JsAI7V5X0ReuRbLYlAEPbSsynQzPyu1tbqo
         Sjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g6bqacWTPjjHFhRsWqJbDsVdZPKLV6uJiyhcths+p2o=;
        b=5f12TOFsqH++ZxuEIykWIWEGTlKIjhP/vzGFv52rLFcdbVIi5H6gaYr86VIMeLXa/g
         JvCdE3ZjBSxRljp2xXehA6yDglyqO2nhxPq/HfNxd9aMpS1q/e+lYfuGHkXQAsOeJSek
         v3PubMI6uTdEUPciINAo/cStFp8YJRftmJIlcwZFpjCT7ifudABBWv79ABHUf8AfMzCU
         ZIdr+6wk5sIkF8fRPCYKM9X1jhA95FJQ1Ug74FQ8+AV7TmFl4vYuULuj5Agc4doJzyo/
         SdJR91JcYF2VIBP3nu0QmWYlOFN+wrjOWiwy3wi1/tVRrn0OqcCLZ6K1DOdAwybp66uB
         eTeg==
X-Gm-Message-State: AJIora9ct3NT4oz9ON0Vcb1T/iyTCVdKHq9lzmRr7swxguzA464apuxI
        SMxaZumk90GMx7ZsK3YveWpwQw==
X-Google-Smtp-Source: AGRyM1sacladqzbG8GlUA/pcU7R2qRjDGR2pawi6m/WmFWatggQdqeMK61Fa9aR5YjMaV1FMKOVW1A==
X-Received: by 2002:a2e:96c1:0:b0:258:e8ec:3889 with SMTP id d1-20020a2e96c1000000b00258e8ec3889mr33145ljj.6.1657229526635;
        Thu, 07 Jul 2022 14:32:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 14:32:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
Subject: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
Date:   Fri,  8 Jul 2022 00:31:56 +0300
Message-Id: <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
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

The p1 region was probably added by mistake, none of the DTS files
provides one (and the driver source code also doesn't use one). Drop it
now.

Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 94bc6e1b6451..d6bbe58ef9e8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -29,7 +29,6 @@ properties:
       - description: aux register block
       - description: link register block
       - description: p0 register block
-      - description: p1 register block
 
   interrupts:
     maxItems: 1
-- 
2.35.1

