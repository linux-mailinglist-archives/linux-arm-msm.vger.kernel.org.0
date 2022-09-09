Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 040285B38C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 15:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbiIINUR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 09:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiIINUR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 09:20:17 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF73658526
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 06:20:14 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id by6so1775626ljb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 06:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=RBsLYtteN8YU4lRGMzw9zqgxcOvhZwcGeFN7EX29dmw=;
        b=wjD10bS6c1+eAs2rS7Oi009sgk7M6D6qO3BmkJEeZOXe6yCa3P8KGXMVTg3CY1hWEZ
         o0ASTMt+T0dpZpDZi/pmdcICHLxac7fJkml1yjn55rfpABPxbE+r6AWjih+iLyIFr4mu
         YDbE//j+5K0nZBdRJ1mcckq68GqwYGE3zjbQyA+rw58f9R8vc/6j9F4aiybpBjXZNOMh
         gPqoXIQNA8wg7ooKLsE8pwRhzCjwd+KPbQRFgMIGFKdjxvDzE91JAnY8MFXh9fCVjsKL
         DRQXiAtJUhZ+fGSxTuLo21R7HKuhAKowVFbcvYV7tYe8kL/xQcaW2evu+L4G3BSeSIpd
         z+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RBsLYtteN8YU4lRGMzw9zqgxcOvhZwcGeFN7EX29dmw=;
        b=daCyzis3hwrgeghfHPPt+jPCCiYMQMATM1gC+VvOy1/RtdbVdem0V9x6uLAloZbfIi
         f4XCk2yTHXO+tP531o8m/Qcm7zvDrwcd+6c50N2b1MiAbYC3mhTrzuUgwKVs3JiWVwnU
         hdwps/df1iFV3uGuBdZIb9knRGxlOvQR3+7JSYkV8KxM2ND37IAYBWQq4NoPQ6UmQVKs
         HMxklKZ2CibNvpmwDU8v9GH2vehpkzZ/6iugDMrBbk3KCVXe3jYUFTeVuVy0gJ7ypfw6
         Z8fylFj9bBdR6G9lWLBHrH3I+nv/Lo+BBSzTkGre2oh1erEc2Y/xcW5WHIaUBs2O4HVA
         62GQ==
X-Gm-Message-State: ACgBeo0SpEBwEu05+5CXniZk3x8evyH4+ptk3+OKj0dx8kTUBlbwn6nU
        2IWTJXSuvuwtbKHM3Bn6VJ30rQ==
X-Google-Smtp-Source: AA6agR4jApsSfxkznGesCO5yTuFeo+/mhq+cWUwayQBJ/EfN63EAwZdoGuXFfoDy9tZQIaC4RTteRQ==
X-Received: by 2002:a2e:a911:0:b0:26a:ca0c:68c6 with SMTP id j17-20020a2ea911000000b0026aca0c68c6mr4122331ljq.396.1662729613173;
        Fri, 09 Sep 2022 06:20:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10-20020a056512348a00b00498ff4ae746sm71729lfr.294.2022.09.09.06.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 06:20:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 2/6] dt-bindings: phy: qcom,hdmi-phy-other: mark it as clock provider
Date:   Fri,  9 Sep 2022 16:20:06 +0300
Message-Id: <20220909132010.3814817-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
References: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Eventually all HDMI PHYs are going to provide the HDMI PLL clock to the
MMCC. Add #clock-cells property required to provide the HDMI PLL clock to
other devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/phy/qcom,hdmi-phy-other.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
index 2c21e120ff8d..0c8f03b78608 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
@@ -43,6 +43,9 @@ properties:
   vddio-supply:
     description: phandle to VDD I/O supply regulator
 
+  '#clock-cells':
+    const: 0
+
   '#phy-cells':
     const: 0
 
@@ -113,6 +116,7 @@ examples:
                   "hdmi_pll";
       reg = <0x4a00400 0x60>,
             <0x4a00500 0x100>;
+      #clock-cells = <0>;
       #phy-cells = <0>;
       power-domains = <&mmcc 1>;
       clock-names = "slave_iface", "pxo";
-- 
2.35.1

