Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 152F661EF5D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 10:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbiKGJoC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 04:44:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbiKGJn7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 04:43:59 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB1A17059
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 01:43:57 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so9780405pjk.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 01:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7fcvrE1BvqWs8Ve2suGBYVJ5y1iMJPXMU/J5Xu4wR0=;
        b=hcAg6rZ1N2StOt9XFWt6ZKuXVDzbG7N7MgckEsRRewASfrf7NlwJVgFJw7FDEGqti9
         yjE+AuXkEwvEjiXiDesviQqPYsnKa8+D7fFqL+jmSH3V6UipfII43wlQ1B7vVyIcZqSm
         IfLS/7uvKZm18ZkRHaigGtKnBppcjzUWz9vc8gKPrbghl98Dhyunuq4RchHbWqVpn9Xx
         Vu+Kxg/9v9wY32Wj+KTm3nIzAe0jHnFONO3LKWH/MsYEfUa4o3ftiYF6xFqlmR3Ih81s
         RhDWGfnoVIiL+rsrdlk9XYeeX7aDSka0j2/XV7ESUtaY47BMdCAxmUvlRYDnxj94at8R
         y7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7fcvrE1BvqWs8Ve2suGBYVJ5y1iMJPXMU/J5Xu4wR0=;
        b=xIulSLOpm8J/NQXvZayiZFQJowDAXd/Id9J5+MyhPUni0hoTvYK88mGrjXxbj13pT/
         PfvaDraIyoQT6ZeKc1wbxgzJGI8gIb0+PFEbGp+TVEyn4Nb5HVFA9pmOuJ8lyXnse/da
         VsmFjMn1sgeZ8AL6BJvX8pM5ifQlcJXqS/5gGd/1dfz5u/+c3vG1BqJ1ip69hweL0ZgX
         NihDmH/4jXyLH3SPU/APFl7BOoJolAYYTq6w48+z+9AfKQhRqIz40ISJBW40n/nIyb4L
         tu+2PXyQ5FFZZ1LIinHif1BOUewVIE50NkwjY1MasgvxMorFU43ggvcT+COk94/dI39s
         LssA==
X-Gm-Message-State: ACrzQf0GGrK1OjjlmRsQyP7rJ+psiSp6UpNItoX+vQ9dMcWtGiR6syE8
        sKwDM4naQWd8a+WwKWv4c8VxgA==
X-Google-Smtp-Source: AMsMyM4g0/bpkt7E1iAihW6xJF8JYX2JX12lpYCHLxCgpP2bAnxf3/v9lqDOzSisvQeZCgvzbUjz0Q==
X-Received: by 2002:a17:902:c943:b0:187:1572:282b with SMTP id i3-20020a170902c94300b001871572282bmr45338037pla.126.1667814237231;
        Mon, 07 Nov 2022 01:43:57 -0800 (PST)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id i2-20020a170902c94200b00186dcc37e17sm4564936pla.210.2022.11.07.01.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 01:43:56 -0800 (PST)
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
Subject: [PATCH v11 1/5] dt-bindings: arm: qcom: Separate LTE/WIFI SKU for sc7280-evoker
Date:   Mon,  7 Nov 2022 17:43:41 +0800
Message-Id: <20221107173954.v11.1.Ic800ee7b604bcb0519ca404600d7be2352725686@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107094345.2838931-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20221107094345.2838931-1-sheng-liang.pan@quanta.corp-partner.google.com>
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

