Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0FD6190D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 07:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbiKDGUB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 02:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbiKDGT5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 02:19:57 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028302A277
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 23:19:55 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id b11so3690534pjp.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 23:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7fcvrE1BvqWs8Ve2suGBYVJ5y1iMJPXMU/J5Xu4wR0=;
        b=Fv8JFnY1fEVLZ45vHZSI+4x2pni6knHzssyuKD1fJYg7FyicuKTQpljdMAnL+UjJhA
         qF6mtl9lPv+xoB82RJf9AMF+U15ygFVUMMAgX+Xa0zV3oIv2CXzrQH0V1GC60Qq0TuEm
         tp0/WgeQTn1T87upTxz/Lrxcmrud2jNaNxKm3RzDzKZu8Yt/PLFuUIXwIeIxsVTqoUA1
         1DQFeenjqFDmwrOKCiBC4kfOzoAJnmbgPf3ICpepm8cBQvI2gTx/gPEVpkSybvmyrtua
         EOqu2ocOMo/7lOumid1SqUQf+etj5p+q5MxPpOjHhp5Imz5DQXn/ynRwEIuAD6sd8XVC
         tksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7fcvrE1BvqWs8Ve2suGBYVJ5y1iMJPXMU/J5Xu4wR0=;
        b=ZU+fWmxdJ/AM7PHxPb/XsvdTqbGoUHecT5U6B2YofnYbHDylb4FSBopcOHcJaD/iuN
         Ht6Wo5Y0fdbyJ0hchSVFqciVzOu1tudHi7cAL346Ckouvx9GxLn/iQ7fvGqN/C5bVsDm
         4CzLfoFkpAre3LwOCkWODVOUYelXHotgoOZ2zBwAUjyrQdOxjcDuxlFEmqYuzn36M21x
         LHL+NYWaOzqGWhN1G1HNJ/iioMfaaOhC6sVVsgxF6qmVnKJt0km5PLhTFYfsySao5bCM
         G+5sL/Rx6fXyJOCVozCe2EHf0foRYOYU7QJe3OvTHMaF8Rl8Q7xYlQ8cnmhDS47v9Djb
         Gr+g==
X-Gm-Message-State: ACrzQf0RAPnZJ/EqR+Gcvn3RZiHrugrCdAv/7s7a3p69d9+zFu9o+qwk
        6oyRNGooIYryUKlYs6OJue3znQ==
X-Google-Smtp-Source: AMsMyM7HUCTgSSSOEHRmkgeaTplAG3bW53OxKgNyCht+XOwqyLgeV07r9N3NgUxw/HLcWS037Pp3TQ==
X-Received: by 2002:a17:902:d48a:b0:187:2b1d:10e2 with SMTP id c10-20020a170902d48a00b001872b1d10e2mr21618516plg.86.1667542795483;
        Thu, 03 Nov 2022 23:19:55 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (2001-b400-e306-842b-9ec5-b6d1-6a82-aa11.emome-ip6.hinet.net. [2001:b400:e306:842b:9ec5:b6d1:6a82:aa11])
        by smtp.gmail.com with ESMTPSA id r18-20020aa79892000000b0056bf24f0837sm1764687pfl.166.2022.11.03.23.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 23:19:55 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v10 1/4] dt-bindings: arm: qcom: Separate LTE/WIFI SKU for sc7280-evoker
Date:   Fri,  4 Nov 2022 14:19:38 +0800
Message-Id: <20221104141515.v10.1.Ic800ee7b604bcb0519ca404600d7be2352725686@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104061941.2739938-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20221104061941.2739938-1-sheng-liang.pan@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

evoker will have WIFI/LTE SKU, separate it for each different setting.

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- fix typo in tittle and commit
- recover change for trackpad and touchscreen

 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 207e282602064..04928ca8cd556 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -592,6 +592,11 @@ properties:
           - const: google,evoker
           - const: qcom,sc7280
 
+      - description: Google Evoker with LTE (newest rev)
+        items:
+          - const: google,evoker-sku512
+          - const: qcom,sc7280
+
       - description: Google Herobrine (newest rev)
         items:
           - const: google,herobrine
-- 
2.34.1

