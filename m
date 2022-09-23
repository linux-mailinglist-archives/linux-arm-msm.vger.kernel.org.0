Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC0455E7393
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 07:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiIWF65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 01:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiIWF64 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 01:58:56 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2CED12207B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 22:58:55 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id go6so11958234pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 22:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rwMiBvWSS/3nWfWiA9SzAK1R2kw10DliI9eL/5r27lE=;
        b=Sd8bjcCNxsBL5738H1v/jVDN6nn+TV/uZ36+gx02vOKcYnnKjYJgZtKFDaRV3QKPDb
         dbjiB+L6pEsvw2kXoMM8lbjmQWPOMAO1qX5VeTNHnFgnzmeMZbhlkTtNY+6ZEW4tKbLJ
         0EmvW3nTVx+rz2LwcmoN9YK+Po4pZiOPT/O8rpmyaIejvuZ4bT9RlGkVx0KxzTHPpxxV
         0NKE3DAzTLQwJjp+Y3u4AegaDEqBkcNnN3PaFLOYqCU7yI2d6wWTPJ1xQUChkKUwj7qs
         8Q6uGi+tIjT83RWW4EJi00S+GoRImtwS49vmMD1B/SxqERiIrJqxTwbKUx+CPebQtPmF
         bduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rwMiBvWSS/3nWfWiA9SzAK1R2kw10DliI9eL/5r27lE=;
        b=KiyQa+9QbBt8dFMhLrJtjSftt+2bKzzocmJ/0wrPOm9HbB6uT9CgpMEotdIGpDNpZ8
         +dE1AOY82SDcNINSNCOjRu82D04jJTnxXkEnTah11PshTBOTFQr4VkwXbQN6C8lFFoFy
         KbJP3zwrkKyHVK9UuyryWOH3WlhSt8JhzW1Kf7N2JrdhqSAzeT3Ys2aYGLyeMtmbQ2/+
         VO59EmlIz3IIod41lO0mtG6Ff4+zWka4TCFx3FlB+jn7W6Rn7nMjOjqHXoxKyUqcd7L6
         9J6tTFW1Bl07K0dzn3mq6ItxzX9vBj2CXGt+ntuvGI0/NOOOCyvTWIsAlvhJmwyUp11K
         4B1g==
X-Gm-Message-State: ACrzQf1Nqb8eWJa6T69RNxzPP7HKdVshIHTCXLmzULuQMWwX0Rt2t5hS
        7Qd8x4cOs/jZ50UGb0zqI7IWCQ==
X-Google-Smtp-Source: AMsMyM6tuR6y4a/Y5bPUPxWspG58kKyakm4lsVIgZPPXHbjbyWtwBF3iFyw113NWgKSGgQHjzp1eUQ==
X-Received: by 2002:a17:903:240b:b0:178:a475:6644 with SMTP id e11-20020a170903240b00b00178a4756644mr7087596plo.96.1663912735328;
        Thu, 22 Sep 2022 22:58:55 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id l10-20020a170903244a00b0017532e01e3fsm5075638pls.276.2022.09.22.22.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 22:58:54 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Separete LTE/WIFI SKU for sc7280-evoker
Date:   Fri, 23 Sep 2022 13:58:05 +0800
Message-Id: <20220923135629.1.Ide53082044aac56877c4ff5725777769e377476a@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923055806.2556746-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20220923055806.2556746-1-sheng-liang.pan@quanta.corp-partner.google.com>
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

