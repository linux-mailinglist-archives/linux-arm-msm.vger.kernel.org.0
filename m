Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6126E5F12AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 21:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbiI3TbG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 15:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232153AbiI3TaY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 15:30:24 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5454E864
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:30:12 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id o7so1067304lfk.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=GJ8jipC4Qtr73OxvWkLL0z7JLAO3XeJVdGRbttk7Bns=;
        b=G4BUUDRW+DSCw6H3Wn4oPeCUI0IBwg2gOwF4G3pf7fa7wWlajEXipyqEfB9FDzrkQO
         jlOQUZcFTeyY2cp9FX8ecxsTVv9/VBcDy58YVi8xfULWls+tEau3jUGxm1FmoZg7y/fN
         The6u3iJKU+89Vdeo1UusPT2Lz87Vv1C0CktDVm/xXRmiYOIaNW2vW1VOcszM+NcnZTF
         eT6P8qxUd4MJAFDwy9vKRbBPxAnwuuHiaYhZmFu9TnvyP/359YxEEmKbv0RbIESIqRio
         JXmZqSAEP7UAJEY99D8ANlvVQI2JNc+ff3U8GSjNivFnsjYkBX/5eAsuvN78zrz7l86/
         36EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GJ8jipC4Qtr73OxvWkLL0z7JLAO3XeJVdGRbttk7Bns=;
        b=uIvUzrh1HnLGxNvNDIAnczyCy9KrhwBJROzX8vl7v2bYCXeWKNnisJYScsoQi6JIJR
         4DKzTfJo1rgm1rfHYMUDytAQeNyovCfCMQ1YfU/QAtgdxesZsi/6jaJn3M8lO3BKrktC
         2mSVjf5+psVUa7+IC65wer6WObHr5nOEzS4yy9U2/eyEgfWtvT4tSgT/2gcrCti1egXI
         9AgjeBUT4D26Fy9bmk0c4xJny9ZqVGpiWk2lcSPCMSY86wo2LZDr7G+P+EtGPXyEOQgd
         2YjJY29Ta1Mb86dbWDNBvss6+n8LxOfQf1BrdEyRLkzudmMqTiF5NHJ/kwt5LqUR14Em
         DC0g==
X-Gm-Message-State: ACrzQf01SjPVI9aCB9nV1Id07hXZ/LRp2jJjZFUcBPhzAlccnwQpnQ5m
        M+8wb2fDbLjt4/gP77E1eKa0NA==
X-Google-Smtp-Source: AMsMyM4R7zOCDF9Xyc9OFoEtSBu4ycGu636OKlKczAfxwUVAxT3xW89MZCOiTtzc9DgYRkhv6eaC4w==
X-Received: by 2002:a05:6512:3d94:b0:49d:144c:9667 with SMTP id k20-20020a0565123d9400b0049d144c9667mr3839392lfv.50.1664566212429;
        Fri, 30 Sep 2022 12:30:12 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b0049f9799d349sm393603lfb.187.2022.09.30.12.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:30:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 15/16] dt-bindings: pinctrl: qcom,sc7280: add bias-bus-hold and input-enable
Date:   Fri, 30 Sep 2022 21:29:53 +0200
Message-Id: <20220930192954.242546-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
References: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
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

The SC7280 pinctrl driver supports bias-bus-hold and input-enable, and
DTS already use it (sc7280-idp).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml    | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 4606ca980dc4..1db05c43d58c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -117,13 +117,11 @@ $defs:
           Selects the drive strength for the specified pins, in mA.
 
       bias-pull-down: true
-
       bias-pull-up: true
-
+      bias-bus-hold: true
       bias-disable: true
-
+      input-enable: true
       output-high: true
-
       output-low: true
 
     required:
-- 
2.34.1

