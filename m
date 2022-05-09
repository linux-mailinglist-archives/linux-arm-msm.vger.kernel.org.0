Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA9252003D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 16:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237613AbiEIOvY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 10:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237670AbiEIOvU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 10:51:20 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 726F324BB13
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 07:47:25 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id dk23so27302625ejb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9xRTrI9WocAtlulH6OCScXZ4ICM1Jp6yEojhtKo1MlE=;
        b=IcxXe3YOAgVNx9iZE1MzK3khoVKlhLo3o8CnfHO1XE31/CHYWK1u7sjG+FLAZdMzrQ
         D5OYeJ/eyxd3EdXmDlq2fpT6ts0ZWblq7G6+3C7Vm5VOgIvDGzcYygnGnR0i4SYRLtVO
         H8BVRqv3QmEKXn1E0yRO475DC2cBMf6Y/h/f1PLosLTXcz86Ae1O2O0vTtb/YZe8QPtP
         +7kG0+kSj+Vr4ApYFgJLRxeW+Ar8rmLyC7HtaWCLA8SRwNkSgFiQEmuzJkQ1jQlJGtRy
         rXzyTyuGTKE6csuq8zdtIsBI5pjEgeCdvepu7gZe6E46L9NGhyliHGaJGK0KJZ+N91Sc
         mF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9xRTrI9WocAtlulH6OCScXZ4ICM1Jp6yEojhtKo1MlE=;
        b=ZrVx9WSCAHNrmzookcac6u9J4de8wsavY/bpaJK19mO6A+bM99xaXIcuAQfOw441c4
         yfl2X8zFbAq8z0Wyranu2cgGvhHniPFTEwRflZSPVRpUAeSCguZtFAn8rhSf3/wllDnO
         GWO4Z+2z+SXs5tXYazWSkLIcQ/WOk0NmKVIRfzDZFWoS1f/cAA7Q88HuKJ41+UlGiZHC
         Ch+GQYxTAAVk6qnFHU0ppSKtH9Klh91aJtR9GKhO+pAecIKLmm5j4J7yQeCR9bVwdIy8
         yP43bdEJJlh9/CtBESsvvori1fYO1s+Fwa1bmMb/Kmz9fV+bLsvpSKqba5FnSlb19KmC
         oZsQ==
X-Gm-Message-State: AOAM532QQANEZ1NIz29HgljpROqWbXVuiEDfttMaByFHHMDPqVmc32RC
        NaocrBLFMKJbtXtHrOpcrkdH6g==
X-Google-Smtp-Source: ABdhPJyH2mzabaK/ko/NHtQYxwJwz5wtJK9y40PCttihpkD1MkIMrDLyJ3GIPC7RaVkk/udDlHi+uA==
X-Received: by 2002:a17:907:1ca4:b0:6f4:68b8:99d2 with SMTP id nb36-20020a1709071ca400b006f468b899d2mr15485120ejc.616.1652107644053;
        Mon, 09 May 2022 07:47:24 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u9-20020a05640207c900b0042617ba637bsm6451828edy.5.2022.05.09.07.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 07:47:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] media: dt-bindings: qcom,sdm660-camss: document interconnects
Date:   Mon,  9 May 2022 16:47:11 +0200
Message-Id: <20220509144714.144154-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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

Document the interconnect properties used in the Qualcomm CAMSS on
SDM660:

  sdm630-sony-xperia-nile-discovery.dtb: camss@ca00000: 'interconnect-names', 'interconnects' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/qcom,sdm660-camss.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
index 338ab28d5f3b..b28c8e17f158 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
@@ -84,6 +84,13 @@ properties:
       - const: vfe0
       - const: vfe1
 
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    items:
+      - const: vfe-mem
+
   iommus:
     maxItems: 4
 
-- 
2.32.0

