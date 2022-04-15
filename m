Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7564A501FE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Apr 2022 02:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348294AbiDOBBB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Apr 2022 21:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348276AbiDOBA7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Apr 2022 21:00:59 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AF44BA303
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 17:58:33 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id k29so6159795pgm.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Apr 2022 17:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6RfMGdKt6sT3pinBO9IrFwb5LdGvY5fx5UYNrjOQN9M=;
        b=QUiN9agZBCx+JMm2nV8wmIiDfq2R5CV9L/WWd5BOUKROTJsP+ECGlANoqFKYxztSPt
         Ufa5T3uTXygzI2EdQx07WtuFtCteR+GAXfmE7jwlZf6ewzHDEIvdv92ANG6/iIdU8/X7
         xuf791aM7WXod9YiZfpje2sxurBCWhuUj2YOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6RfMGdKt6sT3pinBO9IrFwb5LdGvY5fx5UYNrjOQN9M=;
        b=LKdT/Bvkiw7JVFub8IxTCJYpkmdiaGUen/gICe+1DaTcb22JnhIUAstk4lXQNooASo
         xHwCfqXhlAV8NR9Ei2FEzFucJgug7Qf/gKQMmHCa7Ar+Kv2dl2D2CEEUCzSxKyfx9JYe
         KMhAWynsrmL5KLpAj6HyguKaJ86AYTuA9zHcZDvVAMfo8p0rGUeljZVH/G3w/UQAxqam
         pEzdHukhrbYGGG4ctWp2AcsIO7753XXdl/xRz53g2aBccTkJwdk4vpdKRSWhrkPhfCyu
         gJ4Z7rdCT3x5jhx2VZXgbDoOOEc8Qj7Jbuum/bimAJHCeevW8Vaz7fTFqhrdXcfO/rdL
         YglQ==
X-Gm-Message-State: AOAM532uEDHOFb4kewzLJT7H16ku6A2rcuclhnlmRHbTf9N7+OCsj/8B
        v8xGZA79JD09LUolXD7XJRue+g==
X-Google-Smtp-Source: ABdhPJwgCOw+24ZdVI9uQ3hL6YBLZPeoQOXYUcxZ5CfZ5gHXXZWp3SoY7w7t7knho8uZFaLhh7ExcQ==
X-Received: by 2002:a05:6a00:bd1:b0:4fa:a5d7:c082 with SMTP id x17-20020a056a000bd100b004faa5d7c082mr6372675pfu.85.1649984312895;
        Thu, 14 Apr 2022 17:58:32 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:e3e0:734:f81a:d2c1])
        by smtp.gmail.com with ESMTPSA id f4-20020aa79d84000000b00505f920ffb8sm996704pfq.179.2022.04.14.17.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 17:58:32 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Alex Elder <elder@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>
Subject: [PATCH 5/2] dt-bindings: interconnect: Remove sc7180/sdx55 ipa compatibles
Date:   Thu, 14 Apr 2022 17:58:28 -0700
Message-Id: <20220415005828.1980055-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
In-Reply-To: <20220415005828.1980055-1-swboyd@chromium.org>
References: <20220412220033.1273607-1-swboyd@chromium.org>
 <20220415005828.1980055-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These interconnects are modeled as clks, not interconnects, therefore
remove the compatibles from the binding as they're unused.

Cc: Alex Elder <elder@linaro.org>
Cc: Taniya Das <quic_tdas@quicinc.com>
Cc: Mike Tipton <quic_mdtipton@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

I don't know who should apply this. Probably whoever takes the dtsi
patches, Bjorn?, because otherwise dt_bindings_check will fail.

 Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
index 5a911be0c2ea..ab859150c7f7 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
@@ -31,7 +31,6 @@ properties:
       - qcom,sc7180-config-noc
       - qcom,sc7180-dc-noc
       - qcom,sc7180-gem-noc
-      - qcom,sc7180-ipa-virt
       - qcom,sc7180-mc-virt
       - qcom,sc7180-mmss-noc
       - qcom,sc7180-npu-noc
@@ -68,7 +67,6 @@ properties:
       - qcom,sdm845-mem-noc
       - qcom,sdm845-mmss-noc
       - qcom,sdm845-system-noc
-      - qcom,sdx55-ipa-virt
       - qcom,sdx55-mc-virt
       - qcom,sdx55-mem-noc
       - qcom,sdx55-system-noc
-- 
https://chromeos.dev

