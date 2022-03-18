Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 622864DE133
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Mar 2022 19:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240196AbiCRSkb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Mar 2022 14:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238647AbiCRSka (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Mar 2022 14:40:30 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080E01C9454
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 11:39:11 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id w7so15441688lfd.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 11:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rbg2RlFA/4puyAOuKWmpEc0rQD4bbwwHtg4uOvJP+0I=;
        b=CLaL56CILexB1XmewhSYD+RMOauS6TXFrSrM09e8FX6dz3NqqKNQuLoBTJMloetORm
         bdsFhPuyeJBgQwXMcWioPB3uOCRhCKZb15XtU05+uB3I/TOXoWs0CISSxKayf95mroVa
         zaN5A7mGN1VgxSGahkm6Hmy6lrxAOme+8PJ/Bg44Gec/QYLJhyXIkqJWp/aoVAjJBRDd
         iaJvbVkvpG1j0vgmX6D8dbAeG9ARk291ldzH5/YvTUVsXIBVvVMPQIy0XqBLGXbG8oyA
         rlLhDlE7/MTvg8kEayMeztg9JDPF7plFAz3CxDj+7gO6QzrJx2fjQ+NM9TO8eirumasp
         aoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rbg2RlFA/4puyAOuKWmpEc0rQD4bbwwHtg4uOvJP+0I=;
        b=vuvKgkXvXDsod1zYBJFsI9FGTwnXvNnr0zDvVeZCOCNExI9nADQ8yspw8uhz3TqgSS
         87jXSdZfnUL4WlEM79KLAOiMcbcaWh5FEixvAvsKE+kfdX4bhOX5rBfPCOjpwI7Ev8mK
         AKL+OZOvZzphwX/EnrYZ0RvSwU5+DTtoo1RpbllwE1TeDC2iWSuqeL4Y2iCA8K+IGhxr
         NipZqAN2LS1W5+Xici6XpRWnOH3I+nsqf9udT/ugOFBvVh2Xtfpo8jg9jI8BshG6W7Ah
         NK/LfWf3EaawVUKUAwfC7e4u1jc6CjE+Tok4eq+6xgzR24lcoYPBLcwh28A5obZw5GJB
         ESfQ==
X-Gm-Message-State: AOAM532adcY3nhJLXfDVJgxoFr37a7BvOOjkGpJMxaD89dPbqJEO/ese
        cF1G7CCCWLIWXqmqhhErFX+ILm3E0P1zcw==
X-Google-Smtp-Source: ABdhPJy9l9NnPcxCTwrHttfVSh2VeMF/NE86kvBCodu5fsRVccCePBYOvZuaZPfCKvJyw5yFTLlEtQ==
X-Received: by 2002:a17:906:6a02:b0:6d7:cda:2cf7 with SMTP id qw2-20020a1709066a0200b006d70cda2cf7mr9874936ejc.53.1647628227733;
        Fri, 18 Mar 2022 11:30:27 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id y8-20020a50eb08000000b00418b114469csm4567551edp.52.2022.03.18.11.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 11:30:27 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: phy: qcom,qmp: Add SM6350 UFS PHY bindings
Date:   Fri, 18 Mar 2022 19:30:00 +0100
Message-Id: <20220318183004.858707-3-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318183004.858707-1-luca.weiss@fairphone.com>
References: <20220318183004.858707-1-luca.weiss@fairphone.com>
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

Document the compatible string for the UFS PHY found in SM6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index e20d9b087bb8..934aa9101ddd 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -39,6 +39,7 @@ properties:
       - qcom,sdm845-qmp-usb3-phy
       - qcom,sdm845-qmp-usb3-uni-phy
       - qcom,sm6115-qmp-ufs-phy
+      - qcom,sm6350-qmp-ufs-phy
       - qcom,sm8150-qmp-ufs-phy
       - qcom,sm8150-qmp-usb3-phy
       - qcom,sm8150-qmp-usb3-uni-phy
-- 
2.35.1

