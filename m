Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C48125F2EC1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 12:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbiJCK2W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 06:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiJCK2T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 06:28:19 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE4B124BCD
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 03:28:18 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id e11-20020a17090a77cb00b00205edbfd646so14894255pjs.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 03:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=u2enmpPHba5zlJ2pqDaLIQSBog6hYUzqkszUkthSI4c=;
        b=HNjBjdseHCVKa53HiGDSCcV0QERfzmK3vTQUauwY08rmRbwuNA3WnIrMnCNV22Ae7o
         dNouIttHr6+u/y9OVuwHqknCZ2Lz50g6D3NZv6sbOxFs1/rpwKeeP0S/TEcmUXrbQvO8
         S9R7uxfacG57Jec0oNZOqq0r9/2Ct1Zh62cD2dRn2xYqj9IyR3jdjbudsY/ebLVQAE06
         BsI2r1OG7o89oAzoOV2DRP9/gC8TaAgOmoPgsYckUqcOQ7Ie+3ZwXwfEYLEd449Iv5yO
         tYKSd1W9YhwLsrsb2tJke1sc723swj8wI5dZqm0vs4MLskgaFIXhTA8X8ZbGiyICF7rK
         LkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=u2enmpPHba5zlJ2pqDaLIQSBog6hYUzqkszUkthSI4c=;
        b=o0fDA99qBpVqBXAuE0VqfD+kOFifgJqNiXu/UcCPTIzAEaNPCgasuHahBOXb2XDEy3
         DipPnCfZtfA2Nzdp1FjFkqeN/fnW015qgl5PsPmAcbFejCXqib/eppbGPgVjoPIrja0J
         330eP3ZJRgfs74frjfJPwHnr2yC5CBWYzUpn1Gfu89fHlwuHCrUNoeX72QaUPPxwW8+C
         MT6gzxAVLJsA4jrOMOedG14QQoGOXvOESzu8G0k8UtRBQblDKaRmrSz/L6bIvOO14V1N
         ceV/Ij7/xFga1tKnVc41yPJPANzhV4rwL4pP1jRrMU5DGy5RwKr0RQ2rrL44CjX+QGqk
         6b1Q==
X-Gm-Message-State: ACrzQf3hSPByW+jg8shenEsfcVcfj8MTgA4Q2m03OjcUnIGKToxO2IK4
        SmV/7X5sZIXhRwvm3o43ecWs2Q==
X-Google-Smtp-Source: AMsMyM6cp8atlbhrbU75cKS+MjSEabyCF3ZSZY1q2IhnLuYUTiny0qgeQUcDOPRuDRwOiLKRy79YKw==
X-Received: by 2002:a17:90b:33d1:b0:203:7b4b:ba1e with SMTP id lk17-20020a17090b33d100b002037b4bba1emr11436886pjb.128.1664792898216;
        Mon, 03 Oct 2022 03:28:18 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id y17-20020a170902b49100b00172951ddb12sm6860249plr.42.2022.10.03.03.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 03:28:17 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: arm: qcom: Separate LTE/WIFI SKU for sc7280-evoker
Date:   Mon,  3 Oct 2022 18:27:34 +0800
Message-Id: <20221003182637.v6.1.Ide53082044aac56877c4ff5725777769e377476a@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003102735.39028-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20221003102735.39028-1-sheng-liang.pan@quanta.corp-partner.google.com>
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

evoker will have WIFI/LTE SKU, separate it for each different setting.

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v5)

Changes in v5:
- new patch add touchpad and touchscreen for evoker
- remove unnecessary whitespace

Changes in v4:
- fix typo in tittle and commit
- remove change for trackpad and touchscreen

Changes in v3:
- none

Changes in v2:
- none

 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 8060c35d003b4..c15a729a6852e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -513,6 +513,11 @@ properties:
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

