Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76F345E73D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 08:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbiIWGSU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 02:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbiIWGST (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 02:18:19 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AA7125788
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 23:18:13 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id t190so11326759pgd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 23:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6LISBIDdkba8cC0ObecTgFg+L7fcVvb0UrTNpp9OCVE=;
        b=B4I25TOByH5xX20BLqfe9apNY+RWgv4QbVSAd0A4MfWuqP7yazo06Ep5LCVnwY6pJ0
         Z6+hfSpZJikSf2SRcP/uguhTJtIbhJ/5XGGu9ISvIxYevuFx2JyZvOcCakMpco4JeB8j
         qROxOC5uTqSAkNBU/3+e5/GaRy4DU7tYAvsyeOPylOZivIIVhrE5J601n6eYUeVYEldn
         +7Btw4jqrRNJmXLpWnurTVY9JoFrB9ro4S4Zt7HsouIXnVvZ7TlVGY2XR/wWpBqoECSE
         +4Ldu1rJdPLnYa4vj6zyW9kedT0zCGYooLBfpi5EphadMtT9fPuBwlo2+TlR8IxseAR4
         SXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6LISBIDdkba8cC0ObecTgFg+L7fcVvb0UrTNpp9OCVE=;
        b=Jmglne63mK4oUTM9gFdNf8hF5BoaLSGEinmJTnEspi3RP3usxsFxxhhFgcGw/ytdsW
         jRzZ5o1ks368/oewe00cbPN6HyiNWadvfvq7BehmfFVmH2rVtjEnbUmwUD8m0FLgDnOw
         tf+FwMqhQNqZ7oIAa/L5Db7ocNd8sLkJK1UJZLgpx1G1UHzr2QMtZMd5DX+g5Stp+WkN
         iE/6S9x+IoZEh4XVj7ET9M0AO8jHezKliVpIwLGCO4A9JYDGh8ECqiQ+yxOlL2sTBr51
         dDaqquZToaEBpeO7GVY4F8dXny/dqtMHmfhRG5elltb8CufJAI1CG+qz1q1RDhYfSdJf
         Rdhw==
X-Gm-Message-State: ACrzQf2RFltFW3Wcj2a+UsE1gnNZZBEciDNpGhm233wKJf7NFGoJ44EE
        IWafkBx813DXkZCWoq7Qg9vICA==
X-Google-Smtp-Source: AMsMyM6MxeoMKEbwPb0PLP3DZuHU5RUkYGpBfRpRtoQOf4WB3dy950odEmT8iGLacztXnK3PAA4nUA==
X-Received: by 2002:a05:6a00:1596:b0:540:f547:8509 with SMTP id u22-20020a056a00159600b00540f5478509mr7551104pfk.80.1663913892911;
        Thu, 22 Sep 2022 23:18:12 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id c190-20020a624ec7000000b00540f3ac5fb8sm5515248pfb.69.2022.09.22.23.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 23:18:12 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Separete LTE/WIFI SKU for sc7280-evoker
Date:   Fri, 23 Sep 2022 14:17:55 +0800
Message-Id: <20220923141624.v2.1.Ide53082044aac56877c4ff5725777769e377476a@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923061756.2557403-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20220923061756.2557403-1-sheng-liang.pan@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

evoker will have WIFI/LTE SKU, separete it for each different setting.

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
---

Changes in v2:
- change Cover-letter tittle

 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b6257683a700c..065d9cc4421e0 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -575,6 +575,11 @@ properties:
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

