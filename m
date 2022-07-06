Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3A1568BC7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 16:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbiGFOwj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 10:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233615AbiGFOwb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 10:52:31 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D5125E81
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 07:52:30 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bu42so6503969lfb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vXi6F2VH59Ysan4BDfp4AdUlcPkLPDowInIn+GuvGdw=;
        b=hK2Oe9Wf4TgWPdYRY/ql5AAziNtA+NvPlRysTvW4VFmhUWug1/D480ktSh3FVjLjCS
         isipSJy/2JQOKcNzktqPSHgW3beSBpRoxYGZEdUSkwex+vrjtAvFBJ/wypDHtRsl+RuK
         RaehicsjHbV/2g1rCWDq5sL2Q3PYOxt3Mc22icHCyJg47YCK7GHWC0dasfegyJIz5IvB
         buk0Mynpk6Yh5uYy2uFbppqtpZmufEZ0p7s3jdocOSIkXMAy4DrkesI/H+DWXNoB39Xb
         tEFGPakv+dp4sfUa3+4+f2VgM3rBSAMfSvv7QnbswJ7HDtgb8cxXATTcKCHnk5cboZG3
         PvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vXi6F2VH59Ysan4BDfp4AdUlcPkLPDowInIn+GuvGdw=;
        b=QNVt2lyUUniMn/IYHac4Mt8XFE9HAMMfbLES6fntUZDfhugufNAmAIm/yt2QoLAHDV
         NbAbB95eUxqxFoStLifsuO2ge8mAzc8VxvsyVr9H0jdGUnzUlHr7LN4wRN0AZq5pBUrS
         448Wh0mDYZi5XfNiNOKrm4dU9ALUAIGQiLxU4znOvySaEn8FmDqTaOJ9tsp9/iX6pZPE
         KN7kME79U77krtYUrfXDz5agHjfcjfaVogt1e7oa3IUPuzdbAKiE57ZaeZWLWZYA2RaP
         BD/Y8mbtevT6cUunWwfVf/Tt2jQCFbtnEWzBBe0qBd3+a3QKuw7r3M/xtQ5u8p9qP11B
         B3ug==
X-Gm-Message-State: AJIora+cAKaXPRrSY2QxBih4MRtTx7emW9/TfFGS4LuHQWjKJP2f0uxI
        6/Z7/uRZ/MaTKFBOALbFsLOeIg==
X-Google-Smtp-Source: AGRyM1tXufqQv7dKCmxJenUnKtY5GI0T/veI1VtYXrKeGe18nnO0SqXXjGuVp5vwNK2VBJhTfJXrtA==
X-Received: by 2002:a05:6512:b8f:b0:47f:b8fa:20ac with SMTP id b15-20020a0565120b8f00b0047fb8fa20acmr28714517lfv.199.1657119149633;
        Wed, 06 Jul 2022 07:52:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v25-20020a056512049900b004855e979abcsm556617lfq.99.2022.07.06.07.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 07:52:28 -0700 (PDT)
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
Subject: [PATCH 4/4] dt-bindings: display/msm/mdp4: require 4 IOMMUs
Date:   Wed,  6 Jul 2022 17:52:22 +0300
Message-Id: <20220706145222.1565238-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
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

APQ8064, the only supported mdp4 platform, uses 4 IOMMUs for the MDP4
device. Update schema accordingly. When we have other MDP4 platforms,
this spec can be updated accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdp4.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp4.yaml b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
index f63f60fea27c..58c13f5277b6 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp4.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdp4.yaml
@@ -36,7 +36,7 @@ properties:
     maxItems: 1
 
   iommus:
-    maxItems: 1
+    maxItems: 4
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.35.1

