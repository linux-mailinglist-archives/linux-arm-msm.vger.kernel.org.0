Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 145815A862B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 20:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbiHaS7k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 14:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233141AbiHaS7f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 14:59:35 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80257BB00D
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 11:58:35 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id z20so15609594ljq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 11:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=gHw35hCInqQhuDYl7ZZa1qf6fa7wiZH9XT+GfWRFFMc=;
        b=qRvHlnwA6LVkDzsJ6CjbcOYi2iQzjX5f6LNNXOa1Ip8SFjLhyGZxl1ggp87I4MfXUU
         l/Y+tx1bAJEoj3umKgVSzTbis8AfANbZIncBSBdwULRhdg/9VMW/5Oj5reqrPvonQEIk
         sQClxm17oitW4ee2Urz+5uWb2y5cVyQis0hvWq02QVRJSqZhCoJ4pkrM4+yVUr8FnXQa
         ommH2+mY2CM7ka+5Sv6mw2zSQ52murEBjceXykz4hwbejOn3w1rQWS7YGlyLCdAUO4R/
         wfIDcZA7386oItcsBTB1BHvWcAJ+y3aFv1OiOMBOFjbr+DQXNNXu/VsZp40dTtD7kr/E
         sWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gHw35hCInqQhuDYl7ZZa1qf6fa7wiZH9XT+GfWRFFMc=;
        b=Y/bLv7kPZ1qD1WqwOCHn1KXSbYHULp3P7HKBP+aJHTKoKyUnm7K5pCCOJnBRckTji8
         c17GmCTPLo80YgU7aA7VLMwGIE/67hqs7f7HiYo4SfzUsUu0FXqi9DIo2fDQyqVYYWFw
         UAQzk4uFYpPrjuu/zvn2Iw72lYuyFgiu2qR2GyLmTgGuuoRGlaGw69GF6qWVo3tZE6JM
         ySi+TSovIDRBsIe/6MimEeIE58RkH19UQ7v89iOe+sLOnfjzFVqDyCWcLDAqqmuLCxjt
         nUqPYLhIRyUOxxGdAPtrrbLtaxT2dXfGQuHllkZ7aZipZoyBRCuXkxqfcPD3GN1pwjMy
         qXwg==
X-Gm-Message-State: ACgBeo0+up5VitPPOc74Samc/XYaJ/LVVmRSZjgdGnfzHNJqMYcbP4LA
        kibqK/+L7vM0uKYC2XOcvr0CTQ==
X-Google-Smtp-Source: AA6agR6sLCLNjJqipmBnxrIlnsSlI7nyjTjWVUXADThFGUOYWJMoMa/1tV68uuiKX65AAKOIaftWLA==
X-Received: by 2002:a2e:9d02:0:b0:25d:d6b9:b753 with SMTP id t2-20020a2e9d02000000b0025dd6b9b753mr8326405lji.344.1661972313805;
        Wed, 31 Aug 2022 11:58:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g1-20020a0565123b8100b004948f583e6bsm322422lfv.138.2022.08.31.11.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 11:58:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 03/12] dt-bindings: display/mdm: add interconnects property to qcom,mdss-smd845
Date:   Wed, 31 Aug 2022 21:58:21 +0300
Message-Id: <20220831185830.1798676-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220831185830.1798676-1-dmitry.baryshkov@linaro.org>
References: <20220831185830.1798676-1-dmitry.baryshkov@linaro.org>
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

Add interconnects required for the SDM845 MDSS device tree node. This
change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
Add interconnects property for display"), but was not reflected in the
schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 3cb2ae336996..ff19555d04e2 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,16 @@ properties:
 
   ranges: true
 
+  interconnects:
+    items:
+      - description: Interconnect path specifying the port ids for data bus
+      - description: Interconnect path specifying the port ids for data bus
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

