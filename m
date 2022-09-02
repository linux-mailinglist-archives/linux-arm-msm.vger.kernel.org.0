Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A97FB5AA901
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 09:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235371AbiIBHnC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 03:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235432AbiIBHm7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 03:42:59 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 024DCBAD8F
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 00:42:58 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id s206so1286350pgs.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 00:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5sF7F1cYmydcaLvnoRnoDfV+9V05QJMlsu+o2biJ3Ik=;
        b=7+dx4KKhOBQoVBh+v8ezLG0jR7SZxOqPY2gkn0us8sEySuVhHCIk0jH1D5Smdv9rW0
         oVkatCp51Di8T/KE2SpRG0ag8RNT4Zoi3gZyyLvTeM1edCc5nBgWnaZpUgjNa4cx7Qwf
         mPJwO8BZ8jXe6faD55PbE505Z87dw40FdAUqClC90PlfB7O67U5Hzp5u5vEXcXvcsKDb
         p4/GG+FgNrqmtfVk8jBobvcmUoVsp3HFAVNlm8qbMAjED5pGbWjZQQf7XNJPHgeY8Ytf
         j3WEbzfTP5K3oYhrBWg1VHsRUiTg5+5eRYViX8ip+/L1APNJq8b0lzbVCDQPIzJAcVs5
         x0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5sF7F1cYmydcaLvnoRnoDfV+9V05QJMlsu+o2biJ3Ik=;
        b=nSIF866BAd4j/My80juD/q2zJwltEdJ0jH84YhNKX3dIRFi9vBEoEkxSqYduKDmzmb
         sP4ZcMaaNVrh6WaEBwN50eFXfVIZCS/fCRi55T17ZAUNOQqB6PUTW/FeZjAmdKUu6hqV
         44IgFoHb/+k3T1CkiE8MflaNudz5hZjDP3SU+iHQ+2IY4Ae55AYMq5kKGhKigprpvgoD
         YsrpMXA1itUKz7q8lMOjIzGaeHKOETCCU8fNhbfo3kSjDzpOGycKGh+5yzR+AuQENmw4
         Qme+2vyHcJbiubewU48BwpTZsYhadsvrC2i5U8drUskZbn02tFn1FDZeXxhw2gB7Savt
         dJCQ==
X-Gm-Message-State: ACgBeo2MwPSgnGpzK1aVH9pSFLpd+SMAiCa5+cg8K0CfdO+Kmep+46Nz
        84NBikT0bSmcXNxoh77MfXpqlQ==
X-Google-Smtp-Source: AA6agR4uCjBk9ALADnx7LRBCPpfM6s+szcF5fuTQY1bAwaw56gD71EyFnnq2y/chFCDG7ofRvdr1uQ==
X-Received: by 2002:a65:5941:0:b0:41d:a203:c043 with SMTP id g1-20020a655941000000b0041da203c043mr28974719pgu.483.1662104577677;
        Fri, 02 Sep 2022 00:42:57 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id f21-20020aa79695000000b005363abb6d0bsm975099pfk.15.2022.09.02.00.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 00:42:57 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org, mka@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: qcom: document sc7280 and evoker board
Date:   Fri,  2 Sep 2022 15:42:39 +0800
Message-Id: <20220902153441.1.Ief93544cd0cbfa412092f5de92de10d59a2a5b3a@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902074240.117075-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20220902074240.117075-1-sheng-liang.pan@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds Chromebook Evoker to the yaml.

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
---

Changes in v4:
- Got the version number correct

Changes in v2:
- Bindings patch added

 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index fb1d00bcc847c..d4b2d947859d4 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -565,6 +565,11 @@ properties:
           - const: google,piglin
           - const: qcom,sc7280
 
+      - description: Google Evoker (newest rev)
+        items:
+          - const: google,evoker
+          - const: qcom,sc7280
+
       - description: Google Herobrine (newest rev)
         items:
           - const: google,herobrine
-- 
2.34.1

