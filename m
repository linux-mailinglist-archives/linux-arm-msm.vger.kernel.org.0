Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9DEA631AB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 08:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiKUHyg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 02:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbiKUHyU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 02:54:20 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366616C705
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Nov 2022 23:54:06 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ft34so26463332ejc.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Nov 2022 23:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GT9ErDbClBtlo66hqT2klzySCTqQIgR/TIVfNl1Gg+Y=;
        b=O8QBYlAGTTApUL6TLXRC+RdaXgjr6tjZq/PDzzK6ry8Y4u+YJOmeMB5Bn7NTt1qSBi
         Fukr5kVtdZ4oP8jT3o5Y4ig2M23vgoSWxqsEKX17jKqWA1nakj+jDvHCYj3zVMtgXt4L
         6w3BeLQUjC/HSQg6TnRYqaWM1WO8NI8d0YViYJ+vy0UvKzyKtMySsWpp99tt08PwS7Vh
         0/xED8W60TuQkxU12/G2BNND3IPn28OjtYxeXPDUHtbs4zYNN81rhzun5rLMy8kSU1GK
         QygY7zjiZdOTBVHWAttgYDOf2YlF1/SdqxTmuvWrr2LRwf4fhLC8LAIsuE8j8fh1D7Fu
         RzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GT9ErDbClBtlo66hqT2klzySCTqQIgR/TIVfNl1Gg+Y=;
        b=sDsymlz8JngrQc6aK8UImllhp6vJDJQ5rsGbKVZDJSJRq8+e7mqAFL/cv6hXFGE4F6
         jBIXT4pj85n/notZJ9bi1EabWduXZc8QepqIKJmV4GQGJqv6fgb4h8/uZPrBI+uPGifv
         FdVSo/xYeQcGUvB48EzSxr+GcgWbvbtU3SeIUVedCW9OU9RjD2OHoJvDk3jmRdkqWgTa
         JiGjo0Y7LEl+IpD5D9Mo6pJvSrroh1ydfKMhcAIPjEYvckGXd8T35o+4z/haDyRrEIsq
         l0V193DoDYeaOynFAJSZm9jeCfmYm0MwsiJb8RuICCIu5/HipmOsRWxYy+8mzbserQbr
         jIdg==
X-Gm-Message-State: ANoB5pm6Cm6i/BRMSUHeAtqVOyM4EVJGIiz04umHwWDqlbc4M8w4bhN6
        erbVCgyJlwc3BMJlCkRqm0J8X1S8925SQA==
X-Google-Smtp-Source: AA0mqf62uSlXNxPTJw3z57ahsIMBOuTXwZwsI5C/DqMRrKONDTY65VHgWF2pcKCOJRSKeBBt/r1gHA==
X-Received: by 2002:a17:906:2804:b0:78d:e7c0:a2b with SMTP id r4-20020a170906280400b0078de7c00a2bmr14766006ejc.273.1669017244575;
        Sun, 20 Nov 2022 23:54:04 -0800 (PST)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id o11-20020a170906860b00b007ad4a555499sm4700805ejx.204.2022.11.20.23.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 23:54:04 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: phy: qcom,qmp-usb3-dp: Add sm6350 compatible
Date:   Mon, 21 Nov 2022 08:53:55 +0100
Message-Id: <20221121075358.76582-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.38.1
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

Add the compatible describing the combo phy found on SM6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
index 97a7ecafbf85..68aecb638870 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
@@ -18,6 +18,7 @@ properties:
       - qcom,sc8180x-qmp-usb3-dp-phy
       - qcom,sc8280xp-qmp-usb43dp-phy
       - qcom,sdm845-qmp-usb3-dp-phy
+      - qcom,sm6350-qmp-usb3-dp-phy
       - qcom,sm8250-qmp-usb3-dp-phy
   reg:
     items:
-- 
2.38.1

