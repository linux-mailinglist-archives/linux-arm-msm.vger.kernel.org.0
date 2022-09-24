Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A92035E8C74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 14:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232550AbiIXMgT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 08:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231244AbiIXMgS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 08:36:18 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CDEDEBD52
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:36:17 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id l12so2747281ljg.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 05:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+VYxtSYA5OyiLl7gExkakIULMtqhutc086nOHC83lPk=;
        b=Pk42gobi31Pm88gcWY0dliXVdoXZB1oWlCvEO8Nz4ebyNe4xlnzz4xgJ+0I/DrrVZK
         4P5L+rY4aP24dF7TFUvHDbH/cNECmIkbpy5vPFLttoTVEEOwvAo6eLvM/s1HTa/Fl96S
         2A7Bx0K5/XWZr19eYlE9tM0NjLcvBKdUz1rur+l3EpccsCsHjvEYG0ZYflsul1sk20iA
         S5hNnxBIXJsfZNFPmKlwxrdGCo92MBP5VOwdX7p/95L9WIsRPj5nD56BX5BGUeijlEDn
         ZyzXOutODty+Y2E2zTPEfRZHy080nsIVrXa6L57aXmtw4cg2dd8Pd4EFbaiqim13T+ds
         5hLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+VYxtSYA5OyiLl7gExkakIULMtqhutc086nOHC83lPk=;
        b=fDqBdVITsbtHgwOI3u7vA2xuXsMLZT9V7LqlXHzV4NdT0vv9G5IqOROoWP96RmHFm3
         HDUS1/wpYd3MvLlJrjo+NZIWc8tx6HK1w3J7Rn+dJcKajJHekVyffd7E9xYuhuUltXJW
         /Kwxzk9pKVqjThjQz48FLg85BXKhm+JqLuZhaYnn9yvpRGFSIWKv7VUcDY87wio2oAyr
         nQ5EqQ4z4ETWrF2dU00lpeQMxjsUdyrlpv93qHymPX3bWCnvTXKg12njovWeuzxSiQE7
         JL+gfgeYMy2Z5FozOqJ1p/BZ4pZi+/0M6evAfL7H9CiLXwORD7Qd//+z9RbcQRmYOL59
         9ILQ==
X-Gm-Message-State: ACrzQf01rd8Hvc5dTURi24NWT67D7rVugaf5eEjSi1DheF5hD/A8yE0P
        rqGrPtt5A3SxBORcg/bCLaaSNw==
X-Google-Smtp-Source: AMsMyM51NES3RCACwNbkEyT0lYAlozhLRWFpnLns2BDFA5C0F1f9eA/hhnH/8ncrW25blwnsjWzGMA==
X-Received: by 2002:a2e:bc28:0:b0:26b:d979:fc72 with SMTP id b40-20020a2ebc28000000b0026bd979fc72mr4757161ljf.292.1664022975566;
        Sat, 24 Sep 2022 05:36:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u18-20020a2eb812000000b0026c4113c160sm1707269ljo.109.2022.09.24.05.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 05:36:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 03/12] dt-bindings: display/msm: add interconnects property to qcom,mdss-smd845
Date:   Sat, 24 Sep 2022 15:36:02 +0300
Message-Id: <20220924123611.225520-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
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

Add interconnects required for the SDM845 MDSS device tree node. This
change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
Add interconnects property for display"), but was not reflected in the
schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 3cb2ae336996..a87deea8e9bc 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,16 @@ properties:
 
   ranges: true
 
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from mdp1 port to the data bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: mdp1-mem
+
   resets:
     items:
       - description: MDSS_CORE reset
-- 
2.35.1

