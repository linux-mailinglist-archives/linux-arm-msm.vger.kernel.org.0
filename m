Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E69E64E279D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Mar 2022 14:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347913AbiCUNf2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 09:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347909AbiCUNfT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 09:35:19 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DAEC3C49F
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 06:33:53 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id bg10so29863610ejb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QYswGrrTgSo3+1KADXNq6x4Caey9tW5d+t+C0rCwA0c=;
        b=T02RJPNyA5Bdaoq3qoK/0CUOzcxIWP4YhzQOGVdPiyUBOy7unFT0IavfyeEO5LhuQc
         lfQ6JDW3x9IObY++Os8peqM3Bd6UVhLRE8sNpCL3JpfPCquGmsenEkaQR4JoA5Ry5oiP
         /1vBDeO/iYTtjOJk6O1Kn+gDiigq3+SEEqqR6FL7FojQ2T8RXM2iCWhourroosrwIhZV
         a3GI6nvgxE6OFEp6qzK9k7WgWM6H/Mg/nbuoQLj0qfwYoQDajZTtvEuRC+P5l64yNo08
         U3afja1MCPa/6YmV/cdUWn945rw9MkTnDim04cPsElfKIkYSXC6x4OmDcVWmSnr+Laej
         TcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QYswGrrTgSo3+1KADXNq6x4Caey9tW5d+t+C0rCwA0c=;
        b=pqjx7kl/aTpLWPwLkTyI4QyaXxdi2AuGNPpeCKAqvSgqCmEFGSruR/bp3w14QLLoQp
         f3m5Noj/Vw79MCgsOOPuAqY7VZeayxKbAl8GKRzXzgNx1NfxcqMIqWe6ADbXWh/Q3vA5
         CeBVKrqk1JgetiWoVc72sQnFbpGFhdHnkIqTLe4qlN2v3LcG7ebATEnFxGOOGwTFoHxa
         g8J3eEvjfjhpXyrUveTFfhdI5sCVhm4WKvbl22T/y8/A8t3Sv8ITdBD5qU4X9OqbMvP6
         EMGr3sU4u2tGllR6KeKyzYLmVvMpY5gfsOyFP+4o53ohmSg47zkCWPjVQ3GmRdLciNiR
         pyRQ==
X-Gm-Message-State: AOAM531r5UbVDICDF5ME5/LKB04PkCiuNo/v1SRyx3voX26zwxUB41qI
        39RYEcyTL746ZGOMOkHQDxH2KB2M15l1yA==
X-Google-Smtp-Source: ABdhPJweYbxlQCN9iSjUXv8HfDwYXIoMzACCIs2xzvq4T0PhwdlYO7uYikzbfQoknng1c8/sAj/awQ==
X-Received: by 2002:a17:906:94d1:b0:6df:8ac3:3eba with SMTP id d17-20020a17090694d100b006df8ac33ebamr21262409ejy.547.1647869631543;
        Mon, 21 Mar 2022 06:33:51 -0700 (PDT)
Received: from otso.arnhem.chello.nl (a246182.upc-a.chello.nl. [62.163.246.182])
        by smtp.gmail.com with ESMTPSA id r22-20020a17090638d600b006d584aaa9c9sm6862154ejd.133.2022.03.21.06.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 06:33:51 -0700 (PDT)
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
Subject: [PATCH v2 2/6] dt-bindings: phy: qcom,qmp: Add SM6350 UFS PHY bindings
Date:   Mon, 21 Mar 2022 14:33:14 +0100
Message-Id: <20220321133318.99406-3-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321133318.99406-1-luca.weiss@fairphone.com>
References: <20220321133318.99406-1-luca.weiss@fairphone.com>
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
Changes in v2:
- add second hunk for clock validation

 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index e20d9b087bb8..5d7417c34c87 100644
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
@@ -279,6 +280,7 @@ allOf:
             enum:
               - qcom,msm8998-qmp-ufs-phy
               - qcom,sdm845-qmp-ufs-phy
+              - qcom,sm6350-qmp-ufs-phy
               - qcom,sm8150-qmp-ufs-phy
               - qcom,sm8250-qmp-ufs-phy
               - qcom,sc8180x-qmp-ufs-phy
-- 
2.35.1

