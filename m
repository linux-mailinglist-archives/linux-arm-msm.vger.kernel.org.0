Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DEDF5A0D5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 11:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240771AbiHYJyH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 05:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240976AbiHYJxp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 05:53:45 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8D5AE845
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 02:51:44 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id d9so2818682ljl.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 02:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DmWp0uy89TPiPu8UitGlfJ4fqSkdwaIvyUKOGTjMH64=;
        b=F+XB9cd63aY9IouNoB5Mm0wxVzYEXXc//IevbAgG1v+ccxUbKvSfYbaM2+KG2wZhJP
         EA+ttydRKnlkqqNLTFaw+PXRZzuN0yn/1ivj0iJzfUVsdFlwkVmHvnD3/pmet6tcv7Vu
         VUAHdrYgi5HlPYnI19akMIX86ty09/ZCe3Mh8S6dhHcvtBCOpkST6qpTqZFCWXBo38vl
         gJR85LSm5HsGL4KnYGiD2/SMxm7qNsawswh8etaTtJNaANp7RAk9zrcEm5oXMdKxTXEt
         fj4On0YzP1rgRVfV3uzwDdT3VAwbzEryzc5RvRjJJJzBudLcB69C8ts9r1Uig4cawZAO
         j6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DmWp0uy89TPiPu8UitGlfJ4fqSkdwaIvyUKOGTjMH64=;
        b=tUTZz/JiLgmRPP0JfdCzi15xOeODa82w4vA3duuEsjDPTCrwwa2c0CtSJRLSzML/Nr
         EDufJgpnpOnuI0CCHRPOKRxVtBW54FPWEh2QRHvR/dw7PuYBHUrHa7Txx7Bm1OlGj1qF
         PxbNxiHR1dC56wM9orVJOoiOVNd8iEGp+aq9iG38P1UZE5ZdjaJW3InjRYHMqhnko23u
         UmWt4CCY33bsw8hkKd4OE8CeZ655PKyCFt92WX3rJwKrbXdfav1tHzpzkCNjB4E/00gw
         kHecidl8uaPtYMnSVXTbSejU/z8E5GWkcZzu5x2oAVjJLiZJaLT3y92giBeLKjNzWc/s
         Eh5Q==
X-Gm-Message-State: ACgBeo3nsi4D1D330l0hB56ijuoPY8dwBgk3lBHa5K9hhkNWpJ3sOnYH
        lZq+DEvRL61qjfYTI2OWz6BGZA==
X-Google-Smtp-Source: AA6agR6hyi4jQGGTPThz5bMq67PFnK9qnxRl0rMJwYMP8RA5+UGh7yGLAWfRmT/+N66e4+Li5MG7xA==
X-Received: by 2002:a2e:9e56:0:b0:261:7544:d79d with SMTP id g22-20020a2e9e56000000b002617544d79dmr917898ljk.296.1661421073687;
        Thu, 25 Aug 2022 02:51:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h10-20020a056512220a00b00492cfecf1c0sm398502lfu.245.2022.08.25.02.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 02:51:12 -0700 (PDT)
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
Subject: [PATCH v4 09/10] dt-bindings: display/msm/dpu-common: add opp-table property
Date:   Thu, 25 Aug 2022 12:51:02 +0300
Message-Id: <20220825095103.624891-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The display controller node can contain the opp-table describing its
frequencies and OPP levels. Allow specifying the opp-table in the DPU
devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dpu-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
index 14eda883e149..42e1616a5670 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -22,6 +22,9 @@ properties:
 
   operating-points-v2: true
 
+  opp-table:
+    type: object
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: |
-- 
2.35.1

